# Erlang

**Erlang** is a programming language designed for **concurrent, distributed, fault-tolerant systems**.

It was created at **Ericsson** in the 1980s, primarily by **Joe Armstrong, Robert Virding, and Mike Williams**.

If we continue the functional-programming history you've been exploring:

```text
Lisp
  │
  ├── Scheme
  │
  └── functional programming
          │
          ├── ML ──→ Haskell
          │
          └── Erlang
                │
                └── Elixir
```

But Erlang has a somewhat different emphasis from Scheme, ML, and Haskell:

> **Scheme → simplicity and language concepts**

> **ML → functional programming + strong types**

> **Haskell → pure functional programming + advanced types**

> **Erlang → functional programming + concurrency + distributed systems + fault tolerance**

That last combination is what makes Erlang historically important.

---

# 1. Why was Erlang created?

Erlang was created for **telecommunications systems**.

Telecommunication software has unusually demanding requirements:

```text
Millions of events
        ↓
many concurrent connections
        ↓
systems must run 24/7
        ↓
individual components can fail
        ↓
system should keep working
```

Imagine a telephone network.

You can't simply say:

> "The server crashed. Let's restart the whole application."

A telecom system may have:

```text
millions of calls
thousands of processes
multiple machines
network failures
hardware failures
software failures
```

The system needs to continue operating.

Erlang was designed around exactly this kind of problem.

---

# 2. Erlang's core philosophy

A useful summary is:

```text
Erlang
│
├── Functional programming
│
├── Lightweight processes
│
├── Message passing
│
├── Isolation
│
├── Supervision
│
├── Fault tolerance
│
├── Distribution
│
└── Hot code upgrades
```

The famous Erlang philosophy is often summarized as:

> **"Let it crash."**

This doesn't mean:

> "Write buggy programs."

It means:

> **Don't make every component responsible for recovering from every possible failure. Isolate failures and let supervisors restart failed components.**

This is a radically different approach from traditional defensive programming.

---

# 3. A tiny Erlang program

A simple function:

```erlang
square(X) ->
    X * X.
```

Calling:

```erlang
square(5).
```

produces:

```text
25
```

Notice that this looks somewhat like other functional languages:

```text
Scheme:
(define (square x)
  (* x x))

ML:
fun square x = x * x

Haskell:
square x = x * x

Erlang:
square(X) ->
    X * X.
```

So Erlang clearly belongs to the **functional programming family**.

---

# 4. Erlang is dynamically typed

Unlike ML and Haskell, traditional Erlang is **dynamically typed**.

For example:

```erlang
X = 10.
```

Then:

```erlang
X = 20.
```

will fail.

Why?

Because Erlang variables are **single-assignment**.

Once:

```erlang
X = 10.
```

has matched `X` with `10`, you cannot make `X` refer to another value.

This is different from traditional imperative variables.

---

# 5. Single assignment

Consider Java:

```java
int x = 10;
x = 20;
```

This is normal mutable-variable behavior.

Erlang:

```erlang
X = 10.
X = 20.
```

The second expression fails because `X` has already been bound.

This gives Erlang an important functional characteristic:

```text
variable
   ↓
bind once
   ↓
value
```

rather than:

```text
variable
   ↓
change
   ↓
change
   ↓
change
```

---

# 6. Pattern matching

Erlang heavily uses **pattern matching**.

For example:

```erlang
{ok, Value} = {ok, 100}.
```

Now:

```text
Value = 100
```

But:

```erlang
{ok, Value} = {error, failed}.
```

doesn't match.

Pattern matching is used everywhere in Erlang:

```text
function arguments
case expressions
message handling
data extraction
error handling
```

This should remind you of ML and Haskell.

---

# 7. Lists

Erlang has lists:

```erlang
Numbers = [1, 2, 3, 4, 5].
```

You can use:

```erlang
lists:map(fun(X) -> X * 2 end, Numbers).
```

Result:

```text
[2,4,6,8,10]
```

Compare:

### Haskell

```haskell
map (*2) [1,2,3,4,5]
```

### Erlang

```erlang
lists:map(fun(X) -> X * 2 end, Numbers).
```

### Java

```java
numbers.stream()
       .map(x -> x * 2)
       .toList();
```

The underlying idea is the same:

```text
data
 ↓
function
 ↓
transformed data
```

---

# 8. But Erlang's real superpower is concurrency

This is where Erlang becomes very different from ordinary functional languages.

Erlang has extremely lightweight **processes**.

These are **not operating-system processes** in the traditional sense.

You can create huge numbers of Erlang processes.

Conceptually:

```text
Process A
Process B
Process C
Process D
...
Process 1,000,000
```

They are managed by the Erlang runtime.

---

# 9. Erlang processes are isolated

This is one of Erlang's most important design principles.

Imagine:

