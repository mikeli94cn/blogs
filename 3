# PostgreSQL Database Introduction

PostgreSQL (usually called **Postgres**) is a powerful, open-source **relational database management system (RDBMS)**.

If you're learning **Java backend development**, PostgreSQL is one of the databases worth learning because it is commonly used with Java, Spring, and Spring Boot applications.

---

## 1. What is PostgreSQL?

At the simplest level:

> **PostgreSQL is software that stores, organizes, queries, and manages structured data.**

For example, imagine a student management application.

You might have a `student` table:

| id | name    | age | major            |
| -: | ------- | --: | ---------------- |
|  1 | Alice   |  20 | Computer Science |
|  2 | Bob     |  21 | Mathematics      |
|  3 | Charlie |  19 | Physics          |

PostgreSQL stores this data on disk and provides SQL commands for working with it.

For example:

```sql
SELECT * FROM student;
```

or:

```sql
INSERT INTO student (name, age, major)
VALUES ('David', 22, 'Computer Science');
```

---

# 2. Where PostgreSQL fits

A typical Java backend looks roughly like this:

```text
┌──────────────────────┐
│      Frontend        │
│ HTML / CSS / JS      │
└──────────┬───────────┘
           │ HTTP
           ▼
┌──────────────────────┐
│    Java Backend      │
│                      │
│ Spring Boot          │
│ Spring MVC            │
│ Service              │
│ Repository           │
└──────────┬───────────┘
           │ SQL / JDBC
           ▼
┌──────────────────────┐
│      PostgreSQL      │
│                      │
│ Tables               │
│ Indexes              │
│ Transactions         │
│ Constraints          │
└──────────────────────┘
```

So PostgreSQL is **not a replacement for Spring**.

They solve different problems:

| Technology    | Main responsibility                       |
| ------------- | ----------------------------------------- |
| Java          | Programming language                      |
| Spring        | Application framework                     |
| Spring Boot   | Simplifies Spring application development |
| Tomcat        | Web/Servlet runtime                       |
| JDBC          | Java ↔ database interface                 |
| JPA/Hibernate | Object ↔ relational mapping               |
| MyBatis       | SQL mapping framework                     |
| PostgreSQL    | Database                                  |

This distinction is important for your Java backend learning.

---

# 3. PostgreSQL is a relational database

The fundamental model is the **relational model**.

Data is organized into:

```text
Database
   │
   ├── Tables
   │     ├── Rows
   │     └── Columns
   │
   ├── Indexes
   ├── Constraints
   ├── Views
   └── Functions
```

For example:

```text
school
│
├── student
├── teacher
├── course
└── enrollment
```

A table consists of rows and columns.

```text
student

id    name       age
---------------------
1     Alice      20
2     Bob        21
3     Charlie    19
```

A row represents an entity/record.

A column represents an attribute.

---

# 4. SQL

PostgreSQL uses **SQL — Structured Query Language**.

The basic SQL operations are often summarized as **CRUD**.

### Create

```sql
INSERT INTO student (name, age)
VALUES ('Alice', 20);
```

### Read

```sql
SELECT * FROM student;
```

### Update

```sql
UPDATE student
SET age = 21
WHERE id = 1;
```

### Delete

```sql
DELETE FROM student
WHERE id = 1;
```

These four operations are fundamental to almost every backend application.

---

# 5. PostgreSQL vs MySQL vs Oracle

You recently asked about MySQL and Oracle, so it is useful to put them together.

|                    | PostgreSQL            | MySQL                       | Oracle               |
| ------------------ | --------------------- | --------------------------- | -------------------- |
| Type               | RDBMS                 | RDBMS                       | RDBMS                |
| SQL                | Yes                   | Yes                         | Yes                  |
| Open source        | Yes                   | Community edition           | No                   |
| Typical strength   | Advanced SQL/features | Web applications            | Enterprise systems   |
| Java support       | Excellent             | Excellent                   | Excellent            |
| Spring Boot        | Excellent             | Excellent                   | Excellent            |
| Cost               | Free                  | Free/community + commercial | Commercial           |
| Common in learning | Very common           | Very common                 | Common in enterprise |

They all implement the relational database model and SQL, but they have different features, syntax details, tooling, and ecosystems.

---

# 6. PostgreSQL architecture

A useful mental model is:

```text
PostgreSQL Server
│
├── Database
│    │
│    ├── Schema
│    │    │
│    │    ├── Table
│    │    │    ├── Rows
│    │    │    └── Columns
│    │    │
│    │    ├── Index
│    │    ├── View
│    │    └── Function
│    │
│    └── ...
│
└── Database
```

There are several concepts here that beginners should distinguish.

### Server

The PostgreSQL server process manages databases and handles client connections.

### Database

A database contains schemas and database objects.

### Schema

A schema is a namespace/container for objects such as tables.

A common default schema is:

```text
public
```

### Table

Stores structured data.

