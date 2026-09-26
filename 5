# MongoDB Introduction

MongoDB is a popular **NoSQL database** designed to store data as flexible, JSON-like **documents** rather than rows and columns like a traditional relational database.

If you are learning **Java backend development**, MongoDB is worth learning because it is commonly used alongside Spring Boot.

---

## 1. The basic idea

A relational database such as MySQL looks like:

```text
Student table

+----+--------+-----+------------------+
| id | name   | age | email            |
+----+--------+-----+------------------+
| 1  | Alice  | 20  | alice@gmail.com  |
| 2  | Bob    | 21  | bob@gmail.com    |
+----+--------+-----+------------------+
```

MongoDB instead stores documents:

```json
{
    "_id": 1,
    "name": "Alice",
    "age": 20,
    "email": "alice@gmail.com"
}
```

Another document could be:

```json
{
    "_id": 2,
    "name": "Bob",
    "age": 21,
    "email": "bob@gmail.com",
    "phone": "123456789"
}
```

Notice that Bob can have a `phone` field even if Alice doesn't.

This is one of MongoDB's important characteristics:

> **MongoDB stores flexible documents rather than fixed rows.**

---

# 2. MongoDB vs MySQL

The terminology is different:

| Relational DB | MongoDB                                   |
| ------------- | ----------------------------------------- |
| Database      | Database                                  |
| Table         | Collection                                |
| Row           | Document                                  |
| Column        | Field                                     |
| Primary key   | `_id`                                     |
| SQL           | MongoDB query language                    |
| JOIN          | `$lookup` / embedding / application logic |
| Schema        | Flexible document structure               |

Conceptually:

```text
MySQL

Database
  └── Table
       ├── Row
       ├── Row
       └── Row


MongoDB

Database
  └── Collection
       ├── Document
       ├── Document
       └── Document
```

---

# 3. What is a document?

A MongoDB document looks similar to JSON:

```json
{
    "name": "Alice",
    "age": 20,
    "major": "Computer Science"
}
```

Internally, MongoDB stores documents using **BSON**.

BSON means:

> **Binary JSON**

It extends JSON with additional types such as:

* `ObjectId`
* Date
* Binary data
* Decimal
* 32-bit / 64-bit integers

For example:

```json
{
    "_id": ObjectId("..."),
    "name": "Alice",
    "age": 20,
    "createdAt": ISODate("...")
}
```

---

# 4. Collections

A MongoDB **collection** is roughly analogous to a SQL table.

For example:

```text
school
 ├── students
 ├── courses
 └── teachers
```

The `students` collection might contain:

```json
{
    "_id": 1,
    "name": "Alice",
    "age": 20
}
```

```json
{
    "_id": 2,
    "name": "Bob",
    "age": 21
}
```

Unlike a traditional SQL table, documents in one collection don't necessarily have exactly the same structure.

---

# 5. `_id`

Every MongoDB document normally has an `_id` field.

Example:

```json
{
    "_id": ObjectId("68d65..."),
    "name": "Alice",
    "age": 20
}
```

MongoDB automatically generates an `ObjectId` if you don't provide one.

You can think of `_id` as playing a role similar to:

```sql
PRIMARY KEY
```

in MySQL.

---

# 6. CRUD

One of the easiest ways to understand MongoDB is through CRUD:

```text
Create
Read
Update
Delete
```

### Create

```javascript
db.students.insertOne({
    name: "Alice",
    age: 20,
    major: "Computer Science"
});
```

### Read

```javascript
db.students.find();
```

Find students whose age is 20:

```javascript
db.students.find({
    age: 20
});
```

### Update

```javascript
db.students.updateOne(
    { name: "Alice" },
    { $set: { age: 21 } }
);
```

### Delete

```javascript
db.students.deleteOne({
    name: "Alice"
});
```

So you can think:

```text
insertOne()  → INSERT
find()       → SELECT
updateOne()  → UPDATE
deleteOne()  → DELETE
```

---

# 7. Nested documents

This is one of MongoDB's particularly useful features.

You can put objects inside documents:

```json
{
    "name": "Alice",
    "age": 20,

    "address": {
        "city": "Los Angeles",
        "state": "California",
        "zip": "90001"
    }
}
```

In a relational database, you might instead have:

```text
students
addresses
```

and connect them with foreign keys.

MongoDB allows you to represent the data naturally as a nested document.

---

# 8. Arrays

Documents can also contain arrays:

```json
{
    "name": "Alice",
    "courses": [
        "Java",
        "Database",
        "Computer Networks"
    ]
}
```

You can even have an array of objects:

```json
{
    "name": "Alice",
    "courses": [
        {
            "name": "Java",
            "score": 95
        },
        {
            "name": "Database",
            "score": 88
        }
    ]
}
```

This is extremely convenient for certain types of application data.

---

# 9. Schema flexibility

Suppose you have:

```json
{
    "name": "Alice",
    "age": 20
}
```

and:

```json
{
    "name": "Bob",
    "age": 21,
    "phone": "123456789"
}
```

Both can exist in the same collection.

This is called **schema flexibility**.

However, an important misconception is:

> MongoDB doesn't mean "no schema."

It is better to think:

> **MongoDB gives you more flexible schema design.**

Your application still needs to decide what documents should look like.

