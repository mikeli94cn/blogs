I recommend using a master project prompt that works with Claude Code, Cursor, and Codex. The prompt should specify not only the technology stack, but also the architecture, business rules, database design, testing requirements, and acceptance criteria.

For your physical DVD rental website, I would use a production-oriented modular monolith, with Spring Boot and React. The goal is to generate a complete, runnable application—not just demonstration code.

You can copy the following prompt directly into your AI coding tool.

# Master Prompt: Build a Full-Stack Physical DVD Rental Website

You are a senior Java backend architect, full-stack engineer, database designer, security engineer, and technical mentor.

Your task is to design and implement a complete physical DVD rental website named **DVD Rental System**, following mature, mainstream Java enterprise development practices.

The application should be suitable for learning professional Java backend development, demonstrating in a job portfolio, and eventually deploying to a Linux server.

## 1. Development objectives

Build a fully functional website where customers can:

- Register, log in, and manage their accounts.
- Browse and search a catalog of movies.
- View movie details and DVD availability.
- Rent physical DVD copies for a specified rental period.
- View their active rentals and rental history.
- Return DVDs through a staff-confirmed return workflow.
- See rental fees, due dates, and overdue charges.

Administrators and staff should be able to:

- Manage movies and genres.
- Manage individual physical DVD copies.
- Manage customers.
- Process rental orders and DVD returns.
- Monitor inventory and overdue rentals.
- View basic operational reports.

For the initial release, assume customers collect and return DVDs at a physical rental location. Do not implement shipping, logistics integrations, or real payment gateways in the MVP.

## 2. Technology stack

Use the following technologies:

**Backend**

- Java 21 LTS
- Spring Boot 3.x, using the latest compatible stable maintenance release
- Spring MVC
- Spring Security
- Spring Data JPA
- Hibernate
- Jakarta Bean Validation
- MySQL 8.4 LTS
- Flyway database migrations
- Maven
- JUnit 5
- Mockito
- Testcontainers
- Spring Boot Actuator
- OpenAPI / Swagger UI

**Frontend**

- React
- TypeScript
- Vite
- React Router
- Axios or native Fetch API
- A mature UI component library, preferably Ant Design

**Infrastructure**

- Docker
- Docker Compose
- Nginx
- GitHub Actions for CI

Before generating code, verify current framework compatibility. Do not assume the latest version of every dependency is mutually compatible. If Spring Boot 3.x is no longer the appropriate maintained choice, explain the tradeoff and select a compatible supported version without unnecessarily changing the Java 21 baseline.

## 3. Architecture

Use a **modular monolith**.

Do not use microservices, Kubernetes, Kafka, service discovery, or a distributed configuration server in the initial version.

Use package-by-feature organization with layered architecture inside each module.

Recommended modules:

- catalog: movies and genres
- inventory: physical DVD copies and availability
- customer: customer profiles
- identity: users, roles, and authentication
- rental: rental orders, rental items, and returns
- pricing: rental charges and overdue fee calculations
- reporting: operational reports
- common: shared technical infrastructure

Within modules, use controllers, application services, repositories, entities, DTOs, and mappers where appropriate.

Apply SOLID principles and separation of concerns, but avoid unnecessary abstractions and overengineering.

Controllers must not contain business logic. Repositories must not contain business rules. Do not expose JPA entities directly as API responses.

## 4. Database design

Design a normalized relational database using MySQL.

Include at least:

- users
- roles
- customers
- movies
- genres
- movie_genres
- dvd_copies
- rental_orders
- rental_items
- payments (only if needed for offline payment records)
- audit_logs (minimal implementation if useful)

Important distinction:

A movie represents a title. A DVD copy represents one physical inventory item.

One movie may have many DVD copies, each with its own barcode and lifecycle status.

Use:

- Primary and foreign keys
- Unique constraints
- Appropriate indexes
- Non-null constraints
- DECIMAL for money
- Java BigDecimal for monetary calculations
- Explicit lifecycle status enums
- Flyway migrations

Do not use Hibernate's automatic schema creation as the production database migration strategy.

