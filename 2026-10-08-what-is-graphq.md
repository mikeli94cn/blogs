## GraphQL introduction

**GraphQL** is an API query language and runtime originally developed by Facebook (now Meta) and released publicly in 2015.

The simplest way to understand it is:

> **REST exposes many predefined endpoints; GraphQL exposes a data graph and lets the client ask for exactly the data it needs.**

GraphQL is especially important in modern web and mobile application development.

---

# 1. Why was GraphQL created?

Suppose you have a blog application.

With a traditional REST API, you might have:

```text
GET /users/123
GET /users/123/posts
GET /posts/456
GET /posts/456/comments
```

The frontend may need:

```text
User
 ├── name
 ├── email
 └── posts
      ├── title
      └── comments
           └── text
```

With REST, you may need several HTTP requests:

```text
GET /users/123
GET /users/123/posts
GET /posts/456/comments
...
```

GraphQL tries to solve this by allowing the client to describe the **shape of the data it wants**.

For example:

```graphql
query {
    user(id: 123) {
        name
        email
        posts {
            title
            comments {
                text
            }
        }
    }
}
```

The server returns approximately:

```json
{
  "data": {
    "user": {
      "name": "Mike",
      "email": "mike@example.com",
      "posts": [
        {
          "title": "Learning Java",
          "comments": [
            {
              "text": "Great article!"
            }
          ]
        }
      ]
    }
  }
}
```

The client asks for **exactly the fields it needs**.

---

# 2. REST vs GraphQL

This is the most important comparison.

| REST                              | GraphQL                                |
| --------------------------------- | -------------------------------------- |
| Resource-oriented                 | Data/query-oriented                    |
| Multiple endpoints                | Usually one endpoint                   |
| Server defines response structure | Client specifies response fields       |
| URL identifies resource           | Query identifies requested data        |
| HTTP methods are important        | GraphQL operations are important       |
| Can suffer from over-fetching     | Designed to reduce over-fetching       |
| Can suffer from under-fetching    | Can retrieve related data in one query |
| Multiple API versions are common  | Schema evolution is often preferred    |
| Simple HTTP model                 | More specialized API model             |

For example, REST:

```http
GET /api/users/123
```

might return:

```json
{
  "id": 123,
  "name": "Mike",
  "email": "mike@example.com",
  "address": "...",
  "phone": "...",
  "createdAt": "...",
  "profileImage": "..."
}
```

But the frontend might only need:

```text
name
email
```

This is **over-fetching**.

GraphQL allows:

```graphql
query {
    user(id: 123) {
        name
        email
    }
}
```

so the server returns only those fields.

---

# 3. GraphQL is not a database

This distinction is very important.

GraphQL is an **API technology**, not a database.

You might have:

```text
Frontend
    ↓
GraphQL API
    ↓
Service layer
    ↓
Database
```

The database could be:

```text
PostgreSQL
MySQL
Oracle
MongoDB
Redis
```

GraphQL doesn't replace these databases.

Similarly:

```text
GraphQL ≠ PostgreSQL
GraphQL ≠ REST
GraphQL ≠ HTTP
```

GraphQL normally operates **over HTTP**, although it isn't fundamentally limited to HTTP.

---

# 4. The GraphQL mental model

The name "GraphQL" comes from its **graph-oriented data model**.

Imagine:

```text
User
 │
 ├── posts
 │      │
 │      ├── comments
 │      │
 │      └── author
 │
 └── friends
        │
        └── posts
```

GraphQL allows the client to navigate this graph.

For example:

```graphql
query {
    user(id: 1) {
        name

        friends {
            name
        }

        posts {
            title

            comments {
                text
            }
        }
    }
}
```

This is one of GraphQL's fundamental ideas:

> **The API is modeled as a graph of typed objects and relationships.**

---

# 5. GraphQL Schema

A GraphQL API is strongly typed.

The server defines a **schema**.

For example:

```graphql
type User {
    id: ID!
    name: String!
    email: String!
    age: Int
}
```

This means:

```text
User
 ├── id      → ID
 ├── name    → String
 ├── email   → String
 └── age     → Int
```

The `!` means **non-null**.

Therefore:

```graphql
name: String!
```

means:

> `name` must have a String value; it cannot be null.

---

# 6. Basic GraphQL types

GraphQL has several built-in scalar types:

```graphql
Int
Float
String
Boolean
ID
```

For example:

```graphql
type Product {
    id: ID!
    name: String!
    price: Float!
    stock: Int!
    available: Boolean!
}
```

GraphQL also supports:

### Lists

```graphql
products: [Product]
```

meaning:

```text
Product[]
```

Conceptually.

### Non-null lists

```graphql
products: [Product!]!
```

This is more restrictive:

```text
products cannot be null
each Product cannot be null
```

---

# 7. Query

A **query** reads data.

