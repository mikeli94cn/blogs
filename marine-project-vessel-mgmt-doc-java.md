# **Marine Construction Project & Vessel Management System**

Complete Java architecture, industry modules, database design, development roadmap, and AI coding prompt

You can build this as a professional enterprise application for a **marine construction services company** that operates construction projects, manages its own vessels, rents vessels from other companies, tracks vessel locations, and controls project costs and contracts.

This is an interesting industry because it combines several types of enterprise software:

- **Project Management System (PMS)** — manage marine construction projects, schedules, budgets, and progress.
- **Vessel Management System (VMS)** — manage vessels, equipment, availability, maintenance, and operating status.
- **Fleet Tracking System** — display vessel positions and construction sites on maps.
- **Contract Management System (CMS)** — manage vessel charter/rental agreements, rates, invoices, and payments.
- **Resource Planning System** — allocate vessels, personnel, and equipment to construction projects.

I recommend building a **modular monolith using Spring Boot**, with a Vue 3 frontend, MySQL for business data, and a map interface for geospatial features. This is a practical architecture for an initial production system and a good foundation for future expansion.

## **1. Understand the business first**

A marine construction company may undertake projects such as:

[Cimentaciones de Acero, Soluciones Costeras: El poder de los Pilotes Tubulares](https://images.openai.com/static-rsc-4/8AQl-UtTRnCL-HzRhQT9NdLkTjEgCGABuU1fiPfVHoJHD9bhozuYB52IbTl2kJODoPLqMGovKy9XBcIuiIN-mbVR4m7C9umaK4RYBXiVbcOEKRAJo_9TuTgKeRWDFQP2QgFa-aA5T15_E7bWkVAFdqdzCyKimRLf3LskU6Sde50?purpose=inline)

**Marine bridge construction**

Pile foundations, bridge piers, offshore platforms

[Su socio de confianza en dragados | Royal IHC](https://images.openai.com/static-rsc-4/cC_vTIz6syDuGyOxTf5PZfcpPPVeEB1KnDE8CdsuXvlAa3o5VF0sgiW2r3eXGYQyyoN0UHa3oBZ3kXPtdyhJ6U3LUkmUeDPdwSBfC1ryTTvxgZ9nq2baSntz3T9U9wOs-Jx4p_7tvvkWCfLYD4u-HvfIFxISoueJZe0fweGIpeI?purpose=inline)

**Dredging and reclamation**

Channel dredging, land reclamation, seabed excavation

[Major Overseas Civil Works｜Construction Results｜WAKACHIKU CONSTRUCTION](https://images.openai.com/static-rsc-4/koU3pZoxLy_Fp5wnzbu-Cn6dUZJo4wdjZCSA-9K40QjG0pcMuoQqZRTp-wWT5A_1PXW7WhjLdbCnWjZCu_kpAf3mVGwooojExD3YDWVeOX5yXlR8LY3KULdlCA5nxuC7TlFKdR6aVx9TsjQKwjlHp5RWhZWCwU5POJG_7zGc6yc?purpose=inline)

**Offshore lifting**

Heavy lifting, marine installation, offshore structures

[皇昌營造擴大海事版圖 自主船機隊領航未來 - 皇昌海事工程](https://images.openai.com/static-rsc-4/UXX4evJttgt_Gr1ZUcp1C2lhctKnCkuj7HiwC7Gy-4ypj93uBruOxcO8bp-j3iX90UJsq1lQJkxwVfF53M3E3_E3eS7vst2g2OYD8PNO4q7Hy3g_GpMHGC8cnqZFcy_quq237fr8CpyvrTvvjnQh2e79UpnwMOvcY7ZRcXRJVTE?purpose=inline)

**Vessel charter and support**

Tugboats, workboats, barges, crew transport

### **Example business scenario**

Imagine a company called **OceanBuild Marine Construction Ltd.**

It has:

- 12 construction projects.
- 8 company-owned vessels.
- 15 vessels chartered from third-party owners.
- Multiple construction sites along the coast.
- Vessel rental contracts with different daily and monthly rates.
- Project managers, fleet managers, contract administrators, and finance staff.

A typical business workflow would be:

**1. Create marine construction project**

Project code, customer, location, budget, schedule

**2. Plan vessel requirements**

Vessel type, capacity, required dates

**Owned vessel**

Check availability

**Rented vessel**

Create charter contract

**3. Mobilize and assign vessels**

Track location, allocation, mobilization

**4. Execute and monitor construction**

Daily reports, progress, vessel utilization

**5. Settle costs and close project**

Rental calculations, invoices, final reporting

The important design principle is that **projects, vessels, locations, and rental contracts must be connected**, rather than developed as four independent systems.

## **2. Recommended enterprise technology architecture**

PRESENTATION LAYER

**Vue 3 + TypeScript + Element Plus**

Dashboard · Projects · Vessels · Contracts · Maps · Reports

API & SECURITY LAYER

**REST API · Spring Security · OpenAPI**

Authentication · Authorization · Validation · Error handling

JAVA BUSINESS LAYER — SPRING BOOT

Project Management

Vessel Management

Fleet Tracking

Rental Contracts

Vessel Scheduling

Finance & Billing

Maintenance & HSE

Reports & Analytics

MySQL 8

Business data

Redis

Cache / jobs

Object storage

Documents

EXTERNAL INTEGRATIONS

**AIS / GPS · Map Provider · Email · Accounting**

### **Technology selection**

| Layer               | Recommended technology           | Purpose                          |
| ------------------- | -------------------------------- | -------------------------------- |
| Backend language    | Java 21 LTS                      | Enterprise backend               |
| Backend framework   | Spring Boot 3.5.x                | REST services and business logic |
| Security            | Spring Security                  | Login, roles, permissions        |
| Persistence         | Spring Data JPA + Hibernate      | Database access                  |
| Database            | MySQL 8.4 LTS                    | Transactional business data      |
| Database migrations | Flyway                           | Version-controlled schema        |
| Frontend            | Vue 3 + TypeScript               | Web application                  |
| UI components       | Element Plus                     | Enterprise forms and tables      |
| Mapping             | MapLibre GL JS                   | Interactive maps                 |
| Geospatial data     | MySQL spatial initially          | Site and position storage        |
| Cache               | Redis (optional)                 | Caching and short-lived data     |
| File storage        | MinIO or S3-compatible storage   | Contracts and documents          |
| Testing             | JUnit 5, Mockito, Testcontainers | Automated tests                  |
| Deployment          | Docker Compose + Nginx           | Application deployment           |
| API documentation   | springdoc-openapi                | Swagger UI                       |

For this project, Spring Boot 3.5 is a conservative baseline. Use compatible, supported patch releases and verify dependencies when generating the project. Java 21 is sufficient; you do not need the newest Java features to deliver the system.

**Why not microservices immediately?**

Your system has tightly connected workflows. For example, assigning a rented vessel to a project may require checking its availability, contract validity, and project schedule in one business transaction.

A modular monolith makes this easier while retaining clear boundaries for future extraction into separate services.

## **3. Complete functional module design**

I recommend organizing the application into 10 business modules, implemented gradually.

## **01**

**Project Management**

MVP

Project registration, customer, construction site, schedule, budget, milestones, work breakdown structure (WBS), daily progress reports.

## **02**

**Vessel Registry & Fleet Management**

MVP

Vessel master data, ownership, IMO/MMSI identifiers, specifications, certificates, availability, operating status.

## **03**

**Geographic Location Management**

MVP

Construction site coordinates, project boundaries, vessel last-known position, map markers, location history.

## **04**

**Vessel Charter / Rental Contracts**

MVP

Vessel owners, charter contracts, hire periods, rate types, mobilization costs, contract documents, renewals.

## **05**

**Vessel Scheduling & Dispatch**

MVP

Assign vessels to projects, conflict detection, mobilization, demobilization, scheduling calendar, utilization.

## **06**

**Daily Operations**

Phase 2

Vessel daily reports, working hours, standby, downtime, fuel consumption, project progress, timesheets.

## **07**

**Commercial & Financial Management**

Phase 2

Rental accruals, hire calculations, supplier invoices, payment status, project cost reports, budgets.

## **08**

**Maintenance & Compliance**

Phase 3

Maintenance schedules, equipment records, vessel inspections, certificates, safety incidents, document expiry alerts.

## **09**

**Analytics & Reporting**

Phase 3

Fleet utilization, charter expenditure, project performance, cost variance, location and operational dashboards.

## **10**

**System Administration**

MVP

Users, roles, permissions, audit trails, organizations, reference data, notification settings.

## **4. Design the two most important map functions**

### **A. Construction project location**

Every construction project may have a geographic site, but a site is not necessarily just one point.

For example, a dredging project may cover a water area, and a submarine pipeline project may extend along a route.

Support three geometric types:

- **Point:** pier, dock, offshore platform.
- **Polygon:** dredging area, reclamation zone.
- **Line:** submarine pipeline, cable route, navigation channel.

Illustrative marine construction map

Work zone

Vessel

Construction route

Conceptual map only — not actual geography or live vessel positions.

Use the WGS84 coordinate system (EPSG:4326) for GPS latitude/longitude, and GeoJSON to exchange geographic geometry with the frontend.

For advanced spatial operations such as polygon containment, route proximity, and geofencing, PostgreSQL with PostGIS is a strong future alternative to MySQL.

### **B. Vessel tracking**

There are two distinct implementation levels.

| Feature            | Initial version         | Advanced version          |
| ------------------ | ----------------------- | ------------------------- |
| Vessel position    | Manual updates          | AIS/GPS feed              |
| Map display        | Last-known location     | Near-real-time markers    |
| Position history   | Recorded updates        | Automatic tracking        |
| Position freshness | Timestamp and status    | Stale-data detection      |
| Vessel movement    | Historical markers      | Playback of vessel tracks |
| Geofencing         | Manual site association | Entry/exit alerts         |

**AIS (Automatic Identification System)** is a maritime identification and position-reporting system. Real AIS data normally requires an authorized receiver or data-provider integration; public map tiles do not provide live vessel positions.

For your first version, implement a `VesselPositionProvider` interface with a simulated provider and a manual provider. Add a real AIS provider only after obtaining access to a legitimate data source.

Important: vessel tracking must show the position timestamp and source. A 24-hour-old AIS report must never appear as a current position.

## **5. Vessel rental contract management**

This is one of the most commercially important parts of the application.

Marine vessel rental is often called **vessel chartering**. Depending on the agreement, you may encounter time charters, bareboat charters, voyage charters, or other specialized marine service contracts.

For the initial version, focus on time-based vessel hire, but design the contract model so other charter arrangements can be added later.

### **Contract data structure**

| Category          | Example fields                              |
| ----------------- | ------------------------------------------- |
| Contract identity | Contract number, title, status              |
| Parties           | Vessel owner, charterer, supplier           |
| Vessel            | Vessel ID, vessel name, specifications      |
| Duration          | Start date, end date, extension options     |
| Rates             | Daily rate, monthly rate, currency          |
| Cost components   | Mobilization, demobilization, fuel, standby |
| Commercial terms  | Billing cycle, payment terms, tax           |
| Project           | Associated construction project             |
| Documents         | Signed agreement, amendments                |
| Approval          | Draft, reviewed, approved, active, closed   |

### **Example rental calculation**

Suppose you rent a crane barge for a marine bridge construction project.

Illustrative vessel hire cost calculator

Rental duration

**30 days**

Daily rate (USD)

Mobilization (USD)

Demobilization (USD)

Estimated rental cost

# **$170,000.00**

Illustration only. Excludes fuel, standby adjustments, off-hire periods, taxes, and other contract-specific terms.

The production billing engine should not assume every calendar day is billable. It needs configurable hire rules, on-hire/off-hire events, partial-day rounding, amendments, and approved operational records.

Use Java `BigDecimal` for financial calculations, never `double`.

## **6. Core database design**

Start with a relational database. The following is a suggested conceptual schema.

### **Main tables**

| Domain         | Tables                                                                                  | Purpose                    |
| -------------- | --------------------------------------------------------------------------------------- | -------------------------- |
| Organization   | `organizations`, `customers`, `suppliers`                                               | Business parties           |
| Projects       | `projects`, `project_sites`, `project_milestones`, `project_daily_reports`              | Construction operations    |
| Vessels        | `vessels`, `vessel_types`, `vessel_certificates`                                        | Fleet registry             |
| Tracking       | `vessel_positions`                                                                      | Location history           |
| Chartering     | `charter_contracts`, `charter_contract_vessels`, `charter_rates`, `contract_amendments` | Rental agreements          |
| Scheduling     | `vessel_assignments`, `mobilization_events`                                             | Vessel allocation          |
| Finance        | `hire_periods`, `hire_statements`, `supplier_invoices`, `payments`                      | Commercial settlement      |
| Operations     | `vessel_daily_reports`, `vessel_downtime_events`                                        | Daily activity             |
| Administration | `users`, `roles`, `permissions`, `audit_logs`                                           | Access control             |
| Documents      | `documents`, `document_links`                                                           | Contract and project files |

### **Simplified entity relationships**

Some relationships are many-to-many. For example, one vessel can serve many projects over time, and one project can use many vessels. The `vessel_assignments` table resolves that relationship.

### **Example Java entity**

```

@Entity
@Table(name = "vessels")
public class Vessel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String vesselCode;

    @Column(nullable = false)
    private String vesselName;

    @Enumerated(EnumType.STRING)
    private VesselType vesselType;

    @Enumerated(EnumType.STRING)
    private OwnershipType ownershipType;

    private String imoNumber;
    private String mmsi;

    @Enumerated(EnumType.STRING)
    private VesselStatus status;

    // Constructors, getters and setters
}

```

In the real implementation, add validation, audit fields, indexes, appropriate uniqueness constraints, and separate DTOs for API input/output.

Do not store the vessel's only position directly on the vessel entity. Maintain a position history and derive the latest valid observation.

### **Important database rules**

- Use UTC timestamps for stored events, with explicit project time zones for business dates.
- Store money with `DECIMAL` and ISO currency codes.
- Store latitude and longitude with adequate precision, or spatial types.
- Keep contract amendments and financial approvals auditable.
- Prevent overlapping vessel assignments using transactional checks and appropriate concurrency control.
- Keep deleted or superseded commercial records traceable rather than silently overwriting history.
- Use Flyway migrations instead of relying on Hibernate to modify production schemas automatically.

## **7. Backend code organization**

Use package-by-feature architecture rather than one enormous `controller`, `service`, and `repository` directory.

```

marine-construction-system/
├── backend/
│   ├── pom.xml
│   └── src/
│       ├── main/
│       │   ├── java/com/oceanbuild/marine/
│       │   │   ├── MarineApplication.java
│       │   │   ├── common/
│       │   │   │   ├── exception/
│       │   │   │   ├── security/
│       │   │   │   └── audit/
│       │   │   ├── project/
│       │   │   │   ├── api/
│       │   │   │   ├── application/
│       │   │   │   ├── domain/
│       │   │   │   └── infrastructure/
│       │   │   ├── vessel/
│       │   │   ├── tracking/
│       │   │   ├── charter/
│       │   │   ├── scheduling/
│       │   │   ├── operations/
│       │   │   ├── finance/
│       │   │   ├── document/
│       │   │   └── identity/
│       │   └── resources/
│       │       ├── application.yml
│       │       └── db/migration/
│       └── test/
├── frontend/
│   ├── src/
│   │   ├── api/
│   │   ├── components/
│   │   ├── layouts/
│   │   ├── router/
│   │   ├── stores/
│   │   ├── views/
│   │   │   ├── projects/
│   │   │   ├── vessels/
│   │   │   ├── tracking/
│   │   │   ├── charters/
│   │   │   └── dashboard/
│   │   └── types/
│   └── package.json
├── infra/
│   ├── compose.yaml
│   └── nginx/
├── docs/
│   ├── requirements/
│   ├── architecture/
│   ├── database/
│   └── api/
└── README.md

```

The layers have clear responsibilities:

- `api`: REST controllers, requests, responses.
- `application`: use cases and transaction orchestration.
- `domain`: business entities, rules, domain services.
- `infrastructure`: database adapters, file storage, AIS clients.

This resembles Domain-Driven Design (DDD), but you can implement it pragmatically without adding unnecessary abstractions.

## **8. REST API design**

Use versioned, resource-oriented endpoints.

| HTTP   | Endpoint                         | Function                |
| ------ | -------------------------------- | ----------------------- |
| `POST` | `/api/v1/projects`               | Create project          |
| `GET`  | `/api/v1/projects`               | Search projects         |
| `GET`  | `/api/v1/projects/{id}`          | Project details         |
| `POST` | `/api/v1/projects/{id}/sites`    | Add work site           |
| `POST` | `/api/v1/vessels`                | Register vessel         |
| `GET`  | `/api/v1/vessels`                | Search fleet            |
| `GET`  | `/api/v1/vessels/{id}/positions` | Position history        |
| `POST` | `/api/v1/vessels/{id}/positions` | Record position         |
| `POST` | `/api/v1/charter-contracts`      | Create charter          |
| `POST` | `/api/v1/vessel-assignments`     | Assign vessel           |
| `GET`  | `/api/v1/vessels/availability`   | Check availability      |
| `POST` | `/api/v1/hire-statements`        | Generate hire statement |
| `GET`  | `/api/v1/dashboard/summary`      | Dashboard metrics       |

For state-changing actions such as approving a contract or issuing a hire statement, create explicit workflow endpoints with authorization and optimistic-locking protection.

## **9. Development roadmap**

I suggest a 6-phase plan, with a working application delivered at the end of every phase. The estimated durations assume one developer using AI coding tools and spending substantial time testing and reviewing generated code.

1. **Phase 1 — Foundation and project management**

   Estimated: 2–3 weeks

   Build Spring Boot, Vue, MySQL, Docker Compose, authentication, role permissions, customer management, project CRUD, and project locations.

   **Deliverable:** Users can log in, create projects, and view construction sites on a map.
2. **Phase 2 — Vessel management**

   Estimated: 2–3 weeks

   Implement vessel registry, specifications, ownership, operating status, position history, simulated vessel tracking, and fleet map.

   **Deliverable:** A searchable fleet registry with a vessel location dashboard.
3. **Phase 3 — Rental contracts and scheduling**

   Estimated: 3–4 weeks

   Implement suppliers, charter contracts, hire rates, vessel assignments, availability checks, contract documents, and expiry notifications.

   **Deliverable:** Users can rent vessels, assign them to projects, and prevent scheduling conflicts.
4. **Phase 4 — Operations and finance**

   Estimated: 3–5 weeks

   Add daily vessel reports, working and standby hours, hire calculation, invoice records, payment tracking, and project cost summaries.

   **Deliverable:** An operational workflow from vessel assignment to hire statement and cost reporting.
5. **Phase 5 — Advanced maritime capabilities**

   Estimated: 4–6 weeks

   Integrate a licensed AIS/GPS provider, geofencing, vessel certificates, maintenance, HSE records, and advanced analytics.

   **Deliverable:** A more complete marine operations platform.
6. **Phase 6 — Production hardening**

   Estimated: 2–4 weeks

   Add comprehensive tests, performance tuning, backups, monitoring, HTTPS, audit verification, data import, and disaster recovery procedures.

   **Deliverable:** A system ready for a controlled company pilot, subject to acceptance testing and security review.

Total indicative effort: 16–25 weeks. This is a planning estimate, not a delivery guarantee. Real AIS integrations, complex charter billing, and customer-specific workflows can substantially increase the scope.

### **Suggested MVP acceptance tests**

Before adding advanced modules, verify that the following business scenarios work:

1. A project manager creates a dredging project with a polygon work area.
2. A fleet manager registers a company-owned crane barge.
3. A contract administrator registers a rented tugboat and its charter contract.
4. The fleet manager assigns both vessels to the project.
5. A second conflicting assignment for the same vessel is rejected.
6. The map displays the project area and last-known vessel positions.
7. An authorized user records a position update with timestamp and source.
8. A contract administrator generates a rental estimate.
9. An unauthorized user cannot approve a charter contract.
10. The application restarts without losing business data.

# **10. Master AI coding prompt**

This is the prompt I recommend using with Claude Code, Cursor, or Codex.

It instructs the AI to work as a software architect and senior engineer, build incrementally, write tests, and avoid producing an enormous unverified codebase in one pass.

# Marine Construction Project & Vessel Management System — Master Development Prompt

## 1. Your role

You are a senior Java enterprise software architect, maritime construction domain analyst, database architect, frontend engineer, and QA engineer.

Help me design and implement a production-oriented Marine Construction Project & Vessel Management System for a marine construction services company.

Use mature industry practices, clean architecture, reliable business rules, maintainable code, and automated tests.

Do not generate the entire application in one uncontrolled step. Work in phases, maintain documentation, and verify each phase before continuing.

## 2. Business background

The company performs marine construction services, including:

- Dredging and reclamation
- Marine bridge and foundation construction
- Offshore installation and heavy lifting
- Port and harbor construction
- Marine pipeline and cable installation
- Vessel chartering and marine support operations

The company owns vessels and also charters vessels from external suppliers.

It needs a centralized system to manage construction projects, construction locations, vessels, vessel positions, charter contracts, vessel scheduling, operations, and project costs.

## 3. Required technology stack

Backend:

- Java 21 LTS
- Spring Boot 3.5.x, latest compatible patch
- Spring Web MVC
- Spring Security
- Spring Data JPA and Hibernate
- Bean Validation
- MySQL 8.4 LTS
- Flyway database migrations
- Maven
- springdoc-openapi
- JUnit 5, Mockito, Testcontainers

Frontend:

- Vue 3
- TypeScript
- Vite
- Element Plus
- Pinia
- Vue Router
- Axios
- MapLibre GL JS
- ECharts

Infrastructure:

- Docker and Docker Compose
- Nginx
- Environment-based configuration
- Optional Redis
- S3-compatible document storage when required

Verify dependency compatibility and avoid deprecated APIs.

## 4. Architecture requirements

Use a modular monolith with package-by-feature organization.

Business modules:

1. Identity and access management
2. Organization and customer management
3. Construction project management
4. Project location management
5. Vessel registry
6. Vessel position tracking
7. Vessel charter contracts
8. Vessel assignment and scheduling
9. Daily vessel operations
10. Commercial settlement and finance
11. Document management
12. Reporting and dashboard

Inside each module, separate API, application, domain, and infrastructure responsibilities.

Use REST APIs, DTOs, validation, centralized error handling, and transactional application services.

Use clear module boundaries. Avoid unnecessary microservices and excessive abstraction.

## 5. Project management requirements

Support:

- Project number, name, description
- Customer and responsible manager
- Project type and status
- Start and end dates
- Planned and actual budget
- Geographic construction sites
- Milestones and WBS
- Daily progress reporting
- Project document attachments
- Project-to-vessel assignments
- Project cost reporting

Projects may have multiple work sites.

Work sites may be points, lines, or polygons.

Use GeoJSON for frontend geographic exchange and WGS84 coordinates.

## 6. Vessel management requirements

Support:

- Vessel code and name
- Vessel type
- Owned or chartered status
- IMO number when applicable
- MMSI when applicable
- Flag, dimensions, draft, capacity
- Crane lifting capacity when applicable
- Owner and operator
- Operational status
- Vessel certificates
- Last-known position
- Position history
- Vessel availability

Do not assume every construction vessel has an IMO number or AIS equipment.

Keep vessel identity, operating status, position observations, and project assignments as separate concepts.

## 7. Vessel tracking requirements

Implement a map-based tracking module.

Initially support:

- Manual position updates
- Simulated position updates
- Position timestamps
- Position source
- Historical positions
- Latest valid position
- Stale position indicators
- Project site markers
- Vessel markers
- Project boundary overlays

Design a VesselPositionProvider abstraction for future AIS/GPS integrations.

Do not claim simulated positions are real-time AIS data.

Do not depend on an external paid AIS service for the MVP.

Validate latitude, longitude, timestamps, and vessel identifiers.

## 8. Charter contract requirements

Support:

- Contract number and status
- Supplier and charterer
- One or multiple contracted vessels where applicable
- Charter type
- Contract start and end dates
- Daily and monthly rates
- Currency
- Mobilization and demobilization fees
- Standby and off-hire rules
- Payment terms
- Contract amendments
- Contract document attachments
- Approval workflow
- Contract expiry alerts

Keep contract validity separate from vessel project assignment.

Use BigDecimal for financial calculations.

Use explicit rate effective dates and billing rules.

Never silently overwrite approved financial records.

## 9. Vessel scheduling requirements

Support:

- Vessel assignment to project
- Assignment start and end
- Planned and actual dates
- Assignment status
- Mobilization and demobilization
- Availability queries
- Scheduling conflict detection
- Vessel assignment calendar
- Vessel utilization reporting

Reject conflicting active allocations unless an explicit business rule permits them.

Implement concurrency-safe scheduling validation.

## 10. Finance requirements

Support:

- Vessel hire calculation
- Hire statements
- Mobilization fees
- Demobilization fees
- Standby charges
- Off-hire deductions
- Supplier invoice tracking
- Payment status
- Project vessel costs
- Planned versus actual cost

Do not assume all charter contracts use the same billing rules.

Make calculation policies configurable and testable.

## 11. Security requirements

Implement:

- Secure login and logout
- Role-based access control
- ADMIN, PROJECT_MANAGER, FLEET_MANAGER, CONTRACT_MANAGER, FINANCE, VIEWER
- Server-side authorization
- Password hashing
- CSRF protection when using cookie-based sessions
- Secure session cookies
- Audit logging for sensitive operations
- Input validation
- Safe document upload
- No hardcoded production credentials

Use secure Spring Security defaults.

Do not implement a custom cryptographic authentication protocol.

## 12. Database requirements

First create an ERD and a normalized relational schema.

Use Flyway SQL migrations.

Create appropriate indexes, foreign keys, uniqueness constraints, and optimistic locking where needed.

Use UTC timestamps and explicit currency codes.

Maintain audit history for commercial records.

Do not use Hibernate automatic schema updates in production.

Provide realistic sample data without pretending that vessel positions are real.

## 13. Frontend requirements

Create a professional enterprise management UI.

Required pages:

- Login
- Dashboard
- Project list and project detail
- Project creation/editing
- Construction site map
- Vessel list and vessel detail
- Fleet tracking map
- Charter contract list and detail
- Contract creation/editing
- Vessel assignment calendar
- Hire statement list
- Reports
- User and role administration

Use reusable components, loading states, empty states, error messages, pagination, filters, and form validation.

The UI should work on desktop and tablet-sized screens.

## 14. Testing requirements

Implement:

- Domain unit tests
- Service tests
- Controller/security tests
- Database integration tests
- Vessel scheduling conflict tests
- Contract rate calculation tests
- Authorization tests
- Frontend component tests for critical workflows

Use Testcontainers for MySQL integration tests when Docker is available.

If Docker access is unavailable, report the exact limitation and run all tests that do not require Docker.

Never claim tests passed unless they actually ran successfully.

## 15. Documentation requirements

Maintain:

docs/requirements.md\
docs/architecture.md\
docs/database.md\
docs/api.md\
docs/business-rules.md\
docs/development-roadmap.md\
docs/decisions.md

Also provide:

- README.md
- .env.example
- Docker Compose configuration
- Local development instructions
- Deployment instructions
- Test instructions

## 16. Implementation strategy

Work incrementally.

Phase 1:

- Analyze requirements
- Produce architecture and ERD
- Set up repository
- Configure backend/frontend/database
- Implement login and authorization
- Implement project CRUD and project locations

Phase 2:

- Implement vessel registry
- Implement vessel position history
- Implement fleet map

Phase 3:

- Implement charter contracts
- Implement vessel assignment
- Implement scheduling conflict detection

Phase 4:

- Implement daily operations
- Implement hire calculations
- Implement project cost reports

Phase 5:

- Implement advanced capabilities and integrations

Phase 6:

- Production hardening and deployment

For each phase:

1. Explain the implementation plan.
2. Identify database changes.
3. Implement backend.
4. Implement frontend.
5. Add tests.
6. Run available verification commands.
7. Fix identified problems.
8. Update documentation.
9. Summarize completed work and remaining issues.

Do not proceed to the next phase until the current phase is reviewed.

## 17. Coding quality standards

Use:

- SOLID principles pragmatically
- Clear naming conventions
- Constructor dependency injection
- DTOs rather than exposing JPA entities
- Appropriate transaction boundaries
- Consistent REST errors
- Structured logging
- Pagination for large collections
- Database migration scripts
- Maintainable modular architecture

Avoid:

- God classes
- Circular module dependencies
- Hardcoded credentials
- Fake implementations presented as complete
- Overengineering
- Unnecessary microservices
- Silent exception swallowing
- Insecure file handling
- Floating-point money calculations

## 18. First task

Before writing application code:

1. Analyze the requirements and identify missing business decisions.
2. Define the MVP boundary.
3. Propose the architecture.
4. Create a complete initial module inventory.
5. Design the core ERD.
6. Define important business workflows.
7. Identify technical risks and assumptions.
8. Create a phased implementation plan.

Ask me only the questions that materially affect architecture or core business rules.

After I approve the architecture, begin Phase 1.

Keep explanations clear because I am learning Java enterprise backend development while building this application.

## **11. How to use Claude Code, Cursor, and Codex effectively**

Instead of asking three AI tools to modify the same files simultaneously, use a controlled workflow.

| Tool        | Suggested role                                               |
| ----------- | ------------------------------------------------------------ |
| Claude Code | Architecture, domain modeling, complex business rules        |
| Cursor      | Frontend development, UI iteration, interactive code editing |
| Codex       | Backend implementation, tests, code review, refactoring      |

These are suggested responsibilities, not fixed limitations. Each tool can perform the other tasks.

Use Git feature branches for isolated work, and integrate only after tests pass. Avoid simultaneous edits to shared Flyway migrations, entity classes, or configuration files.

### **Follow-up prompt for the first implementation**

After the master prompt produces the architecture and you approve it, send:

Implement Phase 1 of the approved Marine Construction Project & Vessel Management System.

First inspect the repository and existing architecture documents.

Build the minimum working vertical slice:

1. Spring Boot backend with Java 21 and Maven.
2. MySQL database with Flyway migrations.
3. Vue 3 + TypeScript + Element Plus frontend.
4. Docker Compose for local development.
5. Secure session-based authentication with role permissions.
6. Customer and project CRUD.
7. Project site coordinates and GeoJSON support.
8. MapLibre project location page.
9. Automated tests for project management and authorization.
10. README with exact startup and verification commands.

Use realistic development seed data.

Do not implement advanced vessel tracking, charter billing, or finance yet.

Run all available tests and build commands. Report any failures and environmental limitations accurately.

When finished, summarize the files changed, implemented endpoints, database tables, test results, and remaining issues.

Stop after Phase 1 and wait for my review.

## **12. Important decisions before coding**

There are several business questions that strongly affect the architecture. You can choose initial defaults now and refine them during requirements analysis.

1\. What kind of vessels will the company manage?

Mainly construction vessels (crane barges, dredgers, tugboats)

Many vessel types, including transport and support vessels

2\. How will vessel locations be obtained initially?

Manual entry and simulated tracking

Real AIS/GPS integration from the beginning

3\. Who will use the system?

One company's internal staff

Multiple independent companies / tenants

4\. What should the first release prioritize?

Projects, vessel registry, maps, rental contracts

Complete operations and financial workflows

Refine the architecture with my choices&#x20;

## **13. My recommended first release**

For your first version, focus on these four connected business capabilities:

**Construction projects**

**Vessel registry and scheduling**

**Construction site and vessel maps**

**Vessel rental contracts**

This gives you a genuinely useful operational system without immediately taking on the complexity of a complete ERP.

The most valuable business workflow to demonstrate is:

**Create project → register vessel → create rental contract → assign vessel → view project and vessel on map → monitor assignment and rental cost.**

Once this works reliably, expand into daily operations, hire settlement, maintenance, and AIS integration.

Because you are also developing your Java backend skills, this project provides experience with enterprise domain modeling, JPA relationships, Spring Security, transactional consistency, geographic data, contract workflows, and Docker deployment—all in one coherent application.&#x20;
