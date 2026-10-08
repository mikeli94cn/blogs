# SQL Introduction

SQL stands for **Structured Query Language**. It is the standard language used to **store, retrieve, modify, and manage structured data in relational databases**.

If we put SQL alongside the technologies you've been studying:

```text
Java / Python / C#
        │
        │ application code
        ▼
      SQL
        │
        ▼
   Relational Database
        │
   ┌────┼────────┐
   ▼    ▼        ▼
 MySQL PostgreSQL Oracle
```

The most important idea is:

> **SQL is a language for communicating with relational databases.**

---

# 1. Why SQL exists

Suppose you are building a Student Management System.

You might have thousands or millions of students:

```text
id    name       age    major
--------------------------------
1     Alice      20     CS
2     Bob        21     Math
3     Charlie    19     CS
...
```

You need to perform operations such as:

```text
Find Alice
Add a student
Change Bob's major
Delete a student
Find all CS students
Calculate average age
Find students with scores > 90
```

Instead of writing your own file-management system, you use a database.

SQL lets you express these operations declaratively.

For example:

```sql
SELECT *
FROM students
WHERE major = 'CS';
```

You are essentially saying:

> "Give me all students whose major is CS."

You don't have to tell the database exactly how to scan the disk, use indexes, or execute the query.

---

# 2. What is a relational database?

SQL is primarily associated with the **relational database model**.

The basic structure is:

```text
Database
   │
   ├── Table
   │     ├── Row
   │     ├── Row
   │     └── Row
   │
   ├── Table
   │
   └── Table
```

For example:

```text
Student
┌────┬─────────┬─────┬──────────────┐
│ id │ name    │ age │ major        │
├────┼─────────┼─────┼──────────────┤
│ 1  │ Alice   │ 20  │ Computer Sci │
│ 2  │ Bob     │ 21  │ Mathematics  │
│ 3  │ Charlie │ 19  │ Computer Sci │
└────┴─────────┴─────┴──────────────┘
```

A table consists of:

* **columns** → attributes
* **rows** → records
* **cells** → individual values

---

# 3. SQL is not a database

This distinction is important.

**SQL** is a language.

**MySQL, PostgreSQL, Oracle Database, and SQL Server** are database management systems that implement SQL.

Think:

```text
SQL
 │
 ├── MySQL
 ├── PostgreSQL
 ├── Oracle Database
 ├── SQL Server
 ├── SQLite
 └── MariaDB
```

They all support SQL, but each has its own extensions and differences.

This is similar to:

```text
Java language
     │
     ├── OpenJDK
     ├── Oracle JDK
     └── Eclipse Temurin
```

Although the relationship isn't exactly the same.

---

# 4. The four fundamental database operations

A huge part of SQL can be understood through **CRUD**:

```text
C → Create
R → Read
U → Update
D → Delete
```

For example:

```text
Create → INSERT
Read   → SELECT
Update → UPDATE
Delete → DELETE
```

These four operations are fundamental to almost every backend application.

---

# 5. SELECT — read data

Suppose we have:

```text
students
```

You can retrieve everything:

```sql
SELECT *
FROM students;
```

Or specific columns:

```sql
SELECT name, age
FROM students;
```

Result:

```text
name       age
----------------
Alice      20
Bob        21
Charlie    19
```

---

# 6. WHERE — filtering

You can filter records:

```sql
SELECT *
FROM students
WHERE age >= 20;
```

Or:

```sql
SELECT *
FROM students
WHERE major = 'Computer Science';
```

You can combine conditions:

```sql
SELECT *
FROM students
WHERE age >= 20
  AND major = 'Computer Science';
```

Other operators include:

```sql
=
<>
!=
>
<
>=
<=
```

---

# 7. INSERT — add data

Add a student:

```sql
INSERT INTO students (name, age, major)
VALUES ('David', 22, 'Physics');
```

Now the table contains a new row.

You can insert multiple rows:

```sql
INSERT INTO students (name, age, major)
VALUES
    ('David', 22, 'Physics'),
    ('Emma', 20, 'Biology');
```

---

# 8. UPDATE — modify data

Suppose Bob changes his major:

```sql
UPDATE students
SET major = 'Computer Science'
WHERE name = 'Bob';
```

**Be careful with `UPDATE`.**

This is dangerous:

```sql
UPDATE students
SET major = 'Computer Science';
```

because it changes **every row**.

---

# 9. DELETE — remove data

Delete one student:

```sql
DELETE FROM students
WHERE id = 3;
```

Again, this is dangerous:

```sql
DELETE FROM students;
```

because it deletes all rows.

A good SQL developer learns to be extremely careful with:

```text
UPDATE
DELETE
```

and their `WHERE` clauses.

---

# 10. CREATE TABLE

SQL can also define database structures.

For example:

```sql
CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    age INTEGER,
    major VARCHAR(100)
);
```

This creates a table.

Conceptually:

```text
students
│
├── id
├── name
├── age
└── major
```

---

# 11. Data types

SQL databases support various data types.

Common examples:

```text
INTEGER
DECIMAL
VARCHAR
CHAR
TEXT
DATE
TIME
TIMESTAMP
BOOLEAN
```

The exact types differ between database systems.

For example:

```sql
CREATE TABLE products (
    id INTEGER,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    created_at TIMESTAMP
);
```

---

# 12. Primary keys

A **primary key** uniquely identifies a row.

For example:

```sql
CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    age INTEGER
);
```

Then:

```text
id
--
1
2
3
```

Each student has a unique ID.

You can then find a particular student:

```sql
SELECT *
FROM students
WHERE id = 2;
```

A primary key is one of the most fundamental concepts in relational databases.

---

# 13. Foreign keys

Suppose we have:

```text
students
courses
```

A student can enroll in courses.

You might have:

```text
students
┌────┬─────────┐
│ id │ name    │
├────┼─────────┤
│ 1  │ Alice   │
│ 2  │ Bob     │
└────┴─────────┘
```

and:

```text
courses
┌────┬────────────┐
│ id │ name       │
├────┼────────────┤
│ 10 │ Java       │
│ 20 │ Database   │
└────┴────────────┘
```

Then a relationship can be represented by another table:

```text
enrollments
┌────────────┬───────────┐
│ student_id │ course_id │
├────────────┼───────────┤
│ 1          │ 10        │
│ 1          │ 20        │
│ 2          │ 10        │
└────────────┴───────────┘
```

Here:

```text
student_id → students.id
course_id  → courses.id
```

These are **foreign keys**.

---

# 14. Relationships

Relational databases are particularly powerful because tables can be related.

Common relationships are:

```text
1 : 1
1 : N
N : N
```

For example:

### One-to-many

```text
Department
     │
     ├── Student
     ├── Student
     └── Student
```

One department has many students.

### Many-to-many

```text
Student ───── Course
   │             │
   └─────────────┘
```

A student can take many courses, and a course can have many students.

This usually requires a junction table such as `enrollments`.

---

# 15. JOIN — one of the most important SQL concepts

Suppose:

```text
students
```

contains:

```text
id    name
1     Alice
2     Bob
```

and:

```text
enrollments
```

contains:

```text
student_id    course
1             Java
2             Database
```

You can combine them:

```sql
SELECT students.name, enrollments.course
FROM students
JOIN enrollments
    ON students.id = enrollments.student_id;
```

Result:

```text
name       course
-------------------
Alice      Java
Bob        Database
```

This is a **JOIN**.

If you're learning backend development, JOINs are extremely important.

---

# 16. Types of JOIN

The main types are:

```text
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
CROSS JOIN
```

The most important ones to master first are:

```text
INNER JOIN
LEFT JOIN
```

### INNER JOIN

Returns matching records:

```sql
SELECT *
FROM students s
INNER JOIN enrollments e
    ON s.id = e.student_id;
```

### LEFT JOIN

Keeps every record from the left table:

```sql
SELECT *
FROM students s
LEFT JOIN enrollments e
    ON s.id = e.student_id;
```

This is useful when you want students even if they haven't enrolled in anything.

---

# 17. ORDER BY

You can sort results:

```sql
SELECT *
FROM students
ORDER BY age;
```

Descending:

```sql
SELECT *
FROM students
ORDER BY age DESC;
```

Multiple columns:

```sql
SELECT *
FROM students
ORDER BY major, age DESC;
```

---

# 18. GROUP BY

SQL can group data.

Suppose:

```text
students
name      major
Alice     CS
Bob       Math
Charlie   CS
David     CS
```

You can count students per major:

```sql
SELECT major, COUNT(*)
FROM students
GROUP BY major;
```

Result:

```text
major    count
----------------
CS       3
Math     1
```

This is extremely useful for analytics.

---

# 19. Aggregate functions

Common aggregate functions include:

```text
COUNT()
SUM()
AVG()
MIN()
MAX()
```

For example:

```sql
SELECT AVG(age)
FROM students;
```

or:

```sql
SELECT major, COUNT(*)
FROM students
GROUP BY major;
```

---

# 20. HAVING

`WHERE` filters individual rows.

`HAVING` filters groups.

For example:

```sql
SELECT major, COUNT(*)
FROM students
GROUP BY major
HAVING COUNT(*) >= 10;
```

Meaning:

> Show majors that have at least 10 students.

A useful distinction:

```text
WHERE
  ↓
filter rows

GROUP BY
  ↓
create groups

HAVING
  ↓
filter groups
```

---

# 21. SQL's declarative nature

This is one of the most important concepts.

