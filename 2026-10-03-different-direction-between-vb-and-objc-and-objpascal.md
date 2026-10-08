Exactly — and this is a really interesting fork in programming-language history.

**BASIC did evolve toward object-oriented programming, but its path was different from Pascal and C.** Visual Basic became increasingly object-oriented, but **event-driven GUI programming was the dominant transformation of classic BASIC in the 1990s**.

A useful historical picture is:

```text
                    BASIC
                      │
          ┌───────────┴───────────┐
          │                       │
   procedural BASIC        GUI / event-driven
          │                       │
     QuickBASIC              Visual Basic
                                  │
                                  ↓
                           more OOP features
                                  │
                                  ↓
                              VB.NET
                                  │
                                  ↓
                         fully .NET-oriented
                         object-oriented language
```

So your intuition is basically right, with one important qualification.

---

# 1. BASIC originally wasn't object-oriented

Classic BASIC was primarily procedural.

For example:

```basic
10 INPUT A
20 INPUT B
30 C = A + B
40 PRINT C
```

The basic model was:

```text
program
   ↓
statements
   ↓
variables
   ↓
procedures/functions
```

This was quite different from:

```text
class
 ↓
object
 ↓
methods
 ↓
inheritance
```

So unlike Pascal, there wasn't a famous:

```text
Pascal
   ↓
Object Pascal
```

extension that immediately became the standard direction of the language.

---

# 2. BASIC's big transformation was actually GUI + events

This is where Visual Basic became important.

Traditional BASIC:

```text
start program
     ↓
execute statement 1
     ↓
execute statement 2
     ↓
execute statement 3
     ↓
...
```

Visual Basic:

```text
                GUI
                 │
       ┌─────────┼─────────┐
       ↓         ↓         ↓
     Button    TextBox    Menu
       │         │         │
     Click      Change    Select
       │         │         │
       ↓         ↓         ↓
    handler    handler   handler
```

For example:

```vb
Private Sub Button1_Click()
    MsgBox "Hello"
End Sub
```

The programmer isn't primarily describing:

> "Do A, then B, then C."

Instead:

> "When event X happens, execute this code."

That's the major conceptual transformation of BASIC.

---

# 3. But Visual Basic did become object-oriented

Here's the subtle part.

Classic Visual Basic — especially VB6 — **was not a full modern object-oriented language** in the same sense as C++ or Java.

It had some object-oriented concepts:

* objects
* classes
* methods
* properties
* interfaces
* encapsulation

But it lacked or restricted some important OOP capabilities.

For example, classic VB did not provide traditional class inheritance in the way C++ or Java does.

So:

```text
Visual Basic 6
     │
     ├── objects        ✓
     ├── classes        ✓
     ├── methods        ✓
     ├── properties     ✓
     ├── interfaces     ✓
     └── inheritance    ✗ / very limited
```

Therefore, calling classic Visual Basic a **fully object-oriented language** would be misleading.

---

# 4. Then came VB.NET

This changed the story substantially.

Visual Basic .NET was introduced as part of the .NET platform.

Now Visual Basic became much more thoroughly object-oriented:

```vb
Public Class Student

    Public Property Name As String
    Public Property Age As Integer

    Public Sub Introduce()
        Console.WriteLine(Name)
    End Sub

End Class
```

And VB.NET supports concepts such as:

```text
class
inheritance
encapsulation
polymorphism
interfaces
abstract classes
overriding
generics
exceptions
```

So the evolution is better represented as:

```text
Classic BASIC
      │
      ↓
Visual Basic
      │
      ├── GUI
      ├── event-driven
      ├── objects
      └── components
      │
      ↓
VB.NET
      │
      ├── full .NET object model
      ├── inheritance
      ├── polymorphism
      ├── interfaces
      ├── generics
      └── event-driven programming
```

---

# 5. This makes BASIC different from Pascal

This is the really interesting comparison.

### Pascal

Pascal's evolution was approximately:

```text
Pascal
   ↓
Object Pascal
   ↓
Delphi
```

The central evolutionary step was:

> **structured programming → object-oriented programming**

---

### BASIC

BASIC's evolution was approximately:

```text
BASIC
   ↓
Visual Basic
   ↓
VB.NET
```

The central steps were:

> **beginner programming → GUI → event-driven programming → object-oriented .NET programming**

So you could visualize them like this:

```text
Pascal                         BASIC
  │                              │
  │ structured                  │ procedural
  ↓                              ↓
Object Pascal              Visual Basic
  │                              │
  │ OOP                          │ GUI + events
  ↓                              ↓
Delphi                        VB.NET
  │                              │
  └── GUI + OOP                  └── OOP + events
```

That's a very useful distinction.

---

# 6. And C++ took yet another route

C++:

```text
C
 ↓
C with Classes
 ↓
C++
 ↓
OOP + generic programming
 ↓
GUI frameworks
```

The major transformation was:

**procedural → object-oriented → multi-paradigm**

BASIC:

```text
BASIC
 ↓
Visual Basic
 ↓
GUI + event-driven
 ↓
VB.NET
 ↓
object-oriented + event-driven
```

Pascal:

```text
Pascal
 ↓
Object Pascal
 ↓
OOP
 ↓
Delphi
 ↓
OOP + GUI + event-driven
```

So there were really **three different evolutionary roads**.

---

# 7. One very important insight: OOP and event-driven programming are not alternatives

This is probably the key concept behind your question.

It's tempting to think:

```text
OOP
vs
event-driven
```

But they're actually **different dimensions**.

For example, a modern GUI application can simultaneously be:

```text
Object-oriented
        +
Event-driven
        +
Generic
        +
Asynchronous
```

Consider a Java Swing application:

```java
button.addActionListener(e -> {
    System.out.println("Clicked!");
});
```

That's:

* **object-oriented** → `button` is an object
* **event-driven** → code responds to a click
* **callback/lambda-based** → handler is passed as behavior

Same idea in C++/Qt:

```cpp
connect(button, &QPushButton::clicked, [] {
    std::cout << "Clicked!";
});
```

So Visual Basic didn't really choose:

> "OOP instead of event-driven."

Rather, it strongly pioneered:

> **event-driven GUI programming**, and later became substantially more object-oriented.

---

# 8. The bigger historical picture

I think this is actually a great addition to the programming-language history you're building.

You can think of the evolution as several **independent axes**:

```text
                Programming evolution
                       │
        ┌──────────────┼───────────────┐
        ↓              ↓               ↓
   Programming      Programming     Application
     model            model          model
        │              │               │
   procedural          OOP          event-driven
        │              │               │
        ↓              ↓               ↓
       C              C++       Visual Basic
     Pascal       Object Pascal
```

Then later languages combined them.

For example:

```text
Java
 ├── OOP
 ├── event-driven
 ├── concurrent
 └── network programming

C#
 ├── OOP
 ├── event-driven
 ├── component-oriented
 └── asynchronous

Python
 ├── procedural
 ├── OOP
 ├── functional
 └── event-driven
```

So **event-driven programming wasn't the "BASIC version of OOP."** It was a different programming model that became especially important because of the rise of **GUI applications**.

And that's why your earlier observation about **OOP growing together with GUI complexity** is quite insightful: GUI applications naturally introduced huge numbers of **objects, components, events, callbacks, and interactions**, which pushed languages and frameworks toward richer abstraction mechanisms.