Generate an ER diagram using Mermaid and document the main relationships.

## 5. Business rules

Implement these rules carefully:

1. Only authenticated customers can create rental orders.
2. Only available DVD copies can be allocated.
3. A physical DVD copy cannot be allocated to two active rentals simultaneously.
4. One rental order can contain multiple DVD copies.
5. Each rental item has a due date and optional actual return date.
6. Rental prices are calculated by the backend.
7. A returned DVD becomes available again only after staff confirmation and any required inspection.
8. Overdue charges are calculated using configurable business rules.
9. Customers can view only their own rentals.
10. Staff and administrators can process returns.
11. Only administrators can manage staff accounts and privileged configuration.
12. Invalid rental state transitions must be rejected.
13. Historical rental charges must remain stable if current prices change.
14. Inventory operations must be transaction-safe.
15. Define what happens when a DVD is damaged, lost, or under maintenance.

Use Spring's @Transactional appropriately.

Implement a concurrency-safe allocation strategy, such as pessimistic database locking or atomic conditional updates. Include an integration test proving that two concurrent requests cannot rent the same physical copy.

Clearly define order and inventory status transitions, and document them.

## 6. Security

Use Spring Security.

Implement:

- Customer registration
- Login and logout
- Secure password hashing
- Role-based authorization
- CUSTOMER, STAFF, and ADMIN roles
- Input validation
- Consistent error responses
- Secure configuration of CORS and CSRF
- Customer ownership checks
- Safe handling of secrets

Prefer secure HTTP-only session cookies for this same-origin web application. If another authentication mechanism is selected, explain why.

Do not store authentication tokens in localStorage.

Do not hardcode production credentials.

Provide a safe development-only method for creating initial staff and administrator accounts.

## 7. REST API

Design REST APIs under `/api/v1`.

Include endpoints for:

- Authentication
- Movie catalog and search
- Genre management
- Inventory availability
- Rental creation
- Rental details
- Customer rental history
- Staff-confirmed returns
- Administrative inventory management
- Basic reports

Use proper HTTP methods, status codes, request DTOs, response DTOs, and validation.

Support pagination, sorting, and filtering for collection endpoints.

Use a consistent error response format, preferably RFC 9457 Problem Details.

Document APIs with OpenAPI.

## 8. Frontend

Create a responsive React application.

Customer pages:

- Home
- Movie catalog
- Movie details
- Registration
- Login
- Shopping/rental cart
- Rental confirmation
- My rentals
- Account profile

Administrative pages:

- Dashboard
- Movie management
- DVD inventory management
- Rental management
- Return processing
- Customer management
- Overdue rental report

Implement loading, empty, success, and error states.

Protect administrative routes in the UI, while ensuring actual authorization is enforced by the backend.

Use TypeScript types for API requests and responses.

## 9. Testing

Implement meaningful automated tests.

**Unit tests**

- Rental price calculations
- Overdue fee calculations
- Rental status transitions
- Business rule validation

**Integration tests**

- JPA repositories
- MySQL persistence using Testcontainers
- REST APIs
- Authentication and authorization
- Rental creation and returns
- Concurrent DVD allocation

Use real MySQL through Testcontainers for database-specific behavior, especially locking tests.

Avoid replacing essential database integration tests with mocks.

## 10. Deployment

Provide:

- Backend Dockerfile
- Frontend production build
- Nginx configuration
- Docker Compose configuration
- MySQL persistent volume
- Environment variable examples
- Health checks
- Database migration startup instructions

Expose the public application through Nginx.

Keep MySQL private to the Docker network.

Do not expose development-only tools or debugging endpoints publicly.

Make the project deployable to a small Linux server, with reasonable memory usage and no unnecessary infrastructure.

## 11. Documentation

Generate:

- README.md
- docs/architecture.md
- docs/database.md
- docs/api.md
- docs/business-rules.md
- docs/deployment.md
- docs/testing.md
- docs/learning-guide.md

Explain the responsibilities of controllers, services, repositories, entities, DTOs, transactions, and security configuration.