SQL is primarily **declarative**.

In a procedural language, you might say:

```text
1. Open table
2. Read row
3. Check major
4. If major is CS, save row
5. Read next row
6. ...
```

In SQL:

```sql
SELECT *
FROM students
WHERE major = 'CS';
```

You describe:

> **what you want**

rather than precisely specifying:

> **how the database should obtain it.**

The database's query optimizer decides how to execute it.

---

# 22. Query optimizer

Consider:

```sql
SELECT *
FROM students
WHERE id = 1000000;
```

If `id` is indexed, the database may use the index instead of scanning every row.

Conceptually:

```text
SQL query
    │
    ▼
Parser
    │
    ▼
Query optimizer
    │
    ├── index scan?
    ├── table scan?
    ├── join strategy?
    └── execution plan?
    │
    ▼
Database engine
    │
    ▼
Result
```

This is one of the reasons SQL is more than just "a language for tables."

---

# 23. Indexes

An index makes searching certain data much faster.

Conceptually:

```text
Table
 │
 ├── id
 ├── name
 └── age

Indexes
 │
 ├── index on id
 ├── index on name
 └── index on age
```

For example:

```sql
CREATE INDEX idx_students_name
ON students(name);
```

Now a query such as:

```sql
SELECT *
FROM students
WHERE name = 'Alice';
```

may be able to use the index.

But indexes aren't free.

They:

* consume storage
* make writes more expensive
* need maintenance

So database design involves trade-offs.

---

# 24. Transactions

One of SQL/database programming's most important concepts is the **transaction**.

Suppose you transfer money:

```text
Account A: -$100
Account B: +$100
```

These two operations should be treated as one logical operation.

```sql
BEGIN;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;

COMMIT;
```

If something goes wrong:

```sql
ROLLBACK;
```

The database can undo the transaction.

---

# 25. ACID

Transactions are commonly discussed using **ACID**:

```text
A → Atomicity
C → Consistency
I → Isolation
D → Durability
```

### Atomicity

All operations happen or none happen.

### Consistency

The database remains valid according to its rules.

### Isolation

Concurrent transactions should not improperly interfere with each other.

### Durability

Committed data survives failures according to the database's durability guarantees.

ACID is fundamental to relational database systems.

---

# 26. SQL and concurrency

Imagine:

```text
User A
   │
   ├── reads balance
   │
   └── updates balance


User B
   │
   ├── reads balance
   │
   └── updates balance
```

Both may happen simultaneously.

The database therefore needs mechanisms such as:

* transactions
* locks
* MVCC
* isolation levels
* concurrency control

This is where database theory becomes quite deep.

---

# 27. SQL and backend development

This is especially important for you because you're learning **Java backend development**.

A typical Java backend architecture looks like:

```text
Frontend
   │
 HTTP
   ▼
Spring Boot
   │
Controller
   │
Service
   │
Repository / DAO
   │
JDBC / JPA / Hibernate
   │
 SQL
   │
   ▼
PostgreSQL / MySQL / Oracle
```

For example:

```text
Java
  ↓
Spring Boot
  ↓
Service
  ↓
Repository
  ↓
JPA / Hibernate
  ↓
SQL
  ↓
Database
```

Even if you use Hibernate or JPA, **understanding SQL remains extremely important**.

---

# 28. JDBC and SQL

Java can communicate with databases using **JDBC**.

Conceptually:

```java
Connection
    ↓
PreparedStatement
    ↓
SQL
    ↓
Database
    ↓
ResultSet
```

For example:

```java
String sql =
    "SELECT id, name FROM students WHERE age >= ?";

PreparedStatement statement =
    connection.prepareStatement(sql);

statement.setInt(1, 18);

ResultSet result =
    statement.executeQuery();
```

The SQL is still there.

Frameworks don't eliminate the database—they provide abstractions around it.

---

# 29. SQL, JPA, and Hibernate

This is particularly important given your Spring learning.

You may eventually see:

```java
studentRepository.findById(id);
```

instead of writing:

```sql
SELECT *
FROM students
WHERE id = ?;
```

But underneath, the ORM may generate SQL similar to:

```sql
SELECT ...
FROM students
WHERE id = ?;
```

So the stack becomes:

```text
Your Java code
      ↓
Spring Data JPA
      ↓
Hibernate
      ↓
SQL
      ↓
Database
```

Learning SQL first makes Hibernate and JPA much easier to understand.

---

# 30. SQL vs NoSQL

You have also been studying databases such as MongoDB and Redis.

A useful distinction is:

```text
Database
   │
   ├── Relational
   │      │
   │      ├── PostgreSQL
   │      ├── MySQL
   │      ├── Oracle
   │      └── SQL Server
   │
   └── NoSQL
          │
          ├── MongoDB
          ├── Redis
          └── Cassandra
```

