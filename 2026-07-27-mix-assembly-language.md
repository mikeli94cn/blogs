GNU MIX Development Kit (MDK) is an implementation of Donald Knuth's **MIX computer**. You write programs in **MIXAL** (MIX Assembly Language), assemble them, and run them with the MIX virtual machine.

Let's write a simple MIXAL program that calculates:

[
1 + 2 + 3 + \dots + 10 = 55
]

## 1. Create a MIXAL source file

Create a file called `sum10.mixal`:

```asm
        ORIG    1000

START   ENTA    0          ; A = 0 (sum)
        STA     SUM        ; SUM = 0

        ENTA    1          ; A = 1
        STA     I          ; I = 1

LOOP    LDA     SUM        ; A = current sum
        ADD     I          ; A = sum + i
        STA     SUM        ; save new sum

        LDA     I           ; A = i
        ADD     ONE         ; A = i + 1
        STA     I           ; i++

        CMP     TEN         ; compare i with 10
        JLE     LOOP        ; if i <= 10, continue

        HLT                 ; stop program


SUM     CON     0
I       CON     0
ONE     CON     1
TEN     CON     10

        END     START
```

---

## 2. Understand the registers

MIX has several registers. The important one here is:

* **A register**: accumulator (used for arithmetic)
* **memory locations**:

  * `SUM` stores the running total
  * `I` stores the current number

The loop does this:

```
SUM = 0
I = 1

SUM = SUM + I
I = I + 1

repeat while I <= 10
```

The values look like:

```
Iteration     I       SUM
---------------------------
start         1        0
1             1        1
2             2        3
3             3        6
4             4       10
5             5       15
6             6       21
7             7       28
8             8       36
9             9       45
10           10       55
```

At the end:

```
SUM = 55
```

---

## 3. Assemble the program

With GNU MDK, you normally use `mixasm`:

```bash
mixasm sum10.mixal
```

This produces an object file, usually:

```
sum10.mix
```

---

## 4. Run the program

Run it with the MIX simulator:

```bash
mixvm sum10.mix
```

Inside `mixvm`, you can inspect memory:

```
mixvm> run
mixvm> memory 1000
```

or inspect the variable:

```
mixvm> memory SUM
```

You should see:

```
55
```

---

## 5. A shorter version using a loop counter

MIXAL can also do this more compactly:

```asm
        ORIG 1000

        ENTA 0
        STA SUM

        ENTA 1
        STA I

LOOP    LDA SUM
        ADD I
        STA SUM

        INC I,1
        LDA I
        CMP TEN
        JLE LOOP

        HLT

SUM     CON 0
I       CON 0
TEN     CON 10

        END
```

---

This small program demonstrates several fundamental assembly concepts:

* **variables are memory addresses**
* **registers hold temporary values**
* **loops are created with jumps**
* **arithmetic happens directly on registers**
* **there is no built-in `for` loop or `sum()` function**

MIX programming is very close to how early computers were programmed: every operation (load, add, store, compare, jump) is explicitly controlled by the programmer.
