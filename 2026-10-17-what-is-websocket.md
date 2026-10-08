## WebSocket introduction

**WebSocket** is a network communication protocol that allows a **client and server to maintain a persistent, two-way connection** and communicate with each other in real time.

The key idea is:

> **HTTP:** client asks → server responds
> **WebSocket:** client and server can send messages to each other at any time

It is especially useful for applications where the server needs to **push information to the client immediately**.

---

## 1. Why WebSocket was created

Traditional HTTP communication looks like this:

```text
Client                         Server
  |                              |
  |------ HTTP Request --------->|
  |<----- HTTP Response ---------|
  |                              |
  |      connection ends         |
```

Suppose you build a stock-price application.

The browser wants to know:

```text
AAPL = $250.10
```

With ordinary HTTP, the browser might repeatedly ask:

```text
GET /stock/AAPL
GET /stock/AAPL
GET /stock/AAPL
GET /stock/AAPL
...
```

This is called **polling**.

It works, but it wastes requests when nothing has changed.

WebSocket allows:

```text
Client                         Server
  |                              |
  |------ Connect -------------->|
  |<----- Connection ------------|
  |                              |
  |<----- AAPL = 250.10 ---------|
  |<----- AAPL = 250.15 ---------|
  |<----- AAPL = 250.20 ---------|
  |                              |
```

The server can send the new price **whenever it becomes available**.

---

# 2. The fundamental idea

A WebSocket connection is **persistent**.

After establishing the connection:

```text
Client <==========================> Server
              WebSocket
             connection
```

Both sides can independently send messages.

For example:

```text
Client → Server
"send me notifications"

Server → Client
"New message received"

Server → Client
"Someone liked your post"

Server → Client
"Payment completed"
```

The important concept is:

> **WebSocket provides full-duplex communication over a persistent connection.**

### Full-duplex

"Full-duplex" means:

```text
Client  →  Server
Client  ←  Server
```

can happen simultaneously.

This is different from the normal request/response model of HTTP.

---

# 3. WebSocket starts with HTTP

One interesting thing about WebSocket is that the connection **initially uses HTTP**.

The client sends an HTTP request asking to upgrade the connection:

```http
GET /chat HTTP/1.1
Host: example.com
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: ...
Sec-WebSocket-Version: 13
```

The server responds:

```http
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: ...
```

Then the connection changes from HTTP communication to WebSocket communication:

```text
HTTP
 │
 │ Upgrade
 ▼
WebSocket
```

This is called the **WebSocket handshake**.

---

# 4. WebSocket URLs

WebSocket has its own URL schemes:

```text
ws://example.com/chat
```

and:

```text
wss://example.com/chat
```

Similar to:

```text
http://
https://
```

The difference is:

| Protocol | Meaning               |
| -------- | --------------------- |
| `ws://`  | WebSocket without TLS |
| `wss://` | WebSocket over TLS    |

In production, you normally use:

```text
wss://
```

because it encrypts the communication.

---

# 5. WebSocket messages

After the connection is established, applications exchange **messages**.

For example:

```text
Client → Server

{
    "type": "chat",
    "message": "Hello"
}
```

Server:

```text
Server → Client

{
    "type": "chat",
    "message": "Hello, Mike!"
}
```

The message format is usually determined by the application.

Common choices include:

```text
JSON
Text
Binary
```

WebSocket itself does **not** require JSON.

---

# 6. WebSocket vs HTTP

This is one of the most important comparisons.

| HTTP                                       | WebSocket                             |
| ------------------------------------------ | ------------------------------------- |
| Request/response                           | Two-way communication                 |
| Client normally initiates requests         | Either side can send                  |
| Usually short-lived requests               | Persistent connection                 |
| Server doesn't normally push spontaneously | Server can push anytime               |
| Excellent for REST APIs                    | Excellent for real-time communication |
| Stateless request model                    | Stateful connection                   |
| `http://`, `https://`                      | `ws://`, `wss://`                     |

Think of it like this:

### HTTP

```text
Client: "Give me data."

Server: "Here is data."

Client: "Give me more data."

Server: "Here is more data."
```

### WebSocket

```text
Client: "Let's keep a connection open."

Server: "OK."

Client: "Hello."

Server: "Hello."

Server: "New notification!"

Client: "Thanks."

Server: "Another notification!"
```

---

# 7. WebSocket vs polling

Before WebSocket became popular, real-time applications often used **polling**.

### Polling

```text
Client → Server: anything new?
Server → Client: no

Client → Server: anything new?
Server → Client: no

Client → Server: anything new?
Server → Client: yes, here is message
```

This produces many unnecessary requests.

### WebSocket

```text
Client ←────────────────→ Server
          persistent

                  Server
                    |
                    | New event
                    ↓
                 Client
```

The server sends information only when necessary.

---

# 8. WebSocket vs Server-Sent Events

Another technology you should know is **SSE (Server-Sent Events)**.

### WebSocket

```text
Client ←→ Server
```

Both directions.

### SSE

```text
Client ←── Server
```

Primarily server → client.

So:

| Feature                     |           WebSocket |                  SSE |
| --------------------------- | ------------------: | -------------------: |
| Server → Client             |                   ✅ |                    ✅ |
| Client → Server             |                   ✅ |         Usually HTTP |
| Full duplex                 |                   ✅ |                    ❌ |
| Persistent connection       |                   ✅ |                    ✅ |
| Text streaming              |                   ✅ |                    ✅ |
| Binary messages             |                   ✅ |                    ❌ |
| Automatic browser reconnect | Application-managed |             Built-in |
| Typical use                 |         Chat, games | Notifications, feeds |

