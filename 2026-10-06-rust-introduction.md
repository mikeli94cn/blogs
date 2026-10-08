# Rust Introduction

Rust is a **modern systems programming language** designed to provide the performance and low-level control of C/C++ while offering much stronger guarantees about memory safety and concurrency.

A useful one-line description is:

> **Rust = systems programming + memory safety + modern language design.**

It is especially used for:

* operating systems and system software
* command-line tools
* networking
* embedded systems
* databases
* WebAssembly
* cloud infrastructure
* high-performance services
* security-sensitive software

---

# 1. Why was Rust created?

Rust originated at Mozilla Research, with **Graydon Hoare** as its original designer. Mozilla began sponsoring its development, and Rust's first stable release, **Rust 1.0**, arrived in 2015.

The motivation was a fundamental problem with C and C++:

```text
C / C++
   │
   ├── very fast
   ├── direct hardware access
   ├── manual control of memory
   │
   └── memory bugs
          │
          ├── use-after-free
          ├── buffer overflow
          ├── dangling pointers
          ├── double free
          └── data races
```

Rust attempts to preserve the first three advantages while preventing many of the problems.

```text
Rust
 │
 ├── performance
 ├── low-level control
 ├── memory safety
 ├── thread safety
 └── modern syntax
```

---

# 2. Where Rust fits in programming-language history

Given the language history you've been exploring, Rust is particularly interesting.

A simplified lineage is:

```text
FORTRAN
   ↓
ALGOL
   ↓
C
   ↓
C++
   ↓
Rust
```

But this isn't a simple direct inheritance chain. Rust combines ideas from several traditions:

```text
C/C++
   │
   ├── systems programming
   ├── performance
   └── low-level control
         │
         ▼
       Rust
         ▲
         │
   functional programming
   │
   ├── algebraic data types
   ├── pattern matching
   ├── Option / Result
   └── expressive type system
```

Rust therefore represents an important modern attempt to **rethink systems programming** rather than simply extending C++.

---

# 3. The classic Hello World

A Rust program:

```rust
fn main() {
    println!("Hello, World!");
}
```

Very simple.

Compile it:

```bash
rustc main.rs
```

Run it:

```bash
./main
```

But in real projects, you normally use **Cargo** rather than calling `rustc` manually.

---

# 4. Cargo

Cargo is Rust's official build system and package manager.

Create a project:

```bash
cargo new hello
```

You get:

```text
hello/
├── Cargo.toml
└── src/
    └── main.rs
```

Build:

```bash
cargo build
```

Run:

```bash
cargo run
```

Test:

```bash
cargo test
```

Format:

```bash
cargo fmt
```

Check code:

```bash
cargo check
```

Cargo is a very important part of the Rust ecosystem.

---

# 5. Rust variables

Rust variables are declared with `let`.

```rust
let age = 25;
let name = "Mike";
```

By default, variables are **immutable**.

```rust
let x = 10;

// x = 20;   // error
```

If you want a mutable variable:

```rust
let mut x = 10;

x = 20;
```

This is a fundamental Rust idea:

> **Immutability is the default.**

---

# 6. Static typing

Rust is **statically typed**.

```rust
let age: i32 = 25;
```

But Rust has type inference, so you usually don't need to write the type:

```rust
let age = 25;
```

The compiler determines that `age` is an integer.

Compare:

```text
Java
    static typing

Rust
    static typing

Python
    dynamic typing
```

Rust's compiler performs extensive type checking before the program runs.

---

# 7. Basic types

Rust provides familiar primitive types:

```rust
let a: i32 = 10;
let b: f64 = 3.14;
let c: bool = true;
let d: char = 'A';
```

It also has unsigned integers:

```rust
let x: u32 = 100;
```

Common integer types include:

```text
i8
i16
i32
i64
i128
isize

u8
u16
u32
u64
u128
usize
```

---

# 8. Strings

Rust has several string-related types, but two you'll encounter constantly are:

```rust
let s: &str = "Hello";
```

and:

```rust
let s: String = String::from("Hello");
```

The distinction is important.

Very roughly:

