---
layout: post
title: LinkedIn and password security
author: jabenninghoff
comments: false
---
**What happened?**

Per Thorshiem, a Norwegian security researcher, discovered a file
containing 6.5 million SHA-1 unsalted password hashes posted to a
Russian hacker site. The poster was requesting help cracking the
passwords. Multiple researchers have confirmed that at least some of the
passwords are from LinkedIn, by looking for known passwords (i.e. their
own) that are only used for LinkedIn, and by examining some of the
already-cracked passwords, many of which include the words "link" or
"LinkedIn." The file appears to only contain passwords, and no
usernames, but it's likely the hacker(s) that posted the file have
usernames as well. 300,000 have already been cracked.

**What does this mean?**

Passwords are most often stored as a *hash*, which transforms the
password into a fixed-length value. To check if someone enters the
correct password, the system takes the password entered, hashes it, and
compares it to the stored hash. If they match, the system allows the
login to proceed. In some cases, a *salt* is added to the password
before the hash is done, which makes cracking harder. The salt is a
random value that's stored with the password hash.

The transformation method, in this case SHA-1, encodes passwords is such
a way that the only practical method to crack the password is to
calculate the hash for a possible password, and compare the hash against
the list of 6.5 million. Hackers and security professionals use two
methods for cracking: a *dictionary attack*, which tries a list of words
and common passwords, and a *brute-force attack*, which simply tries
each possible password, (aaaaaaaa, then aaaaaaab, ...).

Although this may sound difficult, [modern software](https://web.archive.org/web/20171213143450/http://www.cryptohaze.com:80/multiforcer.php),
combined with a fast video graphics card (to do the calculations), can
test hundreds of millions of passwords per second against the entire
list simultaneously... combine this with the knowledge that humans
choose predictable passwords, and passwords can be guessed quite
quickly. Already, 300K passwords (about 5%) are known to have already
been cracked. Over time, the number of cracked passwords will steadily
increase.

**What should I do now?**

If you use LinkedIn, [change your password
now](https://nakedsecurity.sophos.com/2012/06/06/millions-of-linkedin-passwords-reportedly-leaked-take-action-now/).
It's not certain that your password has been or even will be cracked,
but it's a reasonable precaution. If your LinkedIn password is the same
as the one you use on other sites, you'll need to change those too. A
common tactic today is to try an already-known password on other sites.
See my suggestions below on how I manage my own passwords for how you
can make this easier for you and harder for the bad guys.

**How can I protect myself against this type of attack?**

The standard advice from security professionals is to pick hard to guess
"[strong](https://nakedsecurity.sophos.com/2010/02/03/choose-strong-password/)"
passwords, and pick different passwords for each site you use. This
quickly becomes an impossible task; I have well over 100 passwords to
keep track of. Some time ago, I gave up on trying to remember passwords
and adopted a password manager. A good password manager does the job of
both generating unique, random passwords for each site you use, storing
them securely, all protected by a single *master password*, and makes it
easy to enter your password when logging on to a website (just click a
button!)

Right now, I use [1Password](https://agilebits.com/onepassword), but
also recommend [LastPass](https://lastpass.com/). I use a very long pass
phrase for my master password, which is a phrase or complete sentence
that should be easy to remember, but hard to guess. Five or more words
is good, and using spaces and punctuation is also good. [1Password has a
post](https://blog.agilebits.com/2011/06/21/toward-better-master-passwords/)
that discusses the topic in detail, and I like their example of "I have
35 bats: Larry, Moe & Curly." LastPass can step up security by allowing
you to add a [USB
device](http://lastpass.com/support_screencasts.php?feature=yubikey1) as
an additional (second factor) authenticator. I currently don't have my
pass phrase written down, but if you're forgetful, I'd recommend writing
it down, sealing it in an envelope (or a tamper-evident bag if you can
get one), and storing it in a safe place, like an actual safe, or your
safety deposit box.

For individual websites, I generate a 15-character random password that
contains upper case, lower case, and numbers, which is compatible with
most sites, and long enough that it's really unlikely it will ever be
cracked using current technology. I don't use the 1Password built-in
generator, but for those who do (it's easier), I'd recommend setting
length to 15 or more, with 1 digit, and 1 symbol for sites that require
it. Since 1Password has clients for all my devices, and syncs using
[Dropbox](https://www.dropbox.com/), I always have my passwords handy.

The net effect of all of this? It's easier for me to use, since I only
have to remember one password that I don't need to change. It's harder
for the bad guys, since if they manage to steal a site's password
database, they probably won't be able to crack my password, unless the
site is not properly protecting passwords and storing them in plain
text. Finally, if I do find out a site has been broken into, fixing the
problem is easy: I generate a new password for that site.

**For security professionals:**

Security professionals I know routinely use the same approach (password
managers). My challenge to the community is this: why not adopt this
approach for ALL passwords, including the passwords we're charged to
protect? After all, LastPass offers an [enterprise
edition](https://www.lastpass.com/enterprise/) that solves many of the
problems that make passwords insecure. I'd love to hear from you via
Twitter (@transvasive) what you think of giving password managers to
everyone in your organization: good idea? crazy? something you've
already implemented? I hope to write more on this topic in the future,
and will include what you have to say (with attribution).