In the learning guide, explain how important architectural decisions relate to professional Java backend development and common interview questions.

## 12. Development workflow

Follow this workflow:

**Step 1 — Inspect and plan**

Inspect the existing repository before changing files.

If the repository is empty, initialize the project.

Produce a concise implementation plan, architecture diagram, database model, module structure, and milestones.

Identify any important assumptions.

**Step 2 — Build the backend foundation**

Create the Spring Boot project, configure MySQL, Flyway, Spring Security, common error handling, and the movie catalog module.

**Step 3 — Implement core rental functionality**

Implement inventory, customer management, rental orders, rental items, return processing, pricing, and concurrency safety.

**Step 4 — Implement frontend**

Build the customer website and administrative interface. Integrate them with the real backend APIs.

**Step 5 — Test and verify**

Run compilation, unit tests, integration tests, frontend build, and any available static checks.

Fix problems before reporting success.

**Step 6 — Containerize and document**

Create Docker configuration, deployment instructions, API documentation, and final README.

## 13. Code quality requirements

- Write complete, runnable code.
- Do not generate pseudocode instead of implementation.
- Do not leave core functionality as TODO placeholders.
- Use constructor injection.
- Use clear names and consistent formatting.
- Avoid unnecessary dependencies.
- Avoid deprecated APIs.
- Use environment-specific configuration.
- Handle errors explicitly.
- Do not silently swallow exceptions.
- Do not claim tests passed unless they were actually executed.
- Do not claim the application runs unless it was verified.
- Never delete existing user data or overwrite important files without permission.

## 14. Acceptance criteria

The MVP is complete when:

1. A customer can register and log in.
2. An administrator can create movies and physical DVD copies.
3. A customer can browse available movies.
4. A customer can rent an available DVD.
5. Two customers cannot rent the same physical copy simultaneously.
6. A customer can view active and historical rentals.
7. A staff member can confirm a DVD return.
8. Returned copies become available according to inspection rules.
9. Overdue charges are calculated correctly.
10. Authorization prevents customers from accessing another customer's data.
11. Backend tests pass.
12. Frontend production build succeeds.
13. The application can start using Docker Compose.
14. The README provides working setup and verification instructions.

## 15. Instructions for the coding agent

Work autonomously, but communicate clearly.

Do not stop after creating only a project skeleton.

Implement the application incrementally and verify each milestone.

If a dependency, external service, or execution environment is unavailable, explain the limitation and continue with work that can be completed safely.

Prefer the simplest maintainable solution that satisfies the requirements.

After each major milestone, report:

- What was implemented
- Important files created or changed
- Commands executed
- Tests passed or failed
- Known limitations
- Next implementation step

At the end, provide a concise architecture overview, exact commands to run the application, test results, and a list of any incomplete acceptance criteria.

Begin by inspecting the repository and creating the implementation plan. Then proceed with the first milestone.

## How to use this prompt effectively

You can use the same master prompt in all three tools, but I recommend keeping the project requirements in a version-controlled file such as `docs/PROJECT_SPEC.md`. That way, you can change coding tools without losing the project's technical requirements.

For a large project, I would not ask the agent to implement everything in one uninterrupted run. Have it implement one milestone, run tests, commit the result, and then continue. This makes errors easier to find and reduces the risk of the AI changing previously working code.

Here is a short follow-up prompt you can use after each milestone:

Continue implementing the DVD Rental System according to `docs/PROJECT_SPEC.md`.

First inspect the current repository and Git status. Identify which acceptance criteria are already implemented and verified.

Select the next incomplete milestone and implement it using the established architecture and conventions.

Do not rewrite working modules unnecessarily. Add or update automated tests for the functionality you implement.

Run all relevant available tests and builds. Fix any failures introduced by your changes.

At the end, summarize the files changed, functionality completed, verification results, and remaining work. Do not claim success for tests or commands that were not executed.

One final suggestion: use the AI agent as an implementation partner, not as the architectural authority. Have it explain why it chooses a particular transaction strategy, database relationship, or Spring Security configuration. Those decisions are especially valuable for your Java backend learning and future interviews.