MongoDB also supports mechanisms for schema validation when you need stronger constraints.

---

# 10. MongoDB and relationships

Relational databases are very good at relationships:

```text
Student
   |
   | student_id
   ↓
Course
```

MongoDB gives you several approaches.

### Embedding

Put related data inside the document:

```json
{
    "name": "Alice",
    "courses": [
        "Java",
        "Database",
        "Spring Boot"
    ]
}
```

### Referencing

Store another document's ID:

```json
{
    "_id": 100,
    "name": "Alice",
    "courseIds": [1, 2, 3]
}
```

MongoDB also has `$lookup`, which provides functionality similar to a join in some cases.

---

# 11. Indexes

MongoDB uses **indexes** to make queries faster.

Suppose you frequently search:

```javascript
db.students.find({
    email: "alice@gmail.com"
});
```

You can create an index:

```javascript
db.students.createIndex({
    email: 1
});
```

Then MongoDB can use the index rather than scanning every document.

Conceptually:

```text
Without index:

Document 1 ── check
Document 2 ── check
Document 3 ── check
...
Document 1,000,000 ── check


With index:

Index
  ↓
matching document
```

Indexes are extremely important for backend developers.

---

# 12. MongoDB architecture

A simplified picture is:

```text
Application
     |
     | MongoDB Driver
     ↓
MongoDB Server
     |
     +── Database
           |
           +── Collection
                 |
                 +── Document
                 +── Document
                 +── Document
```

For Java:

```text
Spring Boot
     |
     ↓
MongoDB Java Driver
     |
     ↓
MongoDB
```

---

# 13. MongoDB in Java/Spring Boot

For a Java backend developer, MongoDB becomes especially interesting with **Spring Data MongoDB**.

Instead of writing MongoDB operations everywhere, you can create a repository.

For example:

```java
@Document("students")
public class Student {

    @Id
    private String id;

    private String name;
    private int age;
    private String major;

    // constructors, getters, setters
}
```

Then:

```java
public interface StudentRepository
        extends MongoRepository<Student, String> {
}
```

Now you can write:

```java
studentRepository.findAll();
```

```java
studentRepository.findById(id);
```

```java
studentRepository.save(student);
```

```java
studentRepository.deleteById(id);
```

Spring Data handles much of the MongoDB interaction for you.

---

# 14. MongoDB vs MySQL

A useful conceptual comparison is:

|                  | MySQL                      | MongoDB                                    |
| ---------------- | -------------------------- | ------------------------------------------ |
| Type             | Relational                 | Document-oriented NoSQL                    |
| Data model       | Tables/rows                | Documents/collections                      |
| Query            | SQL                        | MongoDB query API                          |
| Schema           | Traditionally rigid        | Flexible                                   |
| Relationships    | Strong relational model    | Embedding/references                       |
| JOIN             | Core feature               | `$lookup`, but different design philosophy |
| Transactions     | Yes                        | Yes                                        |
| JSON-like data   | Supported                  | Native document model                      |
| Typical strength | Structured relational data | Flexible/document-oriented data            |

Don't think:

```text
MongoDB = modern MySQL
```

They are based on different data-modeling philosophies.

---

# 15. When is MongoDB useful?

MongoDB is often useful when:

* data has a naturally document-shaped structure
* the structure changes frequently
* you need to store nested objects and arrays
* you need to scale horizontally
* rapid application development is important
* relational joins aren't central to the application's data model

Examples include:

```text
Content management
Product catalogs
User profiles
Event data
IoT data
Real-time applications
Mobile/web applications
```

But if your application has highly interconnected data and depends heavily on complex relational queries, a relational database such as PostgreSQL or MySQL may fit the data model better.

---

# 16. MongoDB's place in your Java backend roadmap

Since you're learning Java backend, I would put databases roughly here:

```text
Java Foundation
      ↓
SQL fundamentals
      ↓
MySQL / PostgreSQL
      ↓
JDBC
      ↓
JPA / Hibernate
      ↓
Spring Data JPA
      ↓
MongoDB
      ↓
Spring Data MongoDB
```

I recommend learning **SQL + a relational database before MongoDB**.

The reason isn't that MongoDB is less important. Relational databases teach you fundamental database concepts:

```text
tables
primary keys
foreign keys
normalization
transactions
indexes
joins
constraints
SQL
```

Then MongoDB becomes much easier to understand because you can ask:

> **What problem is MongoDB solving differently from a relational database?**

---

## 17. The most important MongoDB concepts to learn

For a Java backend beginner, I'd learn MongoDB in this order:

```text
1. NoSQL concepts
       ↓
2. Database / Collection / Document
       ↓
3. BSON / ObjectId
       ↓
4. CRUD
       ↓
5. Query operators
       ↓
6. Update operators
       ↓
7. Arrays and embedded documents
       ↓
8. Data modeling
       ↓
9. Indexes
       ↓
10. Aggregation
       ↓
11. Transactions
       ↓
12. Replication
       ↓
13. Sharding
       ↓
14. MongoDB Java Driver
       ↓
15. Spring Data MongoDB
```

The key idea to remember is:

> **MySQL models data primarily as related tables; MongoDB models data primarily as documents.**

For your Java backend learning, MongoDB should come **after you understand SQL and one relational database**, then you can learn how Spring Boot works with both relational and document databases.
