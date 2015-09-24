---
layout: article
title:
---

# Beginners guide

So you want to install this template and create your own wiki from it. Nice!
Here are all the basics you need to know.

# Dependencies

To install this, you need to install the following things:

* Ruby 2.2.0
* Bundler
* bower
* imagemagick
* python
* pygments

If you are on NixOS, as I am, you can run `nix-shell` inside the root
directory of the repository and all the things will be available in your
environment.

# Getting up an running

After installing the dependencies, you need to install the gems and the like.
You do this by running
`bundler install --path vendor/bundle && bower install`. If everything
succeeded, you can build the site with either `bundler exec jekyll b` or build
and view the site with `bundler exec jekyll s` (the site will be available at
`localhost:4000`).

# Modifying

You can now start modifying the site to your needs. All articles you want to
have in your wiki go to `./wiki/articles` and
[its subdirectories](/wiki/articles/sub/Subpage.html).
They _have_ to have the yml header:

```markdown
---
layout: article
title: <title>
---
```

Articles are written in Markdown. An article _must_ have the `article` layout.
You can leave the title empty if you want, it is (by now) only used for the
title in the tab of your browser.

## Linking articles

You can link articles in two ways:

1. You can use the `link_article` helper from the plugins:
   `{% link_article Beginners guide %}`
2. You can link them in plain markdown:
   `[The guide for newbies](/wiki/articles/Beginners_guide.html)`

Both result in the same output, but the `link_article` helper has no support
for custom link names. The linked page title is the link title with the
helper (but it also results in less text in your files).

Note that you have to replace spaces with underscores in the Markdown syntax.

## Images, code, etc

All normal markdown features are supported. You can include code with the
three-backticks-syntax. Syntax highlighing is done with `highlightjs` and
works client-side. [highlightjs](https://highlightjs.org/) has a lot of
different color schemes, which
[you can choose from](https://highlightjs.org/static/demo/) and
[use in this wiki](/wiki/articles/Installation_guide.html#Modifying)

## Alerts

There are several kinds of alerts available:

{% wiki_note_secondary %}
  secondary
{% endwiki_note_secondary %}

{% wiki_note_info %}
  info
{% endwiki_note_info %}

{% wiki_note_success %}
  success
{% endwiki_note_success %}

{% wiki_note_warning %}
  warning
{% endwiki_note_warning %}

{% wiki_note_alert %}
  alert
{% endwiki_note_alert %}

Each has a different color scheme. The markup to include them is simple:

```ruby
  {{ "{% wiki_note_<kind> " }}%}
    <your text>
  {{ "{% endwiki_note_secondary " }}%}
```

Where `<kind>` is one of "secondary", "info", "success ", "warning" or
"alert".
