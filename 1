# Scheme

**Scheme** is a small, elegant, minimalist programming language in the **Lisp family**. It was created in **1975** by **Guy L. Steele Jr.** and **Gerald Jay Sussman** at MIT.

Scheme is especially important in computer science because it demonstrates the core ideas of **functional programming** with very little language syntax.

If Lisp is one of the historical foundations of functional programming, **Scheme is one of its cleanest and most educational descendants**.

---

## 1. Scheme's place in programming-language history

A simplified history looks like this:

```text
1950s
  │
  ├── FORTRAN
  │
1960s
  │
  ├── ALGOL
  ├── Lisp ──────────────┐
  │                      │
1970s                    │
  │                      │
  ├── C                  │
  ├── Smalltalk           │
  └── Scheme ◄────────────┘
       │
       ├── Racket
       ├── S-expression languages
       └── influence on modern languages
```

Scheme is a **Lisp dialect**.

Some important Lisp-family languages include:

```text
Lisp
│
├── Scheme
│   ├── R5RS
│   ├── R6RS
│   ├── R7RS
│   └── Racket
│
├── Common Lisp
│
├── Clojure
│
└── Emacs Lisp
```

---

# 2. What makes Scheme special?

Scheme was designed around a relatively small number of powerful ideas.

The philosophy is roughly:

> **Keep the language small, make the semantics clean, and let powerful abstractions emerge from simple primitives.**

This is quite different from languages such as C++ or Java, which have accumulated many features over decades.

A simplified Scheme language can be understood through:

```text
expressions
+
functions
+
lists
+
recursion
+
lexical scope
+
first-class procedures
+
closures
```

That's already enough to express surprisingly sophisticated programs.

---

# 3. The famous parentheses

The first thing you'll notice about Scheme is its syntax.

Java:

```java
int x = 10;
int y = x + 20;
```

Scheme:

```scheme
(define x 10)
(define y (+ x 20))
```

Scheme uses **prefix notation**:

```text
(operator operand1 operand2 ...)
```

So:

```scheme
(+ 1 2)
```

means:

```text
1 + 2
```

And:

```scheme
(* 3 4)
```

means:

```text
3 × 4
```

More complicated expressions become:

```scheme
(+ (* 2 3) (* 4 5))
```

which means:

```text
(2 × 3) + (4 × 5)
= 26
```

---

# 4. Why all the parentheses?

This is actually one of Lisp/Scheme's great ideas.

Consider normal mathematical notation:

```text
2 + 3 * 4
```

You need precedence rules:

```text
* before +
```

Scheme instead explicitly represents the structure:

```scheme
(+ 2 (* 3 4))
```

The structure is obvious:

```text
       +
      / \
     2   *
        / \
       3   4
```

This makes expressions naturally resemble **trees**.

And this leads to one of Lisp's most famous characteristics:

> **Code itself has a structure similar to the data structures the language manipulates.**

---

# 5. S-expressions

Scheme programs are written using **S-expressions**, short for **symbolic expressions**.

For example:

```scheme
(+ 1 2)
```

is an S-expression.

So is:

```scheme
(* (+ 1 2) 3)
```

And:

```scheme
(define (square x)
  (* x x))
```

The basic structure is:

```text
(expression
    expression
    expression
    ...)
```

This uniform syntax is one of the defining characteristics of Lisp-family languages.

---

# 6. Defining variables

Scheme uses `define`.

```scheme
(define x 10)
```

Then:

```scheme
(+ x 5)
```

returns:

```text
15
```

You can think of:

```scheme
(define x 10)
```

as roughly analogous to:

```java
int x = 10;
```

although the semantics aren't exactly the same.

---

# 7. Defining functions

A simple function:

```scheme
(define (square x)
  (* x x))
```

Then:

```scheme
(square 5)
```

returns:

```text
25
```

The equivalent idea in Java is:

```java
int square(int x) {
    return x * x;
}
```

Scheme's syntax is much more compact.

---

# 8. Functions are first-class values

This is one of the most important concepts.

In Scheme, a function can be treated like any other value.

You can:

```text
store it
↓
pass it
↓
return it
↓
compose it
```

For example:

```scheme
(define square
  (lambda (x)
    (* x x)))
```

Here:

```scheme
lambda
```

creates a function.

This is conceptually similar to Java:

```java
Function<Integer, Integer> square =
    x -> x * x;
```

This is where Scheme connects directly to the **functional programming** concepts we just discussed.

---

# 9. Higher-order functions

Because functions are values, Scheme naturally supports higher-order functions.

For example:

```scheme
(define (apply-twice f x)
  (f (f x)))
```

Now:

```scheme
(apply-twice square 2)
```

