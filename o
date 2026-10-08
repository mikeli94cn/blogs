# Object Pascal

**Object Pascal** is a family of extensions to Pascal that added **object-oriented programming (OOP)** features such as classes, inheritance, encapsulation, constructors, destructors, and polymorphism.

The simplest way to understand it is:

> **Object Pascal = Pascal + Object-Oriented Programming**

It is especially important because it became the foundation of **Delphi**, one of the major Windows GUI/RAD development environments of the 1990s.

---

# 1. Where did Object Pascal come from?

The historical chain is:

```text
ALGOL 60
    │
    ▼
  Pascal
    │
    ▼
Turbo Pascal
    │
    ▼
Object Pascal
    │
    ▼
Delphi
```

There is also an important parallel influence:

```text
Simula
   │
   └── Object-oriented programming concepts
                │
                ▼
          Object Pascal
```

Pascal was originally designed by **Niklaus Wirth** as a structured programming language.

But Pascal itself was primarily a **procedural/structured language**, not an object-oriented language.

As OOP became increasingly important during the 1980s, Pascal implementations began adding OOP capabilities.

---

# 2. Why was Object Pascal created?

Classic Pascal was very good for organizing programs into procedures and functions:

```pascal
program Hello;

procedure sayHello;
begin
    writeln('Hello');
end;

begin
    sayHello;
end.
```

But large GUI applications increasingly needed concepts such as:

```text
Object
 ├── data
 └── behavior
```

For example, a GUI application might have:

```text
Button
 ├── Caption
 ├── Position
 ├── Width
 └── Click()
```

Instead of managing data and functions separately, OOP puts them together.

So Pascal evolved from:

```text
Pascal
  ↓
procedures + records
```

toward:

```text
Object Pascal
  ↓
classes + objects + methods + inheritance
```

---

# 3. The basic Object Pascal idea

A class looks roughly like this:

```pascal
type
  Person = class
  private
    name: string;
    age: Integer;

  public
    constructor Create(n: string; a: Integer);
    procedure SayHello;
  end;
```

Implementation:

```pascal
constructor Person.Create(n: string; a: Integer);
begin
  name := n;
  age := a;
end;

procedure Person.SayHello;
begin
  writeln('Hello, my name is ', name);
end;
```

Creating an object:

```pascal
var
  p: Person;

begin
  p := Person.Create('Mike', 25);
  p.SayHello;
end;
```

Conceptually:

```text
Person class
     │
     ├── name
     ├── age
     ├── Create()
     └── SayHello()
          │
          ▼
      object instance
```

This is very similar to Java/C++.

---

# 4. Class and object

Object Pascal uses the familiar OOP distinction:

```text
Class
  = blueprint

Object
  = instance created from the blueprint
```

For example:

```pascal
type
  Dog = class
    procedure Bark;
  end;
```

Then:

```pascal
var
  dog1, dog2: Dog;

begin
  dog1 := Dog.Create;
  dog2 := Dog.Create;
end;
```

There is one `Dog` class but two objects:

```text
Dog class
   │
   ├── dog1
   └── dog2
```

---

# 5. Encapsulation

Object Pascal supports access control:

```pascal
type
  Account = class
  private
    balance: Double;

  public
    procedure Deposit(amount: Double);
    function GetBalance: Double;
  end;
```

External code should interact through methods:

```pascal
account.Deposit(100);
writeln(account.GetBalance);
```

rather than directly modifying:

```pascal
account.balance := -1000;
```

The important OOP principle is:

```text
Encapsulation
     │
     ├── hide internal state
     └── expose controlled operations
```

This idea is also central to Java and C++.

---

# 6. Inheritance

Object Pascal supports inheritance.

```pascal
type
  Animal = class
    procedure Speak; virtual;
  end;

  Dog = class(Animal)
    procedure Speak; override;
  end;
```

Now:

```text
Animal
  │
  └── Dog
```

`Dog` inherits from `Animal`.

You can then write:

```pascal
var
  a: Animal;

begin
  a := Dog.Create;
  a.Speak;
end;
```

The actual object's implementation can be selected at runtime.

This is the familiar **polymorphism** concept.

---

# 7. Constructors and destructors

Object Pascal has explicit constructor/destructor concepts.

For example:

```pascal
type
  Person = class
    constructor Create;
    destructor Destroy; override;
  end;
```

A constructor initializes an object.

A destructor performs cleanup.

You will often see:

