# Docker Cheatsheet

Docker is a platform for **building, running, and distributing applications as containers**.

A useful mental model is:

```text
Dockerfile
    │
    ▼
 docker build
    │
    ▼
  Image
    │
    │ docker run
    ▼
Container
    │
    ├── Port
    ├── Volume
    ├── Network
    └── Environment variables
```

---

## 1. Basic Docker Concepts

| Concept            | Meaning                                       |
| ------------------ | --------------------------------------------- |
| **Image**          | Read-only template used to create containers  |
| **Container**      | Running instance of an image                  |
| **Dockerfile**     | Instructions for building an image            |
| **Registry**       | Repository for images, e.g. Docker Hub        |
| **Volume**         | Persistent storage managed by Docker          |
| **Network**        | Allows containers to communicate              |
| **Docker Compose** | Defines and runs multi-container applications |

The most important relationship:

```text
Dockerfile → Image → Container
```

---

# 2. Docker Version & Information

```bash
docker --version
```

Show detailed information:

```bash
docker version
```

Docker environment information:

```bash
docker info
```

Show help:

```bash
docker help
docker run --help
```

---

# 3. Images

### List images

```bash
docker images
```

or:

```bash
docker image ls
```

### Pull an image

```bash
docker pull ubuntu
```

Specific version:

```bash
docker pull ubuntu:24.04
```

```text
ubuntu       → image name
24.04        → tag
```

If no tag is specified:

```bash
docker pull ubuntu
```

Docker normally uses:

```text
ubuntu:latest
```

---

### Remove image

```bash
docker rmi ubuntu
```

or:

```bash
docker image rm ubuntu
```

Force:

```bash
docker rmi -f ubuntu
```

### Inspect image

```bash
docker image inspect ubuntu
```

### Image history

```bash
docker history ubuntu
```

---

# 4. Run Containers

The most important Docker command:

```bash
docker run ubuntu
```

Run interactively:

```bash
docker run -it ubuntu
```

For example:

```bash
docker run -it ubuntu /bin/bash
```

You are now inside the container:

```bash
root@abc123:/#
```

Exit:

```bash
exit
```

---

# 5. Container Lifecycle

### List running containers

```bash
docker ps
```

### List all containers

```bash
docker ps -a
```

### Start existing container

```bash
docker start <container>
```

### Stop container

```bash
docker stop <container>
```

### Restart

```bash
docker restart <container>
```

### Kill immediately

```bash
docker kill <container>
```

### Remove container

```bash
docker rm <container>
```

Force removal:

```bash
docker rm -f <container>
```

---

# 6. Give a Container a Name

Instead of Docker generating a random name:

```bash
docker run --name myubuntu -it ubuntu
```

Then:

```bash
docker start myubuntu
docker stop myubuntu
docker rm myubuntu
```

You can refer to:

```text
myubuntu
```

instead of the container ID.

---

# 7. Run in Background

Use `-d`:

```bash
docker run -d nginx
```

`-d` means:

```text
detached mode
```

Check it:

```bash
docker ps
```

Stop it:

```bash
docker stop <container>
```

---

# 8. Execute Commands Inside a Running Container

This is extremely useful.

```bash
docker exec <container> ls
```

Open a shell:

```bash
docker exec -it <container> /bin/bash
```

For images without bash:

```bash
docker exec -it <container> /bin/sh
```

For example:

```bash
docker exec -it mynginx /bin/sh
```

Conceptually:

```text
Host
 │
 │ docker exec
 ▼
Container
 │
 └── shell
```

---

# 9. Container Logs

View logs:

```bash
docker logs <container>
```

Follow logs:

```bash
docker logs -f <container>
```

Show timestamps:

```bash
docker logs -t <container>
```

Last 100 lines:

```bash
docker logs --tail 100 <container>
```

Very common:

```bash
docker logs -f myapp
```

---

# 10. Port Mapping

Suppose the application inside the container listens on:

```text
8080
```

Expose it to host port `8080`:

```bash
docker run -p 8080:8080 myapp
```

Format:

```text
-p HOST_PORT:CONTAINER_PORT
```

Example:

```bash
docker run -p 8080:80 nginx
```

means:

```text
Browser
   │
   │ localhost:8080
   ▼
Host port 8080
   │
   │ Docker
   ▼
Container port 80
   │
   ▼
Nginx
```

You can use different ports:

```bash
docker run -p 9000:8080 myapp
```

Then:

```text
localhost:9000
       ↓
container:8080
```

---

# 11. Environment Variables

```bash
docker run \
  -e DB_HOST=localhost \
  -e DB_PORT=5432 \
  myapp
```

Inside the container:

```bash
echo $DB_HOST
```

You can also use an environment file:

```bash
docker run --env-file .env myapp
```

Example `.env`:

```text
DB_HOST=postgres
DB_PORT=5432
DB_USER=admin
DB_PASSWORD=secret
```

---

# 12. Volumes

Containers are generally considered **ephemeral**.

If you delete a container, data stored only inside its writable layer can disappear.

Use a volume for persistent data.

### Create volume

```bash
docker volume create mydata
```

### List volumes

```bash
docker volume ls
```

### Use volume

```bash
docker run \
  -v mydata:/data \
  ubuntu
```

Format:

```text
-v VOLUME:CONTAINER_PATH
```

For example:

```bash
docker run \
  -v mysql-data:/var/lib/mysql \
  mysql
```

Conceptually:

```text
Docker Volume
     │
     │ mounted
     ▼
Container
/data
```

---

# 13. Bind Mount

You can mount a host directory:

```bash
docker run \
  -v $(pwd):/app \
  myapp
```

Meaning:

```text
Host current directory
        │
        ▼
     /app
   container
```

Modern syntax:

```bash
docker run \
  --mount type=bind,source="$(pwd)",target=/app \
  myapp
```

For development, bind mounts are very useful.

---

# 14. Inspect Containers

```bash
docker inspect <container>
```

Useful for finding:

* IP address
* mounts
* environment variables
* network information
* configuration

Example:

```bash
docker inspect myapp
```

---

# 15. Container Resource Usage

```bash
docker stats
```

Shows things like:

```text
CPU
Memory
Network
Block I/O
```

Specific container:

```bash
docker stats myapp
```

---

# 16. Copy Files

Host → container:

```bash
docker cp file.txt myapp:/tmp/file.txt
```

Container → host:

```bash
docker cp myapp:/tmp/file.txt .
```

---

# 17. Rename Container

```bash
docker rename old-name new-name
```

---

# 18. Dockerfile

A Dockerfile describes how to build an image.

Example:

```dockerfile
FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY . .

RUN javac Main.java

CMD ["java", "Main"]
```

Build:

```bash
docker build -t myjavaapp .
```

Run:

```bash
docker run myjavaapp
```

The basic process:

```text
Dockerfile
    │
    │ docker build
    ▼
myjavaapp:latest
    │
    │ docker run
    ▼
Container
```

---

# 19. Important Dockerfile Instructions

### FROM

Specify base image:

```dockerfile
FROM ubuntu:24.04
```

or:

```dockerfile
FROM eclipse-temurin:21-jdk
```

---

### WORKDIR

Set working directory:

```dockerfile
WORKDIR /app
```

Equivalent conceptually to:

```bash
cd /app
```

---

### COPY

Copy files into image:

```dockerfile
COPY . .
```

Or:

```dockerfile
COPY pom.xml .
```

---

### RUN

Execute a command **while building the image**:

```dockerfile
RUN apt-get update
```

Important distinction:

```dockerfile
RUN
```

happens during:

```text
docker build
```

---

### CMD

Default command when the container starts:

```dockerfile
CMD ["java", "-jar", "app.jar"]
```

---

### ENTRYPOINT

Defines the executable:

```dockerfile
ENTRYPOINT ["java", "-jar", "app.jar"]
```

A simplified distinction:

```text
RUN         → build time
CMD         → default runtime command
ENTRYPOINT  → main runtime executable
```

---

### EXPOSE

Documents the port used by the application:

```dockerfile
EXPOSE 8080
```

Important:

`EXPOSE` **does not actually publish the port**.

You still need:

```bash
docker run -p 8080:8080 myapp
```

---

### ENV

Set environment variable:

```dockerfile
ENV APP_ENV=production
```

---

### ARG

Build-time variable:

```dockerfile
ARG VERSION=1.0
```

Build:

