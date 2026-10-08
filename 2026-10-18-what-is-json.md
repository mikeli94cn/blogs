# JSON Introduction

**JSON** stands for **JavaScript Object Notation**. It is a lightweight text format for representing and exchanging structured data.

Today, JSON is one of the most important data formats in **web development, REST APIs, configuration files, databases, and distributed systems**.

---

## 1. What problem does JSON solve?

Suppose a Java backend server needs to send student information to a JavaScript frontend.

The server needs to communicate something like:

```text
Name: Alice
Age: 20
Major: Computer Science
```

A simple text format is not enough because the computer needs to know the **structure** of the data.

JSON represents it like this:

```json
{
  "name": "Alice",
  "age": 20,
  "major": "Computer Science"
}
```

The important idea is:

> **JSON is a standardized text representation of structured data.**

It allows different programming languages to exchange data.

For example:

```text
Java
  ↓
JSON
  ↓
JavaScript
```

or:

```text
Python
  ↓
JSON
  ↓
Java
```

or:

```text
C#
  ↓
JSON
  ↓
JavaScript
```

---

# 2. A Simple JSON Object

The most basic JSON structure is an **object**:

```json
{
  "name": "Alice",
  "age": 20,
  "student": true
}
```

It consists of **key-value pairs**:

```text
key       value
-------------------------
"name"    "Alice"
"age"     20
"student" true
```

The general syntax is:

```json
{
  "key": value
}
```

Multiple properties are separated by commas:

```json
{
  "name": "Alice",
  "age": 20,
  "city": "Tokyo"
}
```

---

# 3. JSON Data Types

JSON has six basic kinds of values.

### String

```json
"name": "Alice"
```

Strings use double quotes.

```json
"Hello"
```

Not:

```json
'Hello'
```

---

### Number

```json
"age": 20
```

Both integers and floating-point numbers are represented as numbers:

```json
{
  "age": 20,
  "height": 175.5
}
```

---

### Boolean

```json
{
  "active": true,
  "admin": false
}
```

Only:

```text
true
false
```

---

### Null

```json
{
  "middleName": null
}
```

`null` means there is no value.

---

### Object

An object can contain another object:

```json
{
  "name": "Alice",
  "address": {
    "city": "Tokyo",
    "country": "Japan"
  }
}
```

This creates a hierarchical structure:

```text
Alice
 └── address
      ├── city
      └── country
```

---

### Array

An array is a list:

```json
{
  "languages": [
    "Java",
    "JavaScript",
    "Python"
  ]
}
```

Arrays use:

```text
[ ]
```

Objects use:

```text
{ }
```

---

# 4. JSON Object vs JSON Array

These two structures are extremely important.

### Object

```json
{
  "name": "Alice",
  "age": 20
}
```

Think:

> **one thing with properties**

For example:

```text
Student
 ├── name
 ├── age
 └── major
```

### Array

```json
[
  "Java",
  "Python",
  "C++"
]
```

Think:

> **a collection of things**

You can also have an array of objects:

```json
[
  {
    "id": 1,
    "name": "Alice"
  },
  {
    "id": 2,
    "name": "Bob"
  }
]
```

This is extremely common in REST APIs.

---

# 5. Nested JSON

Real-world JSON is often hierarchical.

For example:

```json
{
  "id": 1001,
  "name": "Alice",
  "age": 20,
  "address": {
    "city": "Tokyo",
    "country": "Japan"
  },
  "courses": [
    "Java",
    "Database",
    "Spring Boot"
  ]
}
```

You can visualize it as:

```text
Student
│
├── id
├── name
├── age
│
├── address
│   ├── city
│   └── country
│
└── courses
    ├── Java
    ├── Database
    └── Spring Boot
```

This hierarchical nature is one reason JSON is so useful.

---

# 6. JSON and JavaScript

JSON originated from the JavaScript ecosystem, which explains its name.

However:

> **JSON is not JavaScript.**

For example, JSON:

```json
{
  "name": "Alice"
}
```

looks very similar to a JavaScript object:

```javascript
const student = {
    name: "Alice"
};
```

But they are different things.

JSON is a **data interchange format**.

JavaScript objects are **programming-language objects**.

---

# 7. JSON and HTTP

This is especially important for your **Java backend development**.

A typical REST API might work like this:

```text
Browser / Mobile App
        │
        │ HTTP Request
        │
        ▼
   Spring Boot
      Server
        │
        │ HTTP Response
        ▼
      JSON
```

For example:

```http
GET /api/students/1001
```

The server might return:

```json
{
  "id": 1001,
  "name": "Alice",
  "age": 20,
  "major": "Computer Science"
}
```

So you will frequently see:

```text
HTTP
 +
REST
 +
JSON
```

together.

---

# 8. JSON Request Body

A client can also send JSON **to** the server.

For example:

```http
POST /api/students
Content-Type: application/json
```

Request body:

```json
{
  "name": "Alice",
  "age": 20,
  "major": "Computer Science"
}
```

The Spring Boot application can convert this JSON into a Java object.

Conceptually:

```text
JSON
  ↓
Jackson
  ↓
Java Object
```

For example:

```java
public class Student {
    private String name;
    private int age;
    private String major;

    // getters and setters
}
```

Then JSON:

```json
{
  "name": "Alice",
  "age": 20,
  "major": "Computer Science"
}
```

