# Clojure Introduction

**Clojure** is a modern **functional programming language** that runs primarily on the **JVM (Java Virtual Machine)**.

If Lisp is the historical root, Scheme is the minimalist branch, and Haskell is the pure-functional branch, then **Clojure is roughly the Lisp + functional programming + JVM + concurrency branch**.

```text
                    Lisp (1958)
                       │
          ┌────────────┴────────────┐
          │                         │
       Scheme                    Common Lisp
          │
          │
       Clojure ────────────────► JVM / Java ecosystem
          │
          ├── Functional programming
          ├── Immutable data
          ├── Lisp macros
          ├── Persistent data structures
          └── Concurrency
```

---

# 1. What is Clojure?

Clojure is a **general-purpose Lisp dialect** created by **Rich Hickey** and first released around **2007**.

Its main goals include:

* functional programming
* immutable data
* simplicity
* interactive development
* powerful metaprogramming
* excellent concurrency
* interoperability with Java

The most important implementation runs on the **JVM**, so Clojure can directly use Java libraries.

For example:

```clojure
(System/currentTimeMillis)
```

is calling a Java method.

You can also create Java objects:

```clojure
(def list (java.util.ArrayList.))

(.add list "Java")
(.add list "Clojure")
```

So Clojure is not merely "a Lisp language"; it is also a way to bring Lisp's programming model into the Java ecosystem.

---

# 2. Clojure is a Lisp

The first thing you notice about Clojure is its syntax.

Traditional Java:

```java
int add(int a, int b) {
    return a + b;
}
```

Clojure:

```clojure
(defn add [a b]
  (+ a b))
```

The fundamental Clojure form is:

```text
(function argument1 argument2 ...)
```

For example:

```clojure
(+ 1 2)
```

means:

```text
call + with 1 and 2
```

And:

```clojure
(* 3 4)
```

means:

```text
call * with 3 and 4
```

This is the famous **prefix notation** characteristic of Lisp.

---

# 3. Everything looks like a list

Consider:

```clojure
(+ 1 2)
```

Syntactically, this is a list:

```text
(+ 1 2)
```

Likewise:

```clojure
(print "Hello")
```

is also a list-like expression.

This gives Lisp languages an extremely powerful property:

> **Code has a data-like structure.**

This is called **homoiconicity**.

It is one of the major reasons Lisp became famous for **macros and metaprogramming**.

---

# 4. Defining functions

Clojure provides `defn` for defining functions:

```clojure
(defn square [x]
  (* x x))
```

Then:

```clojure
(square 5)
```

produces:

```text
25
```

Multiple expressions can be written:

```clojure
(defn greet [name]
  (println "Hello" name)
  (println "Nice to meet you!"))
```

---

# 5. Clojure is functional

Functions are first-class values.

For example:

```clojure
(defn square [x]
  (* x x))

(def f square)

(f 5)
```

Functions can also be passed to other functions.

```clojure
(map square [1 2 3 4])
```

Result:

```text
(1 4 9 16)
```

This is similar to Java:

```java
List.of(1, 2, 3, 4)
    .stream()
    .map(x -> x * x)
    .toList();
```

So if you know Java Streams, Clojure's functional style will feel familiar.

---

# 6. Anonymous functions

Clojure has anonymous functions:

```clojure
(fn [x]
  (* x x))
```

You can pass one directly:

```clojure
(map (fn [x] (* x x))
     [1 2 3 4])
```

Clojure also has a shorter syntax:

```clojure
(map #(* % %)
     [1 2 3 4])
```

Here:

```text
#(...)
```

creates an anonymous function.

`%` represents the first argument.

---

# 7. Immutable data

This is one of Clojure's most important ideas.

Clojure strongly emphasizes **immutable data structures**.

For example:

```clojure
(def numbers [1 2 3])
```

Rather than modifying the existing vector, you create a new value:

```clojure
(conj numbers 4)
```

Result:

