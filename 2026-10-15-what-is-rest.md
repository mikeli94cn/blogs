# 1.REST — Representational State Transfer

**REST** is an architectural style for designing network APIs, especially **Web APIs**.

The simplest way to think about it is:

> **REST is a way of using HTTP to expose and manipulate resources over a network.**

For example, a backend might expose:

```text
GET    /users/123
POST   /users
PUT    /users/123
DELETE /users/123
```

A frontend, mobile app, or another backend can communicate with your server through these HTTP requests.

---

# 1. Why was REST created?

Before REST became popular, network communication often used approaches such as:

* RPC
* SOAP
* XML-RPC
* proprietary protocols

These often focused on **calling operations**:

```text
getUser(123)
createUser(...)
deleteUser(123)
```

REST takes a somewhat different approach.

Instead of thinking:

> "What function should I call?"

you think:

> **"What resource am I working with, and what HTTP operation should I perform on it?"**

For example:

```text
/users/123
```

represents a **User resource**.

Then HTTP provides the operations:

```text
GET       → retrieve
POST      → create
PUT       → replace/update
PATCH     → partially update
DELETE    → delete
```

So:

```http
GET /users/123
```

means:

> Give me user 123.

while:

```http
DELETE /users/123
```

means:

> Delete user 123.

---

# 2. REST is an architectural style, not a protocol

This distinction is important.

REST is **not**:

* a programming language
* a framework
* a protocol
* a replacement for HTTP

REST is an **architectural style**.

HTTP is the most common protocol used to implement REST APIs.

You can therefore have:

```text
REST API
   ↓
HTTP
   ↓
TCP/IP
   ↓
Internet
```

For a Java backend developer, you'll commonly see:

```text
Browser / Mobile App / Frontend
              │
             HTTP
              │
              ▼
       REST API
              │
       Spring Boot
              │
              ▼
        Service Layer
              │
              ▼
       Repository / DB
```

---

# 3. What is a resource?

A **resource** is one of the central ideas of REST.

For example, an online store might have:

```text
Users
Products
Orders
Payments
Reviews
```

These can become REST resources:

```text
/users
/products
/orders
/payments
/reviews
```

Individual resources can be identified by IDs:

```text
/users/123
/products/456
/orders/789
```

You can think of the URL as identifying **what thing you're talking about**.

---

# 4. HTTP methods

REST makes heavy use of standard HTTP methods.

### GET

Retrieve a resource.

```http
GET /users/123
```

Response:

```json
{
  "id": 123,
  "name": "Alice",
  "email": "alice@example.com"
}
```

---

### POST

Create a new resource.

```http
POST /users
Content-Type: application/json
```

Request:

```json
{
  "name": "Bob",
  "email": "bob@example.com"
}
```

The server might respond:

```http
201 Created
```

with:

```json
{
  "id": 124,
  "name": "Bob",
  "email": "bob@example.com"
}
```

---

### PUT

Replace/update a resource.

```http
PUT /users/123
```

For example:

```json
{
  "id": 123,
  "name": "Alice Smith",
  "email": "alice@example.com"
}
```

---

### PATCH

Partially modify a resource.

```http
PATCH /users/123
```

Request:

```json
{
  "name": "Alice Smith"
}
```

You don't necessarily need to send the entire user.

---

### DELETE

Delete a resource.

```http
DELETE /users/123
```

---

# 5. REST vs RPC

This is especially useful because you recently asked about **RPC**.

The conceptual difference is:

### RPC

Think in terms of **actions/functions**:

```text
getUser(123)
createUser(...)
deleteUser(123)
```

### REST

Think in terms of **resources + HTTP methods**:

```text
GET    /users/123
POST   /users
DELETE /users/123
```

A simplified comparison:

| Concept         | RPC                       | REST                 |
| --------------- | ------------------------- | -------------------- |
| Main idea       | Call operations           | Manipulate resources |
| URL             | Often operation-oriented  | Resource-oriented    |
| Example         | `/getUser`                | `/users/123`         |
| Operations      | Custom functions          | HTTP methods         |
| Common format   | JSON/XML/etc.             | Usually JSON         |
| Common protocol | HTTP, but not necessarily | Usually HTTP         |

