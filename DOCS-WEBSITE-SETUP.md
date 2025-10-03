# Building a Documentation Website

Transform your markdown files into a beautiful, searchable documentation website.

## 🎯 Recommended Solutions

### Quick Comparison

| Solution | Difficulty | Features | Best For |
|----------|-----------|----------|----------|
| [Docsify](#option-1-docsify-easiest) | ⭐ Easiest | Search, sidebar, themes | Quick setup, no build |
| [MkDocs Material](#option-2-mkdocs-material-recommended) | ⭐⭐ Easy | Search, beautiful UI, versioning | Professional docs |
| [Docusaurus](#option-3-docusaurus-most-features) | ⭐⭐⭐ Medium | Full React, blog, i18n | Feature-rich site |
| [VuePress](#option-4-vuepress) | ⭐⭐ Easy | Vue-based, plugins | Vue developers |

---

## Option 1: Docsify (Easiest) ⭐

**Perfect for:** Quick setup, no build process needed, runs in browser.

### Features
- ✅ No build process
- ✅ Live reload
- ✅ Full-text search
- ✅ Multiple themes
- ✅ Plugins ecosystem
- ✅ Runs on GitHub Pages

### Setup (5 minutes)

#### Step 1: Install Docsify CLI

```bash
npm install -g docsify-cli
```

#### Step 2: Initialize Docsify

```bash
cd /Users/mahbub/Development/workspaces/fresher-onboarding

# Initialize docsify
docsify init ./docs
```

#### Step 3: Copy Your Markdown Files

```bash
# Create docs directory structure
mkdir -p docs/programming-languages
mkdir -p docs/operating-system
mkdir -p docs/web-fundamentals

# Copy files
cp README.md docs/README.md
cp "Programming Languages"/*.md docs/programming-languages/
cp "Operating System Basics"/*.md docs/operating-system/
cp "Web Fundamentals"/*.md docs/web-fundamentals/
cp *.md docs/
```

#### Step 4: Configure Docsify

Create `docs/index.html`:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Developer Onboarding Guide</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="description" content="Comprehensive developer onboarding documentation">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify@4/lib/themes/vue.css">
</head>
<body>
  <div id="app"></div>
  <script>
    window.$docsify = {
      name: 'Developer Onboarding',
      repo: 'your-org/fresher-onboarding',
      loadSidebar: true,
      subMaxLevel: 3,
      search: {
        maxAge: 86400000,
        paths: 'auto',
        placeholder: 'Search documentation...',
        noData: 'No results found',
        depth: 6
      },
      coverpage: true,
      auto2top: true,
      themeColor: '#3F51B5',
      pagination: {
        previousText: 'Previous',
        nextText: 'Next',
      }
    }
  </script>
  <!-- Docsify core -->
  <script src="//cdn.jsdelivr.net/npm/docsify@4"></script>
  <!-- Search plugin -->
  <script src="//cdn.jsdelivr.net/npm/docsify/lib/plugins/search.min.js"></script>
  <!-- Copy to clipboard -->
  <script src="//cdn.jsdelivr.net/npm/docsify-copy-code"></script>
  <!-- Pagination -->
  <script src="//cdn.jsdelivr.net/npm/docsify-pagination/dist/docsify-pagination.min.js"></script>
  <!-- Syntax highlighting -->
  <script src="//cdn.jsdelivr.net/npm/prismjs@1/components/prism-bash.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/prismjs@1/components/prism-php.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/prismjs@1/components/prism-javascript.min.js"></script>
</body>
</html>
```

Create `docs/_sidebar.md`:

```markdown
* [Home](/)
* [Quick Start](QUICK-START.md)
* [Onboarding Guide](ONBOARDING-GUIDE.md)

* **Programming Languages**
  * [Overview](programming-languages/README.md)
  * [Dev Environment](programming-languages/dev-environment.md)
  * [HTML & CSS](programming-languages/HtmlCss.md)
  * [JavaScript](programming-languages/JavaScript.md)
  * [PHP & MySQL](programming-languages/PhpMysql.md)
  * [WordPress](programming-languages/WordPress.md)

* **Operating System**
  * [OS Fundamentals](operating-system/os-fundamentals.md)

* **Web Fundamentals**
  * [Web Basics](web-fundamentals/web-basics.md)

* **Reference**
  * [Debugging](debuging.md)
  * [Progress Checklist](PROGRESS-CHECKLIST.md)
  * [rtCamp Course Links](RTCAMP-COURSE-LINKS.md)
```

Create `docs/_coverpage.md`:

```markdown
![logo](https://via.placeholder.com/150)

# Developer Onboarding

> Comprehensive guide for fresher developers

- Complete 6-week program
- Programming languages to WordPress
- Hands-on projects and quizzes

[Get Started](QUICK-START.md)
[View Guide](ONBOARDING-GUIDE.md)
```

#### Step 5: Run Locally

```bash
# Start the server
docsify serve docs

# Open in browser: http://localhost:3000
```

#### Step 6: Deploy to GitHub Pages

```bash
# Create .nojekyll file (tells GitHub Pages not to use Jekyll)
touch docs/.nojekyll

# Commit and push
git add docs/
git commit -m "Add Docsify documentation site"
git push origin main

# In GitHub repo settings:
# Settings → Pages → Source → main branch → /docs folder
```

**Live at:** `https://your-username.github.io/fresher-onboarding/`

---

## Option 2: MkDocs Material (Recommended) ⭐⭐

**Perfect for:** Professional documentation with beautiful UI and powerful search.

### Features
- ✅ Material Design theme
- ✅ Instant search
- ✅ Dark mode
- ✅ Social cards
- ✅ Versioning
- ✅ Analytics
- ✅ Comments integration

### Setup (10 minutes)

#### Step 1: Install MkDocs

```bash
# Install MkDocs and Material theme
pip install mkdocs-material
```

#### Step 2: Initialize Project

```bash
cd /Users/mahbub/Development/workspaces/fresher-onboarding

# Create mkdocs.yml configuration
mkdocs new .
```

#### Step 3: Configure MkDocs

Create/edit `mkdocs.yml`:

```yaml
site_name: Developer Onboarding Guide
site_description: Comprehensive onboarding for fresher developers
site_author: Your Organization
site_url: https://your-org.github.io/fresher-onboarding

# Repository
repo_name: your-org/fresher-onboarding
repo_url: https://github.com/your-org/fresher-onboarding
edit_uri: edit/main/docs/

# Theme
theme:
  name: material
  palette:
    # Light mode
    - media: "(prefers-color-scheme: light)"
      scheme: default
      primary: indigo
      accent: indigo
      toggle:
        icon: material/brightness-7
        name: Switch to dark mode
    # Dark mode
    - media: "(prefers-color-scheme: dark)"
      scheme: slate
      primary: indigo
      accent: indigo
      toggle:
        icon: material/brightness-4
        name: Switch to light mode
  features:
    - navigation.instant
    - navigation.tracking
    - navigation.tabs
    - navigation.sections
    - navigation.expand
    - navigation.top
    - search.suggest
    - search.highlight
    - search.share
    - content.code.copy
    - content.action.edit
  icon:
    repo: fontawesome/brands/github

# Plugins
plugins:
  - search:
      lang: en
  - tags

# Extensions
markdown_extensions:
  - admonition
  - pymdownx.details
  - pymdownx.superfences
  - pymdownx.highlight:
      anchor_linenums: true
  - pymdownx.inlinehilite
  - pymdownx.snippets
  - pymdownx.tabbed:
      alternate_style: true
  - pymdownx.emoji:
      emoji_index: !!python/name:material.extensions.emoji.twemoji
      emoji_generator: !!python/name:material.extensions.emoji.to_svg
  - attr_list
  - md_in_html

# Page tree
nav:
  - Home: index.md
  - Quick Start: QUICK-START.md
  - Onboarding Guide: ONBOARDING-GUIDE.md
  
  - Programming Languages:
    - Overview: programming-languages/index.md
    - Dev Environment: programming-languages/dev-environment.md
    - HTML & CSS: programming-languages/HtmlCss.md
    - JavaScript: programming-languages/JavaScript.md
    - PHP & MySQL: programming-languages/PhpMysql.md
    - WordPress: programming-languages/WordPress.md
  
  - Operating System:
    - OS Fundamentals: operating-system/os-fundamentals.md
  
  - Web Fundamentals:
    - Web Basics: web-fundamentals/web-basics.md
  
  - Reference:
    - Debugging: debuging.md
    - Progress Checklist: PROGRESS-CHECKLIST.md
    - rtCamp Course: RTCAMP-COURSE-LINKS.md
    - Summary: SUMMARY.md

# Extra
extra:
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/your-org
    - icon: fontawesome/brands/slack
      link: https://your-org.slack.com
  analytics:
    provider: google
    property: G-XXXXXXXXXX
```

#### Step 4: Organize Files

```bash
# Create docs directory
mkdir -p docs/programming-languages
mkdir -p docs/operating-system
mkdir -p docs/web-fundamentals

# Copy markdown files
cp README.md docs/index.md
cp QUICK-START.md docs/
cp ONBOARDING-GUIDE.md docs/
cp PROGRESS-CHECKLIST.md docs/
cp RTCAMP-COURSE-LINKS.md docs/
cp SUMMARY.md docs/
cp debuging.md docs/

# Copy programming languages
cp "Programming Languages"/README.md docs/programming-languages/index.md
cp "Programming Languages"/*.md docs/programming-languages/

# Copy other directories
cp "Operating System Basics"/*.md docs/operating-system/
cp "Web Fundamentals"/*.md docs/web-fundamentals/
```

#### Step 5: Run Locally

```bash
# Start development server
mkdocs serve

# Open: http://127.0.0.1:8000
```

#### Step 6: Build and Deploy

```bash
# Build static site
mkdocs build

# Deploy to GitHub Pages (one command!)
mkdocs gh-deploy
```

**Live at:** `https://your-username.github.io/fresher-onboarding/`

---

## Option 3: Docusaurus (Most Features) ⭐⭐⭐

**Perfect for:** Feature-rich documentation with blog, versioning, and i18n.

### Features
- ✅ React-based
- ✅ Blog functionality
- ✅ Versioning
- ✅ Internationalization
- ✅ SEO optimized
- ✅ MDX support

### Setup (15 minutes)

#### Step 1: Create Docusaurus Site

```bash
# Install and create site
npx create-docusaurus@latest docs-site classic

cd docs-site
```

#### Step 2: Copy Your Content

```bash
# Copy markdown files to docs/
cp ../README.md docs/intro.md
cp ../QUICK-START.md docs/
cp ../ONBOARDING-GUIDE.md docs/

# Create category folders
mkdir -p docs/programming-languages
mkdir -p docs/operating-system
mkdir -p docs/web-fundamentals

# Copy content
cp -r ../"Programming Languages"/*.md docs/programming-languages/
cp -r ../"Operating System Basics"/*.md docs/operating-system/
cp -r ../"Web Fundamentals"/*.md docs/web-fundamentals/
```

#### Step 3: Configure Docusaurus

Edit `docusaurus.config.js`:

```javascript
module.exports = {
  title: 'Developer Onboarding Guide',
  tagline: 'Comprehensive onboarding for fresher developers',
  favicon: 'img/favicon.ico',
  url: 'https://your-org.github.io',
  baseUrl: '/fresher-onboarding/',
  organizationName: 'your-org',
  projectName: 'fresher-onboarding',
  
  themeConfig: {
    navbar: {
      title: 'Developer Onboarding',
      items: [
        {
          type: 'doc',
          docId: 'intro',
          position: 'left',
          label: 'Documentation',
        },
        {
          to: '/blog',
          label: 'Blog',
          position: 'left'
        },
        {
          href: 'https://github.com/your-org/fresher-onboarding',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      copyright: `Copyright © ${new Date().getFullYear()} Your Organization`,
    },
    prism: {
      theme: require('prism-react-renderer/themes/github'),
      darkTheme: require('prism-react-renderer/themes/dracula'),
      additionalLanguages: ['php', 'bash'],
    },
  },
  
  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl: 'https://github.com/your-org/fresher-onboarding/edit/main/',
        },
        blog: {
          showReadingTime: true,
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
};
```

#### Step 4: Run and Deploy

```bash
# Development
npm start

# Build
npm run build

# Deploy to GitHub Pages
GIT_USER=your-username npm run deploy
```

---

## Option 4: VuePress ⭐⭐

**Perfect for:** Vue.js developers, clean and fast documentation.

### Quick Setup

```bash
# Install VuePress
npm install -D vuepress

# Create docs directory
mkdir docs

# Copy your markdown files
cp *.md docs/

# Add scripts to package.json
{
  "scripts": {
    "docs:dev": "vuepress dev docs",
    "docs:build": "vuepress build docs"
  }
}

# Run
npm run docs:dev
```

---

## 🚀 Quick Deploy Guide

### GitHub Pages (Free)

**For Docsify:**
```bash
# 1. Put docs in /docs folder
# 2. Add .nojekyll file
# 3. GitHub Settings → Pages → Source: main branch /docs folder
```

**For MkDocs:**
```bash
mkdocs gh-deploy
```

**For Docusaurus:**
```bash
GIT_USER=username npm run deploy
```

### Netlify (Free)

1. Connect your GitHub repo
2. Build command: `mkdocs build` or `npm run build`
3. Publish directory: `site/` or `build/`
4. Deploy!

### Vercel (Free)

1. Import GitHub repo
2. Framework preset: Auto-detect
3. Deploy!

---

## 📊 Comparison Table

| Feature | Docsify | MkDocs Material | Docusaurus | VuePress |
|---------|---------|-----------------|------------|----------|
| Setup Time | 5 min | 10 min | 15 min | 10 min |
| Build Required | No | Yes | Yes | Yes |
| Search | Plugin | Built-in | Built-in | Plugin |
| Themes | Multiple | Material | React | Default |
| Versioning | No | Yes | Yes | Yes |
| Blog | No | No | Yes | Yes |
| Dark Mode | Plugin | Built-in | Built-in | Theme |
| SEO | Basic | Excellent | Excellent | Good |
| Speed | Fast | Fast | Fast | Very Fast |

---

## 🎨 Customization Examples

### Docsify Custom Theme

Create `docs/custom.css`:

```css
:root {
  --theme-color: #3F51B5;
  --theme-color-dark: #303F9F;
}

.sidebar {
  background: #f8f9fa;
}

.sidebar-nav a {
  color: #333;
}
```

Add to `index.html`:
```html
<link rel="stylesheet" href="custom.css">
```

### MkDocs Custom Colors

In `mkdocs.yml`:

```yaml
theme:
  palette:
    primary: teal
    accent: amber
```

---

## 🔍 Adding Search Features

### Docsify Search

Already included in our config above. For more options:

```javascript
search: {
  maxAge: 86400000,
  paths: 'auto',
  placeholder: 'Type to search',
  noData: 'No Results!',
  depth: 6,
  hideOtherSidebarContent: false
}
```

### MkDocs Search

Already included. For advanced search:

```bash
pip install mkdocs-material[recommended]
```

Then enable in `mkdocs.yml`:

```yaml
plugins:
  - search:
      lang: 
        - en
      separator: '[\s\-\.]+'
```

---

## 📝 My Recommendation

**For your onboarding docs, I recommend:**

### 🏆 MkDocs Material

**Why:**
- ✅ Professional appearance
- ✅ Excellent search
- ✅ Easy to maintain
- ✅ One-command deployment
- ✅ Dark mode built-in
- ✅ Mobile responsive
- ✅ Fast and SEO-friendly

**Quick Start:**

```bash
# Install
pip install mkdocs-material

# I'll create the config for you!
# (see setup script below)

# Serve
mkdocs serve

# Deploy
mkdocs gh-deploy
```

---

## 🎯 Quick Setup Script

Save this as `setup-docs.sh`:

```bash
#!/bin/bash

echo "Setting up MkDocs documentation site..."

# Install MkDocs Material
pip install mkdocs-material

# Create docs directory structure
mkdir -p docs/programming-languages
mkdir -p docs/operating-system
mkdir -p docs/web-fundamentals

# Copy files
cp README.md docs/index.md
cp QUICK-START.md docs/
cp ONBOARDING-GUIDE.md docs/
cp PROGRESS-CHECKLIST.md docs/
cp RTCAMP-COURSE-LINKS.md docs/
cp SUMMARY.md docs/
cp debuging.md docs/
cp CHANGELOG.md docs/

# Copy directories
cp "Programming Languages"/README.md docs/programming-languages/index.md
cp "Programming Languages"/*.md docs/programming-languages/ 2>/dev/null || true
cp "Operating System Basics"/*.md docs/operating-system/ 2>/dev/null || true
cp "Web Fundamentals"/*.md docs/web-fundamentals/ 2>/dev/null || true

echo "✅ Files copied!"
echo "✅ Run: mkdocs serve"
echo "✅ Deploy: mkdocs gh-deploy"
```

Run it:

```bash
chmod +x setup-docs.sh
./setup-docs.sh
```

---

## 📖 Next Steps

1. **Choose your solution** (I recommend MkDocs Material)
2. **Run the setup**
3. **Customize the theme** (colors, logo, etc.)
4. **Deploy to GitHub Pages**
5. **Share the URL** with your team!

---

## 🆘 Need Help?

**Documentation:**
- [Docsify Docs](https://docsify.js.org/)
- [MkDocs Material Docs](https://squidfunk.github.io/mkdocs-material/)
- [Docusaurus Docs](https://docusaurus.io/)
- [VuePress Docs](https://vuepress.vuejs.org/)

**Examples:**
- [Material for MkDocs Examples](https://squidfunk.github.io/mkdocs-material/reference/)
- [Docsify Examples](https://docsify.js.org/#/awesome)

---

**Ready to build? Let me know which option you'd like, and I can help you set it up!** 🚀

