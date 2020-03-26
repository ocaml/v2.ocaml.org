<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Digest</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Digest.html">Digest</a></h1>

<pre><span class="keyword">module</span> Digest: <code class="code"><span class="keyword">sig</span></code> <a href="Digest.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
MD5 message digest.
<p>

   This module provides functions to compute 128-bit 'digests' of
   arbitrary-length strings or files. The digests are of cryptographic
   quality: it is very hard, given a digest, to forge a string having
   that digest. The algorithm used is MD5. This module should not be
   used for secure and sensitive cryptographic applications. For these
   kind of applications more recent and stronger cryptographic
   primitives should be used instead.<br>
</p></div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">string</code> </pre>
<div class="info ">
The type of digests: 16-character strings.<br>
</div>


<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Digest.html#TYPEt">t</a> -&gt; <a href="Digest.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
The comparison function for 16-character digest, with the same
    specification as <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a> and the implementation
    shared with <a href="String.html#VALcompare"><code class="code"><span class="constructor">String</span>.compare</code></a>. Along with the type <code class="code">t</code>, this
    function <code class="code">compare</code> allows the module <code class="code"><span class="constructor">Digest</span></code> to be passed as
    argument to the functors <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a> and <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.<br>
<b>Since</b> 4.00.0<br>
</div>

<pre><span id="VALstring"><span class="keyword">val</span> string</span> : <code class="type">string -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
Return the digest of the given string.<br>
</div>

<pre><span id="VALbytes"><span class="keyword">val</span> bytes</span> : <code class="type">bytes -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
Return the digest of the given byte sequence.<br>
</div>

<pre><span id="VALsubstring"><span class="keyword">val</span> substring</span> : <code class="type">string -&gt; int -&gt; int -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Digest</span>.substring s ofs len</code> returns the digest of the substring
   of <code class="code">s</code> starting at index <code class="code">ofs</code> and containing <code class="code">len</code> characters.<br>
</div>

<pre><span id="VALsubbytes"><span class="keyword">val</span> subbytes</span> : <code class="type">bytes -&gt; int -&gt; int -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Digest</span>.subbytes s ofs len</code> returns the digest of the subsequence
   of <code class="code">s</code> starting at index <code class="code">ofs</code> and containing <code class="code">len</code> bytes.<br>
</div>

<pre><span id="VALchannel"><span class="keyword">val</span> channel</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; int -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
If <code class="code">len</code> is nonnegative, <code class="code"><span class="constructor">Digest</span>.channel ic len</code> reads <code class="code">len</code>
   characters from channel <code class="code">ic</code> and returns their digest, or raises
   <code class="code"><span class="constructor">End_of_file</span></code> if end-of-file is reached before <code class="code">len</code> characters
   are read.  If <code class="code">len</code> is negative, <code class="code"><span class="constructor">Digest</span>.channel ic len</code> reads
   all characters from <code class="code">ic</code> until end-of-file is reached and return
   their digest.<br>
</div>

<pre><span id="VALfile"><span class="keyword">val</span> file</span> : <code class="type">string -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
Return the digest of the file whose name is given.<br>
</div>

<pre><span id="VALoutput"><span class="keyword">val</span> output</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; <a href="Digest.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
Write a digest on the given output channel.<br>
</div>

<pre><span id="VALinput"><span class="keyword">val</span> input</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
Read a digest from the given input channel.<br>
</div>

<pre><span id="VALto_hex"><span class="keyword">val</span> to_hex</span> : <code class="type"><a href="Digest.html#TYPEt">t</a> -&gt; string</code></pre><div class="info ">
Return the printable hexadecimal representation of the given digest.<br>
</div>

<pre><span id="VALfrom_hex"><span class="keyword">val</span> from_hex</span> : <code class="type">string -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
Convert a hexadecimal representation back into the corresponding digest.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the argument is not exactly 32 hexadecimal
   characters.<br>
<b>Since</b> 4.00.0<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>