Neither is universally "better." They are different architectural approaches.

---

# 6. REST uses HTTP status codes

REST APIs normally use HTTP status codes to communicate the result.

Common ones:

```text
200 OK
201 Created
204 No Content

400 Bad Request
401 Unauthorized
403 Forbidden
404 Not Found
409 Conflict

500 Internal Server Error
```

For example:

```http
GET /users/999
```

might return:

```http
404 Not Found
```

while:

```http
POST /users
```

might return:

```http
201 Created
```

This allows the client to understand the result without interpreting a custom message.

---

# 7. Statelessness

**Statelessness** is one of the most important REST principles.

Each request should contain the information necessary for the server to process it.

For example:

```http
GET /users/123
Authorization: Bearer eyJ...
```

The server shouldn't have to remember:

```text
"Ah, this is the same client that talked to me five minutes ago."
```

Instead, each request carries the necessary context.

This is particularly useful for scalable backend systems because requests can potentially be handled by different server instances:

```text
              Load Balancer
              /     |     \
             /      |      \
         Server A Server B Server C
```

Because the servers don't need to maintain client conversation state in local memory, horizontal scaling becomes easier.

---

# 8. JSON and REST

REST itself does **not require JSON**.

REST can theoretically use:

```text
JSON
XML
HTML
CSV
text
...
```

But modern REST APIs overwhelmingly use JSON.

Example:

```json
{
  "id": 123,
  "name": "Alice",
  "age": 25
}
```

This is why you'll frequently hear:

> "REST API returns JSON."

Technically, that's a common implementation rather than the definition of REST.

---

# 9. REST API example

Imagine you're building a Student Management System.

You might design:

```text
GET    /students
GET    /students/1
POST   /students
PUT    /students/1
PATCH  /students/1
DELETE /students/1
```

For example:

```http
GET /students
```

Response:

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

And:

```http
GET /students/1
```

returns:

```json
{
  "id": 1,
  "name": "Alice"
}
```

This is a very natural REST design.

---

# 10. REST in Spring Boot

This is particularly important for you as a Java backend learner.

Spring Boot makes REST API development relatively easy.

For example:

```java
@RestController
@RequestMapping("/students")
public class StudentController {

    @GetMapping
    public List<Student> getStudents() {
        return studentService.findAll();
    }

    @GetMapping("/{id}")
    public Student getStudent(@PathVariable Long id) {
        return studentService.findById(id);
    }

    @PostMapping
    public Student createStudent(@RequestBody Student student) {
        return studentService.create(student);
    }

    @DeleteMapping("/{id}")
    public void deleteStudent(@PathVariable Long id) {
        studentService.delete(id);
    }
}
```

Spring maps HTTP requests to Java methods:

```text
HTTP                     Java

GET /students       →    getStudents()

GET /students/1     →    getStudent(1)

POST /students      →    createStudent()

DELETE /students/1  →    deleteStudent(1)
```

This is one of the most important things you'll learn when moving from **Java fundamentals → Spring → Spring Boot**.

---

# 11. REST architecture in a Java backend

A typical Spring Boot REST application looks like:

```text
                    Client
                      │
                 HTTP / JSON
                      │
                      ▼
              ┌───────────────┐
              │   Controller  │
              │  REST API     │
              └───────┬───────┘
                      │
                      ▼
              ┌───────────────┐
              │    Service    │
              │ Business Logic│
              └───────┬───────┘
                      │
                      ▼
              ┌───────────────┐
              │  Repository   │
              │ Data Access   │
              └───────┬───────┘
                      │
                      ▼
                 Database
```

For example:

```text
GET /students/1
       │
       ▼
StudentController
       │
       ▼
StudentService
       │
       ▼
StudentRepository
       │
       ▼
     MySQL
```

Then the result travels back:

```text
MySQL
  ↓
Repository
  ↓
Service
  ↓
Controller
  ↓
JSON
  ↓
Client
```

---

# 12. REST and CRUD

REST maps very naturally to **CRUD**:

| CRUD   | HTTP      | Example              |
| ------ | --------- | -------------------- |
| Create | POST      | `POST /students`     |
| Read   | GET       | `GET /students/1`    |
| Update | PUT/PATCH | `PUT /students/1`    |
| Delete | DELETE    | `DELETE /students/1` |

