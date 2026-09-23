The advancement of **C compared with FORTRAN** is mainly about **purpose, abstraction level, and control over the computer**. FORTRAN was designed to make **scientific and mathematical programming easier**, while C was designed to create **system software** with both high-level structure and low-level hardware access.

A simple way to summarize:

> **FORTRAN brought mathematics closer to computers. C brought the computer itself closer to programmers.**

Let's compare their historical roles.

---

## 1. Historical background

### FORTRAN (1957)

Fortran was created at IBM by a team led by John Backus.

The goal:

> "Allow scientists and engineers to write mathematical programs without writing assembly language."

Before FORTRAN:

```asm
LOAD  A
ADD   B
STORE C
```

After FORTRAN:

```fortran
C = A + B
```

This was revolutionary.

Scientists could write formulas directly.

---

### C (1972)

C was created by Dennis Ritchie at Bell Labs.

The goal:

> "Create a language suitable for writing operating systems."

The first major use was rewriting Unix.

Instead of:

```asm
MOV R1, VALUE
ADD R1, NUMBER
```

C allowed:

```c
value = value + number;
```

but still allowed direct memory manipulation:

```c
*p = 100;
```

---

# 2. Main difference: abstraction

## FORTRAN: formula-oriented

FORTRAN thinks like a mathematician:

```fortran
A = B + C
```

Arrays and numerical operations are central:

```fortran
DO I = 1, 100
    A(I) = B(I) + C(I)
END DO
```

It is excellent for:

* physics simulations
* weather models
* numerical calculations
* engineering

---

## C: machine-oriented

C thinks more like a computer:

```c
for (int i = 0; i < 100; i++) {
    a[i] = b[i] + c[i];
}
```

C exposes:

* memory addresses
* pointers
* bytes
* hardware

Example:

```c
int x = 10;

int *p = &x;

printf("%d", *p);
```

Here you can directly manipulate memory.

---

# 3. Memory control

This is probably the biggest advancement.

## FORTRAN (early versions)

FORTRAN hides memory details:

```fortran
INTEGER A

A = 10
```

The compiler decides where `A` lives.

---

## C

C gives you direct memory control:

```c
int a = 10;

printf("%p", &a);
```

You can get the address:

```
0x7ffd1234
```

You can allocate memory manually:

```c
int *array;

array = malloc(100 * sizeof(int));
```

and release it:

```c
free(array);
```

This made C suitable for:

* operating systems
* device drivers
* embedded systems

---

# 4. Data structures

FORTRAN originally focused on arrays.

Example:

```fortran
REAL A(100)
```

C introduced a more general way:

## Structures

```c
struct Student {
    char name[50];
    int age;
    float score;
};
```

You can create complex data models:

```c
struct Student mike;
```

This was a huge step toward modern programming.

---

# 5. Portability

Before C:

A program written for IBM mainframes:

```
IBM machine
     |
     X
different computer
```

often needed rewriting.

C introduced a portable system programming model:

```c
#include <stdio.h>

int main()
{
    printf("Hello");
}
```

The same source could compile on:

* Unix
* Windows
* embedded systems
* supercomputers

This was a major reason Unix spread.

---

# 6. Compilation model

FORTRAN:

```
FORTRAN source
       |
       v
FORTRAN compiler
       |
       v
Machine code
```

Mostly for scientific programs.

---

C:

```
C source
    |
    v
Preprocessor
    |
    v
Compiler
    |
    v
Assembler
    |
    v
Linker
    |
    v
Executable
```

C introduced a very powerful ecosystem:

* header files
* libraries
* separate compilation
* linking

Example:

```c
#include <stdio.h>
```

The program can reuse existing components.

---

# 7. Why C replaced many uses of FORTRAN

Before C:

Operating systems:

```
Assembly
```

Scientific computing:

```
FORTRAN
```

Business:

```
COBOL
```

After C:

```
Operating systems      -> C
Compilers              -> C
Databases              -> C
Network software       -> C
Embedded systems       -> C
```

C became a "general-purpose systems language."

---

# 8. But FORTRAN did not disappear

This is important.

FORTRAN is still excellent for numerical computing.

Modern FORTRAN:

```fortran
do i=1,n
    c(i)=a(i)+b(i)
end do
```

can be extremely fast because compilers understand mathematical operations very well.

Many scientific libraries remain in FORTRAN:

* climate models
* aerospace simulation
* nuclear physics
* computational fluid dynamics

---

# 9. C vs FORTRAN comparison

| Feature               | FORTRAN              | C                  |
| --------------------- | -------------------- | ------------------ |
| Created               | 1957                 | 1972               |
| Main goal             | Scientific computing | System programming |
| Programming style     | Mathematical         | Machine-oriented   |
| Memory access         | Limited              | Direct             |
| Pointer support       | No (originally)      | Yes                |
| Structures            | Later added          | Built-in           |
| Operating systems     | Poor fit             | Excellent          |
| Embedded systems      | Limited              | Excellent          |
| Numerical computation | Excellent            | Good               |
| Portability           | Good                 | Excellent          |

---

# 10. Relationship to Java

Since you are learning Java, the evolution looks like:

```
Assembly
   |
   v
FORTRAN (1957)
   |
   v
C (1972)
   |
   v
C++ (1985)
   |
   v
Java (1995)
```

Each generation added more abstraction:

Assembly:

```asm
MOV AX, 10
```

C:

```c
x = 10;
```

Java:

```java
int x = 10;
```

Java hides:

* pointers
* manual memory allocation
* hardware details

while C exposes them.

---

A good analogy:

* **FORTRAN** = a calculator for scientists
* **C** = a toolbox for building machines
* **Java** = a managed factory system where many machine details are hidden

So the biggest advancement of C over FORTRAN was not that C could calculate better. It was that **C gave programmers a portable way to control computers themselves**, which enabled operating systems, networks, embedded devices, and eventually languages like C++ and Java.
