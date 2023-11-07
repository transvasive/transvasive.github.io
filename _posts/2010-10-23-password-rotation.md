---
layout: post
title: Why Password Rotation is Bad
author: jabenninghoff
comments: false
---
Nearly everyone in the US workforce who uses a desktop or laptop
computer as part of their job has now had to face the security
requirement to change their password every 90 days, or sometimes more
often. Government and financial institutions have generally required
password rotation for as long as there have been computer terminals,
since it was believed to improve security. Other organizations typically
started requiring people to change their passwords in response to
external auditors' demands, originally in response to the Sarbanes-Oxley
Act ([SOX](https://en.wikipedia.org/wiki/Sarbanes-Oxley_Act)), and more
recently, the Payment Card Industry Data Security Standard
([PCI-DSS](https://www.pcisecuritystandards.org/security_standards/pci_dss.shtml)).
Financial auditors required this since it was a generally accepted "best
practice," and PCI specifically requires it. (DSS 1.2: **8.5.9:**
*Change user passwords at least every 90 days*) People frequently
complained about the new rule, but rarely tried to challenge the
assertion that it was "good security."

Most security practitioners I've come across don't question the value of
changing passwords, but a few experienced professionals do quietly
challenge the folk wisdom. [Gene
Spafford](https://en.wikipedia.org/wiki/Gene_Spafford), who analyzed the
very first Internet worm (in 1987), is one of those professionals, and
challenges the notion that password rotation improves security in a
[2006 blog
post](http://www.cerias.purdue.edu/site/blog/post/password-change-myths/).
There are several ways passwords can be compromised today:

- Phishing; which is just another way of saying that someone tricks
    you into providing them your password.
- Sniffing; eavesdropping, either by monitoring passwords as they are
    sent over a network, (at the local coffee shop) or by installing
    software on a computer to monitor keystrokes (leveraging viruses or
    security flaws).
- Stealing; finding the password somewhere, which could be written
    down, stored in a word document, or even in (computer) memory.
- Sharing; when someone voluntarily gives you their password.
- Guessing; either by being clever and deducing someone's password
    (maybe it's the name & birthday of their only child), or by
    systematically trying passwords until all possible combinations are
    exhausted. Guessing at random generally doesn't work very well,
    since most password systems are designed to limit successive
    failures to prevent this type of attack. My iPhone, and most
    Blackberries, will automatically erase after 10 failed attempts.
- Password cracking; on well-designed systems, passwords are stored
    *hashed*, and while you can't figure out a password from a hash, if
    you can get a copy of someone's hashed password, you can guess as
    many times as you want, using your own computer to calculate hashes
    from potential passwords. Finding the right password is only a
    matter of time.

Changing your password offers no protection against any of these
threats, except password cracking – in every other case, someone else
has your password. Changing passwords will help protect against
cracking, because if you change your password before it can be cracked,
it will still be safe. This suggests a possible origin of this folk
wisdom, as explained by Gene: *"As best as I can find, some DoD
contractors did some back-of-the-envelope calculation about how long it
would take to run through all the possible passwords using their
mainframe, and the result was several months. So, they (somewhat
reasonably) set a password change period of 1 month as a means to defeat
systematic cracking attempts."*

Rotating passwords every month made sense 30 years ago, when trying to
break a password took several months, but that's no longer true. Modern
tools can crack a password in **much** less time. For passwords that
meet [typical
requirements](https://en.wikipedia.org/wiki/Password_policy), say, 8
characters long, with at least one upper case letter, lower case letter,
and a number, there are 218 trillion combinations. That seems like a
lot, but with a [\$500 graphics
card](http://www.nvidia.com/object/product_geforce_9800_gx2_us.html) and
a [free cracking tool](https://www.elcomsoft.com/lhc.html), a modern
desktop can check over 600 million passwords per second, covering all
possible combinations in just over 4 days. More sophisticated attacks
that take advantage of weaknesses in how people choose passwords, or how
some systems store passwords, can crack many passwords in seconds.

One response would be to require still longer passwords, with
requirements that force them to be more random, which would increase
cracking time. How long is long enough for current computing power?
Well, today NIST recommends a minimum encryption key length of 128 bits.
To match the same level of strength, a random password of upper & lower
case letters and numbers would have to be 22 characters long; if you
include all of the characters on the keyboard, you can shrink this to 20.
Since people don't do a good job of picking random passwords,
getting to 128 is much harder if you let them pick their own. Using a
NIST estimate, a "strong" password would have to be over 100 characters
long. Even matching a 64 bit key is hard for people; it would still
require a 48 character password.

My complaint with password rotation goes beyond the fact that rotating
passwords offers little or no security benefit. The traditional defenses
against password cracking; requiring longer passwords, more frequent
rotation, and greater complexity all make passwords harder for people to
use, which can actually be harmful. Take into consideration how people
respond to stronger password requirements; memorizing passwords is a
hard task for the human brain. Longer passwords and less time to
memorize them before being forced to change only make the task harder.

To make things easier, some will employ helpful tricks, like turning a
phrase into a random-looking letters & numbers, and others will use
tricks that make passwords easier to guess. "Password1" is more than 8
characters long, has at least one upper case letter, lower case letter,
and a number, so it will meet most password policies, but is a really
bad password. To cope with the requirement to change passwords, people
would pick a base password, and then just change the last number...
"Password1, Password2, Password1, ..." Adding the new requirement that
new passwords couldn't match the past 10 (or more) passwords just forced
people to become a little more clever; "Password9, Password10,
Password11, ..." Over the past few years, I've asked people what they do
when they have to change their password, and nearly everyone, including
many security people, use some method of a base password with a rotating
number at the end (some are more clever and put it at the beginning).
Only one non-security person picked a completely new password every
time, and as far as I can tell, that was mainly because she believed it
was important in keeping her job. Of course, some will give up and just
write their password down. This isn't such a bad thing, if they keep it
in a safe place, like their wallet, but that doesn't always happen.
Security policies can make things worse by telling people never to write
down their password – they should instead encourage them to keep it safe
if they must.

All of these things make passwords weaker, and more vulnerable to
attack. People use computers to get work done, and if the security gets
in the way, they will find a way around it. Instead of forcing people to
change their behavior to fit the technology, password systems could be
redesigned to take advantage of human strengths and idiosyncrasies. For
example, although memorizing a password is initially difficult, it
becomes easier if it is used frequently over a long period of time. Over
time, as repetitive tasks, like typing your password, or driving your
car, are mastered, they can be done without thinking. I once forgot my
ATM PIN, and had to go to the cash machine and watch how I entered it on
the keypad to remember. Typing a well-known password follows a
predictable rhythm, and one that is unique to an individual, much like a
telegraph operators'
"[fist](https://en.wikipedia.org/wiki/Telegraph_key)." A system that
measured the timing of keystrokes in addition to the password itself
would be much more effective at identifying a person, which is the goal
of the password. At first, the system would have to accept the password
alone, but over time, could learn a person's unique password signature.
Allowing for some variation and change over time would reduce failures.
Sudden changes in typing speed, perhaps due to injury, would still
require a password reset, but most systems are already set up to allow
for that.

Such a system would not only be easier to use, but would also be
stronger: it would add enough randomness to the password to prevent
cracking and guessing, sharing passwords would be stopped, as well as
some forms of password stealing – knowing only the password text would
not allow you to authenticate. It wouldn't completely prevent sniffing
and phishing, but it would make such attacks more difficult, and would
defeat most current methods. The system would also lower costs,
primarily by reducing forgotten password calls to the help desk. Not
surprisingly, someone else already thought of this idea; the
[patent](http://www.freepatentsonline.com/6895514.html) was filed by
Lucent in 1999.

Unfortunately, Lucent's patent has never been implemented. For a new
password authentication mechanism to be effective, it would need to be
integrated in to the Operating System (ie Windows), something that
Microsoft has little economic incentive to do. Open source projects
might want to add the feature, but they tend to avoid patented
technology. So, until the patent expires, and the folk wisdom changes,
we're probably stuck with what we have. In the mean time, the next time
an auditor tells you to rotate your passwords, ask "why?"
