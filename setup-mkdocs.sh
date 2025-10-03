#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}======================================${NC}"
echo -e "${BLUE}  Setting up MkDocs Documentation${NC}"
echo -e "${BLUE}======================================${NC}"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null && ! command -v python &> /dev/null; then
    echo -e "${YELLOW}⚠️  Python is not installed. Please install Python first.${NC}"
    echo "Visit: https://www.python.org/downloads/"
    exit 1
fi

# Check if pip is installed
if ! command -v pip3 &> /dev/null && ! command -v pip &> /dev/null; then
    echo -e "${YELLOW}⚠️  pip is not installed. Please install pip first.${NC}"
    exit 1
fi

# Step 1: Install MkDocs Material
echo -e "${GREEN}Step 1: Installing MkDocs Material...${NC}"
pip3 install mkdocs-material || pip install mkdocs-material

if [ $? -ne 0 ]; then
    echo -e "${YELLOW}⚠️  Installation failed. Trying with --user flag...${NC}"
    pip3 install --user mkdocs-material || pip install --user mkdocs-material
fi

echo ""

# Step 2: Create docs directory structure
echo -e "${GREEN}Step 2: Creating docs directory structure...${NC}"
mkdir -p docs/programming-languages
mkdir -p docs/operating-system
mkdir -p docs/web-fundamentals
mkdir -p docs/assets

echo -e "${GREEN}✓ Directories created${NC}"
echo ""

# Step 3: Copy files
echo -e "${GREEN}Step 3: Copying markdown files...${NC}"

# Main files
cp README.md docs/index.md 2>/dev/null && echo "  ✓ index.md"
cp QUICK-START.md docs/ 2>/dev/null && echo "  ✓ QUICK-START.md"
cp ONBOARDING-GUIDE.md docs/ 2>/dev/null && echo "  ✓ ONBOARDING-GUIDE.md"
cp PROGRESS-CHECKLIST.md docs/ 2>/dev/null && echo "  ✓ PROGRESS-CHECKLIST.md"
cp RTCAMP-COURSE-LINKS.md docs/ 2>/dev/null && echo "  ✓ RTCAMP-COURSE-LINKS.md"
cp SUMMARY.md docs/ 2>/dev/null && echo "  ✓ SUMMARY.md"
cp debuging.md docs/ 2>/dev/null && echo "  ✓ debuging.md"
cp CHANGELOG.md docs/ 2>/dev/null && echo "  ✓ CHANGELOG.md"

# Programming Languages
if [ -d "Programming Languages" ]; then
    cp "Programming Languages"/README.md docs/programming-languages/index.md 2>/dev/null && echo "  ✓ programming-languages/index.md"
    cp "Programming Languages"/*.md docs/programming-languages/ 2>/dev/null
    echo "  ✓ Programming Languages files copied"
fi

# Operating System Basics
if [ -d "Operating System Basics" ]; then
    cp "Operating System Basics"/*.md docs/operating-system/ 2>/dev/null
    echo "  ✓ Operating System files copied"
fi

# Web Fundamentals
if [ -d "Web Fundamentals" ]; then
    cp "Web Fundamentals"/*.md docs/web-fundamentals/ 2>/dev/null
    echo "  ✓ Web Fundamentals files copied"
fi

echo ""

# Step 4: Fix file paths in copied markdown files
echo -e "${GREEN}Step 4: Fixing internal links...${NC}"

# This is a basic fix - you might need to adjust links manually
find docs -name "*.md" -type f -exec sed -i.bak 's|Programming Languages/|programming-languages/|g' {} \;
find docs -name "*.md" -type f -exec sed -i.bak 's|Operating System Basics/|operating-system/|g' {} \;
find docs -name "*.md" -type f -exec sed -i.bak 's|Web Fundamentals/|web-fundamentals/|g' {} \;

# Remove backup files
find docs -name "*.bak" -type f -delete

echo -e "${GREEN}✓ Links fixed${NC}"
echo ""

# Step 5: Create .gitignore for site directory
echo -e "${GREEN}Step 5: Creating .gitignore...${NC}"
if [ ! -f .gitignore ] || ! grep -q "site/" .gitignore; then
    echo "site/" >> .gitignore
    echo -e "${GREEN}✓ Added site/ to .gitignore${NC}"
fi
echo ""

# Summary
echo -e "${BLUE}======================================${NC}"
echo -e "${GREEN}✅ Setup Complete!${NC}"
echo -e "${BLUE}======================================${NC}"
echo ""
echo -e "${GREEN}Next steps:${NC}"
echo ""
echo "1. Start development server:"
echo -e "   ${YELLOW}mkdocs serve${NC}"
echo ""
echo "2. Open in browser:"
echo -e "   ${YELLOW}http://127.0.0.1:8000${NC}"
echo ""
echo "3. Build the site:"
echo -e "   ${YELLOW}mkdocs build${NC}"
echo ""
echo "4. Deploy to GitHub Pages:"
echo -e "   ${YELLOW}mkdocs gh-deploy${NC}"
echo ""
echo -e "${BLUE}Tip:${NC} Edit ${YELLOW}mkdocs.yml${NC} to customize your site"
echo ""
echo -e "${GREEN}Happy documenting! 📚${NC}"