```text
[1 2 3 4]
```

The original remains:

```clojure
numbers
```

```text
[1 2 3]
```

This makes concurrent programming much easier.

---

# 8. Persistent data structures

Clojure's immutable collections are not implemented by simply copying everything every time.

Instead, Clojure uses **persistent data structures**.

Conceptually:

```text
old:

        [A B C]

new:

        [A B C D]
             │
             └── shares much of the structure
```

The old and new versions can share internal structure.

Therefore:

```clojure
(def a [1 2 3])

(def b (conj a 4))
```

can efficiently maintain both:

```text
a → [1 2 3]

b → [1 2 3 4]
```

This is a very important idea in functional programming.

---

# 9. Clojure's major data structures

Clojure has four particularly important immutable collections.

### List

```clojure
'(1 2 3 4)
```

### Vector

```clojure
[1 2 3 4]
```

### Map

```clojure
{:name "Mike"
 :age 30}
```

### Set

```clojure
#{1 2 3 4}
```

Notice how concise they are.

A Clojure map:

```clojure
{:name "Alice"
 :age 25}
```

is conceptually similar to a Java:

```java
Map<String, Object>
```

but Clojure's data-oriented style is much more fundamental to the language.

---

# 10. Map, filter, reduce

Functional programming becomes especially visible with:

```clojure
map
filter
reduce
```

For example:

```clojure
(map #(* % 2)
     [1 2 3 4])
```

Result:

```text
(2 4 6 8)
```

Filter:

```clojure
(filter even? [1 2 3 4 5 6])
```

Result:

```text
(2 4 6)
```

Reduce:

```clojure
(reduce + [1 2 3 4])
```

Result:

```text
10
```

This corresponds closely to Java Streams:

```java
numbers.stream()
       .filter(x -> x % 2 == 0)
       .map(x -> x * 2)
       .reduce(0, Integer::sum);
```

---

# 11. Clojure has powerful macros

This is one of the biggest differences between Clojure and Java.

Because Clojure programs have a regular Lisp structure, programs can manipulate programs.

For example:

```clojure
(when condition
  (println "Hello"))
```

`when` is implemented as a **macro**.

Conceptually:

```text
Clojure source
      ↓
   macro expansion
      ↓
 ordinary Clojure forms
      ↓
 evaluation
```

This allows developers to extend the language itself.

This idea comes directly from the Lisp tradition.

---

# 12. Clojure and concurrency

Concurrency is one of Clojure's strongest areas.

Rich Hickey designed Clojure around the idea that:

> **Immutable data + controlled state = easier concurrency**

Clojure provides several mechanisms for managing state:

```text
Atom
Agent
Ref
Var
```

### Atom

Used for independent synchronous state changes.

```clojure
(def counter (atom 0))

(swap! counter inc)
```

Now:

```clojure
@counter
```

returns:

```text
1
```

Multiple threads can safely update the atom.

---

# 13. Clojure's concurrency philosophy

Compare traditional Java:

```text
Thread
   ↓
shared mutable object
   ↓
synchronized
   ↓
locks
   ↓
possible race conditions
```

Clojure tries to move toward:

```text
immutable data
      +
controlled state
      +
message/state-management abstractions
      ↓
simpler concurrency
```

This is conceptually related to the concerns that led Erlang toward **isolated processes and message passing**, although the mechanisms are different.

---

# 14. Clojure runs on the JVM

This is extremely important for Java developers.

Clojure:

```text
Clojure source
      ↓
Clojure compiler
      ↓
JVM bytecode
      ↓
JVM
```

Therefore Clojure can access Java:

```clojure
(java.util.UUID/randomUUID)
```

Java classes:

```clojure
(java.util.Date.)
```

Java methods:

```clojure
(.toUpperCase "hello")
```

Clojure can therefore reuse the enormous Java ecosystem.

---

# 15. Clojure is dynamically typed

Unlike ML and Haskell, Clojure does not normally require static type declarations.

