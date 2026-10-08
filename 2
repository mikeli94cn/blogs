# Haskell

**Haskell** is a **statically typed, purely functional programming language** designed around mathematical functions, immutability, lazy evaluation, and a powerful type system.

If **Scheme** teaches you the fundamental ideas of functional programming with a small amount of syntax, **Haskell takes functional programming much further and makes it the central philosophy of the language**.

A useful way to place it is:

```text
Lisp
 │
 └── Scheme
       │
       └── functional programming ideas
                    │
                    ├── Haskell
                    ├── ML
                    ├── OCaml
                    ├── F#
                    └── ...
```

Haskell is one of the most important languages for understanding **advanced functional programming and programming-language theory**.

---

# 1. What is Haskell?

Haskell was named after the mathematician **Haskell Curry**, whose work on combinatory logic and functions influenced theoretical computer science.

The language was designed in the late 1980s by a committee of researchers who wanted a common language for **lazy, purely functional programming**.

The first Haskell standard appeared in **1990**.

The major characteristics are:

```text
Haskell
│
├── Functional
├── Pure
├── Statically typed
├── Strong type system
├── Type inference
├── Immutable by default
├── Lazy evaluation
├── Higher-order functions
├── Pattern matching
└── Algebraic data types
```

These features make Haskell very different from Java, C, or Python.

---

# 2. A simple Haskell program

Hello World:

```haskell
main :: IO ()
main = putStrLn "Hello, world!"
```

At first this looks strange compared with Java:

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, world!");
    }
}
```

Haskell deliberately separates **pure computation** from **effects such as I/O**.

That distinction is one of the most important ideas in Haskell.

---

# 3. Functions are the center

In Java, you naturally think about:

```text
class
  ↓
object
  ↓
method
```

In Haskell, you think much more directly about:

```text
function
  ↓
input
  ↓
output
```

For example:

```haskell
square x = x * x
```

Then:

```haskell
square 5
```

produces:

```text
25
```

The type can be written:

```haskell
square :: Int -> Int
```

Read this as:

> `square` takes an `Int` and produces an `Int`.

---

# 4. The type system

Haskell has an extremely powerful **static type system**.

For example:

```haskell
add :: Int -> Int -> Int
add x y = x + y
```

This means:

```text
add
 │
 ├── Int
 │
 ├── Int
 │
 └── Int
```

You can call:

```haskell
add 10 20
```

but something like:

```haskell
add "hello" 20
```

will be rejected by the type system.

The important point is that Haskell can catch many errors **before the program runs**.

---

# 5. Type inference

Interestingly, you often don't have to write the type.

You can simply write:

```haskell
square x = x * x
```

Haskell can infer its type.

For example, GHC can determine that:

```haskell
square :: Num a => a -> a
```

This is more general than:

```haskell
square :: Int -> Int
```

It essentially means:

> For any numeric type `a`, `square` takes an `a` and returns an `a`.

This combination of:

```text
strong static typing
+
type inference
```

is one of Haskell's major strengths.

---

# 6. Immutability

In ordinary imperative programming you often write:

```text
x = 10
x = 20
x = 30
```

where the variable represents changing state.

Haskell instead strongly favors immutable values.

For example:

```haskell
x = 10
```

means that `x` is associated with a value.

You don't normally think:

```text
x changes from 10 → 20
```

You think:

```text
10
↓
new computation
↓
20
```

This greatly reduces problems caused by shared mutable state.

---

# 7. Pure functions

This is probably the most important concept in Haskell.

A pure function:

```text
same input
    ↓
same output
```

and does not have uncontrolled side effects.

For example:

```haskell
square x = x * x
```

is pure.

If:

```text
square 5
```

returns `25` today, it must return `25` tomorrow.

There isn't some hidden global state that changes the answer.

---

# 8. Referential transparency

Because pure functions don't have hidden side effects, expressions can be replaced by their values.

For example:

```haskell
square 5
```

can be replaced with:

```haskell
25
```

without changing the meaning of the program.

This property is called **referential transparency**.

It makes programs easier to:

* reason about
* test
* optimize
* parallelize
* refactor

---

# 9. Higher-order functions

Haskell treats functions as first-class values.

A function can:

```text
be stored
be passed
be returned
be composed
```

For example:

```haskell
applyTwice f x = f (f x)
```

Then:

```haskell
applyTwice (+1) 5
```

gives:

```text
7
```

because:

```text
5
 ↓ +1
