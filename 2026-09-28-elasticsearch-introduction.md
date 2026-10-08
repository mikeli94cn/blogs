# Elasticsearch Introduction

**Elasticsearch** is a distributed search and analytics engine designed to **store, search, and analyze large amounts of data very quickly**.

It is especially good at things that traditional SQL databases are not primarily optimized for:

* 🔎 Full-text search
* ⚡ Very fast keyword search
* 📊 Log and event analysis
* 🧮 Aggregations and statistics
* 📍 Geographic search
* 📝 Autocomplete and fuzzy search
* 📈 Observability and monitoring

A simple way to think about it:

> **MySQL/PostgreSQL are primarily databases; Elasticsearch is primarily a search and analytics engine.**

---

## 1. What problem does Elasticsearch solve?

Imagine an online bookstore with **100 million books**.

A user searches:

```text
java backend development
```

You might want to find books containing:

* `java`
* `backend`
* `development`

and rank them according to relevance.

A relational database can do:

```sql
SELECT *
FROM books
WHERE title LIKE '%java%'
   OR description LIKE '%java%';
```

But as the dataset becomes very large and the search requirements become sophisticated, this approach becomes increasingly difficult to optimize.

Elasticsearch is specifically designed for this kind of search:

```text
"java backend development"
        ↓
   Elasticsearch
        ↓
Relevant documents
        ↓
1. Spring Boot in Action
2. Effective Java
3. Java: The Complete Reference
...
```

---

# 2. Elasticsearch vs MySQL/PostgreSQL

This is probably the most important concept for a Java backend developer.

|                    | MySQL / PostgreSQL         | Elasticsearch                    |
| ------------------ | -------------------------- | -------------------------------- |
| Main purpose       | General database           | Search & analytics               |
| Data model         | Tables / rows              | Documents                        |
| Query language     | SQL                        | Query DSL / JSON                 |
| Full-text search   | Supported                  | Core feature                     |
| Transactions       | Strong                     | More limited                     |
| Joins              | Strong support             | Avoided / limited                |
| Aggregations       | Yes                        | Very powerful                    |
| Distributed search | Not the primary focus      | Core design                      |
| Exact data storage | Excellent                  | Usually not the system of record |
| Relevance ranking  | Basic/full-text extensions | Core capability                  |

For example:

```text
PostgreSQL
    ↓
Users
Products
Orders
Payments
    ↓
System of record
```

while:

```text
Elasticsearch
    ↓
Search index
    ↓
Fast search
Filtering
Ranking
Aggregations
```

A common architecture is therefore:

```text
                 ┌──────────────┐
                 │ PostgreSQL   │
                 │              │
                 │ Source data  │
                 └──────┬───────┘
                        │
                        │ synchronize
                        ↓
                 ┌──────────────┐
User ── search → │ Elasticsearch│
                 │              │
                 │ Search index │
                 └──────────────┘
```

So **Elasticsearch does not necessarily replace MySQL/PostgreSQL**.

Often they work together.

---

# 3. Elasticsearch's basic data model

If you come from SQL, you can initially think of Elasticsearch like this:

```text
SQL                         Elasticsearch

Database       →            Cluster
Table          →            Index
Row            →            Document
Column         →            Field
```

For example, a SQL table:

```sql
CREATE TABLE users (
    id INT,
    name VARCHAR(100),
    age INT
);
```

might correspond conceptually to Elasticsearch documents:

```json
{
  "id": 1,
  "name": "Alice",
  "age": 25
}
```

and:

```json
{
  "id": 2,
  "name": "Bob",
  "age": 30
}
```

An Elasticsearch **index** might contain these documents.

However, don't take the SQL analogy too literally. Elasticsearch's internal data model and indexing mechanism are quite different.

---

# 4. What is a document?

The fundamental unit of data in Elasticsearch is a **document**.

A document is represented using JSON.

For example:

```json
{
  "id": 1001,
  "title": "Spring Boot Introduction",
  "author": "Mike",
  "price": 39.99,
  "tags": [
    "Java",
    "Spring",
    "Backend"
  ]
}
```

You can search the document using its fields:

```text
title
author
price
tags
```

This is particularly convenient for application developers because JSON is already the dominant data format for web APIs.

