---
layout: post
title: CVSS, Patches, and Vulnerability Management
author: jabenninghoff
comments: false
---
Jack Jones posted a
[critique](https://web.archive.org/web/20150426141419/http://riskmanagementinsight.com/riskanalysis/?p=909)
of [CVSS](http://www.first.org/cvss) to his
[RiskAnalys.is](https://web.archive.org/web/20160205045537/http://riskmanagementinsight.com/riskanalysis/) blog this morning. I'm a big
fan of [FAIR](http://fairwiki.riskmanagementinsight.com/), and his
criticism of CVSS is valid, but I just don't see how even a "fixed"
version of CVSS will ever be practically useful.

The CVSS scoring methodology creates a score to measure the "risk" of a
vulnerability, presumably to help people or automated systems prioritize
a response, usually installing a patch. Jack, who has made measuring
risk his career, is well qualified to assess how well CVSS works. He
rightly points out problems with the CVSS calculation, including its use
arbitrary weighted values, and using math with ordinal scales, and
suggests that FAIR might provide an alternative that fixes these
problems. Even if the RMI delivers a CVSS alternative, I'm not convinced
that a vulnerability scoring tool that accurately measures risk has
practical value.

With regard to frequency/probability of loss, CVSS focuses on the
likelihood of attacker success from a couple of different angles, but
never addresses the frequency/likelihood of an attack occurring in the
first place.

Maybe I've just lead a sheltered life, but I've never found CVSS
terribly useful. Having been both a Windows administrator and the guy
responsible for reviewing the latest vulnerabilities and patches, I can
say that for most IT staff, vulnerability management can be broken down
into 2 basic steps:

1.  Wait for the monthly Microsoft patch release
2.  Deploy the patches

CVSS doesn't even matter in the most basic case. Small companies without
a dedicated IT staff don't need CVSS, since their vendors will tell
them which patches are important. If they're good, they'll deploy
Microsoft patches automatically, and if they're really good, they'll
even have reporting on how well systems are patched. Even so, the
majority will still be vulnerable since the non-OS vendors' applications
(Adobe Reader and Flash) won't be up to date, partly because can't take
of Microsoft's (or Apple's) built-in updating mechanism. (Although,
Apple is changing this with the Mac App Store)

For those companies fortunate enough to have security staff dedicated
to running a vulnerability management program, CVSS still doesn't help.
The more advanced version of VM really breaks down to 4 steps:

1.  Wait for the monthly Microsoft (or other vendor's) patch release
2.  Determine how quickly the patches need to be deployed
3.  Deploy the patches
4.  Scan your systems to find systems that aren't patched

CVSS *might* be able to help with step 2, but in practice it doesn't
matter. At most, there are really four different speeds to deploy
patches, *Emergency*, *Accelerated*, *Normal*, and *Eventually*.
*Emergency* deployments are typically in response to an attack; as in,
"Drop everything and put everybody on it, SQL Slammer has taken down our
network!" No help from CVSS here, you'll know when it's an emergency.
Which leaves us with *Accelerated* (let's put forth an extra effort to
get the patch deployed faster), *Normal*, (deploy on the normal
schedule) and *Eventually* (security doesn't care when this patch gets
deployed). CVSS in theory helps decide which of these three to pick, but
in my opinion, it fails to answer the key questions which are most
helpful in determining how hard to push on the gas.

There's a cost associated with each patch we track within our VM system.
Each patch means we spend more time on reviewing, deploying, scanning,
and re-deploying. To manage this cost effectively, we need to remember
why we're managing vulnerabilities in the first place. *The bad guys are
trying to break in.* For the majority of internal systems, (desktops and
servers) all we really care about is whether or not the bad guys, most
often represented by malware, can get on to the system. Attacks that
matter after you're already in don't really need to be fixed, since once
the enemy has a foothold, it's pretty much game over; there are too many
ways, especially on Windows systems, to take over, and it's really
expensive to fix. Information leakage vulnerabilities do matter, but
again, if you've already got an attacker on your internal network,
you've got bigger problems. Focusing on what's actually exploited
reduces vulnerabilities to two classes: the attacks the bad guys use to
break into systems, (unauthenticated network attacks and client-side
desktop/browser attacks) and everything else. Again, CVSS doesn't help
here. The cost of patching is high enough that "everything else" should
be automatically relegated to deploy *Eventually* (don't care), leaving
a decision on whether or not an *Accelerated* deployment is called for.

Factoring in risk in deciding whether or not to push a patch faster than
normal is a good idea, but CVSS leaves out the single most important
factor in judging the risk: the likelihood that an attacker will exploit
the vulnerability. This omission is excusable, since predicting how
likely an attack will happen is an educated guess at best. Predicting is
hard enough that it's best to use a simple rule of thumb; if there are
exploits in the wild -- the bad guys are actively exploiting the
vulnerability -- then do an *Accelerated* deployment. Otherwise, go with
*Normal*.

I may be missing other use cases for CVSS, or missing the point
entirely, but for what seems to be it's main use case, vulnerability
management, CVSS fails to deliver practical value. Instead of building
complicated scoring systems, simple rules based on knowledge of the
attackers nicely solve the patch management prioritization problem.
