# Functional Programming

**Functional programming (FP)** is a programming paradigm that treats computation primarily as the **evaluation and composition of functions**, while trying to minimize mutable state and side effects.

A simple way to understand it is:

> **Object-oriented programming asks:** “What objects have state and behavior?”
> **Functional programming asks:** “What functions transform this data into other data?”

---

## 1. Where functional programming fits

Functional programming is one of the major programming paradigms.

```text
Programming
│
├── Imperative programming
│   ├── Procedural programming
│   │   └── C, Pascal
│   │
│   └── Object-oriented programming
│       ├── Smalltalk
│       ├── C++
│       ├── Java
│       └── C#
│
└── Declarative programming
    ├── Functional programming
    │   ├── Lisp
    │   ├── Scheme
    │   ├── Haskell
    │   ├── Erlang
    │   ├── Clojure
    │   └── F#
    │
    └── Logic programming
        └── Prolog
```

The distinction isn't completely strict—modern languages commonly combine several paradigms.

For example:

* **Java** → primarily OOP, with substantial functional features
* **JavaScript** → multi-paradigm, including functional programming
* **Python** → multi-paradigm
* **C++** → multi-paradigm
* **Scala** → OOP + functional
* **C#** → OOP + functional features
* **Rust** → imperative + functional features

---

# 2. The basic idea

Consider this imperative program:

```java
int sum = 0;

for (int x : numbers) {
    if (x > 10) {
        sum += x;
    }
}
```

We explicitly tell the computer **how to perform the calculation**:

1. create `sum`
2. iterate through numbers
3. check each number
4. modify `sum`

Functional programming tends toward describing **what transformation we want**:

```java
int sum = numbers.stream()
        .filter(x -> x > 10)
        .mapToInt(x -> x)
        .sum();
```

Conceptually:

```text
numbers
   │
   ▼
filter(x > 10)
   │
   ▼
selected numbers
   │
   ▼
sum
```

The important idea is **data transformation through functions**.

---

# 3. Function as a first-class value

One of the most important ideas in functional programming is:

> **Functions can be treated like data.**

For example, you can:

* store a function in a variable
* pass a function to another function
* return a function from a function
* put functions into collections

In Java:

```java
Function<Integer, Integer> square =
        x -> x * x;
```

Then:

```java
System.out.println(square.apply(5));
```

produces:

```text
25
```

The function itself becomes a value.

---

# 4. Higher-order functions

A **higher-order function** is a function that:

1. accepts another function as an argument, or
2. returns a function.

For example:

```java
numbers.stream()
       .filter(x -> x > 10)
       .map(x -> x * 2)
       .toList();
```

Here:

```java
filter(...)
map(...)
```

receive functions:

```text
x -> x > 10
x -> x * 2
```

This is one of the foundations of functional programming.

---

# 5. Lambda expressions

A **lambda expression** is a convenient way to write an anonymous function.

Traditional Java:

```java
numbers.sort(new Comparator<Integer>() {
    @Override
    public int compare(Integer a, Integer b) {
        return a - b;
    }
});
```

Lambda:

```java
numbers.sort((a, b) -> a - b);
```

Or:

```java
x -> x * 2
```

Conceptually:

```text
input → transformation
```

For example:

```text
x → x + 1
x → x * x
x → x > 10
```

Lambda expressions became especially important in Java starting with **Java 8**.

---

# 6. Pure functions

A central concept is the **pure function**.

A pure function has two important properties:

### Same input → same output

```java
int square(int x) {
    return x * x;
}
```

For:

```text
square(5) → 25
```

It will always produce `25`.

### No side effects

It doesn't:

* modify global variables
* modify external objects
* write files
* print something
* access a database
* modify shared state

So:

```java
int square(int x) {
    return x * x;
}
```

is pure.

But:

```java
int total = 0;

int add(int x) {
    total += x;
    return total;
}
```

is not pure because it modifies external state.

---

# 7. Immutability

Functional programming strongly favors **immutable data**.

Instead of:

```text
object
   │
   ├── change state
   ├── change state
   └── change state
```

we prefer:

```text
old data
   │
   ▼
function
   │
   ▼
new data
```

For example:

```java
List<Integer> numbers = List.of(1, 2, 3);

List<Integer> doubled =
        numbers.stream()
               .map(x -> x * 2)
               .toList();
```

Conceptually:

```text
[1, 2, 3]
    │
    │ map(x → x * 2)
    ▼
[2, 4, 6]
```

The original list isn't changed.

---

# 8. Referential transparency

This is a more theoretical but very important concept.

