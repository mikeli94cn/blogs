`gdb` (GNU Debugger) is the standard debugger for C and C++ programs on Linux. It allows you to **pause a running program, inspect variables, examine memory, trace execution, and find bugs**.

The typical workflow is:

```text
Write C code
     |
     v
Compile with debugging information (-g)
     |
     v
Start gdb
     |
     v
Set breakpoints
     |
     v
Run program
     |
     v
Inspect / step / modify
```

---

# 1. Install GDB

## Ubuntu / Debian

```bash
sudo apt update
sudo apt install gdb
```

Check:

```bash
gdb --version
```

Example:

```
GNU gdb (Ubuntu) 15.0
```

---

# 2. Write a simple C program

Create `sum.c`:

```c
#include <stdio.h>

int main()
{
    int sum = 0;

    for (int i = 1; i <= 10; i++)
    {
        sum += i;
    }

    printf("sum = %d\n", sum);

    return 0;
}
```

---

# 3. Compile with debugging information

Normally:

```bash
gcc sum.c -o sum
```

This produces an executable, but debugging information is missing.

For gdb:

```bash
gcc -g sum.c -o sum
```

The `-g` option tells GCC:

> Keep source code information inside the executable.

Now gdb can show:

* source lines
* variable names
* function names

---

# 4. Start gdb

Run:

```bash
gdb ./sum
```

You will see:

```
GNU gdb ...
(gdb)
```

You are now inside the debugger.

---

# 5. Run the program

Inside gdb:

```
(gdb) run
```

or:

```
(gdb) r
```

Output:

```
sum = 55
```

The program finished.

---

# 6. Set a breakpoint

A breakpoint tells gdb:

> Stop execution here.

For example, stop at `main`:

```
(gdb) break main
```

or:

```
(gdb) b main
```

Output:

```
Breakpoint 1 at 0x1141: file sum.c, line 5.
```

Now:

```
(gdb) run
```

Program stops:

```
Breakpoint 1, main () at sum.c:5

5       int sum = 0;
```

---

# 7. Step through the program

## Execute one source line

```
(gdb) next
```

or:

```
(gdb) n
```

Example:

Before:

```c
int sum = 0;
```

Press:

```
n
```

Next:

```c
for (int i = 1; i <= 10; i++)
```

---

## Step into a function

If you have:

```c
calculate();
```

use:

```
(gdb) step
```

or:

```
(gdb) s
```

`step` enters the function.

`next` skips over it.

---

# 8. View variables

At any breakpoint:

```
(gdb) print sum
```

or:

```
(gdb) p sum
```

Output:

```
$1 = 0
```

After stepping:

```
(gdb) p sum
```

Output:

```
$2 = 1
```

---

Multiple variables:

```
(gdb) p i
(gdb) p sum
```

---

# 9. Automatically display variables

Instead of typing:

```
p i
```

every time:

```
(gdb) display i
```

Now every step shows:

```
1: i = 3
```

Remove:

```
(gdb) undisplay 1
```

---

# 10. Examine memory

C programmers often need this.

Example:

```c
int x = 100;
int *p = &x;
```

Print address:

```
(gdb) p &x
```

Example:

```
$1 = 0x7fffffffe12c
```

Examine memory:

```
(gdb) x 0x7fffffffe12c
```

Output:

```
0x7fffffffe12c: 100
```

---

Useful formats:

```
x/x address     hexadecimal
x/d address     decimal
x/c address     character
x/s address     string
```

Example:

```
(gdb) x/s str
```

---

# 11. View call stack

Suppose:

```c
void a()
{
    b();
}

void b()
{
    c();
}
```

At a crash:

```
(gdb) backtrace
```

or:

```
(gdb) bt
```

Output:

```
#0 c()
#1 b()
#2 a()
#3 main()
```

This is one of the most useful debugging commands.

---

# 12. Debug a segmentation fault

Example:

```c
#include <stdio.h>

int main()
{
    int *p = NULL;

    *p = 10;

    return 0;
}
```

Compile:

```bash
gcc -g crash.c -o crash
```

Run:

```bash
gdb ./crash
```

Inside:

```
(gdb) run
```

You get:

```
Program received signal SIGSEGV
```

Now:

```
(gdb) bt
```

shows:

```
#0 main() at crash.c:7
```

You immediately know:

```c
*p = 10;
```

caused the crash.

---

# 13. Conditional breakpoints

Example:

```c
for(int i=0;i<1000;i++)
```

Stop only when:

```c
i == 500
```

GDB:

```
(gdb) break sum.c:7 if i==500
```

Very useful for large loops.

---

# 14. Watch variables

A watchpoint stops when a variable changes.

Example:

```
(gdb) watch sum
```

Now whenever:

```c
sum = something;
```

happens:

```
Old value = 10
New value = 15
```

---

# 15. Useful GDB commands

| Command          | Short | Meaning              |
| ---------------- | ----- | -------------------- |
| `run`            | `r`   | Start program        |
| `break`          | `b`   | Set breakpoint       |
| `next`           | `n`   | Next line            |
| `step`           | `s`   | Step into function   |
| `continue`       | `c`   | Continue running     |
| `print`          | `p`   | Print variable       |
| `list`           | `l`   | Show source          |
| `backtrace`      | `bt`  | Show call stack      |
| `info locals`    |       | Show local variables |
| `info registers` |       | CPU registers        |
| `quit`           | `q`   | Exit                 |

---

# 16. Debugging a program with command line arguments

Suppose:

```c
int main(int argc, char **argv)
```

Run normally:

```bash
./program hello
```

In gdb:

```
(gdb) set args hello
(gdb) run
```

---

# 17. Debugging optimized programs

Normally:

```bash
gcc -g program.c -o program
```

For debugging, avoid optimization:

```bash
gcc -g -O0 program.c -o program
```

because:

```text
-O2 / -O3
```

may rearrange code and make debugging confusing.

---

# 18. GDB with Vim

Since you use Vim, you may like:

* `vimspector`
* `coc-dap`
* `termdebug`

Vim's built-in debugger:

```vim
:Termdebug ./sum
```

Then you can use:

```vim
:Break main
```

and step inside Vim.

---

# 19. The mental model of GDB

Think of your C program as:

```
CPU
 |
 | executes instructions
 |
Program counter (PC)
 |
 v
current line
```

GDB allows you to control the CPU:

```
pause CPU
   |
   +-- inspect registers
   |
   +-- inspect memory
   |
   +-- inspect variables
   |
   +-- change values
   |
continue CPU
```

This is why learning GDB is valuable: it connects **C programming** to how the computer actually executes instructions. It is also a good bridge from C to assembly language and concepts like registers, memory, and stack frames.