---

# 5. What is an index?

An **index** is a logical collection of documents.

For example:

```text
products
    │
    ├── document 1
    ├── document 2
    ├── document 3
    ├── document 4
    └── ...
```

You might have:

```text
products
users
articles
logs
orders
```

An important distinction:

> An Elasticsearch index is **not exactly equivalent to a SQL table**.

An index contains documents that are searchable together and has mappings/settings that describe how those documents should be indexed.

---

# 6. Why is Elasticsearch so fast?

This is where Elasticsearch becomes particularly interesting.

Elasticsearch is built on top of **Apache Lucene**.

Apache Lucene is a search library that provides the underlying indexing and search technology.

The basic idea is:

```text
Raw documents
      ↓
Analysis
      ↓
Inverted index
      ↓
Fast searching
```

The key concept is the **inverted index**.

---

# 7. Inverted index

Suppose we have three documents:

```text
Document 1:
Java Spring Boot

Document 2:
Java Elasticsearch

Document 3:
Python Elasticsearch
```

A simplified inverted index might look like:

```text
Java          → 1, 2
Spring        → 1
Boot          → 1
Elasticsearch → 2, 3
Python        → 3
```

Now search:

```text
Elasticsearch
```

Elasticsearch can quickly determine:

```text
Elasticsearch → Document 2, Document 3
```

Instead of scanning every document from beginning to end.

This is one of the fundamental ideas behind modern search engines.

---

# 8. Full-text search

This is Elasticsearch's most famous capability.

Suppose:

```json
{
  "title": "Java Backend Development with Spring Boot"
}
```

You can search:

```text
backend spring
```

Elasticsearch can analyze the text and determine which documents are relevant.

This is much more sophisticated than:

```sql
LIKE '%spring%'
```

because Elasticsearch can perform things such as:

* tokenization
* text analysis
* stemming
* relevance scoring
* fuzzy matching
* phrase matching
* language-specific analysis

---

# 9. Relevance scoring

Suppose we have:

```text
Document A:
Java Spring Boot Tutorial

Document B:
Java Programming

Document C:
Python Web Development
```

Search:

```text
Java Spring Boot
```

Elasticsearch doesn't simply return documents randomly.

It can calculate a **relevance score**:

```text
Document A    score = 8.7
Document B    score = 3.2
Document C    score = 0
```

and return:

```text
Document A
Document B
```

with the most relevant documents first.

This is extremely important for:

* Google-like search
* product search
* article search
* documentation search
* job search
* e-commerce

---

# 10. Query DSL

Instead of SQL, Elasticsearch commonly uses a JSON-based **Query DSL**.

For example:

```json
{
  "query": {
    "match": {
      "title": "java spring"
    }
  }
}
```

This means approximately:

> Search the `title` field for text matching "java spring".

You can also perform exact filtering:

```json
{
  "query": {
    "term": {
      "category": "book"
    }
  }
}
```

And combine conditions:

```json
{
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "title": "java"
          }
        }
      ],
      "filter": [
        {
          "range": {
            "price": {
              "lte": 50
            }
          }
        }
      ]
    }
  }
}
```

Conceptually:

```text
title contains "java"
        AND
price <= 50
```

---

# 11. Search vs filtering

Elasticsearch distinguishes between **searching** and **filtering**.

### Search

```text
Find documents relevant to:

"java backend"
```

This involves relevance scoring.

### Filter

```text
price <= 50
category = "book"
published_year >= 2025
```

This is more like a yes/no condition.

For an e-commerce website:

```text
Search:
"wireless headphones"

Filters:
    price < $100
    brand = Sony
    rating >= 4
```

Elasticsearch can combine these efficiently.

---

# 12. Aggregations

Another major Elasticsearch feature is **aggregation**.

Suppose you have millions of products.

You can ask:

```text
How many products are in each category?
```

Result:

```text
Books       120,000
Computers    80,000
Phones       95,000
Headphones   45,000
```

Or:

```text
What is the average product price?
```

Or:

```text
What are the top 10 brands?
```

This makes Elasticsearch useful not only for search but also for analytics.

For example:

```text
Search
  +
Filter
  +
Aggregation
```

can power a product-search page:

```text
                Search
                  │
          "java programming"
                  │
        ┌─────────┴─────────┐
        ↓                   ↓
   Search results       Aggregations
                            │
                     ┌──────┼──────┐
                     ↓      ↓      ↓
                   price  author  year
```

---

# 13. Distributed architecture

Elasticsearch is designed to run as a **distributed system**.

Instead of:

```text
One Elasticsearch server
```

you can have:

```text
              Elasticsearch Cluster

        ┌────────┐
        │ Node 1 │
        └────────┘
           │
     ┌─────┴─────┐
     ↓           ↓
┌────────┐  ┌────────┐
│ Node 2  │  │ Node 3  │
└────────┘  └────────┘
```

Large indexes can be divided into **shards**.

```text
Index
 │
 ├── Primary shard 1
 ├── Primary shard 2
 ├── Primary shard 3
 └── Primary shard 4
```

These shards can be distributed across different nodes.

This allows Elasticsearch to handle large datasets and high search traffic.

---

# 14. Replicas

Elasticsearch can also maintain replica shards.

For example:

```text
Primary shard
      │
      └── Replica shard
```

If one node fails, another copy can remain available.

Conceptually:

```text
Node 1
 └── Primary shard 1

Node 2
 └── Replica shard 1
```

This contributes to **availability and fault tolerance**.

---

# 15. Elasticsearch REST API

Elasticsearch exposes HTTP APIs.

For example:

```http
GET /products/_search
```

with a request body:

```json
{
  "query": {
    "match": {
      "name": "laptop"
    }
  }
}
```

Because it uses HTTP + JSON, it is easy for backend applications to communicate with.

A Java application can therefore have:

```text
Spring Boot
     │
     │ HTTP / Elasticsearch client
     ↓
Elasticsearch
```

---

# 16. Elasticsearch in a Java backend

For your Java backend learning, a common architecture looks like:

```text
                   Browser
                      │
                      ↓
                Spring Boot
                      │
          ┌───────────┴───────────┐
          ↓                       ↓
     PostgreSQL              Elasticsearch
          │                       │
    Source of truth          Search index
```

For example, an online bookstore:

### PostgreSQL

Stores:

```text
Book
Author
Order
Customer
Payment
Inventory
```

### Elasticsearch

Stores searchable information:

```text
Book title
Description
Author
Category
Tags
Search keywords
```

When a user searches:

```text
"spring boot"
```

the application asks Elasticsearch.

When the user purchases a book, the transaction is handled by the transactional database.

---

# 17. Elasticsearch and Spring Boot

In the Spring ecosystem, you may encounter:

**Spring Data Elasticsearch**

which provides integration between Spring applications and Elasticsearch.

Conceptually:

```text
Spring Boot
     │
     ↓
Spring Data Elasticsearch
     │
     ↓
Elasticsearch Java Client
     │
     ↓
Elasticsearch
```

A Java application might define a document such as:

```java
@Document(indexName = "products")
public class Product {

    @Id
    private String id;

    private String name;

    private double price;
}
```

and then use a repository:

```java
public interface ProductRepository
        extends ElasticsearchRepository<Product, String> {
}
```

The exact APIs vary by Spring Data / Elasticsearch version, so when you reach this stage it's worth learning the current client/API rather than memorizing older examples.

---

# 18. Elasticsearch is also used for logs

One of the historically important uses of Elasticsearch is **log analysis**.

For example:

```text
Spring Boot application
        │
        ↓
      Logs
        │
        ↓
 Log collection pipeline
        │
        ↓
 Elasticsearch
        │
        ↓
   Visualization
```

A common ecosystem is the **Elastic Stack**:

```text
Elasticsearch
      +
Logstash
      +
Kibana
```

Often called:

> **ELK Stack**

although the Elastic ecosystem has evolved beyond the original ELK terminology.

### Elasticsearch

Stores/searches/analyzes data.

### Logstash

Collects and transforms data.

### Kibana

Provides visualization and dashboards.

For example:

```text
Application logs
      ↓
Logstash
      ↓
Elasticsearch
      ↓
Kibana
      ↓
Dashboard
```

You might visualize:

```text
HTTP requests per minute
5xx errors
response times
server errors
user activity
```