means:

```text
square(square(2))
```

which gives:

```text
16
```

The function `apply-twice` receives another function as an argument.

That's a **higher-order function**.

---

# 10. Lambda

`lambda` is one of the most important Scheme constructs.

For example:

```scheme
(lambda (x)
  (* x x))
```

means:

```text
function(x) {
    return x * x;
}
```

In modern Java:

```java
x -> x * x
```

So there is a direct conceptual connection:

```text
Scheme              Java

(lambda (x)         x ->
  (* x x))             x * x
```

This is one reason Scheme is useful for learning the foundations of functional programming.

---

# 11. Lists

Lists are fundamental in Lisp and Scheme.

For example:

```scheme
(define numbers '(1 2 3 4 5))
```

The `'` means that we're treating the expression as data rather than evaluating it.

Conceptually:

```text
(1 2 3 4 5)
```

is a list.

You can retrieve elements:

```scheme
(car numbers)
```

returns:

```text
1
```

And:

```scheme
(cdr numbers)
```

returns the remaining list:

```text
(2 3 4 5)
```

Historically, **car** and **cdr** are famous Lisp terminology.

---

# 12. `cons`, `car`, and `cdr`

Three fundamental Lisp operations are:

```text
cons
car
cdr
```

Think of a list:

```text
(1 2 3)
```

as:

```text
   pair
  /    \
 1     (2 3)
```

Then:

```scheme
(car '(1 2 3))
```

→ `1`

And:

```scheme
(cdr '(1 2 3))
```

→ `(2 3)`

And:

```scheme
(cons 0 '(1 2 3))
```

→

```text
(0 1 2 3)
```

These simple operations are fundamental to understanding the original Lisp model.

---

# 13. Recursion

Scheme strongly embraces recursion.

For example, factorial:

```scheme
(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))
```

Then:

```scheme
(factorial 5)
```

returns:

```text
120
```

Notice the structure:

```text
factorial(n)
    │
    ├── n = 0 → 1
    │
    └── otherwise
          n × factorial(n-1)
```

Recursion is particularly important in functional programming because functions can naturally describe recursive data structures and computations.

---

# 14. Conditional expressions

Scheme uses `if`:

```scheme
(if (> x 10)
    'big
    'small)
```

Conceptually:

```text
if condition
    then-expression
else
    else-expression
```

Scheme also has `cond` for multiple cases:

```scheme
(cond
  ((> x 100) 'large)
  ((> x 10)  'medium)
  (else 'small))
```

---

# 15. `map`, `filter`, and functional programming

Scheme makes functional programming very natural.

Suppose:

```scheme
(define numbers '(1 2 3 4 5))
```

Map:

```scheme
(map (lambda (x) (* x 2))
     numbers)
```

produces:

```text
(2 4 6 8 10)
```

Conceptually:

```text
[1, 2, 3, 4, 5]
        │
        │ x → x × 2
        ▼
[2, 4, 6, 8, 10]
```

This is exactly the same fundamental idea as Java's:

```java
numbers.stream()
       .map(x -> x * 2)
       .toList();
```

---

# 16. Lexical scoping

Scheme was historically important in making **lexical scoping** clear and central.

For example:

```scheme
(define (make-adder n)
  (lambda (x)
    (+ x n)))
```

Now:

```scheme
(define add5 (make-adder 5))
```

Then:

```scheme
(add5 10)
```

returns:

```text
15
```

Why does the returned function remember `n = 5`?

Because it forms a **closure**.

---

# 17. Closures

A closure is essentially:

```text
function
+
environment
```

In our example:

```scheme
(make-adder 5)
```

creates something conceptually like:

```text
closure
├── function: x → x + n
└── environment:
      n = 5
```

So later:

```scheme
(add5 10)
```

can still access `n`.

This concept appears in many modern languages:

```text
Scheme
JavaScript
Python
Java
C#
Kotlin
Rust
```

For example, Java:

```java
Function<Integer, Integer> add5 =
    x -> x + 5;
```

is using the same broad closure concept.

---

# 18. Scheme and macros

One of Scheme's most interesting features is its powerful **macro system**.

Because Scheme programs have a very uniform structure:

```scheme
(expression ...)
```

programs can be manipulated as structured data.

This enables programmers to extend the language itself.

Conceptually:

```text
Scheme
   ↓
program structure
   ↓
macro transformation
   ↓
new program structure
   ↓
evaluation
```

This is one of the major ideas inherited from Lisp.

It leads to a famous Lisp philosophy:

> **The language can be extended by the programmer.**

---

# 19. Scheme and metaprogramming

This makes Scheme historically important to **metaprogramming**.

