---
layout: page
---

# Documentation Style

This document shows examples of some of the specialized blocks we usen when writing Markdown for the Free PDK documentation.
We use [Kramdown](https://kramdown.gettalong.org/documentation.html) for Markdown parsing.
Kramdown has a handy [quick reference](https://kramdown.gettalong.org/quickref.html) for the most important Markdown features.

{% include toc.md %}

## Callouts

Callouts are used to highlight important or missing information.
You should always specify `markdown="1"` like in the examples (even if you don't want to use markdown inside the callout) so that the padding of the callout is correct.

**Correct**

```
<div class="callout" markdown="1">
  **Hey!** Watchout for trains!
</div>
```

<div class="callout" markdown="1">
  **Hey!** Watchout for trains!
</div>

Lists work as well:

```
<div class="callout" markdown="1">
  - foo
  - bar
</div>
```

<div class="callout" markdown="1">
  - foo
  - bar
</div>

**Incorrect**

```
<div class="callout">
  Hey! Watchout for trains!
</div>
```

<div class="callout">
  Hey! Watchout for trains!
</div>

## Footnotes

Kramdown supports named [footnotes](https://kramdown.gettalong.org/quickref.html#footnotes).
Footnotes are inserted using `[^name-of-the-footnote]`.
The content of the footnote can be placed anywhere you see fit, but is always rendered at the very bottom of the page.
Make sure to indent the footnote content by exactly 4 spaces like shown below.

```
Trains are fast[^my-footnote]. Or are they[^my-footnote]?

[^my-footnote]:
    **Yup, they are really fast.**
    You can even write multiple lines.
```

Trains are fast[^my-footnote]. Or are they[^my-footnote]?

[^my-footnote]:
    **Yup, they are really fast.**
    You can even write multiple lines.

## Markdown inside HTML

By default, Kramdown doesn't process content within HTML tags:
To process Markdown within HTML, set the special `markdown` attribute to `1`, `block`, or `span`.
The difference between them is explained in detail in the [Kramdown Documentation](https://kramdown.gettalong.org/syntax.html#html-blocks).

**Correct**

```
<div markdown="1">
  *test*
</div>
```

<div markdown="1">
  *test*
</div>

**Incorrect**

```
<div>
  *test*
</div>
```

<div>
  *test*
</div>

## Table of Contents

To embed a table of contents, use

```
{% raw %}{% include toc.md %}{% endraw %}
```
{% include toc.md %}

To exclude a header from the table of contents, use the `{:.no_toc}` attribute:

```
# My Header
{:.no_toc}
```