6
 ↓ +1
7
```

This is the same fundamental idea you saw in Scheme.

---

# 10. Lambda expressions

Haskell supports anonymous functions:

```haskell
\x -> x * x
```

This means:

```text
function x → x × x
```

Compare:

```text
Haskell       Scheme        Java

\x -> x*x     (lambda (x)   x -> x*x
                (* x x))
```

The syntax is different, but the concept is essentially the same.

---

# 11. Map, filter, and fold

Haskell is famous for elegant data transformations.

Suppose:

```haskell
numbers = [1, 2, 3, 4, 5]
```

### Map

```haskell
map (*2) numbers
```

produces:

```text
[2,4,6,8,10]
```

### Filter

```haskell
filter (>2) numbers
```

produces:

```text
[3,4,5]
```

### Fold

```haskell
sum numbers
```

conceptually reduces:

```text
[1,2,3,4,5]
      ↓
     15
```

These ideas correspond closely to Java Stream operations:

```java
numbers.stream()
       .filter(x -> x > 2)
       .map(x -> x * 2)
       .toList();
```

So learning Haskell helps you understand where concepts such as **map/filter/reduce** come from.

---

# 12. Pattern matching

Haskell makes pattern matching a fundamental programming technique.

For example:

```haskell
factorial 0 = 1
factorial n = n * factorial (n - 1)
```

Instead of writing:

```text
if n == 0
    ...
else
    ...
```

you define different cases based on the input pattern.

Another example:

```haskell
head' (x:_) = x
```

This says:

> If the list has a first element `x`, return it.

Pattern matching is extremely important in functional programming.

---

# 13. Lists

Lists are fundamental:

```haskell
[1, 2, 3, 4, 5]
```

Strings are actually lists of characters in traditional Haskell:

```haskell
"hello"
```

is conceptually related to:

```haskell
['h','e','l','l','o']
```

You can write:

```haskell
map (*2) [1,2,3,4]
```

and get:

```text
[2,4,6,8]
```

---

# 14. Algebraic Data Types

This is where Haskell becomes especially interesting.

You can define your own data types.

For example:

```haskell
data Shape
    = Circle Double
    | Rectangle Double Double
```

Now `Shape` can be:

```text
Circle radius
```

or:

```text
Rectangle width height
```

Then pattern matching can process them:

```haskell
area :: Shape -> Double
area (Circle r) = pi * r * r
area (Rectangle w h) = w * h
```

This is an extremely powerful way of modeling data.

---

# 15. Compare this with Java

In Java you might write:

```java
sealed interface Shape
    permits Circle, Rectangle {}

record Circle(double radius)
    implements Shape {}

record Rectangle(double width, double height)
    implements Shape {}
```

Then:

```java
double area(Shape shape) {
    return switch (shape) {
        case Circle c ->
            Math.PI * c.radius() * c.radius();

        case Rectangle r ->
            r.width() * r.height();
    };
}
```

Notice something interesting:

**Modern Java has moved toward several ideas that have existed naturally in functional languages for decades.**

In your Java studies, you've already encountered:

```text
sealed classes
records
pattern matching
lambdas
streams
```

These make modern Java considerably more functional than traditional Java.

---

# 16. Lazy evaluation

This is one of Haskell's defining features.

Most mainstream languages use **eager evaluation**:

```text
calculate the value now
```

Haskell is fundamentally **lazy**:

```text
calculate the value when it is actually needed
```

For example, conceptually:

```haskell
numbers = [1..]
```

represents:

```text
1, 2, 3, 4, 5, 6, ...
```

It is an infinite list.

You can ask:

```haskell
take 5 numbers
```

and get:

```text
[1,2,3,4,5]
```

Haskell doesn't need to construct the entire infinite list.

This is possible because of lazy evaluation.

---

# 17. Infinite data structures

This is one of the coolest demonstrations of Haskell.

You can define:

```haskell
naturals = [1..]
```

Then:

```haskell
take 10 naturals
```

produces:

```text
[1,2,3,4,5,6,7,8,9,10]
```

You can even define Fibonacci numbers as an infinite sequence.

The conceptual model is:

```text
infinite computation
        ↓
