# Enterprise Customer Support System for a Mobile Phone Manufacturer

(Enterprise architecture)

Your customized system will be a **multichannel customer support and product feedback platform for a mobile phone manufacturer**, supporting multiple departments, large customer volumes, and potentially multiple countries.

Unlike a small support ticket application, this system must coordinate customer complaints, device warranties, technical troubleshooting, repair requests, service centers, product quality investigations, and communications across multiple channels.

I recommend designing it as an enterprise-grade **modular monolith with event-driven integration**, with a clear migration path to microservices when business scale justifies the additional complexity.

## 1\. Business scope

Website

Email

Live Chat

---

Unified Customer Support Platform

### Enterprise departments

| Department | Responsibilities |
|--------|--------|
| Customer Service | General inquiries, complaints, account support |
| Technical Support | Hardware, software, connectivity, battery issues |
| Warranty Department | Warranty validation, eligibility, claims |
| Repair / After-Sales | Service requests, repair tracking, RMA |
| Product Quality | Analyze recurring defects and manufacturing issues |
| Engineering | Investigate firmware, software, and hardware defects |
| Supervisors | Monitor queues, agent workload, escalations |
| Administrators | Organization, security, configuration, auditing |

A customer may start a conversation on live chat, continue by email, and later check the case through the website. All interactions should appear in **one unified case timeline**, rather than generating unrelated tickets for every channel.

## 2\. Recommended enterprise technology stack

| Layer | Technology |
|--------|--------|
| Backend | Java 21, Spring Boot, Spring Modulith |
| API | Spring MVC REST, OpenAPI |
| Persistence | Spring Data JPA, Hibernate |
| Database | PostgreSQL 17+ or MySQL 8 |
| Authentication | OIDC provider such as Keycloak |
| Authorization | Spring Security, RBAC + scoped permissions |
| Frontend | Vue 3, TypeScript, Element Plus |
| Live chat | WebSocket with Spring messaging |
| Email | Provider API or SMTP plus inbound webhook/IMAP adapter |
| Async processing | Transactional outbox, RabbitMQ |
| Caching | Redis |
| Search | PostgreSQL full-text initially; OpenSearch later |
| Attachments | S3-compatible object storage |
| Observability | OpenTelemetry, Prometheus, Grafana |
| Deployment | Docker Compose initially, Kubernetes later |
| CI/CD | GitHub Actions or GitLab CI |
| Testing | JUnit, Mockito, Testcontainers, Playwright |

I would choose **PostgreSQL as the default database for a new enterprise system**, although MySQL remains entirely suitable if your organization already standardizes on it. Avoid using both relational databases for the same application at the beginning.

For identity, use an established OIDC provider rather than implementing an enterprise identity platform yourself.

## 3\. Enterprise system architecture

Logical architecture showing channel ingestion, business modules, persistence, and asynchronous integrations. Components can be deployed separately as operational needs grow.

### Architecture principles

**1\. Modular monolith first.** Keep business modules isolated using clear interfaces and Spring Modulith verification. This reduces distributed transaction complexity.

**2\. Event-driven integration.** Publish business events such as `CaseCreated`, `MessageReceived`, `WarrantyValidated`, and `RepairCompleted`\. Use a transactional outbox when events must reliably reach external systems.

**3\. Separate conversations from cases.** A conversation represents communication; a case represents a business issue. Multiple conversations across channels can belong to one case.

**4\. Department-based routing.** Support queue membership, agent skills, languages, product expertise, geographic regions, and workload-based assignment.

**5\. Enterprise security.** Enforce organization, region, department, and case-level permissions on every relevant request, not just frontend visibility.

**6\. Operational resilience.** Email ingestion and message delivery must be idempotent, retryable, monitored, and recoverable without creating duplicate cases.

## 4\. Customized enterprise business modules

I recommend organizing the backend into 16 bounded modules. Not all need to be implemented in the first release.

