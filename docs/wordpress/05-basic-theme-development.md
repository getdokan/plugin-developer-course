# Basic Theme Development

Learn to create modern WordPress block themes using Full Site Editing (FSE), understanding theme.json, block templates, patterns, and the future of WordPress theme development.

---

## WordPress Block Theme Development Study Plan

This comprehensive **6-week study plan** focuses on **Block Themes** (Full Site Editing), the modern standard for WordPress theme development. Based on the official [WordPress Theme Developer Handbook](https://developer.wordpress.org/themes/).

> **Note:** This plan focuses on modern Block Themes. For legacy Classic Theme development, see the [Appendix](#appendix-classic-themes-legacy) at the end.

---

## Table of Contents

- [Week 1: Block Theme Fundamentals](#week-1-block-theme-fundamentals)
- [Week 2: Block Templates & Template Parts](#week-2-block-templates--template-parts)
- [Week 3: Block Patterns & Style Variations](#week-3-block-patterns--style-variations)
- [Week 4: Advanced theme.json & Customization](#week-4-advanced-themejson--customization)
- [Week 5: Query Loop, Navigation & Dynamic Content](#week-5-query-loop-navigation--dynamic-content)
- [Week 6: Performance, Accessibility & Distribution](#week-6-performance-accessibility--distribution)
- [Week 7: Final Project (Optional)](#final-project-week-7---optional)
- [Additional Resources](#additional-resources)

---

## Week 1: Block Theme Fundamentals

> **Goal:** Understand what block themes are and create your first minimal block theme

### Day 1-2: Introduction to Block Themes & FSE

**📖 Reading:**

- [What are Block Themes?](https://developer.wordpress.org/themes/block-themes/)
- [Block Theme Overview](https://developer.wordpress.org/themes/block-themes/block-theme-overview/)
- [Getting Started with FSE](https://developer.wordpress.org/themes/getting-started/)
- [Block Theme Requirements](https://developer.wordpress.org/themes/block-themes/block-theme-setup/)

**💻 Setup:**

- Set up local development environment with WordPress 6.0+
- Install WordPress with block theme support

**✏️ Practice:**

- Explore existing block themes (Twenty Twenty-Four, Twenty Twenty-Three)
- Navigate the Site Editor interface
- Understand the difference between block themes and classic themes

---

### Day 3-4: theme.json - The Core Configuration

**📖 Reading:**

- [theme.json Overview](https://developer.wordpress.org/themes/advanced-topics/theme-json/)
- [Global Settings](https://developer.wordpress.org/themes/advanced-topics/theme-json/#settings)
- [Global Styles](https://developer.wordpress.org/themes/advanced-topics/theme-json/#styles)
- [Color Palettes](https://developer.wordpress.org/block-editor/how-to-guides/themes/theme-json/#color-palettes)
- [Typography Settings](https://developer.wordpress.org/block-editor/how-to-guides/themes/theme-json/#typography)
- [Spacing & Layout](https://developer.wordpress.org/block-editor/how-to-guides/themes/theme-json/#spacing)

**✏️ Practice:**

- Create a basic theme.json with custom colors
- Add custom font sizes and font families
- Configure spacing and layout settings
- Test your settings in the Site Editor

---

### Day 5: Minimum Block Theme Structure

**📖 Reading:**

- [Block Theme Setup](https://developer.wordpress.org/themes/block-themes/block-theme-setup/)

**📁 Required Files:**
```
my-theme/
├── style.css          (theme header)
├── theme.json         (configuration)
├── templates/
│   └── index.html     (required template)
└── parts/             (template parts directory)
```

**✏️ Practice:**

- Create your first minimal block theme from scratch
- Add proper style.css header information
- Create a basic theme.json
- Build a simple index.html template

---

### Day 6-7: Weekend Project

**Project:** Create a "Minimal Blog" block theme

**Requirements:**

- ✅ Proper style.css header with theme information
- ✅ Complete theme.json with:
  - Custom color palette (5+ colors)
  - Typography settings (2+ font sizes)
  - Spacing scale
- ✅ Basic index.html template
- ✅ Header template part (parts/header.html)
- ✅ Footer template part (parts/footer.html)
- ✅ Screenshot (1200x900px)
- ✅ Basic documentation

**Deliverable:** A working block theme that can be activated and displays a simple blog layout.

---

## Week 2: Block Templates & Template Parts

> **Goal:** Master the template system and create a complete template hierarchy

### Day 1-2: Introduction to Templates

**📖 Reading:**

- [Introduction to Templates](https://developer.wordpress.org/themes/templates/introduction-to-templates/)
- [Templates Overview](https://developer.wordpress.org/themes/templates/)
- [Templates Documentation](https://developer.wordpress.org/themes/templates/templates/)

**📝 Topics:**

- Understanding the template system
- How templates work in block themes
- Template file structure and naming conventions

**📁 Core Templates:**

- `index.html` (required - fallback for all views)
- `home.html` (blog homepage)
- `single.html` (single post)
- `page.html` (static pages)
- `archive.html` (archives)
- `search.html` (search results)
- `404.html` (not found page)

**✏️ Practice:**

- Create all core templates using HTML and block markup
- Test each template by viewing different page types
- Understand when each template is used

---

### Day 3: Template Hierarchy

**📖 Reading:**

- [Template Hierarchy](https://developer.wordpress.org/themes/templates/template-hierarchy/)

**📝 Topics:**

- How WordPress chooses which template to use
- Template hierarchy for block themes vs classic themes
- Fallback templates
- Template specificity

**🎯 Specific Templates:**

- Custom post types: `single-{post-type}.html`
- Taxonomies: `taxonomy-{taxonomy}.html`, `category-{slug}.html`
- Authors: `author-{nicename}.html`
- Dates: `date.html`
- Custom templates: templates with `Template Name` in comments

**✏️ Practice:**

- Create a complete template hierarchy for a blog
- Test template hierarchy by creating different content types
- Create custom templates for specific categories

---

### Day 4-5: Template Parts

**📖 Reading:**

- [Template Parts](https://developer.wordpress.org/themes/templates/template-parts/)
- [Creating Template Parts](https://developer.wordpress.org/themes/global-settings-and-styles/template-parts/)
- [Template Part Block](https://developer.wordpress.org/block-editor/reference-guides/core-blocks/#template-part)

**📁 Common Template Parts:**

- `parts/header.html` - Site header with logo and navigation
- `parts/footer.html` - Site footer with copyright and links
- `parts/sidebar.html` - Sidebar content
- `parts/post-meta.html` - Post metadata (author, date, categories)
- `parts/comments.html` - Comments section

**📝 Topics:**

- Creating reusable template parts
- Using template parts in templates
- Creating dynamic template parts
- Template part areas (header, footer, general)

**✏️ Practice:**

- Create reusable template parts
- Use template parts across multiple templates
- Create variations of header/footer for different pages

---

### Day 6-7: Block Markup & Weekend Project

**📖 Day 6 Morning Reading:**

- [Block Markup](https://developer.wordpress.org/themes/templates/templates/#block-markup)
- [Core Blocks Reference](https://developer.wordpress.org/block-editor/reference-guides/core-blocks/)

**🧱 Essential Structural Blocks:**

- **Site Blocks:** Site Title, Site Logo, Site Tagline
- **Navigation:** Navigation Block
- **Query Blocks:** Query Loop, Post Template
- **Post Blocks:** Post Title, Post Content, Post Featured Image, Post Date, Post Author
- **Layout Blocks:** Group, Row, Stack, Columns
- **Design Blocks:** Cover, Spacer, Separator

**✏️ Practice:**

- Build complex layouts using only core blocks
- Understand block attributes and customization
- Practice nesting blocks for complex structures

---

**Day 6-7: Weekend Project**

**Project:** Create a "Portfolio Block Theme"

**Requirements:**

- ✅ Complete template hierarchy:
  - index.html
  - home.html
  - single.html
  - page.html
  - archive.html
  - search.html
  - 404.html
- ✅ Reusable template parts:
  - Header with navigation
  - Footer with social links
  - Post meta
- ✅ Archive template with Query Loop for posts
- ✅ Single post template with post meta template part
- ✅ Custom page template for portfolio showcase
- ✅ All templates using proper block markup
- ✅ Proper theme.json configuration

**Deliverable:** A complete portfolio theme with full template hierarchy.

---

## Week 3: Block Patterns & Style Variations

> **Goal:** Create reusable block patterns and multiple style variations

### Day 1-2: Block Patterns

**📖 Reading:**

- [Block Patterns Overview](https://developer.wordpress.org/themes/features/block-patterns/)
- [Creating Block Patterns](https://developer.wordpress.org/block-editor/reference-guides/block-api/block-patterns/)
- [Registering Patterns](https://developer.wordpress.org/themes/features/block-patterns/#registering-patterns)
- [Pattern Directory](https://wordpress.org/patterns/)

**📝 Topics:**

- What are block patterns
- Pattern categories and organization
- Creating patterns in PHP
- Pattern best practices

**🎨 Common Pattern Types:**

- Hero sections
- Feature sections
- Testimonials
- Call-to-action (CTA)
- Footer layouts
- Contact sections
- Pricing tables
- Team member grids

**✏️ Practice:**

- Create 5+ block patterns covering different use cases
- Register custom pattern categories
- Test patterns in the Site Editor
- Create pattern variations

---

### Day 3-4: Style Variations

**📖 Reading:**

- [Style Variations](https://developer.wordpress.org/themes/advanced-topics/theme-json/#style-variations)
- [Creating Style Variations](https://developer.wordpress.org/block-editor/reference-guides/theme-json-reference/theme-json-living/#styles)

**📁 Style Variations Directory:**
```
my-theme/
├── theme.json
└── styles/
    ├── light.json
    ├── dark.json
    └── high-contrast.json
```

**📝 Topics:**

- Creating style variations
- Color scheme variations
- Typography variations
- Spacing variations
- Testing style variations

**✏️ Practice:**

- Create 3 style variations:
  - Light theme (default)
  - Dark theme
  - High-contrast theme
- Test switching between variations in Site Editor

---

### Day 5: Custom Block Styles

**📖 Reading:**

- [Block Styles](https://developer.wordpress.org/block-editor/reference-guides/block-api/block-styles/)
- [Registering Block Styles](https://developer.wordpress.org/reference/functions/register_block_style/)

**📝 Topics:**

- Creating custom block styles
- Registering block styles via functions.php
- Adding custom CSS for block variations
- Block style best practices

**✏️ Practice:**

- Create custom styles for core blocks
- Register block styles programmatically
- Add custom CSS for block style variations

---

### Day 6-7: Weekend Project

**Project:** Create a "Business Block Theme"

**Requirements:**

- ✅ **10+ Block Patterns:**
  - Header variations (3)
  - Hero sections (2)
  - Services section
  - About section
  - Team member grid
  - Pricing table
  - Testimonials
  - Call-to-action
  - Contact form layout
  - Footer variations (2)
- ✅ **3 Style Variations:**
  - Light (default)
  - Dark
  - Professional (high-contrast)
- ✅ **Custom Block Styles:**
  - Button variations
  - Heading styles
  - Group/Cover styles
- ✅ Pattern categories organized logically
- ✅ Complete pattern library documentation

**Deliverable:** A business theme with extensive pattern library and style options.

---

## Week 4: Advanced theme.json & Customization

> **Goal:** Master advanced theme.json features and per-block customization

### Day 1-2: Advanced theme.json Features

**📖 Reading:**

- [theme.json Schema](https://developer.wordpress.org/block-editor/reference-guides/theme-json-reference/theme-json-living/)
- [Custom CSS Properties](https://developer.wordpress.org/themes/advanced-topics/theme-json/#custom-css-properties)
- [appearanceTools](https://developer.wordpress.org/block-editor/reference-guides/theme-json-reference/theme-json-living/#appearancetools)
- [useRootPaddingAwareAlignments](https://developer.wordpress.org/block-editor/reference-guides/theme-json-reference/theme-json-living/#userootpaddingawarealignments)
- [Fluid Typography](https://developer.wordpress.org/block-editor/how-to-guides/themes/theme-json/#fluid-typography)
- [Responsive Spacing](https://make.wordpress.org/core/2023/03/30/fluid-font-sizes-in-wordpress-6-2/)

**📝 Advanced Topics:**

- Fluid typography system
- Responsive spacing scales
- Custom CSS properties in theme.json
- Root padding aware alignments
- Appearance tools

**✏️ Practice:**

- Implement fluid typography with min/max values
- Create responsive spacing scales
- Use custom CSS properties
- Enable appearance tools globally

---

### Day 3-4: Custom Block Settings Per Block

**📖 Reading:**

- [Block-specific Settings](https://developer.wordpress.org/block-editor/reference-guides/theme-json-reference/theme-json-living/#blocks)

**📝 Topics:**

- Customizing individual blocks via theme.json
- Enabling/disabling features per block
- Block-specific color palettes
- Block-specific typography
- Block-specific spacing

**🔧 Per-Block Customization:**
```json
{
  "settings": {
    "blocks": {
      "core/heading": {
        "color": { "palette": [...] },
        "typography": { "fontSizes": [...] }
      }
    }
  }
}
```

**✏️ Practice:**

- Configure different settings for different blocks
- Disable specific features for certain blocks
- Create block-specific color palettes

---

### Day 5: Functions.php in Block Themes

**📖 Reading:**

- [functions.php for Block Themes](https://developer.wordpress.org/themes/basics/theme-functions/)

**📝 Topics:**

- Theme support declarations
- Enqueuing editor styles
- Custom fonts registration
- Block pattern categories
- Block styles registration
- Asset enqueuing

**⚙️ Common Functions:**
```php
// Theme setup
add_action('after_setup_theme', 'theme_setup');

// Enqueue scripts and styles
add_action('wp_enqueue_scripts', 'theme_scripts');

// Register block patterns
register_block_pattern_category();

// Register block styles
register_block_style();
```

**✏️ Practice:**

- Add essential functions.php configurations
- Register custom pattern categories
- Enqueue custom fonts
- Add editor styles

---

### Day 6-7: Weekend Project

**Project:** Create a "Magazine Block Theme"

**Requirements:**

- ✅ **Advanced theme.json:**
  - Fluid typography system
  - Responsive spacing scales
  - Custom CSS properties
  - Appearance tools enabled
  - useRootPaddingAwareAlignments
- ✅ **Block-specific customizations:**
  - Heading-specific typography
  - Button-specific colors
  - Cover block settings
- ✅ **Custom fonts:**
  - Google Fonts integration
  - Web font loading optimization
- ✅ **Editor styles:**
  - Editor stylesheet that matches frontend
- ✅ **Custom pattern categories:**
  - Editorial patterns
  - Featured content
  - Ad spaces
- ✅ Optimized for readability and performance

**Deliverable:** A magazine theme with advanced theme.json configuration.

---

## Week 5: Query Loop, Navigation & Dynamic Content

> **Goal:** Master dynamic content display and navigation systems

### Day 1-2: Query Loop Block Mastery

**📖 Reading:**

- [Query Loop Block](https://developer.wordpress.org/block-editor/reference-guides/core-blocks/#query)
- [Post Template Block](https://developer.wordpress.org/block-editor/reference-guides/core-blocks/#post-template)

**📝 Topics:**

- Understanding the Query Loop block
- Custom query parameters
- Pagination patterns
- Multiple query loops on one page
- Filtering by taxonomy
- Filtering by custom fields

**🔍 Query Parameters:**

- Post type
- Number of posts
- Order by
- Taxonomy queries
- Author queries
- Date queries
- Sticky posts

**✏️ Practice:**

- Create complex archive layouts with Query Loop
- Build featured posts section
- Create category-specific query loops
- Implement pagination
- Display related posts

---

### Day 3: Navigation Block & Menus

**📖 Reading:**

- [Navigation Block](https://developer.wordpress.org/block-editor/reference-guides/core-blocks/#navigation)
- [Creating Menus in FSE](https://developer.wordpress.org/themes/block-themes/navigation-block/)

**📝 Topics:**

- Navigation block features
- Creating responsive navigation
- Building mega menus with patterns
- Footer menus
- Social navigation
- Mobile menu patterns

**🧭 Navigation Types:**

- Primary navigation
- Footer navigation
- Social links
- Breadcrumbs
- Pagination

**✏️ Practice:**

- Build responsive header with navigation
- Create mobile menu pattern
- Build mega menu with patterns
- Create footer menu with social links

---

### Day 4-5: Dynamic Blocks & Custom Post Types

**📖 Reading:**

- [Custom Post Type Support](https://developer.wordpress.org/themes/basics/post-types/)

**📝 Topics:**

- Creating templates for custom post types
- Custom archive pages
- Custom taxonomies in block themes
- Query Loop with custom post types
- Single custom post type templates

**⚙️ Implementation:**

```php
// Register custom post type
register_post_type('portfolio');

// Register custom taxonomy
register_taxonomy('project-type', 'portfolio');
```

**📁 Template Files:**

- `single-portfolio.html`
- `archive-portfolio.html`
- `taxonomy-project-type.html`

**✏️ Practice:**

- Create templates and patterns for portfolio custom post type
- Build custom archive with Query Loop
- Create custom taxonomy templates
- Add custom fields display

---

### Day 6-7: Weekend Project

**Project:** Create an "E-Commerce Block Theme"

**Requirements:**

- ✅ **WooCommerce Support:**
  - theme.json with WooCommerce settings
  - functions.php with WooCommerce declarations
- ✅ **Product Templates:**
  - Product archive with Query Loop
  - Single product template
  - Product categories template
- ✅ **Shopping Patterns:**
  - Shopping cart page pattern
  - Checkout page patterns
  - Account page patterns
- ✅ **Multiple Navigation:**
  - Primary navigation with cart icon
  - Footer navigation
  - Mobile menu
  - Product categories menu
- ✅ **Responsive mega menu** with product categories
- ✅ Full Query Loop implementation for products

**Deliverable:** A complete e-commerce theme with WooCommerce integration.

---

## Week 6: Performance, Accessibility & Distribution

> **Goal:** Optimize theme for performance, accessibility, and prepare for distribution

### Day 1-2: Performance Optimization

**📖 Reading:**

- [Performance Best Practices](https://developer.wordpress.org/themes/advanced-topics/performance-best-practices/)

**📝 Topics:**

- Optimizing theme.json
- Reducing CSS output
- Font loading strategies
- Image optimization
- Core Web Vitals optimization
- Lazy loading
- Caching strategies

**⚡ Performance Checklist:**

- ✅ Optimize CSS delivery
- ✅ Minimize JavaScript
- ✅ Optimize web fonts
- ✅ Implement lazy loading
- ✅ Optimize images
- ✅ Reduce HTTP requests
- ✅ Test Core Web Vitals

**✏️ Practice:**

- Audit theme performance with Lighthouse
- Optimize font loading
- Reduce CSS output
- Test on slow connections

---

### Day 3: Accessibility in Block Themes

**📖 Reading:**

- [Accessibility](https://developer.wordpress.org/themes/functionality/accessibility/)
- [ARIA Labels](https://make.wordpress.org/accessibility/handbook/)

**📝 Topics:**

- WCAG 2.1 AA compliance
- Keyboard navigation
- Screen reader compatibility
- Color contrast requirements
- Skip links and landmarks
- Focus management
- ARIA labels

**♿ Accessibility Checklist:**

- ✅ Proper heading hierarchy
- ✅ Keyboard navigation
- ✅ Color contrast (4.5:1 minimum)
- ✅ Alt text for images
- ✅ ARIA labels where needed
- ✅ Skip to content link
- ✅ Focus indicators
- ✅ Screen reader testing

**✏️ Practice:**

- Make theme fully accessibility-ready
- Test with screen readers
- Test keyboard navigation
- Check color contrast
- Validate HTML

---

### Day 4: Internationalization & Localization

**📖 Reading:**

- [Internationalization](https://developer.wordpress.org/themes/functionality/internationalization/)

**📝 Topics:**

- Translating theme.json strings
- RTL (Right-to-Left) support
- Translation-ready patterns
- Text domains
- Translation functions

**🌐 i18n Implementation:**
```json
{
  "title": "Dark",
  "$schema": "https://schemas.wp.org/trunk/theme.json",
  "version": 2
}
```

**RTL Support:**
```css
body.rtl {
  direction: rtl;
  text-align: right;
}
```

**✏️ Practice:**

- Make theme fully translation-ready
- Implement RTL support
- Test with different languages
- Create .pot file

---

### Day 5: Theme Testing & Debugging

**📖 Reading:**

- [Theme Unit Test](https://codex.wordpress.org/Theme_Unit_Test)
- [Theme Check Plugin](https://wordpress.org/plugins/theme-check/)

**📝 Topics:**

- Theme unit testing
- Testing across different content types
- Browser testing
- Responsive testing
- Debugging techniques

**🧪 Testing Checklist:**

- ✅ Theme Check plugin passes
- ✅ Theme Unit Test data displays correctly
- ✅ All templates work properly
- ✅ Responsive on all devices
- ✅ Cross-browser testing
- ✅ Performance testing
- ✅ Accessibility testing
- ✅ i18n/RTL testing

**✏️ Practice:**

- Complete full theme testing checklist
- Fix any issues found
- Document known limitations

---

### Day 6-7: Distribution & WordPress.org Submission

**📖 Reading:**

- [Theme Review Requirements](https://make.wordpress.org/themes/handbook/review/required/)
- [Preparing Theme for Submission](https://developer.wordpress.org/themes/release/)

**📝 Topics:**

- Theme review guidelines
- Creating theme screenshots
- Writing theme documentation (readme.txt)
- Theme licensing (GPL)
- Versioning strategy
- Changelog maintenance

**📦 Submission Requirements:**

- ✅ Valid theme.json
- ✅ Proper style.css header
- ✅ Screenshot (1200x900px)
- ✅ readme.txt file
- ✅ GPL-compatible license
- ✅ No errors or warnings
- ✅ Accessibility ready
- ✅ Passes Theme Check
- ✅ Translation ready
- ✅ Documentation included

**📄 readme.txt Template:**
```
=== Theme Name ===
Contributors: username
Requires at least: 6.0
Tested up to: 6.4
Requires PHP: 7.4
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html

== Description ==
[Theme description]

== Installation ==
[Installation instructions]

== Changelog ==
= 1.0.0 =
* Initial release
```

**✏️ Practice:**

- Prepare complete submission package
- Write comprehensive readme.txt
- Create screenshots
- Create demo content
- Document theme features

---

## Final Project (Week 7 - Optional)

> **Goal:** Create a complete, production-ready block theme

Create a complete, production-ready block theme that combines everything learned:

### Project Option 1: Multi-Purpose Block Theme

**Requirements:**

- ✅ **20+ Block Patterns** covering all use cases:
  - Headers (3 variations)
  - Heroes (3 variations)
  - Services/Features (3 variations)
  - About sections (2 variations)
  - Team members (2 variations)
  - Testimonials (2 variations)
  - Pricing tables (2 variations)
  - Call-to-action (2 variations)
  - Contact forms (2 variations)
  - Footers (3 variations)
- ✅ **5+ Style Variations:**
  - Default
  - Dark
  - Professional
  - Creative
  - Minimalist
- ✅ **Complete Page Templates:**
  - Homepage
  - About page
  - Services page
  - Portfolio page
  - Contact page
  - Blog page
- ✅ **WooCommerce Compatibility**
- ✅ **Accessibility Ready** (WCAG 2.1 AA)
- ✅ **RTL Support**
- ✅ **Optimized for Core Web Vitals**
- ✅ **Full Documentation**

---

### Project Option 2: Creative Agency Block Theme

**Requirements:**

- ✅ **Portfolio System:**
  - Custom post type for portfolio
  - Portfolio templates
  - Portfolio archive with filtering
  - Single project template
  - Case study layout
- ✅ **Team & Services:**
  - Team member patterns
  - Service showcase patterns
  - Client logo patterns
  - Testimonial patterns
- ✅ **Dynamic Features:**
  - Project filtering by category
  - Related projects
  - Newsletter integration patterns
  - Contact form patterns
- ✅ **Visual Polish:**
  - Smooth CSS animations
  - Hover effects
  - Parallax sections
  - Video backgrounds
- ✅ **Performance Optimized**
- ✅ **Fully Accessible**

---

### Project Option 3: Blog & Content Creator Theme

**Requirements:**

- ✅ **Multiple Blog Layouts:**
  - Standard blog layout
  - Grid layout
  - Featured posts section
  - Magazine-style homepage
- ✅ **Content Features:**
  - Author bio patterns
  - Related posts patterns
  - Table of contents block
  - Reading time indicator
  - Post series support
- ✅ **Engagement:**
  - Social sharing patterns
  - Newsletter subscription patterns
  - Comment patterns
  - Breadcrumb navigation
- ✅ **Monetization:**
  - Ad space patterns
  - Affiliate disclosure patterns
  - Sponsored post layouts
- ✅ **SEO Optimized**
- ✅ **Performance Optimized**
- ✅ **Accessibility Ready**

---

## Additional Resources

### Official Documentation

- **[WordPress Theme Developer Handbook](https://developer.wordpress.org/themes/)** - Complete theme development guide
- **[Block Editor Handbook](https://developer.wordpress.org/block-editor/)** - Block editor documentation
- **[theme.json Reference](https://developer.wordpress.org/block-editor/reference-guides/theme-json-reference/theme-json-living/)** - Complete theme.json schema
- **[Block Theme Documentation](https://developer.wordpress.org/themes/block-themes/)** - Block theme specific docs

### Block Theme Tools

- **[Create Block Theme Plugin](https://wordpress.org/plugins/create-block-theme/)** - Essential tool for FSE development
- **[Theme Check Plugin](https://wordpress.org/plugins/theme-check/)** - Validate theme code
- **[Query Monitor](https://wordpress.org/plugins/query-monitor/)** - Debug queries and performance

### Block Theme Examples

- **[Twenty Twenty-Four](https://wordpress.org/themes/twentytwentyfour/)** - Latest default theme
- **[Twenty Twenty-Three](https://wordpress.org/themes/twentytwentythree/)** - Previous default theme
- **[Block Theme Directory](https://wordpress.org/themes/tags/full-site-editing/)** - Browse all block themes

### Learning Resources

- **[Full Site Editing Course](https://learn.wordpress.org/course/full-site-editing/)** - Official FSE course
- **[Block Pattern Directory](https://wordpress.org/patterns/)** - Inspiration and examples
- **[WordPress TV - FSE Tutorials](https://wordpress.tv/?s=full+site+editing)** - Video tutorials

### Design & Inspiration

- **[WordPress Pattern Directory](https://wordpress.org/patterns/)** - Pre-made patterns
- **[Block Theme Showcase](https://fullsiteediting.com/)** - Theme gallery
- **[Openverse](https://openverse.org/)** - Free CC-licensed images

### Testing & Validation

- **[Theme Unit Test Data](https://codex.wordpress.org/Theme_Unit_Test)** - Test data import
- **[Accessibility Checker](https://wordpress.org/plugins/accessibility-checker/)** - A11y validation
- **[Wave Accessibility Tool](https://wave.webaim.org/)** - Online accessibility checker
- **[Google Lighthouse](https://developers.google.com/web/tools/lighthouse)** - Performance testing

---

## Appendix: Classic Themes (Legacy)

> **⚠️ Note:** Classic themes are legacy. Learn these only if you need to maintain existing classic themes.

### Classic Theme Basics

**📖 Essential Reading:**

- [Classic Theme Structure](https://developer.wordpress.org/themes/basics/organizing-theme-files/)
- [Template Files (PHP)](https://developer.wordpress.org/themes/basics/template-files/)
- [Template Hierarchy](https://developer.wordpress.org/themes/basics/template-hierarchy/)
- [The Loop](https://developer.wordpress.org/themes/basics/the-loop/)
- [Template Tags](https://developer.wordpress.org/themes/basics/template-tags/)

### Classic Theme Features

**📖 Additional Topics:**

- [Theme Customizer API](https://developer.wordpress.org/themes/customize-api/)
- [Widgets](https://developer.wordpress.org/themes/functionality/widgets/)
- [Sidebars](https://developer.wordpress.org/themes/functionality/sidebars/)
- [Navigation Menus](https://developer.wordpress.org/themes/functionality/navigation-menus/)

### Resources

- **[Underscores (_s)](https://underscores.me/)** - Classic theme starter
- **[Classic Theme Documentation](https://developer.wordpress.org/themes/getting-started/what-is-a-theme/)** - Full classic theme guide

---

## Learning Path

Follow the structured study plan above and refer to the official [WordPress Block Theme Documentation](https://developer.wordpress.org/themes/block-themes/) for detailed information, examples, and best practices.

### Key Points

1. **Start with Block Themes** - They represent the future of WordPress
2. **Practice Regularly** - Build projects after each week
3. **Use Official Resources** - WordPress documentation is comprehensive
4. **Join the Community** - Learn WordPress Slack, Make WordPress
5. **Stay Updated** - WordPress evolves rapidly with new features

### Success Metrics

By completing this study plan, you should be able to:

- ✅ Create production-ready block themes from scratch
- ✅ Master theme.json configuration
- ✅ Build complex layouts with blocks
- ✅ Create reusable patterns and style variations
- ✅ Optimize themes for performance and accessibility
- ✅ Submit themes to WordPress.org
- ✅ Understand the modern WordPress ecosystem

---

**🚀 Ready to start?** Begin with [Week 1: Block Theme Fundamentals](#week-1-block-theme-fundamentals)

**Important:** Block themes represent the future of WordPress theme development. Focus on mastering block themes first, then learn classic themes only if you need to maintain legacy projects.
