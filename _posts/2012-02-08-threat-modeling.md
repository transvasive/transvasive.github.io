---
layout: post
title: Threat Modeling
author: jabenninghoff
comments: false
---
Recently, I read and commented on a series of posts at [The New School](https://web.archive.org/web/20190710194248/https://newschoolsecurity.com/)
blog: [Threat Modeling Fails In Practice](https://web.archive.org/web/20170322105258/http://newschoolsecurity.com/2012/02/threat-modeling-fails-in-practice/),
[On Threat Modeling](https://web.archive.org/web/20170322103726/http://newschoolsecurity.com/2012/02/on-threat-modeling/),
and [Yet More On Threat Modeling: A Mini-Rant](https://web.archive.org/web/20170322163523/http://newschoolsecurity.com/2012/02/yet-more-on-threat-modeling-a-mini-rant/).
After reading both sides of the argument, I concluded that while [threat modeling](http://msdn.microsoft.com/en-us/library/ff648644.aspx)
can be helpful, but we need to find a better way that doesn't require us
to brainstorm. *Imagining the threats begets imaginary threats.* I
strongly believe that because of our cognitive errors in estimating
risk, brainstorming threats is a mistake, and will inevitably lead to
guessing what the threats will be, guesses that are at best only
slightly better than random chance.

To that end, I believe that some of my recent work in Behavioral
Security Modeling (BSM) may be part of the solution. Threat modeling
needs to be deconstructed and integrated directly into the software
development life cycle (SDLC). Some of the benefits provided by threat
modeling in general, and
[STRIDE](http://msdn.microsoft.com/en-us/magazine/cc163519.aspx)
specifically include identifying missing requirements and potential
quality/safety issues, something that BSM is designed to help with, and
I've got some ideas on how to address the other elements.

Work is slowly progressing on the BSM white paper that I am using to
develop and refine the ideas from my original [Behavioral Security Modeling]({% post_url 2011-11-17-appsec-usa-2011-video %})
[presentation](/assets/bsm-owasp-20110922.pdf), and
I've enlisted a collaborator with strong application development
experience. We've already discussed threat modeling, and if it's not
directly addressed in our white paper or the presentation, (we'll be
speaking at [Secure 360](https://web.archive.org/web/20120219050943/http://secure360.org/)!) it
certainly will be in the framework we're building behind the scenes.
