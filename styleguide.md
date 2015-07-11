# Style Guide

The below documents how we should write markup for this project. Using best practices and the latest standards such as utilizing [HTML5 semantic markup](http://www.w3schools.com/html/html5_semantic_elements.asp) and following accessibility rules from [WCAG](http://webaim.org/standards/wcag/checklist) is essential. Making sure the markup is clean and modular is important when we have to later stylize and add JS logic on top of them.

All HTML pages should be verified against the [W3C validator](http://validator.w3.org/) to ensure that the markup is well formed. This in and of itself is not directly indicative of good code, but it helps to weed out problems that are able to be tested via automation. It is no substitute for manual code review. (For other validators, see HTML Validation in the Codex).

Tips are prefixed after each section with a `*`.

## General Structure
```html
<!doctype html>
<html lang=”en”>
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Title of Page</title>

  <!-- stylesheets -->
  <link rel="stylesheet" href="something.css">

  <!-- scripts -->
  <script src="something" defer></script>
</head>
<body>
  <!-- Content -->
</body>
</html>
```
Use lowercase for all tags, such as when defining the doctype. 

Notice how there is no need for an ending `/>` for self-closing elements in HTML5. 

Scripts are defined in the "head" and with the "defer" attribute, instead of placing scripts at the bottom of the "body" element.

## Body
```html
<body>
  <header></header>
  <main></main>
  <footer></footer>
</body>
```
Semantic tags such as "header", "main", and "footer" help keep the markup modular and readable.

### Main
```html
<main>
  <!-- sections -->
  <section></section>
</main>
```
Use "section" instead of a "div" to provide better semantic value.

There can only be one "main" element defined.

### Header
The header helps split the web application up into easily distinguishable parts, both in physical location and function. In this case, it serves as navigation. We would see this at the very top of the page.

```html
<header>
  <nav>
    <a href="/somewhere">Somewhere</a>
    <a href="/someplace">Someplace</a>
  </nav>
</header>
```
This element is not necessary when you are using `<h1>`'s or other heading elements because they already demonstrate that the content serves as the heading.

### Footer
```html
<footer>
  Copyright &copy; 2015 - Circle of Children
</footer>
```
There generally is only a need for one footer. In this case, it serves as showing copyright information. We would see this at the very bottom of the page.

## Form
Each form contains a set of fieldsets which splits up each set of form inputs.

```html
<form action="someurl" method="post">
  <!-- fieldsets -->
  <fieldset></fieldset>
</form>
```

### Input
Each fieldset contains a set of labels, each of which holds an input and label pair. Each fieldset must have a legend which serves as a heading.

```html
<fieldset>
  <legend>A Legend</legend>

  <!-- labels -->
  <label for="someinput1">
    Some Label
    <input id="someinput1" type="text"> <!-- classic input -->
  </label>
  <label for="someinput2">
    Some Label
    <select id="someinput2"> <!-- select dropdown -->
      <option value="0">Value 1</option>
      <option value="1">Value 2</option>
    </select>
  </label>
  <label for="someinput3">
    Some Label
    <textarea id="someinput3"></textarea> <!-- textarea input -->
  </label>
</fieldset>
```
Input validation should not be defined in the markup. Rather, it should live in JavaScript. The reason for this is the idea of "Separation of Concerns". The HTML only serves as markup, not logic.

## Indentation
Don't indent inside html, body, script, or style. Indent inside head and all other elements.
As with PHP, HTML indentation should always reflect logical structure. Use 2 spaces and not tabs.

## Elements and Attributes
All element and attribute names should be lowercase. Attribute values should be
quoted. Optional closing tags should be included. Self-closing elements should
not be closed. Optional attributes should be omitted. Always include html, head,
and body tags.

No type or language attributes on script tags.
No type attribute on link or style tags.
```html
  <script src=”...”></script>
  <script></script>
  <link rel=”stylesheet” href=”...”>
  <style></style></style></script>
```

## Self-closing Elements
All tags must be properly closed. For tags that can wrap nodes such as text or other elements, termination is a trivial enough task. For tags that are self-closing, they should be left without the closure per the html5 spec:
```html
<area>
<base>
<br>
<col>
<command>
<embed>
<hr>
<img>
<input>
<keygen>
<link>
<meta>
<param>
<source>
<track>
<wbr>
```
rather than the incorrect:
```html
<br />
<br/>
```

## Comments
Explain code as needed, where possible. What does it cover, what purpose does it serve, why is respective solution used or preferred? (This item is optional as it is not deemed a realistic expectation to always demand fully documented code. Mileage may vary heavily for HTML and CSS code and depends on the complexity.)

It is important to remove all comments via an HTML preparer in the build process to production. Comments should help only developers divulge complicated code but not serve as documentation for outside users.

### Action Items
Mark todos and action items with TODO. Highlight todos by using the keyword TODO only, not other common formats like @@.

Append a contact in parentheses as with the format TODO(contact).

Append action items after a colon as in TODO: action item.

```html
<!-- TODO(john.doe): remove optional tags -->
<ul>
  <li>Apples</li>
  <li>Oranges</li>
</ul>

</li>
</ul></center>
```

----

For anything missing in this guide refer to [Google Style Guide](http://google.github.io/styleguide/htmlcssguide.xml)
