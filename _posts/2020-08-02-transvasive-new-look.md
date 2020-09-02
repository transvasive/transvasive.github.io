---
layout: post
title: A New Look for Transvasive Security
author: jabenninghoff
comments: false
---
Over the past few days, I have been working on an overhaul of [transvasive.com](/). I've started using [GitHub Pages](https://pages.github.com) for my safety-related blog, [information-safety.org](https://www.information-safety.org/), and have found that I prefer that workflow to the more traditional approach of using a CMS, like WordPress, so I decided to migrate transvasive.com to GitHub. Today, I completed that migration by adding a custom domain and redirecting traffic to GitHub Pages.

From the [GitHub Repository](https://github.com/transvasive/transvasive.github.io), here is the journey of  transvasive.com so far:
1. Originally built on [Joomla](https://www.joomla.org)
1. Migrated to [WordPress](https://wordpress.org)
1. Mirrored using [httrack](https://www.httrack.com)
1. Converted from html to markdown with [pandoc](https://pandoc.org)
1. Cleaned up by hand with [Atom](https://atom.io)
1. Rebuilt with [Jekyll](https://jekyllrb.com) and [Poole](http://getpoole.com), forked from [information-safety](https://github.com/information-safety/information-safety.github.io)
1. Tested with [Travis CI](https://travis-ci.com)
1. Deployed using [GitHub Pages](https://pages.github.com)
1. Configured to use a custom domain with [Cloudflare](https://www.cloudflare.com)

As part of the migration, I edited all of the historical posts, fixing a few typos and restoring broken links. In some cases, the sites referenced are no longer active -- those have been replaced with the page stored in the [Internet Archive](https://archive.org) when available.

One final note: for a single-person blog, a static site generator is easy to use and *much* easier to secure. I'd recommend it both for the improved security and for the benefits of being able to manage your content using version control.
