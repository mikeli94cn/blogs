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

# How to Install and Use Claude Code on Ubuntu

**Claude Code** is an AI coding agent developed by [Anthropic](https://www.anthropic.com?utm_source=chatgpt.com). It allows you to write, understand, debug, test, and modify code using natural language.

Claude Code is similar to OpenAI Codex. Both can work directly with your project files, execute terminal commands, and help you develop software.

Since you are setting up Ubuntu with **Java, Maven, Python, Node.js, Git, VS Code, and IntelliJ IDEA**, Claude Code can be a useful addition to your development environment.

## 1. What is Claude Code?

Claude Code is primarily a terminal-based AI coding assistant, although it also supports integrations with development tools.

For example, you can ask it to:

- Explain the architecture of an existing Java project.
- Generate Spring Boot controllers, services, and repositories.
- Find and fix programming errors.
- Execute Maven tests and analyze failures.
- Refactor Java, Python, or JavaScript code.
- Write unit tests.
- Review Git changes.

A typical workflow looks like this:

```text
Ubuntu
   │
   ├── IntelliJ IDEA / VS Code
   │        │
   │        └── Your Project
   │
   ├── Claude Code
   │        │
   │        ├── Read source code
   │        ├── Modify files
   │        ├── Execute commands
   │        ├── Run tests
   │        └── Explain results
   │
   ├── Git
   ├── Maven
   └── Java / Python / Node.js
```

Claude Code works with many programming languages. You do not need to install a separate version for Java, Python, or JavaScript.

---

## 2. Install Claude Code on Ubuntu (Recommended)

According to Anthropic's official documentation, Claude Code supports Ubuntu 20.04 and newer.

The native installer is the recommended installation method. **You do not need Node.js or npm to use this method.** [Claude](https://code.claude.com/docs/en/setup?utm_source=chatgpt.com)

### Step 1: Install curl and Git

Open a terminal:

```bash
sudo apt update
sudo apt install curl git
```

Git is optional for Claude Code itself but highly recommended for software development.

### Step 2: Download and install Claude Code

Execute the official installation command:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

This downloads and executes Anthropic's installation script.

If you prefer to inspect the script before executing it, download it first:

```bash
curl -fsSL https://claude.ai/install.sh -o install-claude.sh
```

Inspect it:

```bash
less install-claude.sh
```

Then execute:

```bash
bash install-claude.sh
```

### Step 3: Verify installation

Close and reopen your terminal.

Execute:

```bash
claude --version
```

Expected output resembles:

```text
2.x.x (Claude Code)
```

You can also check installation health:

```bash
claude doctor
```

This checks for installation and configuration problems.

### Step 4: Start Claude Code

Execute:

```bash
claude
```

Claude Code should open its interactive terminal interface.

---

## 3. Authenticate Claude Code

On your first launch, Claude Code will ask you to authenticate.

You can use a supported Claude subscription or a Claude Console account with API billing.

**Important:** Claude Code requires eligible paid access. A free Claude account alone does not provide Claude Code access. API usage is billed separately from Claude subscriptions. [Claude](https://code.claude.com/docs/en/quickstart?utm_source=chatgpt.com)

Follow the browser authentication instructions.

After authentication, you can start using Claude Code.

Inside Claude Code, enter:

```text
/help
```

This displays available commands.

---

## 4. Use Claude Code with a Java Spring Boot project

Suppose you have the following project:

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

Navigate to the project directory:

```bash
cd ~/JavaProjects/student-management
```

Launch Claude Code:

```bash
claude
```

You can now interact with your project using natural language.

### Example 1: Understand the project

Enter:

> Examine this Spring Boot project and explain its architecture. Describe the Controller, Service, Repository, and Entity layers. Do not modify any files.

Claude Code can read your project files and explain their relationships.

### Example 2: Generate a REST API

Enter:

> Create a Student REST API using Spring Boot, Spring Data JPA, and MySQL. Implement CRUD operations and organize the code into Controller, Service, Repository, and Entity layers.

Claude Code can generate the required Java classes.

### Example 3: Debug Maven errors

Enter:

> Run `mvn test`, identify any compilation or test errors, explain their causes, and suggest fixes before modifying the source code.

Claude Code can execute Maven commands with appropriate permissions.

### Example 4: Learn Java

Enter:

> Explain how Spring dependency injection works in this project. Show examples from the existing source code and explain each annotation.

This is particularly useful while learning Spring Boot.

---

## 5. Use Claude Code with VS Code

Claude Code supports VS Code integration.

Open VS Code:

```bash
code
```

Open the Extensions panel:

`Ctrl + Shift + X`

Search for **Claude Code**, and install the official extension published by Anthropic.

You can then authenticate and use Claude Code inside VS Code.

Official guide:

[Claude Code for VS Code](https://code.claude.com/docs/en/vs-code?utm_source=chatgpt.com)

---

## 6. Use Claude Code with IntelliJ IDEA

Since IntelliJ IDEA is your primary Java IDE, this is particularly relevant.

### Method A: Use IntelliJ's integrated terminal

Open your Spring Boot project in IntelliJ IDEA.

Navigate to:

**View → Tool Windows → Terminal**

Execute:

```bash
claude
```

You can now use Claude Code without leaving IntelliJ IDEA.

### Method B: Use the JetBrains integration

Claude Code also supports JetBrains IDE integration.

Official documentation:

[Claude Code for JetBrains IDEs](https://code.claude.com/docs/en/jetbrains?utm_source=chatgpt.com)

For your Java backend development, I recommend starting with the integrated terminal because it is straightforward and works with your existing project.

---

## 7. Essential Claude Code commands

There are two categories of commands.

### Terminal commands

| Command | Purpose |
|---|---|
| `claude` | Start interactive mode |
| `claude --version` | Display installed version |
| `claude --help` | Display command-line help |
| `claude doctor` | Diagnose installation issues |
| `claude -p "question"` | Ask a question and exit |
| `claude -c` | Continue the most recent conversation |
| `claude -r` | Resume a previous conversation |

For example:

```bash
claude -p "Explain what Maven is."
```

### Commands inside Claude Code

| Command | Purpose |
|---|---|
| `/help` | Display help |
| `/clear` | Clear conversation history |
| `/login` | Authenticate or change accounts |
| `/model` | Select an available model |
| `/status` | Show session and configuration information |
| `/exit` | Exit Claude Code |

These commands are documented in Anthropic's [Claude Code Quickstart](https://code.claude.com/docs/en/quickstart?utm_source=chatgpt.com).

---

## 8. Configure project instructions with CLAUDE.md

Claude Code supports project-specific instructions through a file named `CLAUDE.md`.

For example, create this file in your Spring Boot project:

```bash
nano CLAUDE.md
```

Add:

```markdown
# Project Instructions

This is a Java Spring Boot student management project.

## Technology Stack

- Java 21
- Spring Boot
- Maven
- Spring Data JPA
- Hibernate
- MySQL

## Coding Rules

- Follow Java naming conventions.
- Use Controller, Service, Repository, and Entity layers.
- Prefer constructor injection.
- Write unit tests for business logic.
- Explain important code changes.
- Do not modify database schemas without approval.
- Do not delete files without approval.

## Build Commands

- Compile: mvn compile
- Test: mvn test
- Package: mvn clean package
```

When working in the project, Claude Code can use these instructions to understand your preferred development practices.

This is useful when you want consistent code generation across multiple sessions.

---

## 9. Update Claude Code

Native installations automatically check for updates and install them in the background.

You can verify installation health using:

```bash
claude doctor
```

For other installation methods, updates may require using the corresponding package manager. [Claude](https://code.claude.com/docs/en/setup?utm_source=chatgpt.com)

---

## 10. Compare Claude Code and OpenAI Codex

Since you have also explored Codex, here is a comparison.

| Feature | Claude Code | OpenAI Codex |
|---|---|---|
| Developer | Anthropic | OpenAI |
| Primary purpose | AI coding agent | AI coding agent |
| Ubuntu CLI | Yes | Yes |
| Read project files | Yes | Yes |
| Modify source code | Yes | Yes |
| Execute terminal commands | Yes | Yes |
| Java / Spring Boot | Supported | Supported |
| Python | Supported | Supported |
| JavaScript / TypeScript | Supported | Supported |
| Git integration | Yes | Yes |
| VS Code integration | Yes | Yes |
| IntelliJ workflow | Supported | Supported |

Both tools can assist with coding, debugging, refactoring, and testing.

Their models, permission systems, integrations, and pricing differ, so neither is universally better for every project.

---

## 11. Security recommendations

Claude Code can execute commands and modify files, so use it carefully.

I recommend the following precautions:

1. **Use Git:** Commit your project before significant AI-assisted changes.
2. **Review permissions:** Avoid granting unrestricted command execution unnecessarily.
3. **Protect credentials:** Keep database passwords, API keys, and other secrets out of prompts and unnecessary file access.
4. **Review changes:** Examine generated code before committing.
5. **Avoid running as root:** Use your normal Ubuntu account.

For example, before asking Claude Code to modify a project:

```bash
git status
```

After Claude Code makes changes:

```bash
git diff
```

Then run your tests:

```bash
mvn test
```

This is a good workflow for learning Java while maintaining control over your source code.

---

## 12. My recommendation for your Ubuntu development environment

For your Java backend development, I suggest:

| Tool | Responsibility |
|---|---|
| IntelliJ IDEA | Java IDE |
| OpenJDK 21 | Java compiler and runtime |
| Maven | Build and dependency management |
| Git | Version control |
| Claude Code | AI-assisted coding |
| OpenAI Codex | Alternative AI coding agent |
| Docker | MySQL and application deployment |

### Quick installation summary

You only need these commands:

```bash
# Install prerequisites
sudo apt update
sudo apt install curl git

# Install Claude Code
curl -fsSL https://claude.ai/install.sh | bash

# Verify installation (after reopening the terminal)
claude --version

# Start Claude Code
claude
```

**My recommendation:** Use IntelliJ IDEA for writing and debugging Java, and run Claude Code in IntelliJ's integrated terminal. This gives you the benefits of a full Java IDE and an AI coding agent in the same development environment.

Official documentation: [Claude Code Documentation](https://code.claude.com/docs/en/overview?utm_source=chatgpt.com)