```pascal
obj := Person.Create;

try
  ...
finally
  obj.Free;
end;
```

The `.Free` convention is particularly characteristic of Delphi/Object Pascal.

Modern Delphi code often uses patterns that make lifetime management easier, but the historical model is based heavily on explicit object lifetime management.

---

# 8. One very important feature: Properties

This is one of the features that makes Object Pascal/Delphi particularly interesting for GUI programming.

You can write:

```pascal
type
  Person = class
  private
    FName: string;

    function GetName: string;
    procedure SetName(Value: string);

  public
    property Name: string read GetName write SetName;
  end;
```

Then the caller can write:

```pascal
person.Name := 'Mike';

writeln(person.Name);
```

Although it looks like a simple field:

```pascal
person.Name
```

it can actually call:

```text
GetName()
SetName()
```

internally.

This became extremely useful for GUI components.

---

# 9. Why properties were important for GUI programming

Imagine a button:

```pascal
Button.Caption := 'OK';
Button.Width := 100;
Button.Enabled := True;
```

This is much cleaner than manually calling:

```pascal
Button.SetCaption('OK');
Button.SetWidth(100);
Button.SetEnabled(True);
```

So Delphi could expose GUI components as collections of properties:

```text
Button
 ├── Caption
 ├── Width
 ├── Height
 ├── Enabled
 ├── Visible
 └── Color
```

This fit extremely well with **RAD — Rapid Application Development**.

---

# 10. Events

Another extremely important feature in the Object Pascal/Delphi world is the event model.

For example:

```pascal
procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage('Hello!');
end;
```

The GUI framework can connect:

```text
Button clicked
      │
      ▼
OnClick event
      │
      ▼
Button1Click()
```

This is **event-driven programming**.

So Delphi combined:

```text
Object Pascal
     +
OOP
     +
Properties
     +
Components
     +
Events
     +
Visual designer
     ↓
Rapid GUI development
```

This is one of the most important historical roles of Object Pascal.

---

# 11. Object Pascal vs Pascal

The relationship is similar to:

```text
C       → C++
Pascal  → Object Pascal
```

Although the historical development is more complicated than that simple analogy.

| Pascal                                    | Object Pascal                     |
| ----------------------------------------- | --------------------------------- |
| Structured programming                    | Structured + OOP                  |
| Procedures/functions                      | Procedures/functions + methods    |
| Records                                   | Records + classes                 |
| Basic types                               | Basic types + richer OOP features |
| Procedural                                | Multi-paradigm                    |
| Mainly educational/structured programming | GUI/application development       |
| No classical class inheritance            | Classes/inheritance               |
| No polymorphic classes                    | Polymorphism                      |

So:

> **Object Pascal did not abandon Pascal's structured programming model. It extended it.**

---

# 12. Object Pascal vs C++

There is an interesting historical relationship.

Both emerged from the transition:

```text
Structured programming
        ↓
Object-oriented programming
```

But they took different approaches.

### C++

```text
C
 ↓
C with Classes
 ↓
C++
```

C++ tried to preserve C's low-level/system-programming capabilities while adding OOP.

### Object Pascal

```text
Pascal
 ↓
Object Pascal
 ↓
Delphi
```

Object Pascal preserved Pascal's strong structure and readability while adding OOP and application-development facilities.

A simplified comparison:

|                          | C++                  | Object Pascal                     |
| ------------------------ | -------------------- | --------------------------------- |
| Origin                   | C                    | Pascal                            |
| Main OOP influence       | Simula               | Simula/OOP tradition              |
| Low-level control        | Very high            | High                              |
| Syntax                   | C-like               | Pascal-like                       |
| Templates/generics       | Very powerful        | Generics available                |
| GUI/RAD                  | Libraries/frameworks | Extremely strong historically     |
| Famous environment       | Visual C++, Qt       | Delphi                            |
| Main historical strength | Systems/software     | Windows GUI/business applications |

---

# 13. Object Pascal and Delphi

This distinction is important.

**Object Pascal is a language family/dialect**, while **Delphi is a development environment and product ecosystem built around Object Pascal**.

Think:

```text
Object Pascal
     │
     ├── language
     │
     ▼
Delphi
     ├── Object Pascal compiler
     ├── IDE
     ├── visual form designer
     ├── component library
     ├── runtime library
     └── database/application frameworks
```

Therefore, saying:

> "Delphi is Object Pascal"

is approximately understandable, but technically incomplete.

A better statement is:

> **Delphi is a RAD development environment whose primary programming language is a powerful dialect of Object Pascal.**

---

# 14. Turbo Pascal's role

Before Delphi, there was **Turbo Pascal**.

Turbo Pascal was extremely important because it made Pascal practical for real software development.

The evolution was approximately:

```text
Pascal
  │
  ▼
Turbo Pascal
  │
  ├── fast compiler
  ├── practical development environment
  └── extensions
       │
       ▼
Object Pascal
       │
       ▼
Delphi
```

This is why Object Pascal should not be viewed simply as "Pascal with classes."

It evolved into a much larger programming ecosystem.

---

# 15. Object Pascal and GUI programming

This connects directly to your earlier question about **BASIC, C++, Pascal, and GUI development**.

There were several parallel roads:

```text
                 GUI / Application Programming
                           │
          ┌────────────────┼────────────────┐
          │                │                │
       BASIC             Pascal             C++
          │                │                │
          ▼                ▼                ▼
   Visual Basic         Delphi        Visual C++ / Qt
          │                │                │
          ▼                ▼                ▼
   Event-driven       Event-driven     GUI frameworks
   RAD                RAD              / toolkits
```

But they had different philosophies.

### Visual Basic

```text
BASIC
  ↓
Visual Basic
  ↓
GUI + events + RAD
```

### Delphi

```text
Pascal
  ↓
Object Pascal
  ↓
Delphi
  ↓
OOP + components + properties + events + RAD
```

### C++

```text
C
 ↓
C++
 ↓
GUI frameworks
 ├── MFC
 ├── Qt
 ├── wxWidgets
 └── others
```

This is a very useful way to understand the 1990s software-development landscape.

---

# 16. Object Pascal is more than OOP

One misconception would be:

> Object Pascal = Pascal + classes.

Historically, modern Object Pascal/Delphi became a **multi-paradigm application language**.

It supports ideas such as:

```text
Procedural programming
        +
Structured programming
        +
Object-oriented programming
        +
Event-driven programming
        +
Generic programming
        +
Component-based programming
```

So it is similar in spirit to modern C++ in being multi-paradigm, although the syntax and ecosystem are quite different.

---

# 17. Why Object Pascal was historically important

Its biggest historical contribution was not necessarily a new programming theory.

Its importance was **bringing several ideas together into a highly productive application-development environment**.

Especially:

```text
Pascal's simplicity
       +
OOP
       +
native compilation
       +
visual GUI designer
       +
components
       +
properties
       +
events
       +
database access
       ↓
very fast Windows application development
```

In the 1990s, this was a very powerful combination.

---

# 18. The bigger programming-language evolution

Your language-history model can be extended like this:

```text
ALGOL
  │
  ▼
Pascal
  │
  ├── structured programming
  │
  ▼
Turbo Pascal
  │
  ▼
Object Pascal
  │
  └── OOP
       │
       ▼
     Delphi
       │
       ├── GUI
       ├── RAD
       ├── components
       ├── properties
       ├── events
       └── database applications
```

And in parallel:

```text
ALGOL
  │
  ▼
Simula
  │
  └── OOP concepts
         │
         ├──────────────┐
         ▼              ▼
       C++         Object Pascal
         │              │
         ▼              ▼
 Visual C++           Delphi
      / Qt
```

So there is a very interesting convergence:

> **Pascal supplied the structured-programming foundation, while OOP ideas from the Simula tradition were incorporated into Object Pascal. Delphi then combined Object Pascal with the emerging visual/event-driven GUI programming model.**

---

# 19. The simplest mental model

If you want to remember Object Pascal in one diagram:

```text
             Object Pascal
                   │
        ┌──────────┴──────────┐
        │                     │
      Pascal                  OOP
        │                     │
 structured programming   classes
 procedures              inheritance
 records                 polymorphism
 strong typing           encapsulation
        │                     │
        └──────────┬──────────┘
                   ▼
                Delphi
                   │
        ┌──────────┼──────────┐
        ▼          ▼          ▼
       GUI        RAD       Database
        │
        ▼
     Events
     Components
     Properties
```

### In one sentence

**Object Pascal is Pascal evolved into a modern, object-oriented, multi-paradigm language, and its most famous incarnation—Delphi—combined it with visual GUI design, components, properties, events, and RAD to make native Windows application development extremely productive.**

This also explains why **Pascal → Object Pascal → Delphi** is a particularly important branch in the history of **structured programming → OOP → event-driven/component-based GUI programming**.