```text
Process A
   │
   └── its own state

Process B
   │
   └── its own state

Process C
   │
   └── its own state
```

They don't normally share mutable memory.

Instead, they communicate through **messages**.

This is called the **actor model** style of concurrency.

---

# 10. Message passing

Suppose process A wants to communicate with process B.

Instead of:

```text
shared memory
     ↑
A ←──┼──→ B
```

Erlang uses:

```text
A ───── message ─────→ B
```

For example, conceptually:

```erlang
Pid ! {hello, "Mike"}.
```

The `!` operator sends a message.

Process B can receive it:

```erlang
receive
    {hello, Name} ->
        ...
end.
```

This is the fundamental concurrency model:

```text
process
   │
   ├── send message
   │
   ▼
another process
```

---

# 11. Why message passing matters

Traditional multithreaded programming often uses:

```text
shared memory
+
locks
+
mutexes
+
semaphores
+
condition variables
```

For example:

```text
Thread A ──┐
           │
           ▼
      shared state
           ▲
           │
Thread B ──┘
```

This can produce:

```text
race conditions
deadlocks
lock contention
memory visibility problems
```

Erlang takes a different approach:

```text
Process A             Process B
    │                     ▲
    └────── message ──────┘
```

This dramatically reduces the need for shared-state synchronization.

---

# 12. Erlang processes are cheap

This is crucial.

In Java, you normally wouldn't create one OS thread for every small logical task.

Erlang processes are much lighter.

So you can model an application as:

```text
Connection 1 → process
Connection 2 → process
Connection 3 → process
Connection 4 → process
...
```

This makes concurrency feel natural.

This design strongly influenced later systems.

---

# 13. Actor model

Erlang is one of the most successful real-world implementations of the **actor model**.

An actor essentially:

```text
Actor
│
├── private state
│
├── receives messages
│
├── processes messages
│
├── changes its own state
│
└── sends messages
```

Conceptually:

```text
       message
A ─────────────────→ B
│                    │
│                    ├── process
│                    ├── update state
│                    └── send message
│
└────────────────────────────→ C
```

This model became influential in distributed systems.

---

# 14. "Let it crash"

This is probably Erlang's most famous philosophy.

Suppose you have:

```text
Web server
    │
    ├── user process
    ├── database process
    ├── payment process
    └── logging process
```

If the payment process crashes, Erlang doesn't necessarily try to make that process magically recover itself.

Instead:

```text
Payment process
       ↓
     crash
       ↓
Supervisor notices
       ↓
restart payment process
```

This is the **supervision model**.

---

# 15. Supervisors

A supervisor watches other processes.

For example:

```text
             Supervisor
                 │
       ┌─────────┼─────────┐
       ▼         ▼         ▼
   Worker A   Worker B   Worker C
```

If Worker B crashes:

```text
Worker B
   ↓
 crash
   ↓
Supervisor
   ↓
restart Worker B
```

The rest of the system can continue.

This leads to a hierarchy:

```text
Application
     │
     ▼
Supervisor
     │
 ┌───┼────┐
 ▼   ▼    ▼
S1  S2    S3
│   │     │
workers...
```

This is called a **supervision tree**.

---

# 16. Supervision trees

This is one of Erlang/OTP's defining ideas.

Imagine a server:

```text
Application
     │
     ▼
Main Supervisor
     │
     ├── Connection Supervisor
     │      ├── Connection 1
     │      ├── Connection 2
     │      └── Connection 3
     │
     ├── Database Supervisor
     │      └── Database Worker
     │
     └── Cache Supervisor
            └── Cache Worker
```

If one worker dies:

```text
worker crash
     ↓
local supervisor
     ↓
restart worker
```

You don't necessarily restart the entire application.

This is a major reason Erlang systems can achieve very high availability.

---

# 17. OTP

When learning Erlang, you'll quickly encounter **OTP**.

OTP stands for:

**Open Telecom Platform**

Despite the name, it isn't simply a telecom library anymore.

It is essentially Erlang's **standard platform/framework for building reliable concurrent applications**.

OTP provides concepts such as:

```text
GenServer
Supervisor
Application
GenStateMachine
```

and standardized behaviors for building concurrent systems.

The relationship is roughly:

```text
Erlang
   +
OTP
   ↓
production-grade concurrent systems
```

---

# 18. GenServer

One of the most famous OTP abstractions is **GenServer**.

Conceptually:

```text
Client
  │
  │ request
  ▼
GenServer
  │
  ├── state
  ├── receive message
  ├── process request
  └── return response
```

For example, you might model a counter as:

```text
Counter process
    state = 10

receive:
    increment
        ↓
    state = 11

receive:
    get
        ↓
    return 11
```

This is a very natural actor-style programming model.

---

# 19. Fault tolerance

