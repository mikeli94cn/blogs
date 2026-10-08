# F# Introduction

**F#** is a **statically typed, functional-first programming language** in the **ML family**. It runs primarily on the **.NET platform** and works closely with C# and the rest of the .NET ecosystem.

A useful one-line mental model is:

> **F# = ML-style functional programming + .NET + practical multi-paradigm programming**

If you have just studied **ML, Haskell, Erlang, and Clojure**, F# is especially interesting because it brings the **ML family into the .NET world**.

---

## 1. Where does F# come from?

Historically:

```text
ML
│
├── Standard ML
│
├── OCaml
│
└── F#
      │
      └── .NET
            │
            ├── C#
            ├── VB.NET
            └── F#
```

F# was developed from the ML/OCaml tradition and became part of Microsoft's .NET ecosystem.

It was originally developed by **Don Syme** and others at Microsoft Research.

The first public versions appeared around **2005**, and F# later became an open-source language under the .NET Foundation ecosystem.

---

# 2. The most important idea

F# is **functional-first**, rather than purely functional.

That distinction is important.

F# encourages:

```text
immutable data
pure functions
function composition
pattern matching
algebraic data types
type inference
```

but it also supports:

```text
objects
classes
interfaces
inheritance
mutable state
exceptions
.NET libraries
```

So F# is not trying to eliminate object-oriented programming.

Instead:

> **Use functional programming where it makes the program simpler, while retaining access to the entire .NET ecosystem.**

---

# 3. A simple F# program

F#:

```fsharp
let add x y =
    x + y

let result = add 10 20

printfn "%d" result
```

Output:

```text
30
```

Compare Java:

```java
static int add(int x, int y) {
    return x + y;
}

int result = add(10, 20);
System.out.println(result);
```

F# is much more concise.

---

# 4. `let` is fundamental

The keyword:

```fsharp
let
```

is one of the most important things in F#.

For example:

```fsharp
let name = "Alice"
let age = 25
let price = 19.99
```

You can think of it roughly as:

```text
let name = ...
```

meaning:

> Bind the name `name` to this value.

F# variables are **immutable by default**.

For example:

```fsharp
let x = 10
```

You normally don't change `x`.

If you explicitly need mutation:

```fsharp
let mutable x = 10

x <- 20
```

Notice the special assignment operator:

```text
<-
```

This makes the distinction between immutable and mutable state very visible.

---

# 5. Type inference

Like other ML-family languages, F# has powerful **static type inference**.

You can write:

```fsharp
let square x =
    x * x
```

without saying:

```text
int -> int
```

F# can infer the type.

You can also explicitly write a type:

```fsharp
let square (x: int) : int =
    x * x
```

Conceptually:

```text
F# compiler
    ↓
analyze program
    ↓
infer types
    ↓
static type checking
    ↓
.NET code
```

This is one of the major ideas inherited from ML.

---

# 6. Functions are first-class values

Functions can be stored in variables:

```fsharp
let square x = x * x

let f = square

f 5
```

Result:

```text
25
```

They can also be passed to other functions:

```fsharp
let apply f x =
    f x
```

Then:

```fsharp
apply square 5
```

gives:

```text
25
```

This is the foundation of functional programming.

---

# 7. Anonymous functions

F# uses:

```fsharp
fun x -> x * 2
```

for an anonymous function.

For example:

```fsharp
let numbers = [1; 2; 3; 4]

List.map (fun x -> x * 2) numbers
```

Result:

```text
[2; 4; 6; 8]
```

Compare Java:

```java
numbers.stream()
       .map(x -> x * 2)
       .toList();
```

Again, you can see the connection between modern Java and ML-style functional programming.

---

# 8. Lists

F# has excellent support for immutable lists.

```fsharp
let numbers = [1; 2; 3; 4; 5]
```

Notice that F# uses semicolons between list elements:

```text
[1; 2; 3; 4; 5]
```

You can map:

```fsharp
List.map (fun x -> x * 2) numbers
```

Filter:

```fsharp
List.filter (fun x -> x % 2 = 0) numbers
```

Fold:

```fsharp
List.fold (+) 0 numbers
```

These correspond closely to:

```text
map
filter
reduce/fold
```

that you've already seen in Clojure and Haskell.

---

