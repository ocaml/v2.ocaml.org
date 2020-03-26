<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.InfiniteArray</a></div><ul></ul></nav></header>

<h1>Module <a href="type_CamlinternalMenhirLib.InfiniteArray.html">CamlinternalMenhirLib.InfiniteArray</a></h1>

<pre><span id="MODULEInfiniteArray"><span class="keyword">module</span> InfiniteArray</span>: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.InfiniteArray.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>This module implements infinite arrays. *</p>
</div>
</div>


<pre><span id="VALmake"><span class="keyword">val</span> make</span> : <code class="type">'a -&gt; 'a <a href="CamlinternalMenhirLib.InfiniteArray.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">make&nbsp;x</code> creates an infinite array, where every slot contains <code class="code">x</code>. *</p>
</div>
</div>

<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">'a <a href="CamlinternalMenhirLib.InfiniteArray.html#TYPEt">t</a> -&gt; int -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">get&nbsp;a&nbsp;i</code> returns the element contained at offset <code class="code">i</code> in the array <code class="code">a</code>.
   Slots are numbered 0 and up. *</p>
</div>
</div>

<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type">'a <a href="CamlinternalMenhirLib.InfiniteArray.html#TYPEt">t</a> -&gt; int -&gt; 'a -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">set&nbsp;a&nbsp;i&nbsp;x</code> sets the element contained at offset <code class="code">i</code> in the array
    <code class="code">a</code> to <code class="code">x</code>. Slots are numbered 0 and up. *</p>
</div>
</div>

<pre><span id="VALextent"><span class="keyword">val</span> extent</span> : <code class="type">'a <a href="CamlinternalMenhirLib.InfiniteArray.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">extent&nbsp;a</code> is the length of an initial segment of the array <code class="code">a</code>
    that is sufficiently large to contain all <code class="code">set</code> operations ever
    performed. In other words, all elements beyond that segment have
    the default value.</p>
</div>
</div>

<pre><span id="VALdomain"><span class="keyword">val</span> domain</span> : <code class="type">'a <a href="CamlinternalMenhirLib.InfiniteArray.html#TYPEt">t</a> -&gt; 'a array</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">domain&nbsp;a</code> is a fresh copy of an initial segment of the array <code class="code">a</code>
    whose length is <code class="code">extent&nbsp;a</code>.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>