This is why REST became so popular for ordinary business applications.

---

# 13. Important REST principles

The original REST architectural style has several constraints.

The most important ones to know are:

```text
1. Client–Server
2. Stateless
3. Cacheable
4. Uniform Interface
5. Layered System
6. Code-on-Demand (optional)
```

For backend development, the first five are much more important to understand than memorizing the terminology.

---

# 14. REST ≠ RESTful API

You'll often see both terms.

**REST** = the architectural style.

**RESTful** = an API that follows REST principles reasonably well.

For example:

```text
GET /students/123
```

is more RESTful than:

```text
GET /getStudent?id=123
```

Similarly:

```text
DELETE /students/123
```

is more REST-oriented than:

```text
POST /deleteStudent
```

The second approach looks more like RPC.

---

# 15. REST and microservices

REST is also extremely common in microservices.

For example:

```text
             API Gateway
                  │
       ┌──────────┼──────────┐
       ↓          ↓          ↓
   User Service Order Service Product Service
       │          │          │
       ↓          ↓          ↓
     DB           DB         DB
```

Services might communicate through:

```http
GET http://user-service/users/123
```

or:

```http
GET http://product-service/products/456
```

However, REST is **not synonymous with microservices**.

You can have:

```text
Monolithic application + REST
```

or:

```text
Microservices + REST
```

---

# 16. REST vs SOAP vs RPC

A useful historical picture is:

```text
Older enterprise Web
        │
        ├── SOAP
        │
        └── XML-RPC
               │
               ▼
       Web API evolution
               │
               ▼
             REST
               │
               ▼
       Modern HTTP APIs
```

And today you'll also encounter:

```text
REST
GraphQL
gRPC
WebSocket
Message Queues
```

These solve somewhat different communication problems.

---

# 17. The big picture

For your **Java backend learning path**, I'd place REST here:

```text
Java
 │
 ├── OOP
 ├── Collections
 ├── Exceptions
 ├── Generics
 ├── I/O
 ├── Concurrency
 │
 ▼
HTTP / Web fundamentals
 │
 ├── HTTP request/response
 ├── URL
 ├── headers
 ├── status codes
 ├── cookies
 └── JSON
 │
 ▼
Servlet / Tomcat concepts
 │
 ▼
Spring
 │
 ▼
Spring Boot
 │
 ▼
Spring MVC
 │
 ▼
REST API
 │
 ▼
Database
 │
 ▼
Spring Data JPA / MyBatis
 │
 ▼
Security / JWT
 │
 ▼
Microservices / RPC / Messaging
```

So I would **definitely learn REST as part of your Spring Boot backend stage**.

The key mental model to remember is:

> **REST = resources + HTTP + stateless communication + standard representations/status codes.**

And the most practical pattern is:

```text
HTTP Method + URL + JSON
             ↓
        Spring Controller
             ↓
          Service
             ↓
        Repository
             ↓
          Database
```

That model will connect many of the topics you've been asking about—**Servlet, Tomcat, Spring, Spring Boot, HTTP, JSON, JWT, databases, RPC, message queues, and microservices**.

# 2.RESTful API

A **RESTful API** is an API designed according to the principles of **REST (Representational State Transfer)**, usually using **HTTP** to communicate between a client and a server.

The simplest mental model is:

> **RESTful API = Resources + URLs + HTTP methods + representations + HTTP status codes**

For a Java backend developer, RESTful APIs are one of the most important things to learn because **Spring Boot is very commonly used to build them**.

---

## 1. What is an API?

API means **Application Programming Interface**.

Suppose you have:

```text
Frontend
   │
   │ HTTP
   ▼
Backend
   │
   ▼
Database
```

The frontend needs to ask the backend:

```text
"Give me student #123."
```

Instead of directly accessing the database, it calls an API:

```http
GET /students/123
```

The backend responds:

```json
{
  "id": 123,
  "name": "Alice",
  "age": 20
}
```

So an API provides a **communication interface between software systems**.

---

# 2. What makes an API RESTful?

A RESTful API organizes the backend around **resources**.

For a Student Management System, your resources might be:

```text
/students
/courses
/teachers
/departments
```

Individual resources can be identified with IDs:

```text
/students/123
/courses/456
/teachers/789
```

The HTTP method tells the server what you want to do.

For example:

```text
GET     /students/123
```

means:

> Retrieve student 123.

While:

```text
DELETE  /students/123
```

means:

> Delete student 123.

The **URL identifies the resource**, while the **HTTP method expresses the operation**.

---

# 3. The four basic CRUD operations

RESTful APIs map naturally to CRUD.

| Operation | HTTP method | Example                |
| --------- | ----------- | ---------------------- |
| Create    | POST        | `POST /students`       |
| Read      | GET         | `GET /students/123`    |
| Update    | PUT         | `PUT /students/123`    |
| Delete    | DELETE      | `DELETE /students/123` |

This is probably the most important pattern to memorize.

### Create

```http
POST /students
```

```json
{
  "name": "Alice",
  "age": 20
}
```

### Read

```http
GET /students/123
```

### Update

```http
PUT /students/123
```

```json
{
  "name": "Alice Smith",
  "age": 21
}
```

### Delete

```http
DELETE /students/123
```

---

# 4. Collection vs individual resource

This distinction is very useful.

### Collection

```text
/students
```

means:

> The collection of students.

For example:

```http
GET /students
```

might return:

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

### Individual resource

```text
/students/1
```

means:

> Student #1.

```http
GET /students/1
```

might return:

```json
{
  "id": 1,
  "name": "Alice"
}
```

This gives you a very clean structure:

```text
/students       → collection
/students/1     → one student
/students/2     → one student
/students/3     → one student
```

---

# 5. URL design

A good RESTful API usually uses **nouns**, not verbs.

Prefer:

```text
GET /students/123
```

rather than:

```text
GET /getStudent/123
```

Prefer:

```text
POST /students
```

rather than:

```text
POST /createStudent
```

Prefer:

```text
DELETE /students/123
```

rather than:

```text
POST /deleteStudent/123
```

Why?

Because REST separates:

```text
WHAT?
  ↓
/students/123

ACTION?
  ↓
GET / DELETE / PUT / PATCH
```

So the URL represents the **resource**, and HTTP provides the **operation**.

---

# 6. HTTP request structure

A RESTful API request generally looks like:

```text
HTTP method
     +
URL
     +
Headers
     +
Body
```

For example:

```http
POST /students HTTP/1.1
Content-Type: application/json
Authorization: Bearer <token>

{
  "name": "Alice",
  "age": 20
}
```

Conceptually:

```text
┌─────────────────────────┐
│ HTTP Method             │
│ POST                    │
├─────────────────────────┤
│ URL                     │
│ /students               │
├─────────────────────────┤
│ Headers                 │
│ Content-Type            │
│ Authorization           │
├─────────────────────────┤
│ Body                    │
│ { ... JSON ... }        │
└─────────────────────────┘
```

---

# 7. HTTP response

The server sends a response:

```text
Status Code
     +
Headers
     +
Body
```

