# JavaScript

Master modern JavaScript for interactive web applications.

## Quick Start

**New to JavaScript? Start here:**

- [Laracasts: JavaScript - The First Steps](https://laracasts.com/series/javascript-the-first-steps/episodes/1) - Video series
- [JavaScript Notes & Reference](https://wesbos.com/javascript) - Comprehensive guide

## Core Learning

### Fundamentals
- [ES6 Tutorial](https://www.javascripttutorial.net/es6/) - Modern JavaScript features
- [ESNext](https://www.javascripttutorial.net/es-next/) - Latest JavaScript additions
- [ECMAScript History](https://webreference.com/javascript/basics/versions/) - Version evolution

### Best Practices
- [Clean Code JavaScript](https://github.com/ryanmcdermott/clean-code-javascript) - Write maintainable code

## Required Tools Setup

Before coding, install these tools:

- **Node.js** - JavaScript runtime ([Download](https://nodejs.org/))
- **npm** - Package manager (comes with Node.js)
- **nvm** - Node Version Manager ([Install Guide](https://github.com/nvm-sh/nvm))

```bash
# Check installations
node --version
npm --version
nvm --version
```

## Practice Problems

### Problem 1: Fix the Array Sum Function 🐛

**Bug:** This code has an off-by-one error. Find and fix it!

```javascript
function sumArray(arr) {
  let sum = 0;
  for (let i = 0; i <= arr.length; i++) {  // ⚠️ Bug here!
    sum += arr[i];
  }
  return sum;
}

console.log(sumArray([1, 2, 3, 4])); // Expected: 10
```

<details>
<summary>💡 Hint</summary>
Array indices go from 0 to length-1. What happens when i equals arr.length?
</details>

### Problem 2: JavaScript Type Coercion 🔄

**Predict the output:**

```javascript
let a = 3;
let b = "3";

console.log(a + b);  // ?
console.log(b + a);  // ?
console.log(b * a);  // ?
console.log(a * b);  // ?
console.log(a / b);  // ?
console.log(b / a);  // ?
console.log(a - b);  // ?
console.log(b - a);  // ?
```

**Question:** Why do `+` and `-` operators behave differently?

## 🤔 Deep Dive Topics

Master these JavaScript concepts:

- **Closures** - Functions that remember their scope
- **Event Loop** - How JavaScript handles async operations
- **null vs undefined** - Type differences and use cases
- **Hoisting** - Variable and function declarations
- **Promises & Async/Await** - Modern asynchronous programming

## Test Your Knowledge

[Take the JavaScript Quiz →](#)

**Goal:** Score 70% or higher