```bash
docker build --build-arg VERSION=2.0 -t myapp .
```

---

# 20. Build an Image

Basic:

```bash
docker build -t myapp .
```

Tag:

```bash
docker build -t myapp:1.0 .
```

Multiple tags:

```bash
docker tag myapp:1.0 myapp:latest
```

List:

```bash
docker images
```

---

# 21. Docker Registry

Login:

```bash
docker login
```

Tag an image:

```bash
docker tag myapp:1.0 username/myapp:1.0
```

Push:

```bash
docker push username/myapp:1.0
```

Pull:

```bash
docker pull username/myapp:1.0
```

---

# 22. Docker Networks

List networks:

```bash
docker network ls
```

Create network:

```bash
docker network create mynetwork
```

Run container on network:

```bash
docker run \
  --network mynetwork \
  --name app \
  myapp
```

Another:

```bash
docker run \
  --network mynetwork \
  --name db \
  postgres
```

Now containers can communicate through the Docker network.

For example:

```text
app
 │
 │ postgres://db:5432
 ▼
db
```

The important point is that `db` can be used as a hostname.

---

# 23. Connect an Existing Container to a Network

```bash
docker network connect mynetwork myapp
```

Disconnect:

```bash
docker network disconnect mynetwork myapp
```

Inspect:

```bash
docker network inspect mynetwork
```

---

# 24. Docker Compose

Docker Compose is extremely useful for applications consisting of multiple services.

Example:

```yaml
services:

  app:
    image: myapp:latest
    ports:
      - "8080:8080"
    depends_on:
      - db

  db:
    image: postgres:17
    environment:
      POSTGRES_PASSWORD: secret
```

Start:

```bash
docker compose up
```

Background:

```bash
docker compose up -d
```

Stop:

```bash
docker compose down
```

Build:

```bash
docker compose build
```

Build and start:

```bash
docker compose up --build
```

List services:

```bash
docker compose ps
```

Logs:

```bash
docker compose logs
```

Follow logs:

```bash
docker compose logs -f
```

Specific service:

```bash
docker compose logs -f app
```

Execute command:

```bash
docker compose exec app /bin/bash
```

---

# 25. Docker Compose Mental Model

Without Compose:

```text
docker network create ...

docker run ...
docker run ...
docker run ...
```

With Compose:

```text
docker-compose.yml
       │
       ▼
docker compose up
       │
       ├── app container
       ├── database container
       ├── redis container
       └── network
```

This is one of the most important things to learn after basic Docker.

---

# 26. Cleanup Commands

Remove stopped containers:

```bash
docker container prune
```

Remove unused images:

```bash
docker image prune
```

Remove unused volumes:

```bash
docker volume prune
```

Remove unused networks:

```bash
docker network prune
```

General cleanup:

```bash
docker system prune
```

More aggressive:

```bash
docker system prune -a
```

Be careful with:

```bash
docker system prune -a
```

because it can remove unused images and other Docker resources.

---

# 27. Useful Filtering

List containers:

```bash
docker ps -a
```

Filter:

```bash
docker ps -a --filter "name=myapp"
```

Images:

```bash
docker images --filter "reference=ubuntu"
```

---

# 28. Container Naming & IDs

You can use either:

```bash
docker stop myapp
```

or:

```bash
docker stop a1b2c3d4
```

Docker allows shortened IDs:

```bash
docker stop a1b2
```

as long as the prefix uniquely identifies the container.

---

# 29. Common Docker Commands — Quick Reference

```bash
# Information
docker --version
docker version
docker info

# Images
docker images
docker pull IMAGE
docker build -t NAME .
docker rmi IMAGE
docker image inspect IMAGE
docker history IMAGE

# Containers
docker run IMAGE
docker run -it IMAGE /bin/bash
docker run -d IMAGE
docker run --name NAME IMAGE
docker ps
docker ps -a
docker start CONTAINER
docker stop CONTAINER
docker restart CONTAINER
docker rm CONTAINER

# Execute / logs
docker exec -it CONTAINER /bin/bash
docker logs CONTAINER
docker logs -f CONTAINER
docker inspect CONTAINER
docker stats

# Ports
docker run -p 8080:8080 IMAGE

# Environment
docker run -e KEY=value IMAGE
docker run --env-file .env IMAGE

# Volumes
docker volume ls
docker volume create NAME
docker run -v NAME:/data IMAGE

# Networks
docker network ls
docker network create NAME
docker network inspect NAME

# Copy
docker cp FILE CONTAINER:/path
docker cp CONTAINER:/path FILE

# Registry
docker login
docker push IMAGE
docker pull IMAGE

# Compose
docker compose up
docker compose up -d
docker compose down
docker compose ps
docker compose logs
docker compose exec SERVICE COMMAND

# Cleanup
docker container prune
docker image prune
docker volume prune
docker system prune
```

