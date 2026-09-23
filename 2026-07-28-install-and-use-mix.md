GNU MIX Development Kit (MDK) is a toolset for programming and running **Donald Knuth's MIX computer**. It includes:

* `mixasm` — MIXAL assembler (converts MIXAL assembly source into MIX binary)
* `mixvm` — MIX virtual machine simulator
* `gmixvm` — graphical MIX simulator (optional)
* `mixguile` — Scheme-based interface (optional)

The normal workflow is:

```
MIXAL source (.mixal)
          |
          | mixasm
          v
MIX binary (.mix)
          |
          | mixvm
          v
Virtual MIX computer execution
```

([GNU][1])

---

# 1. Install GNU MDK on Linux

## Ubuntu / Debian

First install build dependencies:

```bash
sudo apt update

sudo apt install \
    build-essential \
    flex \
    libglib2.0-dev \
    libreadline-dev
```

Optional GUI support:

```bash
sudo apt install \
    libgtk2.0-dev \
    libglade2-dev
```

MDK requires GLIB and Flex; readline and GTK are optional features. ([GNU][1])

---

## Download MDK source

Go to GNU MDK:

```bash
wget https://ftp.gnu.org/gnu/mdk/mdk-1.3.0.tar.gz
```

Extract:

```bash
tar xzf mdk-1.3.0.tar.gz

cd mdk-1.3.0
```

---

## Build

Run:

```bash
./configure

make
```

Install:

```bash
sudo make install
```

The standard GNU installation procedure is:

```text
./configure
make
make install
```

([GNU][2])

---

# 2. Verify installation

Check:

```bash
mixasm --version
```

Example:

```
GNU MIX Development Kit 1.3.0
```

Check simulator:

```bash
mixvm --version
```

You should now have:

```
/usr/local/bin/mixasm
/usr/local/bin/mixvm
```

---

# 3. Your first MIXAL program

Create:

```bash
hello.mixal
```

with:

```asm
        ORIG    1000

START   OUT     MSG(18)
        HLT

MSG     ALF     "HELLO "
        ALF     "WORLD"

        END     START
```

This prints:

```
HELLO WORLD
```

---

# 4. Assemble the program

Run:

```bash
mixasm hello.mixal
```

After successful assembly:

```
hello.mixal
hello.mix
```

The `.mix` file is the executable MIX machine code.

`mixasm` converts MIXAL source into this binary format. ([GNU][3])

---

# 5. Run the program

Execute:

```bash
mixvm hello.mix
```

You should see:

```
HELLO WORLD
```

---

# 6. Interactive debugging with mixvm

Start:

```bash
mixvm hello.mix
```

You enter the MIX debugger:

```
MIX >
```

Useful commands:

## Run

```
run
```

or:

```
r
```

---

## Show registers

```
reg
```

Example:

```
A: +0000000000
X: +0000000000
J: +0000000000
```

---

## Show memory

```
mem 1000
```

---

## Single-step execution

```
next
```

or:

```
n
```

---

## Set breakpoint

Example:

```
break START
```

Then:

```
run
```

The simulator stops at your instruction.

`mixvm` supports inspecting registers, memory, stepping, and breakpoints. ([GNU][1])

---

# 7. Example: calculate 1 + 2 + ... + 10

Create:

```
sum10.mixal
```

```asm
        ORIG    1000

START   ENTA    0
        STA     SUM

        ENTA    1
        STA     I


LOOP    LDA     SUM
        ADD     I
        STA     SUM


        LDA     I
        ADD     ONE
        STA     I


        CMP     TEN
        JLE     LOOP


        HLT


SUM     CON     0
I       CON     0
ONE     CON     1
TEN     CON     10


        END     START
```

Compile:

```bash
mixasm sum10.mixal
```

Run:

```bash
mixvm sum10.mix
```

After execution:

```
SUM = 55
```

Check:

```
mixvm> mem SUM
```

---

# 8. Using the graphical simulator

If you installed GTK support:

```bash
gmixvm hello.mix
```

You get:

* MIX registers
* memory viewer
* source code window
* step/run controls

([GNU][1])

---

# 9. Recommended learning order

Since you are learning Java, C, and now assembly, I suggest this order:

### Step 1 — Learn MIX architecture

Understand:

```
Memory
Registers
Accumulator
Index registers
Jump instructions
```

### Step 2 — Learn basic MIXAL instructions

Start with:

| Instruction | Meaning            |
| ----------- | ------------------ |
| `LDA`       | Load accumulator   |
| `STA`       | Store accumulator  |
| `ADD`       | Addition           |
| `SUB`       | Subtraction        |
| `CMP`       | Compare            |
| `JMP`       | Jump               |
| `JLE`       | Jump if less/equal |
| `HLT`       | Stop               |

### Step 3 — Write small programs

Examples:

1. Sum 1..10
2. Factorial
3. Fibonacci
4. Array maximum
5. Sorting

### Step 4 — Debug with `mixvm`

Watch:

```
register changes
memory changes
program counter
```

---

MIX is a great bridge between **high-level languages like Java/C** and **real CPU architecture** because every Java statement eventually becomes operations similar to these: load data, calculate, store results, and branch.

[1]: https://www.gnu.org/software/mdk/manual/mdk.html?utm_source=chatgpt.com "GNU MIX Development Kit (mdk)"
[2]: https://www.gnu.org/s/mdk/manual/html_node/Basic-installation.html?utm_source=chatgpt.com "Basic installation (GNU MIX Development Kit (mdk))"
[3]: https://www.gnu.org/s/mdk/manual/html_node/Invoking-mixasm.html?utm_source=chatgpt.com "Invoking mixasm (GNU MIX Development Kit (mdk))"