```text
&str
  ↓
borrowed string slice


String
  ↓
owned, growable string
```

This distinction is connected to Rust's ownership system.

---

# 9. Functions

Rust functions look relatively familiar:

```rust
fn add(a: i32, b: i32) -> i32 {
    a + b
}
```

Then:

```rust
let result = add(10, 20);
```

Notice:

```rust
a + b
```

doesn't have a semicolon.

In Rust, the final expression of a block can become its return value.

You can also explicitly return:

```rust
fn add(a: i32, b: i32) -> i32 {
    return a + b;
}
```

---

# 10. Control flow

Rust has familiar constructs.

### if

```rust
if age >= 18 {
    println!("Adult");
} else {
    println!("Minor");
}
```

Interestingly, `if` is an expression:

```rust
let result = if age >= 18 {
    "adult"
} else {
    "minor"
};
```

---

### loop

```rust
loop {
    println!("Hello");
}
```

### while

```rust
while x < 10 {
    x += 1;
}
```

### for

```rust
for i in 0..5 {
    println!("{}", i);
}
```

---

# 11. Structs

Rust's `struct` is one of its fundamental ways of defining data types.

```rust
struct Student {
    name: String,
    age: u32,
}
```

Create one:

```rust
let student = Student {
    name: String::from("Alice"),
    age: 20,
};
```

Access fields:

```rust
println!("{}", student.name);
```

---

# 12. Methods

Rust can associate methods with structs using `impl`.

```rust
struct Student {
    name: String,
    age: u32,
}

impl Student {
    fn introduce(&self) {
        println!("My name is {}", self.name);
    }
}
```

Then:

```rust
student.introduce();
```

This gives Rust an object-oriented flavor without using traditional class-based OOP in exactly the same way as Java or C++.

---

# 13. Rust doesn't have Java-style classes

This is an important conceptual difference.

Java:

```text
class
 ├── fields
 ├── constructors
 └── methods
```

Rust:

```text
struct
 ├── data
 │
 └── impl
      └── methods
```

Rust's design combines:

* structs
* enums
* traits
* implementations
* generics
* pattern matching

rather than making classes the central abstraction.

---

# 14. Enums

Rust's `enum` is much more powerful than a traditional Java enum.

For example:

```rust
enum Direction {
    North,
    South,
    East,
    West,
}
```

But variants can also contain data:

```rust
enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
}
```

This is extremely important in Rust.

---

# 15. Pattern matching

Rust has a powerful `match` expression.

```rust
match direction {
    Direction::North => println!("North"),
    Direction::South => println!("South"),
    Direction::East => println!("East"),
    Direction::West => println!("West"),
}
```

Pattern matching is deeply integrated into the language.

This is one of the places where Rust reflects ideas from functional programming languages.

---

# 16. Option

Rust doesn't use `null` in the traditional Java/C++ sense.

Instead, it has:

```rust
Option<T>
```

which can contain:

```text
Some(value)
```

or:

```text
None
```

For example:

```rust
let x: Option<i32> = Some(10);
```

or:

```rust
let x: Option<i32> = None;
```

Then:

```rust
match x {
    Some(value) => println!("{}", value),
    None => println!("No value"),
}
```

This is a major Rust safety feature.

Instead of:

```text
value
  ↓
maybe null
  ↓
runtime crash
```

the type system forces you to deal with the possibility of no value.

---

# 17. Result

Rust also has:

```rust
Result<T, E>
```

for operations that may succeed or fail.

Conceptually:

```text
Result
 │
 ├── Ok(value)
 │
 └── Err(error)
```

For example:

```rust
fn divide(a: i32, b: i32) -> Result<i32, String> {
    if b == 0 {
        Err(String::from("division by zero"))
    } else {
        Ok(a / b)
    }
}
```

This encourages explicit error handling.

---

# 18. Ownership — Rust's central idea

This is probably the **single most important concept in Rust**.

Rust has a system called **ownership**.

Every value has an owner.

When the owner goes out of scope, the value is automatically cleaned up.

For example:

```rust
fn main() {
    let s = String::from("hello");

    println!("{}", s);
}
```

When `s` goes out of scope, Rust automatically releases the associated memory.

