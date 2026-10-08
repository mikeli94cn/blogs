# Objective-C

**Objective-C** is an object-oriented programming language built as an extension of **C**. It became especially important because it was the primary programming language for Apple's software platforms before Swift.

The simplest mental model is:

> **Objective-C = C + Smalltalk-style OOP**

Its historical importance is quite large because it was used to build much of the classic **macOS, iOS, iPadOS, and Cocoa/Cocoa Touch ecosystem**.

---

# 1. Where did Objective-C come from?

The historical chain is particularly interesting:

```text
C
│
├───────────────┐
│               │
▼               ▼
C++          Objective-C
│               │
│               │
▼               ▼
systems +      Apple
OOP            platforms
```

But Objective-C did **not** get its OOP model primarily from C++.

Its OOP model was strongly influenced by **Smalltalk**.

So a better picture is:

```text
        C
        │
        │
        ├───────────────┐
        │               │
        ▼               │
 Objective-C            │
        ▲               │
        │               │
    Smalltalk           │
        │               │
        └───────────────┘
```

This gives us an important historical contrast:

```text
C + Simula        → C++
C + Smalltalk     → Objective-C
```

---

# 2. Who created Objective-C?

Objective-C was created by **Brad Cox** and **Tom Love** in the early 1980s.

Their company, **Stepstone**, developed and promoted Objective-C.

The language was influenced by:

* **C** — syntax, compilation, low-level capabilities
* **Smalltalk** — objects, messaging, dynamic runtime

Later, **NeXT** adopted Objective-C, and this became extremely important.

---

# 3. The NeXT connection

In the late 1980s, Steve Jobs founded **NeXT**.

NeXT used Objective-C as an important part of its software platform.

The architecture looked roughly like:

```text
Objective-C
     │
     ▼
NeXTSTEP
     │
     ├── Objective-C frameworks
     ├── GUI
     └── development tools
```

Then Apple acquired NeXT in 1996.

This eventually led to:

```text
NeXTSTEP
    ↓
OpenStep
    ↓
Mac OS X
    ↓
macOS
    ↓
iPhone OS
    ↓
iOS
```

And Objective-C came along with it.

This is why Objective-C became so important to Apple's ecosystem.

---

# 4. Objective-C looks like C

Because Objective-C is an extension of C, ordinary C code is valid in Objective-C.

For example:

```objc
#include <stdio.h>

int main(void) {
    printf("Hello World\n");
    return 0;
}
```

This is essentially ordinary C.

Then Objective-C adds its own syntax.

For example:

```objc
NSString *name = @"Mike";
```

The `@` syntax is characteristic of Objective-C.

---

# 5. Objective-C classes

An Objective-C class is normally divided into two parts:

```text
Header (.h)
    +
Implementation (.m)
```

For example:

```objc
// Person.h

@interface Person : NSObject

@property NSString *name;

- (void)sayHello;

@end
```

Implementation:

```objc
// Person.m

@implementation Person

- (void)sayHello {
    NSLog(@"Hello, %@", self.name);
}

@end
```

So:

```text
Person.h
    ↓
interface / declaration

Person.m
    ↓
implementation
```

This resembles the traditional C/C++ separation between header and source files.

---

# 6. `@interface` and `@implementation`

Objective-C uses:

```objc
@interface
```

to declare a class.

For example:

```objc
@interface Person : NSObject
```

means approximately:

```text
Person
   │
   └── inherits from NSObject
```

Then:

```objc
@implementation Person
```

provides the implementation.

So:

```text
@interface
    ↓
"What does this class provide?"

@implementation
    ↓
"How does it work?"
```

---

# 7. Objective-C inheritance

Objective-C supports inheritance.

```objc
@interface Animal : NSObject
@end

@interface Dog : Animal
@end
```

This means:

```text
NSObject
   │
   ▼
 Animal
   │
   ▼
  Dog
```

This is familiar if you know Java or C++.

---

# 8. The most important Objective-C idea: messaging

This is where Objective-C differs significantly from C++ and Java.

Objective-C uses **message passing** syntax.

For example:

```objc
[person sayHello];
```

You can read this as:

> Send the `sayHello` message to `person`.

The general form is:

```objc
[receiver message];
```

For example:

```objc
[dog bark];
```

Conceptually:

```text
receiver
   │
   ▼
 dog
   │
   │  "bark"
   ▼
message
```

This comes directly from the Smalltalk tradition.

---

# 9. Compare Objective-C with Java

Java:

```java
person.sayHello();
```

Objective-C:

```objc
[person sayHello];
```

They look different, but conceptually both mean:

```text
send an operation to an object
```