```sql
CREATE TABLE student (
    id BIGINT,
    name VARCHAR(100),
    age INTEGER
);
```

---

# 7. PostgreSQL data types

PostgreSQL provides many data types.

For example:

```sql
CREATE TABLE student (
    id BIGINT,
    name VARCHAR(100),
    age INTEGER,
    score DECIMAL(5, 2),
    active BOOLEAN,
    birthday DATE
);
```

Some important types:

```text
INTEGER
BIGINT
DECIMAL
NUMERIC
REAL
DOUBLE PRECISION

VARCHAR
TEXT
CHAR

BOOLEAN

DATE
TIME
TIMESTAMP
TIMESTAMPTZ

UUID

JSON
JSONB

ARRAY
```

One particularly interesting PostgreSQL feature is **JSONB**.

For example:

```sql
CREATE TABLE product (
    id BIGINT,
    name TEXT,
    attributes JSONB
);
```

You can store structured JSON data while still using PostgreSQL's database features.

---

# 8. Primary keys

A table normally needs a way to uniquely identify each row.

That's the **primary key**.

```sql
CREATE TABLE student (
    id BIGINT PRIMARY KEY,
    name VARCHAR(100),
    age INTEGER
);
```

Then:

```text
id    name
------------
1     Alice
2     Bob
3     Charlie
```

The `id` uniquely identifies each student.

In PostgreSQL you can also use an automatically generated identity column:

```sql
CREATE TABLE student (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100),
    age INTEGER
);
```

Then:

```sql
INSERT INTO student (name, age)
VALUES ('Alice', 20);
```

PostgreSQL generates the ID.

---

# 9. Foreign keys

Relational databases become especially useful when tables are related.

For example:

```text
student
---------
id
name

course
---------
id
name

enrollment
---------
student_id
course_id
```

A foreign key establishes a relationship.

```sql
CREATE TABLE enrollment (
    student_id BIGINT,
    course_id BIGINT,

    FOREIGN KEY (student_id)
        REFERENCES student(id),

    FOREIGN KEY (course_id)
        REFERENCES course(id)
);
```

This allows PostgreSQL to enforce **referential integrity**.

---

# 10. Constraints

A database can enforce rules about your data.

For example:

```sql
CREATE TABLE student (
    id BIGINT PRIMARY KEY,

    name VARCHAR(100) NOT NULL,

    age INTEGER CHECK (age >= 0),

    email VARCHAR(255) UNIQUE
);
```

Here:

```text
PRIMARY KEY
NOT NULL
CHECK
UNIQUE
FOREIGN KEY
```

are important constraints.

This is an important principle:

> **The database should help protect the integrity of your data.**

Don't rely entirely on Java code to enforce every rule.

---

# 11. Indexes

Suppose you have:

```text
student
10 million rows
```

and frequently execute:

```sql
SELECT *
FROM student
WHERE email = 'alice@example.com';
```

Searching every row can be expensive.

An index can make the lookup much faster:

```sql
CREATE INDEX idx_student_email
ON student(email);
```

Conceptually:

```text
Without index:

10,000,000 rows
       ↓
search one by one


With index:

        index
          ↓
      matching row
```

But indexes aren't free.

They consume storage and make inserts/updates somewhat more expensive.

Therefore:

> **Indexes are a performance optimization, not something you put on every column automatically.**

---

# 12. Transactions

Transactions are one of the most important database concepts for backend developers.

Imagine transferring money:

```text
Account A: $1000
Account B: $500
```

Transfer $200:

```text
A = A - 200
B = B + 200
```

You don't want this:

```text
A = $800
B = $500
```

because only half of the operation succeeded.

You want:

```text
A = $800
B = $700
```

or the entire operation should fail.

SQL:

```sql
BEGIN;

UPDATE account
SET balance = balance - 200
WHERE id = 1;

UPDATE account
SET balance = balance + 200
WHERE id = 2;

COMMIT;
```

If something goes wrong:

```sql
ROLLBACK;
```

Transactions provide the foundation for reliable database operations.

---

# 13. ACID

Relational databases are strongly associated with **ACID transactions**.

```text
A = Atomicity
C = Consistency
I = Isolation
D = Durability
```

### Atomicity

A transaction happens completely or not at all.

### Consistency

The database moves from one valid state to another valid state.

### Isolation

Concurrent transactions should not improperly interfere with each other.

### Durability

After a successful commit, the data should survive failures according to the database's durability guarantees.

You should definitely learn ACID when studying backend development.

---

# 14. PostgreSQL and Java

For your Java backend path, the relationship is approximately:

```text
Java application
       │
       ▼
Spring Boot
       │
       ▼
Spring Data JPA / Hibernate
       │
       ▼
JDBC
       │
       ▼
PostgreSQL
```

There is also another common architecture:

```text
Java
 │
Spring Boot
 │
MyBatis
 │
JDBC
 │
PostgreSQL
```

