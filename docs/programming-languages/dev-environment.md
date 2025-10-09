# Development Environment Setup

Complete setup guide for your development machine.

## Pre-boarding Checklist

Before you start, ensure you have:

- [ ] MacBook or development machine
- [ ] GitHub account ([Sign up](https://github.com/join))
- [ ] Slack invitation (ask your team lead)
- [ ] Access to GitHub repositories and projects
- [ ] Code editor installed (see below)

## Required Software

### 1. Code Editor

**VS Code** (Recommended)

- Download: [https://code.visualstudio.com/](https://code.visualstudio.com/)
- Lightweight, fast, excellent extensions
- Great for JavaScript, PHP, HTML, CSS

**Recommended Extensions:**

##### PHP Development
- **[PHP Debug](https://marketplace.visualstudio.com/items?itemName=xdebug.php-debug)** (`xdebug.php-debug`) - Debug PHP code with Xdebug
- **[PHP Intelephense](https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client)** (`bmewburn.vscode-intelephense-client`) - PHP language support
- **[PHP DocBlocker](https://marketplace.visualstudio.com/items?itemName=neilbrayfield.php-docblocker)** (`neilbrayfield.php-docblocker`) - Generate PHP docblocks
- **[PHP Sniffer](https://marketplace.visualstudio.com/items?itemName=wongjn.php-sniffer)** (`wongjn.php-sniffer`) - PHP code sniffer integration
- **[PHPUnit](https://marketplace.visualstudio.com/items?itemName=recca0120.vscode-phpunit)** (`recca0120.vscode-phpunit`) - PHPUnit test runner

##### WordPress Development
- **[WordPress Hooks IntelliSense](https://marketplace.visualstudio.com/items?itemName=johnbillion.vscode-wordpress-hooks)** (`johnbillion.vscode-wordpress-hooks`) - WordPress hooks autocomplete
- **[WordPress Toolbox](https://marketplace.visualstudio.com/items?itemName=wordpresstoolbox.wordpress-toolbox)** (`wordpresstoolbox.wordpress-toolbox`) - WordPress development tools
- **[WooCommerce Snippets](https://marketplace.visualstudio.com/items?itemName=claudiosanches.woocommerce)** (`claudiosanches.woocommerce`) - WooCommerce code snippets

##### JavaScript/Frontend
- **[ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)** (`dbaeumer.vscode-eslint`) - JavaScript linting
- **[Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)** (`esbenp.prettier-vscode`) - Code formatter
- **[Prettier ESLint](https://marketplace.visualstudio.com/items?itemName=rvest.vs-code-prettier-eslint)** (`rvest.vs-code-prettier-eslint`) - Prettier + ESLint integration
- **[Tailwind CSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss)** (`bradlc.vscode-tailwindcss`) - Tailwind CSS support
- **[Auto Close Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag)** (`formulahendry.auto-close-tag`) - Auto close HTML/XML tags
- **[Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)** (`formulahendry.auto-rename-tag`) - Auto rename paired tags


##### Testing & Debugging
- **[Playwright Test](https://marketplace.visualstudio.com/items?itemName=ms-playwright.playwright)** (`ms-playwright.playwright`) - End-to-end testing

##### Utilities
- **[Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)** (`streetsidesoftware.code-spell-checker`) - Spell checking
- **[Markdown Mermaid](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid)** (`bierner.markdown-mermaid`) - Mermaid diagrams in markdown
- **[YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)** (`redhat.vscode-yaml`) - YAML language support
- **[Live Share](https://marketplace.visualstudio.com/items?itemName=ms-vsliveshare.vsliveshare)** (`ms-vsliveshare.vsliveshare`) - Real-time collaboration

**Installation:** Open VS Code, press `Cmd+Shift+X` (Mac) or `Ctrl+Shift+X` (Windows), search for extension names, and click Install.

> Also checkout [Visual Studio Code Editor for WordPress development](https://chandra.dev/visual-studio-code-editor-for-wordpress-development/)
### 2. PHP Development

**Laravel Herd** (All-in-one PHP environment)

- Download: [https://herd.laravel.com/](https://herd.laravel.com/)
- Includes PHP, Nginx, dnsmasq
- Easy local site management
- Perfect for WordPress development

```bash
# After installation, verify:
php --version
```

**Composer** (PHP Package Manager)

- Download: [https://getcomposer.org/](https://getcomposer.org/)
- Required for modern PHP development

```bash
composer --version
```

### 3. Database

**MySQL or MariaDB**

- MySQL: [https://dev.mysql.com/downloads/mysql/](https://dev.mysql.com/downloads/mysql/)
- MariaDB: [https://mariadb.org/download/](https://mariadb.org/download/)

**Database Management Tools** (choose one):

- **PHPMyAdmin** - [https://www.phpmyadmin.net/](https://www.phpmyadmin.net/) Web-based, included with Herd
- **TablePlus** - [https://tableplus.com/](https://tableplus.com/) (Recommended for Mac)
- **MySQL Workbench** - [https://dev.mysql.com/downloads/workbench/](https://dev.mysql.com/downloads/workbench/)
- **Sequel Ace** - [https://sequel-ace.com/](https://sequel-ace.com/) (Mac only, free)

```bash
# Verify installation:
mysql --version
```

### 4. JavaScript/Node.js

**Node.js** - JavaScript runtime

- Download: [https://nodejs.org/](https://nodejs.org/) (LTS version)

**npm** - Comes with Node.js

**nvm** (Node Version Manager) - Manage multiple Node versions
- Install: [https://github.com/nvm-sh/nvm](https://github.com/nvm-sh/nvm)

```bash
# Verify installations:
node --version
npm --version
nvm --version

# Using nvm:
nvm install 18        # Install Node 18
nvm use 18           # Use Node 18
nvm list             # List installed versions
```

### 5. Version Control

**Git** - Already installed on Mac, or:

- Download: [https://git-scm.com/downloads](https://git-scm.com/downloads)

```bash
git --version

# Configure Git:
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

**Oh My Zsh** (Optional but recommended)

- Enhances terminal experience
- Install: [https://ohmyz.sh/](https://ohmyz.sh/)

```bash
# Install Oh My Zsh:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 🔧 Quick Setup Commands

Run these commands to verify everything is installed:

```bash
# Check all installations at once:
echo "=== Development Environment Check ==="
echo "PHP: $(php --version | head -n 1)"
echo "Composer: $(composer --version)"
echo "MySQL: $(mysql --version)"
echo "Node: $(node --version)"
echo "npm: $(npm --version)"
echo "Git: $(git --version)"
echo "=== Setup Complete! ==="
```

## 📦 Installation Order

Follow this order for smoothest setup:

1. ✅ **VS Code** - Install first
2. ✅ **Laravel Herd** - PHP environment
3. ✅ **Composer** - PHP packages
4. ✅ **Node.js** - JavaScript runtime
5. ✅ **nvm** - Node version manager
6. ✅ **Database tool** - Choose your preferred GUI
7. ✅ **Oh My Zsh** - Terminal enhancement (optional)
8. ✅ **Git config** - Set up your identity

## 🎓 Next Steps

After setup is complete:

1. See [debuging.md](../debuging.md) for debugging configuration
2. Start learning [HTML & CSS](html-css.md)
3. Then move to [JavaScript](javascript.md)
4. Finally learn [PHP & MySQL](php-mysql.md)

## Troubleshooting

### Common Issues

**PHP not found after Herd installation:**
```bash
# Add Herd to PATH (already done by installer usually)
export PATH="$HOME/.config/herd/bin:$PATH"
```

**MySQL connection issues:**

- Check if MySQL service is running
- Verify credentials (default: root / no password)
- Check port (default: 3306)

**Node/npm permission errors:**

- Use nvm instead of system Node.js
- Never use `sudo` with npm

### Getting Help

- Check official documentation
- Ask in team Slack channel
- Contact your mentor
- Search Stack Overflow

---

**Setup Time:** 1-2 hours  
**Next:** [HTML & CSS](html-css.md)