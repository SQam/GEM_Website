# Style Guide

The below documents how we should write markup for this project. Using best practices and the latest standards such as utilizing [HTML5 semantic markup](http://www.w3schools.com/html/html5_semantic_elements.asp) and following accessibility rules from [WCAG](http://webaim.org/standards/wcag/checklist) is essential. Making sure the markup is clean and modular is important when we have to later stylize and add JS logic on top of them.

Tips are prefixed after each section with a `*`.

## General
```html
<!doctype html>
<html>
  <head></head>
  <body></body>
</html>
```
**Use lowercase for all tags, such as when defining the doctype.*

## Head
```html
<head>
  <title>Title</title>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- stylesheets -->
  <link rel="stylesheet" href="something.css">
  
  <!-- scripts -->
  <script src="something" defer></script>
</head>
```
**Notice how there is no need for an ending `/>` for self-closing elements in HTML5.*

**Scripts are defined in the "head" and with the "defer" attribute, instead of placing scripts at the bottom of the "body" element.*

## Body
```html
<body>
  <header></header>
  <main></main>
  <footer></footer>
</body>
```
**Semantic tags such as "header", "main", and "footer" help keep the markup modular and readable.*

### Main
```html
<main>
  <!-- sections -->
  <section></section>
</main>
```
**It is generally better to use a "section" instead of a "div" to provide better semantic value.*

**There can only be one "main" element defined.*

### Header

### Footer

## Form

### Input

### Select

### Textarea
