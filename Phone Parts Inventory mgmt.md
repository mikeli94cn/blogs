# Phone Parts Inventory Management System
## Complete Java Development Roadmap + AI Coding Tools Prompt

You want to develop a **Phone Parts Inventory Management System** for a mobile phone repair shop, using the Java technology stack.

I recommend building this as a **production-oriented, full-stack web application**, following mainstream enterprise Java development practices.

The system should help phone repair shops manage:

- 📱 Phone replacement parts and accessories
- 📦 Inventory and warehouse stock
- 🛒 Purchasing and suppliers
- 🔧 Phone repair jobs and parts consumption
- 💰 Sales, costs, and profit
- 👥 Customers and employees
- 📊 Reports and inventory alerts
- 🏬 Multiple shops and warehouses (future expansion)

Since you're learning Java backend development and using AI coding tools such as Claude Code, Cursor, and Codex, I recommend a **modular monolith architecture with Spring Boot**, rather than starting with microservices.

This will give you practical experience with enterprise Java development while keeping the project manageable.

---

# 1. Project Overview

## 1.1 Project Name

Suggested name:

**Phone Parts Inventory Management System (PPIMS)**

Alternative commercial name: **RepairStock**

## 1.2 Target Users

The application is designed for:

| User | Responsibilities |
|---|---|
| Shop Owner | Monitor inventory, sales, costs, and profits |
| Shop Manager | Manage purchasing, stock, and employees |
| Repair Technician | Manage repair orders and consume parts |
| Inventory Clerk | Receive parts and manage stock |
| Salesperson | Sell phone parts and accessories |
| Administrator | Manage users, roles, and system settings |

For the initial version, support one repair shop with multiple employees.

Later, extend it to multiple shops and warehouses.

## 1.3 Core Business Workflow

A typical phone repair shop operates as follows:

```text
                  Supplier
                     |
                     v
              Purchase Order
                     |
                     v
              Goods Receiving
                     |
                     v
             Inventory Storage
                     |
          +----------+----------+
          |                     |
          v                     v
     Repair Order           Retail Sale
          |                     |
          v                     v
     Parts Consumption      Stock Deduction
          |                     |
          v                     v
     Repair Completed       Sale Completed
          |                     |
          +----------+----------+
                     |
                     v
              Profit Reporting
```

Example:

A repair shop purchases:

```text
iPhone 13 LCD Screen
Quantity: 20
Purchase Price: $35
Selling Price: $60
```

A customer brings an iPhone 13 for screen replacement.

The technician:

1. Creates a repair order.
2. Selects the replacement screen.
3. Checks available inventory.
4. Reserves one screen for the repair.
5. Installs the screen.
6. Records the part as consumed.
7. Completes the repair.
8. Charges the customer $90.

The system updates:

```text
Original Stock:       20
Consumed Quantity:     1
Remaining Stock:      19

Parts Cost:          $35
Repair Revenue:      $90
Gross Profit:        $55
```

This is a simplified gross profit calculation excluding labor cost, taxes, and other expenses.

The important design principle is that **inventory changes must be connected to business transactions**, rather than allowing arbitrary modifications to stock quantities.

---

# 2. Recommended Technology Stack

I recommend the following stack.

| Layer | Technology | Purpose |
|---|---|---|
| Programming Language | Java 21 LTS | Backend development |
| Backend Framework | Spring Boot 3.5.x | REST API and application framework |
| Dependency Injection | Spring Framework | IoC and dependency management |
| Persistence | Spring Data JPA | Database access |
| ORM | Hibernate | Object-relational mapping |
| Database | MySQL 8.4 LTS | Relational data storage |
| Database Migration | Flyway | Database schema versioning |
| Security | Spring Security | Authentication and authorization |
| Authentication | Session cookies initially | Secure browser authentication |
| Validation | Jakarta Bean Validation | Request validation |
| API Documentation | Springdoc OpenAPI | Swagger UI |
| Build Tool | Maven | Dependency management |
| Backend Testing | JUnit 5, Mockito | Unit testing |
| Integration Testing | Testcontainers | Database integration testing |
| Frontend | Vue 3 + TypeScript | User interface |
| UI Framework | Element Plus | Business administration interface |
| State Management | Pinia | Frontend state |
| HTTP Client | Axios | REST API communication |
| Reverse Proxy | Nginx | Web serving and reverse proxy |
| Containerization | Docker + Compose | Development and deployment |
| Version Control | Git | Source management |

**Version note:** Java 21, MySQL 8.4 LTS, and Spring Boot 3.5.x form a reasonable conservative baseline. Before implementation, verify supported versions and security updates. Spring Boot 4 is another option, but I would avoid mixing major-version migrations into your first implementation.

Official references:

- [Spring Boot](https://spring.io/projects/spring-boot?utm_source=chatgpt.com)
- [Spring Data JPA](https://spring.io/projects/spring-data-jpa?utm_source=chatgpt.com)
- [Hibernate ORM](https://hibernate.org/orm/?utm_source=chatgpt.com)
- [MySQL](https://dev.mysql.com/doc/?utm_source=chatgpt.com)
- [Vue.js](https://vuejs.org/?utm_source=chatgpt.com)
- [Element Plus](https://element-plus.org/?utm_source=chatgpt.com)

### Why Vue instead of React?

Both are suitable.

For an inventory management application, Vue 3 with Element Plus offers convenient components such as:

- Data tables
- Search forms
- Pagination
- Dialogs
- Date pickers
- Inventory management forms
- Administrative dashboards

This combination is especially practical for a traditional business management system.

---

# 3. System Architecture

## 3.1 Recommended Architecture

Use a **modular monolith with layered architecture**.

```text
                  CLIENT LAYER
          +-------------------------+
          | Vue 3 + TypeScript      |
          | Element Plus            |
          |                         |
          | Dashboard               |
          | Inventory               |
          | Purchasing              |
          | Repairs                 |
          | Sales                   |
          +------------+------------+
                       |
                  HTTPS / REST
                       |
                       v
                NGINX REVERSE PROXY
                       |
                       v
          +-------------------------+
          |    SPRING BOOT          |
          |                         |
          |  Security Layer         |
          |         |               |
          |         v               |
          |  REST Controllers       |
          |         |               |
          |         v               |
          |  Application Services   |
          |         |               |
          |         v               |
          |  Domain Logic           |
          |         |               |
          |         v               |
          |  Repositories           |
          +------------+------------+
                       |
                       v
                Hibernate / JPA
                       |
                       v
                  MySQL 8.4
```

## 3.2 Why Not Microservices?

Microservices introduce additional complexity:

- Distributed transactions
- Service discovery
- Interservice communication
- Distributed tracing
- Multiple deployments
- More infrastructure

Your application does not initially need these capabilities.

A modular monolith provides clear module boundaries while keeping everything inside one deployable Spring Boot application.

Later, individual modules can be extracted if justified by scale or organizational requirements.

---

# 4. Functional Modules

I recommend organizing the application into **10 business modules**.

## Module 1: Product and Parts Management

This module manages the catalog of phone replacement parts.

### Main Features

- Create, update, and deactivate parts
- Generate or assign SKU codes
- Organize parts by category
- Manage manufacturers and brands
- Record compatible phone models
- Manage product images
- Set purchase and selling prices
- Manage minimum stock thresholds
- Search and filter products
- Import/export products using CSV or Excel

### Product Categories

Examples:

```text
Phone Parts
|
+-- Screens
|   +-- LCD
|   +-- OLED
|   +-- Touch Digitizer
|
+-- Batteries
|
+-- Charging Components
|   +-- Charging Port
|   +-- Charging Flex Cable
|
+-- Cameras
|   +-- Front Camera
|   +-- Rear Camera
|
+-- Speakers
|
+-- Microphones
|
+-- Motherboards
|
+-- Back Covers
|
+-- Buttons
|
+-- Accessories
    +-- Chargers
    +-- USB Cables
    +-- Phone Cases
```

### Important Feature: Phone Compatibility

A replacement part may support multiple phone models.

For example:

```text
Part: USB-C Charging Cable

Compatible Models:
- Samsung Galaxy S23
- Samsung Galaxy S24
- Google Pixel 8
```

Conversely, a phone model can have multiple compatible parts.

Therefore, use a **many-to-many relationship**.

```text
Product
   |
   | many-to-many
   |
PhoneModel
```

Database implementation:

```text
products
phone_models
product_compatibilities
```

For screens and batteries, compatibility information is particularly important.

A technician should be able to search:

> Show all compatible replacement screens for iPhone 13.

---

## Module 2: Inventory Management

This is the core module.

### Main Features

- Current stock quantities
- Available and reserved stock
- Inventory movements
- Stock adjustments
- Low-stock alerts
- Inventory transfers
- Stocktaking
- Damaged parts tracking
- Inventory valuation
- Inventory movement history

### Inventory Movement Types

| Movement | Effect |
|---|---|
| Purchase Receipt | Increase stock |
| Retail Sale | Decrease stock |
| Repair Consumption | Decrease stock |
| Customer Return | Increase stock if accepted |
| Supplier Return | Decrease stock |
| Stock Adjustment | Increase or decrease |
| Warehouse Transfer | Decrease source, increase destination |
| Stocktaking Correction | Adjust stock after approval |

### Critical Design: Inventory Ledger

Do not rely solely on a `quantity` field in the product table.

Instead, maintain an inventory ledger.

Example:

| Date | Product | Type | Change | Balance |
|---|---|---|---:|---:|
| Nov 1 | iPhone 13 Screen | Purchase | +20 | 20 |
| Nov 3 | iPhone 13 Screen | Repair | -1 | 19 |
| Nov 5 | iPhone 13 Screen | Sale | -2 | 17 |
| Nov 7 | iPhone 13 Screen | Return | +1 | 18 |

A ledger allows the shop owner to answer:

- Why did inventory decrease?
- Which employee consumed the part?
- Which repair order used it?
- When was the stock received?
- What was the purchase cost?

### Recommended Inventory Design

Use two related structures:

**1. Inventory Balance**

Stores current stock for efficient queries.

```text
inventory_balances
------------------
id
product_id
warehouse_id
quantity_on_hand
quantity_reserved
version
updated_at
```

Available stock is calculated as:

```text
available = quantity_on_hand - quantity_reserved
```

**2. Inventory Transaction Ledger**

Stores historical stock movements.

```text
inventory_transactions
----------------------
id
product_id
warehouse_id
movement_type
quantity_change
reference_type
reference_id
created_by
created_at
```

Both structures must be updated atomically inside the same database transaction.

For financial accuracy, also record cost information and preserve historical transaction prices.

---

## Module 3: Supplier Management

This module manages vendors supplying replacement parts.

### Features

- Supplier profiles
- Contact information
- Supplier product catalog
- Supplier-specific part numbers
- Purchase price history
- Supplier performance
- Purchase history
- Outstanding purchase orders

Example:

```text
Supplier: Shenzhen Mobile Parts Ltd.

Products:
- iPhone Screens
- Samsung Batteries
- Charging Ports

Contact:
- Email
- Telephone
- Address
```

A product may be supplied by several vendors.

Therefore:

```text
Supplier <---> Product
```

Use a junction table:

```text
supplier_products
```

It can contain:

```text
supplier_id
product_id
supplier_sku
last_purchase_price
minimum_order_quantity
lead_time_days
```

---

## Module 4: Purchase Order Management

This module controls the purchasing process.

### Workflow

```text
Purchase Order Created
          |
          v
        DRAFT
          |
          v
       APPROVED
          |
          v
        ORDERED
          |
          v
   PARTIALLY_RECEIVED
          |
          v
      RECEIVED
          |
          v
        CLOSED
```

Cancellation should be supported only from permitted states.

### Main Features

- Create purchase orders
- Add purchase order items
- Calculate totals
- Approve purchases
- Record partial deliveries
- Record received quantities
- Update inventory automatically
- Track purchase order status
- Record supplier invoices

Example:

```text
Purchase Order: PO-2026-001

Supplier: ABC Phone Parts

Items:
------------------------------------
iPhone 13 Screen    20 x $35 = $700
Samsung S23 Battery 10 x $18 = $180
------------------------------------

Total: $880
```

When the supplier delivers the goods, the inventory increases.

**Important:** Creating or approving a purchase order must not increase inventory. Stock increases only when goods are physically received and the receipt is posted.

---

## Module 5: Repair Order Management

This module connects inventory with the repair shop's daily operations.

### Main Features

- Customer registration
- Phone model selection
- Device issue description
- Repair status tracking
- Technician assignment
- Parts reservation
- Parts consumption
- Labor charges
- Repair cost calculation
- Repair completion
- Repair history

### Repair Workflow

```text
Customer Arrives
       |
       v
Create Repair Order
       |
       v
Device Inspection
       |
       v
Repair Quotation
       |
       v
Customer Approval
       |
       v
Parts Reservation
       |
       v
Repair In Progress
       |
       v
Parts Consumption
       |
       v
Repair Completed
       |
       v
Customer Payment
       |
       v
Device Returned
```

### Example Repair Order

```text
Repair Order: REP-2026-001

Customer: John Smith

Device:
    Brand: Apple
    Model: iPhone 13

Problem:
    Broken screen

Technician:
    David

Parts:
    iPhone 13 OLED Screen

Parts Cost:
    $35

Parts Charge:
    $60

Labor Charge:
    $30

Customer Total:
    $90

Gross Profit:
    $55
```

The system should record both parts costs and customer charges.

For privacy, avoid storing unnecessary device identifiers or customer information. Do not store device unlock passwords in plaintext.

---

## Module 6: Sales Management

Some repair shops also sell spare parts and accessories directly.

### Features

- Point-of-sale transactions
- Sales order creation
- Shopping cart
- Barcode scanning
- Discounts
- Tax calculation
- Payment recording
- Receipts
- Sales returns
- Refunds

### Sales Workflow

```text
Select Products
      |
      v
Check Inventory
      |
      v
Create Sale
      |
      v
Record Payment
      |
      v
Confirm Sale
      |
      v
Deduct Inventory
      |
      v
Generate Receipt
```

For an initial version, focus on simple completed sales.

Advanced features such as split payments, partial refunds, and payment gateway integration can be implemented later.

---

## Module 7: Customer Management

### Features

- Customer profiles
- Contact details
- Repair history
- Purchase history
- Device history
- Warranty tracking
- Customer search

Example:

```text
Customer
   |
   +-- Devices
   |
   +-- Repair Orders
   |
   +-- Sales Orders
```

---

## Module 8: Reporting and Analytics

This module provides management information.

### Dashboard Metrics

| Metric | Example |
|---|---:|
| Total Products | 850 |
| Total Stock Units | 4,500 |
| Inventory Value | $52,000 |
| Low-Stock Products | 28 |
| Monthly Sales | $18,500 |
| Monthly Repair Revenue | $12,000 |
| Monthly Gross Profit | $8,200 |
| Open Repair Orders | 35 |

These are illustrative values.

### Recommended Reports

**Inventory Reports**

- Current inventory
- Low-stock products
- Stock movement history
- Inventory valuation
- Dead stock and slow-moving products

**Purchasing Reports**

- Purchase totals
- Supplier spending
- Purchase price trends
- Outstanding purchase orders

**Sales Reports**

- Daily sales
- Monthly sales
- Best-selling parts
- Gross profit by product

**Repair Reports**

- Repairs completed
- Repair revenue
- Parts consumed
- Technician workload
- Repair profitability

For the first version, implement reports using SQL aggregation queries.

You do not need Elasticsearch, a data warehouse, or a separate analytics platform.

---

## Module 9: User and Role Management

Use Spring Security.

### Recommended Roles

```text
ADMIN
OWNER
MANAGER
INVENTORY_CLERK
TECHNICIAN
SALESPERSON
```

### Permissions

| Function | Owner | Manager | Technician | Inventory Clerk |
|---|---|---|---|---|
| View Inventory | Yes | Yes | Yes | Yes |
| Modify Product Catalog | Yes | Yes | No | Limited |
| Create Purchase Order | Yes | Yes | No | Yes |
| Approve Purchase Order | Yes | Yes | No | No |
| Create Repair Order | Yes | Yes | Yes | No |
| Consume Repair Parts | Yes | Yes | Yes | No |
| Adjust Inventory | Yes | Yes | No | With Approval |
| View Profit Reports | Yes | Yes | No | No |
| Manage Users | Yes | Limited | No | No |

For browser-based deployment, I recommend secure, HTTP-only session cookies with CSRF protection.

JWT can be introduced later if you add a separate mobile application or external API clients.

---

## Module 10: System Administration

### Features

- Shop information
- Tax settings
- Currency settings
- Product categories
- Stock alert thresholds
- Audit logs
- Data export
- Backup procedures
- User management

For future expansion:

```text
Organization
    |
    +-- Shop A
    |      |
    |      +-- Warehouse A
    |
    +-- Shop B
           |
           +-- Warehouse B
```

---

# 5. Database Design

For this project, database design is particularly important.

I recommend MySQL with normalized relational tables.

## 5.1 Core Tables

### Product Catalog

```text
products
product_categories
brands
phone_models
product_compatibilities
product_images
```

### Inventory

```text
warehouses
inventory_balances
inventory_transactions
inventory_reservations
stock_adjustments
stock_adjustment_items
stocktakes
stocktake_items
```

### Purchasing

```text
suppliers
supplier_products
purchase_orders
purchase_order_items
goods_receipts
goods_receipt_items
```

### Repair

```text
customers
customer_devices
repair_orders
repair_order_parts
repair_status_history
```

### Sales

```text
sales_orders
sales_order_items
payments
sales_returns
```

### Security

```text
users
roles
permissions
user_roles
role_permissions
audit_logs
```

This is a starting logical model, not a final migration specification. Some supporting tables, such as cost layers, refunds, and inventory transfer records, should be added as their workflows are implemented.

## 5.2 Important Relationships

```text
ProductCategory
      |
      | 1:N
      v
    Product
      |
      +----------------------+
      |                      |
      v                      v
InventoryBalance       PurchaseOrderItem
      |                      |
      v                      v
  Warehouse             PurchaseOrder
                             |
                             v
                          Supplier


Customer
    |
    | 1:N
    v
RepairOrder
    |
    | 1:N
    v
RepairOrderPart
    |
    | N:1
    v
Product
```

## 5.3 Example Product Table

```sql
CREATE TABLE products (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,

    sku VARCHAR(64) NOT NULL UNIQUE,

    name VARCHAR(255) NOT NULL,

    category_id BIGINT NOT NULL,

    description TEXT,

    default_purchase_price DECIMAL(12,2),

    selling_price DECIMAL(12,2) NOT NULL,

    minimum_stock INT NOT NULL DEFAULT 0,

    active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at DATETIME(6) NOT NULL,

    updated_at DATETIME(6) NOT NULL,

    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id)
        REFERENCES product_categories(id),

    CONSTRAINT chk_product_purchase_price
        CHECK (
            default_purchase_price IS NULL
            OR default_purchase_price >= 0
        ),

    CONSTRAINT chk_product_selling_price
        CHECK (selling_price >= 0),

    CONSTRAINT chk_product_minimum_stock
        CHECK (minimum_stock >= 0)
);
```

Use `DECIMAL` in MySQL and `BigDecimal` in Java for monetary values.

Do not use `double` or `float` for prices.

For an international system, add currency codes and explicit exchange-rate handling rather than assuming all monetary values use the same currency.

---

# 6. Inventory Consistency: The Most Important Technical Challenge

Inventory management is more complicated than ordinary CRUD development.

Consider this situation:

```text
Available stock: 1

Technician A requests 1 screen.
Technician B requests 1 screen.

Both requests arrive simultaneously.
```

Without concurrency control, both requests may succeed.

The resulting stock becomes:

```text
Stock = -1
```

This is an inventory consistency bug.

## Recommended Solution

Use database transactions and concurrency control.

For example:

```java
@Transactional
public void consumePart(
        Long productId,
        Long warehouseId,
        int quantity) {

    InventoryBalance balance =
        inventoryRepository.findForUpdate(
            productId,
            warehouseId
        ).orElseThrow();

    int available =
        balance.getQuantityOnHand()
        - balance.getQuantityReserved();

    if (available < quantity) {
        throw new InsufficientStockException(
            "Insufficient stock"
        );
    }

    balance.setQuantityOnHand(
        balance.getQuantityOnHand() - quantity
    );

    InventoryTransaction transaction =
        new InventoryTransaction();

    transaction.setProductId(productId);
    transaction.setWarehouseId(warehouseId);
    transaction.setQuantityChange(-quantity);
    transaction.setMovementType(
        MovementType.REPAIR_CONSUMPTION
    );

    inventoryTransactionRepository.save(transaction);
}
```

This is illustrative service logic, not a complete implementation.

The repository's `findForUpdate()` must actually acquire a database lock, for example using JPA `PESSIMISTIC_WRITE`.

A production implementation also needs to:

- Handle reserved stock correctly.
- Link consumption to a repair order.
- Prevent duplicate consumption.
- Record the employee and timestamp.
- Handle retries and transaction failures.
- Store the cost of the consumed part.
- Enforce valid repair-order states.

### Additional Design Rules

**1. Never permit negative available inventory.**

**2. All stock changes must have a business reason.**

**3. Stock movements must be auditable.**

**4. Inventory operations must be transactional.**

**5. Posted stock transactions should not be silently deleted or modified.**

Corrections should use reversal or adjustment transactions.

**6. Inventory balances and inventory ledgers must remain consistent.**

**7. Repeated API requests must not cause duplicate stock movements.**

For posting operations, use idempotency keys or unique business transaction identifiers.

These rules are essential for a reliable inventory system.

---

# 7. Recommended Java Project Structure

I recommend **package-by-feature**, rather than organizing the entire project into global controller, service, and repository directories.

Example:

```text
phone-parts-inventory/
│
├── backend/
│   │
│   ├── pom.xml
│   │
│   └── src/
│       ├── main/
│       │   ├── java/
│       │   │   └── com/example/ppims/
│       │   │       │
│       │   │       ├── PpimsApplication.java
│       │   │       │
│       │   │       ├── common/
│       │   │       │   ├── exception/
│       │   │       │   ├── response/
│       │   │       │   └── config/
│       │   │       │
│       │   │       ├── security/
│       │   │       │
│       │   │       ├── product/
│       │   │       │   ├── controller/
│       │   │       │   ├── service/
│       │   │       │   ├── repository/
│       │   │       │   ├── entity/
│       │   │       │   └── dto/
│       │   │       │
│       │   │       ├── inventory/
│       │   │       │   ├── controller/
│       │   │       │   ├── service/
│       │   │       │   ├── repository/
│       │   │       │   ├── entity/
│       │   │       │   └── dto/
│       │   │       │
│       │   │       ├── supplier/
│       │   │       │
│       │   │       ├── purchasing/
│       │   │       │
│       │   │       ├── repair/
│       │   │       │
│       │   │       ├── sales/
│       │   │       │
│       │   │       ├── customer/
│       │   │       │
│       │   │       ├── reporting/
│       │   │       │
│       │   │       └── administration/
│       │   │
│       │   └── resources/
│       │       ├── application.yml
│       │       ├── application-dev.yml
│       │       ├── application-prod.yml
│       │       └── db/migration/
│       │
│       └── test/
│
├── frontend/
│   ├── package.json
│   ├── src/
│   │   ├── api/
│   │   ├── components/
│   │   ├── views/
│   │   ├── router/
│   │   ├── stores/
│   │   └── types/
│   │
│   └── public/
│
├── docker/
│   ├── backend.Dockerfile
│   └── nginx.conf
│
├── docs/
│   ├── architecture.md
│   ├── database-design.md
│   ├── api-design.md
│   └── development-roadmap.md
│
├── compose.yaml
├── .env.example
├── .gitignore
└── README.md
```

This structure is suitable for both manual development and AI-assisted coding.

---

# 8. REST API Design

Use RESTful conventions.

## Product APIs

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/v1/products` | List products |
| GET | `/api/v1/products/{id}` | Product details |
| POST | `/api/v1/products` | Create product |
| PUT | `/api/v1/products/{id}` | Update product |
| DELETE | `/api/v1/products/{id}` | Deactivate product |
| GET | `/api/v1/products/low-stock` | Low-stock products |

## Inventory APIs

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/v1/inventory/balances` | Inventory balances |
| GET | `/api/v1/inventory/transactions` | Movement history |
| POST | `/api/v1/inventory/adjustments` | Create adjustment |
| POST | `/api/v1/inventory/adjustments/{id}/post` | Post adjustment |
| GET | `/api/v1/inventory/alerts` | Stock alerts |

## Purchasing APIs

```http
GET    /api/v1/purchase-orders
POST   /api/v1/purchase-orders
GET    /api/v1/purchase-orders/{id}
PUT    /api/v1/purchase-orders/{id}
POST   /api/v1/purchase-orders/{id}/approve
POST   /api/v1/purchase-orders/{id}/receipts
```

## Repair APIs

```http
GET    /api/v1/repairs
POST   /api/v1/repairs
GET    /api/v1/repairs/{id}
PUT    /api/v1/repairs/{id}

POST   /api/v1/repairs/{id}/approve
POST   /api/v1/repairs/{id}/reserve-parts
POST   /api/v1/repairs/{id}/consume-parts
POST   /api/v1/repairs/{id}/complete
```

The backend must validate every state transition and enforce authorization.

Frontend button visibility alone is not sufficient security.

---

# 9. Frontend Design

I recommend a conventional administration dashboard.

## Main Navigation

```text
Phone Parts Inventory System
│
├── Dashboard
│
├── Products
│   ├── Product List
│   ├── Categories
│   ├── Brands
│   └── Phone Compatibility
│
├── Inventory
│   ├── Current Stock
│   ├── Stock Movements
│   ├── Stock Adjustments
│   ├── Stocktaking
│   └── Low-Stock Alerts
│
├── Purchasing
│   ├── Suppliers
│   ├── Purchase Orders
│   └── Goods Receiving
│
├── Repairs
│   ├── Repair Orders
│   ├── Repair Queue
│   └── Repair History
│
├── Sales
│   ├── Point of Sale
│   ├── Sales History
│   └── Returns
│
├── Customers
│
├── Reports
│
└── Administration
    ├── Users
    ├── Roles
    └── Settings
```

For the dashboard, include:

- Total inventory value
- Products below reorder threshold
- Today's sales
- Open repair orders
- Recent stock movements
- Most frequently used replacement parts

Design the UI to work on desktop computers and tablets.

A repair technician may need to check inventory from a tablet or phone while working.

---

# 10. Development Roadmap

I recommend dividing development into **eight phases**.

The following timeline assumes part-time development with AI assistance. Actual duration depends on experience, testing, and scope.

| Phase | Main Work | Estimated Time |
|---|---|---|
| 1 | Requirements and architecture | 1 week |
| 2 | Project setup and authentication | 1–2 weeks |
| 3 | Product catalog | 1–2 weeks |
| 4 | Inventory engine | 2–3 weeks |
| 5 | Suppliers and purchasing | 2 weeks |
| 6 | Repair orders | 2–3 weeks |
| 7 | Sales and reporting | 2–3 weeks |
| 8 | Testing and deployment | 2 weeks |

**Total estimated time: 13–18 weeks.**

This is a planning estimate, not a guaranteed delivery schedule.

## Phase 1: Requirements and Architecture

Deliverables:

- Requirements specification
- User roles and permissions
- Business workflows
- Architecture documentation
- Initial database ER diagram
- API design
- Development backlog

Focus on defining inventory rules before generating code.

## Phase 2: Project Foundation

Implement:

- Spring Boot project
- Vue 3 project
- MySQL database
- Flyway migrations
- Docker Compose
- Spring Security
- Login/logout
- User management
- Exception handling
- API documentation

Deliverable:

A working application with authentication and a basic dashboard.

## Phase 3: Product Catalog

Implement:

- Product CRUD
- Categories
- Brands
- Phone models
- Product compatibility
- Search and pagination
- Product validation

Deliverable:

A functional parts catalog.

## Phase 4: Inventory Engine

Implement:

- Inventory balances
- Stock movement ledger
- Stock adjustments
- Low-stock alerts
- Inventory transaction service
- Concurrency protection
- Inventory integration tests

Deliverable:

A reliable inventory management system.

**This is the most technically important phase.**

## Phase 5: Purchasing

Implement:

- Supplier CRUD
- Purchase orders
- Purchase approval
- Goods receiving
- Partial receiving
- Automatic inventory updates

Deliverable:

A complete purchase-to-stock workflow.

## Phase 6: Repair Management

Implement:

- Customer records
- Customer devices
- Repair orders
- Technician assignment
- Parts reservation
- Parts consumption
- Repair status workflow
- Repair cost calculation

Deliverable:

A working repair shop management workflow.

## Phase 7: Sales and Reports

Implement:

- Sales orders
- Retail parts sales
- Inventory deductions
- Sales history
- Revenue reports
- Inventory reports
- Gross profit reports

Deliverable:

A functional repair shop business management application.

## Phase 8: Testing and Deployment

Implement:

- Unit tests
- Integration tests
- API tests
- Frontend tests
- Security tests
- Concurrency tests
- Docker deployment
- Database backups
- Logging and monitoring

Deliverable:

A deployable MVP.

---

# 11. AI-Assisted Development Strategy

You mentioned using AI coding tools in your previous projects.

For this project, I recommend:

- [Claude Code](https://www.anthropic.com/claude-code?utm_source=chatgpt.com) — Architecture implementation, complex business logic, and refactoring.
- [Cursor](https://cursor.com/?utm_source=chatgpt.com) — Interactive development, frontend implementation, and debugging.
- [OpenAI Codex](https://openai.com/codex/?utm_source=chatgpt.com) — Repository-level implementation, testing, code review, and bug fixing.

All three can assist with backend and frontend development. Their effectiveness depends more on task definition, repository context, and verification than on a rigid division of responsibilities.

## Recommended Workflow

```text
You
 |
 v
Define Business Requirements
 |
 v
AI Tool
 |
 v
Generate Architecture and Database Design
 |
 v
Review Design
 |
 v
AI Tool
 |
 v
Implement One Module
 |
 v
Run Tests
 |
 v
Review Code
 |
 v
Commit to Git
 |
 v
Continue to Next Module
```

**Do not ask AI to generate the entire application in one operation.**

Large one-shot prompts frequently produce inconsistent entities, missing migrations, incomplete workflows, and untested integrations.

Instead, give AI tools a comprehensive project specification and then implement the project incrementally.

---

# 12. Complete AI Coding Tools Prompt

The following prompt is designed for Claude Code, Cursor, or Codex.

You can copy it into your coding tool to begin development.

# ROLE

You are a senior Java software architect, enterprise backend developer, frontend engineer, database architect, and QA engineer.

Your task is to help me design and implement a production-oriented Phone Parts Inventory Management System (PPIMS) for a mobile phone repair shop.

The application must follow mainstream enterprise software engineering practices.

Do not generate a toy CRUD demonstration. Build a maintainable business application with clearly defined business rules, reliable inventory transactions, security, automated testing, and documentation.

However, avoid unnecessary complexity, premature optimization, and microservices.

# 1. PROJECT OVERVIEW

Project name:

Phone Parts Inventory Management System (PPIMS)

Purpose:

Develop a full-stack web application for mobile phone repair shops to manage:

1. Phone replacement parts
2. Product categories
3. Phone brands and models
4. Parts compatibility
5. Inventory and stock movements
6. Suppliers
7. Purchasing and goods receiving
8. Customer information
9. Phone repair orders
10. Parts reservation and consumption
11. Retail sales
12. Inventory valuation
13. Reporting and analytics
14. Employees, users, and permissions
15. System administration

Initial deployment:

A single repair shop with multiple employees and one warehouse.

Future expansion:

Multiple shops, multiple warehouses, and stock transfers.

Design the architecture to permit future expansion without implementing unnecessary multi-tenant complexity in the MVP.

# 2. TECHNOLOGY STACK

Backend:

- Java 21
- Spring Boot 3.5.x
- Spring Framework
- Spring Web MVC
- Spring Data JPA
- Hibernate ORM
- Spring Security
- Jakarta Bean Validation
- MySQL 8.4 LTS
- Flyway
- Maven
- Springdoc OpenAPI
- JUnit 5
- Mockito
- Testcontainers

Frontend:

- Vue 3
- TypeScript
- Vite
- Element Plus
- Vue Router
- Pinia
- Axios

Infrastructure:

- Docker
- Docker Compose
- Nginx
- Git

Use compatible, maintained dependency versions and verify compatibility before generating configuration files.

# 3. ARCHITECTURE REQUIREMENTS

Use a modular monolith architecture.

Use package-by-feature organization.

Each business module should contain appropriate:

- REST controllers
- Application services
- Domain entities
- Repositories
- DTOs
- Request validation
- Business exceptions
- Unit tests
- Integration tests

Use constructor-based dependency injection.

Use DTOs for API requests and responses.

Do not expose JPA entities directly through REST endpoints.

Keep controllers thin.

Place business rules in application and domain services.

Use transactional service methods for business operations.

Avoid circular module dependencies.

Document module boundaries.

Use RESTful API conventions.

Use the API prefix:

/api/v1

Use consistent error responses based on RFC 9457 Problem Details where appropriate.

Support pagination, sorting, and filtering.

# 4. BUSINESS MODULES

## 4.1 Product Management

Implement:

- Product creation
- Product modification
- Product deactivation
- SKU management
- Product categories
- Product brands
- Phone models
- Parts compatibility
- Product images
- Purchase price reference
- Selling price
- Minimum stock threshold
- Product search
- Pagination

Products must support many-to-many relationships with compatible phone models.

Use BigDecimal for monetary values.

## 4.2 Inventory Management

Implement:

- Warehouses
- Inventory balances
- Inventory transactions
- Inventory reservations
- Stock adjustments
- Low-stock alerts
- Stock movement history
- Inventory valuation

Inventory must be managed through business transactions.

Do not permit arbitrary modification of inventory quantities through ordinary product update endpoints.

Maintain both:

1. Current inventory balances
2. An auditable inventory movement ledger

Update balances and ledger records atomically.

Prevent negative available stock.

Use database locking or optimistic concurrency control as appropriate.

Implement idempotency protection for stock-posting operations.

Prevent duplicate stock deductions.

Define inventory transaction types such as:

- PURCHASE_RECEIPT
- SALE
- REPAIR_CONSUMPTION
- CUSTOMER_RETURN
- SUPPLIER_RETURN
- ADJUSTMENT_IN
- ADJUSTMENT_OUT
- TRANSFER_IN
- TRANSFER_OUT

Only implement transaction types whose complete business workflows exist.

Define a consistent inventory reservation lifecycle.

Document the meaning of on-hand, reserved, and available quantities.

Ensure cancellation and reversal operations do not corrupt inventory.

## 4.3 Supplier Management

Implement:

- Supplier CRUD
- Supplier contact details
- Supplier product catalog
- Supplier-specific SKU
- Purchase price history
- Supplier search

## 4.4 Purchasing

Implement:

- Purchase order creation
- Purchase order items
- Purchase order approval
- Purchase order status transitions
- Goods receiving
- Partial goods receiving
- Purchase cancellation rules
- Inventory updates after goods receipt

Purchase order creation must not increase stock.

Only posted goods receipts may increase stock.

Prevent receiving quantities greater than the remaining ordered quantity unless an explicit approved business rule allows it.

## 4.5 Customer Management

Implement:

- Customer registration
- Customer profiles
- Customer contact information
- Customer devices
- Repair history
- Sales history

Collect only necessary customer information.

## 4.6 Repair Management

Implement:

- Repair order creation
- Device registration
- Problem description
- Repair quotations
- Customer approval
- Technician assignment
- Parts reservation
- Parts consumption
- Labor charges
- Repair status transitions
- Repair completion
- Repair cancellation
- Repair history

Repair status transitions must be validated.

Parts consumption must update inventory transactionally.

Avoid double consumption.

Handle unused reserved parts when a repair is cancelled or completed.

Record the historical cost and customer charge for consumed parts.

## 4.7 Sales Management

Implement:

- Sales order creation
- Sales order items
- Inventory availability checks
- Sales confirmation
- Stock deduction
- Sales history
- Basic customer returns
- Payment status

Do not integrate a real payment gateway in the initial version.

Use a clearly documented basic payment recording workflow.

Do not store payment card data.

## 4.8 Reporting

Implement:

- Current inventory report
- Low-stock report
- Inventory movement report
- Purchase history report
- Sales report
- Repair report
- Gross profit report
- Product performance report

Use efficient database queries.

Do not load entire tables into memory to calculate report totals.

Clearly distinguish revenue, cost of goods sold, gross profit, and net profit.

Do not label gross profit as net profit.

## 4.9 Security

Implement:

- Authentication
- Logout
- Password hashing
- Role-based access control
- Method-level authorization
- User administration
- Audit logging

Roles:

- ADMIN
- OWNER
- MANAGER
- INVENTORY_CLERK
- TECHNICIAN
- SALESPERSON

Use secure session-based authentication for the initial browser application.

Use HttpOnly, Secure cookies in production and appropriate SameSite settings.

Keep CSRF protection enabled for state-changing browser requests.

Use secure password hashing through Spring Security.

Never hardcode production passwords or secrets.

Do not implement custom cryptography.

# 5. DATABASE REQUIREMENTS

Use MySQL 8.4 LTS.

Use Flyway migrations.

Do not use Hibernate automatic schema modification in production.

Use normalized relational database design.

Suggested tables:

Product catalog:

- products
- product_categories
- brands
- phone_models
- product_compatibilities

Inventory:

- warehouses
- inventory_balances
- inventory_transactions
- inventory_reservations
- stock_adjustments
- stock_adjustment_items

Purchasing:

- suppliers
- supplier_products
- purchase_orders
- purchase_order_items
- goods_receipts
- goods_receipt_items

Repair:

- customers
- customer_devices
- repair_orders
- repair_order_parts
- repair_status_history

Sales:

- sales_orders
- sales_order_items
- payments
- sales_returns

Security:

- users
- roles
- permissions
- user_roles
- role_permissions
- audit_logs

Refine the database design before implementation.

Include:

- Primary keys
- Foreign keys
- Unique constraints
- Appropriate indexes
- Check constraints
- Audit timestamps
- Version fields where needed
- Appropriate decimal precision

Do not use floating-point types for monetary values.

Define inventory costing rules before implementing profit reporting.

For the MVP, propose a practical costing method and explain the tradeoffs.

Preserve historical costs in completed business transactions.

# 6. API REQUIREMENTS

Design REST APIs for all implemented modules.

Examples:

GET /api/v1/products

POST /api/v1/products

GET /api/v1/inventory/balances

GET /api/v1/inventory/transactions

POST /api/v1/inventory/adjustments

POST /api/v1/purchase-orders

POST /api/v1/purchase-orders/{id}/approve

POST /api/v1/purchase-orders/{id}/receipts

POST /api/v1/repairs

POST /api/v1/repairs/{id}/reserve-parts

POST /api/v1/repairs/{id}/consume-parts

POST /api/v1/repairs/{id}/complete

Document APIs using OpenAPI.

Provide request and response examples.

Validate request data.

Return appropriate HTTP status codes.

Implement consistent exception handling.

# 7. FRONTEND REQUIREMENTS

Build a responsive administrative interface using Vue 3, TypeScript, and Element Plus.

Required pages:

1. Login
2. Dashboard
3. Product List
4. Product Creation/Edit
5. Product Categories
6. Phone Compatibility
7. Inventory Balances
8. Inventory Movements
9. Stock Adjustments
10. Low-Stock Alerts
11. Suppliers
12. Purchase Orders
13. Goods Receiving
14. Customers
15. Repair Orders
16. Repair Details
17. Sales
18. Reports
19. Users and Roles
20. System Settings

Use reusable components.

Implement:

- Form validation
- Loading indicators
- Error notifications
- Confirmation dialogs
- Pagination
- Search filters
- Responsive tables
- Permission-aware navigation

Use TypeScript types for API requests and responses.

Do not duplicate backend business rules as authoritative frontend logic.

# 8. TESTING REQUIREMENTS

Implement automated tests.

Backend:

- Unit tests for business services
- Integration tests using Testcontainers and MySQL
- REST controller tests
- Security authorization tests
- Inventory concurrency tests
- Transaction rollback tests

Critical test cases:

1. Purchasing increases inventory only after receipt posting.
2. Partial receiving does not over-receive.
3. Repair consumption decreases inventory.
4. Reservations reduce available stock but not on-hand stock.
5. Cancelling reservations restores available stock.
6. Sales decrease inventory exactly once.
7. Insufficient stock prevents consumption.
8. Concurrent requests cannot oversell inventory.
9. Repeated requests do not duplicate inventory movements.
10. Failed transactions roll back all related changes.
11. Unauthorized users cannot perform restricted operations.
12. Historical purchase and consumption costs remain unchanged when current prices change.

Frontend:

- Component tests
- Form validation tests
- API integration tests
- Critical workflow tests

Use realistic test data.

# 9. DOCKER REQUIREMENTS

Provide:

- Backend Dockerfile
- Frontend production build
- Nginx configuration
- Docker Compose configuration
- MySQL container
- Persistent database volume
- Environment variable configuration
- Health checks

Do not expose the MySQL port publicly in production.

Do not commit secrets to Git.

Provide a .env.example file.

Document local development and production deployment.

# 10. DOCUMENTATION REQUIREMENTS

Create:

README.md

docs/requirements.md

docs/architecture.md

docs/database-design.md

docs/api-design.md

docs/business-rules.md

docs/development-roadmap.md

docs/deployment.md

docs/testing.md

Include:

- Project introduction
- Technology stack
- Architecture explanation
- Database ER diagram
- Module descriptions
- Business workflows
- API documentation
- Setup instructions
- Testing instructions
- Deployment instructions

Use Mermaid diagrams where appropriate.

# 11. DEVELOPMENT PROCESS

Do not generate the entire project at once.

Use incremental development.

Follow this order:

Phase 1:
Requirements analysis and architecture design.

Phase 2:
Backend and frontend project initialization.

Phase 3:
Authentication and authorization.

Phase 4:
Product catalog.

Phase 5:
Inventory management.

Phase 6:
Supplier and purchasing management.

Phase 7:
Customer and repair management.

Phase 8:
Sales management.

Phase 9:
Reporting.

Phase 10:
Testing, security review, and deployment.

For each phase:

1. Explain the goal.
2. Identify dependencies.
3. List files to create or modify.
4. Implement working code.
5. Add database migrations.
6. Add automated tests.
7. Run relevant checks.
8. Fix failures.
9. Update documentation.
10. Summarize completed work.

Do not claim tests passed unless they were actually executed.

If the environment prevents testing, explain what was not verified.

Do not silently introduce breaking changes.

Do not delete existing code or database data without a justified reason and approval.

Prefer simple, maintainable solutions.

# 12. CODING STANDARDS

Follow mainstream Java coding conventions.

Use:

- Clear naming
- Small, cohesive methods
- Constructor injection
- Explicit DTO mapping
- Appropriate transaction boundaries
- Structured logging
- Centralized exception handling
- Database migrations
- Automated tests

Avoid:

- God classes
- Excessive abstraction
- Unnecessary design patterns
- Circular dependencies
- Business logic in controllers
- Hardcoded credentials
- Floating-point monetary calculations
- Unnecessary microservices
- Unverified generated code

# 13. FIRST TASK

Start with Phase 1 only.

Do not immediately generate the entire application.

First:

1. Analyze the business requirements.
2. Identify missing requirements and assumptions.
3. Define MVP scope and future features.
4. Design the modular monolith architecture.
5. Define module responsibilities and dependencies.
6. Design the initial relational database schema.
7. Create a Mermaid ER diagram.
8. Define inventory consistency rules.
9. Define purchase and repair state machines.
10. Design the initial REST API specification.
11. Create the project development roadmap.
12. Write the architecture and requirements documentation.

Present the proposed architecture and major design decisions for review before implementing application code.

After the design is approved, proceed to Phase 2.

The final objective is a maintainable, secure, testable, and deployable Phone Parts Inventory Management System suitable for real repair shop operations.

This master prompt establishes the project's technical direction and business requirements. It is intended to be reused as the starting specification throughout development.

---

# 13. Recommended First Development Milestone

Although the complete application includes many modules, I recommend building a smaller MVP first.

### MVP Version 1.0

Implement these five capabilities:

| Priority | Module | Features |
|---|---|---|
| P0 | Authentication | Login, users, roles |
| P0 | Products | Parts catalog, categories, compatibility |
| P0 | Inventory | Stock balances, movements, adjustments |
| P0 | Suppliers | Supplier profiles |
| P0 | Purchasing | Purchase orders and receiving |

Once these modules work correctly, you will have a usable **phone parts inventory application**, even before implementing repair orders and sales.

### MVP Version 1.1

Add:

- Customer management
- Repair orders
- Parts reservation
- Parts consumption
- Repair history

### MVP Version 1.2

Add:

- Retail sales
- Returns
- Profit reports
- Inventory valuation
- Dashboard analytics

### Version 2.0

Consider:

- Multiple shops
- Multiple warehouses
- Barcode scanning
- Label printing
- Serial-number tracking
- Warranty management
- Automatic reorder suggestions
- Mobile-friendly PWA
- Accounting system integration

For barcode scanning, start with a USB scanner that behaves like a keyboard. This is simpler than implementing camera-based scanning.

---

# 14. Additional Industry-Specific Features Worth Considering

Phone parts inventory has several characteristics that distinguish it from ordinary warehouse management.

### A. Part Quality Grades

Phone screens may be sold in different quality grades:

```text
iPhone 13 Screen
|
+-- Original
+-- OEM Grade
+-- Aftermarket OLED
+-- Aftermarket LCD
+-- Refurbished
```

These should generally be separate SKUs when they differ in price, quality, or inventory.

### B. Supplier Warranty

Replacement parts may have supplier warranties.

For example:

```text
Part: iPhone 13 OLED Screen
Supplier: ABC Parts
Warranty: 90 days
```

The system could track defective screens and supplier returns.

### C. Part Batches

Two batches of the same part may have different purchase prices.

Example:

```text
Batch A:
10 screens at $35

Batch B:
10 screens at $40
```

This affects inventory valuation and gross profit.

For the MVP, I recommend **weighted-average inventory costing**, with a documented policy for returns and cost adjustments. FIFO can be added later if the business requires it.

### D. Repair Warranty

A completed repair may include a warranty.

Example:

```text
Repair: iPhone 13 Screen Replacement

Completed: 2026-11-20

Warranty: 90 days
```

If the customer returns with a defective screen, the repair shop should be able to associate the warranty claim with the original repair.

### E. Barcode and QR Code Support

Each SKU can have a barcode.

A technician could scan a replacement screen to select the correct product and record its consumption.

For serialized parts, the system may also need to track individual serial numbers.

---

# 15. Deployment Recommendation

For development, your existing Ubuntu environment is suitable for running the Java backend, Vue frontend, and MySQL container.

For production or internal testing, your Debian server can host a small deployment.

Suggested architecture:

```text
           Shop Computers
                  |
                  |
               Browser
                  |
                  v
          Local Network / HTTPS
                  |
                  v
          Debian Linux Server
                  |
                  v
             Docker Compose
                  |
       +----------+----------+
       |          |          |
       v          v          v
     Nginx    Spring Boot   MySQL
       |          |          |
       |          |          v
       |          |      Data Volume
       |          |
       +----------+
```

Given your older Debian server hardware, keep the initial deployment lightweight:

- One Spring Boot application
- One MySQL instance
- One Nginx instance
- No Kubernetes
- No Elasticsearch
- No Redis initially
- No microservices

Configure the JVM heap based on available RAM and monitor actual memory consumption.

For real shop usage, also implement HTTPS, automated off-machine database backups, backup restoration tests, and secure access controls.

---

# 16. Final Architecture Recommendation

For this particular project, my recommended architecture is:

| Category | Recommendation |
|---|---|
| Architecture | Modular monolith |
| Backend | Java 21 + Spring Boot |
| ORM | Spring Data JPA + Hibernate |
| Database | MySQL 8.4 |
| Database Migration | Flyway |
| Frontend | Vue 3 + TypeScript + Element Plus |
| Authentication | Spring Security + Sessions |
| API | REST |
| Inventory Design | Balance + Transaction Ledger |
| Inventory Concurrency | Database transactions + locking |
| Inventory Costing | Weighted Average |
| Testing | JUnit + Mockito + Testcontainers |
| Deployment | Docker Compose + Nginx |
| Development Method | Incremental AI-assisted development |

## My Suggested Development Order

**Start with Product Management → Inventory Management → Purchasing → Repair Management → Sales → Reporting.**

This sequence follows the natural business dependencies of a repair shop.

The most valuable learning opportunities in this project will be:

1. **Database modeling:** Products, suppliers, warehouses, and business transactions.
2. **Spring transactions:** Ensuring inventory operations are atomic.
3. **Concurrency control:** Preventing overselling and negative inventory.
4. **Business workflows:** Managing purchase, repair, and sales states.
5. **Enterprise architecture:** Building a modular, maintainable Java application.

By completing this project, you will gain experience with more than Spring Boot CRUD operations. You will build a transaction-oriented business application using concepts found in professional inventory, ERP, retail, and repair management systems.

**One important architectural decision remains:** whether the first release should be a **standalone inventory system** or an **integrated repair shop management system**. I recommend the integrated design, but implementing inventory and purchasing first. This gives you a useful initial application without requiring you to build every business module immediately.
