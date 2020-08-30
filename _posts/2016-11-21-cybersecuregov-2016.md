---
layout: post
title: CyberSecureGov 2016&#58; Practical Identity and Access Management
author: jabenninghoff
comments: true
---
Earlier this year, I spoke at [CyberSecureGov
2016](http://cybersecuregov.isc2.org/), after my proposed talk based on
the two years I spent working on large government projects was accepted.
Identity & Access Management has always been an interest of mine, ever
since my days supporting a security administration team, and I learned
quite a bit by working on projects setting up single sign-on for the
public.

From the Abstract:

> Building Identity & Access Management solutions can be difficult. This
> presentation reviews lessons learned from designing and building IAM
> solutions in multiple states, focusing on the unique challenges of IAM
> in government, which must serve the needs of three separate groups:
> the public, government agencies, and NGOs. Lessons drawn from
> real-world experiences will demonstrate what works, what doesn't, and
> how to fix things when they go wrong.
>
> Following the flow of a typical user's experience, the presentation
> will cover the successes, and failures of designing an IAM solution:
> getting a user ID, logging in to the system, matching "me" as a public
> user to "my data," and getting access to the system. Along the way, we
> will explore lessons about how design choices for each step can impact
> that experience.
>
> Also covered are designs that were not implemented, sharing the vision
> of how automated user-driven access requests, changes, and reviews can
> both improve user experience and lower costs.

The key lesson for me was to understand that there are three key aspects
of enrolling users in a public website, that should be handled
separately: provisioning a user ID, identity matching, and identity
proofing. Making these separate processes solves many potential problems
and provides a better user experience.

One interesting thing I noticed in both talks is that there were a small
core of very interested attendees -- most security professionals don't
have to deal with Identity & Access Management, but those who do tend to
be very passionate about the topic, and could easily relate to the
problems we faced while building out large SSO solutions.

You can download a copy of the slides from the presentation
[here](/assets/practical-iam-2016.pdf). A video of my
talk at [OWASP MSP](https://www.owasp.org/index.php/Minneapolis_St_Paul)
is available [here](https://vimeo.com/183118584).
