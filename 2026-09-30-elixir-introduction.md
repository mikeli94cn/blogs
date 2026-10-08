# Elixir Introduction

**Elixir** is a modern **functional, concurrent, distributed programming language** that runs on the **BEAM virtual machine**, the same virtual machine originally developed for Erlang.

A useful mental model is:

> **Elixir = Erlang's concurrency/fault-tolerance model + Ruby-like syntax + modern functional programming**

If you have been following the languages in this series:

```text
Lisp → Scheme → ML → Haskell → Erlang → Clojure → F# → Scala → Elixir
```

Elixir is especially interesting because it takes the **Erlang/BEAM model** and gives it a more modern, approachable syntax and ecosystem.

---

# 1. Where does Elixir come from?

The history looks roughly like this:

```text
1980s
Erlang
  │
  │ BEAM / OTP
  │
  └──────────────────┐
                     │
2011                 ↓
                  Elixir
                     │
                     ├── functional programming
                     ├── actor/process model
                     ├── fault tolerance
                     ├── distributed systems
                     └── modern syntax
```

Elixir was created by **José Valim** and first appeared around **2011**.

Valim was interested in building a language that could use the powerful Erlang/BEAM runtime while providing a more expressive modern programming experience.

---

# 2. The most important idea

Elixir's most important characteristic is not actually its syntax.

It is the **BEAM execution model**.

The core philosophy is:

```text
many lightweight processes
        ↓
isolated state
        ↓
message passing
        ↓
supervision
        ↓
fault tolerance
        ↓
distributed systems
```

This comes directly from Erlang.

That makes Elixir particularly suitable for:

* web servers
* real-time applications
* messaging systems
* distributed systems
* telecom systems
* chat systems
* high-concurrency services
* fault-tolerant backend systems

---

# 3. A simple Elixir program

```elixir
defmodule Hello do
  def greet(name) do
    IO.puts("Hello, #{name}!")
  end
end

Hello.greet("Alice")
```

Output:

```text
Hello, Alice!
```

The syntax is much more approachable if you've seen Ruby or Python.

---

# 4. Functions

Elixir functions look like:

```elixir
def add(a, b) do
  a + b
end
```

Call it:

```elixir
add(10, 20)
```

Result:

```text
30
```

You can also write a short function:

```elixir
def add(a, b), do: a + b
```

---

# 5. Immutable data

Like Erlang and most functional languages, Elixir emphasizes **immutability**.

For example:

```elixir
numbers = [1, 2, 3]
new_numbers = numbers ++ [4]
```

You now have:

```text
numbers     → [1, 2, 3]

new_numbers → [1, 2, 3, 4]
```

The original value wasn't modified.

This is important because BEAM processes are designed around isolated state.

---

# 6. Variables are immutable

Consider:

```elixir
x = 10
```

You might expect:

```text
x = 20
```

to mean "change x."

But Elixir's model is more functional.

You can rebind:

```elixir
x = 20
```

but you're creating a new binding rather than mutating an existing object in the traditional imperative sense.

This is similar to the functional style of:

* Erlang
* Clojure
* F#
* Haskell

---

# 7. Pattern matching

Pattern matching is fundamental.

For example:

```elixir
{:ok, value} = {:ok, 42}
```

Now:

```elixir
value
```

is:

```text
42
```

But:

```elixir
{:ok, value} = {:error, "failed"}
```

fails because the structure doesn't match.

This is much more than ordinary assignment.

Think of:

```text
pattern = value
```

as:

> **Does this value have this structure? If so, extract the pieces.**

---

# 8. Pattern matching with functions

Elixir can define multiple versions of a function based on patterns.

```elixir
def describe(0), do: "zero"
def describe(1), do: "one"
def describe(_), do: "something else"
```

Then:

```elixir
describe(0)
```

returns:

```text
"zero"
```

and:

```elixir
describe(10)
```

returns:

```text
"something else"
```

This is very similar to:

```text
F#       match
Haskell  pattern matching
Scala    match
Elixir   pattern matching
```

---

# 9. Lists

Elixir uses lists heavily.

```elixir
numbers = [1, 2, 3, 4]
```

A list can be decomposed:

```elixir
[head | tail] = [1, 2, 3, 4]
```

Now:

```text
head → 1
tail → [2, 3, 4]
```

This is closely related to Lisp's:

```text
car
cdr
```

and ML/Haskell's list pattern matching.

---

# 10. Map

Elixir also has maps:

```elixir
person = %{
  name: "Alice",
  age: 25
}
```

Access:

```elixir
person.name
```

Result:

```text
"Alice"
```

Maps are extremely common in Elixir applications.

---

# 11. Tuples

Tuples are also fundamental:

```elixir
{:ok, "Alice"}
```

or:

```elixir
{:error, "User not found"}
```

This convention is extremely important in Elixir.

You will frequently see:

```text
{:ok, value}
{:error, reason}
```

For example:

```elixir
case find_user(id) do
  {:ok, user} ->
    process(user)

  {:error, reason} ->
    handle_error(reason)
end
```

This is one of the standard patterns for representing success and failure.

---

# 12. `case`

Elixir's `case` performs pattern matching:

```elixir
case result do
  {:ok, value} ->
    IO.puts(value)

  {:error, reason} ->
    IO.puts(reason)
end
```

Conceptually:

```text
value
  │
  ├── {:ok, value}
  │
  └── {:error, reason}
```

This is similar to pattern matching in:

* F#
* Haskell
* OCaml
* Scala
* Rust

---

# 13. `cond`

Elixir also has `cond`:

```elixir
cond do
  age < 13 -> "child"
  age < 20 -> "teenager"
  true     -> "adult"
end
```

It is similar to a sequence of conditions.

---

# 14. Higher-order functions

Functions can be passed around.

For example:

```elixir
Enum.map([1, 2, 3, 4], fn x ->
  x * 2
end)
```

Result:

```text
[2, 4, 6, 8]
```

Filter:

```elixir
Enum.filter([1, 2, 3, 4], fn x ->
  rem(x, 2) == 0
end)
```

Result:

```text
[2, 4]
```

Reduce:

```elixir
Enum.reduce([1, 2, 3, 4], 0, fn x, acc ->
  x + acc
end)
```

Result:

```text
10
```

Again:

```text
map
filter
reduce
```

are central functional-programming concepts.

---

# 15. The pipe operator

One of Elixir's most recognizable features is:

```text
|>
```

For example:

```elixir
numbers
|> Enum.filter(fn x -> rem(x, 2) == 0 end)
|> Enum.map(fn x -> x * 2 end)
|> Enum.sum()
```

Read it as:

```text
numbers
   ↓
filter
   ↓
map
   ↓
sum
```

This is very similar to F#'s:

```text
|>
```

although the exact semantics and syntax differ.

It makes data-processing pipelines very readable.

---

# 16. Anonymous functions

Elixir uses:

```elixir
fn x -> x * 2 end
```

for anonymous functions.

For example:

```elixir
Enum.map([1, 2, 3], fn x ->
  x * 2
end)
```

There is also a shorthand:

```elixir
Enum.map([1, 2, 3], &(&1 * 2))
```

`&1` means the first argument.

---

# 17. The most important feature: processes

Now we reach the heart of Elixir.

An Elixir **process** is not an operating-system process.

It is a very lightweight BEAM process.

You can create one:

```elixir
spawn(fn ->
  IO.puts("Hello from another process!")
end)
```

The BEAM can support **very large numbers of lightweight processes** compared with traditional OS threads/processes.

The model is:

```text
Process A
   │
   │ message
   ↓
Process B
   │
   │ message
   ↓
Process C
```

Each process has its own isolated state.

---

# 18. Message passing

Processes communicate by sending messages.

For example:

```elixir
pid = spawn(fn ->
  receive do
    {:hello, name} ->
      IO.puts("Hello #{name}")
  end
end)
```

Send a message:

```elixir
send(pid, {:hello, "Alice"})
```

The receiving process handles:

```elixir
{:hello, "Alice"}
```

This is the **actor model** style of concurrency.

---

# 19. Why isolated processes matter

Traditional Java concurrency often looks like:

```text
Thread A
   │
   ├────── shared object
   │
Thread B
   │
   └────── shared object
```

Now you need to worry about:

* locks
* synchronized blocks
* race conditions
* deadlocks
* visibility
* atomic operations

Elixir prefers:

```text
Process A        Process B
    │                │
 private state    private state
    │                │
    └── messages ────┘
```