No garbage collector is required.

This is one of Rust's defining characteristics.

---

# 19. Ownership and move

Consider:

```rust
let s1 = String::from("hello");
let s2 = s1;
```

In many languages, you might expect:

```text
s1 ──┐
     ├──> "hello"
s2 ──┘
```

But Rust treats this differently.

The ownership of the `String` is **moved** from `s1` to `s2`.

After:

```rust
let s2 = s1;
```

you generally cannot use `s1`.

```rust
// println!("{}", s1);  // error
```

Now:

```text
s2 ───> "hello"
```

This prevents many memory-management problems.

---

# 20. Borrowing

You don't always want to transfer ownership.

You can **borrow** a value.

```rust
fn print_name(name: &String) {
    println!("{}", name);
}
```

Then:

```rust
let name = String::from("Alice");

print_name(&name);

println!("{}", name);
```

The function borrows the string instead of taking ownership.

The symbol:

```text
&
```

means a reference/borrow.

---

# 21. Mutable borrowing

Rust distinguishes immutable and mutable borrowing.

Immutable:

```rust
let r = &x;
```

Mutable:

```rust
let r = &mut x;
```

For example:

```rust
fn change(value: &mut String) {
    value.push_str(" world");
}
```

Then:

```rust
let mut s = String::from("hello");

change(&mut s);
```

Rust places strict rules on simultaneous references.

---

# 22. The borrowing rules

A simplified version is:

> You can have multiple immutable references **or** one mutable reference, but not both at the same time.

Conceptually:

```text
Immutable:

x
├── &x
├── &x
└── &x

Allowed
```

but:

```text
x
├── &mut x
└── &x

Not allowed simultaneously
```

This prevents many data races and memory bugs.

---

# 23. Why ownership is revolutionary

C traditionally gives the programmer direct responsibility:

```text
malloc()
   ↓
use memory
   ↓
free()
```

If you make a mistake:

```text
use-after-free
double-free
memory leak
dangling pointer
```

Java uses garbage collection:

```text
objects
  ↓
GC
  ↓
automatic cleanup
```

Rust takes another approach:

```text
ownership
    +
borrowing
    +
lifetimes
    ↓
compile-time memory safety
```

So Rust doesn't need a traditional garbage collector to provide memory safety.

---

# 24. Lifetimes

Borrowing leads to another Rust concept:

**lifetimes**.

A reference cannot outlive the data it refers to.

Conceptually:

```text
data
│
├────────────── lifetime ──────────┤
│
│     reference
│     ├────────────┤
│
└──────────────────────────────────
```

Rust's compiler checks these relationships.

This can make advanced Rust difficult at first, but it is one of the reasons Rust can guarantee strong memory safety without garbage collection.

---

# 25. Traits

Rust's **traits** are another central concept.

A trait describes behavior.

For example:

```rust
trait Animal {
    fn speak(&self);
}
```

A type can implement it:

```rust
struct Dog;

impl Animal for Dog {
    fn speak(&self) {
        println!("Woof");
    }
}
```

Conceptually:

```text
Trait
  │
  │ defines behavior
  ▼
Animal
  │
  ├── Dog
  ├── Cat
  └── ...
```

Traits have similarities to Java interfaces, but they are not identical.

---

# 26. Generics

Rust supports generics:

```rust
fn identity<T>(value: T) -> T {
    value
}
```

You can use it with different types:

```rust
identity(10);
identity("hello");
```

Traits can constrain generics:

```rust
fn print_value<T: std::fmt::Display>(value: T) {
    println!("{}", value);
}
```

This is conceptually similar to Java generic bounds:

```java
<T extends ...>
```

but Rust's trait system is more deeply integrated into the language.

---

# 27. Rust and concurrency

Rust is particularly interesting for concurrent programming.

Traditional C/C++ concurrency can suffer from:

```text
data races
    ↓
undefined behavior
    ↓
difficult debugging
```

Rust's ownership and type systems can prevent many data races **at compile time**.

The Rust philosophy is roughly:

> If the program passes the compiler's safety checks, many classes of memory and concurrency bugs have already been eliminated.

