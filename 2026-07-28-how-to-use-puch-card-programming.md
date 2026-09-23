![Image](https://images.openai.com/static-rsc-4/yrR00xyqwPNeG51CAcPr7KXNz-10hmnDbqIAKxzEBpyVKHjSG5iqscdXf-3FBXdUatZ2Kyvplz6U9wxkPPCIKWOTcM3C8ZHdnGuAVdfAxBvSDMYQX1ia9JHoHmEdOl_XJsJHuFbr8e_i7J9o5dkzBUbBPVPn7K_4Ok8WF6ZzEabIGs3T_zosHbVGKgPVC5dF?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/URKWHYKdjbjK54u3E5lZ9E_Z0AviaaAiPgqNdPBblFBKMaDvj2ePdC8mszfmF6qigeojsZ1hQg_t0ADjElPoDVTkGPoi6TVXogl7-tsaJhkFskf0-8SZXtIbrH34xmFS8mWWGX4ZpTUBnTqmQMthrme9PvcJB8O1d6qKiQl0lZkSEwV0bhkRatdNXiEwcmwl?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/ihvSd870iLK-5h2yvXsGytb8vXRGFoHm6C0GsfZgiwqPQEehmduU8BL_LUaY8A53mT9Ek-tz8kSNS-jsVI7KAUaJb8sOjG--GTIsZs8hFVAYyUrsi8Ts26yAydiDqImpd7ijmu5Blnt_PcJHdAzvM0a_aRKeKRk7BbbN490MYfz2oxMzQwFHA10Sulul6Eis?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/Aak8JtciCxrbOX4Jfypoz2EFVGP_d8zW6fZa8ZSNXBlyuhA5Rpr6lvuJMHFKvzklHrYm1VkzdPAGkviyh_FVgQsK-5UzF0h39kgkVh0R6i9WseNH7oDlrJCP43Uo15supDtkLMzCCBlpmKP_SFmdxfae68IduGmqWDregD66gjcXfN55W_lWBh1KSlLtOmld?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/XxRuiL69ksFOh6I5TaojX6PhWnlRnIEu-2zXHfJgfz7Ng6vQN7wOYyZ7zkdgAwcXpMLSmlocuwTuugoKiCH0kiHhJI_XVxxbQaF8qbpXxoEHbKyGotOYhiIFV5w4-1Di9Tl5nor670q6zhC_X_49aJXYqVWg97LtV-G4ONKmArk6QfiqfAbo4lYxyynn29GO?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/W4gY8SEXYWq4Y47acFVhrC-u7blfiS0d_z29kc1rM-wSZNcxdljGDBek0BS6PJ3uuIvGu5atffuk2dMTSiSx5qdWaengPb4Vz7NKnhBapb_OiGkn3Sq5DYf7qZfw8_oOKF3_SFoKj2VeiynZYh8CKtf-qMB3Tq4sdi3Y3yg7afgKVrY94fCOqkpKUROOXyV5?purpose=fullsize)

IBM punch cards are one of the most fascinating examples of how humans programmed computers before keyboards and screens became common. A punch card did **not store programs as text** like a modern file. Instead, it stored information as **patterns of holes** punched into paper.

The basic idea:

```
Human program
      |
      v
Assembly language / FORTRAN / COBOL
      |
      v
Punch card holes
      |
      v
Card reader
      |
      v
Computer memory
      |
      v
Execution
```

---

# 1. What is an IBM punch card?

The famous IBM card was an **80-column card**.

It looked like:

```
+------------------------------------------------+
| 1 2 3 4 5 6 ...                         80     |
|                                                |
|                                                |
|                                                |
+------------------------------------------------+
```

Each column represented **one character**.

For example:

```
Column:

  1 2 3 4 5 6 7 8 9 10

  H E L L O
```

means:

```
Column 1 -> H
Column 2 -> E
Column 3 -> L
Column 4 -> L
Column 5 -> O
```

A card could store 80 characters.

A large program might contain:

```
5000 lines of source code

= 5000 punch cards
= several boxes of cards
```

---

# 2. How does a card store a character?

A card has **12 possible punch positions** in each column:

```
Top:

12
11
0
1
2
3
4
5
6
7
8
9

Bottom
```

A character is represented by holes in these positions.

For example, the letter:

```
A
```

might be represented by:

```
12
|
*
|
0
|
*
|
1
|
2
|
3
|
...
```

The exact hole pattern depends on the IBM character encoding.

The computer does not see:

```
A
```

It sees:

```
hole pattern:

12-row punched
1-row punched
```

and translates that into:

```
binary code
```

---

# 3. How did programmers create cards?

They used a machine called a **keypunch**.

Example:

IBM 029 Card Punch

The programmer typed:

```
      MOVE X TO Y.
```

on the keypunch keyboard.

The machine punched:

```
Column 1:
M

Column 2:
O

Column 3:
V

Column 4:
E

...
```

The result was a physical card:

```
+--------------------------------+
| MOVE X TO Y.                   |
|                                |
| ||  | | ||   | |               |
| holes representing characters  |
+--------------------------------+
```

Many keypunch machines also printed the characters at the top of the card so humans could read them.

---

# 4. How did a program look?

Suppose you wrote a simple FORTRAN program:

```fortran
      PROGRAM TEST
      INTEGER SUM
      SUM = 1 + 2
      PRINT *, SUM
      END
```

It became cards:

```
Card 1:

      PROGRAM TEST


Card 2:

      INTEGER SUM


Card 3:

      SUM = 1 + 2


Card 4:

      PRINT *, SUM


Card 5:

      END
```

Each card was one source-code line.

The deck order mattered.

---

# 5. How did the computer read cards?

A card reader mechanically pulled cards through:

```
Card deck
    |
    v
+-----------+
| Card      |
| Reader    |
+-----------+
    |
    v
Electrical signals
    |
    v
Computer memory
```

The reader detected:

```
hole exists = 1
no hole = 0
```

So a column became something like:

```
101000101010
```

The computer converted this into a character:

```
101000101010
        |
        v
        A
```

---

# 6. How was a program executed?

A typical workflow in the 1960s:

## Step 1: Write source code

Example:

```
HELLO WORLD program
```

## Step 2: Punch cards

Create:

```
HELLO deck:

Card 1
Card 2
Card 3
...
```

## Step 3: Submit the deck

An operator put the cards into a card reader.

## Step 4: Compiler runs

For example:

```
FORTRAN compiler
```

The compiler itself was also stored on cards or magnetic tape.

It translated:

```
FORTRAN

      A = B + C

```

into machine instructions:

```
LOAD B
ADD C
STORE A
```

## Step 5: Execute

The computer produced output:

```
RESULT = 123
```

---

# 7. How did people debug programs?

This was very different from today.

Modern:

```
edit
compile
run
debug
```

Punch card era:

```
edit card
replace card
wait for computer time
run again
```

Common problems:

### Wrong card order

A dropped card:

```
Card 10
Card 11
Card 12
```

became:

```
Card 10
Card 12
Card 11
```

The program failed.

---

### Typing mistake

One wrong punch:

```
ADD X
```

became:

```
ADD Y
```

The whole program could fail.

---

### Missing card

A missing card was equivalent to deleting a line of code.

---

# 8. How does punch card relate to modern programming?

A punch card is actually very similar to a modern source file.

Today:

```
hello.java
```

contains:

```
public class Hello {
}
```

The file stores:

```
characters
     |
     v
binary bytes
     |
     v
disk
```

Punch cards:

```
source code
     |
     v
characters
     |
     v
holes
     |
     v
paper
```

The storage medium changed:

| Era         | Storage       |
| ----------- | ------------- |
| 1950s-1970s | Paper cards   |
| 1970s-1980s | Magnetic tape |
| 1980s-2000s | Floppy disks  |
| Today       | SSD/cloud     |

The fundamental idea is the same:

> A program is just data that represents instructions.

---

# 9. Connection to assembly language

Your previous MIXAL question is actually very close to punch-card programming.

A MIXAL program:

```asm
LDA VALUE
ADD ONE
STA RESULT
```

might originally have been typed onto cards:

```
Card 1:
LDA VALUE

Card 2:
ADD ONE

Card 3:
STA RESULT
```

The assembler reads those cards and converts them into machine code.

So the historical progression is:

```
Machine code (binary)
        |
        v
Assembly language
        |
        v
FORTRAN / COBOL
        |
        v
C
        |
        v
Java / Python
```

Punch cards were not a programming language. They were a **physical storage medium** for programs.

The most surprising thing is that early programmers were already using the same concepts we use today: source code, compilers, object files, linking, debugging, and execution — only the "file system" was a box of carefully ordered pieces of paper.
