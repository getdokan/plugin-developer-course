# Web Fundamentals

Understanding how the web works is essential for every developer. This guide covers the fundamental concepts of web technologies.

## Table of Contents
1. [How the Web Works](#how-the-web-works)
2. [DNS (Domain Name System)](#dns-domain-name-system)
3. [HTTP/HTTPS Protocols](#httphttps-protocols)
4. [Web Servers](#web-servers)
5. [Browser Rendering](#browser-rendering)
6. [Email Systems](#email-systems)
7. [Web Security](#web-security)

---

## How the Web Works

### Client-Server Architecture

```
┌─────────┐                  ┌─────────┐
│         │    HTTP Request  │         │
│ Browser │ ──────────────>  │  Server │
│ (Client)│                  │         │
│         │ <──────────────  │         │
└─────────┘   HTTP Response  └─────────┘
```

### The Request-Response Cycle

1. **User enters URL** in browser
2. **DNS lookup** to find IP address
3. **TCP connection** established
4. **Browser sends HTTP request**
5. **Server processes request**
6. **Server sends HTTP response**
7. **Browser renders the page**

### What Happens When You Visit a Website?

```
1. You type: https://example.com
2. Browser checks cache (DNS cache, browser cache)
3. DNS query to resolve domain to IP (93.184.216.34)
4. Browser initiates TCP handshake with server
5. TLS/SSL handshake (for HTTPS)
6. Browser sends HTTP GET request
7. Server processes and sends HTML response
8. Browser parses HTML
9. Browser requests additional resources (CSS, JS, images)
10. Browser renders the page
```

---

## DNS (Domain Name System)

### What is DNS?

DNS translates human-readable domain names into IP addresses.

```
example.com → 93.184.216.34
```

### DNS Hierarchy

```
                    Root (.)
                       │
        ┌──────────────┼──────────────┐
        │              │              │
      .com           .org           .net
        │              │              │
    example        wikipedia      github
        │              │              │
      www            www            www
```

### DNS Record Types

#### A Record (Address)
Maps domain to IPv4 address
```
example.com.    IN    A    93.184.216.34
```

#### AAAA Record
Maps domain to IPv6 address
```
example.com.    IN    AAAA    2606:2800:220:1:248:1893:25c8:1946
```

#### CNAME Record (Canonical Name)
Creates an alias for another domain
```
www.example.com.    IN    CNAME    example.com.
```

#### MX Record (Mail Exchange)
Specifies mail servers
```
example.com.    IN    MX    10 mail.example.com.
```

#### TXT Record
Stores text information (SPF, DKIM, verification)
```
example.com.    IN    TXT    "v=spf1 include:_spf.google.com ~all"
```

#### NS Record (Name Server)
Specifies authoritative name servers
```
example.com.    IN    NS    ns1.example.com.
```

### DNS Resolution Process

```
1. Browser checks local cache
2. Operating system cache check
3. Router cache check
4. ISP DNS server (Recursive resolver)
5. Root name server
6. TLD name server (.com)
7. Authoritative name server
8. IP address returned
```

### DNS Commands

```bash
# Query DNS records
dig example.com
dig example.com A
dig example.com MX
dig example.com ANY

# Trace DNS resolution
dig +trace example.com

# Reverse DNS lookup
dig -x 93.184.216.34

# Using nslookup
nslookup example.com
nslookup -type=mx example.com

# Using host
host example.com
host -t mx example.com
```

### DNS Propagation

When you change DNS records, it takes time to propagate (usually 24-48 hours)

- TTL (Time To Live) determines cache duration
- Lower TTL = faster updates, more queries
- Higher TTL = slower updates, better performance

---

## HTTP/HTTPS Protocols

### HTTP (HyperText Transfer Protocol)

HTTP is the foundation of data communication on the web.

### HTTP Methods

#### GET
Retrieve data from server
```http
GET /api/users HTTP/1.1
Host: example.com
```

- Safe (doesn't modify data)
- Idempotent (same result every time)
- Can be cached
- Parameters in URL

#### POST
Submit data to server
```http
POST /api/users HTTP/1.1
Host: example.com
Content-Type: application/json

{"name": "John", "email": "john@example.com"}
```

- Not safe (modifies data)
- Not idempotent
- Not cached by default
- Data in request body

#### PUT
Update/replace resource
```http
PUT /api/users/123 HTTP/1.1
Host: example.com
Content-Type: application/json

{"name": "John Updated", "email": "john@example.com"}
```

- Not safe
- Idempotent
- Replaces entire resource

#### PATCH
Partial update of resource
```http
PATCH /api/users/123 HTTP/1.1
Host: example.com
Content-Type: application/json

{"name": "John Updated"}
```

- Not safe
- Not always idempotent
- Updates specific fields

#### DELETE
Remove resource
```http
DELETE /api/users/123 HTTP/1.1
Host: example.com
```
- Not safe
- Idempotent

#### HEAD
Same as GET but without response body
```http
HEAD /api/users HTTP/1.1
Host: example.com
```

#### OPTIONS
Get supported HTTP methods
```http
OPTIONS /api/users HTTP/1.1
Host: example.com
```

### HTTP Status Codes

#### 1xx - Informational
- **100 Continue**: Continue with request
- **101 Switching Protocols**: Switching to WebSocket

#### 2xx - Success
- **200 OK**: Request succeeded
- **201 Created**: Resource created
- **202 Accepted**: Request accepted for processing
- **204 No Content**: Success but no content to return

#### 3xx - Redirection
- **301 Moved Permanently**: Permanent redirect
- **302 Found**: Temporary redirect
- **304 Not Modified**: Use cached version
- **307 Temporary Redirect**: Same as 302 but method unchanged

#### 4xx - Client Errors
- **400 Bad Request**: Invalid syntax
- **401 Unauthorized**: Authentication required
- **403 Forbidden**: Access denied
- **404 Not Found**: Resource not found
- **405 Method Not Allowed**: HTTP method not supported
- **409 Conflict**: Request conflicts with server state
- **422 Unprocessable Entity**: Validation errors
- **429 Too Many Requests**: Rate limit exceeded

#### 5xx - Server Errors
- **500 Internal Server Error**: Generic server error
- **501 Not Implemented**: Feature not supported
- **502 Bad Gateway**: Invalid response from upstream
- **503 Service Unavailable**: Server overloaded/down
- **504 Gateway Timeout**: Upstream timeout

### HTTP Headers

#### Request Headers
```http
GET /api/users HTTP/1.1
Host: example.com
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)
Accept: application/json
Accept-Language: en-US,en;q=0.9
Accept-Encoding: gzip, deflate, br
Authorization: Bearer eyJhbGciOiJIUzI1NiIs...
Cookie: session_id=abc123
Content-Type: application/json
Referer: https://example.com/page
```

#### Response Headers
```http
HTTP/1.1 200 OK
Date: Thu, 02 Oct 2025 12:00:00 GMT
Server: nginx/1.18.0
Content-Type: application/json; charset=utf-8
Content-Length: 1234
Cache-Control: max-age=3600
ETag: "33a64df551425fcc55e4d42a148795d9f25f89d4"
Set-Cookie: session_id=xyz789; HttpOnly; Secure
Access-Control-Allow-Origin: *
X-Frame-Options: DENY
```

### HTTPS (HTTP Secure)

HTTPS = HTTP + TLS/SSL encryption

#### Why HTTPS?
- **Encryption**: Data encrypted in transit
- **Authentication**: Verify server identity
- **Integrity**: Detect tampering
- **SEO**: Google ranking factor
- **Browser trust**: No "Not Secure" warning

#### TLS Handshake
```
1. Client Hello (supported protocols, cipher suites)
2. Server Hello (chosen protocol, cipher suite)
3. Server Certificate (SSL certificate)
4. Client verifies certificate
5. Key exchange (generate session keys)
6. Secure connection established
```

#### SSL Certificates
- **Domain Validation (DV)**: Basic validation
- **Organization Validation (OV)**: Company verified
- **Extended Validation (EV)**: Highest validation
- **Wildcard**: Covers all subdomains (*.example.com)
- **Multi-Domain**: Multiple domains in one certificate

---

## Web Servers

### What is a Web Server?

Software that serves web content over HTTP/HTTPS.

### Popular Web Servers

#### Apache HTTP Server
- Most widely used
- Module-based architecture
- .htaccess support
- Flexible configuration
- Process-driven model

**Configuration Example:**
```apache
<VirtualHost *:80>
    ServerName example.com
    DocumentRoot /var/www/html
    
    <Directory /var/www/html>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

#### Nginx
- High performance
- Event-driven architecture
- Reverse proxy
- Load balancing
- Lower memory usage

**Configuration Example:**
```nginx
server {
    listen 80;
    server_name example.com;
    root /var/www/html;
    index index.php index.html;
    
    location / {
        try_files $uri $uri/ /index.php?$args;
    }
    
    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
    }
    
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;
}
```

### Virtual Hosts

Run multiple websites on single server

- Name-based: Multiple domains on same IP
- IP-based: Different IP for each domain

### Reverse Proxy

Server sits between clients and backend servers

- Load balancing
- Caching
- SSL termination
- Security

```
Client → Nginx (Reverse Proxy) → Backend Servers
```

### .htaccess (Apache)

Configuration file for directory-level settings

```apache
# Redirect to HTTPS
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

# Enable gzip compression
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/html text/css text/javascript
</IfModule>

# Caching
<IfModule mod_expires.c>
    ExpiresActive On
    ExpiresByType image/jpg "access plus 1 year"
    ExpiresByType text/css "access plus 1 month"
</IfModule>

# Block access to files
<Files .env>
    Order allow,deny
    Deny from all
</Files>
```

---

## Browser Rendering

### Rendering Engines

- **Blink**: Chrome, Edge, Opera, Brave
- **WebKit**: Safari
- **Gecko**: Firefox

### Critical Rendering Path

```
1. Parse HTML → DOM Tree
2. Parse CSS → CSSOM Tree
3. Combine DOM + CSSOM → Render Tree
4. Layout (calculate positions)
5. Paint (draw pixels)
6. Composite (layer composition)
```

### DOM (Document Object Model)

HTML → Tree structure

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Page</title>
  </head>
  <body>
    <h1>Hello</h1>
    <p>World</p>
  </body>
</html>
```

```
Document
└── html
    ├── head
    │   └── title
    │       └── "Page"
    └── body
        ├── h1
        │   └── "Hello"
        └── p
            └── "World"
```

### CSSOM (CSS Object Model)

CSS → Tree structure showing which styles apply to which elements

### Render Blocking

**CSS** blocks rendering:

- All CSS is render-blocking
- Minimize and inline critical CSS
- Load non-critical CSS asynchronously

**JavaScript** blocks parsing:

- Parser stops when it encounters `<script>`
- Use `async` or `defer` attributes
- Place scripts at end of body

```html
<!-- Blocks parsing -->
<script src="script.js"></script>

<!-- Downloads parallel, executes after parsing -->
<script src="script.js" defer></script>

<!-- Downloads and executes immediately -->
<script src="script.js" async></script>
```

### Browser Caching

#### Types of Cache
1. **Memory Cache**: RAM (fastest, cleared on close)
2. **Disk Cache**: Hard drive (persistent)
3. **Service Worker Cache**: Programmatic control

#### Cache Headers
```http
Cache-Control: max-age=3600
Cache-Control: no-cache
Cache-Control: no-store
Expires: Thu, 02 Oct 2025 12:00:00 GMT
ETag: "abc123"
Last-Modified: Thu, 01 Oct 2025 12:00:00 GMT
```

### Browser Developer Tools

#### Elements Tab
- Inspect HTML
- Modify DOM
- Edit CSS live
- View computed styles

#### Console Tab
- JavaScript errors
- Log messages
- Execute JavaScript

#### Network Tab
- Monitor requests
- View response
- Check timing
- Analyze performance

#### Performance Tab
- Record page load
- Identify bottlenecks
- CPU profiling
- Memory usage

#### Application Tab
- View cookies
- Local/session storage
- Service workers
- Cache storage

---

## Email Systems

### Email Protocols

#### SMTP (Simple Mail Transfer Protocol)
**Sending** emails

- Port 25 (unencrypted)
- Port 587 (TLS)
- Port 465 (SSL)

#### POP3 (Post Office Protocol v3)
**Receiving** emails (download)

- Port 110 (unencrypted)
- Port 995 (SSL)
- Downloads and deletes from server

#### IMAP (Internet Message Access Protocol)
**Receiving** emails (sync)

- Port 143 (unencrypted)
- Port 993 (SSL)
- Keeps emails on server
- Syncs across devices

### Email Flow

```
Sender → SMTP Server → Recipient SMTP Server → POP3/IMAP → Recipient
```

### Email Authentication

#### SPF (Sender Policy Framework)
Specifies which servers can send email for domain

```dns
example.com. IN TXT "v=spf1 ip4:192.0.2.0/24 include:_spf.google.com ~all"
```

#### DKIM (DomainKeys Identified Mail)
Digital signature to verify email authenticity

```dns
default._domainkey.example.com. IN TXT "v=DKIM1; k=rsa; p=MIGfMA0GCS..."
```

#### DMARC (Domain-based Message Authentication)
Policy for SPF and DKIM failures

```dns
_dmarc.example.com. IN TXT "v=DMARC1; p=quarantine; rua=mailto:dmarc@example.com"
```

### Sending Email from PHP

```php
// Using mail() function
mail(
    'recipient@example.com',
    'Subject',
    'Message body',
    'From: sender@example.com'
);

// Using PHPMailer (recommended)
use PHPMailer\PHPMailer\PHPMailer;

$mail = new PHPMailer(true);
$mail->isSMTP();
$mail->Host = 'smtp.example.com';
$mail->SMTPAuth = true;
$mail->Username = 'user@example.com';
$mail->Password = 'password';
$mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
$mail->Port = 587;

$mail->setFrom('sender@example.com', 'Sender Name');
$mail->addAddress('recipient@example.com');
$mail->Subject = 'Subject';
$mail->Body = 'Message body';

$mail->send();
```

---

## Web Security

### Common Vulnerabilities (OWASP Top 10)

#### 1. SQL Injection
**Problem**: Malicious SQL code injected

```php
// ❌ Vulnerable
$query = "SELECT * FROM users WHERE id = " . $_GET['id'];

// ✅ Secure - Use prepared statements
$stmt = $pdo->prepare("SELECT * FROM users WHERE id = ?");
$stmt->execute([$_GET['id']]);
```

#### 2. Cross-Site Scripting (XSS)
**Problem**: Malicious JavaScript injected

```php
// ❌ Vulnerable
echo "<div>" . $_GET['name'] . "</div>";

// ✅ Secure - Escape output
echo "<div>" . htmlspecialchars($_GET['name'], ENT_QUOTES, 'UTF-8') . "</div>";
```

#### 3. Cross-Site Request Forgery (CSRF)
**Problem**: Unauthorized actions performed

```php
// ✅ Generate token
$_SESSION['csrf_token'] = bin2hex(random_bytes(32));

// ✅ Verify token
if (!hash_equals($_SESSION['csrf_token'], $_POST['csrf_token'])) {
    die('Invalid CSRF token');
}
```

```html
<form method="POST">
    <input type="hidden" name="csrf_token" value="<?= $_SESSION['csrf_token'] ?>">
    <!-- form fields -->
</form>
```

#### 4. Insecure Authentication
```php
// ✅ Hash passwords
$hash = password_hash($password, PASSWORD_DEFAULT);

// ✅ Verify passwords
if (password_verify($password, $hash)) {
    // Login success
}

// ❌ Never store plain text passwords!
```

### Security Headers

```http
# Prevent XSS
X-XSS-Protection: 1; mode=block

# Prevent clickjacking
X-Frame-Options: DENY
X-Frame-Options: SAMEORIGIN

# Force HTTPS
Strict-Transport-Security: max-age=31536000; includeSubDomains

# Control resources
Content-Security-Policy: default-src 'self'; script-src 'self' https://trusted.com

# Prevent MIME sniffing
X-Content-Type-Options: nosniff

# Referrer policy
Referrer-Policy: strict-origin-when-cross-origin
```

### CORS (Cross-Origin Resource Sharing)

Allow/restrict resources from different origins

```http
# Allow specific origin
Access-Control-Allow-Origin: https://example.com

# Allow any origin (use carefully!)
Access-Control-Allow-Origin: *

# Allow credentials
Access-Control-Allow-Credentials: true

# Allow specific methods
Access-Control-Allow-Methods: GET, POST, PUT, DELETE

# Allow specific headers
Access-Control-Allow-Headers: Content-Type, Authorization
```

### Input Validation & Sanitization

```php
// Validate email
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die('Invalid email');
}

// Validate URL
if (!filter_var($url, FILTER_VALIDATE_URL)) {
    die('Invalid URL');
}

// Sanitize string
$clean = filter_var($input, FILTER_SANITIZE_STRING);

// Validate integer
$id = filter_var($_GET['id'], FILTER_VALIDATE_INT);
```

---

## Learning Resources

### Official Documentation
- [MDN Web Docs](https://developer.mozilla.org/)
- [HTTP/1.1 Specification](https://tools.ietf.org/html/rfc2616)
- [HTTP/2 Specification](https://tools.ietf.org/html/rfc7540)

### Interactive Tools
- [Webhook.site](https://webhook.site/) - Test HTTP requests
- [Postman](https://www.postman.com/) - API testing
- [cURL](https://curl.se/) - Command-line HTTP client

### Security Resources
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Mozilla Observatory](https://observatory.mozilla.org/)
- [Security Headers](https://securityheaders.com/)

### Testing Tools
```bash
# Test HTTP request
curl -I https://example.com

# Test with custom headers
curl -H "Authorization: Bearer token" https://api.example.com

# POST request
curl -X POST -d "key=value" https://example.com/api

# Test DNS
dig example.com
nslookup example.com

# Test port connectivity
telnet example.com 80
nc -zv example.com 443

# Test SSL certificate
openssl s_client -connect example.com:443
```

---

## Practice Exercises

1. **Trace a Website Visit**: Use browser dev tools to monitor all requests when loading a website
2. **DNS Investigation**: Use dig to trace DNS resolution for your favorite website
3. **HTTP Methods**: Create a simple REST API using different HTTP methods
4. **Security Headers**: Check security headers of popular websites
5. **Performance Audit**: Use Lighthouse to audit a website's performance

---

## Quiz Questions

1. What's the difference between HTTP and HTTPS?
2. What does a 404 status code mean?
3. What is the purpose of DNS?
4. What's the difference between GET and POST?
5. What is CORS and why is it important?
6. What are the three main email authentication methods?
7. How does browser caching improve performance?
8. What is XSS and how can you prevent it?

---

**Next Step**: Apply these concepts in real projects!

