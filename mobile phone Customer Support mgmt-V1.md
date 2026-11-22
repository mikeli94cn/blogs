# Java Customer Support &amp; Feedback Management System — Complete Development Roadmap

I recommend building a **Customer Support and Feedback Management System** for a B2C (Business-to-Consumer) company, such as a mobile phone manufacturer, retailer, or repair service provider.

The system will allow customers to submit product feedback, report problems, request after-sales support, track their cases, and communicate with customer service agents.

From the company's perspective, it will provide ticket management, customer management, agent assignment, service performance monitoring, and feedback analytics.

This is an excellent project for learning professional Java backend development because it involves real-world business workflows, database transactions, authentication, authorization, asynchronous processing, and system architecture.

I'll cover the architecture, technology stack, functional modules, database design, development phases, and a comprehensive prompt you can give to **Claude Code, Codex, or Cursor**\.

## 1\. Understand the business system

The system should support three major groups of users.

**Customer**

Submit feedback and track requests

**Support Agent**

Respond to and resolve tickets

**Administrator**

Manage agents, rules, and reports

---

Typical customer support workflow

### Example: Mobile phone customer complaint

A customer purchases a smartphone and discovers that the battery drains unusually quickly.

1. The customer logs in to the support website.
2. They select their phone model and report a battery problem.
3. They attach photos or screenshots.
4. The system generates ticket `TKT-2026-000123`\.
5. An agent reviews the complaint and requests additional information.
6. The customer responds through the ticket conversation.
7. The agent provides troubleshooting instructions or arranges a repair.
8. The customer confirms the issue is resolved and submits a satisfaction rating.

Every step is recorded, so the company can analyze product quality problems and support performance.

## 2\. Recommended Java technology stack

For your first implementation, use a **modular monolith architecture** rather than microservices. It is easier to develop, test, deploy, and maintain while still allowing future expansion.

| Layer | Recommended technology |
|--------|--------|
| Backend language | Java 21 LTS |
| Backend framework | Spring Boot 3.x or compatible current stable release |
| REST API | Spring Web MVC |
| ORM | Spring Data JPA + Hibernate |
| Database | MySQL 8 |
| Database migrations | Flyway |
| Authentication | Spring Security |
| Frontend | Vue 3 + TypeScript |
| UI components | Element Plus |
| API documentation | OpenAPI / Swagger UI |
| Validation | Jakarta Bean Validation |
| Mapping | MapStruct |
| Build | Maven |
| Testing | JUnit 5, Mockito, Testcontainers |
| Cache (later) | Redis |
| Messaging (later) | RabbitMQ |
| File storage | Local development storage, then S3-compatible object storage |
| Deployment | Docker Compose + Nginx |
| Monitoring (later) | Spring Boot Actuator, Prometheus, Grafana |

Use Java 21 and a mutually compatible Spring Boot release. The exact framework version should be checked by your coding agent before generating dependencies.

## 3\. System architecture

Logical architecture. All business modules initially run inside one Spring Boot application.

The backend should use a layered structure\:

```
Controller
   ↓
Application Service
   ↓
Domain Model / Business Rules
   ↓
Repository
   ↓
MySQL Database
```



For example, `TicketController` receives a request, `TicketService` validates the business rules, and `TicketRepository` persists the ticket.

Use feature-based packages, keeping controllers, services, DTOs, and persistence code close to their corresponding business module.

## 4\. Functional modules

I recommend dividing the system into ten modules, with the first six forming the MVP (minimum viable product).

