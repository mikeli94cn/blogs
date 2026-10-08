# ML (Meta Language)

**ML** is a family of programming languages and language designs that became one of the major foundations of **modern statically typed functional programming**.

If we put the languages you've just been studying into a historical chain:

```text
Lisp
  │
  └── Scheme
        │
        │ functional programming
        ▼
       ML
        │
        ├── Standard ML
        ├── OCaml
        ├── F#
        └── influences Haskell
```

ML is particularly important because it combined **functional programming with a powerful static type system and type inference**.

---

# 1. What does "ML" mean?

ML originally stood for **Meta Language**.

It was developed in the **1970s** by **Robin Milner** and colleagues at the University of Edinburgh.

The original purpose was actually related to **theorem proving**—specifically the Edinburgh LCF system.

But ML turned out to be useful as a general-purpose programming language.

Its ideas became extremely influential.

The major ML-family languages include:

```text
ML
│
├── Standard ML (SML)
│
├── OCaml
│
├── F#
│
├── Moscow ML
│
└── other descendants
```

---

# 2. Why ML is historically important

ML occupies an important position between several programming traditions.

```text
                 Functional programming
                         │
                         ▼
                       Lisp
                         │
                       Scheme
                         │
                         ▼
                         ML
                         │
          ┌──────────────┼──────────────┐
          ▼              ▼              ▼
     Standard ML       OCaml           F#
          │              │              │
          └──────────────┼──────────────┘
                         │
                         ▼
              Modern typed FP
```

ML introduced or popularized several ideas that are now considered fundamental:

* **static typing**
* **type inference**
* **parametric polymorphism**
* **algebraic data types**
* **pattern matching**
* **higher-order functions**
* **modules**
* **type-directed programming**

Haskell later developed many of these ideas even further.

---

# 3. ML's core philosophy

You can think of ML as combining:

```text
Functional programming
        +
Strong static typing
        +
Type inference
        +
Pattern matching
        +
Algebraic data types
```

The result is a language where you can write relatively concise functional programs while still getting strong compile-time checking.

For example:

```ml
fun square x = x * x;
```

The compiler can infer:

```text
square : int -> int
```

without you explicitly declaring the type.

That's a major idea.

---

# 4. ML and Lisp/Scheme

You just learned Scheme, so this comparison is useful.

Scheme:

```scheme
(define (square x)
  (* x x))
```

ML:

```ml
fun square x =
    x * x;
```

Haskell:

```haskell
square x = x * x
```

They are expressing essentially the same mathematical function:

```text
square(x) = x × x
```

But the languages have different philosophies.

### Scheme

```text
simple syntax
+
dynamic typing
+
Lisp/S-expression model
```

### ML

```text
functional programming
+
static typing
+
type inference
+
pattern matching
```

### Haskell

```text
ML-style typing
+
pure functional programming
+
lazy evaluation
+
type classes
```

So a useful historical picture is:

```text
Lisp/Scheme
     │
     │ functional ideas
     ▼
    ML
     │
     │ typed functional programming
     ▼
  Haskell
```

This is simplified—these languages have multiple independent influences—but it's a useful learning model.

---

# 5. A simple ML program

A classic ML function:

```ml
fun add x y =
    x + y;
```

You can use:

```ml
add 10 20;
```

Result:

```text
30
```

Its inferred type is:

```text
add : int -> int -> int
```

This notation can initially look strange.

It means:

```text
add : int → (int → int)
```

In other words, functions are naturally **curried**.

---

# 6. Currying

Suppose:

```ml
fun add x y =
    x + y;
```

Conceptually, this is:

```text
add
 │
 ├── takes x
 │
 ▼
function
 │
 ├── takes y
 │
 ▼
result
```

So:

```ml
add 10
```

produces a new function:

```text
y → 10 + y
```

Then:

```ml
(add 10) 20
```

produces:

```text
30
```

This is called **currying**.

It is extremely important in functional programming.

---

# 7. Type inference

This is probably ML's most famous contribution.

You can write:

```ml
fun double x =
    x + x;
```

You don't have to write:

```ml
int → int
```

The compiler figures it out.

For example:

```ml
fun first x =
    #1 x;
```

can work with different types of pairs.

The compiler can infer something like:

```text
first : 'a * 'b -> 'a
```

Here:

```text
'a
'b
```

represent type variables.

This is **parametric polymorphism**.

---

# 8. Parametric polymorphism

Consider a function that returns the first element of a pair:

```ml
fun first (x, y) =
    x;
```

Its type can be:

```text
'a * 'b -> 'a
```

Meaning:

> For any types `'a` and `'b`, give me a pair containing those types, and I'll return the first one.

So:

```ml
first (10, "hello")
```

returns:

```text
10
```

while:

```ml
first ("hello", true)
```

returns:

```text
"hello"
```

The same function works for many types.

---

# 9. Lists

ML has lists:

```ml
val numbers = [1, 2, 3, 4, 5];
```

You can map a function over them:

```ml
List.map (fn x => x * 2) numbers;
```