For example, a live news feed can often use SSE.

A multiplayer game is much more naturally suited to WebSocket.

---

# 9. Typical WebSocket applications

WebSocket is particularly useful for **real-time applications**.

### Chat

```text
Alice ─────── WebSocket ─────── Server
                                  |
Bob    ─────── WebSocket ────────┘
```

Alice sends:

```text
Hello Bob!
```

The server immediately sends it to Bob.

---

### Online games

For example:

```text
Player A position
       ↓
     Server
       ↓
Player B
Player C
Player D
```

The server can continuously distribute game-state changes.

---

### Stock/financial applications

```text
Server
  │
  ├── AAPL $250.10
  ├── AAPL $250.15
  ├── AAPL $250.20
  └── AAPL $250.18
```

The browser doesn't need to repeatedly ask for the price.

---

### Notifications

For example:

```text
Facebook-like application
       │
       │ WebSocket
       ↓
Browser

"John sent you a message"
```

---

### Collaborative applications

Google Docs-like applications can use persistent connections to distribute changes:

```text
User A edits document
        ↓
      Server
        ↓
 ┌──────┼──────┐
 ↓      ↓      ↓
User B User C User D
```

---

# 10. A simple JavaScript example

Modern browsers have a built-in `WebSocket` API.

### Client

```javascript
const socket = new WebSocket("wss://example.com/chat");

socket.onopen = () => {
    console.log("Connected");

    socket.send("Hello Server!");
};

socket.onmessage = (event) => {
    console.log("Server:", event.data);
};

socket.onclose = () => {
    console.log("Connection closed");
};

socket.onerror = (error) => {
    console.error("WebSocket error:", error);
};
```

The important API is:

```javascript
new WebSocket(url)
```

Then:

```javascript
socket.send(...)
```

sends a message.

And:

```javascript
socket.onmessage
```

receives messages.

---

# 11. WebSocket in a Java backend

Since you're learning **Java backend development**, WebSocket is particularly relevant.

The conceptual architecture is:

```text
Browser
   │
   │ WebSocket
   │
   ▼
Java Web Application
   │
   ├── WebSocket endpoint
   │
   ├── Service
   │
   └── Database
```

In a Spring Boot application, you can build WebSocket applications using Spring's WebSocket support.

A simplified architecture might look like:

```text
Browser
   │
   │ wss://example.com/chat
   ▼
Spring Boot
   │
   ├── WebSocket
   │
   ├── Controller / Handler
   │
   ├── Service
   │
   └── Repository
        │
        ▼
     Database
```

You may also encounter **STOMP** on top of WebSocket in Spring applications.

That gives you concepts such as:

```text
WebSocket
    ↓
STOMP
    ↓
Spring Messaging
    ↓
Spring Boot
```

Don't confuse them:

> **WebSocket is the communication protocol. STOMP is a messaging protocol that can run over WebSocket.**

---

# 12. WebSocket and TCP

The protocol stack is roughly:

```text
Application
    │
    │ WebSocket
    ▼
    TCP
    │
    ▼
    IP
    │
    ▼
Network
```

So WebSocket is an **application-layer protocol**.

It normally runs over TCP.

This is important because it explains why WebSocket provides reliable, ordered communication.

---

# 13. WebSocket is not a replacement for REST

This is a very important backend design point.

You might have:

```text
REST API
   +
WebSocket
```

in the same application.

For example:

```text
                   ┌── REST API
Browser ───────────┤
                   └── WebSocket
                         │
                       Server
```

REST might handle:

```http
GET /users/123
POST /orders
GET /products
PUT /profile
```

WebSocket might handle:

```text
chat messages
real-time notifications
live status
real-time game events
```

So they solve different problems.

---

# 14. WebSocket's place in your backend-learning map

Given your Java backend learning path, I would place it roughly here:

```text
                    Web Backend
                        │
              ┌─────────┴─────────┐
              │                   │
             HTTP              WebSocket
              │                   │
        Request/Response     Persistent
              │              two-way
              │                   │
             REST             Real-time
              │                   │
        Spring MVC           Spring WebSocket
              │                   │
          Spring Boot        Spring Boot
```

And the broader progression is:

```text
TCP/IP
  ↓
HTTP
  ↓
REST
  ↓
Spring MVC / REST API
  ↓
WebSocket
  ↓
Real-time backend
```

---

## 15. The key concepts to learn

If you're studying WebSocket systematically, I recommend this order:

```text
1. HTTP request/response
        ↓
2. TCP connection
        ↓
3. WebSocket handshake
        ↓
4. Persistent connection
        ↓
5. Full-duplex communication
        ↓
6. WebSocket messages
        ↓
7. ws:// and wss://
        ↓
8. JavaScript WebSocket API
        ↓
9. Java WebSocket API
        ↓
10. Spring WebSocket
        ↓
11. STOMP
        ↓
12. Authentication
        ↓
13. Connection management
        ↓
14. Reconnection
        ↓
15. Scaling WebSocket servers
```

The **most important mental model** is:

```text
REST:

Client ──request──> Server
Client <──response── Server


WebSocket:

Client <══════════════> Server
       persistent
       two-way
       real-time
```

Once you understand that distinction, WebSocket becomes much easier to understand.
