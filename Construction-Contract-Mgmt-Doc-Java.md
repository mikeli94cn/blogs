# **Construction Contract Management System — Complete Java Enterprise Architecture**

A **Construction Contract Management System (CCMS)** is an enterprise application used by construction companies to manage the complete lifecycle of construction contracts, from initial drafting and approval through execution, payments, changes, and final settlement.

I recommend building this project as a **production-oriented Java enterprise application**, using mature architectural patterns similar to those found in commercial construction management and enterprise contract management software.

The goal is not simply to build a CRUD application (Create, Read, Update, Delete). It is to learn how real enterprise systems handle business workflows, financial records, authorization, document management, and complex relationships between modules.

## **1. Understanding the business system**

[建設業の契約で押さえるべき法律知識とは？ | 現場監督をはじめ全職種で役立つ建設業の基本知識 | 蔵衛門.com](https://images.openai.com/static-rsc-4/Yl69o6q4lzxrShoW1goD-9Si5Qj0RQnXshanOMgPyS7_Ya8x-PgEUwSIULCW_QnBfXktuc-ImxJ5XNzrzI-5ux20rZlg2ltW_rwKPRpBYlbbGYrAlzCuYY6tu4vgUMgx7JK-pvTs1CHnucrNOTqEDBH_CVdqhxw21XH8ZyskTYQ?purpose=inline)

[Change management in construction – additions and deductions — Buildit AS](https://images.openai.com/static-rsc-4/y5-6Wo_IexdnptXCRNeXuQBWWfMFmuI8ySHhKrMBzBuNJM1rlZvsQJxDAmEqaZJx1UThuWvJ6G_1JkneL56OQ16FCmqgCRh2KEGWkqfllRMsm25AhQqBYpxHlsO03E0ZdZYDhvIxFMic0EvvbUXRqynSxlyr7puvqMh7w2Vi3tM?purpose=inline)

[Conclusion of a business contract for construction. Hiring an engineer](https://images.openai.com/static-rsc-4/vIUqraCFU-8wqwnoFWCtvF0KFBQuRsvTU-gcysvv_deIELVloB9FRXcQpa9Nxynuo7_eWjEgja5hwJV7iDpxOWDY-REGdc7qA46u85M57cJRZWW7S-lGsOlxvWBL4lnrwyP-w-6RSNg6rxl6gZ7qDB-Rqe6Z8u4YVshztbeFqvF0Y0MpsiX1-oMC8_ZvM0DK?purpose=inline)

9

A construction company typically manages multiple projects. Each project may involve many contracts, including contracts with clients, subcontractors, material suppliers, equipment rental companies, and consultants.

For example, consider a company building a residential apartment complex.

**Construction Company**

ABC Construction Ltd.

**Construction Project**

Residential Apartment Project

Budget: $20 million

Main Contract

Client • $20M

Subcontracts

Labor • $6M

Supply Contracts

Materials • $5M

Service Contracts

Consulting • $1M

Illustrative contract values, not an actual project budget breakdown.

Each contract may have its own approval process, contractual obligations, payment schedule, amendments, attachments, and settlement process.

A well-designed CCMS manages these relationships in one consistent system.

## **2. Functional modules — what should the system contain?**

A mature construction contract management system can be organized into 12 business modules.

| Module                    | Main responsibilities                      | Priority |
| ------------------------- | ------------------------------------------ | -------- |
| 1. Organization & Users   | Departments, employees, roles, permissions | Core     |
| 2. Project Management     | Projects, budgets, project members         | Core     |
| 3. Business Partners      | Clients, suppliers, subcontractors         | Core     |
| 4. Contract Management    | Contract creation, terms, lifecycle        | Core     |
| 5. Approval Workflow      | Review, approve, reject, return            | Core     |
| 6. Document Management    | Attachments, versions, templates           | Core     |
| 7. Change Orders          | Variations, amendments, adjustments        | High     |
| 8. Payment Management     | Applications, certificates, payments       | High     |
| 9. Financial Settlement   | Final accounts, retention, reconciliation  | High     |
| 10. Obligation Management | Milestones, deadlines, guarantees          | High     |
| 11. Reporting & Analytics | Contract value, payments, exposure         | Medium   |
| 12. Audit & Notifications | Activity history, reminders, alerts        | High     |

### **Important domain distinctions**

Construction contract management differs from a generic sales-contract system in several ways.

**Change orders:** Construction contracts frequently change after execution. A change order may increase or decrease the contract price, alter the scope, or extend the completion date.

**Progress payments:** A subcontractor might receive payments based on certified work completed, rather than a fixed invoice schedule.

**Retention:** A portion of an approved payment may be withheld until certain completion or defect-liability conditions are satisfied.

**Final settlement:** The final agreed amount may differ from the original contract amount because of approved variations, adjustments, and claims.

These concepts should influence the database and service architecture from the beginning.

## **3. Recommended technology stack**

For a new Java enterprise project, I recommend the following technologies.

| Layer             | Recommended technology                           | Purpose                             |
| ----------------- | ------------------------------------------------ | ----------------------------------- |
| Frontend          | Vue 3 + TypeScript                               | Web interface                       |
| UI library        | Element Plus                                     | Tables, forms, dialogs              |
| Backend           | Java 21 LTS + Spring Boot 3.5.x or supported 4.x | Enterprise application              |
| REST API          | Spring Web MVC                                   | HTTP endpoints                      |
| Security          | Spring Security                                  | Authentication and authorization    |
| Persistence       | Spring Data JPA + Hibernate                      | Database access                     |
| Database          | MySQL 8.4 LTS                                    | Transactional business data         |
| Schema migration  | Flyway                                           | Version-controlled database changes |
| Validation        | Jakarta Bean Validation                          | Input validation                    |
| API documentation | springdoc-openapi, compatible version            | OpenAPI / Swagger UI                |
| File storage      | S3-compatible object storage                     | Contract documents                  |
| Cache             | Redis, optional                                  | Caching and temporary data          |
| Workflow          | Flowable, optional                               | Complex approval processes          |
| Testing           | JUnit 5, Mockito, Testcontainers                 | Automated tests                     |
| Build             | Maven                                            | Dependencies and packaging          |
| Deployment        | Docker Compose + Nginx                           | Initial deployment                  |
| CI/CD             | GitHub Actions or GitLab CI                      | Automated build and deployment      |
| Monitoring        | Spring Boot Actuator + Micrometer                | Health and metrics                  |

For a learning project, you do not need to install all these components immediately.

**My recommendation:** Begin with Java 21, Spring Boot, Spring Security, Spring Data JPA, MySQL, Flyway, and Vue 3. Introduce other infrastructure when a concrete requirement appears.

### **Why a modular monolith instead of microservices?**

One Spring Boot App

Contract

Project

Payment

Approval

Modular Monolith

One deployable application with clear module boundaries

Contract

Project

Payment

Approval

Microservices

Independently deployed services communicating over a network

A modular monolith is particularly appropriate because contract approval, change orders, payments, and settlement require strong transactional consistency.

It offers:

- Simpler development, testing, and deployment.
- Easier database transactions.
- Lower infrastructure and operational costs.
- Clear business boundaries that can support later service extraction.

Microservices are not inherently more mature. They become useful when organizational scale, independent deployment requirements, or workload isolation justify their additional complexity.

## **4. Complete enterprise system architecture**

I recommend a five-layer logical architecture with supporting infrastructure.

Presentation Layer

Vue 3 · TypeScript · Element Plus

Project pages · Contract forms · Approval inbox · Dashboards

HTTPS / REST / JSON

API & Security Layer

Spring MVC · Spring Security · Validation

Authentication · Authorization · DTOs · Exception handling

Application & Domain Layer

Project

Contract

Partner

Approval

Change Order

Payment

Settlement

Document

Reporting

Business rules · Transactions · Domain events

Persistence & Integration Layer

Spring Data JPA · Hibernate · Flyway · Storage adapters

MySQL

Business data

Object Storage

Contract files

Redis

Optional cache

Security

Audit

Monitoring

Notifications

### **How a typical request works**

Suppose a contract manager submits a new contract for approval.

1. **Vue frontend** sends `POST /api/v1/contracts/{id}/submit`.
2. **Spring Security** authenticates the user and checks the user's permission to submit this contract.
3. **ContractController** validates the request and calls the application service.
4. **ContractApplicationService** checks business rules: the contract is in DRAFT, required fields are present, and an appropriate approval process exists.
5. **Persistence layer** updates the contract state and creates the approval instance within one database transaction.
6. **Notification module** processes an event to inform the designated approver.
7. **REST API** returns the new contract status and approval information to the frontend.

This is a realistic enterprise workflow. The controller should not directly implement approval logic or modify the database without passing through the application and domain layers.

## **5. Java project structure**

There are two common ways to organize Spring Boot applications: by technical layer or by business feature.

For a growing enterprise system, I recommend **package by feature**, with consistent internal layers inside each module.

### **Recommended directory structure**

**Backend project structure**

&#x20;Copy

construction-contract-management/\
├── backend/\
│   ├── pom.xml\
│   └── src/main/\
│       ├── java/com/example/ccms/\
│       │   ├── CcmsApplication.java\
│       │   ├── common/\
│       │   ├── security/\
│       │   ├── organization/\
│       │   ├── project/\
│       │   ├── partner/\
│       │   ├── contract/\
│       │   │   ├── api/\
│       │   │   ├── application/\
│       │   │   ├── domain/\
│       │   │   └── infrastructure/\
│       │   ├── approval/\
│       │   ├── changeorder/\
│       │   ├── payment/\
│       │   ├── settlement/\
│       │   ├── document/\
│       │   ├── notification/\
│       │   └── reporting/\
│       └── resources/\
│           ├── application.yml\
│           └── db/migration/\
├── frontend/\
├── deploy/\
├── docs/\
└── README.md

### **Inside the contract module**

```
contract/
├── api/
│   ├── ContractController.java
│   ├── request/
│   │   ├── CreateContractRequest.java
│   │   └── UpdateContractRequest.java
│   └── response/
│       └── ContractResponse.java
│
├── application/
│   ├── ContractApplicationService.java
│   ├── ContractQueryService.java
│   └── command/
│       └── CreateContractCommand.java
│
├── domain/
│   ├── Contract.java
│   ├── ContractStatus.java
│   ├── ContractType.java
│   ├── ContractRepository.java
│   └── ContractDomainService.java
│
└── infrastructure/
    └── persistence/
        ├── ContractJpaRepository.java
        ├── ContractJpaEntity.java
        └── ContractRepositoryAdapter.java
```

This structure follows ideas from Domain-Driven Design (DDD) and ports-and-adapters architecture.

You do not need to implement every abstraction on day one. For a smaller module, a JPA entity and Spring Data repository may be sufficient. As domain complexity grows, separating business objects from persistence objects can become worthwhile.

### **Responsibilities of each layer**

| Layer          | Responsibility                                        |
| -------------- | ----------------------------------------------------- |
| API            | Receive HTTP requests and return responses            |
| Application    | Coordinate use cases, transactions, and other modules |
| Domain         | Enforce business rules and state transitions          |
| Infrastructure | Database, file storage, external integrations         |

For example, the rule *"an executed contract cannot be deleted"* belongs in the business domain, not merely in a Vue button's visibility condition.

## **6. Database design — the foundation of the system**

This is one of the most important parts of your project.

A construction contract management system has many related entities. I recommend a relational database because contracts, approvals, payment records, and change orders require referential integrity and reliable transactions.

### **6.1 Core entity relationship diagram**

Conceptual simplified ER diagram. Actual implementation includes junction tables, approval steps, payment lines, document versions, and additional relationships.

A project can contain multiple contracts. Each contract may reference a business partner, have multiple change orders, payment applications, approval instances, and documents.

### **6.2 Recommended database tables**

Organize tables by business domain rather than placing everything into one enormous contract table.

| Domain       | Important tables                                                                        |
| ------------ | --------------------------------------------------------------------------------------- |
| Identity     | `users`, `roles`, `permissions`, `user_roles`, `role_permissions`                       |
| Organization | `organizations`, `departments`, `organization_members`                                  |
| Projects     | `projects`, `project_members`, `project_budgets`                                        |
| Partners     | `partners`, `partner_contacts`, `partner_qualifications`                                |
| Contracts    | `contracts`, `contract_parties`, `contract_terms`, `contract_milestones`                |
| Approvals    | `approval_definitions`, `approval_instances`, `approval_tasks`, `approval_actions`      |
| Changes      | `change_orders`, `change_order_items`                                                   |
| Payments     | `payment_applications`, `payment_application_items`, `payment_certificates`, `payments` |
| Settlement   | `final_accounts`, `retention_transactions`                                              |
| Documents    | `documents`, `document_versions`, `document_links`                                      |
| Compliance   | `contract_obligations`, `insurance_records`, `guarantees`                               |
| System       | `audit_logs`, `notifications`, `outbox_events`                                          |

These are proposed logical tables, not a mandatory industry-wide database standard. Different construction companies will need different schemas.

### **6.3 The contracts table**

A simplified MySQL design:

```
CREATE TABLE contracts (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,

    contract_number VARCHAR(64) NOT NULL,
    project_id BIGINT NOT NULL,

    title VARCHAR(255) NOT NULL,
    contract_type VARCHAR(40) NOT NULL,
    status VARCHAR(40) NOT NULL,

    original_amount DECIMAL(19, 2) NOT NULL,
    currency CHAR(3) NOT NULL,

    signed_date DATE,
    effective_date DATE,
    planned_completion_date DATE,

    description TEXT,

    created_by BIGINT NOT NULL,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,

    version BIGINT NOT NULL DEFAULT 0,

    CONSTRAINT uk_contract_number
        UNIQUE (contract_number),

    CONSTRAINT fk_contract_project
        FOREIGN KEY (project_id)
        REFERENCES projects(id),

    CONSTRAINT fk_contract_creator
        FOREIGN KEY (created_by)
        REFERENCES users(id),

    CONSTRAINT chk_contract_amount
        CHECK (original_amount >= 0)
);
```

Important design choices:

**DECIMAL instead of DOUBLE:** Financial amounts require decimal precision. In Java, use `BigDecimal`, not `double`.

**Version column:** Supports optimistic locking, helping detect conflicting updates by multiple users.

**Contract number:** A business identifier such as `CON-2026-000123`, separate from the internal database primary key.

**Foreign keys:** Prevent invalid references between contracts, projects, and users.

**Contract parties:** Store parties and their roles separately, because a contract may have more than two participating organizations.

**Financial history:** Avoid storing only a single mutable "current amount." Retain original contract value and approved adjustments so the financial position can be reconstructed.

For a multi-company SaaS product, tenant isolation must also be designed explicitly, typically with tenant-aware keys and access policies or separate databases.

### **6.4 Change order table**

```
CREATE TABLE change_orders (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,

    contract_id BIGINT NOT NULL,
    change_number VARCHAR(64) NOT NULL,

    title VARCHAR(255) NOT NULL,
    description TEXT,

    amount_delta DECIMAL(19, 2) NOT NULL,
    currency CHAR(3) NOT NULL,

    status VARCHAR(40) NOT NULL,
    approved_at DATETIME(6),

    version BIGINT NOT NULL DEFAULT 0,

    CONSTRAINT fk_change_contract
        FOREIGN KEY (contract_id)
        REFERENCES contracts(id),

    CONSTRAINT uk_change_number
        UNIQUE (contract_id, change_number)
);
```

A change order can have a positive, negative, or zero financial adjustment.

For example:

Example: Contract financial position

| Original contract value    | $1,000,000     |
| -------------------------- | -------------- |
| Approved change order A    | +$80,000       |
| Approved change order B    | −$20,000       |
| **Revised contract value** | **$1,060,000** |

Pending or rejected changes must not affect the approved revised contract value.

The corresponding calculation is:

\\[ \text{Revised Value}=\text{Original Value}+\sum \text{Approved Changes} \\]

For advanced financial accuracy, maintain a versioned contract-value ledger or approved adjustment records, with effective dates and traceable sources.

### **6.5 Payment database model**

Payment management deserves a separate design because the following are not equivalent:

- A contractor requests payment.
- A project manager certifies the amount payable.
- An invoice is received or issued.
- The finance department actually pays the money.

A practical model uses `payment_applications`, `payment_certificates`, `invoices`, `payments`, and `payment_allocations` (linking actual payments to certified amounts or invoices).

For a construction system, you may also need retention, advance payments, deductions, taxes, and cumulative work-to-date values.

Never treat an approved payment application as proof that money has been paid.

## **7. Contract lifecycle and workflow design**

Contract management is fundamentally a **state-driven business system**.

A contract does not simply exist or not exist. It passes through a lifecycle with controlled transitions.

**DRAFT**

Contract preparation

**PENDING_APPROVAL**

Internal review

Approved

**APPROVED**

Authorized for signing

**EXECUTED**

Signed and legally executed

**ACTIVE**

Work and payments in progress

COMPLETED

Obligations fulfilled

TERMINATED

Early termination

After completion: final settlement, closeout, and archival

This is a simplified workflow. Real contracts can be returned for revision, rejected, suspended, disputed, or terminated early. Financial settlement and closeout may also have separate statuses.

### **Approval workflow**

For example, a high-value subcontract might require:

1. Project Manager reviews scope and pricing.
2. Legal Department reviews contractual clauses.
3. Finance Department checks budget availability.
4. Authorized Director provides final approval.

You have two implementation options.

| Approach                      | When to use                                                 |
| ----------------------------- | ----------------------------------------------------------- |
| Custom approval state machine | Small, predictable, fixed workflows                         |
| Flowable BPMN workflow engine | Configurable, multi-stage, conditional, delegated approvals |

**Recommendation:** Start with a simple custom workflow to understand the underlying business rules. Later, integrate Flowable when approval routing needs to be configurable.

An approval engine should not be responsible for enforcing all contract rules. The contract domain still controls whether a transition is legally and operationally valid.

## **8. REST API design**

Your backend should expose versioned REST APIs for the frontend and future integrations.

### **Contract APIs**

| Method | Endpoint                         | Purpose                   |
| ------ | -------------------------------- | ------------------------- |
| `POST` | `/api/v1/contracts`              | Create contract           |
| `GET`  | `/api/v1/contracts`              | Search and paginate       |
| `GET`  | `/api/v1/contracts/{id}`         | Get contract details      |
| `PUT`  | `/api/v1/contracts/{id}`         | Update draft contract     |
| `POST` | `/api/v1/contracts/{id}/submit`  | Submit for approval       |
| `POST` | `/api/v1/contracts/{id}/execute` | Record contract execution |
| `GET`  | `/api/v1/contracts/{id}/history` | View lifecycle history    |

### **Other business APIs**

```
/api/v1/projects
/api/v1/partners
/api/v1/approvals
/api/v1/change-orders
/api/v1/payment-applications
/api/v1/payment-certificates
/api/v1/payments
/api/v1/final-accounts
/api/v1/documents
/api/v1/reports
```

Example contract creation request:

```
{
  "projectId": 1001,
  "title": "Electrical Installation Subcontract",
  "contractType": "SUBCONTRACT",
  "originalAmount": 850000.00,
  "currency": "USD",
  "plannedCompletionDate": "2027-06-30"
}
```

A typical success response might be:

```
{
  "id": 2001,
  "contractNumber": "CON-2026-000123",
  "status": "DRAFT",
  "version": 0
}
```

For production quality, also implement pagination, filtering, sorting, consistent error responses using Problem Details (RFC 9457), validation, and optimistic concurrency control.

Use OpenAPI documentation so both human developers and AI coding tools can understand the API contract.

## **9. Security architecture**

Security is especially important because contract documents, pricing, subcontractor information, and payment records are commercially sensitive.

### **Authentication**

For the initial project, Spring Security with server-side sessions and secure HTTP-only cookies is a reasonable choice for a browser-based application.

For enterprise SSO, use an OpenID Connect identity provider such as Keycloak, Microsoft Entra ID, or another corporate identity platform.

JWT is useful in appropriate API architectures, but it is not automatically better than sessions.

### **Authorization**

Use two levels of authorization:

**Role-Based Access Control (RBAC)** defines general capabilities.

| Role             | Example permissions                      |
| ---------------- | ---------------------------------------- |
| Administrator    | Manage users and configuration           |
| Contract Manager | Create, edit, and submit contracts       |
| Project Manager  | Review project-related contracts         |
| Legal Reviewer   | Review contractual terms                 |
| Finance Officer  | Review payment and financial records     |
| Director         | Approve within delegated authority       |
| Auditor          | Read permitted records and audit history |

**Resource-level authorization** determines which specific projects and contracts a user may access.

For example, a Project Manager assigned to Project A must not automatically see confidential contracts belonging to Project B.

Other essential controls include document-level authorization, approval delegation limits, encryption in transit, secure credential handling, file malware scanning, audit trails, and database backups.

For a multi-tenant product, tenant isolation is a critical security boundary, not just a frontend filter.

## **10. Financial integrity and audit architecture**

This is where a basic CRUD demo becomes a credible enterprise system.

### **Financial rules**

A mature system should enforce rules such as:

1. Only approved change orders affect the revised contract value.
2. Payment certificates cannot exceed authorized limits unless an explicit exception rule applies.
3. Payment allocations cannot exceed the available amount being settled.
4. Retention deductions and releases must be traceable.
5. Approved financial transactions must not be silently rewritten.
6. Reversals and corrections must preserve the original financial history.

### **Concurrency**

Imagine two finance officers trying to certify payment against the same contract simultaneously.

Without concurrency control, both requests might independently pass validation and create an over-certification.

Use database transactions, optimistic locking, and where necessary row-level locks or serialized financial posting logic.

### **Audit trails**

Record important actions with:

- Actor and timestamp.
- Business object and identifier.
- Action and previous/new state.
- Reason or approval comment.
- Request correlation ID.
- Relevant document version or financial transaction reference.

For important financial events, store immutable business transaction records in addition to general application audit logs.

### **Reliable notifications**

A common production pattern is the **transactional outbox**.

When a contract is approved, the application writes both the approval result and an event into the same MySQL transaction. A background worker later processes the event to send notifications.

This avoids losing an approval event if the application crashes immediately after committing the contract update.

## **11. Document management architecture**

Construction contracts frequently include large collections of documents: signed contracts, drawings, specifications, insurance certificates, change orders, and payment supporting evidence.

Do not store large document binaries directly in the contracts table.

A common architecture is:

**Vue Frontend**

Upload contract PDF

**Spring Boot Document Service**

Authorization · Validation · Metadata · Malware scanning

**MySQL**

File metadata, versions, ownership

**Object Storage**

Actual PDF and document bytes

A document version should include the object key, original filename, MIME type, byte size, checksum, uploader, and upload time.

Keep document versions immutable after finalization. Signed contracts should remain retrievable even when later amendments exist.

For your first version, local private file storage can work. For a more realistic deployment, use S3-compatible object storage, with controlled access and lifecycle policies.

## **12. Frontend architecture**

For a Java enterprise project, Vue 3 + TypeScript + Element Plus is a practical frontend stack, particularly for form-heavy management applications.

Suggested frontend structure:

```
frontend/src/
├── api/
│   ├── contract.ts
│   ├── project.ts
│   └── payment.ts
├── components/
│   ├── ContractStatusBadge.vue
│   ├── MoneyDisplay.vue
│   └── DocumentUploader.vue
├── views/
│   ├── dashboard/
│   ├── projects/
│   ├── contracts/
│   ├── approvals/
│   ├── change-orders/
│   ├── payments/
│   └── reports/
├── router/
├── stores/
├── types/
├── utils/
└── main.ts
```

A useful contract detail page would contain tabs for overview, parties, terms, documents, approvals, changes, payments, obligations, and history.

Contract Detail

CON-2026-000123

Active

## **Electrical Installation Subcontract**

Original Value

## **$850,000**

Revised Value

## **$910,000**

OverviewChangesPaymentsDocuments

| Project    | Residential Apartment |
| ---------- | --------------------- |
| Contractor | ABC Electrical Ltd.   |
| Start Date | Jan 15, 2027          |
| Completion | Jun 30, 2027          |

Illustrative UI concept with sample data.

## **13. Development roadmap — from beginner project to enterprise application**

I suggest dividing development into six phases. Each phase should produce a working application rather than leaving the entire project unfinished until the end.

## **01**

**Foundation & Infrastructure**

1–2 weeks

Create Spring Boot and Vue projects

Configure MySQL, Flyway and Docker Compose

Implement authentication, users and roles

Add API documentation, error handling and automated tests

Milestone: Users can log in and access protected pages.

## **02**

**Core Contract Management**

2–3 weeks

Create project and business partner modules

Implement contract CRUD and searching

Add contract types, status and lifecycle rules

Implement project-level access control

Milestone: Users can create and manage draft contracts.

## **03**

**Approvals & Documents**

2–3 weeks

Build approval tasks and decision history

Implement submit, approve, reject and return

Add document upload and version history

Implement approval notifications and audit logs

Milestone: Contracts can be reviewed, approved and documented.

## **04**

**Construction Financial Workflows**

3–4 weeks

Implement change orders and revised contract values

Build progress payment applications and certificates

Record actual payments and retention

Implement basic final settlement

Milestone: Users can track contract changes and financial progress.

## **05**

**Reporting & Advanced Features**

2–3 weeks

Build dashboards and financial reports

Add contract milestones and deadline reminders

Introduce configurable approval workflows if needed

Add export, search and performance optimizations

Milestone: Managers can monitor project contract performance.

## **06**

**Production Readiness**

2–3 weeks

Integration and end-to-end testing

Security and concurrency testing

Docker deployment with Nginx and HTTPS

Backups, monitoring, logging and CI/CD

Milestone: A deployable, tested application with operational documentation.

Estimated total: approximately 12–18 weeks for a focused learning project with AI assistance. This is a planning estimate, not a guaranteed delivery schedule; production requirements and available development time can change it substantially.

### **Recommended MVP scope**

Your first Minimum Viable Product (MVP) should contain just six capabilities: login and permissions, projects, business partners, contracts, simple approvals, and document attachments.

Complete these before introducing advanced financial accounting, workflow engines, or microservices.

## **14. Testing strategy**

Industry-grade software is not defined only by how many features it has. It must also behave correctly under failure, concurrency, and invalid input.

| Test type         | Tools                            | What to verify                           |
| ----------------- | -------------------------------- | ---------------------------------------- |
| Unit tests        | JUnit 5, Mockito                 | Contract rules and calculations          |
| Integration tests | Spring Boot Test, Testcontainers | Real MySQL persistence and transactions  |
| API tests         | MockMvc or RestAssured           | HTTP requests, validation, authorization |
| Frontend tests    | Vitest                           | Vue components and frontend logic        |
| End-to-end tests  | Playwright                       | Complete user workflows                  |
| Security tests    | Spring Security Test             | Unauthorized access is rejected          |
| Performance tests | k6 or JMeter                     | Search and reporting under load          |

I would prioritize tests for the most consequential business rules.

For example, an automated test should confirm that a rejected change order does not change the revised contract value. Another should verify that a user cannot approve their own contract when separation of duties is required.

Use Testcontainers with MySQL for database integration tests. An in-memory H2 database may behave differently from MySQL, especially for SQL features, constraints, and locking.

## **15. Production deployment architecture**

For your initial deployment, Docker Compose is entirely reasonable.

**Web Browser**

HTTPS

**Nginx**

TLS termination · Vue static files · Reverse proxy

**Spring Boot Container**

REST API · Business modules · Security

**MySQL**

Persistent volume

**File Storage**

Persistent documents

Backups · Monitoring · Health checks · Secrets

For a small server, use one Spring Boot container initially. MySQL and document storage should have persistent volumes and tested backups.

Do not expose MySQL directly to the public internet. Keep the database on an internal Docker network, publish only the necessary HTTPS entry point, and manage credentials outside committed source code.

For production, also consider database recovery procedures, monitoring alerts, container restart policies, resource limits, and regular security updates.

Kubernetes is not necessary for the first deployment.

## **16. Industry standards and practices worth studying**

Construction contracts are influenced by the contractual framework and jurisdiction. Your software should be configurable rather than hard-coding one company's contract clauses or approval rules.

Several established references are useful:

| Reference              | Why it matters                                                                       |
| ---------------------- | ------------------------------------------------------------------------------------ |
| FIDIC                  | International construction contract forms, variations, claims, and payment processes |
| AIA contract documents | Common US construction agreements, payment applications, and change orders           |
| ConsensusDocs          | Standardized construction agreements and related documents                           |
| NEC                    | Contract administration, compensation events, and early warnings                     |
| BPMN 2.0               | Standardized business process modeling                                               |
| OpenAPI                | Standardized HTTP API descriptions                                                   |
| OWASP ASVS             | Application security verification requirements                                       |

Useful commercial products to study include Procore, Autodesk Construction Cloud, and Oracle Primavera Unifier.

Study their functional organization and business workflows, but do not assume their internal database schemas or service architectures are publicly known.

A particularly valuable distinction is between a **contract change request**, an **approved contractual change**, and a **payment certificate**. These are separate business records with different authorization and financial consequences.

## **17. Using Claude Code, Cursor, and Codex efficiently**

Since you plan to use AI coding tools, I recommend a specification-driven development workflow.

Rather than asking an agent to generate the entire enterprise application in one prompt, first establish the architecture, then implement and verify one module at a time.

Maintain these documents in the repository:

```
docs/
├── requirements/
│   ├── business-requirements.md
│   └── use-cases.md
├── architecture/
│   ├── system-architecture.md
│   ├── module-boundaries.md
│   └── architecture-decisions.md
├── database/
│   └── data-model.md
├── api/
│   └── openapi.yaml
└── development/
    └── implementation-plan.md
```

Here is a starter prompt you can send to an AI coding agent.

# Construction Contract Management System — AI Coding Agent Instructions

You are a senior Java enterprise architect and full-stack engineer.

Build a construction contract management system using mature enterprise software engineering practices.

## Technology stack

- Java 21 LTS
- Spring Boot (select a currently supported compatible version)
- Spring MVC
- Spring Security
- Spring Data JPA / Hibernate
- MySQL 8.4 LTS
- Flyway
- Maven
- Vue 3, TypeScript, Vite, Element Plus
- Docker Compose
- JUnit 5, Mockito, Testcontainers
- OpenAPI

## Architecture

Use a modular monolith with package-by-feature organization.

Each business module should have clear API, application, domain, and infrastructure responsibilities.

Business modules:

1. Organization and user management
2. Project management
3. Business partner management
4. Contract management
5. Approval workflow
6. Document management
7. Change order management
8. Payment management
9. Final settlement
10. Audit and reporting

## Engineering requirements

- Follow SOLID principles pragmatically.
- Keep controllers thin.
- Use DTOs for public APIs.
- Enforce business rules on the server.
- Use BigDecimal for monetary amounts.
- Use database transactions for consistency.
- Use optimistic locking where appropriate.
- Implement role-based and resource-level authorization.
- Use Flyway migrations instead of automatic production schema updates.
- Provide meaningful automated tests.
- Never hard-code credentials.
- Never silently modify approved financial records.
- Document architectural decisions.

## Development process

Do not generate the entire system immediately.

First:

1. Analyze the business requirements and identify ambiguities.
2. Propose the system architecture.
3. Define business modules and their dependencies.
4. Design the initial database schema.
5. Define the MVP REST APIs.
6. Create a phased implementation plan.

Then implement one vertical slice at a time, beginning with authentication, project management, business partners, and contract creation.

For each completed slice:

- Implement backend functionality.
- Implement frontend functionality.
- Add database migrations.
- Add automated tests.
- Run the build and tests.
- Report what was verified and what remains incomplete.

Do not claim that code was tested unless the tests actually ran successfully.

Start by producing the architecture, database design, and implementation plan. Wait for my approval before generating the application code.

## **18. Final architectural recommendation**

## **Recommended implementation blueprint**

| **Architecture** | Modular monolith, feature-oriented                   |
| ---------------- | ---------------------------------------------------- |
| **Backend**      | Java 21 + Spring Boot                                |
| **Frontend**     | Vue 3 + TypeScript + Element Plus                    |
| **Database**     | MySQL 8.4 + Flyway                                   |
| **Security**     | Spring Security + RBAC + project-level authorization |
| **Documents**    | Versioned private file storage                       |
| **Workflow**     | Custom approval engine initially; Flowable later     |
| **Deployment**   | Docker Compose + Nginx                               |
| **Testing**      | JUnit + Testcontainers + Playwright                  |

**My suggested next step is to build Phase 1 and Phase 2 as one complete vertical slice:** create a project, register a subcontractor, create a draft contract, submit it for approval, and review its history.

That single workflow will teach you much of what makes enterprise Java development different from a simple CRUD tutorial: database relationships, business transactions, authorization, state transitions, REST APIs, frontend integration, and automated testing.

Once that foundation works reliably, change orders and payment management become natural extensions of the same architecture.
