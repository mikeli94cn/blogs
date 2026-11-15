# How to Install and Use OpenAI Codex on Ubuntu

**Codex** is an AI coding agent developed by [OpenAI](https://openai.com?utm_source=chatgpt.com). It can help you write, understand, debug, test, and modify code.

Unlike a traditional code editor, Codex can work directly with your project files, execute terminal commands, and help complete programming tasks.

Since you have been setting up Ubuntu with **Java, Maven, Python, Node.js, Git, VS Code, and IntelliJ IDEA**, Codex is a useful addition to your development environment.

There are several ways to use Codex:

| Method | Description | Recommendation |
|---|---|---|
| Codex CLI | Run Codex directly in Ubuntu's terminal | ⭐ Recommended |
| Codex IDE extension | Use Codex inside a supported editor such as VS Code | Recommended |
| Codex web | Work on coding tasks through a browser | Useful for cloud-based tasks |

I recommend starting with **Codex CLI**, then integrating Codex with VS Code.

---

## 1. Install Codex CLI on Ubuntu

Codex CLI is a command-line application that runs in your terminal.

### Step 1: Verify Node.js

Codex CLI can be installed using npm.

Check whether Node.js is installed:

```bash
node --version
```

Check npm:

```bash
npm --version
```

If both commands display version numbers, continue.

If Node.js is missing, install it using NVM:

```bash
nvm install --lts
```

This assumes you have already installed NVM.

### Step 2: Install Codex CLI

Execute:

```bash
npm install -g @openai/codex
```

Here:

- `npm` is the Node.js package manager.
- `install` installs a package.
- `-g` means global installation.
- `@openai/codex` is the official Codex CLI package.

If you installed Node.js through NVM, you generally do not need `sudo`.

### Step 3: Verify installation

```bash
codex --version
```

You should see the installed Codex CLI version.

### Step 4: Launch Codex

Execute:

```bash
codex
```

On the first launch, Codex will guide you through authentication.

You can sign in using your ChatGPT account or configure API-based authentication.

**Important:** ChatGPT subscription access and API billing are different. API-based usage may incur separate charges.

---

## 2. Use Codex in your Java project

Suppose you have a Spring Boot Student Management System:

```text
student-management/
├── pom.xml
├── src/
│   ├── main/
│   │   ├── java/
│   │   └── resources/
│   └── test/
└── README.md
```

Open a terminal and navigate to the project:

```bash
cd ~/JavaProjects/student-management
```

Launch Codex:

```bash
codex
```

You can now give Codex instructions in natural language.

### Example 1: Understand an existing project

Ask Codex:

> Examine this Spring Boot project. Explain its architecture, Maven dependencies, controllers, services, repositories, and database configuration. Do not modify any files.

This is an excellent way to understand an unfamiliar codebase.

### Example 2: Generate Java code

Ask:

> Create a Student entity with id, name, email, and age. Use Jakarta Persistence annotations and follow Spring Boot best practices.

Codex can examine your existing project and create the necessary Java source files.

### Example 3: Implement a REST API

Ask:

> Implement CRUD REST endpoints for managing students. Use Spring Boot, Spring Data JPA, and MySQL. Separate the controller, service, and repository layers.

Codex can help generate the corresponding classes and configuration.

### Example 4: Debug Maven errors

Ask:

> Run the Maven tests, investigate any compilation or test failures, explain their causes, and propose fixes.

Codex can execute Maven commands such as:

```bash
mvn test
```

It can then examine the errors and help fix them, subject to its execution permissions.

---

## 3. Use Codex with VS Code

Codex also integrates with VS Code.

### Step 1: Open VS Code

```bash
code
```

### Step 2: Install the Codex extension

Open the Extensions panel:

`Ctrl + Shift + X`

Search for:

**Codex – OpenAI's coding agent**

Install the official extension published by OpenAI.

### Step 3: Sign in

Open the Codex panel and follow the authentication instructions.

### Step 4: Open your project

```bash
cd ~/JavaProjects/student-management
code .
```

You can now ask Codex to explain, modify, and debug code while working inside VS Code.

The CLI and IDE extension can share Codex configuration, including configured MCP servers. [OpenAI Developers](https://developers.openai.com/learn/docs-mcp?utm_source=chatgpt.com)

---

## 4. Use Codex with IntelliJ IDEA

Since IntelliJ IDEA is your primary Java IDE, you may prefer using Codex alongside it.

There are two practical approaches.

**Approach A: Use Codex in IntelliJ's terminal**

Open your Java project in IntelliJ IDEA.

Select:

**View → Tool Windows → Terminal**

Execute:

```bash
codex
```

You can now use Codex while working in IntelliJ IDEA.

This approach does not require an additional IDE plugin.

**Approach B: Use a supported Codex integration**

Codex also has integrations for JetBrains IDEs, including IntelliJ IDEA. Check the available integration and setup instructions for your installed IDE version.

[Codex documentation and JetBrains tutorials](https://developers.openai.com/learn/codex?utm_source=chatgpt.com)

For your current workflow, I recommend starting with **IntelliJ IDEA + Codex CLI**.

---

## 5. Useful Codex CLI commands

| Command | Purpose |
|---|---|
| `codex` | Start an interactive session |
| `codex --version` | Show installed version |
| `codex --help` | Show available commands |
| `codex login` | Start authentication |
| `codex exec "prompt"` | Run a non-interactive task |
| `codex mcp list` | List configured MCP servers |

For example, you can ask Codex to examine a project without opening an interactive session:

```bash
codex exec "Explain the architecture of this project."
```

Codex also supports more advanced workflows, including automated code review and iterative testing. [OpenAI Developers](https://developers.openai.com/cookbook/examples/codex/secure_quality_gitlab?utm_source=chatgpt.com)

---

## 6. Update Codex

Because Codex CLI is actively developed, I recommend keeping it updated.

Execute:

```bash
npm install -g @openai/codex@latest
```

Verify:

```bash
codex --version
```

This is the installation and update command used in OpenAI's official Codex examples. [OpenAI Developers](https://developers.openai.com/cookbook/examples/codex/using_goals_in_codex?utm_source=chatgpt.com)

---

## 7. Important security considerations

Codex is more powerful than a traditional chatbot because it can interact with your development environment.

Follow these precautions:

1. **Use Git before making significant changes.** Commit your existing code so you can review or revert modifications.
2. **Review generated code.** AI-generated code may contain bugs or security vulnerabilities.
3. **Protect sensitive files.** Avoid exposing `.env` files, API keys, database passwords, or production credentials.
4. **Review command permissions.** Start with restrictive permissions and approve potentially destructive commands carefully.
5. **Avoid running Codex as root.** Use your normal Ubuntu user account.

For example, before asking Codex to modify your project:

```bash
git status
```

Commit your current changes if appropriate:

```bash
git add .
git commit -m "Save project before Codex changes"
```

Make sure you have a suitable `.gitignore` so credentials and generated files are not accidentally committed.

---

## 8. My recommended development workflow

For your Java backend learning, I suggest this combination:

| Tool | Responsibility |
|---|---|
| IntelliJ IDEA | Write and debug Java code |
| OpenJDK 21 | Compile and execute Java |
| Maven | Manage dependencies and build projects |
| Git | Track source code changes |
| Codex CLI | AI-assisted coding and debugging |
| Docker | Run MySQL and deploy applications |

A typical workflow would be:

```text
Ubuntu
   │
   ├── IntelliJ IDEA
   │      │
   │      └── Spring Boot Project
   │              │
   │              ├── Controller
   │              ├── Service
   │              ├── Repository
   │              └── Entity
   │
   ├── Codex CLI
   │      │
   │      ├── Understand code
   │      ├── Generate code
   │      ├── Debug errors
   │      └── Run tests
   │
   ├── Maven
   ├── Git
   └── Docker + MySQL
```

### Quick installation summary

Assuming Node.js and npm are already installed:

```bash
# Install Codex
npm install -g @openai/codex@latest

# Verify installation
codex --version

# Open your Java project
cd ~/JavaProjects/student-management

# Start Codex
codex
```

**My recommendation:** Begin by asking Codex to explain your existing Java project rather than immediately generating an entire application. This helps you learn Spring Boot architecture while gradually becoming comfortable with AI-assisted development.

For more advanced usage, refer to the [official Codex documentation](https://developers.openai.com/codex?utm_source=chatgpt.com).



---

# How to Install and Use Cursor AI on Ubuntu

**Cursor** is an AI-powered code editor designed to help developers write, understand, debug, and maintain software.

It combines a familiar code-editing environment with AI coding agents that can inspect your project, modify source files, execute terminal commands, and help fix errors.

Since you are learning **Java, Spring Boot, MySQL, Python, and JavaScript**, Cursor is a useful tool for your Ubuntu development environment.

## 1. What is Cursor?

Cursor is based on the open-source VS Code codebase, so its interface and many of its features will be familiar if you have used VS Code.

Its main capabilities include:

- **AI Chat:** Ask questions about your source code.
- **Agent Mode:** Let an AI agent implement features across multiple files.
- **Tab Completion:** Receive AI-powered code suggestions while typing.
- **Inline Editing:** Select code and ask AI to modify it.
- **Terminal Integration:** Execute commands and inspect their output.
- **Project Understanding:** Analyze relationships between files and components.

### Cursor vs. other AI coding tools

| Tool | Primary interface | Main purpose |
|---|---|---|
| Cursor | Graphical code editor | AI-assisted software development |
| Claude Code | Terminal | Agentic coding |
| OpenAI Codex | Terminal, IDE, and other interfaces | Agentic coding |
| Gemini CLI | Terminal | Agentic coding |
| IntelliJ IDEA | Full-featured IDE | Java development |

**The main difference:** Cursor provides a complete graphical coding environment, whereas terminal-based tools such as Claude Code focus on working inside your existing development environment.

For Java backend development, you can use Cursor alongside IntelliJ IDEA rather than replacing IntelliJ completely.

---

## 2. Install Cursor on Ubuntu (Recommended: APT)

Cursor officially provides Linux `.deb`, RPM, and AppImage packages. It also offers an APT repository for Ubuntu and Debian.

**I recommend the APT installation**, because it integrates with Ubuntu's package manager and makes updating easier. [Cursor](https://prod.cursor.com/docs/get-started/quickstart?utm_source=chatgpt.com)

### Step 1: Install prerequisites

Open your Ubuntu terminal:

```bash
sudo apt update
sudo apt install curl gnupg
```

### Step 2: Add Cursor's signing key

```bash
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://downloads.cursor.com/keys/anysphere.asc \
  | gpg --dearmor \
  | sudo tee /etc/apt/keyrings/cursor.gpg > /dev/null
```

The signing key allows APT to verify packages from Cursor's repository.

### Step 3: Add the official Cursor repository

```bash
echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/cursor.gpg] https://downloads.cursor.com/aptrepo stable main" \
  | sudo tee /etc/apt/sources.list.d/cursor.list
```

### Step 4: Install Cursor

```bash
sudo apt update
sudo apt install cursor
```

### Step 5: Launch Cursor

```bash
cursor
```

Alternatively, find **Cursor** in Ubuntu's Applications menu.

When Cursor starts, follow the instructions to sign in or create an account.

---

## 3. Alternative: Install Cursor using a DEB package

If you prefer not to add another APT repository, download Cursor's `.deb` package.

Visit the official download page:

[Download Cursor for Linux](https://cursor.com/en-US/download?utm_source=chatgpt.com)

Choose **Linux .deb (x64)** for a typical Intel or AMD Ubuntu computer.

After downloading, open a terminal:

```bash
cd ~/Downloads
```

Install the downloaded package:

```bash
sudo apt install ./cursor*.deb
```

If the filename differs, replace `cursor*.deb` with the actual filename.

Launch Cursor:

```bash
cursor
```

**Note:** The DEB package and APT repository are alternative installation methods. You only need one.

---

## 4. Alternative: Install Cursor using AppImage

Cursor also provides an AppImage, which is a portable Linux application.

Download the AppImage from the official website.

Then:

```bash
cd ~/Downloads
```

Make it executable:

```bash
chmod +x Cursor-*.AppImage
```

Run it:

```bash
./Cursor-*.AppImage
```

Some Ubuntu versions may require additional FUSE compatibility packages to run AppImages.

For normal daily development, I recommend the APT installation instead.

---

## 5. Configure Cursor for Java development

Since you are learning Java backend development, configure Cursor with your existing Java environment.

### Step 1: Verify Java

```bash
java -version
javac -version
```

If Java is not installed:

```bash
sudo apt install openjdk-21-jdk
```

### Step 2: Verify Maven

```bash
mvn -version
```

If Maven is missing:

```bash
sudo apt install maven
```

### Step 3: Install Java extensions

Open Cursor's Extensions panel:

`Ctrl + Shift + X`

Search for Java development extensions such as:

- Extension Pack for Java
- Language Support for Java
- Maven for Java
- Spring Boot Extension Pack

**Compatibility note:** Cursor supports many VS Code extensions, but extension availability and compatibility can differ. Search its extension marketplace for the versions available to you.

### Step 4: Open your Spring Boot project

For example:

```bash
cd ~/JavaProjects/student-management
cursor .
```

The `cursor .` command opens the current directory in Cursor, provided its shell command is installed and available in your PATH.

You should see your project files:

```text
student-management/
├── pom.xml
├── src/
│   ├── main/
│   │   ├── java/
│   │   └── resources/
│   └── test/
└── README.md
```

---

## 6. How to use Cursor AI coding features

### Feature A: Ask AI about your code

Open the Agent panel using:

**Ctrl + I**

Enter a question such as:

> Analyze this Java Spring Boot project. Explain its architecture, dependencies, and the relationships between controllers, services, repositories, and entities. Do not modify any files.

Cursor can inspect your project and explain its structure.

### Feature B: Generate code with Agent Mode

Ask Cursor:

> Implement a Student REST API using Java 21, Spring Boot, Spring Data JPA, Hibernate, and MySQL. Follow a layered architecture and create unit tests.

Cursor can inspect existing files, propose changes, and implement the feature.

Review its modifications before accepting them.

### Feature C: Use Plan Mode

For larger tasks, use **Plan Mode**.

In the Agent input, press `Shift + Tab` to switch modes.

Then enter:

> Plan the implementation of a physical DVD rental website using Spring Boot, MySQL, and Hibernate. Identify the required database tables, REST endpoints, services, and business rules. Do not write code yet.

Cursor can examine your project, prepare an implementation plan, and wait for your approval before proceeding. [Cursor](https://prod.cursor.com/docs/get-started/quickstart?utm_source=chatgpt.com)

### Feature D: Debug errors

For example:

> Run `mvn test`, investigate the failures, explain the root causes, and fix them after reviewing the proposed changes.

Cursor can use the terminal to execute commands, subject to its permission settings.

### Feature E: Review generated code

After the agent finishes, open the diff view to inspect its changes.

You can also use Git:

```bash
git status
git diff
```

Then run:

```bash
mvn test
```

This is especially important when AI generates database migrations, authentication code, or other security-sensitive components.

---

# 7. Cursor CLI: Use Cursor directly from the Ubuntu terminal

Cursor also provides a standalone terminal coding agent.

This is particularly interesting because you have been using **Claude Code, Codex, and Gemini CLI**.

You can use Cursor without opening its graphical editor.

### Step 1: Install Cursor CLI

The official installation command is:

```bash
curl https://cursor.com/install -fsS | bash
```

For additional security, you can download and inspect the script before executing it.

### Step 2: Configure PATH

For Bash:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### Step 3: Verify installation

```bash
agent --version
```

### Step 4: Start Cursor Agent

```bash
agent
```

The current official documentation uses the command **`agent`** for Cursor CLI. [Cursor](https://prod.cursor.com/docs/cli/installation?utm_source=chatgpt.com)

### Step 5: Use Cursor Agent in your project

```bash
cd ~/JavaProjects/student-management
agent
```

Then enter:

> Analyze this Spring Boot project and explain its architecture.

Or start with an instruction directly:

```bash
agent "Explain the structure of this Spring Boot project"
```

### Useful Cursor CLI commands

| Command | Description |
|---|---|
| `agent` | Start interactive coding agent |
| `agent --version` | Check installed version |
| `agent --help` | Display available options |
| `agent --mode=ask` | Explore code without modifying files |
| `agent --mode=plan` | Plan a task before implementation |
| `agent ls` | List previous sessions |
| `agent resume` | Resume a previous session |
| `agent update` | Update Cursor CLI |

These commands are documented in the [Cursor CLI documentation](https://prod.cursor.com/docs/cli/overview?utm_source=chatgpt.com).

---

## 8. Cursor GUI vs Cursor CLI

| Feature | Cursor GUI | Cursor CLI |
|---|---|---|
| Interface | Graphical editor | Terminal |
| Code editor | Built in | Uses your existing editor |
| AI coding agent | Yes | Yes |
| Read and modify files | Yes | Yes |
| Run terminal commands | Yes | Yes |
| Java/Spring Boot | Yes | Yes |
| Best for | Daily coding | Terminal-based workflows |
| Similar to | VS Code with AI | Claude Code / Codex CLI |

You can install both.

For example:

```bash
# Open the graphical editor
cursor .
```

Or:

```bash
# Start the terminal coding agent
agent
```

---

## 9. Recommended workflow for your Java projects

For your Spring Boot student management system or physical DVD rental website, I recommend this workflow:

**Step 1:** Open the project in Cursor.

```bash
cursor ~/JavaProjects/student-management
```

**Step 2:** Ask the AI agent to analyze the project before modifying anything.

**Step 3:** Use Plan Mode to design a new feature.

**Step 4:** Approve the implementation plan and let the agent generate code.

**Step 5:** Review the modified files and run Maven tests.

```bash
mvn clean test
```

**Step 6:** Commit verified changes with Git.

```bash
git add .
git commit -m "Implement student management feature"
```

Avoid committing generated files until you have reviewed them, and keep passwords and API keys out of Git.

---

## 10. Quick installation summary

### Install Cursor graphical editor

```bash
sudo apt update
sudo apt install curl gnupg

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://downloads.cursor.com/keys/anysphere.asc \
  | gpg --dearmor \
  | sudo tee /etc/apt/keyrings/cursor.gpg > /dev/null

echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/cursor.gpg] https://downloads.cursor.com/aptrepo stable main" \
  | sudo tee /etc/apt/sources.list.d/cursor.list

sudo apt update
sudo apt install cursor

cursor
```

### Install Cursor CLI

```bash
curl https://cursor.com/install -fsS | bash

export PATH="$HOME/.local/bin:$PATH"

agent --version

agent
```

### Official resources

- [Cursor official website](https://cursor.com?utm_source=chatgpt.com)
- [Cursor download page](https://cursor.com/en-US/download?utm_source=chatgpt.com)
- [Cursor getting-started guide](https://prod.cursor.com/docs/get-started/quickstart?utm_source=chatgpt.com)
- [Cursor CLI installation guide](https://prod.cursor.com/docs/cli/installation?utm_source=chatgpt.com)

**My recommendation:** For your Java backend learning, keep **IntelliJ IDEA** as your primary Java IDE and try **Cursor GUI** for AI-assisted feature development. If you prefer the terminal workflow of Claude Code and Codex, install **Cursor CLI** as well.

--

# How to Install and Use Google Antigravity on Ubuntu

**Google Antigravity** is an AI-powered development environment from [Google](https://www.google.com?utm_source=chatgpt.com). It is designed to help developers build, debug, test, and maintain software with AI coding agents.

Since you have been exploring **OpenAI Codex, Claude Code, and Gemini**, Antigravity is another tool worth trying.

For your Java Spring Boot, Python, and JavaScript projects, Antigravity can help with tasks such as understanding existing code, implementing features, debugging errors, and running tests.

## 1. Understand Antigravity

Antigravity is more than a traditional code editor. Its central idea is *agent-assisted development*.

A traditional IDE workflow looks like this:

```text
Developer
    |
    v
Code Editor
    |
    +-- Write code
    +-- Run commands
    +-- Debug errors
    +-- Test application
```

An AI-agent workflow looks like this:

```text
Developer
    |
    v
Antigravity
    |
    +-- AI Coding Agent
    |      |
    |      +-- Understand project
    |      +-- Generate code
    |      +-- Modify files
    |      +-- Execute commands
    |      +-- Run tests
    |
    +-- Code Editor
    |
    +-- Terminal
```

You describe a development task, review the agent's proposed actions, and inspect the resulting code changes.

---

## 2. Choose an Antigravity installation method

Google currently provides several ways to use Antigravity on Ubuntu.

| Method | Description | Recommended for |
|---|---|---|
| Antigravity CLI | Terminal-based AI coding agent | Codex/Claude Code users |
| Antigravity App | Desktop application for managing AI agents | Agent-based workflows |
| Antigravity IDE | Standalone graphical development environment | GUI development |
| IDE extension | Integration with VS Code or IntelliJ IDEA | Existing IDE users |

All these options support Linux. Google's current documentation lists Ubuntu 20.04 and newer among supported systems. [Google Antigravity](https://antigravity.google/docs/getting-started?tab=cli\&utm_source=chatgpt.com)

**For your development environment, I recommend starting with Antigravity CLI.** It is straightforward to install and can work alongside IntelliJ IDEA.

---

## 3. Method 1: Install Antigravity CLI (Recommended)

### Step 1: Install prerequisites

Open Ubuntu's terminal:

```bash
sudo apt update
sudo apt install curl git
```

### Step 2: Install Antigravity CLI

Google provides an official installation script:

```bash
curl -fsSL https://antigravity.google/cli/install.sh | bash
```

For additional security, you can download and inspect the script before executing it.

The default installation location is:

```text
~/.local/bin/agy
```

Unlike Gemini CLI, **Antigravity CLI does not require Node.js or npm**. [Google Antigravity](https://antigravity.google/docs/cli/install?authuser=01\&utm_source=chatgpt.com)

### Step 3: Configure PATH if necessary

If Ubuntu reports `agy: command not found`, add the installation directory to your PATH.

Open:

```bash
nano ~/.bashrc
```

Add:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Save and execute:

```bash
source ~/.bashrc
```

### Step 4: Verify installation

```bash
agy --version
```

### Step 5: Launch Antigravity

```bash
agy
```

During the initial setup, follow the authentication instructions.

You may be asked to configure your terminal appearance, rendering mode, and workspace trust settings.

Official guide:

[Google Antigravity CLI installation](https://antigravity.google/docs/cli/install?authuser=01&utm_source=chatgpt.com)

---

## 4. Method 2: Install the Antigravity desktop application

If you prefer a graphical interface, download the Linux application.

### Step 1: Download Antigravity

Visit:

[Google Antigravity Downloads](https://antigravity.google/download?utm_source=chatgpt.com)

Choose the Linux x64 version for a typical Intel or AMD Ubuntu computer.

### Step 2: Extract the archive

Assuming the downloaded archive is named `Antigravity.tar.gz`, execute:

```bash
cd ~/Downloads
tar -xzf Antigravity.tar.gz
```

The actual downloaded filename may differ.

### Step 3: Launch Antigravity

From the extracted directory containing the executable:

```bash
./Antigravity
```

The official Linux instructions use this archive-based installation method. [Google Antigravity](https://antigravity.google/docs/getting-started?tab=cli\&utm_source=chatgpt.com)

### Step 4: Sign in

Follow the application's authentication instructions using your supported Google account.

You can then create a project, add your existing source-code directory, and begin working with an AI agent.

---

## 5. Method 3: Use Antigravity with VS Code

If you already installed VS Code, you do not need another editor.

Open VS Code:

```bash
code
```

Press:

`Ctrl + Shift + X`

Search for **Google Antigravity** and install the official extension.

Follow the authentication instructions.

The official extension requires VS Code 1.90 or later. [Google Antigravity](https://antigravity.google/docs/getting-started?tab=cli\&utm_source=chatgpt.com)

---

## 6. Method 4: Use Antigravity with IntelliJ IDEA

This option is especially relevant to your Java backend development.

Google provides an Antigravity integration for JetBrains IDEs.

For a supported IntelliJ IDEA version:

1. Open IntelliJ IDEA.
2. Open **JetBrains AI → Settings → Agents**.
3. Find Antigravity.
4. Select Install.
5. Complete authentication.

Google's current documentation specifies IntelliJ-based IDE version 2026.2.1 or later. [Google Antigravity](https://antigravity.google/docs/getting-started?tab=cli\&utm_source=chatgpt.com)

If your installed IntelliJ IDEA version is older, you can still use Antigravity CLI in IntelliJ's integrated terminal.

---

## 7. Use Antigravity with your Spring Boot project

Suppose your project is located at:

```text
~/JavaProjects/student-management
```

Navigate to it:

```bash
cd ~/JavaProjects/student-management
```

Start Antigravity:

```bash
agy
```

You can now ask the agent to help with your Java project.

### Example 1: Understand the project

Enter:

> Analyze this Spring Boot project. Explain its Maven dependencies, Controller, Service, Repository, and Entity layers. Do not modify any files.

### Example 2: Implement a feature

Enter:

> Implement a Student REST API using Java 21, Spring Boot, Spring Data JPA, and MySQL. Follow a layered architecture and write unit tests.

### Example 3: Debug Maven errors

Enter:

> Run Maven tests, identify compilation or test failures, and explain their causes before making changes.

### Example 4: Improve code quality

Enter:

> Review this Java project for potential bugs, security problems, and poor coding practices. Suggest improvements without modifying the source code.

These examples are useful for learning Spring Boot while working with an AI coding assistant.

---

## 8. Protect your source code

Because Antigravity can modify files and execute commands, I recommend using Git to track changes.

Before starting:

```bash
git status
```

After the agent modifies your project:

```bash
git diff
```

Run Maven tests:

```bash
mvn test
```

Review changes before committing them.

Avoid giving an AI agent unrestricted access to production servers, database credentials, or sensitive files.

---

## 9. Compare Antigravity, Codex, and Claude Code

| Feature | Antigravity | Codex | Claude Code |
|---|---|---|---|
| Developer | Google | OpenAI | Anthropic |
| Ubuntu CLI | `agy` | `codex` | `claude` |
| AI coding agent | Yes | Yes | Yes |
| Project analysis | Yes | Yes | Yes |
| Code modification | Yes | Yes | Yes |
| Terminal execution | Yes | Yes | Yes |
| Java/Spring Boot | Yes | Yes | Yes |
| Python | Yes | Yes | Yes |
| JavaScript/TypeScript | Yes | Yes | Yes |
| IDE integration | Yes | Yes | Yes |

The tools have different interfaces, models, permissions, and account requirements.

For learning Java backend development, you can use any of them alongside IntelliJ IDEA.

---

## 10. My recommendation

For your Ubuntu development environment, I suggest:

**IntelliJ IDEA + OpenJDK 21 + Maven + Git + Antigravity CLI**

You can install Antigravity with:

```bash
# Install prerequisites
sudo apt update
sudo apt install curl git

# Install Antigravity CLI
curl -fsSL https://antigravity.google/cli/install.sh | bash

# Verify installation
agy --version

# Open your Java project
cd ~/JavaProjects/student-management

# Start Antigravity
agy
```

**One important distinction:** If you want an AI agent similar to Codex CLI or Claude Code, choose **Antigravity CLI**. If you want a complete graphical development environment, choose **Antigravity IDE**.

For further instructions, see [Google's official Antigravity getting-started guide](https://antigravity.google/docs/getting-started?tab=cli&utm_source=chatgpt.com).