For example:

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id": 123,
  "name": "Alice",
  "age": 20
}
```

---

# 8. HTTP status codes

RESTful APIs make extensive use of HTTP status codes.

### Success

```text
200 OK
```

Request succeeded.

```text
201 Created
```

A new resource was created.

```text
204 No Content
```

Request succeeded but there's no response body.

### Client errors

```text
400 Bad Request
```

The request is invalid.

```text
401 Unauthorized
```

Authentication is required or failed.

```text
403 Forbidden
```

The client is authenticated but doesn't have permission.

```text
404 Not Found
```

The requested resource doesn't exist.

```text
409 Conflict
```

The request conflicts with the current state.

### Server error

```text
500 Internal Server Error
```

Something went wrong on the server.

---

# 9. JSON

RESTful APIs commonly use **JSON** to represent resources.

For example:

```json
{
  "id": 123,
  "name": "Alice",
  "email": "alice@example.com"
}
```

But an important technical point:

> **REST does not require JSON.**

REST is an architectural style. JSON is simply the most common representation used by modern REST APIs.

Historically, XML was also very common.

---

# 10. Path parameters

Suppose we have:

```http
GET /students/123
```

Here:

```text
123
```

is a **path parameter**.

In Spring Boot:

```java
@GetMapping("/students/{id}")
public Student getStudent(@PathVariable Long id) {
    return studentService.findById(id);
}
```

Spring extracts:

```text
123
```

and puts it into:

```java
Long id
```

---

# 11. Query parameters

You can also use query parameters.

For example:

```http
GET /students?page=2&size=20
```

Here:

```text
page = 2
size = 20
```

are query parameters.

They're commonly used for:

* filtering
* searching
* sorting
* pagination

For example:

```text
GET /students?name=Alice
```

or:

```text
GET /students?age=20
```

or:

```text
GET /students?page=2&size=20
```

or:

```text
GET /students?sort=name
```

---

# 12. Nested resources

Suppose students belong to courses.

You might have:

```text
/students/123/courses
```

meaning:

> Courses associated with student 123.

For example:

```http
GET /students/123/courses
```

You could also have:

```text
/courses/456/students
```

meaning:

> Students enrolled in course 456.

However, you shouldn't make URLs excessively nested.

This:

```text
/students/123/courses/456/teachers/789
```

can become difficult to understand.

Good REST API design tries to keep resource relationships clear and reasonably simple.

---

# 13. PUT vs PATCH

This is a common interview question.

### PUT

Generally represents replacing the resource with the supplied representation.

```http
PUT /students/123
```

```json
{
  "name": "Alice",
  "age": 21
}
```

### PATCH

Generally represents a partial modification.

```http
PATCH /students/123
```

```json
{
  "age": 21
}
```

The distinction is conceptually:

```text
PUT
↓
Replace/update the resource representation

PATCH
↓
Modify part of the resource
```

---

# 14. Statelessness

RESTful APIs are normally **stateless**.

Suppose:

```text
Client → Server
```

Every request should contain the information necessary for the server to process it.

For example:

```http
GET /students/123
Authorization: Bearer eyJ...
```

The server shouldn't need to remember a previous request just to understand this request.

This is particularly useful when you have multiple backend servers:

```text
                 Load Balancer
                 /     |     \
                /      |      \
               ↓       ↓       ↓
           Server A Server B Server C
```

A request can potentially go to any server.

---

# 15. RESTful API and authentication

REST itself doesn't specify authentication.

A RESTful API can use mechanisms such as:

```text
Session + Cookie
Basic Authentication
OAuth 2.0
JWT
API Key
```

A common modern architecture is:

```text
Client
   │
   │ Authorization: Bearer <JWT>
   ▼
REST API
   │
   ▼
Spring Security
```

For example:

```http
GET /students/123
Authorization: Bearer eyJhbGciOi...
```

This connects directly to the **JWT** topic you asked about earlier.

---

# 16. RESTful API in Spring Boot

This is where REST becomes especially relevant to your Java backend learning.

A simple Spring Boot controller might look like:

```java
@RestController
@RequestMapping("/students")
public class StudentController {

    @GetMapping
    public List<Student> getStudents() {
        return studentService.findAll();
    }

    @GetMapping("/{id}")
    public Student getStudent(@PathVariable Long id) {
        return studentService.findById(id);
    }

    @PostMapping
    public Student createStudent(@RequestBody Student student) {
        return studentService.create(student);
    }

    @PutMapping("/{id}")
    public Student updateStudent(
            @PathVariable Long id,
            @RequestBody Student student) {

        return studentService.update(id, student);
    }

    @DeleteMapping("/{id}")
    public void deleteStudent(@PathVariable Long id) {
        studentService.delete(id);
    }
}
```

This gives you:

```text
HTTP Request             Java method
────────────────────────────────────────
GET /students       →    getStudents()

GET /students/1     →    getStudent(1)

POST /students      →    createStudent()

PUT /students/1     →    updateStudent()

DELETE /students/1  →    deleteStudent()
```

This is the core connection between **HTTP and Spring MVC**.

---

# 17. The complete request flow

Suppose a frontend sends:

```http
GET /students/123
```

The flow might be:

```text
Browser / React / Mobile App
            │
            │ HTTP
            ▼
       Tomcat Server
            │
            ▼
   Spring MVC DispatcherServlet
            │
            ▼
    StudentController
            │
            ▼
      StudentService
            │
            ▼
   StudentRepository
            │
            ▼
         Database