| Module | Main features | Priority |
|--------|--------|--------|
| 1\. Identity &amp; Access | Registration, login, roles, permissions | MVP |
| 2\. Customer Management | Customer profiles, contact information | MVP |
| 3\. Product Management | Phone models, serial numbers, purchase details | MVP |
| 4\. Feedback Management | Suggestions, complaints, bug reports | MVP |
| 5\. Ticket Management | Ticket creation, assignment, status, priority | MVP |
| 6\. Support Conversation | Customer-agent messages, attachments | MVP |
| 7\. Notifications | Email, in-app notifications | Phase 2 |
| 8\. Knowledge Base | FAQs, troubleshooting guides | Phase 2 |
| 9\. SLA &amp; Escalation | Response deadlines, escalation rules | Phase 2 |
| 10\. Analytics &amp; Reports | Satisfaction, workload, resolution time | Phase 3 |

### Important business distinction

**Feedback** and **support tickets** are related, but they are not identical.

A feedback submission might be a product suggestion, compliment, bug report, or complaint. Some feedback only needs to be recorded and analyzed.

A support ticket represents a case that needs an agent's attention and resolution.

For example, a suggestion to improve camera software can remain feedback, while a complaint about a phone that will not charge can generate a support ticket.

Design these as separate business entities with an optional relationship.

## 5\. Database design

A practical initial relational database might contain the following tables.

| Table | Purpose |
|--------|--------|
| `users` | Authentication identities |
| `roles` | Customer, agent, administrator |
| `user_roles` | Role assignments |
| `customers` | Customer business profiles |
| `products` | Phone models and product catalog |
| `customer_devices` | Devices owned by customers |
| `feedback` | Suggestions, complaints, bug reports |
| `tickets` | Customer support cases |
| `ticket_messages` | Customer-agent conversations |
| `ticket_attachments` | Uploaded files |
| `ticket_events` | Status and assignment audit trail |
| `ticket_assignments` | Assignment history |
| `notifications` | Customer and agent notifications |
| `knowledge_articles` | Troubleshooting documentation |
| `sla_policies` | Service-level rules |
| `satisfaction_surveys` | Post-resolution ratings |

### Core database relationships

Simplified relationship diagram. Ticket references to feedback and customer devices should be nullable.

### Key `tickets` fields

```
CREATE TABLE tickets (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    ticket_number VARCHAR(40) NOT NULL UNIQUE,
    customer_id BIGINT NOT NULL,
    device_id BIGINT NULL,
    feedback_id BIGINT NULL,
    assigned_agent_id BIGINT NULL,
    subject VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(50) NOT NULL,
    priority VARCHAR(20) NOT NULL,
    status VARCHAR(30) NOT NULL,
    version BIGINT NOT NULL DEFAULT 0,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    resolved_at DATETIME(6) NULL,
    closed_at DATETIME(6) NULL
);
```



Flyway migrations should add foreign keys and appropriate indexes, including indexes for customer, assigned agent, status, and creation date.

The `version` column supports optimistic locking to prevent agents from silently overwriting concurrent changes.

## 6\. Ticket lifecycle design

A ticket should not allow arbitrary status changes.

OPEN

IN\_PROGRESS

WAITING\_CUSTOMER

Agent needs more information

WAITING\_INTERNAL

Waiting for another team

**RESOLVED**

**CLOSED**

Waiting states can return to IN\_PROGRESS. RESOLVED can be reopened when the issue persists, subject to business rules.

All transitions should be validated in the service layer and recorded in `ticket_events`\.

For example, only authorized support staff can mark a ticket resolved, and a customer should only be able to view tickets belonging to their own account.

## 7\. REST API design

Follow REST conventions, use `/api/v1` versioning, and keep API DTOs separate from JPA entities.

| Method | Endpoint | Description |
|--------|--------|--------|
| POST | `/api/v1/auth/register` | Register customer |
| POST | `/api/v1/auth/login` | Authenticate user |
| GET | `/api/v1/products` | List phone models |
| POST | `/api/v1/feedback` | Submit feedback |
| GET | `/api/v1/feedback/me` | Customer's feedback |
| POST | `/api/v1/tickets` | Create ticket |
| GET | `/api/v1/tickets/me` | Customer's tickets |
| GET | `/api/v1/tickets/{id}` | View authorized ticket |
| POST | `/api/v1/tickets/{id}/messages` | Add reply |
| POST | `/api/v1/tickets/{id}/attachments` | Upload attachment |
| PATCH | `/api/v1/tickets/{id}/status` | Update ticket status |
| PATCH | `/api/v1/tickets/{id}/assignment` | Assign agent |
| GET | `/api/v1/admin/tickets` | Search and filter tickets |
| GET | `/api/v1/admin/dashboard` | Support statistics |