Result:

```text
[2, 4, 6, 8, 10]
```

This should look familiar after studying Haskell:

```haskell
map (*2) [1,2,3,4,5]
```

And Java:

```java
numbers.stream()
       .map(x -> x * 2)
       .toList();
```

The same fundamental functional concept appears in all three.

---

# 10. Anonymous functions

ML uses `fn` for anonymous functions.

For example:

```ml
fn x => x * 2
```

means:

```text
function x → x × 2
```

Compare:

```text
ML        fn x => x * 2

Scheme    (lambda (x) (* x 2))

Haskell   \x -> x * 2

Java      x -> x * 2
```

This is a beautiful example of the common ancestry of modern functional features.

---

# 11. Pattern matching

Pattern matching is one of ML's defining features.

For example:

```ml
fun factorial 0 = 1
  | factorial n = n * factorial (n - 1);
```

The function has two patterns:

```text
factorial 0
factorial n
```

The appropriate one is selected based on the argument.

This is much more than a convenient syntax feature. Pattern matching becomes a fundamental way to **deconstruct data**.

---

# 12. Algebraic Data Types

This is where ML becomes particularly powerful.

You can define:

```ml
datatype shape =
      Circle of real
    | Rectangle of real * real;
```

Now `shape` can be:

```text
Circle radius
```

or:

```text
Rectangle(width, height)
```

Then:

```ml
fun area (Circle r) =
      Math.pi * r * r
  | area (Rectangle (w, h)) =
      w * h;
```

The compiler can check that you have handled the possible forms of `shape`.

This is the foundation of **algebraic data types**.

---

# 13. Compare with modern Java

This should look familiar to you because you've been studying Java's **records, sealed types, and pattern matching**.

Modern Java:

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

ML:

```ml
datatype shape =
      Circle of real
    | Rectangle of real * real;

fun area (Circle r) =
      Math.pi * r * r
  | area (Rectangle (w, h)) =
      w * h;
```

The syntax is different, but the **data-modeling philosophy is remarkably similar**.

Modern Java has adopted several ideas that have long been central to ML-family languages.

---

# 14. Option types

ML traditionally uses an option type to represent a value that might not exist.

For example:

```ml
datatype 'a option =
      NONE
    | SOME of 'a;
```

Conceptually:

```text
Option<T>
├── NONE
└── SOME(value)
```

Then:

```ml
fun safeDivide x y =
    if y = 0
    then NONE
    else SOME (x / y);
```

This avoids using `null`.

The same idea appears in:

```text
ML       option
Haskell  Maybe
Scala    Option
Rust     Option
Java     Optional
```

Again, modern Java has an analogous feature.

---

# 15. ML and Haskell

ML and Haskell are closely related in the history of typed functional programming.

A useful comparison:

|                         | ML                  | Haskell        |
| ----------------------- | ------------------- | -------------- |
| Functional              | Yes                 | Yes            |
| Static typing           | Yes                 | Yes            |
| Type inference          | Yes                 | Yes            |
| Pattern matching        | Yes                 | Yes            |
| Algebraic data types    | Yes                 | Yes            |
| Higher-order functions  | Yes                 | Yes            |
| Parametric polymorphism | Yes                 | Yes            |
| Type classes            | Some ML descendants | Yes            |
| Evaluation              | Usually eager       | Lazy           |
| Purity                  | Not necessarily     | Pure by design |
| Modules                 | Very important      | Important      |
| Main examples           | SML, OCaml, F#      | Haskell        |

The biggest conceptual difference for beginners is:

```text
ML
→ functional, but can be imperative

Haskell
→ pure functional
```

For example, ML languages can generally have mutable references and imperative operations.

Haskell deliberately separates such effects from pure computation.

---

# 16. ML vs Scheme

This is an especially useful comparison.

```text
Scheme
│
├── Lisp family
├── dynamically typed
├── minimal
├── S-expressions
└── very flexible

ML
│
├── typed functional family
├── statically typed
├── type inference
├── pattern matching
└── algebraic data types
```

You could summarize the philosophical difference as:

> **Scheme asks: "What can we build from a very small and flexible language?"**

while:

> **ML asks: "How can we combine functional programming with strong static typing and abstraction?"**

---

# 17. ML vs Haskell vs Scheme

Putting the three together:

```text
                 Functional Programming
                         │
          ┌──────────────┼──────────────┐
          │              │              │
        Scheme           ML          Haskell
          │              │              │
     Lisp family    typed FP       pure FP
          │              │              │
    dynamic types   type inference   lazy evaluation
          │              │              │
    S-expressions    pattern match   type classes
                         │
                         │
                  algebraic types
```

This is a very useful mental model for understanding functional-language history.

---

# 18. The ML family

ML isn't just one language today.

The two most important descendants to know are:

## Standard ML

Often abbreviated **SML**.

It attempts to provide a standardized ML language.

Example:

```ml
fun square x = x * x;
```

Standard ML is particularly important academically and historically.

---

## OCaml

**OCaml** = Objective Caml.