# 9. Pipeline operator

One of F#'s nicest features is the **pipeline operator**:

```text
|>
```

Instead of:

```fsharp
List.map (fun x -> x * 2)
    (List.filter (fun x -> x % 2 = 0) numbers)
```

you can write:

```fsharp
numbers
|> List.filter (fun x -> x % 2 = 0)
|> List.map (fun x -> x * 2)
```

Read this almost like English:

```text
numbers
    ↓
filter even numbers
    ↓
multiply by 2
```

This makes functional composition very readable.

---

# 10. Pattern matching

Pattern matching is one of the most important features inherited from ML.

For example:

```fsharp
let describe x =
    match x with
    | 0 -> "zero"
    | 1 -> "one"
    | _ -> "something else"
```

Then:

```fsharp
describe 0
```

returns:

```text
"zero"
```

The `_` means:

> anything else.

---

# 11. Pattern matching with data

Suppose we have:

```fsharp
let numbers = [1; 2; 3]
```

We can inspect the structure:

```fsharp
let describe list =
    match list with
    | [] -> "empty"
    | [x] -> "one element"
    | x :: xs -> "multiple elements"
```

This is much more than an ordinary `switch`.

The pattern can describe the **structure of the data**.

That's one of the defining characteristics of ML-family programming.

---

# 12. Algebraic data types

This is where F# becomes particularly interesting.

You can define a discriminated union:

```fsharp
type Shape =
    | Circle of radius: float
    | Rectangle of width: float * height: float
```

Now:

```fsharp
let area shape =
    match shape with
    | Circle r ->
        System.Math.PI * r * r

    | Rectangle (w, h) ->
        w * h
```

The type itself says:

```text
Shape
 ├── Circle
 │     └── radius
 │
 └── Rectangle
       ├── width
       └── height
```

This is an **algebraic data type (ADT)**.

---

# 13. Why ADTs are important

Compare traditional Java.

You might write:

```java
interface Shape {}

record Circle(double radius) implements Shape {}

record Rectangle(double width, double height) implements Shape {}
```

Then:

```java
if (shape instanceof Circle c) {
    ...
} else if (shape instanceof Rectangle r) {
    ...
}
```

Modern Java has moved significantly toward this style with:

* records
* sealed interfaces
* pattern matching

F# has supported this **data-oriented style for a very long time**.

So F# is particularly useful for understanding where some modern Java features came from conceptually.

---

# 14. Option type

F# has:

```fsharp
Option<'T>
```

which represents:

```text
Some value
```

or:

```text
None
```

Example:

```fsharp
let findUser id =
    if id = 1 then
        Some "Alice"
    else
        None
```

Then:

```fsharp
match findUser 1 with
| Some name -> printfn "%s" name
| None -> printfn "Not found"
```

This avoids using `null` for many situations.

Compare:

```text
F#
Option<T>
    ↓
Some(value)
None
```

with Java:

```text
Optional<T>
    ↓
Optional.of(value)
Optional.empty()
```

The conceptual relationship is very strong.

---

# 15. Result type

F# also has an extremely useful:

```fsharp
Result<'T, 'Error>
```

which represents either:

```text
Ok value
```

or:

```text
Error error
```

For example:

```fsharp
let divide x y =
    if y = 0 then
        Error "Cannot divide by zero"
    else
        Ok (x / y)
```

Then:

```fsharp
match divide 10 2 with
| Ok value -> printfn "%d" value
| Error message -> printfn "%s" message
```

This is closely related to ideas you'll see in:

* Haskell
* Rust
* functional error handling
* modern API design

---

# 16. Records

F# records are convenient immutable data structures.

```fsharp
type Person =
    {
        Name: string
        Age: int
    }
```

Create one:

```fsharp
let person =
    {
        Name = "Alice"
        Age = 25
    }
```

Access:

```fsharp
person.Name
```

This is conceptually similar to a Java record:

```java
record Person(String name, int age) {}
```

Again, modern Java has adopted many ideas that are familiar to ML-family programmers.

---

# 17. Tuples

F# has tuples:

```fsharp
let person = ("Alice", 25)
```

You can destructure them:

```fsharp
let (name, age) = person
```

You can also return multiple values naturally:

```fsharp
let getPerson () =
    ("Alice", 25)
```