| Module | Responsibilities | Priority |
|--------|--------|--------|
| Identity &amp; Access | SSO, roles, permissions, agent identity | P0 |
| Organization | Regions, departments, teams, queues | P0 |
| Customer 360 | Customer profiles, contact history, consent | P0 |
| Product &amp; Device | Models, SKU, serial number, IMEI, firmware | P0 |
| Case Management | Tickets, priorities, lifecycle, assignments | P0 |
| Omnichannel | Web, email, live chat, unified timeline | P0 |
| Routing Engine | Skills, queue selection, manual assignment | P0 |
| SLA Management | Response deadlines, escalation, calendars | P1 |
| Warranty | Warranty coverage and eligibility | P1 |
| Repair &amp; RMA | Returns, service orders, repair progress | P1 |
| Knowledge Base | FAQs, troubleshooting, agent articles | P1 |
| Notifications | Email, in-app alerts, templates | P1 |
| Customer Feedback | Suggestions, complaints, surveys, CSAT | P1 |
| Product Quality | Defect classification, trends, investigations | P2 |
| Reporting &amp; Analytics | Agent KPIs, defect trends, service metrics | P2 |
| Integrations &amp; Audit | ERP/CRM connectors, events, audit trails | P0 foundation; P2 advanced integrations |

P0 is the core platform, P1 adds manufacturer-specific operational functionality, and P2 adds advanced enterprise capabilities.

### Manufacturer-specific workflows



**Warranty verification**

A customer provides the phone's serial number or IMEI. The system retrieves device details and checks warranty coverage, purchase evidence, region, and applicable warranty policy.

---



**Repair and RMA management**

A technical agent creates a repair request linked to the case. The customer can track repair stages, service center assignment, and completion.

---



**Product quality investigation**

Repeated battery complaints affecting a particular model and firmware version trigger a quality investigation. Engineering can link multiple cases to a common defect record.

## 5\. Enterprise database design

For this system, the database should reflect three distinct concepts\:

- **Customer and product data\:** Who owns the device, what product is affected, and what warranty applies.
- **Service operations\:** What problem was reported, who is handling it, and what actions have occurred.
- **Communication history\:** Which channel was used, what messages were exchanged, and whether delivery succeeded.

### Recommended tables by domain

| Domain | Main tables |
|--------|--------|
| Organization | `organizations`, `regions`, `departments`, `teams`, `support_queues`, `team_members` |
| Identity | `user_profiles`, `roles`, `permissions`, `user_role_assignments` |
| Customers | `customers`, `customer_contacts`, `customer_consents`, `customer_addresses` |
| Products | `product_models`, `product_skus`, `device_units`, `device_registrations`, `firmware_versions` |
| Case management | `cases`, `case_categories`, `case_assignments`, `case_events`, `case_links` |
| Communication | `conversations`, `conversation_participants`, `messages`, `message_deliveries`, `attachments` |
| Channels | `channel_accounts`, `email_ingestion_records`, `chat_sessions`, `external_message_mappings` |
| Warranty | `warranties`, `warranty_policies`, `warranty_claims` |
| Repair | `repair_orders`, `service_centers`, `repair_events`, `rma_requests` |
| SLA | `sla_policies`, `business_calendars`, `sla_instances`, `escalation_events` |
| Knowledge | `knowledge_articles`, `article_versions`, `article_categories` |
| Feedback | `feedback_submissions`, `satisfaction_surveys`, `survey_responses` |
| Quality | `defect_signatures`, `quality_incidents`, `quality_incident_cases` |
| Integration | `outbox_events`, `inbox_events`, `integration_attempts` |
| Governance | `audit_events`, `data_retention_policies` |

### Important relationships

