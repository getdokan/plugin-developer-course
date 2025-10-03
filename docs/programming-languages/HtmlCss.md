# HTML & CSS

Learn the fundamentals of web structure and styling.

## Quick Start

**Beginner? Start here:**

- [W3Schools HTML & CSS](https://www.w3schools.com/HTML/html_css.asp) - Interactive tutorials
- [HTML & CSS Crash Course (Video)](https://www.youtube.com/watch?v=a_iQb1lnAEQ) - 1-hour quick start
- [Laracasts: HTML & CSS Workshop](https://laracasts.com/series/html-and-css-workshop) - Hands-on workshop
- [Laracasts: Modern CSS](https://laracasts.com/series/modern-css-for-backend-developers) - For backend devs

## Core Learning Resources

### HTML Resources
- [MDN HTML Tutorial](https://developer.mozilla.org/en-US/docs/Learn/HTML) - Complete HTML5 guide
- [HTML Cheat Sheet](https://assets.hostinger.com/content/tutorials/pdf/HTML-Cheatsheet.pdf) - Quick reference

### CSS Resources
- [MDN CSS Tutorial](https://developer.mozilla.org/en-US/docs/Learn/CSS) - Complete CSS3 guide
- [CSS Cheat Sheet](https://www.hostinger.com/tutorials/css-cheat-sheet) - Quick reference
- [Learn CSS Layout](http://learnlayout.com/) - Layout fundamentals

### Modern CSS Layouts
- **Flexbox:** [Flexbox Froggy](http://flexboxfroggy.com/) (Game) + [Visual Guide](https://medium.com/swlh/css-flexbox-fundamentals-visual-guide-1c467f480dac)
- **Grid:** [CSS Grid Garden](http://cssgridgarden.com/) (Game)

### Best Practices
- [Code Guide](https://codeguide.co/) - HTML/CSS standards
- [BEM Methodology](http://getbem.com/introduction/) - CSS naming convention
- [BEM Examples](https://seesparkbox.com/foundry/bem_by_example) - Practical examples
- [SASS](https://sass-lang.com/) - CSS preprocessor

---

## HTML Fundamentals

### Semantic HTML Tags Reference

A quick reference for common semantic tags and their purposes:

| Tag | Description | Typical Content |
|-----|-------------|-----------------|
| `<header>` | Introductory content or a heading for a section or page | Site title, logo, top nav, intro text |
| `<nav>` | Navigation links | Menus, breadcrumbs, table of contents |
| `<main>` | Main content unique to the page | Articles, products, core features |
| `<section>` | Thematic grouping of related content | Feature blocks, chapters, FAQ groups |
| `<article>` | Self-contained content that can be reused or syndicated | Blog post, news article, comment, product card |
| `<aside>` | Content indirectly related to the main content | Sidebar, callout box, newsletter signup, ads |
| `<footer>` | Footer for a section or page | Copyright, contact info, links |
| `<figure>` | Encapsulates media content | Image, chart, diagram |
| `<figcaption>` | Caption for a `<figure>` | Describes the image or media |
| `<address>` | Contact information | Author address, company email, physical location |
| `<time>` | Machine-readable date/time | Publication date, event start time |
| `<mark>` | Highlighted or relevant text | Search result highlight, annotation |
| `<summary>` | Title for `<details>` element | Clickable toggle heading |
| `<details>` | Expandable/collapsible content block | Hidden explanations, advanced options |

### Semantic Page Layout Example

```html
<body>
  <header>
    <h1>Site Title</h1>
    <nav>
      <a href="/">Home</a>
      <a href="/about">About</a>
    </nav>
  </header>

  <main>
    <article>
      <h2>Blog Post Title</h2>
      <p>Content of the article...</p>
    </article>

    <section>
      <h3>Related Posts</h3>
      <!-- More articles or links -->
    </section>
  </main>

  <aside>
    <h4>Subscribe</h4>
    <p>Signup form here</p>
  </aside>

  <footer>
    <p>&copy; 2025 YourSite.com</p>
  </footer>
</body>
```

### Best Practices for Semantic HTML

- Only one `<main>` per page
- Use `<section>` with headings (`<h2>`, `<h3>`, etc.)
- Use `<article>` when content is standalone
- Screen readers benefit from this structure for navigation
- Helps with SEO by defining hierarchy and relevance

### HTML Elements with Required Children

| Parent Element     | Required/Expected Children                     | Notes |
|--------------------|------------------------------------------------|-------|
| `<ul>`             | `<li>`                                         | Unordered list must contain only `<li>` items. |
| `<ol>`             | `<li>`                                         | Ordered list must contain only `<li>` items. |
| `<dl>`             | `<dt>`, `<dd>`                                 | Definition list uses term (`<dt>`) and description (`<dd>`) pairs. |
| `<select>`         | `<option>`, `<optgroup>`                       | Only `<option>` and `<optgroup>` are allowed. |
| `<optgroup>`       | `<option>`                                     | Groups of options. No other children allowed. |
| `<table>`          | `<caption>`, `<colgroup>`, `<thead>`, `<tbody>`, `<tfoot>`, `<tr>` | Must contain at least one row (`<tr>`), directly or through sectioning. |
| `<tr>`             | `<td>`, `<th>`                                 | Rows must contain cells (data or header). |
| `<thead>`, `<tbody>`, `<tfoot>` | `<tr>`                            | Sectioning elements in tables — must wrap rows. |
| `<colgroup>`       | `<col>`                                        | Defines column groups in tables. |
| `<audio>`, `<video>` | `<source>`, `<track>` (optionally)           | Arbitrary children will be ignored. |
| `<figure>`         | Any element, usually `<img>` and `<figcaption>` | Optional caption for visual media. |
| `<map>`            | `<area>`                                       | Used with image maps. |
| `<object>`         | `<param>`                                      | `<param>` configures embedded content. |
| `<fieldset>`       | `<legend>` (optional), then form controls      | `<legend>` must come first if present. |
| `<details>`        | `<summary>` (required), then content           | `<summary>` must be the first child. |
| `<menu>`           | `<li>` (in typical usage)                      | Like `<ul>`, but for commands or context menus. |

**Example of incorrect HTML:**

```html
<ul>
  <div>This is invalid</div> <!-- Not allowed inside <ul> -->
</ul>
```

---

## CSS Fundamentals

### Pseudo-Classes vs Pseudo-Elements

Understanding the difference between pseudo-classes and pseudo-elements is essential for advanced CSS styling.

**Comparison Table:**

| Feature | Pseudo-Class | Pseudo-Element |
|---------|--------------|----------------|
| **Syntax** | `:` (single colon) | `::` (double colon) |
| **Purpose** | Targets an element based on its state or context | Targets a specific part of an element |
| **Examples** | `:hover`, `:focus`, `:nth-child` | `::before`, `::after`, `::first-line` |
| **Manipulates** | Element's behavior or state | Element's content or sub-part |
| **Use Case** | Styling on interaction or position | Inserting content or decorations |

#### Pseudo-Classes Examples

Pseudo-classes change styles based on dynamic states:

```css
/* User hovers over a button */
button:hover {
  background-color: blue;
  color: white;
}

/* Input field is focused */
input:focus {
  border-color: green;
  outline: none;
}

/* Style first child in a list */
li:first-child {
  font-weight: bold;
}

/* Style every even row in a table */
tr:nth-child(even) {
  background-color: #f9f9f9;
}
```

#### Pseudo-Elements Examples

Pseudo-elements let you style parts of an element or insert generated content:

```css
/* Add a bullet before each list item */
li::before {
  content: "• ";
  color: red;
}

/* Add a note after a paragraph */
p.note::after {
  content: " [Note]";
  font-style: italic;
}

/* Style only the first line of text */
p::first-line {
  font-weight: bold;
}

/* Make the first letter big */
p::first-letter {
  font-size: 200%;
}
```

**Combining pseudo-classes and pseudo-elements:**

```css
a:hover::after {
  content: " →";
}
```

#### Quick Reference

| Selector | Type | What it Does |
|----------|------|--------------|
| `:hover` | Pseudo-class | When user hovers over an element |
| `:focus` | Pseudo-class | When element (like input) is focused |
| `:active` | Pseudo-class | When element is being clicked |
| `:nth-child(n)` | Pseudo-class | Selects the nth child of parent |
| `:checked` | Pseudo-class | For checked input elements |
| `::before` | Pseudo-element | Inserts content before an element |
| `::after` | Pseudo-element | Inserts content after an element |
| `::first-letter` | Pseudo-element | Styles the first letter of text |
| `::first-line` | Pseudo-element | Styles the first line of text |
| `::marker` | Pseudo-element | Styles bullets/numbers in lists |
| `::selection` | Pseudo-element | Styles text when selected (highlighted) |

**Important Notes:**

- `::` (double colon) is the modern standard for pseudo-elements (CSS3+), but older versions may use `:`
- Some pseudo-elements (`::before`, `::after`) require `content: ""` to render

---

## Practice Exercises

### Responsive Layout Challenge

Create a responsive 3-column layout that stacks vertically on mobile:

```html
<!DOCTYPE html>
<html>
<head>
   <title>Responsive Layout</title>
   <style>
      .container{ 
         display: flex;
         flex-wrap: wrap; /* Add this for mobile stacking */
      }

      .column{
         flex: 1;
         min-width: 250px; /* Add this for mobile stacking */
         padding: 10px;
         background-color: #d3d3d3;
         margin: 5px;
      }
   </style>
</head>
<body>
   <div class="container">
      <div class="column">Column 1</div>
      <div class="column">Column 2</div>
      <div class="column">Column 3</div>
   </div>
</body>
</html>
```

---

## Additional Topics to Explore

- **Semantic tags:** `<header>`, `<nav>`, `<article>`, `<section>`
- **Data attributes:** HTML attributes for storing custom data (e.g., `data-user-id="123"`)
- **CSS position values:** static, relative, absolute, fixed, sticky
- **Responsive design:** Media queries, mobile-first approach
- **CSS preprocessors:** SASS, LESS

---

## Test Your Knowledge

[Take the HTML & CSS Quiz](#)

**Goal:** Score 70% or higher to demonstrate proficiency