This is one of Rust's strongest selling points.

---

# 28. Zero-cost abstractions

A famous Rust principle is:

> **You shouldn't have to pay for abstractions you don't use.**

For example, Rust provides high-level features such as:

```text
iterators
closures
generics
traits
pattern matching
```

while attempting to compile them into efficient machine code.

This is closely related to the philosophy of C++.

So:

```text
High-level abstraction
        ↓
compiler optimization
        ↓
efficient machine code
```

---

# 29. Rust compilation

Rust is normally compiled ahead of time.

Conceptually:

```text
Rust source
     │
     ▼
Rust compiler (rustc)
     │
     ├── type checking
     ├── ownership checking
     ├── borrow checking
     ├── lifetime checking
     └── optimization
     │
     ▼
Machine code
     │
     ▼
Executable
```

This is different from Python's typical execution model.

---

# 30. Rust vs C

|                    | C                         | Rust                           |
| ------------------ | ------------------------- | ------------------------------ |
| Performance        | Excellent                 | Excellent                      |
| Low-level access   | Excellent                 | Excellent                      |
| Memory safety      | Programmer responsibility | Compiler enforced              |
| Garbage collector  | No                        | No                             |
| Static typing      | Yes                       | Yes                            |
| Ownership system   | No                        | Yes                            |
| Borrow checker     | No                        | Yes                            |
| Generics           | Limited                   | Powerful                       |
| Pattern matching   | Limited                   | Powerful                       |
| Concurrency safety | Programmer responsibility | Strong compile-time guarantees |
| Learning curve     | Moderate                  | Steep                          |
| Ecosystem age      | Very mature               | Younger                        |

Rust's fundamental goal is not to make systems programming higher-level at the expense of performance.

It tries to make it **safer without giving up low-level control**.

---

# 31. Rust vs C++

This comparison is particularly interesting.

|                        | C++                              | Rust                           |
| ---------------------- | -------------------------------- | ------------------------------ |
| Performance            | Excellent                        | Excellent                      |
| Manual memory control  | Yes                              | Yes, but ownership-managed     |
| Garbage collection     | No                               | No                             |
| Memory safety          | Mostly programmer responsibility | Strong compile-time guarantees |
| OOP                    | Classes/inheritance              | Structs/traits                 |
| Generics               | Templates                        | Generics/traits                |
| Pattern matching       | Improving                        | Core feature                   |
| Compile-time checking  | Strong                           | Very strong                    |
| Backward compatibility | Extremely important              | Cleaner modern design          |
| Ecosystem              | Huge/mature                      | Growing                        |
| Learning               | Difficult                        | Difficult                      |

A useful philosophical distinction:

```text
C++
    "Give programmers enormous power."

Rust
    "Give programmers enormous power,
     but make the compiler enforce safety rules."
```

---

# 32. Rust vs Java

Since you're learning Java backend development, this comparison is also useful.

|                     | Java              | Rust                         |
| ------------------- | ----------------- | ---------------------------- |
| Type system         | Static            | Static                       |
| Memory              | Garbage collected | Ownership                    |
| Runtime             | JVM               | Usually native executable    |
| GC                  | Yes               | No traditional GC            |
| Performance         | High              | Very high                    |
| Low-level control   | Limited           | Excellent                    |
| Memory safety       | GC + type system  | Ownership + borrow checker   |
| OOP                 | Class-oriented    | Struct/trait-oriented        |
| Backend             | Excellent         | Excellent                    |
| Enterprise          | Extremely strong  | Smaller                      |
| Systems programming | Limited           | Excellent                    |
| Concurrency         | Strong            | Strong + compile-time safety |
| Learning curve      | Moderate          | Steep                        |

A rough division:

```text
Java
 ↓
managed application development
enterprise backend
JVM ecosystem


Rust
 ↓
native systems/application development
performance
memory safety
infrastructure
```

---

# 33. Rust in backend development

Rust is increasingly used for backend and infrastructure software.

Frameworks include:

* Axum
* Actix Web
* Rocket

A simplified Axum-style application might look like:

```rust
use axum::{routing::get, Router};

async fn hello() -> &'static str {
    "Hello, World!"
}

#[tokio::main]
async fn main() {
    let app = Router::new()
        .route("/hello", get(hello));

    // Start server...
}
```

Rust can therefore be used to build:

```text
HTTP APIs
microservices
network servers
cloud infrastructure
high-performance services
```

---

# 34. Rust and WebAssembly

Rust is also an important language for **WebAssembly (Wasm)**.

The basic architecture is:

```text
Rust
  │
  ▼
WebAssembly
  │
  ▼
Browser / Wasm runtime
```

This allows Rust code to run in environments such as web browsers.

---

# 35. Rust and operating systems

Rust is particularly interesting for systems programming.

It can be used for:

```text
OS components
device drivers
embedded systems
networking
filesystems
databases
command-line tools
```

There are even operating-system projects written largely or partly in Rust.

This puts Rust directly in the territory historically dominated by:

```text
C
C++
```

---

# 36. Rust and security

Memory safety is particularly important for security.

Many serious software vulnerabilities historically involve problems such as:

```text
buffer overflow
use-after-free
double free
out-of-bounds access
data races
```

Rust's type system and ownership model are designed to prevent many of these classes of errors before the program runs.

That is one reason Rust has attracted significant interest for security-sensitive systems software.

---

# 37. Rust's ecosystem

The central Rust ecosystem looks like:

```text
Rust
 │
 ├── rustc       compiler
 ├── Cargo       build/package manager
 ├── crates.io   package registry
 ├── rustfmt     formatter
 ├── Clippy      linter
 └── rust-analyzer language server
```

A Rust library/package is commonly called a **crate**.

For example:

```toml
[dependencies]
serde = "..."
```

Cargo downloads and builds the dependency.

---

# 38. Rust's place in modern programming

A useful map is:

```text
                   Programming
                       │
        ┌──────────────┼──────────────┐
        │              │              │
     Systems       Application      Data/AI
        │              │              │
     C/C++           Java            Python
     Rust            C#              R
        │
        ▼
 performance
 + low-level control
 + memory safety
```

Rust's unique selling point is the combination:

```text
C/C++-level performance
          +
low-level control
          +
compile-time memory safety
          +
modern language features
```

---

# 39. The most important Rust concepts to learn

If you eventually want to study Rust systematically, I would recommend this order:

```text
Phase 1 — Language basics
    │
    ├── variables
    ├── types
    ├── functions
    ├── control flow
    └── modules

Phase 2 — Data types
    │
    ├── structs
    ├── enums
    ├── Option
    └── Result

Phase 3 — Ownership
    │
    ├── ownership
    ├── move
    ├── borrowing
    ├── references
    └── lifetimes

Phase 4 — Abstraction
    │
    ├── traits
    ├── generics
    ├── iterators
    └── closures

Phase 5 — Error handling
    │
    ├── Result
    ├── ?
    └── custom errors

Phase 6 — Concurrency
    │
    ├── threads
    ├── channels
    ├── Mutex
    ├── Arc
    └── async/await

Phase 7 — Systems programming
    │
    ├── files
    ├── networking
    ├── processes
    ├── OS APIs
    └── unsafe Rust
```

---

# 40. The big picture

You have now looked at several very different languages:

```text
C
 ↓
systems programming


C++
 ↓
systems + OOP + performance


Java
 ↓
portable managed application programming


JavaScript
 ↓
Web programming


Python
 ↓
general-purpose + AI/data


R
 ↓
statistics + data analysis


CUDA
 ↓
GPU computing


Rust
 ↓
safe systems programming
```

Rust is especially significant because it tries to solve a decades-old problem:

```text
C/C++
   │
   ├── high performance
   ├── low-level control
   │
   └── memory safety problems
             │
             ▼
           Rust
             │
       ┌─────┴─────┐
       ▼           ▼
   performance   safety
       │           │
       └─────┬─────┘
             ▼
       modern systems
         programming
```

So, in the historical evolution of programming languages, **Rust can be viewed as one of the major modern attempts to carry the power of C/C++-style systems programming into an era where memory safety, concurrency safety, and security are first-class concerns.**
