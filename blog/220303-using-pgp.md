---
permalink: /blog/220303-using-pgp
---
# Using PGP
Notes on using PGP.

## Resources

### OpenPGP Best Practices
See https://help.riseup.net/en/security/message-security/openpgp/best-practices

### SecureApt (Debian)
See https://wiki.debian.org/SecureApt#How_to_find_and_add_a_key


### Securing Debian Manual
```
7.5.3.6 Finding the key for a repository
The debian-archive-keyring package is used to distribute keys to apt. Upgrades to this package can add (or remove) gpg keys for the main Debian archive.

For other archives, there is not yet a standard location where you can find the key for a given apt repository. There's a rough standard of putting the key up on the web page for the repository or as a file in the repository itself, but no real standard, so you might have to hunt for it.

The Debian archive signing key is available at http://ftp-master.debian.org/ziyi_key_2006.asc (replace 2006 with current year).[58]

gpg itself has a standard way to distribute keys, using a keyserver that gpg can download a key from and add it to its keyring. For example:

     $ gpg --keyserver pgpkeys.mit.edu --recv-key 2D230C5F
     gpg: requesting key 2D230C5F from hkp server pgpkeys.mit.edu
     gpg: key 2D230C5F: public key "Debian Archive Automatic Signing Key (2006) <ftpm
     aster@debian.org>" imported
     gpg: Total number processed: 1
     gpg:               imported: 1
You can then export that key from your own keyring and feed it to apt-key:

     $ gpg -a --export 2D230C5F | sudo apt-key add -
     gpg: no ultimately trusted keys found
     OK
The "gpg: no ultimately trusted keys found" warning means that gpg was not configured to ultimately trust a specific key. Trust settings are part of OpenPGPs Web-of-Trust which does not apply here. So there is no problem with this warning. In typical setups the user's own key is ultimately trusted.

7.5.3.7 Safely adding a key
By adding a key to apt's keyring, you're telling apt to trust everything signed by the key, and this lets you know for sure that apt won't install anything not signed by the person who possesses the private key. But if you're sufficiently paranoid, you can see that this just pushes things up a level, now instead of having to worry if a package, or a Release file is valid, you can worry about whether you've actually gotten the right key. Is the http://ftp-master.debian.org/ziyi_key_2006.asc file mentioned above really Debian's archive signing key, or has it been modified (or this document lies).

It's good to be paranoid in security, but verifying things from here is harder. gpg has the concept of a chain of trust, which can start at someone you're sure of, who signs someone's key, who signs some other key, etc., until you get to the archive key. If you're sufficiently paranoid you'll want to check that your archive key is signed by a key that you can trust, with a trust chain that goes back to someone you know personally. If you want to do this, visit a Debian conference or perhaps a local LUG for a key signing [59].

If you can't afford this level of paranoia, do whatever feels appropriate to you when adding a new apt source and a new key. Maybe you'll want to mail the person providing the key and verify it, or maybe you're willing to take your chances with downloading it and assuming you got the real thing. The important thing is that by reducing the problem to what archive keys to trust, secure apt lets you be as careful and secure as it suits you to be.

7.5.3.8 Verifying key integrity
You can verify the fingerprint as well as the signatures on the key. Retrieving the fingerprint can be done for multiple sources, you can check The Debian System Book, talk to Debian Developers on IRC, read the mailing list where the key change will be announced or any other additional means to verify the fingerprint. For example you can do this:

     $ GET http://ftp-master.debian.org/ziyi_key_2006.asc | gpg --import
     gpg: key 2D230C5F: public key "Debian Archive Automatic Signing Key (2006)
       <ftpmaster&debian.org>" imported
     gpg: Total number processed: 1
     gpg:               imported: 1
     $ gpg --check-sigs --fingerprint 2D230C5F
     pub   1024D/2D230C5F 2006-01-03 [expires: 2007-02-07]
           Key fingerprint = 0847 50FC 01A6 D388 A643  D869 0109 0831 2D23 0C5F
     uid   Debian Archive Automatic Signing Key (2006) <ftpmaster@debian.org>
     sig!3        2D230C5F 2006-01-03  Debian Archive Automatic Signing Key
                                       (2006) <ftpmaster@debian.org>
     sig!         2A4E3EAA 2006-01-03  Anthony Towns <aj@azure.humbug.org.au>
     sig!         4F368D5D 2006-01-03  Debian Archive Automatic Signing Key
                                       (2005) <ftpmaster@debian.org>
     sig!         29982E5A 2006-01-04  Steve Langasek <vorlon@dodds.net>
     sig!         FD6645AB 2006-01-04  Ryan Murray <rmurray@cyberhqz.com>
     sig!         AB2A91F5 2006-01-04  James Troup <james@nocrew.org>
and then check the trust path from your key (or a key you trust) to at least one of the keys used to sign the archive key. If you are sufficiently paranoid you will tell apt to trust the key only if you find an acceptable path:

     $ gpg --export -a 2D230C5F | sudo apt-key add -
     Ok
Note that the key is signed with the previous archive key, so theoretically you can just build on your previous trust.
```
Source: https://web.archive.org/web/20200328044932/https://www.debian.org/doc/manuals/securing-debian-howto/ch7
