# MB (Matt Borja's) Digital Challenge Coins — Guide

## Backstory
The concept of [challenge coins have been around for a long time](https://youtu.be/t1LNx1pgMeY), but I never considered authoring them myself until a colleague offered a recitation of the things she was doing to exercise [*prinicipal of least privilege*](https://www.cloudflare.com/learning/access-management/principle-of-least-privilege/) for a given context that had not been previously explored. It was deemed necessary to produce a reminder for myself, in the form of an awarded token of recognition, to this individual who had become familiar with my expectations and was prepared to demonstrate a proper answer. Thus, design work began, producing the very first MB Challenge Coin encoding the message: "I Now Trust You."

Unfortunately, manufacturing challenge coins proved to be unaffordable, and another means had to be discovered.

## The MB Challenge Coin "Manufacturing" Process (Specification)
One of my favorite hobbies of all time is *cryptography*. Besides its essential use in secure web application development and best practices, I've also had a lot of fun
- [implementing FIPS-197 (Advanced Encryption Standard) in Arduino C](https://gist.github.com/mattborja/139aec91ffb544982c69026a2aaf34ea),
- [drafting a write-up on crypto implementation](https://docs.google.com/document/d/17Y-bR-n0L2pnZvNU8iSJvd55WVrvoWimSVRAmTRNeZM/edit?usp=sharing),
- [releasing a npm module](https://www.npmjs.com/package/crypto-wrapper),
- [hacking the Pentagon](https://www.usds.gov/projects/hack-the-pentagon) ("wait, what?" [*shhh...* 🤫](https://keybase.pub/mattborja/messages/0xDC08CD38-dod-htp-cc-sneak-peak.jpg)), and
- [contributing a cryptography-related fix to the Jasig CAS project](https://apereo.atlassian.net/browse/CAS-1386).

Reflecting upon the time spent learning and applying cryptography in various fields over the years, I finally settled on a method I could personally trust to preserve the value of the digital issue of challenge coins for specific people or companies of people I wanted to recognize, backed by world-class data authentication and confidentiality services, as provided by PGP/OpenPGP ([RFC4880](https://datatracker.ietf.org/doc/html/rfc4880)).

### Overview
There are generally two parts to the digital challenge coin, both of which must be produced as an original work, signed and verified in order to be considered valid:

1. [The Digital Challenge Coin Certificate (Signed)](#the-digital-challenge-coin-certificate-signed)
2. [The Digital Challenge Coin Asset (Licensed)](#the-digital-challenge-coin-asset-licensed) accompanied with its [Detached Signature](#accompanying-detached-signature)

Once created and signed by the Issuer (Matt Borja), digital artifacts are typically delivered to the Assignee (recipient) via a web address where these assets can be viewed and downloaded in accordance with their License. Both artifacts carry the same value and may be used interchangeably once verified by the recipient.

Note: Certificate and Digital Asset content may be updated at the original URL from time to time, in order to address corrections, supplement missing information, re-apply licensing, etc.

### The Digital Challenge Coin Certificate (Signed)

Below is an example of a signed digital challenge coin certificate presented in [YAML format](https://yaml.org/), featuring a Citation (description) for the purpose of the coin and reason for its issue:
```yaml
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

# MB CHALLENGE COIN CERTIFICATE
# (C) 2022 MATT BORJA

EDITION: TRUST COIN
TYPE: II (ARMORED)
SERIAL: MBCC-TC.20220129

DESCRIPTION: >
  IT IS PLAINLY UNDERSTOOD THAT, AT ANY TIME, TRUST CAN BE
  VIOLATED. UNTIL THEN, THE TRUST COIN REMAINS A TOKEN OF HIGH
  RECOGNITION AND GRATITUDE FOR AN INDIVIDUAL’S SELF-INITIATIVE
  IN MATTERS PERTAINING TO INFORMATION SECURITY, RISK MITIGATION,
  DUE DILIGENCE AND HUMILITY, AS OBSERVED.

  ALSO KNOWN AS A MB CHALLENGE COIN, THE TWO-SIDED COIN SERVES
  AS A REMINDER TO ITS ORIGINAL DESIGNER, WHO HE "NOW TRUSTS"
  WILL CONTINUE TO THE EXTENT POSSIBLE: A DEFENDER OF INDUSTRY
  AND A PROPONENT OF BEST PRACTICES.

ASSIGNEE:
 - RECIPIENT_NAME: <REDACTED>
 - REASON: >
    DUE DILIGENCE IN APPLICATION OF
    PRINCIPLE OF LEAST PRIVILEGE.
 - UID: <REDACTED>

CERTIFICATION:
 - ISSUER: MATT BORJA
 - ISSUE_DATE: 2022-01-29T07:43:23Z
 - SIGNED_WITH: F30FF4FC936584574EE3251833688C2EDC08CD38

LICENSE: >
  MB CHALLENGE COIN DIGITAL ASSET(S) IS/ARE LICENSED FOR
  EXCLUSIVE USE BY NAMED ASSIGNEE(S) ONLY AND IS CONSIDERED
  INVALID AND UNAUTHORIZED FOR USE WITHOUT PROOF OF ASSIGNMENT
  VIA DETACHED SIGNATURE VERIFICATION.
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEESCXoP0Z0qi7+jBnOpjIppLTMI9kFAmIGTWoACgkQpjIppLTM
I9ma2w//YfAG3F/sjuI5FTQh+nPlGUbwu8kHKcu8i4xpVCa2eX2QQyipSKYYsVtH
u1Hu8HOBf3X7OsGlfPKpK/VvoZSkeXVTvYHgeGW/O/YAaZoXtdCgnVG5xU0Yw81+
Cu/kfYUC2/xOq2wQyZbcodk4ck6rPkq63qJtNMvxNQLHDOT/IBStkPA9MwTPW/YU
niTXiQDZi8nR64x9k1eaYOdLGEo0g3bKCjbe1G08fPbgGW0IEL86ck7B86giFiQR
tH8YqXh57diFezGflD3yKvGLwT+OnNQJXOqjiA0ktKwBs4/8klaiOy66CpfkKGxn
0tALcsOORwOHwrJ+WXycLZGCb89vtZqCkkdk0yt0Ny7MjY5qTePIp2dD2gPgDYy1
od9gWCJep2eDTHPPtV7MgKqYAn377YBj7yrJ81DUXswcvkNg+cEb7+NTXNsY+7P4
iq9WujNck94B4m7gimkj6KNu0oYLjeuNXMcfOzgnV3U0n04YUawxlu90HzkJJlfn
F0h/jSXLDx5DK/ziC7F4HLjb+F05HrFAmKqtUXrP7fCE3jPuUlUE9KCefjEDLFJD
lQuHyqb/FgfWG2q08xnp5SRbqb1BZwWYVvJYbq0T+sbBmuJhzlPCds/em4KtH6Yb
sHHA6YE6e0ncEnQ+TIRcL3ksvpQdN0wxug2W6TTyzChZqhwjujY=
=CD7q
-----END PGP SIGNATURE-----
```

### Verifying the Digital Challenge Coin Certificate
The general process for verifying PGP-signed messages requires  is as follows:
1. If necessary, locate a copy of the signer's full PGP public key at one or more of the [key servers listed](#list-of-key-servers) using the 160-bit fingerprint shown in the `SIGNED_WITH` field under `CERTIFICATION`. ALWAYS verify the fingerprint and signer's identity for accuracy before continuing.
2. MB Challenge Coin Certificates are always presented *clearsigned* for ease of use. Simply copy and paste the entire PGP signed message along with its signature into a valid PGP signature verification tool (see Resources below).

It is usually best to set up your own Web of trust and workflow for receiving public keys and verifying messages and files if you're going to be doing this on a regular basis. However, some online tools are also available to try out if you're just getting started.

For example, you can copy the entire clearsigned certificate above and paste it into the **Message to verify** field at https://keybase.io/verify to verify the message was in fact "Signed by [mattborja](https://keybase.io/mattborja)." Then, following the link in the confirmation message (https://keybase.io/mattborja), you can click on the key icon (listed with other confirmed identities) to see the full public key fingerprint, along with a copy of the entire public key with which the message was signed.

Note: Verifying detached signatures is a slightly different process and works best with your own local workflow set up. See [Making and verifying signatures](https://www.gnupg.org/gph/en/manual/x135.html) of *The GNU Privacy Handbook* for more information on how to do this with the [GNU Privacy Guard software](https://www.gnupg.org/software/index.html).

### Additional Resources
- [Verify a signed message with Keybase.io](https://keybase.io/verify)
- [Learn more about Web of trust at Wikipedia](https://en.wikipedia.org/wiki/Web_of_trust)

## The Digital Challenge Coin Asset (Licensed)
The digital challenge coin asset is an original design illustrated artwork, copyrighted and duly licensed exclusively to its assignee. The digital asset may be used as a badge or a collected commemorative. See also *License and Usage* below.

Below is a downsized preview of an original design and signed digital challenge coin asset:

![pc-dist-256px-300dpi](https://user-images.githubusercontent.com/3855027/153589384-5c841f1c-0880-4c97-a122-db0f62d35adc.png)

### Detached Signature
Below is an example of the accompanying detached signature:
```
-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEESCXoP0Z0qi7+jBnOpjIppLTMI9kFAmIGUioACgkQpjIppLTM
I9kwHRAAp2wUXwomW+VGnE8hfbhcHFlqUyng6GK3TNG1zdUKrOsuRrM1vH2fTjaZ
RSmBRdv+i/OWkwEOudI6o3mBq4GIB/yHIZpNsFs0GNmW02QvpPEc0cR9KD8qJl7P
3MP5xClW+KbHJ8/qJnDeMA7jgHi2KF2SCDrlj9jyMCSMOf3+RM397NaVoH++EGHn
/inWXIsazSHT/Wd4H4olzdzneiM5lpFjGbs2l4ETx4cJ3yG9TGquq31o0hnZ1QSY
l0rMOObzWndTwBSzOR+Eax5IIbA/Zr5ikQi+WopbrOnMezbqeDsBhvstFFUvas9/
05j+ZPDqu6qaf84rLHxFP+2R+WSGc1EUGho3M3nJv8X7eRWdfxKEgJ887KC+wmyJ
a6Qgw9mDpBQddelxyUxSWKnF8FQv+3Lb88oc6GAI01r9CG/zb9EfCFrheOnqRtGX
H6THtMmk3/zEzi5t9LE1jyga5Gc2abi7S28etEDRmhqj/dk50wgfO5/itRV9wbD6
a+CFo6POYtIumoA+P6O8XBJ8bU6Mkf8FrpcJpwToPiSS3rApkK7N2YOLLq6nfOUm
CtP2ROXYpj4RXXISJ2pwhoaqaS09wiZa3pk4neTy3GVLDCUOFmF55OR+bcWGL4Mi
8GO6h3tJigdPTRv91yWa+t4lu5d5yrDm4PK2iG1PpYeRM0gyVi0=
=UPSI
-----END PGP SIGNATURE-----
```

You'll notice this is a very similar signature block to the one that wraps the digital challenge coin certificate. However, this variant is designed to be kept and maintained as a separate file, to allow the original artifact (the licensed asset in this case) to be preserved in its original form, and for ease of use.

See also [Detached signatures](https://www.gnupg.org/gph/en/manual/x135.html#AEN160) from *The GNU Privacy Handbook*.

### Verifying the Digital Challenge Coin Asset with its Detached Signature
1. If necessary, locate a copy of the signer's full PGP public key at one or more of the [key servers listed](#list-of-key-servers) using the 160-bit fingerprint shown on the back of the coin (denoted by an image of a fingerprint). The hexadecimal groups comprise the full 160-bit PGP fingerprint of the Issuer. ALWAYS verify the fingerprint and signer's identity for accuracy before continuing.
2. Using a valid PGP signature verification method (see Resources below), provide the original asset with the detached signature to verify.

### Resources
- [Verify a detached signature GnuPG](https://www.gnupg.org/gph/en/manual/x135.html)

## Types of MB Challenge Coins
MB Challenge Coins are generally assigned a single type, as a means of distinguishing the context in which the coin was originally issued.

The following types have been disclosed to date:

|Type|Description|
|---|---|
|`TYPE I (UNARMORED)`|Coins in this class are most widely issued to commemorate attendance or achievement. These coins are aliased so, not for reasons of deficiency or flippant use, but simply because that when they are designed, they will feature a translucent armor when compared to their armored counterpart. Thus, the so-called "UNARMORED" coin still remains a restricted license, only permitted for use by their respective assignees.|
|`TYPE II (ARMORED)`|Coins in this class are generally issued under more specific contexts which may not appropriately fall under the `TYPE I` class. As such, they are necessarily custom designed to address the specific use, may share license with other applicable assignees, and are distinguished by the solid fill armor when compared to their translucent counterpart. Between the two types (`I` and `II`), coverage of all anticipated use cases should be near 100%.|
|`TYPE III (SPECIAL)`|Coins in this class may or may not be armored and may or may not have a defined purpose. In fact, they're so special, they may or may not even exist (yet)!|

## MB Challenge Coin Editions
The following editions have been disclosed to date:

|Edition|Type|Issue Date|Official Description (Partial)|
|---|---|---|---|
|Trust Coin|`II`|2022-01-29|...A TOKEN OF HIGH RECOGNITION AND GRATITUDE FOR AN INDIVIDUAL’S SELF-INITIATIVE IN MATTERS PERTAINING TO INFORMATION SECURITY, RISK MITIGATION, DUE DILIGENCE AND HUMILITY, AS OBSERVED. ... [IT] SERVES AS A REMINDER TO ITS ORIGINAL DESIGNER, WHO HE "NOW TRUSTS" WILL CONTINUE TO THE EXTENT POSSIBLE: A DEFENDER OF INDUSTRY AND A PROPONENT OF BEST PRACTICES.|
|Practice Coin|`II`|2022-02-08|...A REAL ISSUE ARTIFACT EMBEDDING THE HIGHLIGHTED PRINCIPLE OF PERFECTION HELD: IT IS NOT THAT YOU PRACTICE, BUT "WHAT YOU PRACTICE." ... DULY LICENSED TO ATTENDEES OF THE SPRING '22 LECTURE, APPLIED PRINCIPLES IN SOFTWARE ENGINEERING BY MATT BORJA, DISCUSSING PRINCIPLES PERTAINING TO: SINGLE RESPONSIBILITY, WHAT YOU PRACTICE, DOING ONE THING WELL, EVERYTHING IMPORTANT, OPPORTUNITY, AND EXCELLENCE OVER LICENSE.|
|Principle Coin|`II`|Scheduled|DULY LICENSED TO FALL '22 ATTENDEES OF AN ANTICIPATED FOLLOW-UP TO THE SPRING '22 LECTURE, APPLIED PRINCIPLES IN SOFTWARE ENGINEERING BY MATT BORJA.|

## List of Key Servers
The Issuer's PGP public key can be located by searching for the enclosed fingerprint at one or more key servers, including but not limited to:
  - [keybase.io](https://keybase.io/mattborja/pgp_keys.asc?fingerprint=f30ff4fc936584574ee3251833688c2edc08cd38)
  - [keys.openpgp.org](https://keys.openpgp.org/vks/v1/by-fingerprint/F30FF4FC936584574EE3251833688C2EDC08CD38)
  - [keyserver.ubuntu.com](https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xf30ff4fc936584574ee3251833688c2edc08cd38)
  - [keyserver.pgp.com](https://keyserver.pgp.com/vkd/DownloadKey.event?keyid=0x33688C2EDC08CD38)
  - [pgp.mit.edu](https://pgp.mit.edu/pks/lookup?op=get&search=0xf30ff4fc936584574ee3251833688c2edc08cd38)

**Important:** ALWAYS verify the fingerprint and signer's identity for accuracy before continuing.

## License and Usage
### Digital Challenge Coin Issues
All MB Digital Challenge Coin Certificates and Digital Asset(s) exercise copyright restrictions and are licensed for exclusive use by the copyright holder, to only the named Assignee(s). All materials are considered invalid and unauthorized for use without proof of assignment via signature verification.

### This Guide
[![Creative Commons License](https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc-nd/4.0/)  
MB (Matt Borja's) Digital Challenge Coins — Guide by [Matt Borja](https://gist.github.com/mattborja/02542f05caedf55c497116cb5248e7f7) is licensed under a [Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License](http://creativecommons.org/licenses/by-nc-nd/4.0/). Based on a work at [https://gist.github.com/mattborja/02542f05caedf55c497116cb5248e7f7](https://gist.github.com/mattborja/02542f05caedf55c497116cb5248e7f7).

## Copyright
Copyright &copy; 2022 [Matt Borja](https://mattborja.dev/)

## Document History
- [From Feb. 1-16, '22](https://gist.github.com/mattborja/02542f05caedf55c497116cb5248e7f7)
- [Current](https://github.com/mattborja/mattborja.dev/commits/master/_posts/2022-02-01-mb-digital-challenge-coins.md)
