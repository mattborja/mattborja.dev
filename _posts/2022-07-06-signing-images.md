# Signing Images
Something I find rather peculiar is the ability to add arbitrary, extraneous data to the end of a PNG or JPG file without disrupting image viewers' ability to render the image in plain sight. An example of this is outlined below (see [Proof of Concept](#proof-of-concept)).

## Proof of Concept

1. Create optimized, 67-byte sample PNG image: 1x1 white square:
    
    ```bash
    echo 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABAQAAAAA3bvkkAAAACklEQVR42mNuAAAAiACExGhMWAAAAABJRU5ErkJggg==' | base64 -d > 1x1.png
    ```
2. Inspect raw file with hex dump (xxd):
    
    ```bash
    $ xxd 1x1.png

    00000000: 8950 4e47 0d0a 1a0a 0000 000d 4948 4452  .PNG........IHDR
    00000010: 0000 0001 0000 0001 0100 0000 0037 6ef9  .............7n.
    00000020: 2400 0000 0a49 4441 5478 da63 6e00 0000  $....IDATx.cn...
    00000030: 8800 84c4 684c 5800 0000 0049 454e 44ae  ....hLX....IEND.
    00000040: 4260 82                                  B`.
    ```
3. Append arbitrary data to the end of the file and inspect:
    
    ```bash
    $ echo -n "\nHello, I'm arbitrary data.\n" >> 1x1.png
    
    $ xxd 1x1.png
    00000000: 8950 4e47 0d0a 1a0a 0000 000d 4948 4452  .PNG........IHDR
    00000010: 0000 0001 0000 0001 0100 0000 0037 6ef9  .............7n.
    00000020: 2400 0000 0a49 4441 5478 da63 6e00 0000  $....IDATx.cn...
    00000030: 8800 84c4 684c 5800 0000 0049 454e 44ae  ....hLX....IEND.
    00000040: 4260 820a 4865 6c6c 6f2c 2049 276d 2061  B`..Hello, I'm a
    00000050: 7262 6974 7261 7279 2064 6174 612e 0a    rbitrary data..
    ```
4. Verify the file (**1x1.png**) still renders correctly in your preferred image viewer and note the difference in file size (+28 bytes including newline characters)

## Licensing
Before we get ahead of ourselves, we have a preliminary that needs to be addressed: What *differentiates* between two \[signed\] versions of the same image?

