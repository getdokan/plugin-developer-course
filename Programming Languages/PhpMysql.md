# PHP & MySQL

The following are some useful references for you to refresh your PHP & MySQL knowledge.

## Learning Resources

- [PHP 8 Tutorial by W3Schools](https://www.w3schools.com/php/) : A complete guide and tutorials to learn latest PHP language.

- [PHP Tutorial](https://www.tutorialspoint.com/php/index.htm): Another resource to learn PHP language.

- [Clean Code concepts adapted for PHP](https://github.com/jupeter/clean-code-php): To learn some of the best practices and clean coding standards in PHP.

- [PHP: Namespaces](https://php.net/manual/en/language.namespaces.php): To learn about PHP namespaces

- [PHP: Language Reference](https://php.net/manual/en/langref.php): Use this reference to find any topic related to PHP language.

- [MySQL Database](https://www.w3schools.com/php/php_mysql_intro.asp): To learn about the MySQL Database

- [MySQL Tutorial](https://www.tutorialspoint.com/mysql/): Another good resource to learn about the MySQL Database

## Try it out!

### Problem 1: Debug the Log Function

The following PHP code attempts to write a log message to a file. However, it doesn't work as expected and is not writing anything to the file. Debug and try to solve the issue.

```php
<?php
/**
 * Function to write a message to a log file
 * 
 * @param string $message The message to write to the log file
 * 
 * @return void
 */
function writeLog( $message ) {
    $file = fopen( 'log.txt', 'r');

    fwrite( $file, $message . PHP_EOL );
    fclose($file);
}

writeLog( 'This is a test log.' );
?>
```

### Problem 2: Fix Email Validation

Fix the below problem where we are allowed to pass in empty email values, but the email key should be there.

```php
<?php
$data = array(
    'user' => array(
        'name'  => 'Alice',
        'email' => '',
    ),
);

if ( ! empty( $data['user']['email'] ) ) {
    echo 'Email key is provided.' . "\n";
} else {
    echo 'Email key is missing.' . "\n";
}
?>
```

## Ideas to Explore

- How does PHP handle type conversions during operations?

- How does PHP handle session management? What functions are commonly used to start, modify, and destroy sessions?

- Compare and contrast the `PDO` and `mysqli` extensions in PHP.

- What functions are available in PHP for regex?

## Quizzes

- [Quiz – PHP](https://learn.rtcamp.com/courses/engineering-basics/l/programming-languages/t/php-mysql/quizzes/external-php-quiz/)