Example request\:

```
POST /api/v1/tickets
Content-Type: application/json
Authorization: Bearer <access-token>
```



```
{
  "subject": "Phone battery drains quickly",
  "description": "Battery drops from 100% to 30% in 3 hours.",
  "deviceId": 123,
  "category": "BATTERY",
  "priority": "NORMAL"
}
```



The backend should derive `customerId` from the authenticated user, not accept it blindly from the request. Similarly, customers should not be allowed to grant themselves high-priority service or assign their own agents.

## 8\. Frontend application design

I suggest building two web portals using Vue 3 and Element Plus.



**Customer Support Portal**

Customers can register, select a product, submit feedback, create tickets, upload screenshots, communicate with agents, and check resolution progress.

---



**Agent and Administrator Portal**

Staff can review incoming tickets, filter by priority, assign cases, reply to customers, manage product categories, and monitor support performance.

These are visual references, not generated application screens.

For a mobile phone company's customer portal, use a responsive design so customers can submit complaints directly from their smartphones.

For the first version, a responsive website is sufficient. Later, you could develop an Android application or integrate customer support into an existing mobile app.

## 9\. Development roadmap

A realistic learning-oriented plan is approximately 10–14 weeks, depending on your experience and how much you delegate to AI coding tools.

### What to implement first

Your first working milestone should be a complete vertical slice\:

**Customer logs in → submits a complaint → agent sees the ticket → agent replies → customer views the reply → ticket is resolved.**

This is more valuable than generating dozens of database tables before the basic workflow works.

---

# 10\. Complete AI coding tools prompt

You can copy the following prompt directly into Claude Code, Codex, or Cursor.

It is designed to instruct the coding agent to act like a senior Java architect, produce a maintainable application, and implement it incrementally rather than generate an untested project all at once.

# AI Coding Agent Prompt: Customer Support and Feedback Management System

## 1. Your role

Act as a senior Java backend architect, full-stack engineer, database designer, security engineer, and technical lead.

Your task is to help me design, implement, test, document, and deploy a production-oriented Customer Support and Feedback Management System.

The application is intended for a B2C company, initially focusing on mobile phone manufacturers, retailers, and after-sales service providers.

I am also learning professional Java backend development, so use mainstream industry practices and explain important architectural decisions.

Do not generate the entire application blindly. Work incrementally, verify each milestone, and keep the application runnable.

## 2. Business objectives

Build a system where customers can:

- Register and log in.
- Maintain customer profiles.
- Browse supported products and phone models.
- Register their purchased devices.
- Submit feedback, suggestions, complaints, and bug reports.
- Create customer support tickets.
- Upload relevant screenshots or documents.
- Track ticket status.
- Communicate with support agents.
- Confirm resolution and provide satisfaction ratings.

Support agents can:

- Log in to an agent dashboard.
- View assigned tickets.
- Search and filter tickets.
- Respond to customers.
- Change ticket status according to business rules.
- Record internal notes.
- Escalate difficult issues.
- View relevant customer and device information.

Administrators can:

- Manage staff accounts and roles.
- Manage product catalogs and support categories.
- Assign and reassign tickets.
- Configure priorities and SLA policies.
- Manage knowledge-base articles.
- Review feedback trends.
- Monitor support workload and performance.

## 3. Required technology stack

Backend:

