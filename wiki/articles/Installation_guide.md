---
layout: article
title:
---

# Installation

The basic installation is documented in the
{% link_article Beginners guide %}.

Here you can find detailed information on how to extend, customize and modify
your wiki, including the setup for Continuous Integration and github pages.

# Development

## Continuous Integration

If you want to hack on this template, you can use a CI server (locally) to
auto-generate your pages and review them almost instantly.

To do so, you can `bundle exec rake dev` which rebuilds the site automatically
if you change files.

## Travis CI

You can enable travis-ci for your wiki and even build github pages with
travis. To do so, read the section on
[automatic publishing to github pages with travis](https://github.com/razor-x/jekyll-and-zurb#automatic-publishing-to-github-pages-with-travis-ci)
of the template I used to build this wiki template.



# Modifying

## Colorscheme of Codeblocks

The colorscheme of code blocks can be changed in the
file `_assets/stylesheets/app.css.sass.erb`.

The line

```
//= require highlightjs/styles/default
```

can be changed to other styles.