\#chatgpt-mermaid-\_r_5el\_{font-family:-apple-system-body,ui-sans-serif,-apple-system,system-ui,"Segoe UI",Helvetica,"Apple Color Emoji",Arial,sans-serif,"Segoe UI Emoji","Segoe UI Symbol";font-size:16px;fill:rgb(13, 13, 13);}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#chatgpt-mermaid-\_r_5el\_ .edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-\_r_5el\_ .edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-\_r_5el\_ .error-icon{fill:rgb(243, 243, 243);}#chatgpt-mermaid-\_r_5el\_ .error-text{fill:rgb(13, 13, 13);stroke:rgb(13, 13, 13);}#chatgpt-mermaid-\_r_5el\_ .edge-thickness-normal{stroke-width:1px;}#chatgpt-mermaid-\_r_5el\_ .edge-thickness-thick{stroke-width:3.5px;}#chatgpt-mermaid-\_r_5el\_ .edge-pattern-solid{stroke-dasharray:0;}#chatgpt-mermaid-\_r_5el\_ .edge-thickness-invisible{stroke-width:0;fill:none;}#chatgpt-mermaid-\_r_5el\_ .edge-pattern-dashed{stroke-dasharray:3;}#chatgpt-mermaid-\_r_5el\_ .edge-pattern-dotted{stroke-dasharray:2;}#chatgpt-mermaid-\_r_5el\_ .marker{fill:rgb(143, 143, 143);stroke:rgb(143, 143, 143);}#chatgpt-mermaid-\_r_5el\_ .marker.cross{stroke:rgb(143, 143, 143);}#chatgpt-mermaid-\_r_5el\_ svg{font-family:-apple-system-body,ui-sans-serif,-apple-system,system-ui,"Segoe UI",Helvetica,"Apple Color Emoji",Arial,sans-serif,"Segoe UI Emoji","Segoe UI Symbol";font-size:16px;}#chatgpt-mermaid-\_r_5el\_ p{margin:0;}#chatgpt-mermaid-\_r_5el\_ .entityBox{fill:rgb(222, 234, 251);stroke:rgb(83, 154, 248);}#chatgpt-mermaid-\_r_5el\_ .relationshipLabelBox{fill:rgb(243, 243, 243);opacity:0.7;background-color:rgb(243, 243, 243);}#chatgpt-mermaid-\_r_5el\_ .relationshipLabelBox rect{opacity:0.5;}#chatgpt-mermaid-\_r_5el\_ .labelBkg{background-color:rgba(243, 243, 243, 0.5);}#chatgpt-mermaid-\_r_5el\_ .edgeLabel{background-color:rgb(252, 252, 252);}#chatgpt-mermaid-\_r_5el\_ .edgeLabel .label rect{fill:rgb(252, 252, 252);}#chatgpt-mermaid-\_r_5el\_ .edgeLabel .label text{fill:rgb(13, 13, 13);}#chatgpt-mermaid-\_r_5el\_ .edgeLabel .label{fill:rgb(83, 154, 248);font-size:14px;}#chatgpt-mermaid-\_r_5el\_ .label{font-family:-apple-system-body,ui-sans-serif,-apple-system,system-ui,"Segoe UI",Helvetica,"Apple Color Emoji",Arial,sans-serif,"Segoe UI Emoji","Segoe UI Symbol";color:rgb(13, 13, 13);}#chatgpt-mermaid-\_r_5el\_ .edge-pattern-dashed{stroke-dasharray:8,8;}#chatgpt-mermaid-\_r_5el\_ .node rect,#chatgpt-mermaid-\_r_5el\_ .node circle,#chatgpt-mermaid-\_r_5el\_ .node ellipse,#chatgpt-mermaid-\_r_5el\_ .node polygon{fill:rgb(222, 234, 251);stroke:rgb(83, 154, 248);stroke-width:1px;}#chatgpt-mermaid-\_r_5el\_ .relationshipLine{stroke:rgb(143, 143, 143);stroke-width:1px;fill:none;}#chatgpt-mermaid-\_r_5el\_ .marker{fill:none!important;stroke:rgb(143, 143, 143)!important;stroke-width:1;}#chatgpt-mermaid-\_r_5el\_ [data-look=neo].labelBkg{background-color:rgba(243, 243, 243, 0.5);}#chatgpt-mermaid-\_r_5el\_ .node .neo-node{stroke:rgb(83, 154, 248);}#chatgpt-mermaid-\_r_5el\_ [data-look="neo"].node rect,#chatgpt-mermaid-\_r_5el\_ [data-look="neo"].cluster rect,#chatgpt-mermaid-\_r_5el\_ [data-look="neo"].node polygon{stroke:url(#chatgpt-mermaid-\_r_5el\_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-\_r_5el\_ [data-look="neo"].swimlane.cluster rect{filter:none;}#chatgpt-mermaid-\_r_5el\_ [data-look="neo"].node path{stroke:url(#chatgpt-mermaid-\_r_5el\_-gradient);stroke-width:1px;}#chatgpt-mermaid-\_r_5el\_ [data-look="neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-\_r_5el\_ [data-look="neo"].node .neo-line path{stroke:rgb(83, 154, 248);filter:none;}#chatgpt-mermaid-\_r_5el\_ [data-look="neo"].node circle{stroke:url(#chatgpt-mermaid-\_r_5el\_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-\_r_5el\_ [data-look="neo"].node circle .state-start{fill:#000000;}#chatgpt-mermaid-\_r_5el\_ [data-look="neo"].icon-shape .icon{fill:url(#chatgpt-mermaid-\_r_5el\_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-\_r_5el\_ [data-look="neo"].icon-shape .icon-neo path{stroke:url(#chatgpt-mermaid-\_r_5el\_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-\_r_5el\_ :root{--mermaid-font-family:-apple-system-body,ui-sans-serif,-apple-system,system-ui,"Segoe UI",Helvetica,"Apple Color Emoji",Arial,sans-serif,"Segoe UI Emoji","Segoe UI Symbol";}CUSTOMERDEVICE_UNITPRODUCT_MODELWARRANTYSUPPORT_CASECONVERSATIONMESSAGECASE_EVENTCASE_ASSIGNMENTSUPPORT_QUEUEREPAIR_ORDERSLA_INSTANCEQUALITY_INCIDENTQUALITY_INCIDENT_CASEownsidentifiescovered_bycreatesconcernsincludescontainsrecordsassignedreceivesgeneratesgoverned_bylinkslinked_to



