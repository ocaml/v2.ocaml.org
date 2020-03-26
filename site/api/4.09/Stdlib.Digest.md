<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stdlib.Digest</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Stdlib.Digest.html">Stdlib.Digest</a></h1>

<pre><span id="MODULEDigest"><span class="keyword">module</span> Digest</span>: <code class="type"><a href="Digest.html">Digest</a></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">string</code> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of digests: 16-character strings.</p>
</div>
</div>


<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Digest.html#TYPEt">t</a> -&gt; <a href="Digest.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>The comparison function for 16-character digest, with the same
    specification as <a href="Stdlib.html#VALcompare"><code class="code">compare</code></a> and the implementation
    shared with <a href="String.html#VALcompare"><code class="code"><span class="constructor">String</span>.compare</code></a>. Along with the type <code class="code">t</code>, this
    function <code class="code">compare</code> allows the module <code class="code"><span class="constructor">Digest</span></code> to be passed as
    argument to the functors <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a> and <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.00.0</li>
</ul>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type"><a href="Digest.html#TYPEt">t</a> -&gt; <a href="Digest.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>The equal function for 16-character digest.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.03.0</li>
</ul>
</div>

<pre><span id="VALstring"><span class="keyword">val</span> string</span> : <code class="type">string -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return the digest of the given string.</p>
</div>
</div>

<pre><span id="VALbytes"><span class="keyword">val</span> bytes</span> : <code class="type">bytes -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return the digest of the given byte sequence.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.02.0</li>
</ul>
</div>

<pre><span id="VALsubstring"><span class="keyword">val</span> substring</span> : <code class="type">string -&gt; int -&gt; int -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Digest</span>.substring&nbsp;s&nbsp;ofs&nbsp;len</code> returns the digest of the substring
   of <code class="code">s</code> starting at index <code class="code">ofs</code> and containing <code class="code">len</code> characters.</p>
</div>
</div>

<pre><span id="VALsubbytes"><span class="keyword">val</span> subbytes</span> : <code class="type">bytes -&gt; int -&gt; int -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Digest</span>.subbytes&nbsp;s&nbsp;ofs&nbsp;len</code> returns the digest of the subsequence
    of <code class="code">s</code> starting at index <code class="code">ofs</code> and containing <code class="code">len</code> bytes.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.02.0</li>
</ul>
</div>

<pre><span id="VALchannel"><span class="keyword">val</span> channel</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; int -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>If <code class="code">len</code> is nonnegative, <code class="code"><span class="constructor">Digest</span>.channel&nbsp;ic&nbsp;len</code> reads <code class="code">len</code>
   characters from channel <code class="code">ic</code> and returns their digest, or raises
   <code class="code"><span class="constructor">End_of_file</span></code> if end-of-file is reached before <code class="code">len</code> characters
   are read.  If <code class="code">len</code> is negative, <code class="code"><span class="constructor">Digest</span>.channel&nbsp;ic&nbsp;len</code> reads
   all characters from <code class="code">ic</code> until end-of-file is reached and return
   their digest.</p>
</div>
</div>

<pre><span id="VALfile"><span class="keyword">val</span> file</span> : <code class="type">string -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return the digest of the file whose name is given.</p>
</div>
</div>

<pre><span id="VALoutput"><span class="keyword">val</span> output</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; <a href="Digest.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Write a digest on the given output channel.</p>
</div>
</div>

<pre><span id="VALinput"><span class="keyword">val</span> input</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Read a digest from the given input channel.</p>
</div>
</div>

<pre><span id="VALto_hex"><span class="keyword">val</span> to_hex</span> : <code class="type"><a href="Digest.html#TYPEt">t</a> -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>Return the printable hexadecimal representation of the given digest.
    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the argument is not exactly 16 bytes.</p>
</div>
</div>

<pre><span id="VALfrom_hex"><span class="keyword">val</span> from_hex</span> : <code class="type">string -&gt; <a href="Digest.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Convert a hexadecimal representation back into the corresponding digest.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the argument is not exactly 32 hexadecimal
   characters.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.00.0</li>
</ul>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>