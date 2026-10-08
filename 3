## REST — Representational State Transfer

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
