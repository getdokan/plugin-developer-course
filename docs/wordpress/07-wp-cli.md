# WP-CLI (WordPress Command Line Interface)

Master the powerful command-line tool for managing WordPress installations, automating tasks, and increasing productivity.

## What is WP-CLI?

WP-CLI is the official command-line interface for WordPress. It provides a set of commands for managing WordPress sites without using a web browser, making it essential for developers, system administrators, and power users.

### Benefits of WP-CLI

- **Speed** - Much faster than GUI operations
- **Automation** - Script repetitive tasks
- **Bulk Operations** - Perform actions on multiple items
- **Server Management** - Manage sites via SSH
- **CI/CD Integration** - Use in deployment pipelines
- **No Browser Required** - Work via terminal only

## Installation

### macOS (Homebrew)

```bash
brew install wp-cli
```

### Linux/Unix

```bash
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
```

### Verify Installation

```bash
wp --info
```

### Update WP-CLI

```bash
wp cli update
```

## Basic Commands

### Getting Help

```bash
# General help
wp help

# Command-specific help
wp plugin help
wp plugin install --help

# List all commands
wp cli cmd-dump
```

### Core Commands

#### Download WordPress

```bash
# Download latest WordPress
wp core download

# Download specific version
wp core download --version=6.3

# Download in specific language
wp core download --locale=es_ES

# Force download (overwrite existing)
wp core download --force
```

#### Install WordPress

```bash
# Create wp-config.php
wp config create --dbname=wordpress --dbuser=root --dbpass=password --dbhost=localhost

# Install WordPress
wp core install \
  --url=example.test \
  --title="My WordPress Site" \
  --admin_user=admin \
  --admin_password=password \
  --admin_email=admin@example.com

# Complete installation in one command
wp core download && \
wp config create --dbname=wordpress --dbuser=root --dbpass=password && \
wp core install --url=example.test --title="My Site" --admin_user=admin --admin_password=password --admin_email=admin@example.com
```

#### Update WordPress

```bash
# Check for core updates
wp core check-update

# Update to latest version
wp core update

# Update to specific version
wp core update --version=6.3

# Update database
wp core update-db
```

#### WordPress Information

```bash
# Check WordPress version
wp core version

# Check if WordPress is installed
wp core is-installed

# Verify core files
wp core verify-checksums
```

## Plugin Management

### List Plugins

```bash
# List all plugins
wp plugin list

# List active plugins
wp plugin list --status=active

# List inactive plugins
wp plugin list --status=inactive

# Output as JSON
wp plugin list --format=json
```

### Install Plugins

```bash
# Install plugin
wp plugin install query-monitor

# Install and activate
wp plugin install query-monitor --activate

# Install specific version
wp plugin install query-monitor --version=3.12.0 --activate

# Install from ZIP
wp plugin install https://example.com/plugin.zip --activate

# Install multiple plugins
wp plugin install query-monitor user-switching debug-bar --activate
```

### Activate/Deactivate Plugins

```bash
# Activate plugin
wp plugin activate query-monitor

# Activate all plugins
wp plugin activate --all

# Deactivate plugin
wp plugin deactivate query-monitor

# Deactivate all plugins
wp plugin deactivate --all

# Toggle plugin status
wp plugin toggle query-monitor
```

### Update Plugins

```bash
# List plugin updates
wp plugin list --update=available

# Update specific plugin
wp plugin update query-monitor

# Update all plugins
wp plugin update --all

# Update all except specific plugins
wp plugin update --all --exclude=woocommerce,jetpack
```

### Uninstall Plugins

```bash
# Delete plugin (deactivate first)
wp plugin deactivate plugin-name
wp plugin delete plugin-name

# Uninstall plugin (runs uninstall.php)
wp plugin uninstall plugin-name --deactivate
```

### Plugin Information

```bash
# Get plugin status
wp plugin status query-monitor

# Get plugin path
wp plugin path query-monitor

# Search for plugins
wp plugin search query monitor
```

## Theme Management

### List Themes

```bash
# List all themes
wp theme list

# List active theme
wp theme list --status=active

# Get current theme
wp theme list --status=active --field=name
```

### Install Themes

```bash
# Install theme
wp theme install twentytwentyfour

# Install and activate
wp theme install twentytwentyfour --activate

# Install from ZIP
wp theme install https://example.com/theme.zip --activate
```

### Activate Themes

```bash
# Activate theme
wp theme activate twentytwentyfour

# Get current theme
wp theme list --status=active
```

### Update Themes

```bash
# Update specific theme
wp theme update twentytwentyfour

# Update all themes
wp theme update --all
```

### Delete Themes

```bash
# Delete theme
wp theme delete twentytwentythree

# Delete all themes except active
wp theme delete --all
```

## User Management

### List Users

```bash
# List all users
wp user list

# List with specific fields
wp user list --fields=ID,user_login,user_email,role

# Filter by role
wp user list --role=administrator

# Output as table
wp user list --format=table
```

### Create Users