Example:

```graphql
query {
    user(id: 1) {
        id
        name
        email
    }
}
```

Think:

```text
GraphQL Query
      ↓
     READ
```

Similar to:

```http
GET
```

in REST.

---

# 8. Mutation

A **mutation** changes data.

For example:

```graphql
mutation {
    createUser(
        name: "Mike"
        email: "mike@example.com"
    ) {
        id
        name
        email
    }
}
```

Conceptually:

```text
Mutation
   ↓
CREATE
UPDATE
DELETE
```

Similar to REST:

```text
POST
PUT
PATCH
DELETE
```

---

# 9. Variables

Instead of putting values directly into a query:

```graphql
query {
    user(id: 123) {
        name
    }
}
```

you can use variables:

```graphql
query GetUser($id: ID!) {
    user(id: $id) {
        name
        email
    }
}
```

Variables:

```json
{
    "id": "123"
}
```

This is much better for real applications.

---

# 10. Arguments

GraphQL fields can accept arguments.

For example:

```graphql
query {
    users(limit: 10) {
        id
        name
    }
}
```

Or:

```graphql
query {
    user(id: 123) {
        name
    }
}
```

The schema might define:

```graphql
type Query {
    user(id: ID!): User
    users(limit: Int): [User!]!
}
```

---

# 11. Resolver

Here is where GraphQL becomes particularly interesting for a backend developer.

A **resolver** is the server-side code responsible for obtaining the value of a GraphQL field.

For example:

```graphql
type Query {
    user(id: ID!): User
}
```

might have a resolver conceptually like:

```java
User user(Long id) {
    return userService.findById(id);
}
```

The flow becomes:

```text
Client
  │
  │ GraphQL query
  ↓
GraphQL Engine
  │
  ↓
Resolver
  │
  ↓
Service
  │
  ↓
Repository
  │
  ↓
Database
```

This fits very naturally into a Spring Boot backend.

---

# 12. Nested queries

One of GraphQL's most powerful features is nested data.

Suppose:

```graphql
type User {
    id: ID!
    name: String!
    posts: [Post!]!
}

type Post {
    id: ID!
    title: String!
}
```

The client can request:

```graphql
query {
    user(id: 1) {
        name
        posts {
            title
        }
    }
}
```

The server can resolve:

```text
User
 └── posts
      ├── Post
      ├── Post
      └── Post
```

This is much closer to the application's **object/data relationships** than traditional endpoint-oriented APIs.

---

# 13. Fragment

GraphQL also has **fragments**.

Suppose you repeatedly need:

```graphql
id
name
email
```

You can define:

```graphql
fragment UserInfo on User {
    id
    name
    email
}
```

Then:

```graphql
query {
    user(id: 1) {
        ...UserInfo
    }
}
```

Fragments are particularly useful in large frontend applications.

---

# 14. Aliases

GraphQL allows aliases.

For example:

```graphql
query {
    firstUser: user(id: 1) {
        name
    }

    secondUser: user(id: 2) {
        name
    }
}
```

The result can be:

```json
{
  "data": {
    "firstUser": {
      "name": "Alice"
    },
    "secondUser": {
      "name": "Bob"
    }
  }
}
```

---

# 15. Introspection

Another important GraphQL feature is **introspection**.

A GraphQL server knows its schema, and clients/tools can query that schema.

Conceptually:

```text
"What types does this API have?"

"What fields does User have?"

"What arguments does this field accept?"
```

This allows development tools to automatically provide:

* autocomplete
* documentation
* schema exploration
* query validation

This is one reason GraphQL developer tools can feel very powerful.

---

# 16. GraphQL endpoint

A typical GraphQL server might expose:

```text
POST /graphql
```

Instead of REST:

```text
GET    /users/1
GET    /users/1/posts
POST   /users
PUT    /users/1
DELETE /users/1
```

you might have:

```text
POST /graphql
```

with different GraphQL operations inside the request.

For example:

```graphql
query {
    user(id: 1) {
        name
    }
}
```

and:

```graphql
mutation {
    createUser(...) {
        id
        name
    }
}
```

Both can go through:

```text
POST /graphql
```

---

# 17. GraphQL does NOT mean "one database query"

This is an important misconception.

You might write:

```graphql
query {
    user(id: 1) {
        name
        posts {
            title
        }
    }
}
```

But internally the server could execute:

```text
User query
    ↓
SELECT ... FROM users

Posts query
    ↓
SELECT ... FROM posts
```

or perhaps a single optimized database query.

GraphQL describes **what data the client wants**.

It does not dictate how the server obtains that data.

---

# 18. The N+1 problem

GraphQL introduces an important backend performance problem: **N+1 queries**.

Suppose you request:

```graphql
users {
    name
    posts {
        title
    }
}
```

There are 100 users.

A badly implemented server might do:

```text
1 query → get 100 users

100 queries → get posts for each user

Total = 101 queries
```

This is the famous:

```text
N + 1 problem
```

GraphQL applications commonly use techniques such as **DataLoader/batching** to solve or reduce this problem.

This is something you should understand when learning GraphQL as a backend developer.

---

# 19. GraphQL advantages

### ① Avoid over-fetching

Client asks:

```graphql
user {
    name
}
```

instead of receiving a huge User object.

### ② Avoid under-fetching

You can request:

```graphql
user {
    name
    posts {
        title
    }
}
```

in one logical query.

### ③ Strongly typed

The schema explicitly describes:

```text
types
fields
arguments
relationships
```

### ④ Excellent developer tooling

Because the schema is machine-readable, tools can provide:

```text
autocomplete
validation
documentation
schema exploration
```

### ⑤ Good for complex frontend applications

Especially when different clients need different data:

```text
Web
Mobile
Tablet
Smart TV
```

The same GraphQL API can serve different data requirements.

---

# 20. GraphQL disadvantages

GraphQL isn't automatically better than REST.

### ① More complicated server

You need:

```text
schema
resolvers
validation
query execution
authorization
caching
performance optimization
```

### ② Caching is more complicated

REST naturally works well with HTTP caching:

```http
GET /users/123
```

GraphQL commonly uses:

```http
POST /graphql
```

with many different queries.

Therefore traditional HTTP caching isn't as straightforward.

### ③ Query complexity

A client can potentially request:

```text
User
 └── friends
      └── friends
           └── friends
                └── ...
```

Servers therefore often need:

* query depth limits
* complexity limits
* pagination
* timeouts
* authorization

### ④ N+1 problem

As mentioned above.

### ⑤ File uploads and HTTP semantics can be less straightforward

REST's HTTP semantics can be simpler for certain APIs.

---

# 21. GraphQL vs REST: a practical example

Imagine an e-commerce application.

REST:

```text
GET /products/123
GET /products/123/reviews
GET /products/123/category
GET /products/123/recommendations
```

GraphQL:

```graphql
query {
    product(id: 123) {
        name
        price

        category {
            name
        }

        reviews {
            rating
            text
        }

        recommendations {
            name
            price
        }
    }
}
```

The frontend describes its data requirement directly.

---

# 22. GraphQL and Spring Boot

Since you're learning **Java backend development**, GraphQL is worth learning **after you understand REST and Spring Boot fundamentals**.

A typical Java stack could look like:

```text
                    ┌── Web / Mobile
                    │
                    ↓
              GraphQL API
                    │
                    ↓
             Spring Boot
                    │
          ┌─────────┴─────────┐
          ↓                   ↓
      Service             Resolver
          │                   │
          └─────────┬─────────┘
                    ↓
                Repository
                    ↓
                Database
```

Spring for GraphQL is the modern Spring project for building GraphQL applications.

So for your Java backend learning path, I would put it roughly here:

```text
Java Foundation
      ↓
HTTP / Web fundamentals
      ↓
Servlet / Tomcat concepts
      ↓
Spring Framework
      ↓
Spring Boot
      ↓
REST API
      ↓
Database + JPA/Hibernate
      ↓
Security / JWT
      ↓
Testing
      ↓
Microservices
      ↓
GraphQL
      ↓
Message Queue / RPC / distributed systems
```

---

# 23. GraphQL in the larger API landscape

You have recently been looking at **RPC, REST, message queues, JWT, and now GraphQL**. These technologies solve different problems:

```text
                    Backend Communication
                           │
          ┌────────────────┼────────────────┐
          ↓                ↓                ↓
        REST           GraphQL             RPC
          │                │                │
     Resource API      Query API        Service API
          │                │                │
          └────────────────┴────────────────┘
                           │
                           ↓
                    Synchronous APIs


                Asynchronous communication
                           │
                           ↓
                    Message Queue
```

A useful mental model is:

| Technology        | Main idea                                        |
| ----------------- | ------------------------------------------------ |
| **REST**          | "Give me this resource"                          |
| **GraphQL**       | "Give me exactly this data graph"                |
| **RPC**           | "Execute this operation on another service"      |
| **Message Queue** | "Deliver this message asynchronously"            |
| **JWT**           | "Carry authentication/authorization information" |

So **GraphQL is primarily an API/query technology**, while JWT is an authentication mechanism and message queues are an asynchronous communication mechanism.

### The key idea to remember

If you remember only one sentence:

> **REST organizes APIs around resources and endpoints; GraphQL organizes APIs around a typed data graph and lets the client specify the exact shape of the response.**

For your Java backend path, I recommend learning **REST before GraphQL**. REST gives you a much stronger understanding of HTTP, resources, status codes, request/response, authentication, and API design; GraphQL then becomes much easier to understand.
