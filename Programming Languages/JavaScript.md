# JavaScript

The following are useful references. You can go through it to refresh your JavaScript knowledge.

## Learning Resources

- [JavaScript Notes & Reference](https://wesbos.com/javascript): To find all in one place about JavaScript you can explore this.

- [ES6 Tutorial](https://www.javascripttutorial.net/es6/): ES6 tutorials and guidelines.

- [ECMAScript History](https://webreference.com/javascript/basics/versions/): Various versions of ECMAScript.

- [Clean Code concepts adapted for JavaScript](https://github.com/ryanmcdermott/clean-code-javascript): To learn and practice clean coding concept of JavaScript, please follow this link.

- [ESNext](https://www.javascripttutorial.net/es-next/): A comprehensive list of all additions to ECMAScript after ES6.

## Try it out!

### Problem 1: Fix the Array Sum Function

Fix the following code snippet that attempts to calculate the sum of an array.

```javascript
/**
 * Calculates the sum of all elements in an array.
 * 
 * @param {number[]} arr - The array of numbers to sum.
 * @returns {number} The sum of the elements in the array.
 */
function sumArray(arr) {
  let sum = 0;
  for (let i = 0; i <= arr.length; i++) {
    sum += arr[i];
  }
  return sum;
}

console.log(sumArray([1, 2, 3, 4])); // Expected output: 10
```

### Problem 2: JavaScript Type Coercion

What will be the output of the following and why?

```javascript
let a = 3;
let b = "3";

console.log( a+b );
console.log( b+a);

console.log( b*a );
console.log( a*b );

console.log( a/b );
console.log( b/a );

console.log( a-b );
console.log( b-a );
```

## Ideas to Explore:

- What are closures in JavaScript?
- What is the event loop in JavaScript?
- What is the difference between null and undefined in JavaScript?
- What are pseudo-classes and pseudo-elements in CSS? Read about different ones of those.

## Quiz

- [Quiz – JavaScript](https://learn.rtcamp.com/courses/engineering-basics/l/programming-languages/t/javascript/quizzes/external-javascript-quiz/)