Objective-C's terminology emphasizes **message sending**, while Java/C++ terminology usually emphasizes **method invocation**.

---

# 10. Methods

Objective-C methods have unusual syntax.

Instance method:

```objc
- (void)sayHello;
```

The `-` means:

> instance method

A class method uses:

```objc
+ (void)someClassMethod;
```

So:

```text
-  → instance method
+  → class method
```

For example:

```objc
- (void)sayHello {
    NSLog(@"Hello");
}
```

---

# 11. Parameters

Objective-C uses named parameters inside the method name.

Example:

```objc
- (void)setName:(NSString *)name;
```

Calling it:

```objc
[person setName:@"Mike"];
```

With multiple parameters:

```objc
- (void)moveToX:(int)x y:(int)y;
```

Calling:

```objc
[object moveToX:100 y:200];
```

This syntax may initially look strange if you come from Java or C++.

But it has an advantage: method calls can be quite self-documenting.

---

# 12. Objective-C properties

Objective-C introduced convenient property syntax:

```objc
@property NSString *name;
```

This can automatically generate accessor methods.

Conceptually:

```text
@property
   │
   ├── getter
   └── setter
```

Then:

```objc
person.name = @"Mike";
```

and:

```objc
NSLog(@"%@", person.name);
```

This looks much like properties in Delphi/Object Pascal.

That is an interesting connection:

```text
Delphi
   ↓
property Name

Objective-C
   ↓
@property name
```

Both were particularly useful for GUI/component frameworks.

---

# 13. Objective-C and dynamic typing

Objective-C has a powerful runtime system.

One important type is:

```objc
id
```

For example:

```objc
id object;
```

`id` essentially means:

> an Objective-C object of an unknown specific class.

This allows highly dynamic programming.

For example:

```objc
id object = [SomeClass new];

[object doSomething];
```

The runtime can determine whether the object can respond to the message.

---

# 14. The Objective-C runtime

This is one of the most important differences between Objective-C and C++.

Objective-C has a substantial **runtime system**.

The runtime can perform things such as:

```text
Class lookup
Method lookup
Message dispatch
Dynamic method resolution
Reflection-like operations
Object creation
Runtime inspection
```

Conceptually:

```text
[object doSomething]
       │
       ▼
Objective-C Runtime
       │
       ├── What class?
       ├── Does it respond?
       ├── Which method?
       └── Execute it
```

This dynamic nature came from the Smalltalk influence.

---

# 15. C++ vs Objective-C

This is one of the most interesting comparisons.

### C++

```text
C
 +
Simula-style OOP
 =
C++
```

### Objective-C

```text
C
 +
Smalltalk-style OOP
 =
Objective-C
```

Therefore:

|                           | C++                         | Objective-C               |
| ------------------------- | --------------------------- | ------------------------- |
| Base                      | C                           | C                         |
| OOP influence             | Simula                      | Smalltalk                 |
| Method syntax             | `object.method()`           | `[object method]`         |
| Runtime                   | More static                 | More dynamic              |
| Multiple inheritance      | Yes                         | No                        |
| Message passing           | Less central                | Fundamental               |
| Templates                 | Yes                         | No C++ templates          |
| Generics                  | Modern C++ templates        | Lightweight generics      |
| Runtime reflection        | Limited compared with Obj-C | Strong runtime facilities |
| Major historical platform | Many                        | Apple                     |

---

# 16. Objective-C and memory management

Historically, Objective-C used manual reference counting.

For example:

```objc
[object retain];
[object release];
```

Programmers had to manage object ownership.

Later Apple introduced:

> **ARC — Automatic Reference Counting**

With ARC, the compiler manages much of the reference-counting work.

So modern Objective-C generally uses:

```text
ARC
 ↓
automatic retain/release management
```

rather than programmers manually writing every `retain` and `release`.

---

# 17. Objective-C and Cocoa

Objective-C became especially important because Apple's major application frameworks were built around it.

The classic macOS framework was:

```text
Cocoa
```

Its architecture roughly looked like:

```text
Objective-C
     │
     ▼
Cocoa
     │
     ├── Foundation
     ├── AppKit
     └── other frameworks
```

For iPhone/iPad development, Apple introduced:

```text
Cocoa Touch
```

with frameworks for mobile applications.

So:

```text
macOS
  ↓
Cocoa

iOS
  ↓
Cocoa Touch
```

Objective-C was deeply integrated with both.

---

# 18. Objective-C and GUI programming

This is where Objective-C connects with your previous questions about Visual Basic and Delphi.

There were several different approaches to GUI programming:

```text
Visual Basic
     │
     ▼
Visual GUI designer
     +
events
     +
components
```

```text
Delphi
     │
     ▼
Object Pascal
     +
components
     +
properties
     +
events
```

```text
Objective-C
     │
     ▼
Cocoa
     +
objects
     +
message passing
     +
event/delegate architecture
```

All three were responding to the same broad historical development:

> **Programming moved from command-line/procedural programs toward large event-driven GUI applications.**

---

# 19. Objective-C and delegates

One very important Apple programming pattern is the **delegate pattern**.

For example:

```objc
@interface MyController : NSObject
@end
```

An object can have another object act as its delegate.

Conceptually:

```text
Object A
   │
   │ event
   ▼
Delegate B
   │
   ▼
handle event
```

This became a fundamental design pattern in Cocoa and UIKit.

---

# 20. Objective-C and blocks

Modern Objective-C also supports **blocks**, which are similar to closures/lambdas.

Example:

```objc
void (^hello)(void) = ^{
    NSLog(@"Hello");
};

hello();
```

Conceptually:

```text
Block
 =
code + captured environment
```

This connects Objective-C to the broader evolution toward functional-style programming.

---

# 21. Objective-C literals

Modern Objective-C has convenient literals.

For example:

```objc
NSString *name = @"Mike";

NSNumber *number = @42;

NSArray *numbers = @[@1, @2, @3];

NSDictionary *person = @{
    @"name": @"Mike",
    @"age": @25
};
```

The `@` prefix is one of the visual signatures of Objective-C.

---

# 22. Objective-C and Swift

This is probably the most important modern relationship.

Apple eventually introduced **Swift** in 2014.

The historical progression is roughly:

```text
C
│
├── C++
│
└── Objective-C
        │
        ▼
      Apple
        │
        ▼
      Swift
```

Swift was designed to provide a more modern language for Apple development.

Compare:

### Objective-C

```objc
NSString *name = @"Mike";

if ([name length] > 0) {
    NSLog(@"Hello %@", name);
}
```

### Swift

```swift
let name = "Mike"

if !name.isEmpty {
    print("Hello \(name)")
}
```

Swift is generally more concise and has modern language features such as:

* type inference
* optionals
* generics
* protocols
* closures
* pattern matching
* value types
* async/await
* stronger compile-time safety

---

# 23. Objective-C has not simply disappeared

Swift is now Apple's primary modern language, but Objective-C remains important.

There is a huge amount of existing Objective-C code in:

* macOS
* iOS
* older Apple applications
* frameworks
* libraries
* enterprise applications

Swift and Objective-C can also interoperate.

So Apple's ecosystem can look like:

```text
                    Apple development
                          │
              ┌───────────┴───────────┐
              │                       │
         Objective-C                Swift
              │                       │
          legacy/large            modern/new
          codebases                development
              │                       │
              └───────────┬───────────┘
                          ▼
                    Apple frameworks
```

---

# 24. Why Objective-C is historically interesting

Objective-C represents an important branch of the evolution of C.

You can see several different answers to the same problem:

```text
             How do we add OOP to C?
                       │
            ┌──────────┴──────────┐
            │                     │
          C++                Objective-C
            │                     │
         Simula                Smalltalk
         influence             influence
            │                     │
            ▼                     ▼
    static/compiled OOP      dynamic/message OOP
```

This is a very useful distinction.

### C++

Emphasized:

```text
performance
compile-time abstraction
templates
RAII
systems programming
```

### Objective-C

Emphasized:

```text
dynamic objects
message passing
runtime behavior
GUI/application frameworks
```

---

# 25. The big historical picture

Your programming-language map can now include:

```text
                    ALGOL
                      │
             ┌────────┴────────┐
             │                 │
          Pascal             Simula
             │                 │
             │              OOP ideas
             │                 │
             ▼                 │
       Object Pascal            │
             │                 │
             ▼                 │
          Delphi                │
                               │
C ─────────────────────────────┤
│                              │
├── C++ ◄── Simula influence   │
│                              │
└── Objective-C ◄── Smalltalk ─┘
          │
          ▼
       NeXTSTEP
          │
          ▼
        Cocoa
          │
          ▼
    macOS / iOS
          │
          ▼
        Swift
```

This gives you a particularly useful historical pattern:

> **C++ and Objective-C are two different answers to the question "How can we extend C with object-oriented programming?"**

C++ leaned toward **Simula-style statically compiled OOP**, while Objective-C incorporated **Smalltalk-style dynamic message passing**.

And Objective-C's importance was amplified enormously because it became the language behind the **NeXT → Apple → macOS/iOS** software lineage.
