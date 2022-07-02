# Crypto Implementation (DRAFT)
Last updated: March 30, 2015
by Matt Borja

**Version 1.0** (January 22, 2014)

## Preface
**Important.** If you're in a hurry to apply these methods, don't be. The construction of this document is the result of hours of research, testing, and endured scrutiny of the agonizing sort. Please read the following sections carefully and take time to study the list of [References](#references) below.

## Purpose
The purpose of this project is to stay up to date on the latest best practices in cryptography while streamlining implementation by providing developers with quick references and code examples.

Many times developers avoid crypto altogether because they've been admonished time and time again "you're doing it wrong." This document is aimed at those as an aid to help them "do it right."

## Objectives
1. Clearly and concisely establish best practices for crypto implementation
2. Demonstrate the proper way to cipher, hash, sign, and apply message authentication
3. Garner feedback and actively maintain methodologies and procedures outlined in this document

## Application
**Version 1.0 -** The methodologies outlined in this version apply to the encryption and decryption of text strings containing sensitive information (i.e. passwords, messages, etc) where the application or application server is both the origin and intended recipient of encrypted strings and a site-wide secret key is used. This approach should be considered as a first step toward improving your password storage scheme, and not its final destination.

## Algorithms
Only the following algorithms are being considered for use by this document at this time:

### Salting, Hashing and Key Derivation
* Scrypt (recommended)
* Bcrypt
* Password-Based Key Derivation Function 2 (PBKDF2)

### Ciphering
* AES-128-CBC

## Parameters (Definitions)
* **Plaintext** - A string containing sensitive information you wish to encrypt
* **Passphrase** - Your master key for encryption and decryption
* **Key Derivation Function (KDF)** - Master key hashing used to mitigate weak passphrases
* **Salt** - A non-secret KDF parameter used to mitigate dictionary attacks on a *secret key*
* **Initialization Vector (IV)** - A one-time use cryptographically strong random value used to begin a cipher
* **Message Authentication Code (MAC)** - A checksum used to manually verify the integrity and origin of a ciphertext

## Procedures
Developers work in various languages and are sometimes providentially hindered from using libraries for one reason or another. The following provides some general guidelines for implementing crypto properly should you be left to writing a library on your own.

### Ciphering (Encryption)
The following procedure for ciphering assumes the use of **AES-128-CBC**.

1. **Generate a hashed master key.** Use a Key Derivation Function to derive the hashed value of your master key. Some KDFs (such as the variable length [Scrypt](https://github.com/barrysteyn/node-scrypt#kdf) or fixed length [Bcrypt](https://github.com/ncb000gt/node.bcrypt.js/#api)) will generate a *salt* for you during hashing. Otherwise, you will need to provide one.

2. **Generate keys for ciphering and MAC.** Deriving two (2) separate keys using your *hashed master key* from Step 1 is recommended before ciphering and creating a message authentication code. One method for doing this is to use **HKDF-Expand** as running KDF multiple times is not recommend for performance reasons. Alternatively, if your KDF has a configurable output size (like Scrypt), you may opt to extract the first half of your *hashed master key* as the key for ciphering and extract the second half for generating the MAC.

3. **Generate a unique Initialization Vector.** A new Initialization Vector (or IV for short) must be generated each time you run a cipher, even if you are encrypting the same message twice. To achieve *semantic security*, under no circumstances should a cipher re-use an IV.

4. **Generate ciphertext.** Encrypt your plaintext using the *key for ciphering* from Step 2 and the *Initialization Vector* from Step 3. This will produce your *ciphertext*.

5. **Generate message authentication code.** Proceed to generate a message authentication code (or MAC for short) for the *ciphertext* from Step 4 using the *key for generating the MAC* from Step 3. One method for doing this is to use **Hash-based Message Authentication Code (HMAC)**.

6. **Store the ciphertext with its message authentication code.** You will likely need to store the uniquely generated *Initialization Vector* from Step 3 with the ciphertext as this will also be required for decryption.

#### Things to consider when ciphering
* **Storing secret keys.** Both generated keys from Step 2 are considered to be *secret* and are required in the decryption process. As such, they should be stored appropriately.

* **Always verify ciphertext.** To mitigate data tampering, *ciphertext* should NOT be decrypted if its message authentication code doesn't check out. Discard it.

* **Authenticated encryption modes.** Other block cipher modes (i.e. OCB, GCM) provide both encryption and message authentication and require only a single key to implement.

* **System-wide secret key.** KDFs are used to "convert" a passphrase into something more secure. If you are using a system-wide secret key that is already in hash form (via KDF), there is no need to derive a new master key from it. Just use the one you already have.

* **Data swapping.** Message authentication may not be useful to your application in cases where the database record it is stored in has been swapped with another record by an attacker. In this case, the MAC then should also cover additional information specific to the record being requested.

## Methodologies

### Password Encryption for 3<sup>rd</sup> Party Services

One-way hashing of user passwords is the **strict standard** to abide by if you must store them for authentication purposes. Not storing passwords to begin with is even better. However, in the real world that we live in, with really unique use cases from one application to the next, it is not always possible to resort to one-way hashing for one reason or another due to business logic or some other requirement. That said, consider the following:

* You have a web application which users login to and a third party service users can access via your web application.
* The user specifies a *website password* which is different from their *service password*.

During initial account setup where both the *website password* and *service password* are obtained by the application:

1. **Encrypt Website Password.** The *website password* is first used to generate a *hashed master key* for encrypting the user's *service password*. The application may optionally encrypt the resultant service password ciphertext using its own site-wide secret key to add a layer of encryption if deemed appropriate.

2. **Hash Service Password.** Next, the application proceeds to securely hash the user's *website password* **one-way**.

3. **Encrypt Hash of Service Password.** Finally, the application uses a site-wide secret key to then encrypt the hashed website password.

4. **Decrypt/Verify Hash of Service Password.** Upon login, the application decrypts and verifies the hash against the user-supplied *website password*.

5. **Decrypt Website Password.** If hash has been verified, the user-supplied *website password* is used to decrypt their *service password*.

**Summary:** In a database theft scenario, this approach seeks to leave the attacker with only the *encrypted* website password hash and the encrypted service password. Should the application server also be compromised, thereby obtaining the site-wide secret key may), 

### Temporary Storage of "Same Password" Applications
Application security is a balancing act when it comes to determining how much security to implement in exchange for how many convenient features to give up, and vice versa. Depending on what resources are available to your application, you might consider the following scenario:

* You want to use one-way hashing to securely store and verify user passwords.
* You have access to RAM, Couchbase, or some other temporary storage location available.
* You may not have the option of requiring two distinct user passwords in your application.

One possible implementation might look like this:

1. **Hash User Password.** User password is hashed one-way during account setup and cannot be decrypted.

2. **Verify Password Hash.** Upon login, the application verifies the hash against the user-supplied *website password*.

3. **Encrypt User Password.** If hash has been verified, the application uses a site-wide secret key to encrypt the user-supplied *website password*.

4. **Store Encrypted Password Temporarily.** The application then *temporarily* stores the encrypted password but *must* ensure its prompt removal upon logout or timeout.

5. **Decrypt Password.** Upon request, the application retrieves and decrypts the password on behalf of the user as required.

## References
* [Cryptography Engineering - Schneier on Security](https://www.schneier.com/books/cryptography_engineering/)
* [A Padding Oracle Example - SkullSecurity](https://blog.skullsecurity.org/2013/a-padding-oracle-example)
* [How should you store a password that needs to be retrieved as plaintext? - StackExchange](http://security.stackexchange.com/a/24146)
* [Application Security FAQ - OWASP](https://www.owasp.org/index.php/OWASP_Application_Security_FAQ)
* [Generating a strong unique Initialization Vector - StackExchange](http://crypto.stackexchange.com/a/3093)
* [Semantic security - Wikipedia](http://en.wikipedia.org/wiki/Semantic_security)
* [Bcrypt as a KDF - StackExchange](http://security.stackexchange.com/a/10985)
* [Understanding the use of IVs - StackExchange](http://crypto.stackexchange.com/a/735)
* [Initialization vector - Wikipedia](http://en.wikipedia.org/wiki/Initialization_vector)
* [Key derivation function - Wikipedia](http://en.wikipedia.org/wiki/Key_derivation_function)
* [Message authentication code - Wikipedia](http://en.wikipedia.org/wiki/Message_authentication_code)
* [Oracle machine - Wikipedia](http://en.wikipedia.org/wiki/Oracle_machine)

## Mentions
* **kmc.** Guidance through articulation of overall encryption process, and requirements.
* **woggle.** Data integrity and theft concerns, data swapping, use of message authentication.
* **mm_freak_.** Concept of Password Encryption for 3rd Party Services for protecting passwords.
* **alexbobp.** Editorial and emphasis on design constraints regarding encryption of third party service passwords.

## License
MIT License

Copyright (c) 2022 Matt Borja

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