The diagram is simplified. In the implementation, device ownership should be represented through `device_registrations` or an ownership history table rather than assuming ownership never changes.

### Essential database design rules

Use UUIDs or another deliberate distributed-safe identifier strategy for externally exposed records, with separate human-readable case numbers such as `CS-2026-000001`\.

For all enterprise business tables, include appropriate audit metadata, versioning, and organizational scope. Use UTC timestamps in storage, with regional timezone conversion at the application boundary.

Important indexes include `(region_id, status, created_at)`, `(queue_id, status, priority)`, `(customer_id, created_at)`, and unique external message identifiers scoped to their channel account.

Sensitive device identifiers and customer contact details should have restricted access, encryption or tokenization where appropriate, and explicit retention rules. Avoid exposing complete IMEI numbers in ordinary agent search results.

## 6\. Multichannel communication design

This is one of the most important differences between your enterprise system and a basic ticket application.

**Incoming communication**

Website form · Email · Live chat

**Channel Adapter**

Authenticate source, validate, normalize, deduplicate

**Customer and Case Matching**

Resolve identity and associate existing case safely

**Unified Conversation Timeline**

Store messages, attachments, visibility, channel metadata

**Agent Workspace and Outbound Delivery**

Reply, route, notify, audit, retry failed deliveries

For email, store the provider message ID, thread identifiers, ingestion status, and outbound delivery attempts. For live chat, support session reconnects, agent handoff, and transcript persistence.

Do not automatically merge cases based only on a matching email address or subject. Use authenticated customer identity, verified channel identifiers, and explicit matching rules.

For an enterprise manufacturer, multilingual support and regional routing should be designed into the data model early, even if the first release supports only one language and region.

## 7\. Implementation priorities