Normal programming:

```text
program → data
```

Lisp/Scheme makes it natural to also think about:

```text
program ↔ data
```

This is closely related to the concept of **homoiconicity**.

Very roughly:

> A language is homoiconic when its program representation uses the language's own data structures.

Scheme's S-expression structure makes this particularly natural.

---

# 20. Scheme and education

Scheme became extremely famous in computer science education.

One of the most influential examples is the MIT textbook:

**Structure and Interpretation of Computer Programs (SICP)**.

It uses Scheme to teach fundamental programming concepts rather than teaching one particular industrial framework.

The emphasis is on:

```text
procedures
+
abstraction
+
recursion
+
higher-order functions
+
data abstraction
+
interpreters
+
program evaluation
```

This is why Scheme is more important historically and educationally than its relatively small industry usage might suggest.

---

# 21. Scheme vs Lisp

It's useful to understand the relationship:

```text
Lisp
 │
 ├── Common Lisp
 │
 ├── Scheme
 │
 │    └── Racket
 │
 ├── Clojure
 │
 └── Emacs Lisp
```

**Lisp** is the broader language family.

**Scheme** is one particular Lisp dialect.

Compared with Common Lisp, Scheme traditionally emphasizes:

* minimalism
* simplicity
* lexical scope
* elegant semantics
* functional programming
* educational use

---

# 22. Scheme vs Common Lisp

A simplified comparison:

|                        | Scheme            | Common Lisp       |
| ---------------------- | ----------------- | ----------------- |
| Philosophy             | Minimal           | Large/practical   |
| Syntax                 | Lisp/S-expression | Lisp/S-expression |
| Functional programming | Very strong       | Strong            |
| Macros                 | Powerful          | Powerful          |
| Language size          | Relatively small  | Much larger       |
| Education              | Very popular      | Less common       |
| Industry               | Limited           | Niche             |
| Historical importance  | Very high         | Very high         |

Both are important Lisp traditions.

---

# 23. Scheme vs Java

This comparison is useful for you because you're learning Java.

### Java

```java
class Calculator {
    int square(int x) {
        return x * x;
    }
}
```

Java naturally encourages:

```text
class
 ↓
object
 ↓
method
 ↓
state
```

### Scheme

```scheme
(define (square x)
  (* x x))
```

Scheme naturally encourages:

```text
function
 ↓
input
 ↓
output
```

So:

```text
Java
→ object-oriented thinking

Scheme
→ functional/procedural abstraction thinking
```

But modern Java combines both:

```java
numbers.stream()
       .filter(x -> x > 10)
       .map(x -> x * x)
       .toList();
```

This is very much influenced by functional programming ideas.

---

# 24. Why Scheme matters even if you don't use it professionally

This is probably the most important point for your learning.

You don't necessarily learn Scheme because you want a Scheme backend job.

You learn Scheme because it exposes fundamental programming concepts with very little syntactic noise.

For example:

```scheme
(define (square x)
  (* x x))
```

contains almost nothing except:

```text
function
parameter
expression
function call
```

Then:

```scheme
(map square numbers)
```

introduces:

```text
first-class functions
higher-order functions
data transformation
```

Then closures:

```scheme
(define (make-adder n)
  (lambda (x)
    (+ x n)))
```

introduce:

```text
lexical scope
environment
lambda
closure
```

So Scheme can be viewed as a **laboratory for understanding programming-language concepts**.

---

# 25. Scheme's place in your programming-language study

Given the language-history path you've been exploring, I'd place it like this:

```text
FORTRAN
   │
   │ numerical/scientific programming
   ▼
ALGOL
   │
   │ structured language design
   ├───────────────┐
   ▼               ▼
C              Simula
│                  │
│                  ▼
│              Smalltalk
│                  │
│                  ▼
│                  OOP
│
└───────────────────────────┐
                            │
Lisp ──→ Scheme              │
  │                          │
  │                          ▼
  └──────────────────→ Functional Programming
                             │
                ┌────────────┼─────────────┐
                ▼            ▼             ▼
              Haskell      Clojure       Scala
                │
                │
                ▼
        influence on modern
        programming languages
```

And this connects nicely with your previous questions:

```text
Lisp
  ↓
Scheme
  ↓
Functional Programming concepts
  ↓
Lambdas / closures / higher-order functions
  ↓
Java 8+
  ↓
Streams / lambdas / Optional
```

### The key idea to remember

> **Scheme is a minimalist Lisp dialect designed around a small set of powerful ideas—functions as first-class values, lexical scope, recursion, closures, lists, and uniform S-expression syntax. Its greatest importance is not its modern market share, but its enormous influence on functional programming and programming-language education.**
