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
- Download: https://code.visualstudio.com/
- Lightweight, fast, excellent extensions
- Great for JavaScript, PHP, HTML, CSS

**Recommended Extensions:**
- PHP Debug
- ESLint
- Prettier
- GitLens
- WordPress Snippets

### 2. PHP Development

**Laravel Herd** (All-in-one PHP environment)
- Download: https://herd.laravel.com/
- Includes PHP, Nginx, dnsmasq
- Easy local site management
- Perfect for WordPress development

```bash
# After installation, verify:
php --version
```

**Composer** (PHP Package Manager)
- Download: https://getcomposer.org/
- Required for modern PHP development

```bash
composer --version
```

### 3. Database

**MySQL or MariaDB**
- MySQL: https://dev.mysql.com/downloads/mysql/
- MariaDB: https://mariadb.org/download/

**Database Management Tools** (choose one):
- **PHPMyAdmin** - Web-based, included with Herd
- **TablePlus** - https://tableplus.com/ (Recommended for Mac)
- **MySQL Workbench** - https://dev.mysql.com/downloads/workbench/
- **Sequel Ace** - https://sequel-ace.com/ (Mac only, free)

```bash
# Verify installation:
mysql --version
```

### 4. JavaScript/Node.js

**Node.js** - JavaScript runtime
- Download: https://nodejs.org/ (LTS version)

**npm** - Comes with Node.js

**nvm** (Node Version Manager) - Manage multiple Node versions
- Install: https://github.com/nvm-sh/nvm

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
- Download: https://git-scm.com/downloads

```bash
git --version

# Configure Git:
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

**Oh My Zsh** (Optional but recommended)
- Enhances terminal experience
- Install: https://ohmyz.sh/

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
2. Start learning [HTML & CSS](HtmlCss.md)
3. Then move to [JavaScript](JavaScript.md)
4. Finally learn [PHP & MySQL](PhpMysql.md)

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
**Next:** [HTML & CSS](HtmlCss.md)