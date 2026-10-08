# Redis Introduction

Redis is an **in-memory data store** commonly used as a **cache, database, message broker, and fast data-processing system**.

If you're learning **Java backend development**, Redis is an important technology to learn after you understand SQL databases such as MySQL/PostgreSQL.

A simple mental model is:

> **MySQL/PostgreSQL → persistent relational data**
> **Redis → extremely fast temporary/shared data in memory**

---

## 1. What is Redis?

Redis originally stood for **Remote Dictionary Server**.

It stores data primarily in **RAM (memory)** rather than relying primarily on disk.

For example:

```text
Java Application
       |
       +-----> PostgreSQL
       |       permanent data
       |
       +-----> Redis
               fast data
```

Suppose your application needs to repeatedly retrieve:

```text
userId = 1001
```

from a database.

Without Redis:

```text
Java
  ↓
PostgreSQL
  ↓
find user 1001
  ↓
return user
```

With Redis:

```text
Java
  ↓
Redis
  ↓
user 1001 found immediately
```

If the data isn't in Redis:

```text
Java
  ↓
Redis
  ↓
cache miss
  ↓
PostgreSQL
  ↓
get data
  ↓
put data into Redis
```

This is called **caching**.

---

# 2. Why is Redis so fast?

The most important reason is:

> **Redis keeps its working dataset in memory.**

RAM is much faster to access than persistent storage.

Conceptually:

```text
             Speed
              ↑
              |
          RAM / Redis
              |
          SSD / Database
              |
          HDD
              |
              +----------------→ slower
```

But Redis's performance isn't simply because "RAM is faster." Redis also uses highly optimized data structures and a relatively simple request-processing model.

For many workloads, Redis can handle very large numbers of operations per second with very low latency.

---

# 3. Redis is a key-value store

The simplest way to understand Redis is:

```text
key → value
```

For example:

```text
"user:1001" → "Mike"
"user:1002" → "John"
```

You can interact with Redis from its command line.

```redis
SET name "Mike"
GET name
```

Result:

```text
"Mike"
```

Another example:

```redis
SET user:1001 "Mike"
GET user:1001
```

---

# 4. Redis is more than simple strings

One of Redis's important characteristics is that its values can use different **data structures**.

The major ones to know are:

```text
String
Hash
List
Set
Sorted Set
Stream
```

You can think of Redis as:

```text
Key
 |
 +-- String
 +-- Hash
 +-- List
 +-- Set
 +-- Sorted Set
 +-- Stream
```

---

# 5. String

The simplest Redis data type.

```redis
SET username "Mike"
GET username
```

You can also store numbers:

```redis
SET counter 10

INCR counter
```

Now:

```text
11
```

This makes Redis useful for counters.

For example:

```text
page views
likes
downloads
login attempts
```

---

# 6. Hash

A Redis Hash is useful for representing an object.

For example:

```redis
HSET user:1001 name "Mike" age 25 city "LA"
```

Then:

```redis
HGET user:1001 name
```

returns:

```text
"Mike"
```

You can retrieve the whole object:

```redis
HGETALL user:1001
```

Conceptually:

```text
user:1001
    |
    +-- name → Mike
    +-- age  → 25
    +-- city → LA
```

This is very useful for caching Java objects.

---

# 7. List

A Redis List is an ordered collection.

```redis
LPUSH messages "hello"
LPUSH messages "world"
```

You can retrieve elements:

```redis
LRANGE messages 0 -1
```

Lists can be useful for:

* queues
* task processing
* recent items
* activity lists

Conceptually:

```text
messages

world
hello
```

---

# 8. Set

A Set contains **unique values**.

```redis
SADD tags "java"
SADD tags "spring"
SADD tags "redis"
SADD tags "java"
```

The second `"java"` doesn't create a duplicate.

```redis
SMEMBERS tags
```

might return:

```text
java
spring
redis
```

Sets are useful for:

```text
unique users
unique tags
permissions
membership checking
```

For example:

```redis
SISMEMBER users 1001
```

asks:

> Is user 1001 in this set?

---

# 9. Sorted Set

