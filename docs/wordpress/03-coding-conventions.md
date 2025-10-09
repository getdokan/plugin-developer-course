# Coding Conventions

Learn WordPress coding standards, best practices, and conventions to write clean, maintainable, and secure code.

## Why Coding Standards Matter

Coding standards ensure:

- **Consistency** - Code looks uniform across projects
- **Readability** - Easier to understand and maintain
- **Collaboration** - Team members can work together seamlessly
- **Quality** - Reduces bugs and security vulnerabilities
- **Professionalism** - Industry-standard code

## WordPress Coding Standards

WordPress follows specific coding standards for different languages:

1. **PHP Coding Standards**
2. **HTML Coding Standards**
3. **CSS Coding Standards**
4. **JavaScript Coding Standards**

### Official Documentation

- [WordPress Coding Standards](https://developer.wordpress.org/coding-standards/)
- [WordPress PHP Coding Standards](https://developer.wordpress.org/coding-standards/wordpress-coding-standards/php/)

## PHP Coding Standards

### File Organization

#### File Header

```php
<?php
/**
 * Plugin Name: My Plugin Name
 * Plugin URI: https://example.com/my-plugin
 * Description: Brief description of the plugin
 * Version: 1.0.0
 * Author: Your Name
 * Author URI: https://example.com
 * License: GPL-2.0+
 * License URI: http://www.gnu.org/licenses/gpl-2.0.txt
 * Text Domain: my-plugin
 * Domain Path: /languages
 */

// If this file is called directly, abort.
if (!defined('WPINC')) {
    die;
}
```

### Naming Conventions

#### Functions

```php
// Use lowercase and underscores
function my_plugin_function_name() {
    // Function code
}

// Prefix with plugin/theme name to avoid conflicts
function myplugin_get_user_data() {
    // Function code
}

// BAD - no prefix, camelCase
function getUserData() {
    // Don't do this
}
```

#### Variables

```php
// Use lowercase and underscores
$user_name = 'John';
$post_count = 10;
$is_active = true;

// BAD - camelCase
$userName = 'John';
$postCount = 10;
```

#### Classes

```php
// Use PascalCase (first letter of each word capitalized)
class My_Plugin_Admin {
    // Class code
}

class WP_Custom_Widget extends WP_Widget {
    // Class code
}

// With namespaces (recommended for modern code)
namespace MyPlugin\Admin;

class Dashboard {
    // Class code
}
```

#### Constants

```php
// Use uppercase and underscores
define('MY_PLUGIN_VERSION', '1.0.0');
define('MY_PLUGIN_PATH', plugin_dir_path(__FILE__));

// Or use const in classes
class My_Plugin {
    const VERSION = '1.0.0';
    const MIN_PHP_VERSION = '7.4';
}
```

### Indentation and Spacing

#### Indentation

Use **tabs** for indentation (not spaces):

```php
<?php
function my_function() {
	if (condition) {
		// Code here (one tab)
		for ($i = 0; $i < 10; $i++) {
			// Code here (two tabs)
		}
	}
}
```

#### Spacing

```php
// Space after control structures
if (condition) {
	// code
}

while (condition) {
	// code
}

for ($i = 0; $i < 10; $i++) {
	// code
}

// Space around operators
$result = $value1 + $value2;
$is_equal = ($a === $b);

// Space after commas in function calls
my_function($arg1, $arg2, $arg3);

// No space inside parentheses
if ($condition) {  // GOOD
if ( $condition ) {  // BAD
```

### Brace Style

```php
// Opening brace on same line (K&R style)
function my_function() {
	// code
}

if ($condition) {
	// code
} else {
	// code
}

// Always use braces, even for single-line statements
if ($condition) {
	return true;
}

// BAD - no braces
if ($condition)
	return true;
```

### Code Documentation

#### File Documentation

```php
<?php
/**
 * My Plugin Core File
 *
 * This file contains the main plugin functionality
 *
 * @package    My_Plugin
 * @subpackage My_Plugin/includes
 * @since      1.0.0
 */
```

#### Function Documentation

```php
/**
 * Retrieve user data by user ID.
 *
 * @since 1.0.0
 *
 * @param int    $user_id User ID.
 * @param string $context Optional. Context for data. Default 'display'.
 * @return array|false User data array on success, false on failure.
 */
function myplugin_get_user_data($user_id, $context = 'display') {
	// Function code
}
```

#### Class Documentation

```php
/**
 * Core plugin class.
 *
 * This is used to define internationalization, admin-specific hooks,
 * and public-facing site hooks.
 *
 * @since      1.0.0
 * @package    My_Plugin
 * @subpackage My_Plugin/includes
 * @author     Your Name <email@example.com>
 */
class My_Plugin {
	// Class code
}
```

#### Inline Comments

```php
// Single-line comment for brief explanations

/*
 * Multi-line comment for longer
 * explanations that span multiple lines.
 */

/**
 * Multi-line comment using
 * PHPDoc format (preferred).
 */
```

## Security Best Practices

### Input Validation and Sanitization

```php
// Sanitize text input
$user_input = sanitize_text_field($_POST['field_name']);

// Sanitize email
$email = sanitize_email($_POST['email']);

// Sanitize URL
$url = esc_url_raw($_POST['url']);

// Sanitize HTML
$html = wp_kses_post($_POST['content']);

// Sanitize integer
$number = absint($_POST['number']);

// Sanitize array
$array = array_map('sanitize_text_field', $_POST['array_field']);
```

### Output Escaping

```php
// Escape HTML
echo esc_html($user_input);

// Escape attributes
echo '<div class="' . esc_attr($class_name) . '">';

// Escape URLs
echo '<a href="' . esc_url($url) . '">';

// Escape JavaScript
echo '<script>var data = "' . esc_js($data) . '";</script>';

// Escape translation
echo esc_html__('Hello World', 'text-domain');
```

### Nonce Verification

```php
// Create nonce
wp_nonce_field('my_action', 'my_nonce_field');

// Verify nonce
if (!isset($_POST['my_nonce_field']) || 
    !wp_verify_nonce($_POST['my_nonce_field'], 'my_action')) {
    die('Security check failed');
}

// Nonce for URLs
$url = wp_nonce_url(admin_url('admin-post.php?action=my_action'), 'my_action');

// Verify nonce from URL
if (!wp_verify_nonce($_GET['_wpnonce'], 'my_action')) {
    die('Security check failed');
}
```

### Database Queries

```php
global $wpdb;

// BAD - SQL injection vulnerable
$results = $wpdb->get_results("SELECT * FROM {$wpdb->posts} WHERE ID = {$_GET['id']}");

// GOOD - prepared statement
$results = $wpdb->get_results(
	$wpdb->prepare(
		"SELECT * FROM {$wpdb->posts} WHERE ID = %d",
		$_GET['id']
	)
);

// Multiple placeholders
$results = $wpdb->get_results(
	$wpdb->prepare(
		"SELECT * FROM {$wpdb->posts} WHERE post_type = %s AND post_status = %s",
		$post_type,
		$post_status
	)
);
```

### Capability Checks

```php
// Check user capabilities
if (!current_user_can('manage_options')) {
    wp_die(__('You do not have sufficient permissions to access this page.'));
}

// Check for specific post
if (!current_user_can('edit_post', $post_id)) {
    wp_die(__('You do not have permission to edit this post.'));
}

// Check for custom capability
if (!current_user_can('publish_plugins')) {
    return;
}
```

## WordPress-Specific Best Practices

### Using WordPress Functions

```php
// GOOD - Use WordPress HTTP API
$response = wp_remote_get('https://api.example.com/data');

// BAD - Don't use curl directly
$ch = curl_init('https://api.example.com/data');

// GOOD - Use WordPress filesystem API
require_once(ABSPATH . 'wp-admin/includes/file.php');
WP_Filesystem();
global $wp_filesystem;
$wp_filesystem->put_contents($file, $content);

// BAD - Don't use PHP file functions directly in production
file_put_contents($file, $content);
```

### Enqueuing Assets

```php
// GOOD - Enqueue scripts and styles properly
function myplugin_enqueue_assets() {
	wp_enqueue_style(
		'myplugin-styles',
		plugins_url('css/style.css', __FILE__),
		array(),
		'1.0.0'
	);
	
	wp_enqueue_script(
		'myplugin-script',
		plugins_url('js/script.js', __FILE__),
		array('jquery'),
		'1.0.0',
		true
	);
}
add_action('wp_enqueue_scripts', 'myplugin_enqueue_assets');

// BAD - Don't include directly in templates
<link rel="stylesheet" href="<?php echo plugins_url('css/style.css', __FILE__); ?>">
```

### Database Operations

```php
// GOOD - Use WordPress database functions
$post_data = array(
	'post_title'   => 'My Post',
	'post_content' => 'Post content',
	'post_status'  => 'publish',
	'post_type'    => 'post',
);
$post_id = wp_insert_post($post_data);

// Update post meta
update_post_meta($post_id, 'custom_field', $value);

// Get post meta
$value = get_post_meta($post_id, 'custom_field', true);

// Delete post meta
delete_post_meta($post_id, 'custom_field');
```

### Internationalization (i18n)

```php
// Translatable strings
__('Hello World', 'text-domain');           // Return translated string
_e('Hello World', 'text-domain');           // Echo translated string
_x('Post', 'noun', 'text-domain');          // Context-specific translation
_n('1 item', '%d items', $count, 'text-domain'); // Plural forms

// Translation with escaping
esc_html__('Hello World', 'text-domain');   // Escape HTML
esc_attr__('Hello World', 'text-domain');   // Escape attribute
esc_html_e('Hello World', 'text-domain');   // Echo escaped HTML

// Variables in translations
sprintf(
	/* translators: %s: user name */
	__('Hello, %s!', 'text-domain'),
	$user_name
);
```

## Code Quality Tools

### PHP CodeSniffer

Install and configure PHP_CodeSniffer with WordPress standards:

```bash
# Install via Composer
composer global require "squizlabs/php_codesniffer=*"
composer global require wp-coding-standards/wpcs

# Set WordPress as default standard
phpcs --config-set installed_paths ~/.composer/vendor/wp-coding-standards/wpcs
phpcs --config-set default_standard WordPress

# Check a file
phpcs my-plugin.php

# Check a directory
phpcs wp-content/plugins/my-plugin/

# Auto-fix issues
phpcbf wp-content/plugins/my-plugin/
```

### VS Code PHP Coding Standards

```json
{
	"phpSniffer.standard": "WordPress",
	"phpSniffer.autoExecute": true,
	"phpSniffer.executablesFolder": "/usr/local/bin/"
}
```

## HTML Coding Standards

### HTML Formatting

```html
<!-- Use proper indentation -->
<div class="container">
	<div class="row">
		<div class="col">
			<p>Content here</p>
		</div>
	</div>
</div>

<!-- Self-closing tags -->
<img src="image.jpg" alt="Description" />
<br />
<input type="text" name="field" />

<!-- Attributes in order: class, id, data-*, then others -->
<div class="my-class" id="my-id" data-value="123" aria-label="Label">
```

### Accessibility

```html
<!-- Always include alt text for images -->
<img src="logo.png" alt="Company Logo" />

<!-- Use semantic HTML -->
<header>
	<nav aria-label="Main Navigation">
		<ul>
			<li><a href="/">Home</a></li>
		</ul>
	</nav>
</header>

<main>
	<article>
		<h1>Article Title</h1>
	</article>
</main>

<footer>
	<!-- Footer content -->
</footer>

<!-- ARIA labels for accessibility -->
<button aria-label="Close dialog">X</button>
```

## CSS Coding Standards

### CSS Formatting

```css
/* Use lowercase and hyphens for selectors */
.my-custom-class {
	display: block;
	margin: 0 auto;
	padding: 10px 20px;
}

/* Property order: positioning, box model, typography, visual, misc */
.my-element {
	/* Positioning */
	position: absolute;
	top: 0;
	left: 0;
	
	/* Box model */
	display: block;
	width: 100%;
	padding: 10px;
	margin: 0;
	
	/* Typography */
	font-family: Arial, sans-serif;
	font-size: 16px;
	line-height: 1.5;
	
	/* Visual */
	background-color: #fff;
	border: 1px solid #ddd;
	color: #333;
}

/* Use shorthand properties when possible */
margin: 10px 20px;           /* top/bottom left/right */
padding: 10px 15px 10px 15px; /* top right bottom left */

/* Prefix classes with plugin/theme name */
.myplugin-button { }
.mytheme-header { }
```

## JavaScript Coding Standards

### JavaScript Formatting

```javascript
// Use camelCase for variables and functions
const userName = 'John';
const postCount = 10;

function getUserData() {
	// Function code
}

// Use PascalCase for classes
class UserManager {
	constructor() {
		// Constructor code
	}
}

// Use const and let, avoid var
const API_URL = 'https://api.example.com';
let counter = 0;

// jQuery best practices
(function($) {
	'use strict';
	
	$(document).ready(function() {
		// DOM manipulation code
		$('.my-button').on('click', function(e) {
			e.preventDefault();
			// Handle click
		});
	});
})(jQuery);

// Use WordPress translations in JavaScript
wp.i18n.__('Hello World', 'text-domain');
```

## Practical Exercises

### Exercise 1: Code Review

Review the following code and identify issues:

```php
<?php
function GetUserData($ID) {
$data = $wpdb->get_results("SELECT * FROM wp_users WHERE ID = " . $ID);
echo $data->user_name;
return $data;
}
?>
```

### Exercise 2: Refactor Code

Refactor this code to follow WordPress standards:

```php
<?php
$Title = $_POST['title'];
echo "<h1>" . $Title . "</h1>";
?>
```

### Exercise 3: Security Audit

Identify security vulnerabilities in this code:

```php
<?php
function my_save_data() {
	$user_input = $_POST['data'];
	update_option('my_option', $user_input);
}
add_action('wp_ajax_save_data', 'my_save_data');
?>
```

## Key Takeaways

1. **Always follow WordPress coding standards** for consistency
2. **Use proper naming conventions** with prefixes
3. **Sanitize input, escape output** for security
4. **Use WordPress functions** instead of PHP native functions
5. **Document your code** with PHPDoc comments
6. **Validate user capabilities** before sensitive operations
7. **Use prepared statements** for database queries
8. **Make code translatable** with i18n functions
9. **Use code quality tools** like PHP_CodeSniffer
10. **Write accessible HTML** with semantic markup

## Next Steps

With coding conventions mastered, move on to [Basic Plugin Development](04-basic-plugin-development.md) to start building your first WordPress plugin.

---

**Resources:**

- [WordPress Coding Standards](https://developer.wordpress.org/coding-standards/)
- [WordPress PHP Coding Standards](https://developer.wordpress.org/coding-standards/wordpress-coding-standards/php/)
- [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer)
- [WordPress Coding Standards for PHP_CodeSniffer](https://github.com/WordPress/WordPress-Coding-Standards)