The processes don't normally share mutable memory.

This dramatically changes the concurrency model.

---

# 20. "Let it crash"

One of Erlang/Elixir's most famous philosophies is:

> **Let it crash.**

This doesn't mean writing bad software.

It means that instead of making every component responsible for recovering from every possible failure, you can allow a failed process to terminate and let a **supervisor** restart it.

Conceptually:

```text
Supervisor
    │
    ├── Worker A
    ├── Worker B
    └── Worker C
```

If Worker B crashes:

```text
Supervisor
    │
    ├── Worker A
    ├── Worker B  ← crashed
    └── Worker C
```

The supervisor can restart it:

```text
Supervisor
    │
    ├── Worker A
    ├── Worker B  ← restarted
    └── Worker C
```

This is one of the most important ideas inherited from Erlang.

---

# 21. Supervision trees

Real Elixir systems often have hierarchical supervision:

```text
Application
    │
    └── Supervisor
          │
          ├── Supervisor
          │      ├── Worker
          │      └── Worker
          │
          └── Supervisor
                 ├── Worker
                 └── Worker
```

This is called a **supervision tree**.

It provides structured fault recovery.

---

# 22. OTP

**OTP** originally stood for **Open Telecom Platform**, but today it is better understood as Erlang/BEAM's standard framework for building reliable applications.

OTP provides abstractions such as:

* supervisors
* GenServer
* applications
* processes
* state machines
* fault-tolerance patterns

Elixir builds heavily on OTP.

A typical Elixir backend isn't simply:

```text
Elixir language
```

It is more like:

```text
Elixir
   ↓
BEAM
   +
OTP
   ↓
Elixir application
```

---

# 23. GenServer

One of the most important OTP abstractions in Elixir is **GenServer**.

Conceptually:

```text
Client
  │
  │ request
  ↓
GenServer
  │
  ├── state
  ├── handle_call
  ├── handle_cast
  └── handle_info
```

For example, you can build a server maintaining a counter:

```elixir
defmodule Counter do
  use GenServer

  def start_link(initial) do
    GenServer.start_link(__MODULE__, initial)
  end

  def init(initial) do
    {:ok, initial}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_cast(:increment, state) do
    {:noreply, state + 1}
  end
end
```

This is a powerful abstraction for encapsulated concurrent state.

---

# 24. Elixir and Erlang

The relationship is extremely close.

```text
Erlang
  │
  ├── BEAM
  ├── OTP
  ├── actor/process model
  ├── supervision
  └── distributed computing
        │
        ↓
      Elixir
        │
        ├── modern syntax
        ├── macros
        ├── tooling
        ├── Mix
        └── Phoenix
```

Elixir can also call Erlang functions directly.

For example:

```elixir
:crypto.hash(:sha256, "hello")
```

The:

```text
:crypto
```

module is an Erlang module.

So Elixir doesn't replace Erlang's ecosystem.

It builds on it.

---

# 25. Elixir vs Erlang

|                  | Erlang                       | Elixir                |
| ---------------- | ---------------------------- | --------------------- |
| Runtime          | BEAM                         | BEAM                  |
| Functional       | Yes                          | Yes                   |
| Immutable        | Yes                          | Yes                   |
| Processes        | Core                         | Core                  |
| Message passing  | Core                         | Core                  |
| Supervision      | OTP                          | OTP                   |
| Distributed      | Excellent                    | Excellent             |
| Syntax           | Erlang syntax                | Ruby-inspired syntax  |
| Macros           | Limited compared with Elixir | Powerful              |
| Tooling          | Mature                       | Modern                |
| Web ecosystem    | Mature                       | Phoenix               |
| Interoperability | Native                       | Excellent with Erlang |

The most important thing:

> **Elixir did not replace Erlang's execution model. It made that model more accessible to a new generation of programmers.**

---

# 26. Elixir vs Clojure

This is a particularly interesting comparison because **both are modern Lisp-family functional languages**, but they run on different virtual machines.

```text
Clojure
   ↓
JVM

Elixir
   ↓
BEAM
```