I would divide the work into eight milestones over roughly 5–8 months for a serious enterprise foundation. This is a planning estimate, not a guaranteed delivery schedule; staffing, integrations, compliance, and production reliability can substantially increase the timeline.

The first meaningful production pilot should demonstrate an end-to-end case across the website, email, and live chat, with secure customer identity matching and reliable message delivery. Manufacturer workflows can then be added without replacing the case-management foundation.

---

# 8\. Enterprise AI coding tools prompt

The following prompt is customized for your requirements and can be used with **Claude Code, OpenAI Codex, or Cursor**\.

It instructs the coding agent to build an enterprise platform incrementally, starting with architecture and a working foundation.

# Enterprise Mobile Phone Customer Support Platform

## Master AI Coding Agent Prompt

### 1. Role and mission

Act as a principal Java software architect, enterprise application engineer, database architect, security engineer, and technical lead.

Design and implement an enterprise-grade, multichannel Customer Support, Feedback, Warranty, and After-Sales Service Management Platform for a mobile phone manufacturer.

The platform must support:

- Multiple regions and departments
- Large customer volumes
- Multiple support teams and agents
- Website customer support
- Inbound and outbound email
- Real-time live chat
- Unified customer support cases
- Product and device registration
- Warranty and repair workflows
- Product quality investigations
- SLA management and escalation
- Enterprise reporting and auditing

Use professional engineering practices, but avoid unnecessary complexity.

I am learning Java backend engineering, so explain important architectural decisions and demonstrate industry-standard patterns.

### 2. Technology stack

Backend:

- Java 21
- Compatible stable Spring Boot release
- Spring Modulith
- Spring MVC
- Spring Security
- Spring Data JPA and Hibernate
- PostgreSQL
- Flyway
- Jakarta Bean Validation
- MapStruct
- Maven
- Spring WebSocket

Identity:

- Keycloak or another standards-compliant OIDC provider
- Spring Security OAuth2 Resource Server or an appropriate BFF/session architecture

Frontend:

- Vue 3
- TypeScript
- Vite
- Element Plus
- Pinia
- Vue Router
- Axios

Infrastructure:

- Docker and Docker Compose
- Redis
- RabbitMQ
- S3-compatible object storage
- Nginx
- OpenTelemetry
- Prometheus and Grafana

Testing:

- JUnit 5
- Mockito
- Spring Boot Test
- Testcontainers
- Playwright

Verify all library and framework versions before implementation.

### 3. Architecture

Use a modular monolith as the initial deployment architecture.

Implement clearly defined bounded contexts using Spring Modulith.

Required modules:

1. Identity and Access
2. Organization and Department Management
3. Customer 360
4. Product Catalog and Device Registration
5. Case Management
6. Omnichannel Communication
7. Agent Routing and Assignment
8. SLA and Escalation
9. Warranty Management
10. Repair and RMA Management
11. Knowledge Base
12. Customer Feedback
13. Notifications
14. Product Quality Management
15. Reporting and Analytics
16. Integration and Audit

Enforce module boundaries and avoid direct access to another module's internal repositories.

Use explicit public interfaces and domain events for intermodule communication.

Do not split the system into microservices during initial development.

Document future service extraction boundaries.

### 4. Enterprise organizational model

Support:

- Organization
- Region
- Department
- Team
- Support queue
- Agent
- Team membership
- Agent skills
- Supported languages
- Agent availability
- Regional business calendars

Implement role-based access control combined with scoped permissions.

Examples:

- Customer
- Support Agent
- Technical Specialist
- Team Supervisor
- Warranty Agent
- Repair Coordinator
- Quality Engineer
- Regional Administrator
- System Administrator

Do not rely on frontend authorization.

Enforce organizational and record-level permissions in the backend.

### 5. Customer and product domain

Customer features:

- Customer profile
- Verified email addresses
- Contact preferences
- Consent records
- Customer interaction history
- Device registrations

Product features:

- Product family
- Product model
- SKU
- Serial number
- IMEI where applicable
- Firmware version
- Manufacturing batch
- Purchase date
- Device registration history