lazy evaluation
        ↓
only calculate what is needed
```

This idea has influenced many modern programming techniques, even outside Haskell.

---

# 18. Haskell and side effects

Here's something that initially seems strange.

If Haskell is pure, how can it:

```text
read a file?
print something?
access a database?
send an HTTP request?
```

The answer is **IO**.

For example:

```haskell
main :: IO ()
main = putStrLn "Hello"
```

Notice:

```haskell
IO ()
```

The type tells us that `main` is an **I/O action**.

Haskell doesn't pretend that I/O is pure.

Instead, it explicitly represents effects in the type system.

Conceptually:

```text
Pure computation
      │
      │
      ▼
   value

I/O computation
      │
      │
      ▼
   IO value
```

This separation is one of Haskell's most influential ideas.

---

# 19. Monads

This leads to one of Haskell's most famous—and initially intimidating—concepts:

**Monad**.

You will often hear jokes like:

> "A monad is just a monoid in the category of endofunctors..."

Don't start there. 😄

For practical understanding, think of a monad as a mechanism for **composing computations that have some context or effect**.

Examples include:

```text
Maybe     → computation that may fail
Either    → computation that may return an error
IO        → computation involving I/O
State     → computation carrying state
```

For example:

```haskell
safeDivide :: Double -> Double -> Maybe Double
```

could represent:

```text
division
   │
   ├── valid → Just result
   │
   └── zero denominator → Nothing
```

Haskell's monadic abstractions provide a systematic way to compose such computations.

This is an **advanced** topic, so don't make it your first Haskell lesson.

---

# 20. Type classes

Another major Haskell feature is **type classes**.

For example:

```haskell
class Eq a where
    (==) :: a -> a -> Bool
```

Conceptually, a type class says:

> A type belongs to this class if it provides certain operations.

This is somewhat analogous to Java interfaces, but the mechanisms and semantics are different.

For example:

```text
Java interface
       ≈
Haskell type class
```

is a useful beginner analogy, but **not an exact equivalence**.

Haskell type classes support powerful forms of generic programming.

---

# 21. Parametric polymorphism

Haskell also has very powerful generic types.

For example:

```haskell
length :: [a] -> Int
```

This means:

> `length` works on a list containing any type `a`.

So all of these are valid:

```text
length [1,2,3]
length ["a","b"]
length [True,False]
```

The same function works regardless of the element type.

This is called **parametric polymorphism**.

You can relate this to Java generics:

```java
<T> int length(List<T> list)
```

but Haskell's type system goes much further.

---

# 22. Haskell vs Scheme

Since you just learned Scheme, the comparison is useful.

|                        | Scheme            | Haskell                          |
| ---------------------- | ----------------- | -------------------------------- |
| Family                 | Lisp              | ML-influenced functional         |
| Typing                 | Dynamically typed | Statically typed                 |
| Type inference         | Limited           | Very powerful                    |
| Evaluation             | Generally eager   | Lazy                             |
| Pure?                  | No                | Yes, by design                   |
| Syntax                 | S-expressions     | Conventional mathematical syntax |
| Functions              | First-class       | First-class                      |
| Closures               | Yes               | Yes                              |
| Recursion              | Important         | Important                        |
| Pattern matching       | Less central      | Fundamental                      |
| Algebraic data types   | Not central       | Fundamental                      |
| Type classes           | No                | Yes                              |
| Education              | Very important    | Very important                   |
| Functional programming | Strong            | Central                          |

A useful mental distinction:

```text
Scheme
   ↓
"What are the fundamental ideas of Lisp and FP?"

Haskell
   ↓