For example:

```clojure
(defn add [a b]
  (+ a b))
```

There is no explicit:

```text
int
int
int
```

type declaration.

Clojure determines the types at runtime.

This makes it closer to:

```text
Scheme
Lisp
Python
JavaScript
```

than:

```text
Java
ML
Haskell
Rust
```

in its default typing philosophy.

---

# 16. But Clojure can use type hints

Because Clojure runs on the JVM, you can sometimes provide type information:

```clojure
(defn length [^String s]
  (.length s))
```

Here:

```text
^String
```

is a type hint.

This can help with Java interoperation and performance.

---

# 17. Clojure is eager by default

This is an important comparison with Haskell.

### Clojure

Generally:

```text
eager evaluation
```

### Haskell

Fundamentally:

```text
lazy evaluation
```

However, Clojure supports **lazy sequences**.

For example:

```clojure
(take 5 (range))
```

produces:

```text
(0 1 2 3 4)
```

Even though:

```clojure
(range)
```

represents an unbounded sequence.

So Clojure gives you laziness where useful without making the entire language lazy.

---

# 18. Clojure REPL

Clojure strongly emphasizes interactive development.

You can start a **REPL**:

```text
Read
Evaluate
Print
Loop
```

Then:

```clojure
(+ 1 2)
```

and immediately get:

```text
3
```

Try:

```clojure
(map #(* % %) [1 2 3 4])
```

and immediately get:

```text
(1 4 9 16)
```

This is a major part of the Lisp programming experience.

Instead of:

```text
write large program
      ↓
compile
      ↓
run
      ↓
debug
```

you can develop incrementally:

```text
write expression
      ↓
evaluate
      ↓
inspect result
      ↓
modify
      ↓
continue
```

---

# 19. Clojure and Java

Since you're learning Java backend development, Clojure is especially interesting.

A Java programmer sees:

```java
List<Integer> numbers = List.of(1, 2, 3, 4);

List<Integer> result =
    numbers.stream()
           .map(x -> x * 2)
           .toList();
```

Clojure:

```clojure
(map #(* % 2)
     [1 2 3 4])
```

The underlying ideas are very similar:

```text
Java                     Clojure

lambda                   anonymous function
Stream                   sequence
map()                    map
filter()                 filter
reduce()                 reduce
record / immutable class immutable data
Optional                 nil/option-oriented patterns
sealed types             ADTs / data-oriented design
Executor/concurrency    atoms/agents/refs
reflection               Java interop/macros
```

But the programming philosophies are different.

---

# 20. Clojure vs Scheme

Clojure grew out of the Lisp/Scheme tradition.

|                        | Scheme                   | Clojure           |
| ---------------------- | ------------------------ | ----------------- |
| Family                 | Lisp                     | Lisp              |
| Syntax                 | S-expressions            | S-expressions     |
| Typing                 | Dynamic                  | Dynamic           |
| FP                     | Strong                   | Strong            |
| Immutability           | Common                   | Fundamental       |
| Macros                 | Yes                      | Yes               |
| JVM                    | No                       | Yes               |
| Persistent collections | Not central historically | Very important    |
| Concurrency            | Not central              | Major design goal |
| Java interoperability  | No                       | Excellent         |

A useful mental model:

> **Scheme = minimalist Lisp laboratory**

> **Clojure = modern Lisp designed for practical software, JVM interoperability, immutable data, and concurrency**

---

# 21. Clojure vs Haskell

|              | Clojure                               | Haskell                              |
| ------------ | ------------------------------------- | ------------------------------------ |
| Family       | Lisp                                  | ML-derived                           |
| Typing       | Dynamic                               | Static                               |
| Evaluation   | Mostly eager                          | Lazy                                 |
| Purity       | Functional, but not purely functional | Pure                                 |
| Immutability | Strongly emphasized                   | Fundamental                          |
| Macros       | Extremely powerful                    | Different metaprogramming mechanisms |
| JVM          | Yes                                   | No                                   |
| Concurrency  | Major strength                        | Strong                               |
| Type system  | Relatively dynamic/simple             | Very powerful                        |
| Syntax       | Lisp/S-expressions                    | Traditional algebraic syntax         |