Erlang was designed for systems where downtime is extremely expensive.

Telecommunications systems historically aimed for very high availability, sometimes described using the idea of **"five nines"**:

```text
99.999% availability
```

That's only about:

```text
5 minutes of downtime per year
```

Erlang's combination of:

```text
process isolation
+
message passing
+
supervision
+
hot upgrades
+
distributed execution
```

was designed to help achieve this kind of reliability.

---

# 20. Hot code upgrades

Another remarkable Erlang feature is **hot code loading**.

Traditional deployment often looks like:

```text
stop server
    ↓
replace program
    ↓
start server
```

Erlang can support changing code while the system is running.

Conceptually:

```text
Old code
   │
   │ running
   ▼
New code loaded
   │
   ▼
processes gradually use new code
```

This was extremely valuable for telecom systems where taking the entire system offline could be unacceptable.

---

# 21. Distributed Erlang

Erlang was also designed for distributed systems.

You can have:

```text
Node A
  │
  │ messages
  ▼
Node B
  │
  │ messages
  ▼
Node C
```

The programming model remains largely:

```text
process
   ↓
message
   ↓
process
```

even when processes are running on different machines.

That's a powerful abstraction.

---

# 22. Erlang and distributed systems

This makes Erlang particularly suited to:

```text
telecommunications
chat systems
messaging
real-time services
distributed databases
network services
high-availability systems
```

The important idea is:

> **Erlang treats concurrency and distribution as fundamental parts of the programming model rather than features added later.**

---

# 23. BEAM

Modern Erlang runs on the **BEAM virtual machine**.

BEAM is the runtime used by Erlang/OTP and also by languages such as **Elixir**.

Conceptually:

```text
Erlang source
     ↓
Erlang compiler
     ↓
BEAM bytecode
     ↓
BEAM VM
     ↓
OS
```

This makes Erlang somewhat comparable to Java:

```text
Java
  ↓
bytecode
  ↓
JVM
```

and:

```text
Erlang
  ↓
BEAM code
  ↓
BEAM
```

But BEAM is heavily optimized around **massive concurrency and fault-tolerant systems**.

---

# 24. Erlang vs Java concurrency

This comparison is particularly useful for you as a Java learner.

Traditional Java:

```text
Thread
   ↓
shared memory
   ↓
synchronization
   ↓
locks / atomics / concurrent collections
```

Erlang:

```text
Process
   ↓
isolated state
   ↓
message passing
   ↓
supervision
```

Modern Java has evolved considerably, especially with **virtual threads**, but the fundamental models are still different.

You can think:

```text
Java
→ shared-memory concurrency is fundamental

Erlang
→ message-passing concurrency is fundamental
```

This is a very important distinction.

---

# 25. Erlang vs Haskell

Both are functional languages, but their priorities are different.

|                 | Haskell                | Erlang                             |
| --------------- | ---------------------- | ---------------------------------- |
| Functional      | Yes                    | Yes                                |
| Pure            | Yes                    | No                                 |
| Static typing   | Yes                    | Dynamically typed                  |
| Lazy            | Yes                    | Mostly eager                       |
| Type system     | Very powerful          | Dynamic + optional static analysis |
| Concurrency     | Important              | Central                            |
| Distribution    | Important              | Central                            |
| Fault tolerance | Important              | Central                            |
| Actor model     | Not fundamental        | Fundamental                        |
| Main strength   | Functional abstraction | Reliable concurrent systems        |

A useful summary:

```text
Haskell
    ↓
"What can pure functional programming and types give us?"

Erlang
    ↓
"How can functional programming build systems
that survive concurrency and failure?"
```

---

# 26. Erlang vs Scheme

The contrast is even stronger.

```text
Scheme
    ↓
minimal language
    ↓
language concepts
    ↓
functional abstraction

Erlang
    ↓
functional language
    ↓
concurrency
    ↓
distributed systems
    ↓
fault tolerance
```

Scheme is famous for **simplicity and elegance**.

Erlang is famous for **concurrency and reliability**.

---

# 27. Erlang vs ML

ML focuses heavily on:

```text
types
+
type inference
+
pattern matching
+
functional abstraction
```

Erlang focuses heavily on:

```text
processes
+
messages
+
supervision
+
distribution
+
fault tolerance
```

So:

```text
ML → type-system tradition

Erlang → concurrent-systems tradition
```

Both are functional, but they solve somewhat different problems.

---

# 28. Elixir

Erlang also produced one of its most important descendants:

**Elixir**.

Elixir runs on the **BEAM VM** and uses Erlang/OTP underneath.

Conceptually:

```text
Erlang
  │
  └── BEAM + OTP
          │
          ├── Erlang
          │
          └── Elixir
```

Elixir provides a more modern syntax:

```elixir
def square(x) do
  x * x
end
```