---

# 30. The Most Important Options

You will see these options constantly:

| Option      | Meaning                                   | Example                    |
| ----------- | ----------------------------------------- | -------------------------- |
| `-d`        | Detached/background                       | `docker run -d nginx`      |
| `-it`       | Interactive terminal                      | `docker run -it ubuntu`    |
| `--name`    | Container name                            | `--name app`               |
| `-p`        | Port mapping                              | `-p 8080:80`               |
| `-v`        | Volume/bind mount                         | `-v data:/data`            |
| `-e`        | Environment variable                      | `-e DB_HOST=db`            |
| `--rm`      | Automatically remove container after exit | `--rm`                     |
| `--network` | Select network                            | `--network mynet`          |
| `--restart` | Restart policy                            | `--restart unless-stopped` |

A particularly useful development command:

```bash
docker run --rm -it ubuntu
```

The container disappears automatically when you exit.

---

# 31. A Real Java Backend Example

Since you're learning **Java + Spring Boot**, a typical workflow is:

### Dockerfile

```dockerfile
FROM eclipse-temurin:21-jre

WORKDIR /app

COPY target/app.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
```

Build:

```bash
docker build -t my-spring-app .
```

Run:

```bash
docker run \
  --name spring-app \
  -p 8080:8080 \
  my-spring-app
```

Then:

```text
Browser / REST Client
        │
        │ localhost:8080
        ▼
┌───────────────────┐
│ Docker Container  │
│                   │
│ Spring Boot       │
│       :8080       │
└───────────────────┘
```

For a real backend, you might have:

```text
                  Docker Compose
                       │
          ┌────────────┼────────────┐
          ▼            ▼            ▼
      Spring Boot   PostgreSQL     Redis
       :8080         :5432         :6379
```

This is where Docker becomes especially valuable for backend development.

---

# 32. Docker vs VM

A very important concept:

```text
Virtual Machine

Hardware
   │
   ├── Host OS
   │
   ├── Hypervisor
   │
   ├── Guest OS
   │     └── Application
   │
   └── Guest OS
         └── Application
```

Docker containers:

```text
Hardware
   │
   └── Host OS
         │
      Docker
         │
    ┌────┼────┐
    ▼    ▼    ▼
   App  DB  Redis
 Container Container Container
```

The key idea is that **containers share the host kernel**, whereas traditional VMs contain a complete guest operating system.

---

# 33. Docker's Big Picture

For learning Docker systematically, I would organize it into **six layers**:

```text
                 Docker
                    │
       ┌────────────┼────────────┐
       ▼            ▼            ▼
     Image       Container      Network
       │            │            │
       └────────────┼────────────┘
                    ▼
                 Volume
                    │
                    ▼
               Dockerfile
                    │
                    ▼
             Docker Compose
```

### Learning order

**1. Containers**

```bash
docker run
docker ps
docker start
docker stop
docker rm
docker exec
docker logs
```

**2. Images**

```bash
docker pull
docker images
docker build
docker rmi
```

**3. Dockerfile**

```text
FROM
WORKDIR
COPY
RUN
CMD
ENTRYPOINT
EXPOSE
ENV
ARG
```

**4. Storage**

```text
Volume
Bind Mount
```

**5. Networking**

```text
Bridge
Port mapping
Container DNS
Docker networks
```

**6. Docker Compose**

```yaml
services:
  app:
  db:
  redis:
```

For a **Java/Spring backend developer**, I'd put extra emphasis on **Dockerfile → images → containers → networking → volumes → Compose → Spring Boot + PostgreSQL**, because that sequence maps very closely to how Docker is actually used in backend projects.