So PostgreSQL doesn't care whether your Java application uses Hibernate or MyBatis.

It receives database requests, typically expressed through SQL.

---

# 15. JDBC

At the lower level, Java communicates with PostgreSQL through **JDBC**.

Conceptually:

```java
Connection connection =
    DriverManager.getConnection(
        "jdbc:postgresql://localhost:5432/school",
        "postgres",
        "password"
    );
```

Then Java can execute SQL:

```java
PreparedStatement statement =
    connection.prepareStatement(
        "SELECT * FROM student"
    );
```

JDBC is the fundamental Java database API.

You don't necessarily write raw JDBC in a modern Spring Boot application, but understanding it helps you understand what's underneath Spring Data and MyBatis.

---

# 16. PostgreSQL + Spring Boot

A modern Java backend might contain:

```text
student-management/
│
├── src/main/java/
│   └── com/example/student/
│       ├── Student.java
│       ├── StudentRepository.java
│       ├── StudentService.java
│       └── StudentController.java
│
└── src/main/resources/
    └── application.properties
```

Configuration might look like:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/school
spring.datasource.username=postgres
spring.datasource.password=password
```

Then Spring Boot can manage the database connection infrastructure.

With Spring Data JPA, you might have:

```java
@Entity
public class Student {

    @Id
    @GeneratedValue
    private Long id;

    private String name;

    private Integer age;
}
```

And:

```java
public interface StudentRepository
        extends JpaRepository<Student, Long> {
}
```

You can then perform operations such as:

```java
studentRepository.findAll();
```

or:

```java
studentRepository.findById(1L);
```

Underneath, Hibernate/JPA ultimately communicates with PostgreSQL through JDBC.

---

# 17. PostgreSQL's important features

PostgreSQL is more than just basic tables and SQL.

Some important capabilities include:

### Relational data

```text
tables
rows
columns
relationships
```

### Advanced SQL

It supports sophisticated queries, joins, aggregation, window functions, CTEs, etc.

### Transactions

```sql
BEGIN;
COMMIT;
ROLLBACK;
```

### MVCC

PostgreSQL uses **Multi-Version Concurrency Control (MVCC)** to handle concurrent transactions efficiently.

This is an important concept once you study database internals.

### Indexes

Various index types are available, including:

```text
B-tree
Hash
GiST
SP-GiST
GIN
BRIN
```

### JSON/JSONB

Useful when applications need semi-structured data.

### Full-text search

PostgreSQL provides built-in text-search capabilities.

### Extensions

PostgreSQL has a powerful extension ecosystem.

For example, **PostGIS** adds sophisticated geospatial capabilities.

---

# 18. PostgreSQL command-line tools

After installing PostgreSQL, one important tool is:

```bash
psql
```

For example:

```bash
psql -U postgres
```

Inside `psql`:

```sql
\l
```

lists databases.

```sql
\c school
```

connects to a database.

```sql
\dt
```

lists tables.

```sql
\d student
```

shows the structure of a table.

And:

```sql
SELECT * FROM student;
```

executes SQL.

A useful distinction:

```text
psql commands
    ↓
\l
\dt
\d

SQL commands
    ↓
SELECT
INSERT
UPDATE
DELETE
CREATE TABLE
```

---

# 19. What should you learn?

Since your goal is **Java backend development**, I would learn PostgreSQL in this order:

```text
Phase 1 — Database fundamentals
        ↓
tables
rows
columns
primary keys
foreign keys
constraints
        ↓
Phase 2 — SQL
        ↓
SELECT
WHERE
ORDER BY
GROUP BY
HAVING
JOIN
INSERT
UPDATE
DELETE
        ↓
Phase 3 — Database design
        ↓
relationships
normalization
ER diagrams
constraints
        ↓
Phase 4 — Database performance
        ↓
indexes
EXPLAIN
query optimization
        ↓
Phase 5 — Transactions
        ↓
ACID
isolation
concurrency
MVCC
        ↓
Phase 6 — Java integration
        ↓
JDBC
        ↓
Spring JDBC
        ↓
MyBatis
        ↓
JPA / Hibernate
        ↓
Spring Data JPA
        ↓
Spring Boot + PostgreSQL
```

### For your current Java learning stage

I would **not** start with PostgreSQL internals.

Start by becoming comfortable with:

```text
Database
  ↓
Table
  ↓
Row / Column
  ↓
Primary Key
  ↓
Foreign Key
  ↓
CRUD
  ↓
SQL
  ↓
JOIN
  ↓
Index
  ↓
Transaction
```

Then connect it to Java:

```text
Java
  ↓
JDBC
  ↓
PostgreSQL
```

and eventually:

```text
Spring Boot
     ↓
Spring Data JPA
     ↓
Hibernate
     ↓
JDBC
     ↓
PostgreSQL
```

That gives you a much clearer picture of **where PostgreSQL fits into the Java backend ecosystem**.
