# JavaScript Introduction

![Image](https://images.openai.com/static-rsc-4/222vgPLdL7zETyzCC6jJValIyeq_NvPO5cN0UJgSEhNac2Oh4UlDsfzFOvI7gC0KYigrhhOOqH8hWfWlA1etpyTiB09DiE1FjxuX-fa9ppUqvCb45Mqwb2zqwIeZ5sn33vvsMc_caTTypb-ZxwH1pVH_xMW3ZZVdgC0sKhcSGjdPVuIsED-mgSoQxA9l3gMI?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/8PZ_tpxG9VQUBnUwTzpk_ZU-ZihAOAgQUIWoYd1QuWW4A5mtC6xgfqjypAQ9KIdvFrbePS82raXOML_FUp8RPhuubKnGUvzwg1-GPgSYPYIQZ42ioCqkzvXKt_o3gXw79c7SFG_B9kBnpGNSUfxTA-JffKsWWpjKGf6IJg_NwglHY_o0Qa_F-S9_QsbI09gA?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/_P4WH6oxiJylH_iiPg20r5btLKpeaQ75M-DogvHla4xTsqPydM-4F-fRVTk-7r4GFd-IaKcmI6fOZmAhhN9nNXFUsKNonljdJwf2mLyiGS4Db41qwNoZk7k1pV-cuZsIFKgx-D_QLT9u5J8-N3yeIACz9SRm2LseSXkeN6g9dCs1RLBX6qZD4fgvu0LzCux1?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/FnDiLIt9pyMQ4ExwHrua5fblMgWwFXpR4-RjpGhBfUNhuZCNIoC1vFiG2mLqcjJy-YoSZGqXx2TEOHV0pXZfNYjhbueOXEt4fz7l9X_eyyug2E9RfvjL4QVzCm7WET7cNjVmjG55UPIjvAJ1eUgBM5qXN1z-tYcf6pNksCy4tJ3J6AxmkQfSRm_l4jky4c9q?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/1J_vccOYQx_Qz5d_RpooWVa0IN5ppuMNktFlLFhf2sAeEN6vKHGpL74ttvW6gE1xqS5n2uHkgBZwIqApf0iGJnYxJewRUeX1qlf7hDBGq8oAsh8UcKe6kqy0Rg6_Vamu3sPYcmGhb0qoFTuMogNy05E4pWxgwwnah32d9aYMoxpYq6Ju4mdM15AnMWOGnuHQ?purpose=fullsize)

**JavaScript (JS)** is a high-level, dynamically typed programming language originally created for web browsers. Today it is one of the most widely used languages for **web development**, and it can also run on servers, desktops, mobile devices, and other environments.

A useful way to understand JavaScript is:

> **JavaScript = programming language + JavaScript engine + Web APIs + huge ecosystem**

Its historical role is especially interesting because JavaScript became one of the defining languages of the **Internet/Web era**, alongside languages such as Java, PHP, and Perl.

---

# 1. Why was JavaScript created?

When the Web first became popular, web pages were primarily documents.

The basic model was:

```text
Browser
   │
   │ HTTP request
   ↓
Web Server
   │
   │ HTML
   ↓
Browser
   │
   ↓
Display webpage
```

HTML described the document:

```html
<h1>Hello</h1>
<p>Welcome!</p>
```

But HTML wasn't really a general-purpose programming language.

Web pages needed **behavior**:

```text
click a button
       ↓
change something
       ↓
validate a form
       ↓
show a menu
       ↓
animate something
       ↓
communicate with server
```

JavaScript was created to provide that programming capability inside the browser.

So an important historical relationship is:

```text
HTML       → structure
CSS        → presentation
JavaScript → behavior
```

---

# 2. JavaScript's history

JavaScript was created by **Brendan Eich** at Netscape in **1995**.

It was originally developed under the name **Mocha**, then **LiveScript**, and finally **JavaScript**.

Despite its name:

> **JavaScript is not a version of Java.**

The name was partly influenced by the popularity of Java at the time.

Historically:

```text
Java
 │
 ├── enterprise / server / app development
 │
JavaScript
 │
 └── browser programming
```

They are separate programming languages with different designs.

---

# 3. JavaScript's original environment

Originally, JavaScript primarily lived inside the browser.

For example:

```html
<!DOCTYPE html>
<html>
<body>

<button onclick="sayHello()">Click me</button>

<script>
function sayHello() {
    alert("Hello!");
}
</script>

</body>
</html>
```

The browser provides the environment in which JavaScript executes.

Conceptually:

```text
┌──────────────────── Browser ────────────────────┐
│                                                  │
│   HTML          CSS          JavaScript          │
│    │             │                │              │
│    ↓             ↓                ↓              │
│ Document      Styling       Program Logic        │
│                                  │               │
│                                  ↓               │
│                         JavaScript Engine        │
│                                  │               │
│                                  ↓               │
│                             Web APIs             │
└──────────────────────────────────────────────────┘
```

---

# 4. JavaScript is dynamically typed

One of JavaScript's fundamental characteristics is **dynamic typing**.

For example:

```javascript
let x = 10;

x = "hello";

x = true;
```

The same variable can refer to values of different types.

Compare this with Java:

```java
int x = 10;

// x = "hello";   // compilation error
```

JavaScript therefore gives you considerable flexibility, but you need to understand its type system carefully.

---

# 5. JavaScript's basic types

Modern JavaScript has several primitive types:

```text
number
string
boolean
undefined
null
bigint
symbol
```

And objects:

```javascript
const person = {
    name: "Alice",
    age: 25
};
```

Examples:

```javascript
let age = 25;
let name = "Alice";
let active = true;
let value;
let nothing = null;
let huge = 12345678901234567890n;
```

---

# 6. Variables

Modern JavaScript normally uses:

```javascript
let
const
```

and historically:

```javascript
var
```

For example:

```javascript
const name = "Alice";
let age = 20;

age = 21;
```

A useful rule:

```text
const → reference shouldn't be reassigned
let   → variable may be reassigned
var   → legacy behavior; generally avoid in modern code
```

---

# 7. Functions

Functions are fundamental to JavaScript.

Traditional syntax:

```javascript
function add(a, b) {
    return a + b;
}
```

Call it:

```javascript
const result = add(10, 20);
```

JavaScript also introduced **arrow functions**:

```javascript
const add = (a, b) => {
    return a + b;
};
```

or:

```javascript
const add = (a, b) => a + b;
```

This becomes especially important when working with modern JavaScript.

---

# 8. Functions are first-class values

This is one of the most important concepts in JavaScript.

You can put a function into a variable:

```javascript
const sayHello = function () {
    console.log("Hello");
};
```

You can pass a function to another function:

```javascript
function execute(fn) {
    fn();
}

execute(sayHello);
```

You can return a function:

```javascript
function createGreeter(name) {
    return function () {
        console.log("Hello " + name);
    };
}
```

This leads naturally to concepts such as:

* callbacks
* closures
* higher-order functions
* functional programming

---

# 9. Objects

JavaScript is heavily object-based.

A simple object:

```javascript
const person = {
    name: "Alice",
    age: 25,

    sayHello() {
        console.log("Hello!");
    }
};
```

Access properties:

```javascript
console.log(person.name);
person.sayHello();
```

You can also dynamically add properties:

```javascript
person.email = "alice@example.com";
```

This flexibility is characteristic of JavaScript.

---

# 10. Prototypes

This is one of the most important differences between JavaScript and traditional class-oriented languages such as Java.

Java fundamentally uses a class-based model:

```text
Class
  ↓
Object
```

JavaScript historically uses **prototype-based inheritance**:

```text
Object
  ↓
prototype
  ↓
another object
```

For example:

```javascript
const animal = {
    speak() {
        console.log("Some sound");
    }
};

const dog = Object.create(animal);

dog.speak();
```

`dog` can obtain behavior through its prototype chain.

---

# 11. JavaScript also has classes

Modern JavaScript provides `class` syntax:

```javascript
class Animal {
    speak() {
        console.log("Some sound");
    }
}

class Dog extends Animal {
    speak() {
        console.log("Woof");
    }
}

const dog = new Dog();
dog.speak();
```

This looks similar to Java.

But internally, JavaScript's class mechanism is built around its **prototype system**.

So:

```text
Java
class
 ↓
object-oriented class model

JavaScript
class syntax
 ↓
prototype-based object model
```

This distinction is worth learning.

---

# 12. Arrays

JavaScript arrays are flexible:

```javascript
const numbers = [10, 20, 30, 40];
```

You can use methods such as:

```javascript
numbers.map(...)
numbers.filter(...)
numbers.reduce(...)
numbers.forEach(...)
```

For example:

```javascript
const numbers = [1, 2, 3, 4, 5];

const doubled = numbers.map(n => n * 2);

console.log(doubled);
```

Result:

```text
[2, 4, 6, 8, 10]
```

This functional style is extremely common in modern JavaScript.

---

# 13. The DOM

One of JavaScript's most important browser capabilities is manipulating the **DOM (Document Object Model)**.

Suppose HTML contains:

```html
<h1 id="title">Hello</h1>
```

JavaScript can access it:

```javascript
const title = document.getElementById("title");

title.textContent = "Hello JavaScript!";
```

The browser's DOM represents the HTML document as an object structure:

```text
HTML
 │
 ↓
DOM
 │
 ├── html
 │    ├── head
 │    └── body
 │         └── h1
 │
 ↓
JavaScript manipulates it
```

This is one of the fundamental mechanisms of frontend development.

---

# 14. Event-driven programming

JavaScript is strongly associated with **event-driven programming**.

For example:

```javascript
button.addEventListener("click", () => {
    console.log("Button clicked!");
});
```

The basic model is:

```text
User
 │
 ↓
click
 │
 ↓
Browser generates event
 │
 ↓
JavaScript event handler
 │
 ↓
Application responds
```

Events can include:

```text
click
input
submit
keydown
mousemove
load
scroll
resize
```

This is a major reason JavaScript became so important for interactive web applications.

---

# 15. The Event Loop

The **event loop** is one of the most important JavaScript concepts.

JavaScript execution is traditionally based around a single main thread in the browser.

Conceptually:

```text
             JavaScript
                 │
                 ↓
            Call Stack
                 │
                 ↓
            Event Loop
                 │
       ┌─────────┴─────────┐
       ↓                   ↓
  Task Queue         Microtask Queue
```

For example:

```javascript
console.log("A");

setTimeout(() => {
    console.log("B");
}, 0);

console.log("C");
```

The output is:

```text
A
C
B
```

Even though the timer is `0`, its callback does not execute immediately.

Understanding:

* call stack
* event loop
* task queue
* microtask queue
* promises

is essential for becoming strong in JavaScript.

---

# 16. Asynchronous programming

JavaScript heavily uses asynchronous programming.

Historically:

```javascript
callback
```

Then:

```javascript
Promise
```

And modern JavaScript:

```javascript
async / await
```

For example:

```javascript
async function getUser() {
    const response = await fetch("/api/users/1");
    const user = await response.json();

    console.log(user);
}
```

The general model is:

```text
JavaScript
     │
     ↓
start asynchronous operation
     │
     ↓
continue doing other work
     │
     ↓
operation completes
     │
     ↓
Promise resolved
     │
     ↓
continue async function
```

This is particularly important for web applications because network operations are inherently asynchronous.

---

# 17. JavaScript and HTTP

Modern frontend applications frequently communicate with backend servers.

For example:

```javascript
const response = await fetch("/api/users");

const users = await response.json();

console.log(users);
```

The architecture becomes:

```text
Browser
   │
   │ JavaScript
   │
   │ HTTP
   ↓
Backend
   │
   ↓
Database
```

A typical modern application might therefore be:

```text
React / Vue / Angular
          │
          ↓
      JavaScript
          │
          ↓
       REST API
          │
          ↓
   Java / Spring Boot
          │
          ↓
      Database
```

This is particularly relevant to your Java backend learning.

---

# 18. Node.js changed JavaScript

Originally:

```text
JavaScript
     ↓
Browser
```

Then **Node.js** made it possible to run JavaScript outside the browser.

Now:

```text
JavaScript
   │
   ├── Browser
   │
   ├── Node.js
   │
   ├── Deno
   │
   └── other runtimes
```

Node.js uses the **V8 JavaScript engine**, originally developed for Google Chrome.

This enabled JavaScript to become a server-side language.

For example:

```javascript
const http = require("http");

const server = http.createServer((req, res) => {
    res.end("Hello from Node.js");
});

server.listen(3000);
```

So JavaScript evolved from primarily a **browser language** into a general-purpose application language.

---

# 19. JavaScript engines

JavaScript itself is a language specification.

Different environments provide engines that execute JavaScript.

Important engines include:

```text
Chrome / Chromium
      ↓
     V8

Firefox
      ↓
  SpiderMonkey

Safari
      ↓
 JavaScriptCore
```

The basic architecture is:

```text
JavaScript source
       ↓
JavaScript engine
       ↓
parse / compile
       ↓
execute
       ↓
CPU
```

Modern engines use sophisticated techniques such as **JIT compilation** and runtime optimization.

---

# 20. ECMAScript

There is an important terminology distinction:

> **ECMAScript is the standardized language specification; JavaScript is the most famous implementation/ecosystem based on that standard.**

Historically:

```text
JavaScript
     │
     ↓
ECMAScript standardization
     │
     ↓
ECMAScript versions
```

For example:

```text
ES5
ES6 / ES2015
ES2016
ES2017
...
```

**ES6 / ES2015** was particularly important because it introduced many modern features:

```text
let / const
class
arrow functions
modules
Promise
template literals
destructuring
default parameters
Map / Set
```

---

# 21. Modules

Modern JavaScript supports modules.

For example:

```javascript
// math.js

export function add(a, b) {
    return a + b;
}
```

Then:

```javascript
// app.js

import { add } from "./math.js";

console.log(add(10, 20));
```

This allows large applications to be divided into smaller pieces.

Conceptually:

```text
Application
│
├── user.js
├── product.js
├── order.js
├── api.js
└── main.js
```

---

# 22. JavaScript ecosystem

The JavaScript ecosystem has become enormous.

```text
                    JavaScript
                         │
        ┌────────────────┼────────────────┐
        ↓                ↓                ↓
     Browser          Node.js          Other runtimes
        │                │
        ↓                ↓
    Frontend          Backend
        │                │
 ┌──────┼──────┐        │
 ↓      ↓      ↓        ↓
React  Vue  Angular   Express
                         │
                         ↓
                    npm ecosystem
```

Important technologies include:

### Frontend

* React
* Vue
* Angular
* Svelte

### Backend

* Node.js
* Express
* NestJS

### Build tools

* npm
* pnpm
* yarn
* Vite
* webpack

### Superset / alternative

* TypeScript

---

# 23. JavaScript and TypeScript

You previously asked about the historical relationship between JavaScript and TypeScript.

The relationship is:

```text
JavaScript
    │
    │ adds static type system
    ↓
TypeScript
```

For example, JavaScript:

```javascript
function add(a, b) {
    return a + b;
}
```

TypeScript:

```typescript
function add(a: number, b: number): number {
    return a + b;
}
```

TypeScript is then compiled/transformed into JavaScript.

So:

```text
TypeScript
    ↓
compiler
    ↓
JavaScript
    ↓
JavaScript engine
    ↓
CPU
```

This is quite different from Java:

```text
Java
 ↓
javac
 ↓
bytecode
 ↓
JVM
```

---

# 24. JavaScript vs Java

Despite the names, the fundamental architectures are different.

|                             | Java                             | JavaScript               |
| --------------------------- | -------------------------------- | ------------------------ |
| Origin                      | Sun Microsystems                 | Netscape                 |
| First released              | 1995                             | 1995                     |
| Main historical environment | JVM                              | Browser                  |
| Type system                 | Static                           | Dynamic                  |
| Object model                | Class-based                      | Prototype-based          |
| Memory management           | Garbage collected                | Garbage collected        |
| Concurrency model           | Threads + modern virtual threads | Event loop + async model |
| Backend                     | Very important                   | Very important today     |
| Frontend                    | No                               | Extremely important      |
| Standard                    | Java Language Specification      | ECMAScript               |
| Runtime                     | JVM                              | JS engine                |
| Typical ecosystem           | Maven/Gradle/Spring              | npm/React/Node.js        |

The biggest conceptual difference is perhaps:

```text
Java
    Language
       ↓
     JVM
       ↓
   Application

JavaScript
    Language
       ↓
 JavaScript Engine
       ↓
 Browser / Node.js
       ↓
   Application
```

---

# 25. JavaScript's historical importance

For the programming-language history you're studying, JavaScript occupies a very special position.

A simplified evolution of Web programming is:

```text
1990s
HTML
 │
 ├── static documents
 │
 └── JavaScript
       ↓
interactive pages

2000s
JavaScript
   ↓
AJAX
   ↓
dynamic Web applications

2010s
JavaScript
   ↓
SPA
   ↓
React / Angular / Vue

JavaScript
   ↓
Node.js
   ↓
server-side development

2020s
JavaScript / TypeScript
   ↓
full-stack applications
```

JavaScript essentially helped transform the Web from a **document platform** into an **application platform**.

---

# 26. The deeper idea behind JavaScript

If we look at programming-language history from the perspective you've been using, there is an interesting progression:

```text
Machine language
      ↓
Assembly
      ↓
FORTRAN
      ↓
C
      ↓
C++
      ↓
Java
      ↓
JavaScript
```

These languages addressed different problems.

### C

> Efficient system programming.

### C++

> Large-scale object-oriented systems programming.

### Java

> Portable, managed, object-oriented application and enterprise programming.

### JavaScript

> **Programming inside the interactive Web.**

That last point is probably the most important thing to remember.

---

# 27. JavaScript's core concepts to learn

If you want to learn JavaScript systematically, I recommend this order:

```text
1. Syntax
   ↓
2. Variables / values / types
   ↓
3. Operators
   ↓
4. Control flow
   ↓
5. Functions
   ↓
6. Arrays / objects
   ↓
7. Scope
   ↓
8. this
   ↓
9. Prototypes
   ↓
10. Classes
   ↓
11. Closures
   ↓
12. Modules
   ↓
13. DOM
   ↓
14. Events
   ↓
15. Async programming
   ↓
16. Promise
   ↓
17. async / await
   ↓
18. Event loop
   ↓
19. Fetch / HTTP
   ↓
20. npm
   ↓
21. TypeScript
   ↓
22. React / Vue / Angular
   ↓
23. Node.js
```

For **frontend**, emphasize:

```text
JavaScript
 ↓
DOM
 ↓
Events
 ↓
Async
 ↓
HTTP
 ↓
React/Vue/Angular
 ↓
TypeScript
```

For **backend**, emphasize:

```text
JavaScript
 ↓
Node.js
 ↓
HTTP
 ↓
Async/Event Loop
 ↓
npm
 ↓
Express/NestJS
 ↓
Database
 ↓
TypeScript
```

And for your particular **Java backend** path, learning JavaScript to roughly the level of **DOM + events + async + HTTP + basic TypeScript** will give you a very useful understanding of the other side of a modern web application:

```text
          FRONTEND                         BACKEND

     HTML / CSS / JS
            │
            │ HTTP
            ↓
       REST / JSON
            │
            ↓
       Spring Boot
            │
            ↓
          Java
            │
            ↓
        Database
```

**In one sentence:** JavaScript began as the programming language of the Web browser, evolved through the DOM, events, AJAX, and asynchronous programming into the dominant language of interactive Web applications, and then expanded beyond the browser through runtimes such as Node.js.
