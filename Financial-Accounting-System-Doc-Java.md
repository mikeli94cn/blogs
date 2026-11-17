# **Building a Financial Accounting System with Java — Architecture, Development Roadmap & AI Coding Prompt**

A financial accounting system is an excellent Java backend project because it involves much more than ordinary CRUD (Create, Read, Update, Delete) operations. You'll learn **financial business rules, database transactions, data consistency, security, reporting, and enterprise application architecture**.

I recommend building a **small-to-medium enterprise Financial Accounting Management System**, similar in core functionality to the accounting modules found in mature products such as SAP, Oracle NetSuite, and Odoo.

The goal is not to clone an entire ERP system. Instead, we'll build a realistic, production-oriented accounting application that you can develop with **Spring Boot, MySQL, Docker, and AI coding tools such as Claude Code, Cursor, and Codex**.

## **1. Understand what we're building**

An enterprise financial accounting system typically handles several interconnected areas:

Financial accounting system — functional architecture

**Financial Dashboard**

Financial KPIs · Charts · Alerts · Recent Transactions

General Ledger

Accounts, journals, balances

Accounts Receivable

Customers, invoices, collections

Accounts Payable

Suppliers, bills, payments

Cash & Banking

Bank accounts, reconciliation

Fixed Assets

Assets, depreciation

Financial Reports

Balance sheet, P&L, cash flow

Period Closing

Fiscal periods, adjustments

Administration

Users, roles, audit logs

**Accounting Engine — Double-Entry Bookkeeping**

Journal posting · Validation · Financial consistency

**MySQL Database & Audit Trail**

Financial records · Transaction history · Supporting documents

The most important module is the **General Ledger (GL)**. It records financial transactions and serves as the foundation for financial reports.

For example, suppose a company purchases office equipment for $2,000 using its bank account.

| Account          | Debit      | Credit     |
| ---------------- | ---------- | ---------- |
| Office Equipment | $2,000     | —          |
| Bank Account     | —          | $2,000     |
| **Total**        | **$2,000** | **$2,000** |

This is double-entry bookkeeping: every posted journal entry must have equal total debits and credits.

Your Java application must enforce that rule, not merely display it in the frontend.

## **2. Recommended Java technology stack**

For your first enterprise-style accounting system, I recommend the following stack.

| Layer              | Recommended technology                      |
| ------------------ | ------------------------------------------- |
| Backend language   | Java 21 LTS                                 |
| Backend framework  | Spring Boot 3.x or compatible supported 4.x |
| Web API            | Spring MVC, REST, OpenAPI                   |
| Security           | Spring Security                             |
| Authentication     | Session-based login for same-origin web UI  |
| Persistence        | Spring Data JPA + Hibernate                 |
| Database           | MySQL 8.4 LTS                               |
| Database migration | Flyway                                      |
| Frontend           | Vue 3 + TypeScript + Element Plus           |
| Build              | Maven                                       |
| Testing            | JUnit 5, Mockito, Testcontainers            |
| Deployment         | Docker Compose + Nginx                      |
| Monitoring         | Spring Boot Actuator + Micrometer           |
| Development tools  | IntelliJ IDEA, Claude Code, Cursor, Codex   |

I would choose **a modular monolith architecture**, rather than microservices.

A modular monolith is one deployable backend application divided into clearly separated business modules. This is a widely used, practical approach for systems that need strong transactional consistency.

Recommended deployment architecture

**Vue 3 Web Application**

Browser · User Interface

**Nginx Reverse Proxy**

HTTPS · Static Files · API Routing

Spring Boot Backend

Security

GL

AR / AP

Banking

Reports

Audit

Services · Domain Rules · JPA Repositories

**MySQL**

ACID transactions · Financial records

Why not microservices immediately? Accounting operations often require multiple database changes to succeed or fail together. A modular monolith makes these transactions easier to implement, test, and audit.

You can introduce Redis, Kafka, Elasticsearch, or separate services later when real requirements justify them.

## **3. Core database design**

I recommend organizing your database around the accounting ledger, rather than beginning with invoices or dashboards.

### **Essential tables**