- Java 21
- Spring Boot, stable version compatible with Java 21
- Spring Web MVC
- Spring Security
- Spring Data JPA
- Hibernate
- MySQL 8
- Flyway
- Jakarta Bean Validation
- MapStruct
- Maven
- OpenAPI / Swagger UI
- JUnit 5
- Mockito
- Testcontainers

Frontend:

- Vue 3
- TypeScript
- Vite
- Vue Router
- Pinia
- Axios
- Element Plus

Infrastructure:

- Docker
- Docker Compose
- Nginx
- GitHub Actions for CI

Optional future technologies:

- Redis
- RabbitMQ
- S3-compatible object storage
- Prometheus and Grafana

Check dependency compatibility and avoid obsolete APIs.

## 4. Architecture requirements

Use a modular monolith architecture.

Follow:

- SOLID principles
- Separation of concerns
- Domain-oriented modularization
- Layered architecture within modules
- RESTful API design
- Dependency injection
- DTO-based API contracts
- Transaction management
- Centralized exception handling
- Structured logging
- Database schema versioning
- Automated testing

Avoid unnecessary microservices, distributed infrastructure, and speculative abstractions.

Recommended backend package organization:

com.example.customersupport\
common\
config\
security\
identity\
customer\
product\
feedback\
ticket\
notification\
knowledgebase\
sla\
reporting

Each business module should contain appropriate controller, application service, domain, DTO, mapper, and persistence components.

Keep module dependencies explicit and avoid circular dependencies.

## 5. Core domain model

Design the following entities:

User\
Role\
Customer\
Product\
CustomerDevice\
Feedback\
Ticket\
TicketMessage\
TicketAttachment\
TicketEvent\
TicketAssignment\
Notification\
KnowledgeArticle\
SlaPolicy\
SatisfactionSurvey

Important relationships:

- One customer can own multiple devices.
- One customer can submit multiple feedback records.
- One customer can create multiple tickets.
- A ticket may reference a customer device.
- A ticket may originate from a feedback record.
- A ticket may be assigned to one active agent at a time.
- A ticket contains multiple messages.
- A ticket maintains an immutable event history.
- A ticket can receive a satisfaction survey after resolution.

Use explicit foreign keys, appropriate indexes, audit timestamps, and optimistic locking where necessary.

Use Flyway SQL migrations for database schema management.

Do not use Hibernate automatic schema modification in production.

## 6. Ticket business workflow

Support the following ticket statuses:

OPEN\
IN_PROGRESS\
WAITING_CUSTOMER\
WAITING_INTERNAL\
RESOLVED\
CLOSED

Implement explicit status transition rules.

Record every transition in ticket_events.

Support:

- Ticket creation
- Ticket assignment
- Ticket reassignment
- Agent replies
- Customer replies
- Internal notes
- Ticket resolution
- Ticket reopening
- Ticket closure

Use transactional application services for state changes.

Ensure concurrent updates cannot silently overwrite each other.

## 7. Security requirements

Implement Spring Security using modern supported configuration APIs.

Support CUSTOMER, AGENT, and ADMIN roles.

Choose and document a secure authentication approach appropriate for a Vue SPA.

Requirements:

- Password hashing with a suitable adaptive algorithm
- Secure session or token handling
- Explicit authentication and authorization policies
- Object-level authorization
- Customers can access only their own tickets and feedback
- Agents can access only permitted support resources
- Internal notes must never be exposed to customers
- Admin functions require administrator permissions
- Input validation
- Safe error responses
- CORS restrictions
- CSRF protection where applicable
- Login rate limiting
- Secure file upload validation
- Audit logging

Do not hardcode credentials or secrets.

Use environment variables and documented local development configuration.

Avoid storing sensitive customer data unnecessarily.

## 8. REST API requirements

Use /api/v1 as the API prefix.

Implement APIs for:

Authentication\
Customer profiles\
Products\
Customer devices\
Feedback\
Tickets\
Ticket messages\
Ticket attachments\
Ticket assignment\
Knowledge-base articles\
Notifications\
Reporting

