# WordPress Development

Master WordPress development from basics to advanced plugin development.

## 🎯 Prerequisites

Before starting WordPress, complete:
- ✅ [HTML & CSS](HtmlCss.md)
- ✅ [JavaScript](JavaScript.md)
- ✅ [PHP & MySQL](PhpMysql.md)
- ✅ [Development Environment](dev-environment.md)

## 📚 Learning Path

### 1. WordPress Administration

**Get comfortable with WordPress first:**
- Install WordPress locally using Laravel Herd
- Explore the admin dashboard
- Create pages, posts, and media
- Install and activate themes
- Install and activate plugins
- Manage users and permissions
- Understand WordPress settings

**Resources:**
- [WordPress.org Learn](https://learn.wordpress.org/)
- [WordPress Codex](https://codex.wordpress.org/)
- [WP Beginner](https://www.wpbeginner.com/)

### 2. WordPress Plugin Development

**Official Documentation:**
- [WordPress Plugin Handbook](https://developer.wordpress.org/plugins/) 📖 **START HERE**
- [Plugin Developer Handbook](https://developer.wordpress.org/plugins/intro/)

**Core Concepts:**

#### Hooks: Actions & Filters
WordPress hooks are the foundation of plugin development.

**Actions** - Do something at a specific point:
```php
// Add an action
add_action('wp_footer', 'my_custom_footer');

function my_custom_footer() {
    echo '<p>Custom footer text</p>';
}
```

**Filters** - Modify data:
```php
// Add a filter
add_filter('the_content', 'add_signature');

function add_signature($content) {
    return $content . '<p>Thanks for reading!</p>';
}
```

**Resources:**
- [Plugin API/Action Reference](https://codex.wordpress.org/Plugin_API/Action_Reference)
- [Plugin API/Filter Reference](https://codex.wordpress.org/Plugin_API/Filter_Reference)

#### WP-CLI (WordPress Command Line)

**Essential tool for WordPress developers:**
- [WP-CLI Documentation](https://wp-cli.org/) 🛠️

```bash
# Install WordPress
wp core download
wp core config --dbname=mydb --dbuser=root
wp core install --url=example.test --title="My Site"

# Plugin management
wp plugin list
wp plugin install query-monitor --activate
wp plugin update --all

# Theme management
wp theme list
wp theme activate twentytwentyfour

# Database
wp db export
wp db import backup.sql

# Search and replace
wp search-replace 'old-url.com' 'new-url.com'

# Generate content
wp post generate --count=10
```

### 3. WordPress Theme Development

**Official Documentation:**
- [WordPress Theme Handbook](https://developer.wordpress.org/themes/) 📖

**Key Concepts:**
- Template hierarchy
- Template tags
- The Loop
- Custom post types
- Custom taxonomies
- Theme functions.php
- Child themes

**Resources:**
- [Underscores (_s) Starter Theme](https://underscores.me/)
- [Theme Developer Handbook](https://developer.wordpress.org/themes/basics/)

## 🏗️ Modern WordPress Development

### 4. ReactJS for WordPress

**Modern JavaScript in WordPress:**
- [React Tutorial (Video)](https://www.youtube.com/watch?v=x4rFhThSX04) - Comprehensive guide
- [React Official Docs](https://react.dev/)

**Why React in WordPress?**
- Gutenberg editor is built with React
- Modern block development uses React
- Better user interfaces
- Component-based architecture

### 5. Gutenberg Block Development

**Building Custom Blocks:**

**Resources:**
- [Block Editor Handbook](https://developer.wordpress.org/block-editor/)
- [Create a Block Tutorial](https://developer.wordpress.org/block-editor/getting-started/create-block/)

**Quick Start:**
```bash
# Install @wordpress/create-block
npm install -g @wordpress/create-block

# Create a new block plugin
npx @wordpress/create-block my-custom-block

# Start development
cd my-custom-block
npm start
```

**Basic Block Structure:**
```jsx
import { registerBlockType } from '@wordpress/blocks';
import { useBlockProps } from '@wordpress/block-editor';

registerBlockType('myplugin/my-block', {
    edit: () => {
        const blockProps = useBlockProps();
        return <p {...blockProps}>Hello from the editor!</p>;
    },
    save: () => {
        const blockProps = useBlockProps.save();
        return <p {...blockProps}>Hello from the frontend!</p>;
    },
});
```

## 🛒 E-Commerce Development

### 6. WooCommerce

**The most popular WordPress e-commerce solution:**

**Resources:**
- [WooCommerce Documentation](https://woocommerce.com/documentation/)
- [WooCommerce Developer Docs](https://github.com/woocommerce/woocommerce/wiki)

**Key Topics:**
- Product types
- Orders and checkout
- Payment gateways
- Shipping methods
- WooCommerce hooks and filters
- Custom product types
- REST API

**Common Hooks:**
```php
// Modify product price
add_filter('woocommerce_get_price_html', 'custom_price_html', 10, 2);

// After checkout
add_action('woocommerce_thankyou', 'custom_thankyou_page');

// Modify cart
add_action('woocommerce_before_calculate_totals', 'modify_cart_items');
```

### 7. Dokan Plugin (Multi-vendor Marketplace)

**Build multi-vendor marketplaces:**

**Resources:**
- [Dokan Documentation](https://dokan.co/docs/)
- [Dokan GitHub](https://github.com/getdokan/dokan)

**Key Features:**
- Vendor dashboard
- Commission management
- Vendor products
- Vendor orders
- Multi-vendor shipping
- Custom integrations

**Dokan Hooks:**
```php
// After vendor registration
add_action('dokan_new_seller_created', 'custom_vendor_setup');

// Modify vendor dashboard
add_filter('dokan_get_dashboard_nav', 'add_custom_vendor_menu');
```

## 💻 Development Workflow

### Project Structure

```
wp-content/
├── plugins/
│   └── my-plugin/
│       ├── my-plugin.php
│       ├── includes/
│       ├── admin/
│       ├── public/
│       └── assets/
│           ├── css/
│           └── js/
└── themes/
    └── my-theme/
        ├── style.css
        ├── functions.php
        ├── index.php
        └── template-parts/
```

### Plugin Header

```php
<?php
/**
 * Plugin Name: My Awesome Plugin
 * Plugin URI: https://example.com/my-plugin
 * Description: A brief description of the plugin.
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

// Plugin code starts here...
```

### Best Practices

**Security:**
```php
// Sanitize input
$user_input = sanitize_text_field($_POST['field']);

// Validate and sanitize
$email = sanitize_email($_POST['email']);

// Escape output
echo esc_html($user_input);
echo esc_url($url);
echo esc_attr($attribute);

// Nonce verification
wp_verify_nonce($_POST['nonce'], 'action_name');
```

**Database Queries:**
```php
global $wpdb;

// Prepared statements (secure)
$results = $wpdb->get_results(
    $wpdb->prepare(
        "SELECT * FROM {$wpdb->prefix}posts WHERE post_type = %s",
        'post'
    )
);

// Never use direct queries!
// BAD: $wpdb->query("SELECT * FROM wp_posts WHERE id = " . $_GET['id']);
```

**WordPress Coding Standards:**
```php
// Use WordPress functions
wp_enqueue_script('my-script', plugin_dir_url(__FILE__) . 'js/script.js');
wp_enqueue_style('my-style', plugin_dir_url(__FILE__) . 'css/style.css');

// Use WordPress HTTP API
$response = wp_remote_get('https://api.example.com/data');

// Use WordPress filesystem
require_once(ABSPATH . 'wp-admin/includes/file.php');
WP_Filesystem();
global $wp_filesystem;
$wp_filesystem->put_contents($file, $content);
```

## 🔧 Essential WordPress Functions

### Common Functions

```php
// Get and set options
get_option('option_name', 'default');
update_option('option_name', 'value');
delete_option('option_name');

// Post functions
get_post(123);
wp_insert_post($post_data);
wp_update_post($post_data);
wp_delete_post(123);

// User functions
get_current_user_id();
wp_get_current_user();
is_user_logged_in();

// URL functions
home_url('/path');
site_url('/path');
admin_url('admin.php?page=my-plugin');
plugins_url('assets/js/script.js', __FILE__);

// Localization
__('Text to translate', 'textdomain');
_e('Text to echo', 'textdomain');
```

## 📦 Recommended WordPress Plugins for Development

Install these from [WordPress.org](https://wordpress.org/plugins/):

- **Query Monitor** - Debugging and profiling
- **User Switching** - Switch between user accounts
- **WP Crontrol** - Manage WordPress cron jobs
- **WP Console** - In-dashboard PHP console
- **WP Mail Logging** - Log all emails sent by WordPress

## 🎓 Learning Projects

### Beginner Projects
1. Simple contact form plugin
2. Custom post type plugin
3. Widget plugin
4. Shortcode plugin

### Intermediate Projects
1. Custom admin page with settings
2. REST API endpoint plugin
3. Custom Gutenberg block
4. WooCommerce extension

### Advanced Projects
1. Multi-vendor marketplace feature
2. Custom payment gateway
3. Complex booking system
4. Integration with external APIs

## 🏆 Certification & Courses

**Free Resources:**
- [WordPress.tv](https://wordpress.tv/) - Video tutorials
- [Learn WordPress](https://learn.wordpress.org/) - Official learning platform

**Paid Courses:**
- [WP Courses](https://wpcourses.com/)
- [Plugin Development Course](https://pluginize.com/)

## ✅ WordPress Developer Checklist

- [ ] Understand WordPress architecture
- [ ] Master hooks (actions & filters)
- [ ] Learn WP-CLI
- [ ] Build custom plugins
- [ ] Develop custom themes
- [ ] Create Gutenberg blocks
- [ ] Understand WooCommerce basics
- [ ] Learn Dokan multi-vendor concepts
- [ ] Follow WordPress coding standards
- [ ] Implement security best practices
- [ ] Use debugging tools effectively

## 📚 Additional Resources

- [WordPress Codex](https://codex.wordpress.org/)
- [WordPress Developer Resources](https://developer.wordpress.org/)
- [WordPress Stack Exchange](https://wordpress.stackexchange.com/)
- [WPBeginner](https://www.wpbeginner.com/)
- [Torque Magazine](https://torquemag.io/)

---

**Next Steps:**
1. Set up WordPress locally with Laravel Herd
2. Explore the admin dashboard
3. Build your first simple plugin
4. Learn WP-CLI commands
5. Study WordPress hooks
6. Create a Gutenberg block

**Time to Master:** 3-6 months of consistent practice

---

**See also:**
- [Development Environment Setup](dev-environment.md)
- [Debugging Configuration](../debuging.md)
- [PHP & MySQL Guide](PhpMysql.md)

