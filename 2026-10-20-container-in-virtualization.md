# Introduction to Container Technology

Container technology is one of the most important technologies in modern software development, Linux administration, and cloud computing.

Since you're learning Linux system administration and Java backend development, I recommend understanding containers from three perspectives:

1. **The underlying principle:** How can multiple applications run in isolated environments while sharing one operating system?
2. **The technology:** How do Linux namespaces, cgroups, container images, and container runtimes work?
3. **The practical application:** How can you use Docker to develop, package, and deploy a Java Spring Boot application?

Let's build the understanding from the fundamentals.

## 1. What is container technology?

A **container is an isolated environment for running an application and its processes**. Container technology allows applications to run with controlled access to system resources while sharing the host operating system's kernel.

Imagine you have a Linux server running three applications:

- Application A: a Java Spring Boot backend
- Application B: a Python web scraper
- Application C: an Nginx web server

Without containers, these applications might share the same operating system environment, making their dependencies and configurations harder to manage independently.

With containers, each application can run in its own isolated environment.

Conceptually, the architecture looks like this:

```text
             Physical Server
                    |
             Linux Operating System
                    |
              Linux Kernel
                    |
        +-----------+-----------+
        |           |           |
    Container A Container B Container C
        |           |           |
      Java        Python       Nginx
     Backend      Program      Server
        |           |           |
        +-----------+-----------+
             Shared Kernel
```

Each container has its own processes, filesystem view, network configuration, and other isolated resources, depending on how it is configured.

However, **containers do not normally contain independent operating system kernels**. They share the kernel of their host environment.

This is the fundamental difference between containers and traditional virtual machines.

### Why is this useful?

Suppose your Java application requires Java 21, while another application requires a different Java version.

You could install both versions directly on one server and carefully manage their configurations.

Alternatively, you could run each application in a separate container with its own Java runtime.

This makes dependencies easier to manage and helps reduce conflicts between applications.

One important qualification: a container does not automatically include everything an application needs. You must package or otherwise provide the required runtime, libraries, configuration, and other dependencies.

---

## 2. Containers vs. virtual machines

To understand containers properly, you should compare them with the virtualization technology we discussed previously.

### Traditional virtual machines

```text
Physical Hardware
        |
    Hypervisor
        |
  +-----+------+
  |            |
  VM 1         VM 2
  |            |
Guest OS 1    Guest OS 2
  |            |
Application   Application
```

Each VM runs its own guest operating system and kernel.

For example, one physical computer could run a Windows VM and a Linux VM simultaneously.

### Containers

```text
Physical Hardware
        |
   Host Operating System
        |
      Kernel
        |
   Container Runtime
        |
  +-----+------+
  |            |
Container 1   Container 2
  |            |
Application   Application
```

Containers use operating-system-level isolation rather than creating a separate guest kernel for each application.

| Feature | Virtual machines | Containers |
|---|---|---|
| Kernel | Each VM has its own guest kernel | Containers generally share the host kernel |
| Operating system | Full guest OS | Isolated application environment |
| Startup | Usually slower | Usually faster |
| Resource overhead | Usually higher | Usually lower |
| Isolation mechanism | Virtual hardware and hypervisor | Kernel-level isolation and controls |
| Portability | VM images can be moved between compatible hypervisors | Container images can be moved between compatible container environments |
| Common uses | Running different OSs, server consolidation | Application deployment, testing, microservices |

These are general tendencies, not absolute rules. Performance and security depend on the workload, configuration, and implementation.

**A useful mental model:**

- A VM virtualizes a computer.
- A container isolates an application environment.

One physical server can run several VMs, and each VM can run multiple containers. This combination is common in production infrastructure.

## 3. How do containers work internally?

This is the most interesting part from a computer science perspective.