|                 | Clojure                 | Elixir                    |
| --------------- | ----------------------- | ------------------------- |
| Family          | Lisp                    | Erlang/Lisp-influenced    |
| Runtime         | JVM                     | BEAM                      |
| Typing          | Dynamic                 | Dynamic                   |
| Functional      | Strong                  | Strong                    |
| Immutable data  | Core                    | Core                      |
| Macros          | Powerful                | Powerful                  |
| Concurrency     | Atoms/Refs/Agents + JVM | BEAM processes + messages |
| Distribution    | Supported               | Core strength             |
| Fault tolerance | Good                    | Exceptional               |
| Java ecosystem  | Excellent               | No                        |
| Web             | Ring, etc.              | Phoenix                   |

A useful mental model:

```text
Clojure
= Lisp + JVM + immutable data

Elixir
= functional programming + BEAM + processes + OTP
```

---

# 27. Elixir vs Haskell

|                 | Elixir                         | Haskell       |
| --------------- | ------------------------------ | ------------- |
| Static typing   | No                             | Yes           |
| Pure            | No                             | Yes           |
| Lazy            | No                             | Yes           |
| Immutable       | Yes                            | Yes           |
| Functional      | Strong                         | Very strong   |
| Concurrency     | Major focus                    | Strong        |
| Distribution    | Major focus                    | Less central  |
| Fault tolerance | Major focus                    | Less central  |
| Runtime         | BEAM                           | GHC/runtime   |
| Main strength   | Concurrent distributed systems | Pure typed FP |

So:

```text
Haskell
→ "How can we make functional programming mathematically pure and strongly typed?"

Elixir
→ "How can we build highly concurrent, distributed, fault-tolerant software?"
```

---

# 28. Elixir vs F#

These are also interesting opposites.

```text
F#
  ↓
ML
  ↓
static typing
  ↓
.NET

Elixir
  ↓
Erlang
  ↓
dynamic typing
  ↓
BEAM
```

|                  | F#               | Elixir             |
| ---------------- | ---------------- | ------------------ |
| Family           | ML               | Erlang             |
| Typing           | Static           | Dynamic            |
| Type inference   | Strong           | Runtime            |
| Functional       | First-class      | First-class        |
| Pattern matching | Core             | Core               |
| ADTs             | Core             | Different approach |
| Runtime          | .NET             | BEAM               |
| Concurrency      | .NET async/tasks | BEAM processes     |
| Distribution     | Available        | Core strength      |
| Fault tolerance  | Conventional     | OTP/supervision    |

---

# 29. Elixir and web development

This is where Elixir became particularly famous.

The major web framework is:

**Phoenix**.

Conceptually:

```text
Browser
   │
 HTTP/WebSocket
   ↓
Phoenix
   ↓
Elixir
   ↓
OTP
   ↓
BEAM
```

Phoenix is particularly well suited to:

* real-time applications
* chat
* dashboards
* notifications
* multiplayer applications
* collaborative applications
* high-concurrency web services

---

# 30. Phoenix LiveView

One particularly interesting technology in the Elixir ecosystem is **Phoenix LiveView**.

It allows developers to build highly interactive web interfaces while keeping much of the application logic on the server.

Conceptually:

```text
Browser
   │
   │ events
   ↓
LiveView
   │
   │ state changes
   ↓
BEAM process
   │
   │ updates
   ↓
Browser
```

This takes advantage of the BEAM's lightweight-process model.

---

# 31. Why BEAM is special

The BEAM was designed for systems where:

```text
many users
+
many concurrent activities
+
network communication
+
partial failures
+
long-running services
```

are normal.

That is very different from the original design goals of many programming languages.

For example:

```text
C
→ systems programming

FORTRAN
→ scientific computation

Java
→ portable enterprise/general-purpose computing

Haskell
→ pure functional programming

Elixir/Erlang
→ concurrent distributed fault-tolerant systems
```

This is why Elixir's runtime is arguably more important than its syntax.

---

# 32. Hot code upgrades

One fascinating capability inherited from Erlang is **hot code upgrading**.

In appropriate architectures, BEAM systems can update code while the system remains running.

Conceptually:

```text
Version 1
   │
   │ running
   ↓
update code
   ↓
Version 2
   │
   │ still running
   ↓
no traditional full restart
```

This capability came from Erlang's telecom origins, where stopping a running system could be extremely expensive.

---

# 33. Distributed Elixir

BEAM systems can run multiple nodes:

```text
Node A
   │
   │ messages
   ↓
Node B
   │
   │ messages
   ↓
Node C
```

Processes can communicate across nodes.

This makes distribution a natural part of the BEAM model rather than something bolted on afterward.

---

# 34. Mix

Elixir has a build/project tool called **Mix**.

For example:

```bash
mix new my_app
```

creates a project.

You can then use commands such as:

```bash
mix compile
mix test
mix run
```

Conceptually:

```text
Mix
 ≈
 Maven for Java
 npm for JavaScript
 Cargo for Rust
```

It manages:

* projects
* dependencies
* compilation
* testing
* tasks

---

# 35. ExUnit

Elixir has a built-in testing framework called **ExUnit**.

For example:

```elixir
defmodule MathTest do
  use ExUnit.Case

  test "addition" do
    assert 1 + 2 == 3
  end
end
```

Then:

```bash
mix test
```

This makes testing a natural part of the development workflow.

---

# 36. Elixir's historical significance

Elixir represents an important evolution of the Erlang tradition.

You can visualize it as:

```text
Erlang
  │
  ├── functional programming
  ├── immutable data
  ├── lightweight processes
  ├── message passing
  ├── supervision
  ├── distributed computing
  └── fault tolerance
          │
          ↓
       Elixir
          │
          ├── modern syntax
          ├── powerful macros
          ├── Mix
          ├── Hex
          └── Phoenix
```

It essentially made the **Erlang/OTP philosophy** attractive to a broader developer audience.

---

# 37. The functional-language map

At this point, your functional-language history can be organized like this:

```text
                         Functional Programming
                                  │
          ┌───────────────────────┼──────────────────────┐
          │                       │                      │
         Lisp                     ML                   Erlang
          │                       │                      │
    ┌─────┴─────┐          ┌──────┼──────┐               │
    │           │           │      │      │               │
 Scheme      Clojure       SML   OCaml    F#            Elixir
    │           │                  │       │               │
    │           │                  │       └── .NET        │
    │           └── JVM            │                       │
    │                              │                       │
    └── minimalist                 └── ML                  └── BEAM
                                                               │
                                                               ├── OTP
                                                               └── Phoenix


                     Haskell
                         │
                         └── pure + lazy + strongly typed FP


                     Scala
                         │
                         └── FP + OOP + JVM
```

---

# 38. The major functional languages you've studied

You can now distinguish them by their **main contribution**:

| Language    | Main idea                                               |
| ----------- | ------------------------------------------------------- |
| **Lisp**    | Symbolic programming, functional ideas, code-as-data    |
| **Scheme**  | Minimalist Lisp, lexical scope, language concepts       |
| **ML**      | Static typing + type inference + pattern matching       |
| **Haskell** | Pure functional programming + laziness + advanced types |
| **Erlang**  | Functional programming + concurrency + fault tolerance  |
| **Clojure** | Lisp + immutable data + JVM                             |
| **F#**      | ML + functional programming + .NET                      |
| **Scala**   | FP + OOP + advanced types + JVM                         |
| **Elixir**  | Erlang/BEAM + modern functional language + OTP          |

This is a very useful historical perspective:

```text
Lisp
  ↓
functional programming + metaprogramming

ML
  ↓
functional programming + static types

Haskell
  ↓
functional programming + purity

Erlang
  ↓
functional programming + concurrency

Clojure
  ↓
Lisp + JVM

F#
  ↓
ML + .NET

Scala
  ↓
FP + OOP + JVM

Elixir
  ↓
Erlang + modern syntax + OTP/Phoenix
```

---

# 39. The simplest way to remember Elixir

If you're coming from Java backend development, remember this contrast:

```text
Java backend

HTTP
 ↓
Spring
 ↓
Threads / ExecutorService
 ↓
JVM
 ↓
shared-memory concurrency
```

versus:

```text
Elixir backend

HTTP
 ↓
Phoenix
 ↓
BEAM processes
 ↓
OTP supervision
 ↓
message passing
 ↓
fault-tolerant distributed system
```

And the core philosophy is:

> **Don't make one giant process responsible for everything. Build many isolated processes that communicate through messages, and let supervisors recover failed components.**

That is the fundamental idea that makes **Elixir/Erlang** different from most mainstream backend languages.
