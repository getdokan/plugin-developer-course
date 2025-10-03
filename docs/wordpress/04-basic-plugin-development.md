# Basic Plugin Development

Learn to create custom WordPress plugins from scratch, understanding hooks, actions, filters, and plugin architecture.

---

## WordPress Plugin Development Study Plan

This comprehensive 6-week study plan is based on the official [WordPress Plugin Developer Handbook](https://developer.wordpress.org/plugins/). Follow this structured approach to master plugin development.

---

## Table of Contents

- [Week 1: Plugin Fundamentals](#week-1-plugin-fundamentals)
- [Week 2: Hooks & Security](#week-2-hooks--security)
- [Week 3: Administration & Content](#week-3-administration--content)
- [Week 4: Custom Content Types](#week-4-custom-content-types)
- [Week 5: Advanced Functionality](#week-5-advanced-functionality)
- [Week 6: REST API, Cron & Distribution](#week-6-rest-api-cron--distribution)
- [Week 7: Final Project (Optional)](#final-project-week-7---optional)
- [Additional Resources](#additional-resources)

---

## Week 1: Plugin Fundamentals

#### Day 1-2: Introduction & Setup
- [Introduction to Plugin Development](https://developer.wordpress.org/plugins/intro/)
- [What is a Plugin?](https://developer.wordpress.org/plugins/intro/what-is-a-plugin/)
- Set up local development environment (Local, XAMPP, or Docker)
- **Practice:** Create your first "Hello World" plugin

#### Day 3-4: Plugin Basics
- [Header Requirements](https://developer.wordpress.org/plugins/plugin-basics/header-requirements/)
- [Best Practices](https://developer.wordpress.org/plugins/plugin-basics/best-practices/)
- [Determining Plugin and Content Directories](https://developer.wordpress.org/plugins/plugin-basics/determining-plugin-and-content-directories/)
- **Practice:** Create a plugin with proper structure and header

#### Day 5: Activation & Deactivation
- [Activation / Deactivation Hooks](https://developer.wordpress.org/plugins/plugin-basics/activation-deactivation-hooks/)
- [Uninstall Methods](https://developer.wordpress.org/plugins/plugin-basics/uninstall-methods/)
- **Practice:** Add activation hook that creates options, deactivation that cleans up

#### Day 6-7: Weekend Project
- Create a "Site Maintenance Mode" plugin
- Include activation, deactivation, and uninstall functionality
- Add basic admin settings page

---

## Week 2: Hooks & Security

#### Day 1-2: Understanding Hooks
- [Hooks Overview](https://developer.wordpress.org/plugins/hooks/)
- [Actions](https://developer.wordpress.org/plugins/hooks/actions/)
- [Filters](https://developer.wordpress.org/plugins/hooks/filters/)
- **Practice:** Create plugins using 5 different action hooks and 5 filter hooks

#### Day 3: Custom Hooks
- [Custom Hooks](https://developer.wordpress.org/plugins/hooks/custom-hooks/)
- [Advanced Hook Topics](https://developer.wordpress.org/plugins/hooks/advanced-topics/)
- **Practice:** Create a plugin with custom action and filter hooks

#### Day 4-5: Plugin Security
- [Checking User Capabilities](https://developer.wordpress.org/plugins/security/checking-user-capabilities/)
- [Data Validation](https://developer.wordpress.org/plugins/security/data-validation/)
- [Nonces](https://developer.wordpress.org/plugins/security/nonces/)
- [Securing Output (Escaping)](https://developer.wordpress.org/plugins/security/securing-output/)
- [Securing Input (Sanitizing)](https://developer.wordpress.org/plugins/security/securing-input/)
- **Practice:** Refactor previous plugins to add security measures

#### Day 6-7: Weekend Project
- Create a "Custom Login Message" plugin with settings page
- Implement all security best practices (nonces, sanitization, escaping, capabilities)
- Add proper validation and error handling

---

## Week 3: Administration & Content

#### Day 1-2: Administration Menus
- [Administration Menus](https://developer.wordpress.org/plugins/administration-menus/)
- [Top-Level Menus](https://developer.wordpress.org/plugins/administration-menus/top-level-menus/)
- [Sub-Menus](https://developer.wordpress.org/plugins/administration-menus/sub-menus/)
- **Practice:** Create plugin with custom admin menu and multiple sub-pages

#### Day 3: Shortcodes
- [Shortcodes Overview](https://developer.wordpress.org/plugins/shortcodes/)
- [Basic Shortcodes](https://developer.wordpress.org/plugins/shortcodes/basic-shortcodes/)
- [Enclosing Shortcodes](https://developer.wordpress.org/plugins/shortcodes/enclosing-shortcodes/)
- [Shortcodes with Parameters](https://developer.wordpress.org/plugins/shortcodes/shortcodes-with-parameters/)
- **Practice:** Create 3 different types of shortcodes (simple, with attributes, enclosing)

#### Day 4-5: Settings & Options
- [Settings Overview](https://developer.wordpress.org/plugins/settings/)
- [Options API](https://developer.wordpress.org/plugins/settings/options-api/)
- [Settings API](https://developer.wordpress.org/plugins/settings/settings-api/)
- [Using Settings API](https://developer.wordpress.org/plugins/settings/using-settings-api/)
- **Practice:** Create a plugin with comprehensive settings using Settings API

#### Day 6-7: Weekend Project
- Create a "Team Members" plugin with:
  - Admin menu with settings page
  - Multiple shortcodes for display
  - Settings API for configuration
  - Display options (grid, list, slider)

---

## Week 4: Custom Content Types

#### Day 1-2: Metadata
- [Metadata Overview](https://developer.wordpress.org/plugins/metadata/)
- [Managing Post Metadata](https://developer.wordpress.org/plugins/metadata/managing-post-metadata/)
- [Custom Meta Boxes](https://developer.wordpress.org/plugins/metadata/custom-meta-boxes/)
- [Rendering Post Metadata](https://developer.wordpress.org/plugins/metadata/rendering-post-metadata/)
- **Practice:** Add custom meta boxes to posts with various field types

#### Day 3-4: Custom Post Types
- [Custom Post Types](https://developer.wordpress.org/plugins/post-types/)
- [Registering Custom Post Types](https://developer.wordpress.org/plugins/post-types/registering-custom-post-types/)
- [Working with Custom Post Types](https://developer.wordpress.org/plugins/post-types/working-with-custom-post-types/)
- **Practice:** Create "Portfolio" and "FAQ" custom post types with meta boxes

#### Day 5: Taxonomies
- [Taxonomies Overview](https://developer.wordpress.org/plugins/taxonomies/)
- [Working with Custom Taxonomies](https://developer.wordpress.org/plugins/taxonomies/working-with-custom-taxonomies/)
- **Practice:** Add custom taxonomies to your custom post types

#### Day 6-7: Weekend Project
- Create a complete "Book Library" plugin:
  - Custom post type "Books"
  - Custom taxonomies: "Genre", "Author"
  - Meta boxes: ISBN, Publisher, Year, Rating
  - Admin columns showing custom data
  - Shortcode to display book collection

---

## Week 5: Advanced Functionality

#### Day 1-2: Users & Roles
- [Users Overview](https://developer.wordpress.org/plugins/users/)
- [Roles and Capabilities](https://developer.wordpress.org/plugins/users/roles-and-capabilities/)
- [Working with Users](https://developer.wordpress.org/plugins/users/working-with-users/)
- [Working with User Metadata](https://developer.wordpress.org/plugins/users/working-with-user-metadata/)
- **Practice:** Create plugin that adds custom user roles and capabilities

#### Day 3: HTTP API
- [HTTP API](https://developer.wordpress.org/plugins/http-api/)
- **Practice:** Create plugin that fetches data from external API

#### Day 4-5: JavaScript & AJAX
- [JavaScript Overview](https://developer.wordpress.org/plugins/javascript/)
- [jQuery](https://developer.wordpress.org/plugins/javascript/jquery/)
- [AJAX](https://developer.wordpress.org/plugins/javascript/ajax/)
- [Server Side PHP and Enqueuing](https://developer.wordpress.org/plugins/javascript/enqueuing/)
- **Practice:** Create plugin with AJAX functionality (live search, form submission)

#### Day 6-7: Weekend Project
- Create a "Weather Widget" plugin:
  - Fetch weather data from API
  - AJAX-powered location search
  - Custom widget
  - Admin settings with Settings API
  - Shortcode for display

---

## Week 6: REST API, Cron & Distribution

#### Day 1-3: REST API
- [REST API Overview](https://developer.wordpress.org/plugins/rest-api/)
- [Routes & Endpoints](https://developer.wordpress.org/plugins/rest-api/routes-and-endpoints/)
- [Requests](https://developer.wordpress.org/plugins/rest-api/requests/)
- [Responses](https://developer.wordpress.org/plugins/rest-api/responses/)
- [Schema](https://developer.wordpress.org/plugins/rest-api/schema/)
- [Controller Classes](https://developer.wordpress.org/plugins/rest-api/controller-classes/)
- **Practice:** Add REST API endpoints to your custom post type plugin

#### Day 4: WP-Cron
- [Cron Overview](https://developer.wordpress.org/plugins/cron/)
- [Scheduling WP Cron Events](https://developer.wordpress.org/plugins/cron/scheduling-wp-cron-events/)
- [Understanding WP-Cron Scheduling](https://developer.wordpress.org/plugins/cron/understanding-wp-cron-scheduling/)
- **Practice:** Create plugin with scheduled daily task

#### Day 5: Internationalization
- [Internationalization](https://developer.wordpress.org/plugins/internationalization/)
- [How to Internationalize Your Plugin](https://developer.wordpress.org/plugins/internationalization/how-to-internationalize-your-plugin/)
- [Localization](https://developer.wordpress.org/plugins/internationalization/localization/)
- **Practice:** Make all your previous plugins translation-ready

#### Day 6: Privacy & Database
- [Privacy Overview](https://developer.wordpress.org/plugins/privacy/)
- [Creating Tables with Plugins](https://developer.wordpress.org/plugins/creating-tables-with-plugins/)
- **Practice:** Add privacy exporters/erasers to user data plugins

#### Day 7: Publishing & Maintenance
- [The WordPress.org Plugin Directory](https://developer.wordpress.org/plugins/wordpress-org/)
- [Detailed Plugin Guidelines](https://developer.wordpress.org/plugins/wordpress-org/detailed-plugin-guidelines/)
- [Plugin Readmes](https://developer.wordpress.org/plugins/wordpress-org/plugin-readme/)
- [How Your Plugin Assets Work](https://developer.wordpress.org/plugins/wordpress-org/plugin-assets/)
- **Practice:** Prepare one of your plugins for WordPress.org submission

---

## Final Project (Week 7 - Optional)

Create a complete, production-ready plugin that combines everything learned:

**Project Ideas:**
1. **Event Management System**
   - Custom post type for events
   - Custom fields for date, time, location, capacity
   - Frontend event registration with AJAX
   - Admin dashboard for managing registrations
   - Email notifications using WP-Cron
   - REST API endpoints
   - Export functionality

2. **Review & Rating System**
   - Add reviews to any post type
   - Star rating system
   - AJAX submission
   - Moderation capabilities
   - Email notifications
   - REST API for retrieving reviews
   - Review widgets and shortcodes

3. **Custom Form Builder**
   - Admin interface to create forms
   - Multiple field types
   - Form submissions storage
   - Email notifications
   - Export submissions to CSV
   - AJAX form submission
   - Shortcode for displaying forms

---

## Additional Resources

### Official Documentation
- [WordPress Plugin Developer Handbook](https://developer.wordpress.org/plugins/)
- [WordPress Code Reference](https://developer.wordpress.org/reference/)
- [WordPress Coding Standards](https://developer.wordpress.org/coding-standards/wordpress-coding-standards/)

### Developer Tools
- [Debug Bar](https://wordpress.org/plugins/debug-bar/)
- [Query Monitor](https://wordpress.org/plugins/query-monitor/)
- [WP-CLI](https://wp-cli.org/)

### Testing & Best Practices
- [Plugin Unit Tests](https://make.wordpress.org/core/handbook/testing/automated-testing/phpunit/)
- [Plugin Security Guidelines](https://developer.wordpress.org/plugins/security/)

---

## Learning Path

Follow the structured study plan above and refer to the official [WordPress Plugin Developer Handbook](https://developer.wordpress.org/plugins/) for detailed documentation, code examples, and best practices for each topic.