"What happens when we build an entire language around
pure functional programming, strong types, and laziness?"
```

---

# 23. Haskell vs Java

This is especially relevant to your Java backend studies.

### Java

```text
Object
  ↓
State
  ↓
Methods
  ↓
Mutation
```

Modern Java also supports:

```text
Lambda
Stream
Optional
Record
Pattern matching
Sealed types
```

### Haskell

```text
Function
  ↓
Transformation
  ↓
Immutable value
  ↓
Composition
```

So:

```text
Java
→ OOP first, functional features added

Haskell
→ functional programming first
```

---

# 24. Haskell's influence on modern programming

Haskell itself is relatively niche compared with Java, Python, JavaScript, or C#.

But its **ideas are much more widespread than its market share**.

Haskell helped popularize and develop ideas around:

```text
pure functions
immutability
lazy evaluation
type inference
algebraic data types
pattern matching
type classes
monads
functional composition
```

You can see these ideas in modern languages:

```text
Haskell
   │
   ├── Scala
   ├── F#
   ├── Rust
   ├── Kotlin
   ├── Swift
   ├── modern C++
   ├── modern Java
   └── functional JavaScript
```

Not all of these features came directly from Haskell—many have multiple historical sources—but Haskell has been a major influence.

---

# 25. Why Haskell matters to a Java developer

You don't need Haskell to become a Java backend developer.

But learning **some Haskell concepts** can dramatically improve your understanding of Java's functional features.

For example:

```text
Haskell concept
       ↓
pure function
       ↓
Java lambda

Haskell
       ↓
higher-order function
       ↓
Java Stream

Haskell
       ↓
immutability
       ↓
Java records / immutable objects

Haskell
       ↓
pattern matching
       ↓
modern Java switch patterns

Haskell
       ↓
algebraic data types
       ↓
Java sealed types + records

Haskell
       ↓
Maybe
       ↓
Java Optional

Haskell
       ↓
Either-style error modeling
       ↓
Java Result/Either patterns in libraries
```

This is why functional programming is worth studying even if your final target is **Java backend development**.

---

# 26. A good Haskell learning path

If you want to actually learn Haskell, I'd recommend:

```text
Phase 1 — Basic syntax
│
├── expressions
├── functions
├── variables
├── lists
├── tuples
└── pattern matching
       ↓
Phase 2 — Functional programming
│
├── lambda
├── map
├── filter
├── fold
├── composition
└── higher-order functions
       ↓
Phase 3 — Type system
│
├── type signatures
├── type inference
├── polymorphism
├── algebraic data types
└── type classes
       ↓
Phase 4 — Advanced FP
│
├── Maybe
├── Either
├── Functor
├── Applicative
├── Monad
└── IO
       ↓
Phase 5 — Advanced Haskell
│
├── lazy evaluation
├── infinite data
├── modules
├── concurrency
└── parallelism
```

For your current learning path, **don't start with monads**. Start with functions, types, lists, pattern matching, `map`/`filter`/`fold`, and immutability.

---

## 27. The bigger programming-language picture

Since you've been studying programming-language history, Haskell fits into a particularly interesting lineage:

```text
1950s
FORTRAN
  │
  ▼
1960s
ALGOL
  │
  ├───────────────┐
  ▼               ▼
C             Functional lineage
                │
             Lisp
                │
             Scheme
                │
          ML / Miranda
                │
                ▼
             Haskell
                │
        ┌───────┼────────┐
        ▼       ▼        ▼
      Scala     F#      modern
                       FP ideas
```

So you can think of the historical progression as two major streams developing alongside each other:

```text
Imperative / OOP
────────────────────────────────────
FORTRAN → ALGOL → C → C++ → Java
                         ↘ C#
                         
Functional
────────────────────────────────────
Lisp → Scheme → ML → Haskell → modern FP
```

And modern languages increasingly **combine the two traditions**.

### The key idea

> **Haskell is a pure, statically typed, lazy functional language whose design makes functions, immutability, types, composition, and mathematical-style reasoning central to programming.**

If **Scheme is a minimalist laboratory for learning functional programming**, **Haskell is one of the clearest examples of what happens when functional programming becomes the foundation of an entire language.**