Relational databases typically emphasize:

```text
tables
relationships
SQL
transactions
schemas
```

NoSQL databases use various other models:

```text
document
key-value
wide-column
graph
```

Neither is universally "better."

---

# 31. SQL dialects

SQL is standardized, but real databases have their own dialects.

For example:

```text
SQL standard
    │
    ├── PostgreSQL SQL
    ├── MySQL SQL
    ├── Oracle SQL
    ├── SQL Server T-SQL
    └── SQLite SQL
```

Most basic SQL is portable:

```sql
SELECT *
FROM students
WHERE age >= 18;
```

But advanced features can differ.

This is why you should learn:

1. **standard SQL concepts**
2. then the particular database you use

For Java backend development, **PostgreSQL or MySQL** is an excellent place to start.

---

# 32. SQL's major categories

SQL can be organized into several categories.

### DDL — Data Definition Language

Defines database structures:

```sql
CREATE
ALTER
DROP
TRUNCATE
```

### DML — Data Manipulation Language

Manipulates data:

```sql
INSERT
UPDATE
DELETE
```

### DQL — Data Query Language

Usually refers to:

```sql
SELECT
```

### DCL — Data Control Language

Permissions:

```sql
GRANT
REVOKE
```

### TCL — Transaction Control Language

Transactions:

```sql
COMMIT
ROLLBACK
SAVEPOINT
```

A useful map:

```text
SQL
│
├── DDL → structure
├── DML → data modification
├── DQL → queries
├── DCL → permissions
└── TCL → transactions
```

---

# 33. A small complete example

Let's build a simple student database.

### Create table

```sql
CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INTEGER,
    major VARCHAR(100)
);
```

### Insert data

```sql
INSERT INTO students
    (id, name, age, major)
VALUES
    (1, 'Alice', 20, 'Computer Science'),
    (2, 'Bob', 21, 'Mathematics'),
    (3, 'Charlie', 19, 'Computer Science');
```

### Query

```sql
SELECT *
FROM students
WHERE major = 'Computer Science';
```

### Sort

```sql
SELECT *
FROM students
ORDER BY age;
```

### Update

```sql
UPDATE students
SET age = 22
WHERE id = 2;
```

### Delete

```sql
DELETE FROM students
WHERE id = 3;
```

This small example already demonstrates a large part of basic SQL.

---

# 34. How I recommend you learn SQL

Since you're learning Java backend, I would learn it in this order:

```text
Phase 1 — Basic SQL
    │
    ├── SELECT
    ├── INSERT
    ├── UPDATE
    ├── DELETE
    └── WHERE

Phase 2 — Querying
    │
    ├── ORDER BY
    ├── LIMIT
    ├── DISTINCT
    ├── LIKE
    ├── IN
    └── BETWEEN

Phase 3 — Aggregation
    │
    ├── COUNT
    ├── SUM
    ├── AVG
    ├── MIN / MAX
    ├── GROUP BY
    └── HAVING

Phase 4 — Relationships
    │
    ├── primary keys
    ├── foreign keys
    ├── 1:1
    ├── 1:N
    ├── N:N
    └── JOINs

Phase 5 — Database design
    │
    ├── normalization
    ├── constraints
    ├── indexes
    └── schema design

Phase 6 — Advanced SQL
    │
    ├── subqueries
    ├── CTEs
    ├── views
    ├── window functions
    └── recursive queries

Phase 7 — Database engineering
    │
    ├── transactions
    ├── ACID
    ├── isolation levels
    ├── locks
    ├── MVCC
    └── query optimization

Phase 8 — Java integration
    │
    ├── JDBC
    ├── connection pools
    ├── JPA
    ├── Hibernate
    └── Spring Data JPA
```

---

# 35. The big picture

SQL is quite different from the programming languages you've just asked about:

```text
C
 ↓
systems programming

Rust
 ↓
safe systems programming

Java
 ↓
application / enterprise programming

Python
 ↓
general-purpose / AI / automation

R
 ↓
statistics / data analysis

CUDA
 ↓
GPU computing

SQL
 ↓
data / relational databases
```

And SQL occupies a particularly fundamental position in backend development:

```text
                Backend Application

Frontend
   │
   │ HTTP
   ▼
Spring Boot
   │
   ├── Controller
   │
   ├── Service
   │
   └── Repository
          │
          ▼
        SQL
          │
          ▼
    Relational Database
          │
    ┌─────┼─────┐
    ▼     ▼     ▼
PostgreSQL MySQL Oracle
```

The key idea to remember is:

> **SQL is a declarative language for working with relational data.**

And for a Java backend developer, SQL is **not an optional database detail**. Even when you eventually use Spring Data JPA and Hibernate, understanding **SQL, relational modeling, JOINs, indexes, and transactions** is one of the foundations of professional backend development.