It began as an extension of Caml, an ML-family language developed in France.

OCaml combines:

```text
functional programming
+
imperative programming
+
object-oriented programming
```

It is used in some serious production systems as well as academia.

---

## F#

F# is Microsoft's functional-first language for the **.NET ecosystem**.

For example:

```fsharp
let square x = x * x
```

It can interact with:

```text
.NET
C#
ASP.NET
.NET libraries
```

So F# is an interesting example of functional programming entering a mainstream enterprise ecosystem.

---

# 19. ML's influence on modern languages

ML's influence is much larger than its direct popularity.

Many modern languages contain ideas strongly associated with the ML tradition:

```text
ML
 │
 ├── OCaml
 │
 ├── F#
 │
 ├── Haskell
 │
 ├── Scala
 │
 ├── Rust
 │
 ├── Swift
 │
 └── Kotlin
```

Again, this is not a simple parent-child lineage for every language, but the **design influence** is significant.

Especially important are:

```text
type inference
pattern matching
algebraic data types
option/result types
parametric polymorphism
```

---

# 20. Why Rust feels somewhat ML-like

Since you've previously asked about Rust, this is worth pointing out.

Rust has:

```rust
enum Option<T> {
    Some(T),
    None,
}
```

and:

```rust
enum Result<T, E> {
    Ok(T),
    Err(E),
}
```

This style of data modeling is strongly related to the ML tradition.

For example:

```text
ML
datatype result =
    Ok of value
  | Error of error
```

Rust:

```text
enum Result<T, E> {
    Ok(T),
    Err(E),
}
```

Both encourage you to represent possible states explicitly in the type system.

This is one reason Rust programmers often encounter concepts that feel surprisingly similar to functional programming.

---

# 21. Why ML matters to Java

This is particularly relevant to your current Java learning.

Modern Java has increasingly adopted ideas that come from the broader functional/type-system tradition:

```text
Java
│
├── generics
├── lambdas
├── functional interfaces
├── Stream API
├── Optional
├── records
├── sealed classes
└── pattern matching
```

Several of these concepts become much easier to understand if you know the ML family.

For example:

```text
ML
 │
 ├── algebraic data types
 │       ↓
 │   sealed types + records
 │
 ├── pattern matching
 │       ↓
 │   switch pattern matching
 │
 ├── option types
 │       ↓
 │   Optional
 │
 └── higher-order functions
         ↓
     lambdas + Streams
```

Java hasn't become an ML language, but modern Java has absorbed many ideas that functional languages have explored for decades.

---

# 22. ML's most important contribution

If I had to choose one thing that ML contributed to programming-language design, it would be:

> **The combination of powerful static typing with type inference and functional programming.**

Before type inference, programmers often had to write lots of type information.

ML showed that a compiler could infer much of it while still providing strong static checking.

For example:

```ml
fun map f [] = []
  | map f (x::xs) =
      (f x) :: map f xs;
```

The compiler can infer a highly general type:

```text
('a -> 'b) -> 'a list -> 'b list
```

That's an extraordinarily expressive type.

It says:

> Give me a function that converts an `'a` into a `'b`, and I'll give you a function that converts a list of `'a` into a list of `'b`.

That's the essence of `map`.

---

# 23. A simple ML learning path

If you want to study ML itself, I'd suggest:

```text
1. Expressions
       ↓
2. Functions
       ↓
3. Lists and tuples
       ↓
4. Higher-order functions
       ↓
5. map / filter / fold
       ↓
6. Pattern matching
       ↓
7. Type inference
       ↓
8. Parametric polymorphism
       ↓
9. Algebraic data types
       ↓
10. Option / Result
       ↓
11. Modules
       ↓
12. Functors
       ↓
13. Advanced type system
```

You don't need to go all the way to advanced modules/functors to understand the main ideas.

---

# 24. Where ML fits in your language-history study

You've now looked at several important historical branches:

```text
1950s
FORTRAN
   │
1960s
ALGOL
   │
   ├───────────────┐
   │               │
   ▼               ▼
 C             Functional
   │               │
   │             Lisp
   │               │
   │            Scheme
   │               │
   │              ML
   │               │
   │       ┌───────┼────────┐
   │       ▼       ▼        ▼
   │      SML    OCaml      F#
   │       │       │
   │       │       └──────┐
   │       │              │
   │       ▼              ▼
   │    Haskell         modern
   │                   typed FP
   │
   ├── C++
   │
   └── Java
```

This gives you a useful distinction:

```text
Lisp / Scheme
    → functional programming through simplicity and flexibility

ML
    → functional programming + static types + inference

Haskell
    → pure functional programming + strong types + laziness
```

### The key idea

> **ML is the foundational family of statically typed functional languages that brought together higher-order functions, type inference, parametric polymorphism, pattern matching, and algebraic data types.**

And for your Java studies, **ML is particularly worth knowing because many features that feel "modern" in Java—`Optional`, records + sealed types, pattern matching, lambdas, and generic type reasoning—become much easier to understand when you see the functional/type-system tradition behind them.**