Use consistent response contracts.

Support pagination, filtering, and sorting for collection endpoints.

Return appropriate HTTP status codes.

Implement standardized error responses using Problem Details where appropriate.

Generate OpenAPI documentation.

Never expose JPA entities directly through REST controllers.

## 9. Frontend requirements

Create two responsive interfaces:

Customer Portal:

- Login and registration
- Customer profile
- Product/device registration
- Submit feedback
- Create ticket
- Ticket list
- Ticket details
- Conversation interface
- File attachments
- Satisfaction survey

Agent/Admin Portal:

- Login
- Ticket dashboard
- Ticket search and filters
- Ticket detail and conversation
- Ticket assignment
- Customer information
- Product management
- Knowledge-base management
- Agent management
- Reporting dashboard

Use Vue 3 Composition API with TypeScript.

Use Pinia for appropriate shared state.

Implement loading, empty, error, and success states.

Ensure responsive design and basic accessibility.

## 10. File upload requirements

Support customer screenshots and supporting documents.

Implement:

- Configurable file size limits
- Allowlisted file types
- Server-side content validation
- Generated storage identifiers
- Authorization checks for downloads
- Safe storage paths
- File metadata persistence

Do not expose arbitrary local file paths.

Keep the storage implementation replaceable so local development storage can later be migrated to S3-compatible object storage.

## 11. Testing requirements

Create meaningful automated tests.

Unit tests:

- Ticket state transitions
- Ticket assignment rules
- Permission rules
- Feedback validation
- Business service behavior

Integration tests:

- Repository persistence
- Flyway migrations
- Authentication and authorization
- Ticket creation
- Ticket conversation
- Concurrent ticket updates

Use Testcontainers with MySQL for integration tests.

Include negative tests for unauthorized access and invalid requests.

Do not claim tests passed unless they were actually executed.

## 12. Deployment requirements

Provide:

- Dockerfile for the backend
- Dockerfile or build setup for the frontend
- Docker Compose configuration
- MySQL service
- Nginx reverse proxy configuration
- Environment variable examples
- Health checks
- Persistent volumes where appropriate
- Startup and shutdown instructions

Avoid exposing the MySQL service publicly.

Provide clear instructions for Ubuntu development and Debian Linux deployment.

Keep development and production configuration separate.

## 13. Documentation requirements

Create:

README.md\
docs/architecture.md\
docs/database-design.md\
docs/api-design.md\
docs/security.md\
docs/deployment.md\
docs/development-roadmap.md

Document:

- System architecture
- Business workflows
- Database relationships
- REST API conventions
- Authentication design
- Deployment process
- Important architectural decisions

Provide Mermaid diagrams where useful.

## 14. Development strategy

Implement the project in milestones.

Milestone 1:\
Project skeleton, Docker Compose, MySQL, Flyway, basic health endpoint.

Milestone 2:\
Identity, authentication, authorization, customer profiles.

Milestone 3:\
Product catalog, customer devices, feedback management.

Milestone 4:\
Ticket management, lifecycle, assignment, audit history.

Milestone 5:\
Ticket messages, internal notes, file attachments.

Milestone 6:\
Vue customer portal and agent/admin portal.

Milestone 7:\
Integration tests, security review, Docker deployment.

Milestone 8:\
Notifications, SLA, knowledge base, satisfaction surveys, analytics.

For every milestone:

1. Explain the objective.
2. Identify files and modules to create or modify.
3. Implement the required functionality.
4. Add appropriate tests.
5. Run available build and test commands.
6. Fix verified failures.
7. Update documentation.
8. Summarize completed work.
9. Explain important design decisions.
10. Identify remaining tasks.

Never report an unexecuted test as successful.

Do not delete existing user data or overwrite configuration without confirmation.

## 15. Coding quality requirements

