---
permalink: /book-of-verifications.html
---
# Book of Verifications
Following is a record of select PGP keys and a description of the distinct methods used to independently verify each. Your mileage may vary.

## Table of Contents
- [Verifying the Rocky Linux Official Signing Key](#pgp_verify-7051C470A929F454CEBE37B715AF5DAC6D745A60)
- Verifying `0xa85a05711d47a724`
- Verifying `0x01483f262a4b3ff0`
- Verifying `0x9a804e97d7079c77`
- Verifying `0x20d04e5a713660a7`
- Verifying `0xa0616a85ce41ad88`
- Verifying `0x378b845402277962`

## Verifying the Rocky Linux Official Signing Key
Key ID: `0x15AF5DAC6D745A60`

I'm generally interested in software and systems calibrated for the enterprise environment (and when I say "enterprise," I'm specifically referring to highly used, highly disruptive, environments easily targeted by highly trained attackers): so whether it's for personal or professional use, I still treat it as potentially compromised binaries (i.e. I don't install it) until I can verify their integrity and origin.

Unfortunately, the vendor was unable or unwilling to participate directly in verifying their key via exercise of its private key to decrypt a message I encrypted using their public key for the following reason given:

> The private component of the signing key is in a vault that we cannot use nor access by normal means as it is used in automation ... with these measures in place, we won't be able to decrypt your gpg message.

The key in question here is used to sign releases of the enterprise operating system I was looking to evaluate: [Rocky Linux](https://rockylinux.org/about).

### The Process

Unable to derive assurance from a decrypted message from the vendor, I proceeded to build a logical path to sufficiently verify this key for my purposes:

1.  Located contact information or usable [support channel](https://chat.rockylinux.org/ "General chat presumed to be attended by core team members; demonstrating association with and involvement in relevant work; with either opportunity for interactive key verification, else prior self-attestation of key ownership") for signer (via [download page](https://rockylinux.org/download/)).
2.  Located prior self-attestation of key ownership (`...5A60`):
    *   [thread](https://chat.rockylinux.org/rocky-linux/pl/xuwhf4iigfftujmdamynqeazay) by community member, _defractal_; and
    *   discovered [GitHub profile](https://github.com/NeilHanlon) of [co-founder](https://chat.rockylinux.org/rocky-linux/channels/town-square/a8m4hq3rcjdw9noyctwmit8kzw), and Team Admin, _Neil Hanlon_ via [thread](https://chat.rockylinux.org/rocky-linux/pl/czen111cq3g5fdpgn4jx8fzn4y) containing self-attestation of key fingerprint and cross-signature.
3.  [Located](https://github.com/rocky-linux/rockylinux.org/issues?q=gpg "Fingerprint of public key used to verify open source software are normally found within the same repository and expected to ship with releases") and independently verified affirmation and use of vendor's signing key via [Issue #205](https://github.com/rocky-linux/rockylinux.org/issues/205 "Issue description also presented hard copies of original key in question, in addition to other signing keys related to testing and infrastructure")

### Keys Verified

Using this process, ownership the following keys were minimally verified to a reasonable extent for my purposes:

*   `7051 C470 A929 F454 CEBE 37B7 15AF 5DAC 6D74 5A60`  
    Rocky Linux (Rocky Linux Official Signing Key)
*   `091A 4404 7C3D 8B7A 331F 5E18 5489 E42B BBE2 C108`  
    Rocky Linux Testing (Rocky Linux Testing Key)
*   `BFC3 D8F2 0D15 F4FD 4628 1D7F AA65 0F52 D6C0 94FA`  
    Core Infrastructure (Compose Signing Key)