This is another common functional-programming technique.

---

# 18. Classes and OOP

Although F# is functional-first, it fully supports object-oriented programming.

For example:

```fsharp
type Person(name: string, age: int) =
    member this.Name = name
    member this.Age = age

    member this.Greet() =
        printfn "Hello, I'm %s" this.Name
```

Usage:

```fsharp
let p = Person("Alice", 25)

p.Greet()
```

So F# supports:

```text
Functional programming
        +
Object-oriented programming
        +
Imperative programming
```

That's why F# is often described as **multi-paradigm**.

---

# 19. F# and .NET

This is probably the most important practical characteristic of F#.

The architecture is roughly:

```text
             .NET
              │
       ┌──────┼───────┐
       │      │       │
      C#     F#    VB.NET
       │      │       │
       └──────┼───────┘
              │
       .NET Runtime
              │
       CLR / libraries
```

F# can use .NET libraries directly.

For example:

```fsharp
open System

let now = DateTime.Now
printfn "%A" now
```

You can use:

* .NET collections
* files
* networking
* HTTP
* JSON libraries
* databases
* ASP.NET
* GUI frameworks
* cloud SDKs

and many other .NET libraries.

---

# 20. F# and C#

This is an important comparison if you're interested in backend development.

### C#

```text
object-oriented first
        +
functional features
```

### F#

```text
functional first
        +
object-oriented features
```

Both compile for .NET and can interoperate.

Conceptually:

```text
.NET
 │
 ├── C# ── OOP-first
 │
 └── F# ── Functional-first
```

So F# isn't really a replacement for C#.

They are two different ways of programming on the same platform.

---

# 21. F# vs OCaml

Because F# comes from the ML/OCaml tradition, these languages are closely related.

|                  | OCaml        | F#     |
| ---------------- | ------------ | ------ |
| Family           | ML           | ML     |
| Functional       | Strong       | Strong |
| Static typing    | Yes          | Yes    |
| Type inference   | Yes          | Yes    |
| Pattern matching | Yes          | Yes    |
| ADTs             | Yes          | Yes    |
| OOP              | Yes          | Yes    |
| Main ecosystem   | OCaml/native | .NET   |
| Microsoft/.NET   | No           | Yes    |

A useful mental model:

> **OCaml = ML for its own ecosystem**

> **F# = ML-style programming deeply integrated with .NET**

---

# 22. F# vs Haskell

This comparison shows two different directions in functional programming.

|                  | F#                            | Haskell                  |
| ---------------- | ----------------------------- | ------------------------ |
| Family           | ML                            | ML                       |
| Static typing    | Yes                           | Yes                      |
| Type inference   | Yes                           | Yes                      |
| Pattern matching | Yes                           | Yes                      |
| ADTs             | Yes                           | Yes                      |
| Pure?            | No                            | Yes                      |
| Evaluation       | Eager                         | Lazy                     |
| OOP              | Yes                           | Not traditional OOP      |
| Mutable state    | Yes                           | Controlled               |
| Main platform    | .NET                          | GHC/native/etc.          |
| Goal             | Practical functional language | Pure functional language |

A useful summary:

```text
F#
=
practical ML + .NET
```

while:

```text
Haskell
=
pure functional programming + laziness + advanced type system
```

---

# 23. F# vs Clojure

This is especially useful after studying Clojure.

|                  | F#                         | Clojure                     |
| ---------------- | -------------------------- | --------------------------- |
| Family           | ML                         | Lisp                        |
| Platform         | .NET                       | JVM                         |
| Typing           | Static                     | Dynamic                     |
| Type inference   | Strong                     | Runtime-oriented            |
| Syntax           | ML-style                   | Lisp/S-expressions          |
| Functional       | First-class                | First-class                 |
| Immutable data   | Strong                     | Very strong                 |
| Pattern matching | Core feature               | Less central traditionally  |
| ADTs             | Core feature               | Usually modeled differently |
| Macros           | Limited compared with Lisp | Major feature               |
| OOP              | Supported                  | Supported                   |
| Concurrency      | .NET mechanisms            | Atoms/Refs/Agents etc.      |

So:

```text
Clojure
  = Lisp + FP + JVM

F#
  = ML + FP + .NET
```

