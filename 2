## What is Shell?

**Shell** is a program that provides a **command-line interface (CLI)** for interacting with an operating system.

In simple terms:

> **Shell = a program that lets you control the computer by typing commands.**

For example:

```bash
ls
cd /home/mike
mkdir projects
cp a.txt b.txt
rm old.txt
```

Instead of clicking folders and buttons in a GUI, you tell the operating system what to do by typing commands.

---

# 1. Where does Shell fit?

A simplified view of a computer system is:

```text
User
  ↓
Shell / GUI
  ↓
Operating System
  ↓
Hardware
```

For a command-line environment:

```text
You
 ↓
Shell
 ↓
Operating System
 ↓
CPU / Memory / Disk / Network
```

The shell is therefore **not the operating system itself**.

For example, on Linux:

```text
Linux kernel
     ↑
     │
   Shell
     ↑
     │
   Terminal
     ↑
     │
    You
```

The **kernel** manages hardware and system resources.

The **shell** provides a convenient way for you to ask the operating system to perform operations.

---

# 2. Shell is a program

This is an important concept.

A shell is just another executable program.

For example, Linux commonly has:

```text
/bin/bash
/bin/sh
/bin/zsh
/bin/fish
```

You can see your current shell with:

```bash
echo $SHELL
```

For example:

```text
/bin/bash
```

You can also find the currently running shell in some environments with:

```bash
ps
```

---

# 3. What happens when you type a command?

Suppose you type:

```bash
ls
```

Conceptually:

```text
You type:
    ls
     ↓
Shell reads the command
     ↓
Shell interprets it
     ↓
Shell finds the ls program
     ↓
Shell starts ls
     ↓
ls asks the OS for directory information
     ↓
OS accesses the filesystem
     ↓
ls prints the result
```

For example:

```bash
$ ls
Documents
Downloads
hello.c
projects
```

The shell itself usually doesn't implement the actual `ls` functionality.

Instead, it **finds and executes another program**.

This distinction is very important.

---

# 4. Shell commands

There are two broad categories of things you can type into a shell.

### External programs

For example:

```bash
ls
cat
grep
find
gcc
java
python
git
```

These are generally executable programs somewhere on the filesystem.

For example:

```bash
which ls
```

might produce:

```text
/usr/bin/ls
```

You can therefore think of:

```bash
ls
```

as roughly:

```text
execute /usr/bin/ls
```

---

### Shell built-ins

Some commands are implemented directly by the shell.

For example:

```bash
cd
export
alias
source
```

Try:

```bash
type cd
```

You may see:

```text
cd is a shell builtin
```

Why does `cd` need to be a shell built-in?

Because `cd` changes the **current working directory of the shell itself**.

If the shell launched another independent process to perform `cd`, that child process could change *its own* directory, but the original shell would remain where it was.

---

# 5. Shell vs Terminal

These are often confused.

They are different things.

### Terminal

The **terminal** provides the interface through which you interact with the shell.

Historically, a terminal was a physical device.

Today, you might use:

```text
GNOME Terminal
Konsole
Windows Terminal
xterm
```

### Shell

The shell interprets your commands.

For example:

```text
Terminal
   ↓
Bash
   ↓
Linux
```

So when you open a terminal and see:

```bash
$
```

the program waiting for your commands may be Bash.

---

# 6. What is Bash?

**Bash** is one particular shell.

Bash means:

> **Bourne Again SHell**

It originated as a replacement/improvement for the older **Bourne shell (`sh`)**.

Today Bash is extremely common on Linux and Unix-like systems.

Example:

```bash
#!/bin/bash

echo "Hello"
```

You can save this as:

```text
hello.sh
```

and run it.

---

# 7. Shell scripting

One of the most important features of shells is that you can put commands into a file.

For example:

```bash
#!/bin/bash

echo "Starting..."

mkdir -p backup

cp *.txt backup/

echo "Backup complete."
```

This is called a **shell script**.

Instead of manually typing:

```bash
mkdir backup
cp a.txt backup/
cp b.txt backup/
cp c.txt backup/
```