```

Then the result travels back:

```text
Database
   ↓
Repository
   ↓
Service
   ↓
Controller
   ↓
Jackson → JSON
   ↓
HTTP Response
   ↓
Client
```

For example:

```json
{
  "id": 123,
  "name": "Alice"
}
```

---

# 18. RESTful API vs REST

There is a subtle distinction:

### REST

An **architectural style**.

It describes principles such as:

```text
Client-server
Statelessness
Cacheability
Uniform interface
Layered system
```

### RESTful API

An actual **API designed using those REST principles**.

So:

```text
REST
 ↓
Architectural principles
 ↓
RESTful API
 ↓
HTTP endpoints
 ↓
Spring Boot implementation
```

---

# 19. RESTful API vs RPC

Since you just asked about RPC, this comparison is particularly useful.

### RPC

Think:

```text
"What operation do I want to execute?"
```

```text
getStudent(123)
createStudent(...)
deleteStudent(123)
```

### REST

Think:

```text
"What resource am I manipulating?"
```

```text
GET    /students/123
POST   /students
DELETE /students/123
```

Conceptually:

```text
RPC                         REST
────────────────────────────────────────
Action-oriented             Resource-oriented

getStudent(123)             GET /students/123

createStudent()             POST /students

deleteStudent(123)          DELETE /students/123

Custom operations           HTTP methods
```

---

# 20. RESTful API vs GraphQL

You also recently asked about GraphQL, so these two are worth comparing.

### REST

The server defines endpoints:

```text
GET /users/123
GET /users/123/orders
GET /products/456
```

The client chooses which endpoint to call.

### GraphQL

Usually there is one main endpoint:

```text
POST /graphql
```

The client specifies what data it wants.

For example:

```graphql
query {
    user(id: 123) {
        name
        orders {
            id
        }
    }
}
```

Conceptually:

```text
REST
Client → predefined resources/endpoints → Server

GraphQL
Client → query describing required data → Server
```

---

# 21. RESTful API vs WebSocket

These are also different.

### REST

Usually:

```text
Client → Request → Server
Client ← Response ← Server
```

Good for:

```text
CRUD
business APIs
data retrieval
normal web applications
```

### WebSocket

Creates a persistent two-way connection:

```text
Client ←────────────→ Server
```

Both sides can send messages whenever necessary.

Good for:

```text
chat
real-time notifications
online games
live dashboards
```

So REST and WebSocket aren't really competitors; they often coexist in the same application.

---

# 22. A practical REST API design

For your Student Management System, I'd recommend eventually building this:

```text
Students
──────────────────────────

GET     /api/students
GET     /api/students/{id}
POST    /api/students
PUT     /api/students/{id}
PATCH   /api/students/{id}
DELETE  /api/students/{id}
```

Then add:

```text
Courses
──────────────────────────

GET     /api/courses
GET     /api/courses/{id}
POST    /api/courses
PUT     /api/courses/{id}
DELETE  /api/courses/{id}
```

Then relationships:

```text
GET /api/students/123/courses
POST /api/students/123/courses/456
```

And eventually:

```text
Authentication
       ↓
JWT / Spring Security
       ↓
REST API
       ↓
Service
       ↓
JPA / MyBatis
       ↓
MySQL / PostgreSQL
```

That would make an excellent **Phase 2 project after your Java foundation project**.

---

## The key mental model

If you remember only one thing, remember this:

```text
                    RESTful API
                         │
       ┌─────────────────┼─────────────────┐
       │                 │                 │
   Resources         HTTP Methods       Representations
       │                 │                 │
   /students          GET              JSON
   /students/1        POST             JSON
   /courses            PUT
   /orders             PATCH
                       DELETE
                         │
                         ▼
                  HTTP Status Codes
                         │
                  200 / 201 / 204
                  400 / 401 / 403
                  404 / 409 / 500
```

And from the perspective of a **Java backend developer**:

```text
Java
  ↓
HTTP
  ↓
Servlet / Tomcat
  ↓
Spring MVC
  ↓
Spring Boot
  ↓
RESTful API
  ↓
JSON
  ↓
Database
```

So **REST is the architectural idea**, while a **RESTful API is the concrete HTTP API you build according to that idea**.