```bash
# Create user
wp user create johndoe john@example.com --role=editor

# Create with password
wp user create johndoe john@example.com --role=author --user_pass=password123

# Create with first and last name
wp user create johndoe john@example.com \
  --role=editor \
  --first_name=John \
  --last_name=Doe \
  --display_name="John Doe"
```

### Update Users

```bash
# Update user role
wp user update 123 --role=administrator

# Update user email
wp user update johndoe --user_email=newemail@example.com

# Reset user password
wp user update johndoe --user_pass=newpassword123
```

### Delete Users

```bash
# Delete user (reassign posts to another user)
wp user delete 123 --reassign=456

# Delete multiple users
wp user delete 123 456 789 --reassign=1
```

### User Meta

```bash
# Get user meta
wp user meta get 123 first_name

# Add user meta
wp user meta add 123 custom_field "value"

# Update user meta
wp user meta update 123 custom_field "new value"

# Delete user meta
wp user meta delete 123 custom_field

# List all user meta
wp user meta list 123
```

## Post Management

### List Posts

```bash
# List all posts
wp post list

# List with specific fields
wp post list --fields=ID,post_title,post_status,post_date

# Filter by post type
wp post list --post_type=page

# Filter by status
wp post list --post_status=publish

# Filter by author
wp post list --author=1

# Order by date
wp post list --orderby=date --order=DESC
```

### Create Posts

```bash
# Create post
wp post create --post_title="My New Post" --post_status=publish

# Create with content
wp post create \
  --post_title="Hello World" \
  --post_content="This is the post content." \
  --post_status=publish \
  --post_type=post \
  --post_author=1

# Create from file
wp post create ./content.txt --post_title="From File"

# Generate dummy posts
wp post generate --count=50

# Generate posts with specific type
wp post generate --count=20 --post_type=page
```

### Update Posts

```bash
# Update post title
wp post update 123 --post_title="Updated Title"

# Update post status
wp post update 123 --post_status=draft

# Update multiple posts
wp post update 123 456 789 --post_status=publish
```

### Delete Posts

```bash
# Move post to trash
wp post delete 123

# Force delete (permanent)
wp post delete 123 --force

# Delete all posts of specific type
wp post delete $(wp post list --post_type=post --format=ids)

# Empty trash
wp post delete $(wp post list --post_status=trash --format=ids) --force
```

### Post Meta

```bash
# Get post meta
wp post meta get 123 _thumbnail_id

# Add post meta
wp post meta add 123 custom_field "value"

# Update post meta
wp post meta update 123 custom_field "new value"

# Delete post meta
wp post meta delete 123 custom_field

# List all post meta
wp post meta list 123
```

## Database Management

### Database Information

```bash
# Show database tables
wp db tables

# Show table size
wp db size --tables

# Check database
wp db check

# Optimize database
wp db optimize

# Repair database
wp db repair
```

### Database Export/Import

```bash
# Export database
wp db export

# Export to specific file
wp db export backup.sql

# Export with compression
wp db export backup.sql.gz

# Import database
wp db import backup.sql

# Import from URL
wp db import https://example.com/backup.sql
```

### Database Queries

```bash
# Run SQL query
wp db query "SELECT * FROM wp_posts WHERE post_status = 'publish' LIMIT 5"

# Get specific data
wp db query "SELECT COUNT(*) FROM wp_posts WHERE post_type = 'post'"

# Run SQL file
wp db query < queries.sql
```

### Search and Replace

```bash
# Basic search-replace
wp search-replace 'old-url.com' 'new-url.com'

# Dry run (preview changes)
wp search-replace 'old-url.com' 'new-url.com' --dry-run

# Search-replace in specific table
wp search-replace 'old-url.com' 'new-url.com' wp_posts

# Case-insensitive search
wp search-replace 'old-url.com' 'new-url.com' --all-tables-with-prefix --precise

# Report changes
wp search-replace 'old-url.com' 'new-url.com' --report

# Skip specific columns
wp search-replace 'old' 'new' --skip-columns=guid
```

## Cache Management

```bash
# Flush cache
wp cache flush

# Clear transients
wp transient delete --all

# Clear expired transients
wp transient delete --expired
```

## Cron Management

### List Scheduled Events

```bash
# List all cron events
wp cron event list

# List specific event
wp cron event list --fields=hook,next_run,recurrence
```

### Run Cron

```bash
# Run all due cron events
wp cron event run --due-now

# Run specific event
wp cron event run wp_version_check
```

### Schedule Events

```bash
# Schedule single event
wp cron event schedule my_custom_event '+1 hour'

# Schedule recurring event
wp cron event schedule my_custom_event now hourly
```

### Delete Events

```bash
# Delete specific event
wp cron event delete my_custom_event

# Delete all events for a hook
wp cron event delete my_custom_event --all
```

## Media Management

```bash
# Import media file
wp media import image.jpg --title="My Image" --alt="Image description"

# Import from URL
wp media import https://example.com/image.jpg

# Import multiple files
wp media import *.jpg

# Regenerate thumbnails
wp media regenerate --yes

# Regenerate specific image
wp media regenerate 123
```

