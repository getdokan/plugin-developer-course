# 📚 Documentation Website Setup

Quick guide to set up a beautiful documentation website for the onboarding materials.

## 🚀 Quick Start (Easiest)

### Option 1: MkDocs Material (Recommended)

**One command setup:**

```bash
./setup-mkdocs.sh
```

Then:

```bash
# Start the docs site
mkdocs serve

# Open: http://127.0.0.1:8000
```

**Deploy to GitHub Pages:**

```bash
mkdocs gh-deploy
```

---

### Option 2: Docsify (No Build Required)

**Super simple, no installation needed (besides Docsify CLI):**

```bash
# Install Docsify
npm install -g docsify-cli

# Serve the docs directly
docsify serve .

# Open: http://localhost:3000
```

---

## 📖 What's Included

### Files Created:

1. **`DOCS-WEBSITE-SETUP.md`** - Complete guide with 4 options:
   - Docsify (Easiest)
   - MkDocs Material (Recommended)
   - Docusaurus (Most Features)
   - VuePress (Vue-based)

2. **`mkdocs.yml`** - Pre-configured MkDocs setup with:
   - Material theme
   - Dark mode
   - Search
   - Code copy buttons
   - Navigation structure
   - Social links

3. **`setup-mkdocs.sh`** - Automated setup script that:
   - Installs MkDocs Material
   - Creates docs directory
   - Copies all markdown files
   - Fixes internal links
   - Ready to serve!

---

## 🎯 Choose Your Solution

### MkDocs Material (Recommended) ⭐

**Best for:** Professional documentation with beautiful UI

**Pros:**
- ✅ Beautiful Material Design theme
- ✅ Built-in search
- ✅ Dark mode
- ✅ One-command deploy
- ✅ Fast and SEO-friendly

**Setup:**
```bash
./setup-mkdocs.sh
mkdocs serve
```

---

### Docsify (Easiest) ⭐

**Best for:** Quick setup, no build process

**Pros:**
- ✅ No build required
- ✅ Works in browser
- ✅ Fast setup
- ✅ Live reload

**Setup:**
```bash
npm install -g docsify-cli
docsify serve .
```

---

## 🔧 Customization

### MkDocs Customization

Edit `mkdocs.yml`:

```yaml
site_name: Your Site Name
theme:
  palette:
    primary: teal  # Change color
    accent: amber
```

### Add Custom CSS

Create `docs/stylesheets/extra.css`:

```css
:root {
  --md-primary-fg-color: #3F51B5;
}
```

Add to `mkdocs.yml`:

```yaml
extra_css:
  - stylesheets/extra.css
```

---

## 📦 Deployment Options

### GitHub Pages (Free)

**MkDocs:**
```bash
mkdocs gh-deploy
```

**Docsify:**
1. Put docs in `/docs` folder
2. Create `.nojekyll` file
3. GitHub Settings → Pages → Source: main branch → /docs

### Netlify (Free)

1. Connect GitHub repo
2. Build command: `mkdocs build`
3. Publish directory: `site/`
4. Deploy!

### Vercel (Free)

1. Import GitHub repo
2. Framework: Other
3. Build: `mkdocs build`
4. Output: `site/`
5. Deploy!

---

## 📊 Live Preview

### MkDocs Material Preview

Once running, you'll see:

```
INFO     -  Building documentation...
INFO     -  Cleaning site directory
INFO     -  Documentation built in 0.42 seconds
INFO     -  [12:34:56] Watching paths for changes:
            'docs', 'mkdocs.yml'
INFO     -  [12:34:56] Serving on http://127.0.0.1:8000/
```

Visit: http://127.0.0.1:8000

**Features you'll see:**
- 📱 Mobile-responsive design
- 🔍 Instant search
- 🌙 Dark/light mode toggle
- 📑 Automatic navigation
- 💻 Code copy buttons
- 🔗 Social links
- ✏️ Edit on GitHub links

---

## 🎨 Features Comparison

| Feature | MkDocs Material | Docsify |
|---------|----------------|---------|
| Setup Time | 5 min | 2 min |
| Build Required | Yes | No |
| Search | Instant | Plugin |
| Dark Mode | Built-in | Plugin |
| Themes | Material | Multiple |
| Deploy | One command | GitHub Pages |
| Speed | Very Fast | Fast |
| SEO | Excellent | Basic |

---

## 🆘 Troubleshooting

### MkDocs: Command not found

```bash
# Add Python bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Or reinstall
pip3 install --user mkdocs-material
```

### Port already in use

```bash
# Use different port
mkdocs serve -a 127.0.0.1:8001

# Or
docsify serve . -p 3001
```

### Links not working

Check that file paths match:
- `docs/index.md` (not `docs/README.md`)
- Use relative paths: `programming-languages/index.md`

---

## 📚 Resources

### Documentation:
- [MkDocs Material Docs](https://squidfunk.github.io/mkdocs-material/)
- [Docsify Docs](https://docsify.js.org/)
- [Full Setup Guide](DOCS-WEBSITE-SETUP.md)

### Examples:
- [Material for MkDocs Examples](https://squidfunk.github.io/mkdocs-material/reference/)
- [Docsify Showcase](https://docsify.js.org/#/awesome)

---

## 🎯 Next Steps

1. **Choose your solution** (MkDocs Material recommended)
2. **Run the setup** (`./setup-mkdocs.sh` or `docsify serve .`)
3. **Preview locally** (http://127.0.0.1:8000)
4. **Customize** (colors, logo, navigation)
5. **Deploy** (`mkdocs gh-deploy`)
6. **Share** with your team!

---

## ✨ Quick Commands Reference

### MkDocs

```bash
# Setup (one-time)
./setup-mkdocs.sh

# Serve locally
mkdocs serve

# Build static site
mkdocs build

# Deploy to GitHub Pages
mkdocs gh-deploy

# New page (creates docs/page.md)
mkdocs new page-name
```

### Docsify

```bash
# Install (one-time)
npm install -g docsify-cli

# Serve
docsify serve .

# Custom port
docsify serve . -p 3001

# Open browser automatically
docsify serve . -o
```

---

## 🎉 That's It!

You now have everything you need to create a beautiful documentation website!

**Recommended flow:**

1. Run `./setup-mkdocs.sh` ✅
2. Run `mkdocs serve` 🚀
3. Open http://127.0.0.1:8000 🌐
4. Customize in `mkdocs.yml` 🎨
5. Deploy with `mkdocs gh-deploy` 📦

**Questions?** Check [DOCS-WEBSITE-SETUP.md](DOCS-WEBSITE-SETUP.md) for detailed guides!

---

**Happy documenting! 📚✨**