A Sorted Set contains unique members with a **score**.

For example, a leaderboard:

```redis
ZADD leaderboard 100 Alice
ZADD leaderboard 250 Bob
ZADD leaderboard 180 Charlie
```

Redis maintains the ordering based on the scores.

Conceptually:

```text
Bob      250
Charlie  180
Alice    100
```

This is useful for:

* leaderboards
* rankings
* priority systems
* time-based data

---

# 10. Redis expiration

One of Redis's most important features for backend development is **expiration**.

For example:

```redis
SET verification_code "123456" EX 300
```

This means:

```text
verification_code
        |
        +---- "123456"
        |
        +---- expires after 300 seconds
```

After five minutes, Redis automatically removes it.

This is extremely useful for:

```text
verification codes
sessions
temporary tokens
cache entries
password reset tokens
rate limiting
```

You can also set expiration separately:

```redis
SET name "Mike"

EXPIRE name 60
```

The key will expire after 60 seconds.

---

# 11. Redis as a cache

This is probably the **first Redis use case you should learn as a Java backend developer**.

Imagine your database contains:

```text
users

id | name | age
---+------+----
1  | Mike | 25
2  | John | 30
```

Your Java application repeatedly asks:

```text
SELECT * FROM users WHERE id = 1;
```

Instead, you can implement:

```text
             Request
                |
                v
          Java Application
                |
                v
             Redis
           /       \
       hit           miss
       |               |
       v               v
    return          PostgreSQL
                       |
                       v
                    Redis
                       |
                       v
                    return
```

This pattern is called **cache-aside** or **lazy caching**.

Typical code conceptually looks like:

```java
User user = redis.get("user:1");

if (user == null) {
    user = database.findUser(1);
    redis.set("user:1", user);
}

return user;
```

Spring Boot makes this pattern much easier with **Spring Cache**.

---

# 12. Redis vs MySQL/PostgreSQL

This distinction is very important.

|                 | Redis                             | MySQL/PostgreSQL             |
| --------------- | --------------------------------- | ---------------------------- |
| Main model      | Key-value/data structures         | Relational                   |
| Primary storage | Memory                            | Disk + memory cache          |
| SQL             | No                                | Yes                          |
| Tables          | No                                | Yes                          |
| Joins           | No traditional SQL joins          | Yes                          |
| Transactions    | Supported, but different model    | Full relational transactions |
| Persistence     | Optional/configurable             | Core feature                 |
| Typical speed   | Extremely fast                    | Fast                         |
| Typical use     | Cache, sessions, counters, queues | Main application database    |

Don't think:

> "Redis replaces MySQL."

Usually the architecture is:

```text
             Java / Spring Boot
                    |
          +---------+---------+
          |                   |
          v                   v
       Redis              PostgreSQL
       cache              main DB
```

They often work **together**.

---

# 13. Redis vs Memcached

You will often encounter this comparison.

Both can be used as caches.

Historically:

```text
Memcached
    ↓
simple distributed cache
```

while Redis provides considerably richer data structures and capabilities:

```text
Redis
 |
 +-- String
 +-- Hash
 +-- List
 +-- Set
 +-- Sorted Set
 +-- Stream
 +-- expiration
 +-- persistence
 +-- transactions
 +-- Pub/Sub
 +-- replication
 +-- clustering
```

Therefore Redis is commonly used for more than simple caching.

---

# 14. Redis persistence

You might wonder:

> If Redis uses RAM, won't everything disappear when the server shuts down?

Redis can persist data to disk.

Two important persistence mechanisms are:

### RDB

Redis periodically creates a snapshot.

```text
RAM
 |
 | periodically
 v
RDB snapshot
 |
 v
Disk
```

### AOF

Redis records write operations.

Conceptually:

```text
SET name Mike
SET age 25
INCR counter
```

are recorded so the dataset can be reconstructed.

So Redis can provide persistence, although its persistence model is different from a traditional relational database.

---

# 15. Redis Pub/Sub

Redis can also be used for messaging.

For example:

```text
Publisher
    |
    v
 Redis
    |
    +------> Subscriber A
    |
    +------> Subscriber B
    |
    +------> Subscriber C
```

