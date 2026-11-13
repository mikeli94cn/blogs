# Building a DVD Rental Website with Java: Industry-Standard Architecture

A DVD rental website is an excellent project for learning professional Java backend development. Although DVD rental is a traditional business, the system involves many concepts used in modern e-commerce platforms, such as user management, product catalogs, inventory, orders, payments, and delivery tracking.

I recommend building it using Spring Boot, Spring MVC, Spring Data JPA (Hibernate), MySQL, and React, following a modular monolith architecture.

This approach will help you learn how modern Java web applications are designed, developed, tested, and deployed in real companies.

## 1. Overall system architecture

A mature website typically uses a layered architecture, separating the user interface, business logic, and database.

Frontend — Presentation Layer

React + TypeScript + HTML + CSS

Customer website / Admin dashboard

HTTPS / REST API / JSON

Java Backend — Spring Boot

Controller Layer

REST endpoints, input validation, HTTP responses

Service Layer

Rental rules, transactions, business workflows

Repository Layer

Spring Data JPA + Hibernate

MySQL

Persistent data

Redis

Cache / sessions

Object storage

DVD cover images

Recommended logical architecture. Redis and object storage can be introduced later.

### Recommended technology stack

| Component           | Technology                       | Purpose                                |
| ------------------- | -------------------------------- | -------------------------------------- |
| Frontend            | React + TypeScript               | Interactive user interface             |
| Backend             | Java 21 or 25 LTS                | Main programming language              |
| Framework           | Spring Boot                      | Backend application framework          |
| Web                 | Spring MVC                       | REST APIs                              |
| Security            | Spring Security                  | Authentication and authorization       |
| Persistence         | Spring Data JPA + Hibernate      | Database access                        |
| Database            | MySQL 8.4 LTS                    | Relational data storage                |
| Database migrations | Flyway                           | Version-controlled database changes    |
| Cache               | Redis (later)                    | Frequently accessed data               |
| Build               | Maven                            | Dependency and build management        |
| Testing             | JUnit 5, Mockito, Testcontainers | Automated testing                      |
| API documentation   | OpenAPI / Swagger UI             | Document and test APIs                 |
| Deployment          | Docker Compose + Nginx           | Container deployment and reverse proxy |
| CI/CD               | GitHub Actions                   | Automated builds and tests             |

These technologies are widely used, but there is no single stack that every company uses. For your learning goals, this is a practical and industry-relevant combination.

## 2. Business modules of the DVD rental system

Before writing Java code, we should define the business requirements.