---

# 19. Elasticsearch vs Redis

Since you recently asked about Redis, these three technologies have very different primary purposes:

| Technology    | Main purpose               |
| ------------- | -------------------------- |
| PostgreSQL    | Relational database        |
| Redis         | In-memory data store/cache |
| Elasticsearch | Search & analytics         |

A typical backend might use all three:

```text
                  Spring Boot
                      │
       ┌──────────────┼──────────────┐
       ↓              ↓              ↓
 PostgreSQL         Redis      Elasticsearch
       │              │              │
 persistent       cache/session    search
   data                             
```

For example:

```text
Product information
       ↓
PostgreSQL

Frequently accessed product
       ↓
Redis

Search "wireless headphones"
       ↓
Elasticsearch
```

---

# 20. Important Elasticsearch concepts to learn

For your Java backend roadmap, I would learn Elasticsearch in roughly this order:

### Phase 1 — Basic concepts

```text
Elasticsearch
Cluster
Node
Index
Document
Field
Mapping
```

### Phase 2 — Basic operations

Learn CRUD:

```text
Create
Read
Update
Delete
```

using the REST API.

### Phase 3 — Search

Learn:

```text
match
term
match_phrase
bool
must
should
must_not
filter
range
exists
```

### Phase 4 — Text analysis

Learn:

```text
Analyzer
Tokenizer
Token
Inverted index
Stemming
Synonyms
```

This is where you start understanding **why Elasticsearch works**, rather than just memorizing queries.

### Phase 5 — Relevance

Learn:

```text
Scoring
Boosting
BM25
Full-text relevance
Fuzzy search
Autocomplete
```

### Phase 6 — Aggregations

Learn:

```text
Bucket aggregation
Metric aggregation
Terms
Range
Date histogram
Stats
Average
Sum
```

### Phase 7 — Distributed Elasticsearch

Learn:

```text
Cluster
Node
Shard
Primary shard
Replica shard
Cluster health
Scaling
Fault tolerance
```

### Phase 8 — Java/Spring Boot integration

Finally:

```text
Spring Boot
     ↓
Spring Data Elasticsearch
     ↓
Elasticsearch
```

Build a real search feature.

---

# 21. A good practice project for you

Since you're learning **Java backend + Spring Boot**, I would recommend building a:

## Product Search System

Architecture:

```text
                  REST API
                     │
                     ↓
                Spring Boot
                     │
          ┌──────────┴──────────┐
          ↓                     ↓
     PostgreSQL           Elasticsearch
          │                     │
   Product data            Search index
```

Features:

```text
POST   /products
GET    /products/{id}
PUT    /products/{id}
DELETE /products/{id}

GET /products/search?q=java

GET /products/search?q=java&minPrice=20&maxPrice=100
```

Then progressively add:

```text
1. CRUD
2. Full-text search
3. Filtering
4. Sorting
5. Pagination
6. Fuzzy search
7. Autocomplete
8. Aggregations
9. Search highlighting
10. PostgreSQL → Elasticsearch synchronization
```

That would be an excellent **Spring Boot + database + Elasticsearch** practice project.

---

# 22. The big picture

The most important mental model is:

```text
                 DATABASE WORLD

              PostgreSQL / MySQL
                      │
                persistent data
                      │
                      ↓

                 SEARCH WORLD

                Elasticsearch
                      │
          ┌───────────┼───────────┐
          ↓           ↓           ↓
       Search      Ranking    Analytics
          │           │           │
          ↓           ↓           ↓
       keyword     relevance   aggregation
```

And internally:

```text
JSON Documents
      ↓
Text Analysis
      ↓
Inverted Index
      ↓
Distributed Shards
      ↓
Fast Search
      ↓
Relevance + Aggregations
```

So if you remember only one sentence:

> **Elasticsearch is a distributed search and analytics engine, built on Apache Lucene, that indexes documents so applications can perform fast, sophisticated searches and aggregations.**

For your **Java backend learning path**, I would learn **PostgreSQL → Redis → Elasticsearch** after you have the basic Spring Boot REST/API and persistence concepts down. Elasticsearch is especially worth learning once you understand what problem a normal relational database solves and why an application needs a separate search engine.