## Site Options

```bash
# Get option
wp option get blogname

# List all options
wp option list

# Add option
wp option add my_option "value"

# Update option
wp option update blogname "New Site Name"

# Delete option
wp option delete my_option

# Get option JSON format
wp option get my_option --format=json
```

## Rewrite Rules

```bash
# Flush rewrite rules
wp rewrite flush

# List rewrite rules
wp rewrite list

# View permalink structure
wp rewrite structure
```

## Multisite Commands

```bash
# List sites
wp site list

# Create site
wp site create --slug=newsite --title="New Site"

# Delete site
wp site delete 2

# Empty site
wp site empty 2 --yes

# Activate plugin network-wide
wp plugin activate akismet --network
```

## Package Management

```bash
# List installed packages
wp package list

# Install package
wp package install wp-cli/doctor-command

# Update packages
wp package update

# Uninstall package
wp package uninstall wp-cli/doctor-command
```

## Scaffolding

### Generate Plugin

```bash
# Create plugin structure
wp scaffold plugin my-plugin

# Create plugin with specific features
wp scaffold plugin my-plugin \
  --plugin_name="My Plugin" \
  --plugin_description="Plugin description" \
  --plugin_author="Your Name" \
  --plugin_uri="https://example.com"
```

### Generate Post Type

```bash
# Generate custom post type
wp scaffold post-type book --plugin=my-plugin

# Generate with taxonomies
wp scaffold post-type book --plugin=my-plugin --taxonomy=genre
```

### Generate Taxonomy

```bash
# Generate custom taxonomy
wp scaffold taxonomy genre --plugin=my-plugin --post_types=book
```

### Generate Theme

```bash
# Create theme structure
wp scaffold theme my-theme

# Create child theme
wp scaffold child-theme my-child-theme --parent_theme=twentytwentyfour
```

## Configuration File (wp-cli.yml)

Create `wp-cli.yml` in your project root:

```yaml
# wp-cli.yml
path: public_html

# Set default user
user: admin

# Skip plugins
skip-plugins:
  - plugin1
  - plugin2

# Skip themes
skip-themes:
  - theme1

# Disable colors
color: false

# Require specific WP-CLI version
require:
  - wp-cli/wp-cli: ^2.8
```

## Aliases

Create aliases in `~/.wp-cli/config.yml`:

```yaml
# ~/.wp-cli/config.yml
@dev:
  ssh: user@dev.example.com
  path: /var/www/html

@prod:
  ssh: user@prod.example.com
  path: /var/www/html
```

**Use aliases:**

```bash
# Run command on remote server
wp @dev plugin list
wp @prod core update
```

## Shell Scripts with WP-CLI

### Backup Script

```bash
#!/bin/bash
# backup.sh

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="backups"

mkdir -p $BACKUP_DIR

# Export database
wp db export "$BACKUP_DIR/db_$DATE.sql"

# Create tar archive
tar -czf "$BACKUP_DIR/files_$DATE.tar.gz" wp-content/

echo "Backup completed: $DATE"
```

### Deployment Script

```bash
#!/bin/bash
# deploy.sh

# Update WordPress
wp core update

# Update plugins
wp plugin update --all

# Update themes
wp theme update --all

# Clear cache
wp cache flush

# Flush rewrite rules
wp rewrite flush

echo "Deployment completed"
```

## Practical Exercises

### Exercise 1: Complete WordPress Setup

Write a script to set up a new WordPress installation with:
- Database creation
- WordPress download and installation
- Essential plugins installation
- Theme activation
- User creation

### Exercise 2: Content Migration

Create a script to:
- Export posts from one site
- Import posts to another site
- Update URLs
- Regenerate thumbnails

### Exercise 3: Maintenance Script

Build a maintenance script that:
- Backs up database
- Updates core, plugins, and themes
- Checks for broken links
- Optimizes database
- Clears cache

### Exercise 4: Bulk Operations

Create a script to:
- Generate 100 sample posts
- Assign random categories
- Set featured images
- Publish posts

## Key Takeaways

1. **WP-CLI is essential** for WordPress developers
2. **Automate repetitive tasks** with scripts
3. **Use search-replace carefully** with --dry-run
4. **Backup before major changes**
5. **Leverage scaffolding** for faster development
6. **Master database commands** for migrations
7. **Use aliases** for multi-server management
8. **Integrate into CI/CD pipelines**
9. **Generate dummy content** for testing
10. **Document custom scripts**

## Next Steps

Continue with [Advanced Plugin Development](08-advanced-plugin-development.md) to learn complex plugin patterns and techniques.

---

**Resources:**

- [WP-CLI Documentation](https://wp-cli.org/)
- [WP-CLI Command Reference](https://developer.wordpress.org/cli/commands/)
- [WP-CLI Handbook](https://make.wordpress.org/cli/handbook/)
- [WP-CLI GitHub](https://github.com/wp-cli/wp-cli)