| Table                 | Purpose                            |
| --------------------- | ---------------------------------- |
| `companies`           | Company or legal entity            |
| `fiscal_years`        | Accounting years                   |
| `fiscal_periods`      | Monthly or other posting periods   |
| `accounts`            | Chart of accounts                  |
| `journal_entries`     | Journal entry headers              |
| `journal_lines`       | Debit and credit lines             |
| `customers`           | Customer records                   |
| `suppliers`           | Supplier records                   |
| `ar_invoices`         | Customer invoices                  |
| `ap_bills`            | Supplier bills                     |
| `payments`            | Incoming/outgoing payments         |
| `payment_allocations` | Matches payments to invoices/bills |
| `bank_accounts`       | Company bank accounts              |
| `bank_transactions`   | Imported or recorded bank activity |
| `fixed_assets`        | Capitalized assets                 |
| `users`, `roles`      | Authentication and authorization   |
| `audit_logs`          | Who changed what and when          |

### **Core ledger relationships**

Conceptual relationship diagram. The complete schema will include foreign keys, constraints, indexes, currencies, and audit metadata.

### **Financial data rules**

These rules are particularly important:

- Use Java `BigDecimal` and MySQL `DECIMAL`, never `double` or `float`, for monetary values.
- Store currency codes explicitly, such as USD or CNY.
- A posted journal must balance and must not be directly edited or deleted.
- Correct posted mistakes with reversing or adjusting journal entries.
- Posting must be atomic using database transactions.
- Closed accounting periods must reject ordinary new postings.
- Enforce tenant/company isolation and permissions on the server.
- Maintain an immutable history of financial posting events.
- Prevent duplicate posting when users retry requests.

For a first version, I suggest **one functional currency per company**, with multi-currency accounting deferred until later.

## **4. Development roadmap**

A realistic roadmap is to build the accounting engine first, then progressively add business workflows.

**01**

**Project foundation**

Week 1–2

Spring Boot, Vue, MySQL, Docker Compose, Flyway, Spring Security, users and roles.

Deliverable: A running application with login, database migrations, and automated tests.

**02**

**General Ledger MVP**

Week 3–5

Chart of accounts, fiscal periods, journal drafts, balanced posting, reversals, ledger queries, trial balance.

Deliverable: A functioning double-entry accounting engine.

**03**

**Accounts Receivable & Payable**

Week 6–8

Customers, suppliers, invoices, bills, payments, allocations, aging reports.

Deliverable: Sales and purchase accounting connected to the ledger.

**04**

**Banking & Financial Reports**

Week 9–11

Bank accounts, transaction import, reconciliation, balance sheet, income statement, cash-flow groundwork.

Deliverable: Financial visibility and reconciled balances.

**05**

**Period Closing & Fixed Assets**

Week 12–14

Period controls, closing adjustments, depreciation, period reopening permissions.

Deliverable: A more complete accounting lifecycle.

**06**

**Production hardening**

Week 15–17

Integration tests, security review, audit verification, backups, restore drills, monitoring, CI/CD.

Deliverable: A deployable demonstration system with operational safeguards.

These time estimates are planning targets, not guarantees. With AI coding tools, scaffolding can be fast, but accounting correctness, integration testing, and reconciliation still require careful work.

For the first working MVP, I would stop after Phase 2. A correct general ledger is a stronger foundation than ten partially implemented modules.

## **5. AI coding prompt for Claude Code, Cursor, and Codex**

The following prompt is designed to help an AI coding agent generate the project systematically, with emphasis on maintainable Java architecture and accounting correctness.

You can paste it into Claude Code, Cursor Agent, or Codex in a new project directory.

# Role: Senior Java Architect and Financial Accounting Domain Expert

You are a senior enterprise Java architect, Spring Boot engineer, database designer, financial accounting domain expert, and QA engineer.

Your task is to design and implement a production-oriented Financial Accounting Management System for a small-to-medium enterprise.

The project is intended both as a realistic accounting application and as an educational reference for learning professional Java backend development.

Follow mature enterprise software engineering practices. Prioritize correctness, maintainability, security, auditability, and automated testing over generating large amounts of code quickly.

## 1. Project Overview

Project name: `financial-accounting-system`

Build a full-stack web application supporting:

1. Company management
2. User authentication and role-based authorization
3. Chart of accounts
4. Fiscal years and accounting periods
5. General ledger and double-entry bookkeeping
6. Journal entry drafting, posting, and reversal
7. Accounts receivable
8. Accounts payable
9. Customer and supplier management
10. Payments and allocations
11. Bank accounts and reconciliation
12. Fixed assets and depreciation
13. Financial reporting
14. Period closing
15. Audit trails
16. Administrative dashboards

The initial implementation must be a **modular monolith**, not microservices.