- Use readable, maintainable Java code.
- Prefer constructor injection.
- Avoid field injection.
- Use DTOs for API requests and responses.
- Use Java records where appropriate.
- Use meaningful domain exceptions.
- Keep controllers thin.
- Put business rules in application/domain services.
- Avoid unnecessary Lombok usage.
- Use explicit transaction boundaries.
- Avoid N+1 database queries.
- Use pagination for potentially large datasets.
- Avoid logging credentials or personal information.
- Keep configuration externalized.
- Use meaningful commit messages.

Prefer simple, well-tested solutions over unnecessary complexity.

## 16. First task

Begin by producing:

1. A detailed software requirements specification.
2. The proposed modular monolith architecture.
3. A Mermaid system architecture diagram.
4. A Mermaid entity relationship diagram.
5. A complete initial database table design.
6. A REST API inventory.
7. The proposed Maven project structure.
8. A milestone-based implementation plan.

Identify important assumptions and open business decisions.

After presenting the design, implement Milestone 1 only.

Make Milestone 1 runnable with Docker Compose and verify the Spring Boot application can connect to MySQL.

Do not proceed to Milestone 2 until I review the results.



---

## 11\. Suggested project repository

For this project, I recommend a single Git repository containing the backend, frontend, deployment configuration, and documentation.

```
customer-support-system/
├── backend/
│   ├── pom.xml
│   └── src/
│       ├── main/
│       │   ├── java/
│       │   └── resources/
│       │       ├── application.yml
│       │       └── db/migration/
│       └── test/
├── frontend/
│   ├── package.json
│   ├── src/
│   │   ├── api/
│   │   ├── components/
│   │   ├── views/
│   │   ├── stores/
│   │   └── router/
│   └── public/
├── deploy/
│   └── nginx/
├── docs/
├── compose.yaml
├── .env.example
├── .gitignore
└── README.md
```



### Running the project with AI coding tools

Since you are using Claude Code, Codex, and Cursor, you can use any one of them to start the project.

```
mkdir customer-support-system
cd customer-support-system
git init
```



Then launch your preferred tool\:

**Claude Code** Terminal agent

```
claude
```



---

**OpenAI Codex** Terminal agent

```
codex
```



---

**Cursor** IDE-based agent

Open the project folder in Cursor, start an Agent conversation, and paste the prompt.

Use one tool as the primary implementation agent and the others for code review or debugging. This reduces the risk of conflicting edits.

## 12\. Future evolution into an enterprise support platform

Once the MVP is stable, the system could evolve toward capabilities found in professional platforms such as Zendesk, Freshdesk, or Salesforce Service Cloud\.



**Omnichannel support**

Combine website forms, email, live chat, mobile app feedback, and other channels into a unified ticket queue.

---



**Advanced analytics and SLA**

Measure first response time, resolution time, overdue tickets, customer satisfaction, and recurring phone defects.

---



**AI-assisted customer support**

Introduce knowledge-base search, ticket classification, suggested agent responses, and AI-assisted troubleshooting with human review.

A particularly useful future feature for a mobile phone business is **product quality analytics**\. By linking complaints to specific phone models, manufacturing batches, software versions, and purchase dates, the company could detect recurring defects rather than simply resolve individual tickets.

## 13\. Architecture decisions to finalize

Before implementation, these are the most important product decisions.

What type of B2C business will use the system?

Mobile phone manufacturer

Mobile phone retailer

Phone repair service company

General B2C company (multi-industry)

---

How should customers submit feedback initially?

Website / mobile browser

Website + mobile app API

Website + email + live chat

---

Expected initial scale

Small business (1–10 support agents)

Medium business (10–100 agents)

Enterprise / multiple departments

[Customize my architecture and coding prompt]

**My recommended starting point\:** a responsive customer website, an internal agent dashboard, a Java 21 + Spring Boot backend, and MySQL. Build the complete ticket workflow first, then add email notifications, SLA management, analytics, and AI features.

This gives you a realistic professional Java project without making the first implementation unnecessarily complicated.
