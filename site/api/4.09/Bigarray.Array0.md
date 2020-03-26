<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Bigarray.Array0</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Bigarray.Array0.html">Bigarray.Array0</a></h1>

<pre><span id="MODULEArray0"><span class="keyword">module</span> Array0</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Bigarray.Array0.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Zero-dimensional arrays. The <code class="code"><span class="constructor">Array0</span></code> structure provides operations
   similar to those of <a href="Bigarray.Genarray.html"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span></code></a>, but specialized to the case
   of zero-dimensional arrays that only contain a single scalar value.
   Statically knowing the number of dimensions of the array allows
   faster operations, and more precise static type-checking.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">('a, 'b, 'c)</code> t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of zero-dimensional Bigarrays whose elements have
     OCaml type <code class="code"><span class="keywordsign">'</span>a</code>, representation kind <code class="code"><span class="keywordsign">'</span>b</code>, and memory layout <code class="code"><span class="keywordsign">'</span>c</code>.</p>
</div>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a> -&gt;<br>       'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt; ('a, 'b, 'c) <a href="Bigarray.Array0.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Array0</span>.create&nbsp;kind&nbsp;layout</code> returns a new Bigarray of zero dimension.
     <code class="code">kind</code> and <code class="code">layout</code> determine the array element kind and the array
     layout as described for <a href="Bigarray.Genarray.html#VALcreate"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.create</code></a>.</p>
</div>
</div>

<pre><span id="VALkind"><span class="keyword">val</span> kind</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array0.html#TYPEt">t</a> -&gt; ('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return the kind of the given Bigarray.</p>
</div>
</div>

<pre><span id="VALlayout"><span class="keyword">val</span> layout</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array0.html#TYPEt">t</a> -&gt; 'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return the layout of the given Bigarray.</p>
</div>
</div>

<pre><span id="VALchange_layout"><span class="keyword">val</span> change_layout</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array0.html#TYPEt">t</a> -&gt;<br>       'd <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt; ('a, 'b, 'd) <a href="Bigarray.Array0.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Array0</span>.change_layout&nbsp;a&nbsp;layout</code> returns a Bigarray with the
      specified <code class="code">layout</code>, sharing the data with <code class="code">a</code>. No copying of elements
      is involved: the new array and the original array share the same
      storage space.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.06.0</li>
</ul>
</div>

<pre><span id="VALsize_in_bytes"><span class="keyword">val</span> size_in_bytes</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array0.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">size_in_bytes&nbsp;a</code> is <code class="code">a</code>'s <a href="Bigarray.html#VALkind_size_in_bytes"><code class="code"><span class="constructor">Bigarray</span>.kind_size_in_bytes</code></a>.</p>
</div>
</div>

<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array0.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Array0</span>.get&nbsp;a</code> returns the only element in <code class="code">a</code>.</p>
</div>
</div>

<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array0.html#TYPEt">t</a> -&gt; 'a -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Array0</span>.set&nbsp;a&nbsp;x&nbsp;v</code> stores the value <code class="code">v</code> in <code class="code">a</code>.</p>
</div>
</div>

<pre><span id="VALblit"><span class="keyword">val</span> blit</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array0.html#TYPEt">t</a> -&gt; ('a, 'b, 'c) <a href="Bigarray.Array0.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Copy the first Bigarray to the second Bigarray.
     See <a href="Bigarray.Genarray.html#VALblit"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.blit</code></a> for more details.</p>
</div>
</div>

<pre><span id="VALfill"><span class="keyword">val</span> fill</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array0.html#TYPEt">t</a> -&gt; 'a -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Fill the given Bigarray with the given value.
     See <a href="Bigarray.Genarray.html#VALfill"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.fill</code></a> for more details.</p>
</div>
</div>

<pre><span id="VALof_value"><span class="keyword">val</span> of_value</span> : <code class="type">('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a> -&gt;<br>       'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt; 'a -&gt; ('a, 'b, 'c) <a href="Bigarray.Array0.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Build a zero-dimensional Bigarray initialized from the
     given value.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>