Publisher:

```redis
PUBLISH news "Hello"
```

Subscribers listening to that channel receive the message.

This can be useful for things such as:

```text
real-time notifications
application events
simple messaging
```

For more durable message/event processing, Redis Streams or dedicated messaging systems may be more appropriate.

---

# 16. Redis in a Spring Boot application

Since you're learning Java backend, this is the part I'd connect directly to your Spring learning path.

A typical modern backend stack could be:

```text
                Browser / Mobile
                       |
                       v
                 Spring Boot
                       |
             +---------+---------+
             |                   |
             v                   v
          Redis              PostgreSQL
        fast/cache           persistent
             |
             |
       temporary data
```

For example:

```text
GET /users/1001
```

Spring Boot could do:

```text
1. Check Redis
2. If found → return
3. If not found:
      query PostgreSQL
      save result to Redis
      return result
```

Spring provides Redis integration through **Spring Data Redis**.

You will commonly encounter:

```java
RedisTemplate
```

and Spring's caching abstraction:

```java
@Cacheable
@CachePut
@CacheEvict
```

For example:

```java
@Cacheable("users")
public User findUser(Long id) {
    return userRepository.findById(id).orElseThrow();
}
```

Conceptually:

```text
findUser(1001)
      |
      v
   Cache?
   /    \
 hit    miss
  |       |
  |       v
  |   PostgreSQL
  |       |
  +-------+
      |
      v
    User
```

---

# 17. Redis and distributed systems

Redis becomes particularly interesting when you have multiple backend servers.

Imagine:

```text
             Load Balancer
                  |
       +----------+----------+
       |          |          |
       v          v          v
    Server A   Server B   Server C
       |          |          |
       +----------+----------+
                  |
                Redis
```

If session information is stored only inside Server A:

```text
User → Server A
       session = ...
```

then the next request might go to Server B.

Server B doesn't know the session.

Redis can provide a **shared store**:

```text
Server A ─┐
Server B ─┼──> Redis
Server C ─┘
```

Now all servers can access the same session/cache information.

This is one reason Redis is very common in distributed Spring Boot applications.

---

# 18. Redis architecture concepts to learn later

Once you understand the basics, there are several more advanced topics:

```text
Redis
 |
 +-- Data structures
 |
 +-- Expiration / TTL
 |
 +-- Persistence
 |     +-- RDB
 |     +-- AOF
 |
 +-- Transactions
 |
 +-- Pub/Sub
 |
 +-- Streams
 |
 +-- Replication
 |
 +-- Sentinel
 |
 +-- Cluster
 |
 +-- Distributed locking
 |
 +-- High availability
```

Don't try to learn all of these at once.

---

# 19. Where Redis fits in your Java backend roadmap

Given your current learning path, I'd put Redis roughly here:

```text
Phase 1
Java fundamentals
    ↓
Phase 2
Maven + Git
    ↓
Phase 3
SQL + PostgreSQL/MySQL
    ↓
Phase 4
HTTP + Servlet + Tomcat
    ↓
Phase 5
Spring Framework
    ↓
Phase 6
Spring Boot
    ↓
Phase 7
Spring MVC + REST API
    ↓
Phase 8
JPA/Hibernate
    ↓
Phase 9
Redis
    ↓
Phase 10
Security + JWT
    ↓
Phase 11
Docker
    ↓
Phase 12
Microservices / distributed systems
```

You **don't need Redis before understanding SQL and Spring Boot**.

For your learning project, a good progression would be:

```text
Student Management System
        ↓
PostgreSQL
        ↓
Spring Boot REST API
        ↓
JPA/Hibernate
        ↓
Redis
```

Then you can add Redis to cache something like:

```text
GET /students/1001
```

and learn the complete flow:

```text
HTTP
 ↓
Spring Boot Controller
 ↓
Service
 ↓
Redis
 ↓ cache miss
PostgreSQL
 ↓
Redis
 ↓
Response
```

That would give you a very practical understanding of **where Redis belongs in a modern Java backend**.
