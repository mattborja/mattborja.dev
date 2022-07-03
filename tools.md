---
layout: default
title: "Power Tools"
permalink: /tools.html
---
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

<h3 class="mt-4">More Tools</h3>
<p>For more tools, code snippets, and demos, check out <a href="https://codepen.io/mattborja" rel="nofollow">my CodePen</a>.</p>
