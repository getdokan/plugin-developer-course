# Introducing WordPress

Learn the fundamentals of WordPress, its architecture, and how to navigate and use WordPress as a content management system (CMS).

## What is WordPress?

WordPress is a free, open-source content management system (CMS) written in PHP and paired with a MySQL or MariaDB database. It was originally created as a blogging platform but has evolved into a versatile CMS that powers over 43% of all websites on the internet.

> Checkout [WordPress Admin Dashboard Explained](https://www.youtube.com/watch?v=ugizvZtKAk0)
### Key Features

- **Open Source** - Free to use and modify
- **User-Friendly** - Intuitive admin interface
- **Extensible** - Thousands of plugins and themes
- **SEO-Friendly** - Built-in SEO features
- **Responsive** - Mobile-friendly design
- **Community** - Large, active community
- **Regular Updates** - Continuous security and feature improvements

## WordPress Architecture

### Core Components

#### 1. WordPress Core
The main WordPress files that provide the foundation:

- **wp-admin/** - Administration interface
- **wp-includes/** - Core libraries and functions
- **wp-content/** - Themes, plugins, and uploads
- **wp-config.php** - Configuration file
- **index.php** - Entry point

#### 2. Database Structure

WordPress uses MySQL/MariaDB with the following core tables:

```
wp_posts              # Posts, pages, custom post types
wp_postmeta           # Post metadata
wp_users              # User accounts
wp_usermeta           # User metadata
wp_comments           # Comments on posts
wp_commentmeta        # Comment metadata
wp_terms              # Categories, tags, taxonomies
wp_term_taxonomy      # Taxonomy relationships
wp_term_relationships # Object-term relationships
wp_options            # Site settings and options
wp_links              # Blogroll links (legacy)
```

#### 3. File Structure

```
wordpress/
├── wp-admin/              # Admin dashboard files
├── wp-content/            # User content directory
│   ├── plugins/          # Installed plugins
│   ├── themes/           # Installed themes
│   ├── uploads/          # Media uploads
│   └── languages/        # Translation files
├── wp-includes/          # Core WordPress files
│   ├── js/              # JavaScript files
│   ├── css/             # Stylesheets
│   └── *.php            # Core PHP files
├── wp-config.php         # Configuration
├── index.php             # Main entry point
├── wp-settings.php       # Bootstrap file
└── other wp-*.php files # Various core files
```

## Installing WordPress

### Manual Installation

#### Step 1: Download WordPress
```bash
# Using WP-CLI
wp core download

# Or download from WordPress.org
# https://wordpress.org/download/
```

#### Step 2: Create Database
```sql
CREATE DATABASE wordpress_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'strong_password';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_user'@'localhost';
FLUSH PRIVILEGES;
```

#### Step 3: Configure wp-config.php
```bash
# Copy sample config
cp wp-config-sample.php wp-config.php

# Edit database credentials
nano wp-config.php
```

```php
// Database settings
define('DB_NAME', 'wordpress_db');
define('DB_USER', 'wp_user');
define('DB_PASSWORD', 'strong_password');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', 'utf8mb4_unicode_ci');

// Security keys (generate at https://api.wordpress.org/secret-key/1.1/salt/)
define('AUTH_KEY',         'your-unique-key-here');
define('SECURE_AUTH_KEY',  'your-unique-key-here');
// ... add all 8 security keys
```

#### Step 4: Run Installation
Visit `http://your-domain.test/wp-admin/install.php` and follow the installation wizard.

### WP-CLI Installation

```bash
# Download WordPress core
wp core download

# Create wp-config.php
wp config create --dbname=wordpress_db --dbuser=wp_user --dbpass=strong_password

# Install WordPress
wp core install --url=example.test --title="My Site" --admin_user=admin --admin_password=password --admin_email=admin@example.com
```

## WordPress Admin Dashboard

### Navigating the Dashboard

#### Main Menu Items

**Dashboard** - Overview and quick stats
```
- Home
- Updates
```

**Posts** - Blog posts management
```
- All Posts
- Add New
- Categories
- Tags
```

**Media** - File uploads management
```
- Library
- Add New
```

**Pages** - Static pages
```
- All Pages
- Add New
```

**Comments** - User comments
```
- All Comments
- Pending, Approved, Spam, Trash
```

**Appearance** - Theme management
```
- Themes
- Customize
- Widgets
- Menus
- Theme File Editor
```

**Plugins** - Plugin management
```
- Installed Plugins
- Add New
- Plugin File Editor
```

**Users** - User management
```
- All Users
- Add New
- Your Profile
```

**Tools** - WordPress tools
```
- Import
- Export
- Site Health
- Export Personal Data
- Erase Personal Data
```

**Settings** - Site configuration
```
- General
- Writing
- Reading
- Discussion
- Media
- Permalinks
- Privacy
```

## Content Management

### Posts vs Pages

#### Posts
- **Time-sensitive** content (blog articles)
- **Organized** by categories and tags
- **RSS feed** enabled
- **Reverse chronological** order
- **Author** and date displayed
- **Comments** enabled by default

#### Pages
- **Static** content (About, Contact, Services)
- **Hierarchical** (can have parent pages)
- **No categories or tags**
- **No RSS feed**
- **Custom order**
- **Page templates** available

### Creating Content

#### Adding a New Post

```php
// Navigate to Posts > Add New

Title: Your Post Title

Content:
<!-- Use the block editor (Gutenberg) -->
- Add blocks (paragraph, image, heading, etc.)
- Format text
- Insert media
- Add links

Settings Panel:
- Categories: Select or create categories
- Tags: Add tags
- Featured Image: Set post thumbnail
- Excerpt: Custom excerpt
- Discussion: Enable/disable comments
- Publish: Schedule or publish immediately
```

#### Adding a New Page

```php
// Navigate to Pages > Add New

Similar to posts, but with additional options:
- Page Attributes: Parent page, order, template
- No categories or tags
```

### Media Library

#### Supported File Types

**Images:**

- JPEG, PNG, GIF, WebP, SVG (with plugin)

**Documents:**

- PDF, DOC, DOCX, PPT, PPTX, XLS, XLSX

**Audio:**

- MP3, M4A, OGG, WAV

**Video:**

- MP4, M4V, MOV, WMV, AVI, MPG, OGV, 3GP, 3G2

#### Uploading Media

```php
// Method 1: Media > Add New
// Drag and drop files or select from computer

// Method 2: Within post/page editor
// Add Image block or Media & Text block

// Method 3: WP-CLI
wp media import image.jpg --title="Image Title"
```

#### Image Sizes

WordPress automatically creates multiple image sizes:

```php
// Default sizes
thumbnail    # 150x150 (cropped)
medium       # 300x300 (proportional)
medium_large # 768x768 (proportional)
large        # 1024x1024 (proportional)
full         # Original size
```

## User Roles and Permissions

### User Roles

#### Super Admin
- **Multisite only**
- Full control over entire network

#### Administrator
- Complete control over single site
- Can do everything except manage network

**Capabilities:**

- Install/activate themes and plugins
- Add/delete users
- Manage all content
- Modify site settings

#### Editor
- Manage and publish all content

**Capabilities:**

- Create, edit, publish, delete any posts/pages
- Moderate comments
- Manage categories and tags
- Upload files

#### Author
- Create and publish own content

**Capabilities:**

- Create, edit, publish, delete own posts
- Upload files
- Cannot edit others' content

#### Contributor
- Create content but cannot publish

**Capabilities:**

- Create and edit own posts (unpublished)
- Cannot upload files
- Cannot publish

#### Subscriber
- Read-only access

**Capabilities:**

- View content
- Manage own profile
- Post comments

### Managing Users

```bash
# Add user via WP-CLI
wp user create johndoe john@example.com --role=editor --user_pass=password

# List users
wp user list

# Update user role
wp user update 2 --role=administrator

# Delete user
wp user delete 123 --reassign=456
```

## WordPress Settings

### General Settings

```
Site Title: Your Site Name
Tagline: Your Site Description
WordPress Address (URL): https://example.com
Site Address (URL): https://example.com
Email Address: admin@example.com
Membership: Anyone can register (optional)
New User Default Role: Subscriber
Site Language: English
Timezone: Your timezone
Date Format: F j, Y
Time Format: g:i a
Week Starts On: Monday
```

### Permalink Settings

**Permalink Structure Options:**


```
Plain:          ?p=123
Day and name:   /2025/10/03/sample-post/
Month and name: /2025/10/sample-post/
Numeric:        /archives/123
Post name:      /sample-post/ (Recommended)
Custom:         /blog/%postname%/
```

**Recommended Structure:**

```
Post name: /%postname%/
```

This provides:
- SEO-friendly URLs
- Clean, readable links
- Better user experience

## Themes

### What are Themes?

Themes control the appearance and layout of your WordPress site without modifying the core software.

### Default Themes

WordPress ships with default themes:
- **Twenty Twenty-Four** (2024)
- **Twenty Twenty-Three** (2023)
- **Twenty Twenty-Two** (2022)

### Installing Themes

#### From WordPress Repository

```bash
# Via admin dashboard
# Appearance > Themes > Add New > Search

# Via WP-CLI
wp theme install twentytwentyfour --activate
```

#### From ZIP File

```bash
# Via admin dashboard
# Appearance > Themes > Add New > Upload Theme

# Via WP-CLI
wp theme install theme.zip --activate
```

### Child Themes

Child themes allow you to modify a theme without changing the parent theme files.

## Plugins

### What are Plugins?

Plugins extend WordPress functionality by adding features and capabilities.

### Essential Plugins for Development

#### Debugging and Development
- **Query Monitor** - Debugging toolkit
- **User Switching** - Switch between user accounts
- **WP Crontrol** - Manage cron jobs

#### SEO
- **Yoast SEO** - SEO optimization
- **Rank Math** - SEO toolkit

#### Security
- **Wordfence** - Security and firewall
- **iThemes Security** - Security hardening

#### Performance
- **WP Super Cache** - Page caching
- **Smush** - Image optimization

#### Forms
- **Contact Form 7** - Contact forms
- **WPForms** - Form builder

### Installing Plugins

```bash
# Via admin dashboard
# Plugins > Add New > Search

# Via WP-CLI
wp plugin install query-monitor --activate

# Install from ZIP
wp plugin install plugin.zip --activate

# List installed plugins
wp plugin list

# Update all plugins
wp plugin update --all
```

## The Loop

The Loop is WordPress's core mechanism for displaying posts.

### Basic Loop

```php
<?php
if (have_posts()) :
    while (have_posts()) : the_post();
        // Display post content
        the_title('<h2>', '</h2>');
        the_content();
    endwhile;
else :
    echo '<p>No posts found</p>';
endif;
?>
```

## Template Hierarchy

WordPress uses a template hierarchy to determine which template file to use:

```
Single Post:
single-{post-type}-{slug}.php
single-{post-type}.php
single.php
singular.php
index.php

Page:
page-{slug}.php
page-{id}.php
page.php
singular.php
index.php

Archive:
archive-{post-type}.php
archive.php
index.php

Homepage:
front-page.php
home.php
index.php
```

## Practical Exercises

### Exercise 1: WordPress Administration

- [ ] Install WordPress locally
- [ ] Explore the admin dashboard
- [ ] Create 5 sample posts with categories and tags
- [ ] Create 3 pages with a parent-child relationship
- [ ] Upload various media files
- [ ] Create user accounts with different roles
- [ ] Configure permalink structure
- [ ] Install and activate a theme
- [ ] Install 3-5 essential plugins

### Exercise 2: Content Management

- [ ] Create a blog post with featured image
- [ ] Add categories and tags
- [ ] Create custom menus
- [ ] Customize the homepage
- [ ] Create a contact page
- [ ] Manage comments
- [ ] Use the block editor (Gutenberg)
- [ ] Create reusable blocks

## Key Takeaways

1. WordPress is a powerful, open-source CMS
2. Understanding the file structure is crucial
3. The admin dashboard is intuitive and user-friendly
4. Posts are for time-sensitive content; pages for static content
5. Themes control appearance; plugins add functionality
6. User roles define capabilities and permissions
7. The Loop is core to displaying content
8. Template hierarchy determines which file is used

## Next Steps

Now that you understand WordPress fundamentals, proceed to [Coding Conventions](03-coding-conventions.md) to learn WordPress coding standards and best practices.

---

**Resources:**

- [WordPress.org Learn - Introduction to WordPress](https://learn.wordpress.org/)
- [WordPress Codex](https://codex.wordpress.org/)
- [WordPress Developer Documentation](https://developer.wordpress.org/)

