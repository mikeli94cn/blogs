# C# Introduction

![Image](https://images.openai.com/static-rsc-4/-2BmCg5FuMoSoI7UdobTmZvKwtI6iHOzQDW2NhOiuhOfCAuMBL92scscxme-Gq_Dh1QLfUvhcmnfYuPL0NuZYj6WIpUiLg6rTobAFtrNK5V0QmMPKx_zfbbSld0-5eeCbmdJr8DQaQ18CY7Sh14EZ6Fmp_KlTYoLx761ZS9sWtn0vQDZzCdZTrRSCY358ibD?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/AvJvj8sBD61znIGoiIimrpakVnm1dHk8DhWCOOaSqW45-9eymM1XCQeJ6P9dgUL7z3xwsl6TXFm02-h4j9YzsWL2Xk-jpnehBmv1TXojQzddiFy9ehd1vcsSEgbNDCAYJUe1x_awppMRaNB1A3p60IFHWI5ALAkjTw9URX_tv1BXR_Je5OB2UXdlgM3psVeG?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/1E_UPbEwLeYqJx4WquILkM4F-IqeJc9trW6h2eTE6vAbShAijofIhCwrzCa-rzyJB5M1sZaMtKSAaRNC6Gv9zNglvoJZcN2sYQMaiRlTmcU3Y-FjSSZ--n-TmNzHyOaQtsZtV_p7gRGgIBgPy-RMZ3_t618gqCWSxixEulKgNBrTPwBdmePLptW0MaKjQHJX?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/GJH_iy-vRox2Eys95mrzu59yINN1wmrufBXZC7xTJVWv_KQimip99MRdvT7Z0qudowNQEGdpgn3vJYSvn2f5AzLn7O3KrLmsoZg0DdorEbiEJqg8sXZtYKLGo9E1bTHcM7iAsckVa8RC8QCF_U35Srzbe5RDgLrXh7OEwfTcqprbCishTohYRibj-6-S8vqw?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/gjzUvsZgvJM0GfGM2CAzD8H30JAhlSoppvIWtilfPPgwu1NpClq5iBIQM5-b1zwHCA2raR3eoxVRRabQNgwn5w2uYo-fYZkpbrFG6AS740WaHFRbn7VGWRBYZFERPDAtMejAPvD3Do3qpoPT82q3o2uPqYJtXLx3XmGcDiA4vfFJrZr_NfxRczVpqOWfC9MJ?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/ayg3XjZC-0EwgRqqNBsl1XEu1oMLWIaZfNDKvvHIdVjqEtFwMCoK8xFh7Abqol9ZsbbRonpngxdzZZ5zT63f4Jb-4lQBgbOmU9xdGTN9tNq11qFUnsXxLXpmYM_j51D2G4wkqWXz06cndjyotalbwrMx4z6cIg8JIerOx8lcP87iGNHzOwjp0ugbDU8GZR2l?purpose=fullsize)

**C# (pronounced “C-sharp”)** is a modern, statically typed, general-purpose programming language developed by **Microsoft**. It was introduced around **2000** as part of Microsoft's **.NET** platform.

If we place it alongside the languages you've been studying:

```text
C       → system programming
C++     → system + object-oriented programming
Java    → portable managed application/enterprise programming
C#      → modern managed application programming on .NET
PHP     → server-side Web scripting
JavaScript → browser/Web programming
```

A useful mental model is:

> **C# is Microsoft's major managed, object-oriented language for the .NET platform.**

---

# 1. Why was C# created?

By the late 1990s, Microsoft needed a modern programming platform that could compete with the growing popularity of Java while also providing a unified environment for Windows and enterprise development.

The result was:

```text
                    .NET
                     │
          ┌──────────┴──────────┐
          │                     │
         C#                  CLR/runtime
          │                     │
          └──────────┬──────────┘
                     ↓
              .NET libraries
                     ↓
        ┌────────────┼────────────┐
        ↓            ↓            ↓
      Desktop       Web        Services
```

C# was designed with influences from several languages, particularly:

* C
* C++
* Java
* Delphi/Object Pascal
* other modern language ideas

Its syntax therefore looks familiar if you already know Java or C++.

---

# 2. C# and .NET are not the same thing

This distinction is important.

### C#

C# is the **programming language**.

Example:

```csharp
public class Person
{
    public string Name { get; set; }
}
```

### .NET

.NET is the **development platform/runtime/ecosystem**.

It provides:

```text
.NET
├── Runtime
├── Base Class Library
├── SDK
├── CLI tools
├── ASP.NET Core
├── Entity Framework Core
└── many other libraries
```

So:

```text
C#
 ↓
.NET
 ↓
Applications
```

is conceptually similar to:

```text
Java
 ↓
JVM / Java platform
 ↓
Applications
```

---

# 3. The CLR — Common Language Runtime

The runtime behind modern .NET is the **CLR (Common Language Runtime)**.

Conceptually:

```text
C# source
    │
    ↓
 C# compiler
    │
    ↓
.NET assembly
    │
    ↓
  CLR
    │
    ↓
native machine code
    │
    ↓
   CPU
```

This is similar to Java:

```text
Java source
    ↓
javac
    ↓
bytecode
    ↓
JVM
    ↓
CPU
```

C# and Java therefore share an important architectural idea:

> **Source code is compiled into an intermediate representation that runs inside a managed runtime.**

---

# 4. C# compilation

Suppose you write:

```csharp
using System;

class Hello
{
    static void Main()
    {
        Console.WriteLine("Hello, C#!");
    }
}
```

The C# compiler produces a .NET assembly:

```text
Hello.cs
   │
   │ compiler
   ↓
Hello.dll / Hello.exe
   │
   ↓
.NET runtime
   │
   ↓
CPU
```

Modern .NET applications commonly use:

```bash
dotnet build
dotnet run
```

rather than manually invoking the compiler.

---

# 5. A simple C# program

```csharp
using System;

class Hello
{
    static void Main()
    {
        Console.WriteLine("Hello, C#!");
    }
}
```

Run:

```bash
dotnet run
```

Output:

```text
Hello, C#!
```

Modern C# also supports **top-level statements**, so you can write something much simpler:

```csharp
Console.WriteLine("Hello, C#!");
```

The compiler generates the necessary application structure for you.

---

# 6. C# is statically typed

C# is strongly associated with static typing.

```csharp
int age = 25;
string name = "Alice";
bool active = true;
```

This won't compile:

```csharp
int age = "hello";
```

The compiler detects the type mismatch.

This makes C# conceptually similar to Java:

```text
Java                  C#
 │                     │
static typing          static typing
 │                     │
compiler checks        compiler checks
types                  types
```

---

# 7. Type inference with `var`

C# also supports local type inference:

```csharp
var name = "Alice";
var age = 25;
```

This does **not** mean that C# has dynamically typed variables.

The compiler determines:

```text
var name = "Alice";
       ↓
string

var age = 25;
       ↓
int
```

So:

```csharp
var age = 25;

// age = "hello";  // still an error
```

This is similar to Java's `var`.

---

# 8. Object-oriented programming

C# is strongly object-oriented.

For example:

```csharp
class Dog
{
    public string Name { get; set; }

    public void Bark()
    {
        Console.WriteLine($"{Name} says woof!");
    }
}
```

Then:

```csharp
var dog = new Dog();

dog.Name = "Buddy";
dog.Bark();
```

The fundamental model is:

```text
Class
  ↓
Object
  ↓
State + Behavior
```

C# supports:

* classes
* objects
* inheritance
* polymorphism
* interfaces
* abstraction
* encapsulation
* composition

---

# 9. Properties

One particularly characteristic C# feature is the **property**.

```csharp
public string Name { get; set; }
```

This is more sophisticated than a simple public field.

You can define custom behavior:

```csharp
public string Name
{
    get
    {
        return name;
    }

    set
    {
        name = value;
    }
}
```

Modern C# provides concise property syntax:

```csharp
public string Name { get; set; }
```

This feature is extremely common in C# applications.

---

# 10. Interfaces

C# has interfaces:

```csharp
interface Animal
{
    void Speak();
}
```

Implementation:

```csharp
class Dog : Animal
{
    public void Speak()
    {
        Console.WriteLine("Woof");
    }
}
```

Then:

```csharp
Animal animal = new Dog();

animal.Speak();
```

This is very similar to Java:

```java
interface Animal {
    void speak();
}
```

In fact, Java and C# have many similarities in their OOP models.

---

# 11. Generics

C# has a powerful generic type system.

```csharp
List<string> names = new List<string>();

names.Add("Alice");
names.Add("Bob");
```

You can create your own generic classes:

```csharp
class Box<T>
{
    public T Value { get; set; }
}
```

Then:

```csharp
var intBox = new Box<int>();
var stringBox = new Box<string>();
```

Again, this is very similar to Java generics.

---

# 12. Delegates

One of C#'s distinctive concepts is the **delegate**.

A delegate represents a method that can be stored in a variable and passed around.

For example:

```csharp
delegate int Calculator(int a, int b);
```

Then:

```csharp
int Add(int a, int b)
{
    return a + b;
}

Calculator calculator = Add;

Console.WriteLine(calculator(10, 20));
```

Modern C# usually uses built-in delegates such as:

```text
Action
Func<T>
Predicate<T>
```

This provides strong support for functional programming.

---

# 13. Lambda expressions

C# supports lambda expressions:

```csharp
Func<int, int, int> add =
    (a, b) => a + b;
```

Then:

```csharp
Console.WriteLine(add(10, 20));
```

This makes C# particularly expressive for collections and functional-style programming.

---

# 14. LINQ

One of C#'s most important features is **LINQ (Language Integrated Query)**.

It allows you to query collections using a SQL-like style.

For example:

```csharp
var numbers = new[] { 1, 2, 3, 4, 5, 6 };

var evenNumbers =
    numbers.Where(n => n % 2 == 0);
```

You can also write query syntax:

```csharp
var evenNumbers =
    from n in numbers
    where n % 2 == 0
    select n;
```

LINQ can work with:

* arrays
* collections
* objects
* database queries
* XML
* other data sources

Conceptually:

```text
Collection
    ↓
LINQ
    ↓
filter / map / sort / group / select
    ↓
result
```

LINQ is one of the areas where C# developed a particularly strong identity compared with Java.

---

# 15. Async / await

Modern C# has excellent asynchronous programming support.

For example:

```csharp
async Task<string> GetDataAsync()
{
    var response = await httpClient.GetStringAsync(url);

    return response;
}
```

The important keywords are:

```text
async
await
Task
Task<T>
```

The conceptual model is:

```text
start operation
      ↓
   await
      ↓
thread can do other work
      ↓
operation completes
      ↓
continue
```

This is especially important in Web applications.

---

# 16. C# and concurrency

C# provides extensive concurrency facilities.

Some important concepts include:

```text
Thread
Task
Task<T>
async/await
Parallel
lock
Monitor
Mutex
Semaphore
Concurrent collections
Channels
```

A typical modern C# application prefers higher-level constructs such as:

```csharp
Task
async / await
```

rather than manually creating threads for every operation.

---

# 17. Automatic memory management

Like Java, C# uses garbage collection.

You can create objects:

```csharp
var user = new User();
```

without manually freeing them.

The .NET runtime manages managed memory:

```text
Application
    ↓
creates objects
    ↓
Managed Heap
    ↓
objects become unreachable
    ↓
Garbage Collector
    ↓
memory reclaimed
```

So C# is fundamentally different from traditional C/C++ memory management.

Compare:

```c
malloc(...)
free(...)
```

with:

```csharp
var user = new User();
```

The runtime manages ordinary managed objects.

---

# 18. C# still has low-level capabilities

C# is not completely isolated from the underlying machine.

It supports:

* unmanaged code
* pointers
* native interop
* P/Invoke
* `unsafe` code
* stack allocation in appropriate contexts

For example:

```csharp
unsafe
{
    int value = 10;
    int* pointer = &value;
}
```

But ordinary C# programming generally doesn't require this.

So C# occupies an interesting middle ground:

```text
C
│
│ low-level
↓
C++
│
│
↓
C#
│
│ managed but powerful
↓
Java
```

That isn't a strict ranking; it illustrates the general design emphasis.

---

# 19. C# and Windows

C# was originally strongly associated with Microsoft Windows.

The early ecosystem looked approximately like:

```text
Microsoft
    │
    ↓
Windows
    │
    ↓
.NET
    │
    ↓
C#
```

C# became important for:

* Windows desktop applications
* enterprise software
* Web applications
* games
* services

However, this changed significantly with **modern .NET**.

---

# 20. .NET became cross-platform

Originally:

```text
.NET Framework
       ↓
    Windows
```

Modern .NET is different:

```text
             .NET
               │
      ┌────────┼────────┐
      ↓        ↓        ↓
    Linux    Windows   macOS
```

Modern .NET applications can therefore run across major operating systems.

This was a major evolution of the platform.

The historical distinction is important:

```text
.NET Framework
    ↓
primarily Windows

.NET Core
    ↓
cross-platform

modern .NET
    ↓
unified cross-platform platform
```

---

# 21. C# and Web development

For your Java backend studies, this is probably the most interesting area.

C# has its own major Web framework:

> **ASP.NET Core**

The architecture is conceptually:

```text
Browser / Mobile App
        │
        │ HTTP
        ↓
   ASP.NET Core
        │
 ┌──────┼────────┐
 ↓      ↓        ↓
API   Services  Middleware
 │
 ↓
Database
```

This is quite comparable to Java:

```text
Java
 ↓
Spring Boot
 ↓
REST API
 ↓
Database
```

versus:

```text
C#
 ↓
ASP.NET Core
 ↓
REST API
 ↓
Database
```

---

# 22. C# backend ecosystem

A typical C# backend stack might look like:

```text
C#
 │
 ↓
.NET
 │
 ↓
ASP.NET Core
 │
 ├── Web API
 ├── MVC
 ├── Middleware
 ├── Authentication
 └── Dependency Injection
 │
 ↓
Entity Framework Core
 │
 ↓
SQL Server / PostgreSQL / MySQL
```

This is extremely analogous to your Java backend path:

```text
Java
 │
 ↓
Spring Boot
 │
 ├── Spring MVC
 ├── Spring Security
 ├── Spring DI
 └── Spring Data
 │
 ↓
Hibernate / JPA
 │
 ↓
Database
```

---

# 23. Entity Framework Core

C# has a major ORM:

> **Entity Framework Core**

For example:

```csharp
public class User
{
    public int Id { get; set; }
    public string Name { get; set; }
}
```

Then Entity Framework can map objects to database tables.

Conceptually:

```text
C# Object
   ↓
Entity Framework Core
   ↓
SQL
   ↓
Database
```

This is broadly comparable to:

```text
Java Object
   ↓
Hibernate / JPA
   ↓
SQL
   ↓
Database
```

---

# 24. Dependency Injection

Modern .NET has built-in dependency injection.

For example:

```csharp
public class UserService
{
    private readonly IUserRepository repository;

    public UserService(IUserRepository repository)
    {
        this.repository = repository;
    }
}
```

The framework/runtime infrastructure can provide the dependency.

This should look familiar if you're learning Spring:

```text
Spring DI                         .NET DI

@Autowired / constructor          constructor injection
        │                                │
        ↓                                ↓
Spring Container                 .NET DI Container
        │                                │
        ↓                                ↓
object creation                  object creation
```

The concepts are remarkably similar.

---

# 25. C# and Java

This is probably the most important comparison for your current studies.

|                            | Java                          | C#                             |
| -------------------------- | ----------------------------- | ------------------------------ |
| Company origin             | Sun Microsystems              | Microsoft                      |
| Released                   | 1995                          | 2000                           |
| Platform                   | JVM                           | .NET                           |
| Runtime                    | JVM                           | CLR/.NET runtime               |
| Typing                     | Static                        | Static                         |
| OOP                        | Yes                           | Yes                            |
| Garbage collection         | Yes                           | Yes                            |
| Generics                   | Yes                           | Yes                            |
| Lambda                     | Yes                           | Yes                            |
| Async/await                | Modern Java                   | Core C# feature                |
| Properties                 | No equivalent native syntax   | Major feature                  |
| LINQ                       | No direct equivalent          | Major feature                  |
| Delegates                  | Functional interfaces/lambdas | Delegates                      |
| Web framework              | Spring                        | ASP.NET Core                   |
| ORM                        | Hibernate/JPA                 | Entity Framework Core          |
| Package/build              | Maven/Gradle                  | NuGet/MSBuild                  |
| IDE ecosystem              | IntelliJ IDEA/Eclipse         | Visual Studio/Rider            |
| Major historical ecosystem | Enterprise                    | Microsoft/enterprise/games/Web |

A useful mental picture is:

```text
       Java                              C#
        │                                │
        ↓                                ↓
       JVM                              .NET
        │                                │
        ↓                                ↓
Spring / Spring Boot              ASP.NET Core
        │                                │
        ↓                                ↓
 Hibernate/JPA                 Entity Framework Core
        │                                │
        └───────────┬────────────────────┘
                    ↓
                 Database
```

---

# 26. C# and C++

The name **C#** and its syntax deliberately connect it to the C family.

Historically:

```text
C
 ↓
C++
 ↓
C#
```

But C# is much more managed.

For example, C++:

```cpp
class Dog {
public:
    void bark() {
        std::cout << "Woof";
    }
};
```

C#:

```csharp
class Dog
{
    public void Bark()
    {
        Console.WriteLine("Woof");
    }
}
```

The syntax is clearly related.

But their runtime models are substantially different:

```text
C++
 ↓
native executable
 ↓
OS / CPU

C#
 ↓
.NET runtime
 ↓
managed execution
 ↓
OS / CPU
```

---

# 27. C# and Delphi/Object Pascal

This is a particularly interesting historical connection.

C# wasn't designed in isolation. Its design has influences from **Delphi/Object Pascal**, especially around concepts such as:

* properties
* components
* events
* RAD development
* managed application development

And there is an important historical person here:

**Anders Hejlsberg**, who was a major designer of Turbo Pascal and Delphi, later became one of the key architects of C#.

So there is a genuine historical connection:

```text
Pascal
   ↓
Turbo Pascal
   ↓
Object Pascal
   ↓
Delphi
   │
   │ design influence
   ↓
C#
```

This is especially interesting given your earlier exploration of **Pascal → Object Pascal**.

---

# 28. C# and Visual Basic

Microsoft also has another major .NET language:

**Visual Basic .NET**

So the .NET platform can support multiple languages:

```text
                 .NET
                  │
       ┌──────────┼──────────┐
       ↓          ↓          ↓
      C#       VB.NET      F#
       │          │          │
       └──────────┼──────────┘
                  ↓
              .NET Runtime
```

The runtime is not fundamentally tied to C#.

This is one of the important ideas behind .NET:

> **Multiple programming languages can target the same runtime and libraries.**

---

# 29. C# and game development

C# is also extremely important in game development because of **Unity**.

A typical Unity development model is:

```text
Unity
  │
  ↓
C#
  │
  ↓
Game logic
  │
  ↓
Game engine
  │
  ↓
PC / Console / Mobile
```

For example:

```csharp
public class Player : MonoBehaviour
{
    void Update()
    {
        // player logic
    }
}
```

This gave C# a major role outside traditional business applications.

---

# 30. C# language evolution

C# has evolved rapidly.

A simplified timeline:

```text
2000
C# 1.0
 │
 ↓
C# 2.0
 ├── Generics
 ├── Anonymous methods
 └── Iterators
 │
 ↓
C# 3.0
 ├── LINQ
 ├── Lambdas
 ├── Extension methods
 └── var
 │
 ↓
C# 5.0
 └── async / await
 │
 ↓
C# 6+
 ├── expression-bodied members
 ├── string interpolation
 └── many language improvements
 │
 ↓
C# 8+
 ├── nullable reference types
 ├── async streams
 └── default interface methods
 │
 ↓
modern C#
 ├── records
 ├── pattern matching
 ├── top-level statements
 ├── required members
 ├── primary constructors
 └── increasingly concise syntax
```

Modern C# is considerably more expressive than early C#.

---

# 31. C# has adopted many modern language ideas

Modern C# contains features from several programming paradigms.

### Object-oriented

```text
class
interface
inheritance
polymorphism
```

### Functional

```text
lambda
delegates
LINQ
higher-order functions
```

### Generic programming

```text
List<T>
Dictionary<TKey,TValue>
generic methods
```

### Asynchronous programming

```text
Task
async
await
```

### Modern algebraic/data-oriented features

```text
records
pattern matching
discriminated-union-like designs
```

This makes modern C# considerably more than simply "Microsoft's version of Java."

---

# 32. C# in your programming-language history

Using the historical framework you've been building:

```text
1950s
FORTRAN / COBOL
       ↓
1960s
ALGOL / Lisp
       ↓
1970s
C / Smalltalk
       ↓
1980s
C++ / Object Pascal
       ↓
1990s
Java / JavaScript / Perl / PHP
       ↓
2000s
C# / Java / JavaScript / PHP
       ↓
2010s
C# / Java / JavaScript / Python
       ↓
2020s
C# / Java / JavaScript / Python / TypeScript
```

C# represents an important **managed-language branch** alongside Java:

```text
                    C / C++
                      │
              ┌───────┴───────┐
              ↓               ↓
            Java             C#
              │               │
             JVM             .NET
              │               │
           Spring          ASP.NET
              │               │
              └───────┬───────┘
                      ↓
              Enterprise Software
```

---

# 33. The deeper historical idea

There is a particularly interesting pattern in the languages you've been studying:

```text
C
│
└── efficient native systems programming

C++
│
└── C + object-oriented programming

Java
│
└── OOP + managed runtime + portability

C#
│
└── OOP + managed runtime + Microsoft/.NET ecosystem
```

Then the ecosystems developed in parallel:

```text
Java world                       Microsoft world

Java                             C#
 ↓                                ↓
JVM                              .NET
 ↓                                ↓
Maven/Gradle                     NuGet
 ↓                                ↓
Spring                           ASP.NET Core
 ↓                                ↓
Hibernate/JPA                    EF Core
 ↓                                ↓
Enterprise backend              Enterprise backend
```

So if you're learning **Java backend**, C# is actually an excellent language to study comparatively. Many concepts you learn in Spring—dependency injection, middleware, Web APIs, ORM, configuration, testing, asynchronous programming—have corresponding concepts in the .NET ecosystem.

---

# 34. The simplest mental model

If you remember one diagram:

```text
                    C#
                     │
                     ↓
                   .NET
                     │
             ┌───────┼────────┐
             ↓       ↓        ↓
           Console  Web      Desktop
                     │
                     ↓
               ASP.NET Core
                     │
             ┌───────┼────────┐
             ↓       ↓        ↓
            API   Services  Middleware
                     │
                     ↓
              Entity Framework
                     │
                     ↓
                 Database
```

**In one sentence:** **C# is Microsoft's statically typed, object-oriented, managed programming language for the .NET platform, combining Java-like enterprise development with powerful features such as properties, delegates, LINQ, async/await, and deep integration with the .NET ecosystem.**