Do not implement all modules simultaneously. Follow the development phases defined below.

## 2. Technology Stack

Backend:

- Java 21
- Spring Boot (select a currently supported version compatible with the dependencies)
- Spring MVC
- Spring Security
- Spring Data JPA
- Hibernate
- Jakarta Bean Validation
- MySQL 8.4 LTS
- Flyway
- Maven
- Spring Boot Actuator
- OpenAPI / Swagger UI

Frontend:

- Vue 3
- TypeScript
- Vite
- Element Plus
- Vue Router
- Pinia
- Axios
- Apache ECharts

Testing:

- JUnit 5
- Mockito
- Spring Boot Test
- Testcontainers with MySQL
- Frontend unit testing
- Playwright for critical end-to-end flows

Deployment:

- Docker
- Docker Compose
- Nginx
- Environment-based configuration

Use maintained, compatible library versions. Do not invent dependency versions or APIs.

## 3. Architecture Requirements

Use a modular monolith with package-by-business-feature organization.

Suggested backend structure:

```
backend/
  src/main/java/com/example/accounting/
    AccountingApplication.java
    common/
      exception/
      response/
      security/
      config/
    identity/
      controller/
      service/
      repository/
      entity/
      dto/
    company/
    ledger/
      controller/
      application/
      domain/
      repository/
      dto/
    receivable/
    payable/
    banking/
    assets/
    reporting/
    audit/
```

Maintain clear architectural boundaries:

- Controllers handle HTTP requests.
- Application services coordinate use cases.
- Domain logic enforces accounting invariants.
- Repositories handle persistence.
- DTOs define API contracts.
- Entities must not be exposed directly through REST.
- Use constructor dependency injection.
- Use explicit transaction boundaries.
- Avoid circular module dependencies.
- Avoid a large generic service layer that mixes unrelated business logic.

Document important architecture decisions.

## 4. Accounting Domain Requirements

Implement proper double-entry bookkeeping.

Core account categories:

- Assets
- Liabilities
- Equity
- Revenue
- Expenses

Every posted journal entry must satisfy:

`SUM(debit) = SUM(credit)`

Additional requirements:

- Journal entries contain at least two lines.
- Debit and credit amounts must be nonnegative.
- Each journal line must contain a positive debit or credit, but not both.
- Zero-value journal entries are prohibited.
- Journal entries reference valid, active, postable accounts.
- Parent/group accounts cannot receive direct postings.
- Draft entries may be edited.
- Posted entries cannot be edited or deleted.
- Posted corrections require reversal or adjustment entries.
- Reversals must reference the original entry.
- A journal entry cannot be reversed more than once.
- Posting is atomic and transactional.
- Duplicate posting requests must not create duplicate ledger entries.
- Closed periods cannot accept ordinary postings.
- All postings must belong to the correct company.
- Account balances are derived from posted journal lines.
- Drafts do not affect official account balances.

Use `BigDecimal` for money and `DECIMAL` in MySQL.

For MVP, support one functional currency per company. Do not introduce multi-currency posting until a later phase.

Ensure all amounts in a journal entry use the company's functional currency.

## 5. Database Requirements

Design a normalized MySQL schema.

Start with:

- companies
- users
- roles
- user_roles
- fiscal_years
- fiscal_periods
- accounts
- journal_entries
- journal_lines
- audit_logs

Later add:

- customers
- suppliers
- ar_invoices
- ar_invoice_lines
- ap_bills
- ap_bill_lines
- payments
- payment_allocations
- bank_accounts
- bank_transactions
- bank_reconciliations
- fixed_assets
- depreciation_entries

Requirements:

- Use primary and foreign keys.
- Use appropriate unique constraints.
- Add indexes for common queries.
- Include company ownership where required.
- Use Flyway for schema changes.
- Never rely on Hibernate automatic schema updates in production.
- Use appropriate DECIMAL precision and scale.
- Define consistent rounding policies.
- Define explicit state transitions for financial documents.
- Store creation and modification timestamps.
- Store the acting user for important financial operations.
- Do not use cascade deletion for posted accounting records.

## 6. Security Requirements

Implement Spring Security with:

- Session-based authentication for the same-origin web application
- Secure HttpOnly cookies
- CSRF protection
- Password hashing using a supported secure password encoder
- Role-based authorization
- Company-level data isolation
- Secure configuration through environment variables

Roles:

- SYSTEM_ADMIN
- COMPANY_ADMIN
- ACCOUNTANT
- APPROVER
- AUDITOR
- VIEWER

