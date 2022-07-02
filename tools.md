---
layout: default
title: "Power Tools"
permalink: /tools.html
---
# Tools
                <p>These are just some of my cool tools (also, don't forget to check out <a href="https://codepen.io/mattborja" rel="nofollow">the pen</a>)...</p>
                <h3>A Password Generator</h3>
                <p>The following hand-formatted one-liner (i.e. minified) script uses the <a href="https://developer.mozilla.org/en-US/docs/Web/API/Web_Crypto_API" rel="nofollow">Web Crypto API</a> to generate an <em>epic password</em>: <strong>8,192 bytes</strong> (yes, characters) of <em>cryptographically strong</em> random values; locally, right inside your web browser with no information sent over the network. It is then hashed using SHA256 as a multipurpose function for:</p>
                <ul>
                    <li>hex-encoding the raw binary data,</li>
                    <li>reducing its size to a more realistic 64 bytes,</li>
                    <li>while maintaining its cryptographic strength using its <a href="https://en.wikipedia.org/wiki/SHA-2" rel="nofollow">SHA-2 cryptographic properties</a>.</li>
                </ul>
                <div class="my-5">
                    <div class="mb-3 p-3 bg-light font-monospace">
                        <pre class="m-0">(function (csrngSize=8192) {
  return window.crypto.subtle.digest('SHA-256', window.crypto.getRandomValues(new Uint8Array(csrngSize)))
   .then(function(buf) {
      return Array.prototype.map.call(new Uint8Array (buf) , function(x) { return ('00'+x).toString(16).slice(-2); })
              .join('');
  })
  .then(hash => alert('Here you go: ' + hash));
})();</pre>
                    </div>
                    <p><button class="btn btn-sm btn-dark" onclick="javascript:(function(csrngSize=8192){return window.crypto.subtle.digest('SHA-256',window.crypto.getRandomValues(new Uint8Array(csrngSize))).then(buf=>Array.prototype.map.call(new Uint8Array(buf),x=>(('00'+x.toString(16)).slice(-2))).join('')).then(hash=>alert('Here you go: ' + hash))})();">Try It!</button></p>
                </div>
                <p><a href="https://www.security.org/how-secure-is-my-password/" rel="nofollow">Some say a password of this stature</a> could take a computer as much as 3 <em>sesvigintillion</em>-ish years to crack. Though, I haven't exactly had a chance to verify that theory to date (and I'm not sure I'd want to, to be honest).</p>
                <h3 title="Yes, these values and descriptions were either generated or typed out all by hand...">ASCII Table</h3>
                <p>ASCII values ordered from left-to-right, top-to-bottom.</p>
                <h4>Input</h4>
                <p>Hover over <code class="border px-2" title="Description will appear here (and perhaps more)">CODE</code> for description.</p>
                <div class="row mb-4 text-muted font-monospace">
                    <div class="col-6 col-sm-4 col-md-3">0x00: <code class="border px-2" title="Null (null way, d00d! ya brah!)">NUL</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x01: <code class="border px-2" title="Start of heading">SOH</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x02: <code class="border px-2" title="Start of text">STX</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x03: <code class="border px-2" title="End of text">ETX</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x04: <code class="border px-2" title="End of transmission">EOT</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x05: <code class="border px-2" title="Enquiry">ENQ</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x06: <code class="border px-2" title="Acknowledgment">ACK</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x07: <code class="border px-2" title="Bell (ding!)">BEL</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x08: <code class="border px-2" title="Backspace (seriously)">BS</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x09: <code class="border px-2" title="Horizontal tab">HT</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x0a: <code class="border px-2" title="Line feed">LF</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x0b: <code class="border px-2" title="Vertical tab (I've never actually tried to use one of these, but it sounds interesting...)">VT</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x0c: <code class="border px-2" title="Form feed">FF</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x0d: <code class="border px-2" title="Carriage return">CR</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x0e: <code class="border px-2" title="Shift out (not StackOverflow)">SO</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x0f: <code class="border px-2" title="Shift in">SI</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x10: <code class="border px-2" title="Data link escape (Is your refridgerator running? Then you better...nevermind.">DLE</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x11: <code class="border px-2" title="Device control 1">DC1</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x12: <code class="border px-2" title="Device control 2">DC2</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x13: <code class="border px-2" title="Device control 3">DC3</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x14: <code class="border px-2" title="Device control 4">DC4</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x15: <code class="border px-2" title="Negative acknowledgment (...paddy-wack, give a dog a bone...)">NAK</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x16: <code class="border px-2" title="Synchronous idle">SYN</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x17: <code class="border px-2" title="End transmission block (time to get another one)">ETB</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x18: <code class="border px-2" title="Cancel (I think anything else would've been more intuitive)">CAN</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x19: <code class="border px-2" title="End of medium (I mean, it was an okay blog platform while it lasted)">EM</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x1a: <code class="border px-2" title="Substitute (this doesn't actually exist...)">SUB</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x1b: <code class="border px-2" title="Escape (DLE, Part Deux)">ESC</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x1c: <code class="border px-2" title="File separator (not file system)">FS</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x1d: <code class="border px-2" title="Group separator (not game server instance)">GS</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x1e: <code class="border px-2" title="Record separator (not RuneScape; more like CRLF on steroids)">RS</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x1f: <code class="border px-2" title="Unit separator (like 0x2c on steroids; also sounds interesting)">US</code></div>
                </div>
                <h4>Output</h4>
                <div class="row mb-4 text-muted font-monospace">
                    <div class="col-6 col-sm-4 col-md-3">0x20: <code class="border px-2" title="Space">SPC</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x21: <code class="border px-2">&#x21;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x22: <code class="border px-2">&#x22;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x23: <code class="border px-2">&#x23;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x24: <code class="border px-2">&#x24;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x25: <code class="border px-2">&#x25;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x26: <code class="border px-2">&#x26;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x27: <code class="border px-2">&#x27;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x28: <code class="border px-2">&#x28;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x29: <code class="border px-2">&#x29;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x2a: <code class="border px-2">&#x2a;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x2b: <code class="border px-2">&#x2b;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x2c: <code class="border px-2">&#x2c;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x2d: <code class="border px-2">&#x2d;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x2e: <code class="border px-2">&#x2e;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x2f: <code class="border px-2">&#x2f;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x30: <code class="border px-2">&#x30;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x31: <code class="border px-2">&#x31;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x32: <code class="border px-2">&#x32;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x33: <code class="border px-2">&#x33;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x34: <code class="border px-2">&#x34;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x35: <code class="border px-2">&#x35;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x36: <code class="border px-2">&#x36;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x37: <code class="border px-2">&#x37;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x38: <code class="border px-2">&#x38;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x39: <code class="border px-2">&#x39;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x3a: <code class="border px-2">&#x3a;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x3b: <code class="border px-2">&#x3b;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x3c: <code class="border px-2">&#x3c;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x3d: <code class="border px-2">&#x3d;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x3e: <code class="border px-2">&#x3e;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x3f: <code class="border px-2">&#x3f;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x40: <code class="border px-2">&#x40;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x41: <code class="border px-2">&#x41;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x42: <code class="border px-2">&#x42;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x43: <code class="border px-2">&#x43;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x44: <code class="border px-2">&#x44;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x45: <code class="border px-2">&#x45;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x46: <code class="border px-2">&#x46;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x47: <code class="border px-2">&#x47;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x48: <code class="border px-2">&#x48;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x49: <code class="border px-2">&#x49;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x4a: <code class="border px-2">&#x4a;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x4b: <code class="border px-2">&#x4b;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x4c: <code class="border px-2">&#x4c;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x4d: <code class="border px-2">&#x4d;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x4e: <code class="border px-2">&#x4e;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x4f: <code class="border px-2">&#x4f;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x50: <code class="border px-2">&#x50;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x51: <code class="border px-2">&#x51;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x52: <code class="border px-2">&#x52;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x53: <code class="border px-2">&#x53;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x54: <code class="border px-2">&#x54;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x55: <code class="border px-2">&#x55;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x56: <code class="border px-2">&#x56;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x57: <code class="border px-2">&#x57;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x58: <code class="border px-2">&#x58;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x59: <code class="border px-2">&#x59;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x5a: <code class="border px-2">&#x5a;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x5b: <code class="border px-2">&#x5b;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x5c: <code class="border px-2">&#x5c;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x5d: <code class="border px-2">&#x5d;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x5e: <code class="border px-2">&#x5e;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x5f: <code class="border px-2">&#x5f;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x60: <code class="border px-2">&#x60;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x61: <code class="border px-2">&#x61;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x62: <code class="border px-2">&#x62;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x63: <code class="border px-2">&#x63;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x64: <code class="border px-2">&#x64;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x65: <code class="border px-2">&#x65;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x66: <code class="border px-2">&#x66;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x67: <code class="border px-2">&#x67;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x68: <code class="border px-2">&#x68;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x69: <code class="border px-2">&#x69;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x6a: <code class="border px-2">&#x6a;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x6b: <code class="border px-2">&#x6b;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x6c: <code class="border px-2">&#x6c;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x6d: <code class="border px-2">&#x6d;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x6e: <code class="border px-2">&#x6e;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x6f: <code class="border px-2">&#x6f;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x70: <code class="border px-2">&#x70;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x71: <code class="border px-2">&#x71;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x72: <code class="border px-2">&#x72;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x73: <code class="border px-2">&#x73;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x74: <code class="border px-2">&#x74;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x75: <code class="border px-2">&#x75;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x76: <code class="border px-2">&#x76;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x77: <code class="border px-2">&#x77;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x78: <code class="border px-2">&#x78;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x79: <code class="border px-2">&#x79;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x7a: <code class="border px-2">&#x7a;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x7b: <code class="border px-2">&#x7b;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x7c: <code class="border px-2">&#x7c;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x7d: <code class="border px-2">&#x7d;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x7e: <code class="border px-2">&#x7e;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0x7f: <code class="border px-2" title="Delete">DEL</code></div>
                </div>
                <h4>Control Characters</h4>
                <p>Note: Control Characters are <a href="https://stackoverflow.com/a/5380136" rel="nofollow">disallowed by spec</a> and forbidden by W3C's validator and have thus been replaced by their image snapshot renditions below.</p>
                <div class="row mb-4 text-muted font-monospace">
                    <div class="col-12 col-md-6">
                        <a href="assets/img/ascii-cc-01.png" rel="nofollow"><img src="assets/img/ascii-cc-01.png" alt="ASCII Control Characters (1 of 2)" /></a>
                    </div>
                    <div class="col-12 col-md-6">
                        <a href="assets/img/ascii-cc-02.png" rel="nofollow"><img src="assets/img/ascii-cc-02.png" alt="ASCII Control Characters (2 of 2)" /></a>
                    </div>
                </div>
                <h4>Misc Characters<sup class="text-muted fs-6">†</sup></h4>
                <div class="row mb-4 text-muted font-monospace">
                    <div class="col-6 col-sm-4 col-md-3">0xa0: <code class="border px-2">&#xa0;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xa1: <code class="border px-2">&#xa1;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xa2: <code class="border px-2">&#xa2;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xa3: <code class="border px-2">&#xa3;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xa4: <code class="border px-2">&#xa4;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xa5: <code class="border px-2">&#xa5;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xa6: <code class="border px-2">&#xa6;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xa7: <code class="border px-2">&#xa7;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xa8: <code class="border px-2">&#xa8;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xa9: <code class="border px-2" title="Copyright">&#xa9;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xaa: <code class="border px-2">&#xaa;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xab: <code class="border px-2">&#xab;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xac: <code class="border px-2">&#xac;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xad: <code class="border px-2">&#xad;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xae: <code class="border px-2" title="Registered trademark">&#xae;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xaf: <code class="border px-2">&#xaf;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xb0: <code class="border px-2" title="Degree symbol">&#xb0;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xb1: <code class="border px-2">&#xb1;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xb2: <code class="border px-2">&#xb2;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xb3: <code class="border px-2">&#xb3;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xb4: <code class="border px-2">&#xb4;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xb5: <code class="border px-2">&#xb5;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xb6: <code class="border px-2">&#xb6;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xb7: <code class="border px-2">&#xb7;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xb8: <code class="border px-2">&#xb8;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xb9: <code class="border px-2">&#xb9;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xba: <code class="border px-2">&#xba;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xbb: <code class="border px-2">&#xbb;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xbc: <code class="border px-2">&#xbc;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xbd: <code class="border px-2">&#xbd;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xbe: <code class="border px-2">&#xbe;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xbf: <code class="border px-2">&#xbf;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xc0: <code class="border px-2">&#xc0;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xc1: <code class="border px-2">&#xc1;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xc2: <code class="border px-2">&#xc2;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xc3: <code class="border px-2">&#xc3;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xc4: <code class="border px-2">&#xc4;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xc5: <code class="border px-2">&#xc5;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xc6: <code class="border px-2">&#xc6;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xc7: <code class="border px-2">&#xc7;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xc8: <code class="border px-2">&#xc8;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xc9: <code class="border px-2">&#xc9;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xca: <code class="border px-2">&#xca;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xcb: <code class="border px-2">&#xcb;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xcc: <code class="border px-2">&#xcc;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xcd: <code class="border px-2">&#xcd;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xce: <code class="border px-2">&#xce;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xcf: <code class="border px-2">&#xcf;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xd0: <code class="border px-2">&#xd0;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xd1: <code class="border px-2">&#xd1;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xd2: <code class="border px-2">&#xd2;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xd3: <code class="border px-2">&#xd3;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xd4: <code class="border px-2">&#xd4;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xd5: <code class="border px-2">&#xd5;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xd6: <code class="border px-2">&#xd6;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xd7: <code class="border px-2">&#xd7;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xd8: <code class="border px-2">&#xd8;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xd9: <code class="border px-2">&#xd9;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xda: <code class="border px-2">&#xda;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xdb: <code class="border px-2">&#xdb;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xdc: <code class="border px-2">&#xdc;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xdd: <code class="border px-2">&#xdd;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xde: <code class="border px-2">&#xde;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xdf: <code class="border px-2">&#xdf;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xe0: <code class="border px-2">&#xe0;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xe1: <code class="border px-2">&#xe1;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xe2: <code class="border px-2">&#xe2;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xe3: <code class="border px-2">&#xe3;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xe4: <code class="border px-2">&#xe4;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xe5: <code class="border px-2">&#xe5;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xe6: <code class="border px-2">&#xe6;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xe7: <code class="border px-2">&#xe7;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xe8: <code class="border px-2">&#xe8;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xe9: <code class="border px-2">&#xe9;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xea: <code class="border px-2">&#xea;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xeb: <code class="border px-2">&#xeb;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xec: <code class="border px-2">&#xec;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xed: <code class="border px-2">&#xed;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xee: <code class="border px-2">&#xee;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xef: <code class="border px-2">&#xef;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xf0: <code class="border px-2">&#xf0;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xf1: <code class="border px-2">&#xf1;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xf2: <code class="border px-2">&#xf2;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xf3: <code class="border px-2">&#xf3;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xf4: <code class="border px-2">&#xf4;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xf5: <code class="border px-2">&#xf5;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xf6: <code class="border px-2">&#xf6;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xf7: <code class="border px-2">&#xf7;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xf8: <code class="border px-2">&#xf8;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xf9: <code class="border px-2">&#xf9;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xfa: <code class="border px-2">&#xfa;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xfb: <code class="border px-2">&#xfb;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xfc: <code class="border px-2">&#xfc;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xfd: <code class="border px-2">&#xfd;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xfe: <code class="border px-2">&#xfe;</code></div>
                    <div class="col-6 col-sm-4 col-md-3">0xff: <code class="border px-2">&#xff;</code></div>
                </div>
                <p><sup>†</sup>Haven't spent a lot of time with these, except for maybe a handful. If you would like to contribute descriptions, feel free to <a href="https://github.com/mattborja/mattborja.dev/pulls" rel="nofollow">submit a new Pull Request</a> and be sure to reference <a href="https://github.com/mattborja/mattborja.dev/issues/2" rel="nofollow">Issue#2</a>!</p>