can become:

```java
Student student
```

---

# 9. Java ↔ JSON

This process has two important names.

### Deserialization

JSON → Java object

```text
JSON
 ↓
Java Object
```

Example:

```json
{
  "name": "Alice",
  "age": 20
}
```

↓

```java
Student student;
```

This is called **deserialization**.

### Serialization

Java object → JSON

```text
Java Object
 ↓
JSON
```

For example:

```java
Student student = new Student("Alice", 20);
```

↓

```json
{
  "name": "Alice",
  "age": 20
}
```

This is called **serialization**.

---

# 10. Jackson

Since you're learning **Java backend + Spring Boot**, you should know **Jackson**.

Jackson is one of the major Java libraries for processing JSON.

Conceptually:

```text
                 Jackson
                    │
        ┌───────────┴───────────┐
        │                       │
 Java Object                JSON
        │                       │
        └──── Serialization ────┘
        
 JSON
   │
   │ Deserialization
   ▼
Java Object
```

Spring Boot commonly uses Jackson for JSON handling.

For example, a Spring controller can return:

```java
@GetMapping("/students/1")
public Student getStudent() {
    return new Student("Alice", 20);
}
```

Spring/Jackson can turn the returned Java object into:

```json
{
  "name": "Alice",
  "age": 20
}
```

You don't normally have to manually construct the JSON string.

---

# 11. JSON vs XML

Before JSON became dominant in web APIs, **XML** was extremely important.

XML:

```xml
<student>
    <name>Alice</name>
    <age>20</age>
    <major>Computer Science</major>
</student>
```

JSON:

```json
{
  "name": "Alice",
  "age": 20,
  "major": "Computer Science"
}
```

JSON is generally:

* shorter
* easier to read
* easier to parse
* naturally maps to objects and arrays
* very convenient for JavaScript
* widely used by REST APIs

XML still has important uses, especially in some enterprise and legacy systems.

---

# 12. JSON vs Java Serialization

Don't confuse JSON with Java's native serialization.

Java serialization historically uses things such as:

```java
ObjectOutputStream
```

while JSON is a language-independent text format.

For example:

```text
Java Object
     │
     ├── Java Serialization
     │       ↓
     │   Java-specific binary format
     │
     └── JSON Serialization
             ↓
         Text representation
```

JSON is much better suited for communication between different technologies:

```text
Java ↔ JavaScript
Java ↔ Python
Java ↔ C#
Java ↔ Go
```

---

# 13. JSON File

JSON can also be stored in a file.

For example:

```text
student.json
```

containing:

```json
{
  "id": 1001,
  "name": "Alice",
  "age": 20
}
```

JSON is commonly used for configuration as well.

For example:

```json
{
  "server": {
    "host": "localhost",
    "port": 8080
  }
}
```

Although in Spring Boot applications you'll more commonly encounter:

```text
application.properties
```

or

```text
application.yml
```

for configuration.

---

# 14. Important JSON Syntax Rules

Remember these rules.

### Keys must use double quotes

Correct:

```json
{
  "name": "Alice"
}
```

Incorrect:

```json
{
  name: "Alice"
}
```

### Strings use double quotes

Correct:

```json
{
  "name": "Alice"
}
```

Incorrect:

```json
{
  "name": 'Alice'
}
```

### No trailing comma

Correct:

```json
{
  "name": "Alice",
  "age": 20
}
```

Incorrect:

```json
{
  "name": "Alice",
  "age": 20,
}
```

### JSON has no comments

This is not standard JSON:

```json
{
  "name": "Alice" // student name
}
```

---

# 15. JSON's Position in Backend Development

For your Java backend learning, I would place JSON here:

```text
                    Backend
                       │
          ┌────────────┴────────────┐
          │                         │
        HTTP                       Data
          │                         │
       REST API                    JSON
          │                         │
          └──────────┬──────────────┘
                     │
                Spring Boot
                     │
                  Jackson
                     │
                Java Object
```

A very common modern backend stack is:

```text
Client
  │
  │ HTTP
  ▼
REST API
  │
  │ JSON
  ▼
Spring Boot
  │
  │ Java Objects
  ▼
Service
  │
  ▼
Database
```

So when you learn:

**JSON → HTTP → REST → RESTful API → Spring Boot → Jackson**

you are learning a very important part of modern Java backend development.

---

## 16. The most important concepts to remember

If you're learning JSON as a beginner, focus on these first:

| Concept         | Meaning                              |
| --------------- | ------------------------------------ |
| JSON            | Data interchange format              |
| Object `{}`     | Key-value structure                  |
| Array `[]`      | List of values                       |
| String          | Text                                 |
| Number          | Numeric value                        |
| Boolean         | `true` / `false`                     |
| `null`          | No value                             |
| Nested object   | Object inside object                 |
| Serialization   | Java object → JSON                   |
| Deserialization | JSON → Java object                   |
| Jackson         | Java JSON processing library         |
| REST API        | Common place where JSON is exchanged |

The key mental model is:

> **JSON is the common language that allows different applications and programming languages to exchange structured data.**

For a Java backend developer, JSON is therefore not really a "Java topic"—it's a **web/data interchange fundamental** that connects **Java objects ↔ HTTP ↔ REST APIs ↔ frontend/mobile clients**.