while still using the Erlang ecosystem and BEAM runtime.

Elixir became popular for:

* web applications
* distributed systems
* real-time systems
* messaging
* highly concurrent services

---

# 29. Phoenix

Elixir's **Phoenix** framework is another important example.

It uses BEAM's concurrency model to build:

```text
web applications
real-time applications
WebSocket systems
chat applications
distributed services
```

So the Erlang influence extends into modern web development through:

```text
Erlang
   ↓
BEAM / OTP
   ↓
Elixir
   ↓
Phoenix
```

---

# 30. Erlang's famous use cases

Erlang has historically been used for systems such as:

```text
telecommunications
messaging systems
network infrastructure
distributed services
high-availability systems
real-time systems
```

One particularly famous example is **WhatsApp**, which historically relied heavily on Erlang/BEAM for its highly concurrent messaging infrastructure.

The reason is intuitive:

```text
millions of connections
        ↓
many lightweight processes
        ↓
message passing
        ↓
fault isolation
        ↓
supervision
```

That is almost exactly the problem Erlang was designed to solve.

---

# 31. Erlang's programming model

A very useful mental model is:

```text
               Erlang Application
                       │
             ┌─────────┴─────────┐
             ▼                   ▼
         Supervisor          Supervisor
             │                   │
        ┌────┼────┐          ┌───┼───┐
        ▼    ▼    ▼          ▼   ▼   ▼
       P1    P2   P3         P4  P5  P6
        │    │    │
        └────┼────┘
             │
        messages
             │
             ▼
       other processes
```

Each process:

```text
private state
     +
message mailbox
     +
code
```

And supervisors:

```text
monitor
   ↓
detect failure
   ↓
restart / recover
```

This is the heart of Erlang.

---

# 32. The "Let it crash" philosophy

Let's make this concrete.

Suppose you have:

```text
User session process
```

It receives invalid data and crashes.

Traditional defensive design might try:

```text
try
   recover
catch
   everything
   ...
end
```

Erlang often prefers:

```text
Session process
      ↓
     crash
      ↓
Supervisor
      ↓
restart process
```

The important architectural principle is:

> **Don't make every worker responsible for global recovery. Build recovery into the system architecture.**

That's a profound idea in distributed-system design.

---

# 33. Why Erlang is historically important

Erlang contributed something different from the other languages you've been studying.

You can roughly summarize their historical contributions as:

```text
FORTRAN
→ high-level scientific programming

ALGOL
→ structured language design

Lisp
→ symbolic processing + functional ideas

Scheme
→ minimalist functional language

ML
→ static typing + type inference + typed FP

Haskell
→ pure functional programming + advanced types

Erlang
→ fault-tolerant concurrent distributed programming
```

That makes Erlang a very important language in the history of **distributed systems**.

---

# 34. Where Erlang fits in your overall map

Based on the programming-language history you've been exploring, I'd draw the bigger picture like this:

```text
                    Programming Languages
                           │
          ┌────────────────┴─────────────────┐
          │                                  │
     Imperative/OOP                     Functional
          │                                  │
      FORTRAN                              Lisp
          │                                  │
        ALGOL                              Scheme
          │                                  │
          C                                  ML
          │                                  │
         C++                              Haskell
          │                                  │
        Java                              Erlang
          │                                  │
          │                               Elixir
          │
          └──────────────┬───────────────────┘
                         │
                  Modern multi-paradigm
                    programming
```

But Erlang has another important branch:

```text
Erlang
   │
   ├── Actor model
   │
   ├── OTP
   │
   ├── supervision
   │
   ├── distributed processes
   │
   └── message-passing systems
          │
          ├── Elixir
          ├── Phoenix
          └── influence on modern
              distributed systems
```

---

# 35. What you should learn from Erlang

You don't necessarily need Erlang to become a Java backend developer.

But Erlang teaches several ideas that are extremely valuable for backend engineering:

```text
1. Concurrency
       ↓
2. Message passing
       ↓
3. Actor model
       ↓
4. Process isolation
       ↓
5. Fault tolerance
       ↓
6. Supervision
       ↓
7. Distributed systems
       ↓
8. "Let it crash"
```

These ideas become particularly useful when you later study:

```text
Java concurrency
        ↓
virtual threads
        ↓
message queues
        ↓
Kafka
        ↓
RPC
        ↓
distributed systems
        ↓
microservices
```

You'll recognize that **Erlang approaches many of these problems from a fundamentally different angle** than Java.

### The key idea

> **Erlang is a functional programming language designed around lightweight processes, message passing, supervision, and distribution, with the goal of building systems that can handle enormous concurrency and continue operating despite failures.**

If **Haskell represents the "pure mathematics of functional programming" side**, Erlang represents the **"functional programming for real-world concurrent and distributed systems" side**.