Keep product models separate from individual physical device units.

Implement device ownership history.

Treat device identifiers and customer information as sensitive data.

### 6. Case management

Create a unified SupportCase domain.

Required attributes:

- Internal ID
- Human-readable case number
- Customer
- Product and device
- Region
- Category
- Priority
- Status
- Support queue
- Assigned agent
- Created time
- Updated time
- Resolution time
- Closure time
- Version

Statuses:

- OPEN
- IN_PROGRESS
- WAITING_CUSTOMER
- WAITING_INTERNAL
- RESOLVED
- CLOSED

Implement:

- Explicit state transition rules
- Case assignment
- Reassignment history
- Internal notes
- Case events
- Case reopening
- Case linking
- Case merging with safeguards
- Optimistic concurrency control

All state changes must be transactional and auditable.

### 7. Omnichannel architecture

Support three initial customer channels:

A. Website:

- Authenticated support portal
- Feedback forms
- Ticket creation
- Ticket tracking
- File attachments

B. Email:

- Incoming email ingestion
- Outgoing email delivery
- Email threading
- Message deduplication
- Delivery status
- Retry and failure handling
- Secure attachment handling

C. Live Chat:

- Real-time WebSocket messaging
- Agent assignment
- Chat session lifecycle
- Connection recovery
- Conversation history
- Agent handoff
- Customer authentication

Use channel adapters to normalize inbound communications.

Separate:

- SupportCase
- Conversation
- Message
- MessageDelivery
- ChannelAccount
- ExternalMessageMapping

A case can contain multiple conversations.

A conversation can contain multiple messages.

Messages must record channel, sender, timestamps, visibility, and delivery metadata.

Internal notes must never be delivered to customers.

Implement idempotency for inbound message processing.

Do not automatically associate unrelated messages based on weak identity matching.

### 8. Routing and SLA

Implement an extensible routing engine.

Initial routing:

- Region
- Department
- Product category
- Issue category
- Agent skill
- Queue membership
- Agent availability

Begin with deterministic rule-based routing.

Do not introduce machine learning for the first implementation.

SLA functionality:

- First response deadline
- Resolution deadline
- Business hours
- Holidays
- Regional timezones
- SLA pause and resume rules
- Escalation thresholds
- Supervisor notifications

Record SLA events and violations.

Use durable scheduling and idempotent escalation processing.

### 9. Warranty and repair

Warranty:

- Warranty policy
- Warranty coverage
- Eligibility checks
- Warranty claim
- Claim decision
- Supporting documents

Repair:

- Repair request
- RMA request
- Service center assignment
- Device receipt
- Diagnosis
- Repair progress
- Completion
- Return shipment status

A support case may generate a warranty claim or repair order.

Do not assume that a support case and a repair order are the same entity.

### 10. Product quality management

Support:

- Defect categories
- Defect signatures
- Manufacturing batch references
- Firmware version correlation
- Quality incidents
- Investigation status
- Related support cases
- Engineering notes
- Corrective action references

Allow authorized quality engineers to link multiple cases to a common quality incident.

Protect customer identity when generating aggregated reports.

### 11. Database design

Use PostgreSQL with Flyway migrations.

Create normalized relational schemas.

Design tables for:

- Organizations and regions
- Departments and teams
- Customers and identities
- Product models and devices
- Cases and assignments
- Conversations and messages
- Email and chat integration
- Warranty and repairs
- SLA policies and instances
- Knowledge articles
- Feedback and surveys
- Quality incidents
- Outbox and inbox events
- Audit history

Use:

- Explicit foreign keys
- Unique constraints
- Appropriate indexes
- UTC timestamps
- Optimistic locking
- Pagination
- Referential integrity

Avoid Hibernate ddl-auto=update.

Do not introduce database partitioning without measured need.

Document indexing and retention strategies.

### 12. Event-driven integration

Use a transactional outbox pattern for reliable asynchronous integration.

Initial domain events:

- CaseCreated
- CaseAssigned
- CaseStatusChanged
- CustomerMessageReceived
- AgentReplyCreated
- WarrantyClaimSubmitted
- RepairOrderCreated
- RepairCompleted
- SlaBreached
- QualityIncidentCreated

Use RabbitMQ where asynchronous delivery is needed.

Consumers must be idempotent.

Support retries, failure handling, dead-letter queues, and operational monitoring.

Do not publish messages directly from an uncommitted database transaction.

### 13. Security and privacy

Use OIDC authentication.

Implement:

- Least-privilege authorization
- Regional and department scopes
- Customer record ownership checks
- Secure WebSocket authentication
- CSRF protection where relevant
- Strict CORS policy
- Rate limiting
- Secure file uploads
- Audit logging
- Sensitive data masking
- Secret management
- Configurable data retention
- Data deletion and export workflows where legally required

Use the appropriate privacy requirements for the deployment jurisdiction.

Do not assume compliance merely because security controls exist.

Never hardcode production secrets.

### 14. REST API

Use /api/v1.

Design APIs for:

- Authentication integration
- Customers
- Products
- Device registration
- Support cases
- Conversations
- Messages
- Attachments
- Queues
- Agent assignment
- Warranty
- Repair orders
- SLA
- Knowledge base
- Feedback
- Quality incidents
- Reporting

Use request and response DTOs.

Support pagination, sorting, and filtering.

Use consistent error handling and OpenAPI documentation.

Prevent mass-assignment vulnerabilities.

### 15. Frontend applications

Create three role-oriented interfaces.

Customer Portal:

- Registration and login
- Device registration
- Submit support request
- Ticket tracking
- Email-linked conversation history
- Live chat
- Warranty status
- Repair status
- Knowledge base
- Satisfaction survey

Agent Workspace:

- Unified inbox
- Queue dashboard
- Assigned cases
- Customer profile
- Device details
- Case conversation
- Internal notes
- Assignment and escalation
- Knowledge article search
- SLA countdown

Management Portal:

- Organization and team management
- Agent permissions
- Routing rules
- SLA policies
- Product catalog
- Warranty policies
- Quality investigations
- Reporting dashboards
- Audit review

Use reusable Vue components and consistent frontend architecture.

### 16. Testing

Implement:

- Unit tests
- Integration tests
- API authorization tests
- Module boundary verification
- Database migration tests
- Message idempotency tests
- Email ingestion tests
- WebSocket integration tests
- Concurrency tests
- End-to-end browser tests
- Load tests for critical workflows

Use Testcontainers for PostgreSQL and other infrastructure dependencies.

Include negative and failure-path tests.

Do not claim tests passed unless actually executed.

### 17. Observability and operations

Implement:

- Structured JSON logging
- Correlation IDs
- Distributed tracing where applicable
- Application metrics
- Health and readiness endpoints
- Message queue metrics
- Email delivery metrics
- Ticket processing metrics
- Database connection monitoring

Provide dashboards and alert recommendations.

Avoid exposing sensitive data through logs, metrics, or traces.

### 18. Deployment

Create a local development environment using Docker Compose.

Include:

- PostgreSQL
- Keycloak
- RabbitMQ
- Redis
- S3-compatible storage
- Spring Boot backend
- Vue frontend
- Nginx

Use development-only credentials in example configuration.

Provide:

- Dockerfiles
- compose.yaml
- .env.example
- Database migrations
- Health checks
- Persistent volumes
- Deployment instructions

Document a future Kubernetes deployment architecture, but do not require Kubernetes for initial development.

### 19. Project repository

Use a monorepo:

customer-support-platform/\
backend/\
frontend/\
customer-portal/\
agent-workspace/\
management-portal/\
shared/\
infrastructure/\
docker/\
nginx/\
monitoring/\
docs/\
architecture/\
database/\
api/\
security/\
operations/\
tests/\
e2e/\
performance/\
compose.yaml\
README.md

### 20. Implementation milestones