Answer: **Licensing.** Enter [xmpRights:UsageTerms](https://developer.adobe.com/xmp/docs/XMPNamespaces/xmpRights/).

Below is a sample CSV export of some license-relevant [IPTC Core metadata](https://iptc.org/std/photometadata/specification/IPTC-PhotoMetadata#metadata-properties) exported using [exiftool](https://exiftool.org/):

```csv
SourceFile,WebStatement,Creator,CreatorWorkURL,CreatorWorkEmail,ImageCreator,CopyrightOwner,Licensor,Rights,Title,UsageTerms,DateTimeOriginal
*,https://mattborja.dev/,Matt Borja,https://mattborja.dev/,drm@mattborja.dev,Matt Borja,Matt Borja,Matt Borja,© 2022 Matt Borja,Sample 1x1 PNG image,This image is licensed exclusively to myself.,2022:07:06 00:00:00
```

IPTC reference for the above CSV:
- [Web Statement of Rights](https://iptc.org/std/photometadata/specification/IPTC-PhotoMetadata#web-statement-of-rights)
- [Image Creator]([ImageCreator](https://iptc.org/std/photometadata/specification/IPTC-PhotoMetadata#image-creator))
- [Creator](https://iptc.org/std/photometadata/specification/IPTC-PhotoMetadata#creator)
- [Creator Contact Information](https://iptc.org/std/photometadata/specification/IPTC-PhotoMetadata#contact-information-structure)
  - [Web URL(s)](https://iptc.org/std/photometadata/specification/IPTC-PhotoMetadata#web-urls)
  - [Email Addresses](https://iptc.org/std/photometadata/specification/IPTC-PhotoMetadata#email-addresses)
- [Date Created](https://iptc.org/std/photometadata/specification/IPTC-PhotoMetadata#date-created)
- [Copyright Notice](https://iptc.org/std/photometadata/specification/IPTC-PhotoMetadata#copyright-notice)
- [Copyright Owner](https://iptc.org/std/photometadata/specification/IPTC-PhotoMetadata#copyright-owner)
- [Licensor](https://iptc.org/std/photometadata/specification/IPTC-PhotoMetadata#licensor)
- [Rights Usage Terms](https://iptc.org/std/photometadata/specification/IPTC-PhotoMetadata#rights-usage-terms)


You can modify and save these tag values in a CSV file (i.e. **my-image-license.exif**) for applying creator, copyright and licensing information consistently in the future:

```bash
$ exiftool -csv=my-image-license.exif.csv my-licensed-image.png
```

## Signing
Now that you've embedded creator, copyright, and licensing information into the image itself, the last step is to sign it cryptographically using one of two methods:

1. [Detach-sign](https://www.gnupg.org/gph/en/manual/x135.html#AEN160) the image (2 files)
2. (Advanced) Clearsign the image and remove the PGP headers to restore image viewability (1 file)

Below is the process I use for embedding a clearsign PGP signature and verifying it later on (option 2).

1. Cryptographically clearsign the licensed image file while truncating PGP headers (first 3 lines):
    
    ```bash
    $ gpg --output - --clearsign my-licensed-image.png | tail -n +4 > my-licensed-image.signed.png
    ```
    
    Note: At this point, **my-licensed-image.signed.png** is ready to go, but you should proceed to ensure the file can still be verified when needed.
3. When verifying, provide a temporary PGP signature header file and use to reconstruct a clearsigned message:
    
    ```bash
    $ echo -n "-----BEGIN PGP SIGNED MESSAGE-----\nHash: SHA512\n\n" > /tmp/pgp-signature-headers.txt
    $ cat /tmp/pgp-signature-headers.txt my-licensed-image.signed.png | gpg --verify
    
    gpg: Signature made Thu Jul  7 01:08:19 2022 MST
    gpg:                using RSA key 4825E83F4674AA2EFE8C19CEA63229A4B4CC23D9
    gpg: Good signature from "Matt Borja (General use signing key for message authentication) <me@mattborja.dev>" [ultimate]
    gpg:                 aka "[jpeg image of size 7251]" [ultimate]
    ```

If you were to inspect the newly licensed and cryptographically signed image using a hex editor, you would see the following payload order:

1. Image header (PNG)
2. The `<xpacket />` block containing RDF metadata (i.e. creator, copyright, and license information conveyed via IPTC tags)
3. PGP signature (end of file)

```bash
$ xxd my-licensed-image.signed.png

# Image header (PNG)
00000000: 8950 4e47 0d0a 1a0a 0000 000d 4948 4452  .PNG........IHDR
00000010: 0000 012c 0000 012c 0403 0000 008b 5393  ...,...,......S.
00000020: 4600 0000 1850 4c54 45ff ffff 0808 0800  F....PLTE.......
00000030: 0000 3434 3436 3636 c8c8 c8f4 f4f4 caca  ..444666........
...

# <xpacket /> block containing RDF metadata (i.e. creator, copyright, and license information conveyed via IPTC tags)
00000080: 2e78 6d70 0000 0000 003c 3f78 7061 636b  .xmp.....<?xpack
00000090: 6574 2062 6567 696e 3d27 efbb bf27 2069  et begin='...' i
000000a0: 643d 2757 354d 304d 7043 6568 6948 7a72  d='W5M0MpCehiHzr
000000b0: 6553 7a4e 5463 7a6b 6339 6427 3f3e 0a3c  eSzNTczkc9d'?>.<
000000c0: 783a 786d 706d 6574 6120 786d 6c6e 733a  x:xmpmeta xmlns:
000000d0: 783d 2761 646f 6265 3a6e 733a 6d65 7461  x='adobe:ns:meta
000000e0: 2f27 2078 3a78 6d70 746b 3d27 496d 6167  /' x:xmptk='Imag
000000f0: 653a 3a45 7869 6654 6f6f 6c20 3132 2e34  e::ExifTool 12.4
00000100: 3027 3e0a 3c72 6466 3a52 4446 2078 6d6c  0'>.<rdf:RDF xml
00000110: 6e73 3a72 6466 3d27 6874 7470 3a2f 2f77  ns:rdf='http://w
00000120: 7777 2e77 332e 6f72 672f 3139 3939 2f30  ww.w3.org/1999/0
00000130: 322f 3232 2d72 6466 2d73 796e 7461 782d  2/22-rdf-syntax-
00000140: 6e73 2327 3e0a 0a20 3c72 6466 3a44 6573  ns#'>.. <rdf:Des
...
00000300: 2f27 3e0a 2020 3c64 633a 6372 6561 746f  /'>.  <dc:creato
00000310: 723e 0a20 2020 3c72 6466 3a53 6571 3e0a  r>.   <rdf:Seq>.
00000320: 2020 2020 3c72 6466 3a6c 693e 4d61 7474      <rdf:li>Matt
00000330: 2042 6f72 6a61 3c2f 7264 663a 6c69 3e0a   Borja</rdf:li>.
00000340: 2020 203c 2f72 6466 3a53 6571 3e0a 2020     </rdf:Seq>.  
00000350: 3c2f 6463 3a63 7265 6174 6f72 3e0a 2020  </dc:creator>.  
00000360: 3c64 633a 7269 6768 7473 3e0a 2020 203c  <dc:rights>.   <
00000370: 7264 663a 416c 743e 0a20 2020 203c 7264  rdf:Alt>.    <rd
00000380: 663a 6c69 2078 6d6c 3a6c 616e 673d 2778  f:li xml:lang='x
00000390: 2d64 6566 6175 6c74 273e c2a9 2032 3032  -default'>.. 202
000003a0: 3220 4d61 7474 2042 6f72 6a61 3c2f 7264  2 Matt Borja</rd
000003b0: 663a 6c69 3e0a 2020 203c 2f72 6466 3a41  f:li>.   </rdf:A
000003c0: 6c74 3e0a 2020 3c2f 6463 3a72 6967 6874  lt>.  </dc:right
000003d0: 733e 0a20 203c 6463 3a74 6974 6c65 3e0a  s>.  <dc:title>.
...
000004b0: 732f 273e 0a20 203c 786d 7052 6967 6874  s/'>.  <xmpRight
000004c0: 733a 5573 6167 6554 6572 6d73 3e0a 2020  s:UsageTerms>.  
000004d0: 203c 7264 663a 416c 743e 0a20 2020 203c   <rdf:Alt>.    <
000004e0: 7264 663a 6c69 2078 6d6c 3a6c 616e 673d  rdf:li xml:lang=
000004f0: 2778 2d64 6566 6175 6c74 273e 5468 6973  'x-default'>This
00000500: 2069 6d61 6765 2069 7320 6c69 6365 6e73   image is licens
00000510: 6564 2065 7863 6c75 7369 7665 6c79 2074  ed exclusively t
00000520: 6f20 6d79 7365 6c66 2e3c 2f72 6466 3a6c  o myself.</rdf:l
00000530: 693e 0a20 2020 3c2f 7264 663a 416c 743e  i>.   </rdf:Alt>
00000540: 0a20 203c 2f78 6d70 5269 6768 7473 3a55  .  </xmpRights:U
00000550: 7361 6765 5465 726d 733e 0a20 203c 786d  sageTerms>.  <xm
00000560: 7052 6967 6874 733a 5765 6253 7461 7465  pRights:WebState
00000570: 6d65 6e74 3e68 7474 7073 3a2f 2f6d 6174  ment>https://mat
00000580: 7462 6f72 6a61 2e64 6576 2f3c 2f78 6d70  tborja.dev/</xmp
00000590: 5269 6768 7473 3a57 6562 5374 6174 656d  Rights:WebStatem
000005a0: 656e 743e 0a20 3c2f 7264 663a 4465 7363  ent>. </rdf:Desc
000005b0: 7269 7074 696f 6e3e 0a3c 2f72 6466 3a52  ription>.</rdf:R
000005c0: 4446 3e0a 3c2f 783a 786d 706d 6574 613e  DF>.</x:xmpmeta>
...
# PGP signature (end of file)
000015e0: b6de 1ffa 0000 0000 4945 4e44 ae42 6082  ........IEND.B`.
000015f0: 0a2d 2d2d 2d2d 4245 4749 4e20 5047 5020  .-----BEGIN PGP 
00001600: 5349 474e 4154 5552 452d 2d2d 2d2d 0a0a  SIGNATURE-----..
00001610: 6951 497a 4241 4542 4367 4164 4669 4545  iQIzBAEBCgAdFiEE
00001620: 5343 586f 5030 5a30 7169 372b 6a42 6e4f  SCXoP0Z0qi7+jBnO
00001630: 706a 4970 704c 544d 4939 6b46 416d 4c47  pjIppLTMI9kFAmLG
00001640: 6c33 6f41 4367 6b51 706a 4970 704c 544d  l3oACgkQpjIppLTM
...
000018f0: 4831 6941 516a 4e68 4d56 3531 6166 4c69  H1iAQjNhMV51afLi
00001900: 5339 612b 5247 3776 3251 7378 4334 3d0a  S9a+RG7v2QsxC4=.
00001910: 3d78 3130 590a 2d2d 2d2d 2d45 4e44 2050  =x10Y.-----END P
00001920: 4750 2053 4947 4e41 5455 5245 2d2d 2d2d  GP SIGNATURE----
00001930: 2d0a                                     -.
```

To the untrained eye, opening this image renders the original without any visible difference. But to the duly initiated, it augments embedded IPTC metadata with cryptographically strong signatures (PGP) to assert both integrity and origin for the creator, copyright, and license information specified.

## Enforcement
There is one small caveat to this, however. It is still possible for a malicious user to strip this information from the file as trivially as they are already able to strip IPTC metadata. For this reason, it becomes imperative to invest into two things (outside the scope of this article):
1. ID authority, and
2. historicity (i.e. consider the authority of a website domain; once it's been registered, it cannot be easily occupied by another and the longer it's around, the more it will assert its reputation, as with credit history).

Consider uploading your licensed and signed artifacts to the [Internet Archive](https://archive.org/about/) as a method for officially registering their timestamps. This way, you have some additional evidence proving origin with historicity.
