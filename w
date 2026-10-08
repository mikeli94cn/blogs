# PHP Introduction

![Image](https://images.openai.com/static-rsc-4/_s7izoAac-2PS7inS96ieYbeQobbEgq2x-k8orykB35QJZbORZ92-Yah-Y-PRLc_3-c52TUlZe_Gdl3EMVHwn21TJ-2WlUE4x6JyUCVxvk25OZQAwZmtzctaDPJ2jCEO9WHkW08IyeN672EQfEPWdlt8ZVEbRSzXSGfEAB5ygv-F6Xl0r4HhLVbfqshaGNMq?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/iFYB4oZW_7xrKg5LWCqHlQq7APDSXLLXYdCwxw0wov3eAji9oKufzlIXINSdcafYLrEk9YIjqs4D3t-Me4gvDt3ZdXz0Cjw_KeACVrgwpogNiJITyzwDcxTf5I-lq_vcsHc0Pf7tcoTxICHvmwzM4DLhvL6DROUzw9yLvbhkhraUxHCEOSrTBIZ4KuueBB0c?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/GMOflJmobhrSS0Y6xpNk0S7CS4cnuC8gIPoFYhgoRMdfOTVD3QwHHGMi8yjckWBlETgYZrcy27LDxigpJPtigxnwF-wgb9caGSeUgjuI-qGFMqq4yFgqWp9HL26-qdVxdbEXUFIgaeFDJmKMk3j1a3gqkmGX9zd83mhD55CTmo6pTqQ12wHjkrwmHEnfg-Ki?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/MUBfYVcHqWjf0nTbZCLF2SoCXxJ4SfN7dx5cAeCL6pNJ4sT-aEtKsTIhdWU3g6veombZlStENdBzIpurSjDn2c75bYr5qRARO9yfTNiIm632zlq36A3wUEs_T4fR91BD87HAFeHzP4UUTXV22sxcnR5KnDDIBz-Y7BtNg1HZZVh5YFJb4KGE9dXFXr1k5OwI?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/EX-cnrd00ZNHIgrdaj8elIMSnWWnOoZOt8a3WEOpSHAyIlHuAQPU3sTGiJxWkPWf0Y-upJRRyaaBPHNbM3wyEeemP2URPUd4dg2mUnKz6iYvkB9jXcMJhFWfh_Oft6Cw1dMjEXZVRDPFhN1-aBv2fplaUfpfr-HOwzInV_HgwGx_HfoPtXsNDXfi0jPHBYXh?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/BB3u-_Vayv--trn266kY3OjIA_mrhsLhxiTlNBEdNyRdkDT-QDmjJRjZczR3yV9BL4FNfXNFFSAiolznDhyueqTDvUOAK_kBpuW3EmN4Z9lRGTs9_nwoomDiP9f8Yzql-JKg4TA2dlh9fGhRw-MzBrY_xVebzL4xHTKNX5LiQ9YfqT97C9zTNoVOfMgs0gbw?purpose=fullsize)

**PHP** is a general-purpose programming language that became especially famous as a **server-side scripting language for the Web**. It was created in the **mid-1990s** by **Rasmus Lerdorf** and played a major role in the development of dynamic websites.

If JavaScript's historical role was:

> **bringing programming into the browser**

then PHP's historical role was:

> **bringing programming into the Web server.**

This makes PHP particularly important when studying the evolution of Internet-era programming.

---

# 1. What does PHP mean?

PHP originally stood for:

> **Personal Home Page**

It was later reinterpreted as:

> **PHP: Hypertext Preprocessor**

Today, PHP is simply called **PHP**.

It is a somewhat unusual acronym because the current name contains PHP itself.

---

# 2. Why was PHP created?

Early Web pages were mostly static HTML:

```text
Browser
   │
   │ HTTP
   ↓
Web Server
   │
   ↓
   HTML
   │
   ↓
Browser displays page
```

For example:

```html
<h1>Hello, Mike</h1>
```

But websites soon needed dynamically generated content:

```text
Who is logged in?
What products are available?
What is today's news?
What is in my shopping cart?
What did the user search for?
```

PHP allowed the server to generate HTML dynamically.

For example:

```php
<?php

$name = "Mike";

echo "<h1>Hello, $name!</h1>";
```

The server executes PHP and sends the resulting HTML to the browser.

Conceptually:

```text
                SERVER
                  │
             PHP program
                  │
                  ↓
              generates
                HTML
                  │
                  │ HTTP
                  ↓
               Browser
```

The browser doesn't normally receive the PHP source code.

It receives the generated result:

```html
<h1>Hello, Mike!</h1>
```

---

# 3. PHP's fundamental architecture

A very important distinction is:

```text
JavaScript
    ↓
traditionally browser-side

PHP
    ↓
traditionally server-side
```

A classic Web application looked like:

```text
┌──────────────┐
│   Browser    │
│ HTML/CSS/JS  │
└──────┬───────┘
       │ HTTP
       ↓
┌──────────────┐
│ Web Server   │
│ Apache/Nginx │
└──────┬───────┘
       │
       ↓
┌──────────────┐
│     PHP      │
│ application  │
└──────┬───────┘
       │
       ↓
┌──────────────┐
│   Database   │
│ MySQL etc.   │
└──────────────┘
```

This architecture became extremely important during the growth of the Web in the late 1990s and 2000s.

---

# 4. PHP is embedded in HTML

One of PHP's original attractions was its simplicity.

You could write:

```php
<!DOCTYPE html>
<html>
<body>

<h1>My Website</h1>

<?php
echo "<p>Hello from PHP!</p>";
?>

</body>
</html>
```

PHP can therefore be mixed directly with HTML.

The server processes:

```php
<?php
echo "Hello";
?>
```

and produces:

```html
Hello
```

This was very convenient for building relatively simple dynamic websites.

---

# 5. A basic PHP program

A minimal PHP program is:

```php
<?php

echo "Hello, PHP!";
```

Save it as:

```text
hello.php
```

Then execute it through a PHP runtime/server environment.

PHP also has a CLI:

```bash
php hello.php
```

Output:

```text
Hello, PHP!
```

So PHP isn't fundamentally limited to Web programming. It is a general-purpose language, although its historical identity is strongly associated with Web development.

---

# 6. PHP syntax

PHP's syntax has similarities to C, C++, Java, and JavaScript.

For example:

```php
<?php

$name = "Alice";
$age = 25;

if ($age >= 18) {
    echo "$name is an adult.";
}
```

Variables begin with `$`:

```php
$name
$age
$count
```

This is one of PHP's most recognizable syntactic characteristics.

---

# 7. PHP's type system

PHP is dynamically typed.

For example:

```php
$value = 10;

$value = "hello";

$value = true;
```

The variable can hold values of different types during execution.

Conceptually:

```text
PHP
 │
 ├── dynamically typed
 ├── weak/coercive behavior in many contexts
 └── optional type declarations
```

Modern PHP also supports much stronger type declarations than early PHP.

For example:

```php
function add(int $a, int $b): int {
    return $a + $b;
}
```

So modern PHP is considerably more structured than the PHP of the 1990s.

---

# 8. Functions

PHP functions are straightforward:

```php
function add($a, $b) {
    return $a + $b;
}

$result = add(10, 20);

echo $result;
```

Modern PHP can add type information:

```php
function add(int $a, int $b): int {
    return $a + $b;
}
```

This is one example of how PHP evolved over time.

---

# 9. Arrays

PHP arrays are particularly interesting.

```php
$numbers = [10, 20, 30, 40];
```

But PHP's "array" can act as both a traditional indexed array and a map/dictionary.

For example:

```php
$user = [
    "name" => "Alice",
    "age" => 25
];

echo $user["name"];
```

This flexibility became one of PHP's characteristic features.

Conceptually:

```text
PHP array
   │
   ├── indexed collection
   │
   └── associative map
```

---

# 10. Objects and classes

Modern PHP supports object-oriented programming.

```php
class User {
    public string $name;

    public function sayHello(): void {
        echo "Hello, " . $this->name;
    }
}

$user = new User();
$user->name = "Alice";

$user->sayHello();
```

PHP supports many familiar OOP concepts:

* classes
* objects
* inheritance
* interfaces
* traits
* abstract classes
* visibility
* static members
* namespaces

---

# 11. PHP and OOP

Early PHP was heavily associated with simple procedural scripting:

```php
<?php

$name = "Alice";

echo "Hello " . $name;
```

As applications became larger, PHP gained increasingly sophisticated object-oriented features.

Modern PHP can look much more like other enterprise languages:

```php
interface PaymentService
{
    public function pay(float $amount): bool;
}

class CreditCardPayment implements PaymentService
{
    public function pay(float $amount): bool
    {
        // ...
        return true;
    }
}
```

So there is a significant difference between:

```text
1990s PHP
```

and:

```text
Modern PHP
```

---

# 12. PHP and databases

Database integration is one of PHP's historically important strengths.

A typical PHP application might look like:

```text
Browser
   │
   │ HTTP
   ↓
PHP
   │
   │ SQL
   ↓
MySQL
   │
   ↓
data
```

For example, PHP applications commonly worked with:

* MySQL
* PostgreSQL
* SQLite
* MariaDB

This combination became extremely common:

> **Linux + Apache + MySQL + PHP**

which became known as the **LAMP stack**.

---

# 13. The LAMP stack

LAMP is one of the most important concepts in Web-development history.

```text
L = Linux
A = Apache
M = MySQL
P = PHP
```

Conceptually:

```text
┌─────────────────────┐
│       Browser       │
└──────────┬──────────┘
           │ HTTP
           ↓
┌─────────────────────┐
│       Apache        │
└──────────┬──────────┘
           ↓
┌─────────────────────┐
│         PHP         │
└──────────┬──────────┘
           ↓
┌─────────────────────┐
│        MySQL        │
└─────────────────────┘
           │
           ↓
         Linux
```

The LAMP stack became one of the defining technologies of the early Web.

---

# 14. PHP and Apache

Historically, PHP was very closely associated with **Apache HTTP Server**.

A request might look like:

```text
Browser
   │
   │ GET /index.php
   ↓
Apache
   │
   ↓
PHP runtime
   │
   ↓
index.php
   │
   ↓
HTML
   │
   ↓
Browser
```

Modern PHP deployments can use other architectures as well, including PHP-FPM behind Nginx or Apache.

---

# 15. PHP and HTML

One of PHP's defining ideas was:

```text
HTML
 +
server-side code
 =
dynamic HTML
```

For example:

```php
<h1>Products</h1>

<?php foreach ($products as $product): ?>

    <div>
        <h2><?= $product["name"] ?></h2>
        <p><?= $product["price"] ?></p>
    </div>

<?php endforeach; ?>
```

The server turns this into ordinary HTML.

This model was extremely productive for early Web applications.

---

# 16. PHP and forms

PHP became very popular for processing HTML forms.

HTML:

```html
<form method="post" action="login.php">
    <input name="username">
    <input name="password" type="password">
    <button type="submit">Login</button>
</form>
```

PHP:

```php
<?php

$username = $_POST["username"];
$password = $_POST["password"];
```

The basic architecture:

```text
User
 ↓
HTML form
 ↓
HTTP POST
 ↓
PHP
 ↓
process data
 ↓
database / business logic
 ↓
response
```

This simple request-response model was central to traditional Web programming.

---

# 17. PHP and sessions

Web applications need to remember users between requests.

PHP provides sessions:

```php
session_start();

$_SESSION["username"] = "Alice";
```

Later:

```php
session_start();

echo $_SESSION["username"];
```

Conceptually:

```text
Request 1
   ↓
PHP
   ↓
create session

Request 2
   ↓
PHP
   ↓
retrieve session
```

This made it relatively easy to build:

* login systems
* shopping carts
* user accounts
* administration systems

---

# 18. PHP and WordPress

One of PHP's biggest historical successes is **WordPress**.

WordPress is a PHP-based content management system that became enormously influential in website publishing.

Its basic architecture is approximately:

```text
Browser
   ↓
Web server
   ↓
PHP
   ↓
WordPress
   ↓
MySQL
```

This is a major reason PHP has remained important even as other server-side technologies became popular.

---

# 19. PHP frameworks

As PHP applications became larger, frameworks emerged.

Important PHP frameworks include:

* Laravel
* Symfony
* CodeIgniter
* CakePHP
* Zend Framework / Laminas

Modern PHP development therefore can look like:

```text
PHP
 ↓
Framework
 ↓
Application
 ↓
Database
```

For example, Laravel provides abstractions for:

```text
routing
controllers
database
ORM
authentication
validation
queues
caching
testing
```

---

# 20. Composer

PHP's ecosystem has its own package manager:

> **Composer**

It plays a role somewhat analogous to:

```text
JavaScript → npm
Python     → pip
Java       → Maven / Gradle
PHP        → Composer
```

For example:

```bash
composer require some/package
```

Composer manages PHP dependencies.

Modern PHP applications therefore often have:

```text
PHP
 │
 ├── Composer
 │
 ├── Framework
 │
 └── Packages
```

---

# 21. PHP versus JavaScript

This comparison is particularly important.

Historically:

```text
PHP
 ↓
server-side

JavaScript
 ↓
browser-side
```

A traditional Web application might therefore use both:

```text
             Web Application

       Browser                Server
          │                     │
          │ JavaScript          │ PHP
          │                     │
          └────── HTTP ─────────┘
```

For example:

```text
JavaScript
    ↓
button click
    ↓
HTTP request
    ↓
PHP
    ↓
database
    ↓
PHP response
    ↓
JavaScript
    ↓
update page
```

Later, JavaScript expanded into the server through Node.js.

So the relationship became:

```text
PHP
 └── server

JavaScript
 ├── browser
 └── server via Node.js
```

---

# 22. PHP versus Java

PHP and Java both became major Web-server technologies, but they took somewhat different paths.

|                         | PHP                          | Java                                 |
| ----------------------- | ---------------------------- | ------------------------------------ |
| Original focus          | Web scripting                | General-purpose application language |
| Type system             | Dynamic                      | Static                               |
| Runtime                 | PHP runtime                  | JVM                                  |
| Historical Web role     | Dynamic websites             | Enterprise applications              |
| HTML integration        | Very direct                  | Usually framework/template based     |
| Typical package manager | Composer                     | Maven / Gradle                       |
| Major frameworks        | Laravel, Symfony             | Spring, Spring Boot                  |
| Database                | MySQL, PostgreSQL, etc.      | MySQL, PostgreSQL, Oracle, etc.      |
| Famous stack            | LAMP                         | Java EE / Spring                     |
| Learning style          | Often approachable initially | More structured                      |

A useful conceptual difference is:

```text
PHP
   Web scripting
       ↓
   Web application

Java
   General-purpose language
       ↓
   JVM
       ↓
   enterprise application
```

---

# 23. PHP versus Perl

This is especially relevant to your previous question about the **Internet era**.

PHP and Perl both became major Web programming languages in the 1990s and 2000s, but their origins were different.

### Perl

Perl originated as a general-purpose Unix scripting language.

It became famous for:

* text processing
* system administration
* CGI
* Unix scripting
* network programming

Its philosophy was strongly associated with:

> **There is more than one way to do it.**

### PHP

PHP was much more directly oriented toward Web-page generation.

Its historical philosophy was closer to:

> **Put server-side code into your Web pages and generate HTML.**

So:

```text
Perl
 ↓
Unix scripting
 ↓
CGI
 ↓
Web

PHP
 ↓
Web scripting
 ↓
dynamic HTML
 ↓
Web applications
```

That difference helps explain why PHP became particularly prominent in mainstream Web hosting.

---

# 24. PHP's historical importance in the Internet era

If we simplify the Internet/Web era:

```text
1990s
       CGI
        │
   ┌────┼─────┐
   ↓    ↓     ↓
 Perl  PHP   Java
   │    │      │
   │    │      │
 Unix   Web   Enterprise
       scripting
```

Then:

```text
2000s

PHP ──────────────── Web sites
Java ─────────────── Enterprise
Perl ─────────────── Unix/Web scripting
JavaScript ───────── Browser
```

And later:

```text
2010s–2020s

JavaScript
 ├── Browser
 └── Node.js

PHP
 ├── Laravel
 ├── WordPress
 └── modern PHP

Java
 └── Spring / Spring Boot
```

So PHP was not merely "another scripting language."

It was one of the languages that helped establish the **dynamic Web application model**.

---

# 25. Why PHP became so popular

Several factors contributed.

### 1. Very low barrier to entry

You could write:

```php
<?php echo "Hello"; ?>
```

and put it into a Web page.

### 2. Cheap hosting

PHP applications could run on relatively inexpensive Web servers.

### 3. Apache integration

PHP and Apache became a very common combination.

### 4. Database integration

Especially:

```text
PHP + MySQL
```

### 5. HTML integration

You could easily mix:

```text
HTML
+
PHP
```

### 6. Huge ecosystem

Projects such as WordPress dramatically expanded PHP's reach.

---

# 26. PHP's evolution

PHP has changed significantly.

A simplified timeline:

```text
1995
PHP/FI
 │
 ↓
PHP 3
 │
 ↓
PHP 4
 │
 ↓
PHP 5
 │
 ├── stronger OOP
 ├── exceptions
 └── PDO
 │
 ↓
PHP 7
 │
 ├── major performance improvements
 └── stronger type features
 │
 ↓
PHP 8
 │
 ├── JIT
 ├── union types
 ├── attributes
 ├── match
 ├── named arguments
 └── constructor property promotion
 │
 ↓
modern PHP
```

So modern PHP should not be judged purely by what PHP code looked like in the early 2000s.

---

# 27. Modern PHP

Modern PHP can be a fairly sophisticated programming language.

For example:

```php
<?php

class UserService
{
    public function __construct(
        private UserRepository $repository
    ) {}

    public function findUser(int $id): ?User
    {
        return $this->repository->find($id);
    }
}
```

This is very different from the old:

```php
<?php

echo "Hello World";
```

Modern PHP supports:

* typed properties
* union types
* intersection types
* enums
* attributes
* anonymous classes
* generators
* exceptions
* namespaces
* interfaces
* traits
* dependency injection
* modern OOP

---

# 28. PHP's place in programming-language history

Using the historical framework you've been exploring:

```text
1950s
FORTRAN / COBOL
        ↓
1960s
ALGOL / Lisp
        ↓
1970s
C / Smalltalk
        ↓
1980s
C++ / Object Pascal
        ↓
1990s
Java / JavaScript / Perl / PHP
        ↓
2000s
Java / PHP / JavaScript
        ↓
2010s
Java / JavaScript / Python / PHP
        ↓
2020s
Java / JavaScript / Python / PHP / TypeScript
```

PHP's particular contribution was:

> **making server-side Web programming simple and accessible enough to become a mass-market development model.**

---

# 29. JavaScript, PHP, and Java — three different Internet-era roles

This is perhaps the most useful comparison for your historical study.

```text
                    Web / Internet Era
                           │
          ┌────────────────┼────────────────┐
          ↓                ↓                ↓
       JavaScript          PHP              Java
          │                │                │
          ↓                ↓                ↓
       Browser          Web Server       Server/JVM
          │                │                │
          ↓                ↓                ↓
     Interactive       Dynamic HTML      Enterprise
         Web           Web Sites         Applications
          │                │                │
          ↓                ↓                ↓
       Node.js         Laravel/etc.      Spring
          │                │                │
          ↓                ↓                ↓
      Full Stack       Web Apps        Enterprise
```

And **Perl** fits into the same historical picture differently:

```text
Perl
 │
 ├── Unix scripting
 ├── text processing
 ├── CGI
 └── early Web programming
```

So if we reduce the four languages to their historical identities:

```text
Perl       → Unix / scripting / CGI
PHP        → server-side Web scripting
JavaScript → browser / interactive Web
Java       → portable enterprise/server applications
```

These roles overlapped considerably, but this division is a useful way to understand **why each language became important during the Internet era**.

---

# 30. The simplest mental model

If you remember only one diagram about PHP, make it this:

```text
                 USER
                   │
                   ↓
              Web Browser
             HTML/CSS/JS
                   │
                   │ HTTP
                   ↓
              Web Server
                   │
                   ↓
                  PHP
                   │
          ┌────────┴────────┐
          ↓                 ↓
       Business           Database
        Logic
          │
          └────────┬────────┘
                   ↓
                HTML/JSON
                   │
                   ↓
               Browser
```

**In one sentence:** **PHP is a dynamically typed, general-purpose language whose defining historical role was making server-side Web programming simple, practical, and widely accessible, especially through the PHP + Apache + MySQL/LAMP ecosystem.**