you can automate the process.

This is where shell becomes much more powerful than simply being a command prompt.

---

# 8. Variables

Shells have variables.

For example:

```bash
name="Mike"
echo "$name"
```

Output:

```text
Mike
```

Another example:

```bash
name="Alice"

echo "Hello, $name"
```

Output:

```text
Hello, Alice
```

Environment variables are particularly important:

```bash
echo $PATH
echo $HOME
echo $USER
```

For example:

```text
/home/mike/bin:/usr/local/bin:/usr/bin:/bin
```

---

# 9. PATH

`PATH` is one of the most important shell concepts.

Suppose you type:

```bash
java
```

The shell needs to find the `java` executable.

It searches directories listed in:

```bash
$PATH
```

For example:

```text
/usr/local/bin
/usr/bin
/bin
```

You can see the path with:

```bash
echo $PATH
```

And:

```bash
which java
```

might give:

```text
/usr/bin/java
```

This explains an important error:

```text
command not found
```

Often, the shell cannot find the requested executable through `PATH`.

---

# 10. Pipes

One of the most powerful ideas in Unix shells is the **pipe**:

```text
program A
   ↓
   |
program B
   ↓
program C
```

For example:

```bash
ls | grep ".java"
```

Conceptually:

```text
ls
 ↓
output
 ↓
grep
 ↓
filtered output
```

Suppose:

```text
Main.java
Test.java
hello.c
README.md
```

Then:

```bash
ls | grep ".java"
```

produces:

```text
Main.java
Test.java
```

The output of one program becomes the input of another.

This idea is fundamental to Unix.

---

# 11. Redirection

Shells also provide input/output redirection.

For example:

```bash
ls > files.txt
```

means:

```text
ls output
   ↓
files.txt
```

Instead of displaying the output on the terminal, it is written to a file.

You can then do:

```bash
cat files.txt
```

There is also:

```bash
program < input.txt
```

which gives a program input from a file.

And:

```bash
program >> output.txt
```

which appends output instead of replacing the file.

---

# 12. Shell control structures

Shell scripting has programming-language features.

For example:

### if

```bash
if [ -f "hello.txt" ]; then
    echo "File exists"
else
    echo "File does not exist"
fi
```

### for

```bash
for file in *.java; do
    echo "$file"
done
```

### while

```bash
while true; do
    echo "Running..."
    sleep 1
done
```

So shell is both:

```text
command interpreter
        +
automation language
```

---

# 13. Shell history

The shell usually remembers commands you previously entered.

For example:

```bash
history
```

You can also press:

```text
↑
```

to retrieve previous commands.

This is particularly useful when working with long commands.

---

# 14. Shell expansion

Shells perform various kinds of expansion before executing commands.

For example:

```bash
echo *.java
```

If the directory contains:

```text
Main.java
Test.java
User.java
```

the shell expands:

```bash
*.java
```

into something like:

```bash
Main.java Test.java User.java
```

This is called **pathname expansion / globbing**.

Other important expansions include:

```bash
$variable
$(command)
~ 
```

For example:

```bash
echo "Today is $(date)"
```

The shell executes `date` and substitutes its output.

---

# 15. Shell and processes

This connects shell to operating-system concepts.

Suppose you execute:

```bash
java Main
```

Conceptually:

```text
Shell
 │
 │ fork/create process
 ↓
Java process
 │
 ↓
JVM
 │
 ↓
Main.main()
```

The shell can then wait for the process:

```text
Shell
  │
  ├── start program
  │
  ├── wait
  │
  └── receive exit status
```

You can also run something in the background:

```bash
java Main &
```

The `&` tells the shell to start it without waiting for it to finish.

This is where shell starts becoming closely connected with **process management**.

---

# 16. Shell and Unix philosophy

Shell became especially important in Unix.

Unix provided many small programs that each do one thing well:

```text
ls
cat
grep
sort
uniq
wc
head
tail
cut
sed
awk
```

The shell connects these programs together.

For example:

```bash
cat access.log | grep "ERROR" | sort | uniq -c
```

Conceptually:

```text
access.log
    ↓
   cat
    ↓
  grep
    ↓
  sort
    ↓
  uniq
    ↓
statistics
```

This is one of the fundamental ideas behind Unix:

> **Small programs + composability + pipes = powerful automation**

---

# 17. Important shells

There have been many shells.

| Shell  | Description                                 |
| ------ | ------------------------------------------- |
| `sh`   | Original Bourne-style shell interface       |
| `bash` | Bourne Again Shell; extremely common        |
| `ksh`  | KornShell                                   |
| `csh`  | C Shell                                     |
| `tcsh` | Enhanced C Shell                            |
| `zsh`  | Modern interactive shell with many features |
| `fish` | User-friendly modern shell                  |

For learning Linux/server development, I recommend understanding **POSIX shell concepts** and becoming comfortable with **Bash**.

---

# 18. Shell's historical importance

Shell is particularly important in the history of programming because it sits between **operating systems and programming languages**.

A simplified historical picture is:

```text
Machine language
       ↓
Assembly
       ↓
High-level languages
       ↓
Operating systems
       ↓
Shell
       ↓
Shell scripting
```

Unix made the shell especially influential.

You can think of it as a **glue language**:

```text
       ┌── gcc
       │
       ├── git
Shell ─┼── Java
       │
       ├── Python
       │
       ├── Docker
       │
       └── system utilities
```

It doesn't replace Java, C, Python, etc.

Instead, it **orchestrates them**.

For example:

```bash
javac Main.java
java Main
```

or:

```bash
mvn test
```

or:

```bash
docker build .
docker run myapp
```

These are all examples of using a shell to control other software.

---

# 19. Shell vs C

Since you're studying the history of programming languages, this distinction is useful.

### C

C is primarily a **general-purpose programming language**:

```c
int main() {
    printf("Hello\n");
}
```

It is commonly used for:

* operating systems
* system software
* embedded systems
* compilers
* libraries

### Shell

Shell is primarily a **command interpreter and automation language**:

```bash
#!/bin/bash

gcc main.c -o main
./main
```

It is particularly good at:

* running programs
* connecting programs
* manipulating files
* process management
* system administration
* automation
* deployment

So:

```text
C → build software

Shell → combine and control software
```

This is not an absolute distinction, but it's a useful mental model.

---

# 20. Shell's role in modern backend development

For your **Java backend** learning, you definitely should learn shell.

You don't need to become a shell-language expert, but you should be comfortable with:

```bash
pwd
ls
cd
mkdir
cp
mv
rm
cat
less
head
tail
grep
find
sort
ps
kill
chmod
curl
ssh
```

and especially:

```bash
|
>
>>
<
$
$PATH
$(...)
*
&&
||
;
&
```

Then learn basic Bash scripting:

```bash
#!/bin/bash

for file in *.java; do
    echo "Compiling $file"
done
```

This will become useful when you work with:

```text
Java
  ↓
Maven
  ↓
Git
  ↓
Linux
  ↓
Docker
  ↓
CI/CD
  ↓
Cloud servers
```

---

## The big picture

I would place **Shell** in your CS history map like this:

```text
                 Programming
                     │
       ┌─────────────┴─────────────┐
       ↓                           ↓
General-purpose              System interaction
languages                         │
C / Fortran / BASIC              Shell
C++ / Java / Python                │
       │                           │
       └─────────────┬─────────────┘
                     ↓
                 Operating
                  System
                     │
              ┌──────┴──────┐
              ↓             ↓
            Kernel        Utilities
              ↑             ↑
              └──── Shell ──┘
```

The key idea to remember is:

> **A shell is a command interpreter that provides a programmable interface to the operating system and, especially in Unix, lets you combine many small programs into larger workflows.**

Given your recent exploration of **FORTRAN → COBOL → ALGOL → BASIC → C → Shell**, the next useful step is to understand **Unix itself**, because Unix and the Unix shell evolved together and explain why shell became such an important part of modern programming.