Enforce authorization in backend services, not only in frontend menus.

For sensitive operations, separate journal creation from approval where practical.

Never hardcode production passwords or secrets.

Provide development-only bootstrap accounts through explicit development configuration.

## 7. REST API Requirements

Use versioned REST endpoints.

Examples:

```
POST   /api/v1/auth/login
POST   /api/v1/auth/logout
GET    /api/v1/auth/me

GET    /api/v1/accounts
POST   /api/v1/accounts
GET    /api/v1/accounts/{id}
PUT    /api/v1/accounts/{id}

GET    /api/v1/journal-entries
POST   /api/v1/journal-entries
GET    /api/v1/journal-entries/{id}
PUT    /api/v1/journal-entries/{id}
POST   /api/v1/journal-entries/{id}/post
POST   /api/v1/journal-entries/{id}/reverse

GET    /api/v1/reports/trial-balance
GET    /api/v1/reports/general-ledger
```

Provide:

- Request validation
- Pagination
- Filtering
- Sorting
- Consistent error responses
- Meaningful HTTP status codes
- OpenAPI documentation
- Explicit authorization
- Idempotent financial posting behavior

## 8. Frontend Requirements

Build a professional accounting dashboard using Vue 3 and Element Plus.

Main navigation:

```
Dashboard
General Ledger
  Chart of Accounts
  Journal Entries
  General Ledger
  Trial Balance
Accounts Receivable
Accounts Payable
Cash & Banking
Fixed Assets
Financial Reports
Fiscal Periods
Administration
```

Implement:

- Responsive sidebar
- Login screen
- Role-aware navigation
- Searchable and paginated tables
- Journal entry editing form
- Dynamic journal lines
- Automatic debit/credit total calculation
- Balance validation messages
- Confirmation before posting
- Read-only display of posted journals
- Clear loading and error states

Frontend validation improves usability, but the backend must enforce all accounting rules independently.

## 9. Automated Testing Requirements

Write unit and integration tests for all critical accounting rules.

Required scenarios:

1. Balanced journal posting succeeds.
2. Unbalanced journal posting fails.
3. Zero-value journal posting fails.
4. Invalid account posting fails.
5. Closed-period posting fails.
6. Posted journal modification fails.
7. Posted journal deletion fails.
8. Reversal creates the correct opposite entries.
9. Duplicate reversal is rejected.
10. Duplicate posting does not create duplicate financial records.
11. Concurrent posting attempts preserve consistency.
12. Unauthorized users cannot post journals.
13. Users cannot access another company's financial records.
14. Trial balance totals reconcile with posted journal lines.
15. Database failure rolls back the entire posting operation.

Use real MySQL integration tests through Testcontainers for database-dependent invariants.

Do not replace important integration tests with mocks.

## 10. Development Phases

### Phase 1 — Foundation

Implement:

- Maven project
- Spring Boot application
- MySQL integration
- Flyway migrations
- Docker Compose
- Spring Security
- Authentication
- Basic roles
- Vue frontend skeleton
- Health endpoint
- Basic tests

Stop and verify that the application starts successfully.

### Phase 2 — General Ledger MVP

Implement:

- Company accounting configuration
- Chart of accounts
- Fiscal years and periods
- Journal entry drafts
- Journal posting
- Reversal
- Account ledger
- Trial balance
- Unit and integration tests

This is the highest-priority phase.

### Phase 3 — Receivables and Payables

Implement customers, suppliers, invoices, bills, payments, allocations, and ledger integration.

### Phase 4 — Banking and Reporting

Implement bank transaction management, reconciliation, balance sheet, income statement, and supporting reports.

### Phase 5 — Advanced Accounting

Implement fixed assets, depreciation, period closing, and additional audit controls.

### Phase 6 — Production Hardening

Implement monitoring, security review, backup/restore procedures, CI/CD, and deployment documentation.

## 11. AI Agent Working Rules

Before writing code:

1. Inspect the existing repository.
2. Identify existing code and conventions.
3. Create `docs/architecture.md`.
4. Create `docs/database-design.md`.
5. Create `docs/accounting-rules.md`.
6. Create `docs/development-roadmap.md`.
7. Create `docs/decisions.md`.
8. Explain your proposed implementation plan.

During implementation:

- Work incrementally.
- Do not implement every phase at once.
- Prefer simple, understandable solutions.
- Write readable, maintainable Java code.
- Include appropriate comments for complex financial rules.
- Keep API contracts consistent.
- Never silently weaken accounting validations.
- Do not modify unrelated working functionality.
- Do not claim tests passed unless actually executed.
- Report unavailable tools, including Docker, accurately.
- Do not bypass failing tests or security controls.
- Add tests alongside features.
- Update documentation when architecture changes.

After each phase:

1. Run compilation.
2. Run relevant tests.
3. Report results and failures.
4. Explain implemented functionality.
5. List remaining risks.
6. Provide manual verification instructions.
7. Recommend the next phase.

## 12. First Task

Start with Phase 1 only.

First inspect the environment and repository.

Then propose the architecture, database foundations, Maven dependencies, Docker Compose configuration, and directory structure.

After planning, implement the Phase 1 foundation.

Do not begin Phase 2 until Phase 1 has been implemented and verified.

The final result should be a maintainable educational reference project that can evolve into a realistic enterprise accounting system.

## **6. How to use AI coding tools effectively**

I recommend using one primary coding agent at a time, with a second agent reviewing important changes. This reduces conflicting edits.

| Tool          | Suggested role                                                    |
| ------------- | ----------------------------------------------------------------- |
| Claude Code   | Architecture, complex implementation, refactoring                 |
| Cursor        | Interactive development, frontend, code navigation                |
| OpenAI Codex  | Focused backend tasks, tests, code review                         |
| IntelliJ IDEA | Java debugging, database inspection, understanding generated code |

Instead of repeatedly asking the AI to generate the whole application, use focused prompts such as:

**Example: Phase 2 journal posting task**

Copy this prompt after the project foundation is complete.

Implement the journal posting use case in the General Ledger module. Enforce balanced debits and credits, active postable accounts, open fiscal periods, company isolation, immutable posted records, transactional atomicity, and duplicate-request protection. Add JUnit unit tests and MySQL Testcontainers integration tests. Explain your transaction and concurrency design before coding.

&#x20;Copy prompt

## **7. What you should learn while building it**

Since your goal is to improve your Java backend engineering skills, focus on the concepts behind the generated code.

| Java topic              | Accounting application example        |
| ----------------------- | ------------------------------------- |
| OOP and domain modeling | Account, JournalEntry, JournalLine    |
| `BigDecimal`            | Accurate monetary calculations        |
| Spring IoC / DI         | Injecting accounting services         |
| Spring Security         | Accounting permissions                |
| JPA / Hibernate         | Persisting financial entities         |
| `@Transactional`        | Atomic journal posting                |
| Database locking        | Concurrent posting and period closing |
| SQL aggregation         | Trial balance and ledger reports      |
| REST API design         | Posting and reversal endpoints        |
| JUnit / Testcontainers  | Financial correctness tests           |
| Docker Compose          | Deploying backend and MySQL           |

One especially important topic is **transaction management**.

Imagine a journal entry has five lines. If the database saves three lines and then an error occurs, the application must not leave an incomplete financial transaction. Spring transactions and database constraints help ensure that either the entire posting succeeds or the entire operation rolls back.

## **8. Additional considerations for a real accounting product**

An industry-grade accounting system also needs rules that depend on the country and accounting standards.

For example, IFRS, US GAAP, and Chinese Accounting Standards can differ in reporting requirements, account classifications, and specific treatments. Taxes, statutory invoice formats, fiscal calendars, and retention requirements also vary.

For your learning project, begin with a **jurisdiction-neutral double-entry ledger** and a configurable chart of accounts. Treat official financial statements, tax filing, and statutory compliance as separate features requiring qualified accounting review.

I would also postpone multi-currency consolidation, inventory valuation, payroll, and sophisticated tax automation until the general ledger and basic financial reports are reliable.

## **9. Your first milestone**

**General Ledger MVP checklist**

Interactive checklist

0 of 9 complete

0%

Spring Boot starts and connects to MySQL

User can log in securely

Accountant can create a chart of accounts

Accountant can create a journal draft

Balanced journal can be posted

Unbalanced journal is rejected

Posted journal can be reversed

Trial balance is generated correctly

Automated financial tests pass

Once this milestone is complete, you'll have built the central component of a genuine accounting application rather than just a collection of forms and database tables.

**My recommendation:** Build the General Ledger MVP first, using Java 21, Spring Boot, MySQL, Vue 3, and Docker Compose. Then add accounts receivable and payable. This gives you a project that is both technically educational and credible as a Java backend portfolio application.
