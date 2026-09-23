Implementing **bubble sort in MIXAL** is a very good exercise because it forces you to think like an early computer programmer:

* no arrays as a built-in feature
* no `for` loop
* no function calls
* no objects
* no automatic swapping

You must manually manage:

* memory addresses
* loops
* comparisons
* swaps

Let's sort an array of integers in **ascending order**.

Example:

```
Before:

5  2  9  1  3

After:

1  2  3  5  9
```

genui{"computing_fundamentals_algorithms":{"type_id":"BUBBLE_SORT"}}

---

# 1. Bubble sort algorithm

The C version:

```c
for (i = n-1; i > 0; i--)
{
    for (j = 0; j < i; j++)
    {
        if (a[j] > a[j+1])
        {
            swap(a[j], a[j+1]);
        }
    }
}
```

The idea:

```
Pass 1:

5 2 9 1 3

compare 5 and 2
swap

2 5 9 1 3

compare 5 and 9
no swap

2 5 9 1 3

compare 9 and 1
swap

2 5 1 9 3

compare 9 and 3
swap

2 5 1 3 9


Largest number moves to the end.
```

---

# 2. MIX architecture we need

MIX has:

| Register | Purpose                   |
| -------- | ------------------------- |
| A        | accumulator               |
| X        | extra arithmetic register |
| I1-I6    | index registers           |
| J        | jump register             |

For arrays, MIX index registers are very useful.

Example:

```
ARRAY:

Address     Value

2000        5
2001        2
2002        9
2003        1
2004        3
```

Index register:

```
I1 = current position
```

Then:

```
2000 + I1
```

gives the current element.

---

# 3. MIXAL bubble sort program

`bubble.mixal`

```asm
        ORIG    1000


START   ENTA    4
        STA     OUTER       ; outer loop counter = n-1


OUTER_LOOP

        ENTA    0
        STA     INNER       ; inner index = 0


INNER_LOOP

        LDA     ARRAY,1    ; load array[I1]
        CMPA    ARRAY+1,1  ; compare array[I1] with array[I1+1]

        JLE     NO_SWAP


; --------------------
; swap two elements
; --------------------

        LDA     ARRAY,1
        STA     TEMP

        LDA     ARRAY+1,1
        STA     ARRAY,1

        LDA     TEMP
        STA     ARRAY+1,1


NO_SWAP:

        INC1    1          ; I1++

        LDA     INNER
        ADD     ONE
        STA     INNER


        CMP     OUTER
        JLE     INNER_LOOP


        DEC     OUTER
        JG      OUTER_LOOP


        HLT



; --------------------
; data
; --------------------

ARRAY   CON     5
        CON     2
        CON     9
        CON     1
        CON     3


OUTER  CON     0
INNER  CON     0

TEMP   CON     0

ONE    CON     1


        END     START
```

---

# 4. How the MIX program works

## Step 1: Outer loop

Initially:

```
OUTER = 4
```

because:

```
5 elements
4 comparisons needed
```

Equivalent C:

```c
for(i=4;i>0;i--)
```

---

## Step 2: Inner loop

Set:

```
I1 = 0
```

Now compare:

```
ARRAY[0]
ARRAY[1]
```

MIX:

```asm
LDA ARRAY,1
CMPA ARRAY+1,1
```

means:

```
load ARRAY[I1]

compare ARRAY[I1+1]
```

---

# 5. Swapping in MIXAL

In C:

```c
temp=a[j];
a[j]=a[j+1];
a[j+1]=temp;
```

MIX:

```asm
LDA ARRAY,1
STA TEMP
```

means:

```
TEMP = ARRAY[j]
```

Then:

```asm
LDA ARRAY+1,1
STA ARRAY,1
```

means:

```
ARRAY[j]=ARRAY[j+1]
```

Finally:

```asm
LDA TEMP
STA ARRAY+1,1
```

means:

```
ARRAY[j+1]=TEMP
```

---

# 6. Memory after execution

Initially:

```
Address    Value

2000       5
2001       2
2002       9
2003       1
2004       3
```

After sorting:

```
Address    Value

2000       1
2001       2
2002       3
2003       5
2004       9
```

---

# 7. Compare with C

C:

```c
if(a[j] > a[j+1])
{
    swap();
}
```

MIXAL:

```asm
LDA ARRAY,1
CMPA ARRAY+1,1
JLE NO_SWAP

; swap manually
```

The algorithm is identical.

The difference is that C hides many details:

C:

```
a[j]
```

MIXAL:

```
calculate memory address
load memory
compare registers
store memory
```

---

# 8. Why bubble sort is a good MIXAL exercise

Bubble sort teaches almost everything needed for assembly programming:

| Concept      | MIXAL example                |
| ------------ | ---------------------------- |
| Array        | consecutive memory locations |
| Index        | I1 register                  |
| Loop         | conditional jump             |
| Compare      | CMPA                         |
| Swap         | LOAD + STORE                 |
| Variable     | memory address               |
| Pointer idea | address calculation          |

It is actually very close to how a compiler translates a C bubble sort into machine instructions.

The path is:

```
C bubble sort

        |
        v

Compiler

        |
        v

Assembly

        |
        v

Machine instructions

        |
        v

CPU executes
```

Writing bubble sort in MIXAL is therefore an excellent way to understand what happens underneath a C or Java program.