[Things Everyone Who Used to Go to Blockbuster Will Remember - Business Insider](https://images.openai.com/static-rsc-4/NhVRr0F__WZomKV1jwNZuYqYuEjzCAe1Tee4ACG9IcMlOadiCy8gvc6H2oqTv0gftKuT3nYnKnJE3B9qDcbZ818CY4w6ncPKmnrN7bDarUhB_5zuxLqBfSm1X4NOtIJqwOvWKNqPs-cKvjkKDVbD91WISSRdkEsKVr-Mz8bPuuw?purpose=inline)

Movie catalog

Customers browse movies, search by title, filter by genre, and view descriptions, actors, release dates, and rental prices.

[XXL-Videothek schließt: Sie ist eine der letzten ihrer Art in NRW](https://images.openai.com/static-rsc-4/CCN3r2CujLWmWo-pfUaw65vzAilUuxiFPOrfjKfAkoBS1ceshk1Y7HzwIlQQmH7_lA5mBOKdIzTIbQIer7U53z-AzPhKZ6mWajrxVI_MtZDMuHv_92X9VIiakUqy1if80xTgLh2qhkHFhhzYI_rv2btvZnd8arUmvG-xo9ruHS4?purpose=inline)

Rental and inventory management

Track physical DVD copies, availability, rental periods, due dates, returns, and overdue fees.

[Online Payment Systems and Credit Card Processing  | Global Payments](https://images.openai.com/static-rsc-4/DVmlPX2RALMOezqfSK-JY-YuFr3MF_dB92PUfOoMJEXx4RpMWQ0Yaf0xaRQbQDCgErusmGNiA4dxUMA4Hnm6NxlKxsDnWnKk5jhCwGGUVbbbFhsYIfWi_Q1pCd3CAyt2KlTEHKoZ0_RoNMdquBSRdyh9_hEUiviTNvOxQM_rUYg?purpose=inline)

Orders and payments

Customers place rental orders, view charges, pay through a payment provider, and track order status.

[Ruim de helft logistiek medewerkers wil liever een andere baan](https://images.openai.com/static-rsc-4/gbzPzxiVe_2aUqSLV2XBYxBWhJ3GCqaAuqpg3fW961CzJJB8ESlHWOOzIkHNoBIV4XZJY-gC1_k2_B3kl6eMtARap7VN0HVe57v_SMIi2TBVzwDYq7amsiEyLPOiasA-qhZN8dWMdHCjgUIM-pSF3oppVReLVbkhDVXgq40DETM?purpose=inline)

Administration

Staff manage movies, DVD copies, customers, rental records, returns, payments, and operational reports.

Other important modules include customer registration and login, role-based permissions, reservations, notifications, and reporting.

A critical design distinction is that a movie is not the same thing as a physical DVD copy. One movie may have ten physical copies, each with a unique inventory identifier. Your database and rental logic must represent this difference.

## 3. Recommended Java project structure

For professional development, I recommend package-by-feature, rather than placing every controller in one package and every service in another.

Here is a realistic project directory:

```

dvd-rental/
├── backend/
│   ├── pom.xml
│   └── src/
│       ├── main/
│       │   ├── java/com/example/dvdrental/
│       │   │   ├── DvdRentalApplication.java
│       │   │   ├── catalog/
│       │   │   │   ├── controller/
│       │   │   │   ├── service/
│       │   │   │   ├── repository/
│       │   │   │   ├── entity/
│       │   │   │   └── dto/
│       │   │   ├── inventory/
│       │   │   ├── rental/
│       │   │   ├── customer/
│       │   │   ├── payment/
│       │   │   ├── security/
│       │   │   └── common/
│       │   │       ├── exception/
│       │   │       └── config/
│       │   └── resources/
│       │       ├── application.yml
│       │       └── db/migration/
│       └── test/
├── frontend/
│   ├── package.json
│   └── src/
│       ├── components/
│       ├── pages/
│       ├── services/
│       └── routes/
├── compose.yaml
└── README.md

```

Within each business module, you still use the familiar Controller → Service → Repository layers.

For example, the `rental` module owns rental-related logic and data. The `catalog` module owns movie information.

This arrangement is compatible with the principles promoted by Spring Modulith, which can help verify module boundaries and detect unwanted dependencies. You do not need to install Spring Modulith immediately.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://spring.io\&sz=32)

Spring+1



## 4. Database design

A relational database is particularly suitable for a DVD rental business because customers, movies, physical copies, and rentals have well-defined relationships.

Illustrative entity relationship model. A rental can contain multiple DVD copies; each physical copy belongs to one movie.

The five core tables are:

| Table          | Responsibility                                      |
| -------------- | --------------------------------------------------- |
| `movies`       | Movie title, description, category, rental price    |
| `dvd_copies`   | Individual physical DVD inventory                   |
| `customers`    | Customer information                                |
| `rentals`      | Rental transaction and customer                     |
| `rental_items` | Which DVD copies are rented, due and return details |

Later, add `users`, `roles`, `payments`, `reservations`, and `audit_logs`.

Use foreign keys, indexes, database constraints, and Flyway migrations. For money, use `DECIMAL` in MySQL and `BigDecimal` in Java.

## 5. REST API design

Your frontend communicates with Spring Boot through HTTP requests and JSON responses.

| Method | Endpoint                           | Function                |
| ------ | ---------------------------------- | ----------------------- |
| GET    | `/api/v1/movies`                   | Browse movies           |
| GET    | `/api/v1/movies/{id}`              | Movie details           |
| POST   | `/api/v1/movies`                   | Add movie (admin)       |
| GET    | `/api/v1/movies/{id}/availability` | Check availability      |
| POST   | `/api/v1/rentals`                  | Create rental           |
| GET    | `/api/v1/rentals/{id}`             | Rental details          |
| POST   | `/api/v1/rentals/{id}/returns`     | Record a return         |
| GET    | `/api/v1/me/rentals`               | Customer rental history |

For example, a customer sends:

```
POST /api/v1/rentals
Content-Type: application/json
```

```
{
  "movieIds": [101, 205],
  "rentalDays": 7
}
```

The backend authenticates the customer, checks availability, allocates physical copies, calculates the charge, and creates the rental. The server must determine the customer identity and authoritative price rather than trusting values supplied by the browser.

## 6. How a rental works internally

This is one of the most important business workflows to understand.

1. Customer selects a movie

   React sends a rental request to Spring Boot.
2. RentalController validates the request

   Spring MVC receives JSON and checks the input.
3. RentalService applies business rules

   Check customer eligibility, inventory availability, and rental limits.
4. Inventory allocation

   Reserve an available physical copy using transaction-safe database operations.
5. RentalRepository persists the transaction

   Save the rental and associated items in MySQL.
6. Backend returns the result

   React displays the rental confirmation or payment instructions.

A simplified service method might look like:

```

@Service
public class RentalService {

    private final RentalRepository rentalRepository;
    private final InventoryService inventoryService;

    public RentalService(
            RentalRepository rentalRepository,
            InventoryService inventoryService) {
        this.rentalRepository = rentalRepository;
        this.inventoryService = inventoryService;
    }

    @Transactional
    public Rental rentMovie(
            Long customerId,
            Long movieId) {

        DvdCopy copy =
            inventoryService.allocateAvailableCopy(movieId);

        Rental rental = new Rental(
            customerId,
            copy.getId(),
            LocalDate.now(),
            LocalDate.now().plusDays(7)
        );

        return rentalRepository.save(rental);
    }
}

```

This is an educational illustration, not a complete implementation of the earlier multi-item API.

The `@Transactional` annotation helps ensure that database changes succeed or roll back together. However, it does not automatically prevent two customers from renting the same DVD copy simultaneously.

A production implementation must also use a suitable concurrency strategy, such as pessimistic row locking or an atomic conditional update, with integration tests proving that duplicate allocation cannot occur.

For online payment, you should normally create a pending reservation or order, then confirm payment through a verified payment-provider notification. Avoid holding a database transaction open while waiting for an external payment service.

## 7. Monolith versus microservices

You may have heard that large companies use microservices. But microservices are not automatically the best architecture.

| Architecture                 | Advantages                                    | Disadvantages                                                |
| ---------------------------- | --------------------------------------------- | ------------------------------------------------------------ |
| Traditional layered monolith | Simple, easy to learn                         | Can become tightly coupled                                   |
| Modular monolith             | Clear business boundaries, simpler deployment | Requires discipline to maintain module boundaries            |
| Microservices                | Independent deployment and scaling            | Distributed transactions, networking, operational complexity |

Recommended evolution

Phase 1

Layered Spring Boot

Learn fundamentals

Phase 2

Modular monolith

Professional structure

Phase 3

Microservices

Only when justified

For your DVD website, use one Spring Boot backend application with clearly separated modules. This teaches many of the same design principles needed for larger systems without adding unnecessary infrastructure.

## 8. Production deployment structure

You can deploy this application on a Linux server using Docker Compose.

Internet / Browser

HTTPS :443

Nginx

TLS termination / reverse proxy / static files

React frontend

Static web assets

Spring Boot

Internal port 8080

MySQL

Private Docker network / persistent volume

Simplified Docker Compose deployment. The browser calls the backend through Nginx, and MySQL is not publicly exposed.

Since you have already worked with Docker Compose, WordPress, and MySQL on Linux, you can reuse those deployment concepts for your Java application.&#x20;

For production readiness, also consider HTTPS, database backups, secrets management, application logs, health checks, dependency updates, monitoring, and automated tests.

## 9. Recommended development roadmap

I suggest implementing this website in six stages, gradually increasing its complexity.

Phase 1

Core Java backend

Spring Boot, MySQL, JPA, CRUD

Create movie entities and repositories · Implement movie CRUD REST APIs · Test with Postman or Swagger UI

Phase 2

Customer management

Authentication and authorization

Registration and login · Password hashing with Spring Security · Customer and admin roles

Phase 3

Rental business

Core application logic

Physical DVD inventory · Rental and return workflows · Transactions and concurrency tests

Phase 4

Frontend integration

React and TypeScript

Movie catalog and search · Customer account pages · Rental history and admin dashboard

Phase 5

Production engineering

Testing and deployment

Flyway, integration tests, API documentation · Docker Compose and Nginx · CI/CD, backups, logging, monitoring

Phase 6

Advanced architecture

Optional enhancements

Redis caching and pagination · Payment integration and notifications · Spring Modulith, domain events, performance testing

## 10. Industry concepts worth learning through this project

Beyond learning the Spring annotations, pay particular attention to these architectural concepts:

- Separation of concerns: Controllers handle HTTP, services handle business rules, repositories handle persistence.
- DTOs versus entities: Keep external API contracts separate from internal database models.
- Dependency injection: Let Spring manage component dependencies.
- Database transactions and concurrency: Preserve consistency when multiple users rent simultaneously.
- Security: Authentication, authorization, input validation, and ownership checks.
- Testing: Unit, integration, API, and concurrency tests.
- Domain-driven design (DDD): Organize code around business concepts rather than just technical layers.
- Observability: Use structured logs, metrics, and health endpoints to understand production behavior.

For further study, the official [Spring Boot documentation](https://docs.spring.io/spring-boot/reference/?utm_source=chatgpt.com), [Spring Data JPA documentation](https://docs.spring.io/spring-data/jpa/reference/?utm_source=chatgpt.com), and [Spring Modulith project](https://spring.io/projects/spring-modulith?utm_source=chatgpt.com) are useful references.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://docs.spring.io\&sz=32)

Home+1



My recommendation: Start by implementing the movie catalog, physical DVD inventory, and rental workflow as a single Spring Boot application. Build and test the REST API first, then add React. This will give you a manageable project while teaching the structure of a real Java backend system.

One important design choice remains: should your website be a physical DVD rental service, where customers borrow discs and return them, or a digital movie rental service, where customers pay to stream movies? The two share some business concepts but require substantially different inventory, delivery, and media architectures.