That's probably the simplest way to remember the difference.

---

# 24. F# and Java

For your Java studies, there are many useful conceptual connections.

```text
F#                         Modern Java

let                        variable/value binding
function                   method/lambda
fun x -> ...               x -> ...
List.map                   Stream.map
List.filter                Stream.filter
Option                     Optional
Result                     custom Result / Either-style design
record                     record
discriminated union        sealed interface + records
pattern matching           pattern matching
type inference             local type inference
async                      CompletableFuture / async patterns
```

For example, F#:

```fsharp
numbers
|> List.filter (fun x -> x % 2 = 0)
|> List.map (fun x -> x * 2)
```

Java:

```java
numbers.stream()
       .filter(x -> x % 2 == 0)
       .map(x -> x * 2)
       .toList();
```

This is why studying F# or another ML language can actually help you understand **modern Java**.

---

# 25. F# async programming

F# has a built-in abstraction called **async workflows**.

Conceptually:

```fsharp
async {
    let! result = someAsyncOperation()
    printfn "%A" result
}
```

The `let!` syntax means, roughly:

> obtain the result of this asynchronous computation and continue.

F# also integrates with .NET's asynchronous ecosystem.

This makes it useful for:

* web servers
* network applications
* database applications
* distributed systems
* concurrent applications

---

# 26. F# is useful for data-oriented programming

F# is particularly good at expressing data models.

For example:

```fsharp
type Payment =
    | Cash of amount: decimal
    | CreditCard of number: string
    | PayPal of email: string
```

Then:

```fsharp
let processPayment payment =
    match payment with
    | Cash amount ->
        printfn "Cash: %M" amount

    | CreditCard number ->
        printfn "Credit card: %s" number

    | PayPal email ->
        printfn "PayPal: %s" email
```

The type describes the possible states of the system.

This style can make invalid states harder to represent.

---

# 27. "Make illegal states unrepresentable"

This is an important idea in typed functional programming.

Instead of:

```text
Payment
    type = "cash"
    amount = ?
    cardNumber = ?
    paypalEmail = ?
```

where many combinations are invalid, F# lets you model:

```text
Payment
 ├── Cash(amount)
 ├── CreditCard(number)
 └── PayPal(email)
```

Now the structure itself describes what is valid.

This idea appears throughout:

* ML
* Haskell
* F#
* OCaml
* Rust
* modern typed programming

and is increasingly visible in Java through:

* records
* sealed classes/interfaces
* pattern matching
* `Optional`
* explicit domain types.

---

# 28. Why F# is historically important

F# represents an important stage in the evolution of functional programming:

```text
Lisp
  │
  │ functional programming
  ↓
ML
  │
  ├── static typing
  ├── type inference
  ├── pattern matching
  └── algebraic data types
       │
       ├── OCaml
       │
       └── F#
             │
             ↓
           .NET
             │
        practical software
```

It demonstrates that functional programming does not have to mean:

> "Forget objects and write everything mathematically."

Instead:

> **Functional programming can be the primary design style of a practical industrial language while still interoperating with an existing platform and ecosystem.**

---

# 29. The functional-language map you have now studied

You have now covered several very important branches:

```text
                         Functional Programming
                                  │
              ┌───────────────────┼──────────────────┐
              │                   │                  │
             Lisp                 ML               Erlang
              │                   │                  │
       ┌──────┴──────┐      ┌─────┼─────┐            │
       │             │      │     │     │            │
    Scheme       Clojure   SML  OCaml   F#        Elixir
       │             │             │      │
       │             │             │      └── .NET
       │             │             │
       │             │             └── native
       │             │
       │             └── JVM
       │
       └── minimalist Lisp


                    ML
                     │
                  Haskell
                     │
              pure + lazy FP
```

The three languages are particularly useful to remember:

```text
Clojure = Lisp + JVM + immutable data + concurrency

F#      = ML + .NET + practical functional programming

Haskell = pure FP + static types + lazy evaluation
```

And this gives you a very useful historical picture:

> **Lisp explored functional programming and metaprogramming; ML brought strong static typing and type inference; Haskell pushed purity and lazy functional programming; Erlang pushed functional programming toward concurrency and fault tolerance; Clojure and F# brought functional programming into the mainstream JVM and .NET ecosystems.**