A common misconception is that Docker creates a miniature computer for every container. On Linux, Docker primarily uses existing operating-system kernel features to isolate processes and control their resources. [Docker Docs](https://docs.docker.com/engine/security/?utm_source=chatgpt.com)

Three important mechanisms are:

1. Linux namespaces
2. Linux control groups (cgroups)
3. Filesystem isolation

Let's examine each one.

### 3.1 Namespaces: isolation

A namespace makes a system resource appear isolated to a group of processes.

For example, a process inside a container might see its own process tree, hostname, and network interfaces rather than the host's complete environment.

Linux provides several types of namespaces.

| Namespace | Purpose | Example |
|---|---|---|
| PID | Process isolation | A container has its own process ID view |
| NET | Network isolation | A container has its own network interfaces |
| MNT | Mount isolation | A container has its own filesystem mount view |
| UTS | Hostname isolation | A container can have its own hostname |
| IPC | Interprocess communication isolation | Isolates certain IPC resources |
| USER | User and group ID isolation | Maps container identities to different host identities |

These namespaces are among the fundamental building blocks of Linux containers. [Docker Docs](https://docs.docker.com/engine/security/?utm_source=chatgpt.com)

For example, suppose you run:

```bash
docker run -it --name my-container debian:stable-slim bash
```

Inside the container, execute:

```bash
hostname
ps aux
```

You will see the container's hostname and its isolated process view.

On the host, run:

```bash
docker ps
```

You can see the container as a managed Docker object.

**The important principle:** Both environments ultimately use the same Linux kernel, but namespaces provide different views of selected system resources.

### 3.2 Cgroups: resource control

Isolation alone is not enough.

Suppose you run three containers on a server. One application develops a memory leak and consumes nearly all available RAM.

Without appropriate resource controls, that application could destabilize the entire server.

Linux provides **control groups, or cgroups**, to account for and limit resource consumption.

They can be used to control or monitor resources such as:

- CPU time
- Memory
- Disk I/O
- Certain other system resources

Docker allows you to configure resource limits when creating containers. [Docker Docs](https://docs.docker.com/engine/security/?utm_source=chatgpt.com)

For example:

```bash
docker run -d \
  --name limited-app \
  --memory=256m \
  --cpus=0.5 \
  nginx
```

This configures the container with:

- A memory limit of 256 MiB
- A CPU quota equivalent to approximately half of one CPU's capacity over time

The CPU setting does not mean the container is permanently assigned a particular physical CPU core.

On Linux, you can inspect the cgroup version with:

```bash
stat -fc %T /sys/fs/cgroup/
```

On many modern Linux systems, the result is:

```text
cgroup2fs
```

This indicates that the system is using the unified cgroup v2 hierarchy.

### 3.3 Filesystem isolation

A container also needs its own view of files.

For example, a container might see:

```text
/
├── bin/
├── etc/
├── home/
├── lib/
├── proc/
├── tmp/
└── usr/
```

This looks like an ordinary Linux filesystem.

However, the files are generally provided through the container image's filesystem layers, together with any writable container layer and configured mounts.

The container does not necessarily have its own physical disk or a complete copy of every file on the host.

Docker images use layered filesystems. Containers created from the same image can share its read-only layers, reducing duplicated storage. [Docker Docs](https://docs.docker.com/get-started/docker-overview?utm_source=chatgpt.com)

For example, two Debian-based containers may share common image layers while maintaining their own writable changes.

One consequence is important: **the writable filesystem layer of a container is not intended to be permanent data storage.**

If you remove a container, data stored only in its writable layer is removed with it. Data stored in an appropriately configured volume can survive container replacement.

We'll examine this distinction shortly.

---

## 4. Container technology is not the same thing as Docker

This is another important concept.

**Containers are a technology; Docker is a platform that makes containers easier to build, distribute, and run.**

Other technologies also implement container workflows.

| Technology | Main purpose |
|---|---|
| Docker | Build, distribute, and run application containers |
| containerd | Manage container lifecycles and related operations |
| runc | Create and run containers using low-level operating-system facilities |
| Podman | Build and manage containers, including rootless workflows |
| LXC | Manage Linux system containers |
| Kubernetes | Orchestrate containerized applications across a cluster |

These technologies are related, but they are not interchangeable.

For example, Docker Engine commonly uses containerd and an OCI-compatible runtime such as runc as part of its container execution stack.

Kubernetes, meanwhile, coordinates workloads across machines. It is not itself a replacement for the Linux kernel's container mechanisms.

For your learning, I recommend starting with Docker before studying the more complex container ecosystem.

---

## 5. Docker's architecture

Docker provides a convenient interface for managing container images and running containers.

Its architecture includes several important components.

```text
             You
              |
        Docker CLI
              |
          Docker API
              |
        Docker Daemon
          (dockerd)
              |
         containerd
              |
        OCI Runtime
          (runc)
              |
        Linux Kernel
              |
       Running Processes
```

This is a simplified representation of a common Docker Engine execution path; exact implementation details can vary by version and configuration.

Docker also works with registries, which store and distribute images.

The official Docker documentation describes its client-server architecture and the roles of the Docker client, daemon, images, and containers. [Docker Docs](https://docs.docker.com/get-started/docker-overview?utm_source=chatgpt.com)

Let's understand the three components you will encounter most frequently.

### 5.1 Docker image

An image is a template used to create containers.

For example:

```bash
docker pull nginx
```

This downloads an Nginx image from a configured registry.

You can inspect your local images with:

```bash
docker images
```

An image is generally composed of read-only layers and metadata describing how to run the application.

### 5.2 Docker container

A container is a runnable instance of an image.

Run Nginx with:

```bash
docker run -d --name my-nginx -p 8080:80 nginx
```

This command:

- Creates a container named `my-nginx`.
- Starts the Nginx process.
- Runs it in the background.
- Maps host port 8080 to container port 80.

You can then visit:

```text
http://localhost:8080
```

If Nginx starts successfully, you should see its default web page.

Check the container:

```bash
docker ps
```

View its logs:

```bash
docker logs my-nginx
```

Stop it:

```bash
docker stop my-nginx
```

Remove it:

```bash
docker rm my-nginx
```

Removing the container does not automatically remove the image.

### 5.3 Docker registry

A registry stores and distributes container images.

For example, Docker Hub is a public image registry.

The workflow is typically:

```text
Build an image
      |
      v
Push image to a registry
      |
      v
Pull image onto a server
      |
      v
Create and run a container
```

This separates application packaging from application execution.

You can build an image on your development computer and deploy that same image to another compatible environment.

One practical note for your Linux server: if your network has difficulty reaching Docker Hub, you may need an accessible registry mirror or another supported image distribution route. The container concept itself does not depend on Docker Hub.

---

## 6. Images, containers, and Dockerfiles

These three concepts are central to Docker.

Think of them this way:

- **Dockerfile:** Instructions for building an image.
- **Image:** The packaged application environment.
- **Container:** A running instance created from an image.

For example, imagine you want to package a Java application.

Your project might contain:

```text
student-management/
├── src/
├── pom.xml
├── target/
│   └── student-management.jar
└── Dockerfile
```

A simple Dockerfile could look like this:

```dockerfile
FROM eclipse-temurin:21-jre

WORKDIR /app

COPY target/student-management.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
```

This example assumes you have already built the JAR using Maven and that the application listens on port 8080.

Build the image:

```bash
docker build -t student-management:1.0 .
```

Run the container:

```bash
docker run -d \
  --name student-management \
  -p 8080:8080 \
  student-management:1.0
```

You now have a containerized Java application.

The host port and application port must match your actual configuration. The `EXPOSE` instruction documents a port; it does not publish that port by itself.

For a production application, you should also consider a suitable base-image version, non-root execution, configuration management, health checks, and security updates.

---

## 7. Why are containers so important for backend development?

Let's connect container technology to your Java backend learning.

Suppose you develop a Spring Boot application that needs:

- Java 21
- PostgreSQL
- Redis
- Nginx

Without containers, you might install and configure all these services directly on your Linux system.

That works, but it can make the development environment difficult to reproduce.

With containers, you could organize the application like this:

```text
              Linux Server
                   |
             Docker Engine
                   |
       +-----------+-----------+
       |           |           |
   Container 1 Container 2 Container 3
       |           |           |
   Spring Boot  PostgreSQL    Redis
       |
   Container 4
       |
      Nginx
```

In a real deployment, Nginx might be configured as a reverse proxy in front of Spring Boot. The exact network arrangement depends on your architecture.

The key benefit is that each service can be managed independently.

For example, you can:

- Replace the Java application's container without rebuilding PostgreSQL.
- Upgrade PostgreSQL independently.
- Configure different network connections for different services.
- Reproduce the development environment on another machine.
- Deploy the same application image in different environments with different configuration values.

This is especially useful when you begin learning microservices, CI/CD, and cloud deployment.

---

## 8. Docker volumes: keeping data persistent

Earlier, we discussed how a container's writable filesystem layer is not intended to store permanent application data.

Consider a PostgreSQL container.

If the database stores all its data only in the container's writable layer, removing that container also removes that layer.

A **Docker volume** provides persistent storage that exists independently of a container's lifecycle.

For example:

```bash
docker volume create postgres-data
```

Then run PostgreSQL with that volume mounted at its data directory:

```bash
docker run -d \
  --name my-postgres \
  -e POSTGRES_PASSWORD=change-this-password \
  -v postgres-data:/var/lib/postgresql/data \
  postgres
```

This is a learning example, not a complete production configuration. In real environments, protect credentials and configure backups and access controls.

The important relationship is:

```text
PostgreSQL Container
        |
        v
   Docker Volume
        |
        v
Persistent Database Files
```

If you remove and recreate the container while reusing the same volume, the database files can remain available.

However, a volume is not a backup. Accidental deletion, storage failure, corruption, or other problems can still destroy data.

For databases, learn persistent volumes and backup procedures together.

---

## 9. Docker Compose: managing multiple containers

Once your application has several services, running every container manually becomes inconvenient.

Docker Compose lets you define an application stack in a YAML file.

For example, a Java backend project might contain:

```text
student-management/
├── Dockerfile
├── compose.yaml
├── pom.xml
└── src/
```

A simplified `compose.yaml` could be:

```yaml
services:
  app:
    build: .
    ports:
      - "8080:8080"
    depends_on:
      - db

  db:
    image: postgres
    environment:
      POSTGRES_DB: students
      POSTGRES_USER: student_user
      POSTGRES_PASSWORD: change-this-password
    volumes:
      - postgres-data:/var/lib/postgresql/data

volumes:
  postgres-data:
```

This demonstrates the basic structure, but it is not ready for production: the image versions are unpinned, the password is illustrative, and the application needs appropriate database connection settings and readiness handling.

Once the application and database are configured correctly, you can start the stack with:

```bash
docker compose up -d
```

Inspect the services:

```bash
docker compose ps
```

View logs:

```bash
docker compose logs
```

Stop the services:

```bash
docker compose down
```

The named volume normally remains after `docker compose down`. By contrast, `docker compose down -v` removes the Compose-managed volumes as well, which can delete your database data.

Compose is an excellent next step after learning individual Docker containers.

---

## 10. Container security: what you should understand

Containers provide isolation, but **a container is not automatically a strong security boundary**.

Because ordinary Linux containers share the host kernel, a kernel vulnerability can potentially affect multiple containers or the host itself.

You should learn these basic practices:

1. Run applications as non-root users where practical.
2. Use trusted images and keep them updated.
3. Avoid granting unnecessary Linux capabilities.
4. Avoid privileged containers unless you have a specific, justified need.
5. Set CPU and memory limits when appropriate.
6. Protect credentials instead of hardcoding production secrets in images.
7. Restrict network access and published ports.
8. Maintain backups for persistent data.

Docker's security documentation discusses namespaces, cgroups, user namespaces, and additional Linux security mechanisms such as AppArmor and SELinux. [Docker Docs](https://docs.docker.com/engine/security/?utm_source=chatgpt.com)

These practices become increasingly important when containers run on internet-facing servers.

---

## 11. A learning roadmap

For your combination of Linux administration and Java backend development, I recommend the following order.

| Stage | Topic | What to practise |
|---|---|---|
| 1 | Container fundamentals | Understand images, containers, and the shared kernel |
| 2 | Docker CLI | Run, stop, inspect, and remove containers |
| 3 | Images and Dockerfiles | Build your own application image |
| 4 | Ports and networks | Connect to a containerized web server |
| 5 | Volumes | Preserve files and database data |
| 6 | Docker Compose | Run Spring Boot and PostgreSQL together |
| 7 | Container security | Learn non-root execution, permissions, and resource limits |
| 8 | Deployment | Deploy a containerized backend to a Linux server |
| 9 | Kubernetes | Study orchestration after understanding Docker and networking |

You do not need to learn Kubernetes immediately. For a beginner building backend applications, Docker and Compose provide a much more practical starting point.

### Your first hands-on exercise

If Docker is already installed on your Linux server, try this sequence:

```bash
# 1. Check Docker
docker version

# 2. Download a small Debian image
docker pull debian:stable-slim

# 3. Run an interactive container
docker run --rm -it debian:stable-slim bash

# 4. Inside the container
hostname
ps aux
cat /etc/os-release
exit
```

Then compare the container's environment with your host:

```bash
hostname
ps aux
cat /etc/os-release
```

Observe the differences.

The container has its own userspace filesystem and isolated process view, but it still relies on the host's Linux kernel.

If the image pull fails because of network connectivity, you can revisit registry configuration separately; it does not mean the container technology itself is broken.

---

## 12. The big picture

Container technology becomes easier to understand when you distinguish its layers:

| Layer | Main responsibility |
|---|---|
| Linux kernel | Provides processes, namespaces, cgroups, and other system facilities |
| Container runtime | Creates and runs isolated containers |
| Container engine | Manages images, containers, networks, and storage |
| Container image | Packages an application environment |
| Container | Runs the application in an isolated environment |
| Docker Compose | Defines and manages a multi-container application |
| Kubernetes | Orchestrates containerized workloads across a cluster |

The most important principle is this:

**Container technology does not create a separate operating system for every application. It uses operating-system facilities to isolate processes and their environments, making applications easier to package, distribute, and deploy.**

For your next step, I recommend learning **Docker commands and Dockerfiles through a small Java Spring Boot project**, then adding PostgreSQL and Docker Compose. That will connect the underlying computer science concepts directly to real backend development.
