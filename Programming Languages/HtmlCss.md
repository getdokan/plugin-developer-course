# HTML & CSS

The following are some useful references. You can go through it to refresh your HTML & CSS knowledge.

## Learning Resources

- [HTML5 Tutorial by MDN Web Docs](https://developer.mozilla.org/en-US/docs/Learn/HTML): HTML5 is a markup language used for structuring and presenting content on the World Wide Web.

- [CSS 3 Tutorial by MDN Web Docs](https://developer.mozilla.org/en-US/docs/Learn/CSS): CSS3 stands for **Cascading Style Sheet level 3**, which is the advanced version of CSS. It is used for structuring, styling, and formatting web pages. Several new features have been added to CSS3 and it is supported by all modern web browsers.

- [Learn to Code HTML & CSS](https://learn.shayhowe.com/): By designer & front-end developer Shay Howe.

- [Code Guide](https://codeguide.co/): Standards for developing consistent, flexible, and sustainable HTML and CSS.

- [HTML Cheat Sheet](https://assets.hostinger.com/content/tutorials/pdf/HTML-Cheatsheet.pdf): To have an all-in-one place under the hood for HTML.

- [CSS Cheat Sheet](https://www.hostinger.com/tutorials/css-cheat-sheet): To have all-in-one place under the hood for CSS.

- [Flexbox Froggy](http://flexboxfroggy.com/): Flexbox Froggy is a game for learning CSS flexbox.

- [CSS Flexbox Fundamentals Visual Guide](https://medium.com/swlh/css-flexbox-fundamentals-visual-guide-1c467f480dac): Fundamental guide to learn CSS Flexbox.

- [CSS Grid Garden](http://cssgridgarden.com/): Grid Garden is a game for learning CSS grid layout.

- [Learn CSS Layout](http://learnlayout.com/): To learn CSS layout, you can follow this article.

- [Learn BEM — Block Element Modifier](http://getbem.com/introduction/): BEM is **a front-end naming method for organizing and naming CSS classes**. The Block, Element, Modifier methodology is a popular naming convention for class names in HTML and CSS. It helps to write clean CSS by following some simple rules.

- [BEM Best Practices – BEM-Examples](https://seesparkbox.com/foundry/bem_by_example): BEM best practices and examples.

- [SASS](https://sass-lang.com/): CSS Preprocessor.

## Try it out!

1. Create a responsive layout where there are three columns on large screens, but on smaller screens, the columns stack vertically. Each column must have equal width and contain dynamic content.

```html
<!DOCTYPE html>
<html>
<head>
   <title>Sample Page</title>
   <style>
      .container{ 
         display:flex
      }

      .column{
         flex: 1;
         padding: 10px;
         background-color: #d3d3d3;
         margin: 5px
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

## Ideas to Explore:

- What are semantic tags? Why are they used?
- What are data attributes in HTML, and how can they be used in JS?
- What are the differences between different position values?
- What are pseudo-classes and pseudo-elements in CSS? Read about different ones of those.

## Quiz

- [Quiz – HTML & CSS](https://learn.rtcamp.com/courses/engineering-basics/l/programming-languages/t/html-css/quizzes/external-html-css-quiz/)