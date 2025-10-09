# PHP & MySQL

Learn server-side programming and database management.

## Quick Start

**New to PHP? Start here:**

- [Laracasts: PHP for Beginners (2023)](https://laracasts.com/series/php-for-beginners-2023-edition/episodes/1) - Complete video series
- [Laracasts: OOP Principles in PHP (2024)](https://laracasts.com/series/object-oriented-principles-in-php-2024-edition/episodes/1) - Object-oriented programming
- [PHP 8 Tutorial](https://www.w3schools.com/php/) - Interactive tutorials

**Database:**

- [Laracasts: MySQL Database Design](https://laracasts.com/series/mysql-database-design/episodes/1) - Video series
- [MySQL Tutorial](https://www.w3schools.com/php/php_mysql_intro.asp) - PHP + MySQL integration

## Required Tools Setup

Install these before starting:
- **Composer** - PHP dependency manager ([Download](https://getcomposer.org/))
- **Laravel Herd** - Local PHP development environment ([Download](https://herd.laravel.com/))
- **MySQL or MariaDB** - Database server

### Database Tools (choose one):
- **PHPMyAdmin** - Web-based database management
- **TablePlus** - Modern database GUI (Mac/Windows/Linux)
- **MySQL Workbench** - Official MySQL tool
- **Sequel Ace** - Mac-only database management

```bash
# Check installations
php --version
composer --version
mysql --version
```

## Core Learning

### PHP Fundamentals
- [PHP Language Reference](https://php.net/manual/en/langref.php) - Official documentation
- [PHP Tutorial (TutorialsPoint)](https://www.tutorialspoint.com/php/index.htm) - Comprehensive guide
- [PHP Namespaces](https://php.net/manual/en/language.namespaces.php) - Code organization
- [PHP Cheatsheet](https://www.php.net/manual/en/index.php) - Quick reference

### Best Practices
- [Clean Code PHP](https://github.com/jupeter/clean-code-php) - Write maintainable code

### MySQL
- [MySQL Tutorial (TutorialsPoint)](https://www.tutorialspoint.com/mysql/) - Complete database guide

## Practice Problems

### Problem 1: Debug the Log Function 🐛

**Bug:** This code doesn't write to the file. Find the issue!

```php
<?php
function writeLog($message) {
    $file = fopen('log.txt', 'r');  // ⚠️ Bug here!
    fwrite($file, $message . PHP_EOL);
    fclose($file);
}

writeLog('This is a test log.');
?>
```

<details>
<summary>💡 Hint</summary>
Check the file mode in fopen(). What does 'r' do vs what you need?
</details>

### Problem 2: Fix Email Validation 🔍

**Bug:** Empty emails pass validation. We need to check if the key exists, but allow empty values.

```php
<?php
$data = array(
    'user' => array(
        'name'  => 'Alice',
        'email' => '',  // Empty but key exists
    ),
);

// This should pass since key exists
if (!empty($data['user']['email'])) {  // ⚠️ Bug here!
    echo 'Email key is provided.' . "\n";
} else {
    echo 'Email key is missing.' . "\n";
}
?>
```

<details>
<summary>💡 Hint</summary>
Use isset() to check if a key exists, regardless of its value.
</details>

## 🤔 Deep Dive Topics

Master these PHP concepts:

- **Type Juggling** - How PHP handles type conversions
- **Session Management** - `session_start()`, `$_SESSION`, `session_destroy()`
- **PDO vs mysqli** - Database abstraction vs MySQL-specific
- **Regular Expressions** - `preg_match()`, `preg_replace()`, `preg_split()`
- **Error Handling** - `try/catch`, `throw`, custom exceptions
- **Autoloading** - PSR-4, Composer autoloader

## Test Your Knowledge

[Take the PHP & MySQL Quiz →](#)

**Goal:** Score 70% or higher