Milestone 1:\
Project foundation, Spring Modulith, PostgreSQL, Flyway, OIDC integration, Docker Compose.

Milestone 2:\
Organization, customers, products, devices, case management.

Milestone 3:\
Customer website and case tracking.

Milestone 4:\
Email ingestion, outbound email, live chat, unified conversations.

Milestone 5:\
Agent queues, routing, SLA, escalation.

Milestone 6:\
Warranty, repair, RMA.

Milestone 7:\
Knowledge base, customer feedback, product quality, analytics.

Milestone 8:\
Security hardening, observability, load testing, deployment readiness.

For each milestone:

1. Present the implementation plan.
2. Explain architectural decisions.
3. Implement the required code.
4. Write database migrations.
5. Add automated tests.
6. Run builds and tests.
7. Fix verified errors.
8. Update documentation.
9. Summarize completed work.
10. Stop for review before the next milestone.

Do not implement all milestones at once.

### 21. Engineering quality standards

Use:

- Constructor dependency injection
- Explicit module boundaries
- Domain-specific services
- Transaction boundaries
- DTO mapping
- Bean validation
- Consistent error responses
- Structured logging
- Database migrations
- Automated testing
- Secure configuration

Avoid:

- God classes
- Circular module dependencies
- Exposing JPA entities
- Business logic in controllers
- Hardcoded credentials
- Unbounded database queries
- Synchronous chains of unreliable external calls
- Premature microservices
- Unnecessary design patterns
- Untested large-scale code generation

### 22. First assignment

Do not start by generating the entire application.

First produce:

1. Enterprise software requirements specification.
2. Architecture decision records.
3. Spring Modulith module boundaries.
4. Mermaid component diagram.
5. Mermaid domain model and ER diagram.
6. Detailed initial database schema.
7. REST API inventory.
8. Omnichannel message ingestion architecture.
9. Enterprise security model.
10. Repository structure.
11. Milestone implementation plan.
12. Major technical risks and mitigations.

State assumptions and identify unresolved business decisions.

Then implement Milestone 1 only.

Milestone 1 must include:

- Runnable Spring Boot backend
- Spring Modulith configuration
- PostgreSQL connection
- Flyway baseline migration
- Keycloak development integration
- Health endpoint
- Docker Compose environment
- Automated smoke tests
- Setup documentation

Verify the application starts and tests pass before reporting completion.

Wait for my approval before beginning Milestone 2.



## 9\. How I recommend using AI coding tools

Because this is a large enterprise system, separate architecture design, implementation, and code review.

| Tool | Suggested responsibility |
|--------|--------|
| Claude Code | Architecture planning, domain modeling, complex business logic |
| Codex | Backend implementation, tests, refactoring, debugging |
| Cursor | Vue frontend development, UI integration, code navigation |

These are suggested roles, not strict limitations. Each tool can handle work across the stack.

A useful workflow is to maintain `docs/architecture.md`, `docs/decisions/`, and `AGENTS.md` in the repository. This helps different coding agents follow the same architecture and conventions.

## 10\. Additional enterprise decisions

Before coding, the most consequential unresolved requirements are the operating regions, number of agents, expected daily case volume, existing ERP/CRM systems, email provider, and whether warranty and repair services are handled internally or by third-party service centers.

Those decisions influence deployment topology, integration boundaries, identity management, data residency, and capacity planning.

For your first release, I recommend these defaults\:

- One manufacturer, multiple regions and departments.
- English interface initially, with internationalization support.
- Website, email, and live chat as the first three channels.
- One shared case-management backend.
- PostgreSQL as the transactional database.
- Rule-based routing before intelligent routing.
- A modular monolith before microservices.
- Docker Compose for development and a separately designed, highly available production environment.

**The most important architectural choice is to make the support case the central business object, while keeping conversations, devices, warranties, repairs, and quality investigations as separate but connected domains.** That design will let your application grow from customer feedback management into a comprehensive manufacturer after-sales service platform without requiring a complete rewrite.