A useful distinction:

```text
Clojure
  = Lisp + functional programming + JVM

Haskell
  = pure functional programming + static types + lazy evaluation
```

---

# 22. Clojure vs Erlang

This comparison is particularly interesting.

Both care deeply about concurrency, but they approach it differently.

### Clojure

```text
immutable shared data
       +
controlled state
       +
JVM
```

### Erlang

```text
isolated processes
       +
message passing
       +
supervision
       +
BEAM
```

So:

```text
Clojure → immutable data-oriented concurrency

Erlang → actor/message-oriented concurrency
```

Both influenced modern thinking about concurrent systems.

---

# 23. Clojure's place in programming-language history

You can place it into the functional-language family like this:

```text
                         Lisp
                          │
                 ┌────────┴────────┐
                 │                 │
              Scheme          Common Lisp
                 │                 │
                 │                 │
                 └───────┬─────────┘
                         │
                      Clojure
                         │
                        JVM
                         │
                  Java ecosystem
```

At the same time, another major branch developed:

```text
              ML
              │
       ┌──────┼─────────┐
       │      │         │
      SML   OCaml      F#
              │
              │
           Haskell
```

And another:

```text
              Erlang
                 │
          ┌──────┴──────┐
          │             │
       Elixir        other BEAM
```

So Clojure belongs to the **Lisp/functional lineage**, while also being deeply connected to the **JVM/Java ecosystem**.

---

# 24. Why Clojure is historically important

Clojure brought several older ideas together into a modern language:

```text
Lisp
  │
  ├── S-expressions
  ├── macros
  ├── homoiconicity
  │
Functional programming
  │
  ├── functions as values
  ├── map/filter/reduce
  ├── immutable data
  │
Modern software engineering
  │
  ├── persistent data structures
  ├── concurrency
  ├── REPL-driven development
  │
Java ecosystem
  │
  ├── JVM
  ├── Java libraries
  └── Java interoperability
```

That combination is the real significance of Clojure.

---

# 25. The bigger functional-programming map

Since you've been studying **Scheme → ML → Haskell → Erlang → Clojure**, you can now see several different answers to the question:

> **How should we build programs using functional ideas?**

```text
Lisp
 │
 ├── Scheme
 │    └── minimalist functional programming
 │
 ├── Common Lisp
 │    └── large multi-paradigm Lisp
 │
 └── Clojure
      ├── Lisp
      ├── immutable data
      ├── functional programming
      ├── concurrency
      └── JVM


ML
 │
 ├── Standard ML
 ├── OCaml
 └── F#
      │
      └── typed functional programming


Haskell
 │
 └── pure + lazy + strongly typed FP


Erlang
 │
 └── functional + concurrent + distributed + fault tolerant
```

And then:

```text
Clojure
   │
   └── Elixir / other Lisp-on-BEAM ideas
```

---

# 26. One-sentence summary

> **Clojure is a modern Lisp dialect that combines functional programming, immutable/persistent data structures, powerful macros, and concurrency with the Java/JVM ecosystem.**

For your language-history study, I would remember the functional languages in roughly this conceptual order:

```text
Lisp
  ↓
Scheme
  ↓
ML ─────→ Haskell
  │
  └──────→ typed functional programming

Lisp
  ↓
Clojure
  ↓
functional programming + JVM + concurrency

Erlang
  ↓
functional programming + actor model
  ↓
Elixir
```

The particularly important contrast is **Clojure vs Haskell vs Erlang**: they all embrace functional ideas, but **Clojure emphasizes immutable data + Lisp + JVM**, **Haskell emphasizes purity + types + laziness**, and **Erlang emphasizes processes + messages + fault tolerance**.
