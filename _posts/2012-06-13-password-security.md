---
layout: post
title: Password Security Revisited
author: jabenninghoff
comments: false
---
In my article, "[Why Password Rotation is Bad]({% post_url 2010-10-23-password-rotation %})," I
made the case that rotating passwords offers no security benefits, while
making them harder for people to use. I stand by my assertion that
passwords are hard to use, and rotation only diminishes usability, but I
can now say that on a system that implements a password hashing
algorithm like [bcrypt](https://en.wikipedia.org/wiki/Bcrypt) or
[PBKDF2](https://en.wikipedia.org/wiki/PBKDF2), in some cases, password
rotation can effectively defeat brute-force attacks, but little
protection against dictionary attacks.

bcrypt and PBKDF2 (Password-Based Key Derivation Function 2) work in
essentially the same way -- instead of salting and hashing the password
once, the process is done repeatedly, an arbitrary number of times.
([scrypt](http://www.tarsnap.com/scrypt.html) is a newer alternative
that is specifically designed to further resist brute-force attacks)
Although adding iterations doesn't add to the cryptographic strength, it
does increase the computing time required to calculate the hash. By
increasing the calculation time, we can make password cracking more
difficult. Instead of being able to test hundreds of millions of
passwords per second, we can slow the attacker to ten per second (at
least on one machine with no specialized hardware). The defender can
choose a target time for how long it takes to calculate a single hash,
and adjust the number of iterations accordingly. The beauty of this
approach is that, failing a major breakthrough in mathematics, the
number of iterations can be increased over time as computing power
increases to keep the calculation time constant. Users' password hashes
can be silently upgraded when the number of iterations increases, so
that calc times stay constant for legacy hashes.

Practically speaking, this means figuring out how long to make your
passwords becomes an exercise in comparing relative computing power of
attacker and defender.

## Analysis

For my analysis, I assumed a password has time of 100 ms; this is a
reasonable target, as a tenth of a second isn't going to have much of a
negative impact on user experience when logging in. An attacker
calculating hashes at the same rate can perform 10 attempts per second,
although they could apply additional horsepower to increase the cracking
rate. Below are a couple of tables showing the number of days to
brute-force a password at a given rate.

## Lowercase Letters Only

| P/Sec         | Length      |             |                 |             |                 |              |  
|---------------|-------------|-------------|-----------------|-------------|-----------------|--------------|-----------------
|               | 6           | 7           | 8               | 9           | 10              | 11           | 12
| 10            | 357.5414074 | 9296.076593 | 241697.9914     | 6284147.777 | 163387842.2     | 4248083897   | 1.1045E+11
| 100           | 35.75414074 | 929.6076593 | 24169.79914     | 628414.7777 | 16338784.22     | 424808389.7  | 11045018132
| 1,000         | 3.575414074 | 92.96076593 | **2416.979914** | 62841.47777 | 1633878.422     | 42480838.97  | 1104501813
| 10,000        | 0.357541407 | 9.296076593 | 241.6979914     | 6284.147777 | 163387.8422     | 4248083.897  | 110450181.3
| 100,000       | 0.035754141 | 0.929607659 | 24.16979914     | 628.4147777 | 16338.78422     | 424808.3897  | 11045018.13
| 1,000,000     | 0.003575414 | 0.092960766 | 2.416979914     | 62.84147777 | **1633.878422** | 42480.83897  | 1104501.813
| 10,000,000    | 0.000357541 | 0.009296077 | 0.241697991     | 6.284147777 | 163.3878422     | 4248.083897  | 110450.1813
| 100,000,000   | 3.57541E-05 | 0.000929608 | 0.024169799     | 0.628414778 | 16.33878422     | 424.8083897  | 11045.01813
| 1,000,000,000 | 3.57541E-06 | 9.29608E-05 | 0.00241698      | 0.062841478 | 1.633878422     | 42.48083897  | **1104.501813**

*Number of days to brute-force crack a password of a given length.*

## Uppercase, Lowercase, and Numbers

| P/Sec         | Length      |             |                 |             |                 |             |
|---------------|-------------|-------------|-----------------|-------------|-----------------|-------------|-----------------
|               | 4           | 5           | 6               | 7           | 8               | 9           | 10
| 10            | 17.10224074 | 1060.338926 | 65741.01341     | 4075942.831 | 252708455.5     | 15667924243 | 9.71411E+11
| 100           | 1.710224074 | 106.0338926 | 6574.101341     | 407594.2831 | 25270845.55     | 1566792424  | 97141130309
| 1,000         | 0.171022407 | 10.60338926 | **657.4101341** | 40759.42831 | 2527084.555     | 156679242.4 | 9714113031
| 10,000        | 0.017102241 | 1.060338926 | 65.74101341     | 4075.942831 | 252708.4555     | 15667924.24 | 971411303\.1
| 100,000       | 0.001710224 | 0.106033893 | 6.574101341     | 407.5942831 | 25270.84555     | 1566792.424 | 97141130.31
| 1,000,000     | 0.000171022 | 0.010603389 | 0.657410134     | 40.75942831 | **2527.084555** | 156679.2424 | 9714113.031
| 10,000,000    | 1.71022E-05 | 0.001060339 | 0.065741013     | 4.075942831 | 252.7084555     | 15667.92424 | 971411.3031
| 100,000,000   | 1.71022E-06 | 0.000106034 | 0.006574101     | 0.407594283 | 25.27084555     | 1566.792424 | 97141.13031
| 1,000,000,000 | 1.71022E-07 | 1.06034E-05 | 0.00065741      | 0.040759428 | 2.527084555     | 156.6792424 | **9714.113031**

*Number of days to brute-force crack a password of a given length.*

Realistically, hashes only have to withstand attack long enough for the
defender to detect that the hash database has been compromised, after
which the passwords are all changed or invalidated. If passwords are set
to rotate once per year, *or* if you assume the majority of attacks will
be detected within a year, that leads to some interesting conclusions:

|                | Lowercase Only | Upper, Lower, Number
|----------------|----------------|----------------------
| Average (100)  | 8              | 6
| Strong (100K)  | 10             | 8
| Massive (100M) | 12             | 10

*Password length required to resist an attack for 1 year (365 days or
more).*

Three types of attackers are considered, an Average attacker who can
check 100x as many passwords per second as the defender, a Strong
attacker with 100,000 times capacity, and a Massive attacker with 100
million times capacity. For reference, the largest
[Botnet](https://en.wikipedia.org/wiki/Botnet) on record, Bredolab, had
an estimated 30 million systems.

For an Average attacker, any 8-character password will resist a
brute-force attack for a year. A "PCI-compliant" 8-character strong
password will resist even a Strong attacker for a year. Extending the
length to 10 will pretty much prevent any non-government sponsored
attack; even a Massive attacker would take 26 years to exhaust the
password space (note that some passwords would be found more quickly).

This simple analysis aligns with work done by the developers of scrypt:
[by their estimates](http://www.tarsnap.com/scrypt/scrypt.pdf), (p. 14)
it would take \$130K worth of custom-fabricated 2002 hardware to crack
an 8-character bcrypt password and \$4.8 million worth to crack an
8-character scrypt password. (Keep in mind these are educated guesses
for building ASICs tailored to cracking)

Putting this all together, adding bcrypt (or better yet, scrypt) to
contemporary password policies that are already in place at most large
companies (8 character, complex password) will protect password hashes
against most attackers. Password rotation does improve security, since
it puts an upper limit on how long a stolen hash is valid for, but if
you assume that password database breaches will be detected in a
reasonable time period (12-24 months), then rotation is probably
unnecessary. When complexity is not mandatory, even an 8-character
all-lowercase password will hold up against an Average attacker.

Unfortunately, bcrypt/scrypt provides little protection against
dictionary attacks. Even at 10 attempts per second, an attacker can try
1 million passwords per day; bad passwords will still be guessed very
quickly. To defend against this, the only practical approach is to run a
dictionary attack against your password database. Some systems allow
this to be done at the time the password is set -- even a relatively
small dictionary, along with good guidance on how to select an
acceptable password should provide reasonable protection.

## Recommendations

So, to sum up:

- Use scrypt, or a similar password hashing algorithm.
- Set the number of iterations so that hashes take approximately 100
    ms, and adjust this value over time as computing power increases.
- Use the same password policy you have today (8 character complex
    passwords).
- Run dictionary checks against passwords as they are selected.

If you follow **all** this advice, your passwords will be able to
withstand an offline attack long enough for you to discover the breach,
removing the need to rotate passwords, and keep you safe against all but
the strongest adversaries.

Note however, it doesn't change [my advice for creating passwords for
sites you visit]({% post_url 2012-06-06-linked-passwords %}), since it's safe to assume most
sites still use relatively weak MD5-crypt or SHA-1 hashes.