An expression is **referentially transparent** when you can replace it with its result without changing the program's behavior.

For example:

```java
square(5)
```

always means:

```java
25
```

So:

```java
int x = square(5);
```

is equivalent to:

```java
int x = 25;
```

This makes programs easier to:

* reason about
* test
* optimize
* parallelize

---

# 9. Composition

Functional programming puts enormous emphasis on **function composition**.

Suppose we have:

```text
f(x) = x + 1

g(x) = x * 2
```

We can compose them:

```text
g(f(x))
```

which means:

```text
x
 ↓
x + 1
 ↓
× 2
```

For `x = 5`:

```text
5
↓
6
↓
12
```

Large programs can therefore be constructed by connecting small functions:

```text
input
  ↓
parse
  ↓
validate
  ↓
transform
  ↓
calculate
  ↓
format
  ↓
output
```

This is one of the most beautiful ideas in FP.

---

# 10. Map, Filter, Reduce

Three extremely important functional operations are:

### Map

Transform every element.

```text
[1, 2, 3, 4]
      │
      │ x → x × 2
      ▼
[2, 4, 6, 8]
```

Java:

```java
numbers.stream()
       .map(x -> x * 2)
```

---

### Filter

Select elements satisfying a condition.

```text
[1, 2, 3, 4, 5]
       │
       │ x > 2
       ▼
[3, 4, 5]
```

Java:

```java
numbers.stream()
       .filter(x -> x > 2)
```

---

### Reduce

Combine many values into one.

```text
[1, 2, 3, 4]
      │
      │ +
      ▼
10
```

Java:

```java
numbers.stream()
       .reduce(0, Integer::sum);
```

These three concepts appear everywhere in modern programming.

---

# 11. Recursion

Functional programming historically has a strong relationship with **recursion**.

For example, factorial:

```text
factorial(5)
= 5 × factorial(4)
= 5 × 4 × factorial(3)
= 5 × 4 × 3 × factorial(2)
= 5 × 4 × 3 × 2 × factorial(1)
= 120
```

In a functional language:

```text
factorial(n):
    if n == 0
        return 1
    else
        return n * factorial(n - 1)
```

Functional programming traditionally favors recursion instead of repeatedly modifying loop variables.

Modern languages, however, often use ordinary iteration as well because of performance and stack limitations.

---

# 12. Side effects

A **side effect** occurs when a function does something beyond producing its return value.

Examples:

```text
write to file
send HTTP request
insert database record
print to console
modify global variable
modify shared object
```

Functional programming doesn't necessarily say:

> "Side effects are forbidden."

Rather, a common goal is:

> **Keep side effects controlled and separate from pure computation.**

For example:

```text
             Pure functional core
                    │
input ──────────────┤
                    ▼
              calculate result
                    │
                    ▼
             output / side effect
```

This idea is extremely useful for backend programming.

---

# 13. Functional vs procedural

Consider calculating squares.

### Procedural approach

```java
List<Integer> result = new ArrayList<>();

for (int x : numbers) {
    result.add(x * x);
}
```

You describe the **steps**.

```text
create result
↓
loop
↓
calculate
↓
add to result
```

### Functional style

```java
List<Integer> result =
        numbers.stream()
               .map(x -> x * x)
               .toList();
```

You describe the **transformation**:

```text
numbers
   ↓
map(square)
   ↓
result
```

---

# 14. Functional vs OOP

This is particularly interesting because you've been studying OOP.

### OOP

The central abstraction is the **object**.

```text
Object
 ├── state
 └── behavior
```

For example:

```java
Student student = new Student();

student.setName("Mike");
student.study();
```

You model the system as interacting objects.

### Functional programming

The central abstraction is the **function**.

```text
data
 ↓
function
 ↓
data
 ↓
function
 ↓
data
```

For example:

```java
students
    .stream()
    .filter(Student::isActive)
    .map(Student::getName)
    .toList();
```

### But modern programming combines them

Java is a good example:

```text
OOP
 +
Generics
 +
Lambda
 +
Functional interfaces
 +
Stream API
 +
Optional
 +
Records
```

So you don't have to choose exclusively between OOP and FP.

---

# 15. Functional programming and Java

Since you're learning **Java backend development**, FP is very relevant.

Java 8 introduced major functional-programming features:

```text
Java 8
 │
 ├── Lambda expressions
 ├── Functional interfaces
 ├── Method references
 ├── Stream API
 ├── Optional
 └── Default interface methods
```

For example:

```java
List<String> names = List.of(
        "Alice",
        "Bob",
        "Charlie",
        "David"
);

List<String> result =
        names.stream()
             .filter(name -> name.length() > 4)
             .map(String::toUpperCase)
             .toList();
```

Conceptually:

```text
["Alice", "Bob", "Charlie", "David"]
                    │
                    ▼
             filter(length > 4)
                    │
                    ▼
          ["Alice", "Charlie", "David"]
                    │
                    ▼
                map(uppercase)
                    │
                    ▼
       ["ALICE", "CHARLIE", "DAVID"]
```

This is functional programming in everyday Java.

---

# 16. Languages strongly associated with FP

Some important languages in the history of functional programming are:

| Language    | Importance                                     |
| ----------- | ---------------------------------------------- |
| **Lisp**    | One of the earliest major functional languages |
| **Scheme**  | Minimal, elegant Lisp dialect                  |
| **ML**      | Strong static typing and type inference        |
| **Haskell** | Pure functional programming                    |
| **Erlang**  | Functional + concurrency/distributed systems   |
| **Clojure** | Functional Lisp on the JVM                     |
| **F#**      | Functional-first language on .NET              |
| **Scala**   | OOP + functional programming                   |
| **Elixir**  | Functional language based on Erlang VM         |

Historically, **Lisp** is especially important.

You can think of the development roughly like:

```text
Lisp
  │
  ├── Scheme
  ├── ML family
  │    └── Haskell
  │
  └── modern functional languages
       ├── Clojure
       ├── Scala
       ├── F#
       └── etc.
```

---

# 17. Why FP became important

Functional programming has several attractive properties.

### Easier reasoning

Pure functions are easier to understand:

```text
input → output
```

### Easier testing

You can test:

```java
square(5) == 25
```

without setting up complicated object state.

### Fewer shared-state problems

This is particularly valuable in concurrent programming.

Instead of:

```text
Thread A ──┐
           ├──> shared mutable state
Thread B ──┘
```

we prefer:

```text
Thread A → independent data
Thread B → independent data
```

### Easier composition

Small functions can be combined into larger operations.

### Good fit for data processing

This is why ideas such as:

```text
map
filter
reduce
```

are now common in:

* Java
* JavaScript
* Python
* C#
* C++
* SQL/data processing systems
* distributed systems

---

# 18. FP and modern backend development

Functional programming is particularly useful for backend development.

For example, imagine an order system:

```text
HTTP Request
     ↓
parse request
     ↓
validate
     ↓
calculate price
     ↓
apply discount
     ↓
calculate tax
     ↓
create response
```

Much of this can be modeled as pure transformations:

```text
Request
  ↓
ValidatedRequest
  ↓
Order
  ↓
PricedOrder
  ↓
FinalOrder
  ↓
Response
```

Then external effects are isolated:

```text
             ┌── Database
             │
Request → business logic → Response
             │
             ├── Message Queue
             │
             └── External API
```

This approach is closely related to ideas you'll encounter later in:

* Spring
* REST APIs
* message queues
* reactive programming
* concurrent programming
* distributed systems

---

# 19. A useful mental model

You can remember the difference between major paradigms like this:

```text
Procedural
    ↓
"Do these steps."

OOP
    ↓
"These objects interact."

Functional
    ↓
"Transform this data using these functions."

Declarative
    ↓
"Describe what result I want."
```

For example, SQL is strongly declarative:

```sql
SELECT name
FROM students
WHERE age >= 18;
```

You don't explicitly tell the database:

```text
open table
↓
read row
↓
check age
↓
...
```

You describe the desired result.

---

# 20. The most important FP concepts to learn

Since you're learning Java, I would learn them in this order:

```text
1. Functions as values
       ↓
2. Lambda expressions
       ↓
3. Functional interfaces
       ↓
4. Method references
       ↓
5. Higher-order functions
       ↓
6. map / filter / reduce
       ↓
7. Stream API
       ↓
8. Immutability
       ↓
9. Pure functions
       ↓
10. Function composition
       ↓
11. Optional
       ↓
12. Recursion
       ↓
13. Monads / advanced FP
```

You **do not need to learn Haskell first** to understand functional programming in Java.

For your Java backend path, I'd especially master:

```text
Lambda
   +
Functional Interface
   +
Stream
   +
map/filter/reduce
   +
Method Reference
   +
Optional
   +
Immutability
   +
Pure Function
```

These are the practical FP concepts you'll encounter constantly in modern Java code.

### One-sentence summary

> **Functional programming is a programming style that builds programs by composing functions that transform data, favoring pure functions, immutability, and controlled side effects.**
