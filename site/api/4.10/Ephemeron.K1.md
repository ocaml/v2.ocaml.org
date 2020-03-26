<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Ephemeron.K1</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Ephemeron.K1.html">Ephemeron.K1</a></h1>

<pre><span id="MODULEK1"><span class="keyword">module</span> K1</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ephemeron.K1.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">('k, 'd)</code> t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>an ephemeron with one key</p>
</div>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">unit -&gt; ('k, 'd) <a href="Ephemeron.K1.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.create&nbsp;()</code> creates an ephemeron with one key. The
      data and the key are empty</p>
</div>
</div>

<pre><span id="VALget_key"><span class="keyword">val</span> get_key</span> : <code class="type">('k, 'd) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; 'k option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_key&nbsp;eph</code> returns <code class="code"><span class="constructor">None</span></code> if the key of <code class="code">eph</code> is
      empty, <code class="code"><span class="constructor">Some</span>&nbsp;x</code> (where <code class="code">x</code> is the key) if it is full.</p>
</div>
</div>

<pre><span id="VALget_key_copy"><span class="keyword">val</span> get_key_copy</span> : <code class="type">('k, 'd) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; 'k option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_key_copy&nbsp;eph</code> returns <code class="code"><span class="constructor">None</span></code> if the key of <code class="code">eph</code> is
      empty, <code class="code"><span class="constructor">Some</span>&nbsp;x</code> (where <code class="code">x</code> is a (shallow) copy of the key) if
      it is full. This function has the same GC friendliness as <a href="Weak.html#VALget_copy"><code class="code"><span class="constructor">Weak</span>.get_copy</code></a></p>

<p>If the element is a custom block it is not copied.</p>
</div>
</div>

<pre><span id="VALset_key"><span class="keyword">val</span> set_key</span> : <code class="type">('k, 'd) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; 'k -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.set_key&nbsp;eph&nbsp;el</code> sets the key of <code class="code">eph</code> to be a
      (full) key to <code class="code">el</code></p>
</div>
</div>

<pre><span id="VALunset_key"><span class="keyword">val</span> unset_key</span> : <code class="type">('k, 'd) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.unset_key&nbsp;eph&nbsp;el</code> sets the key of <code class="code">eph</code> to be an
      empty key. Since there is only one key, the ephemeron starts
      behaving like a reference on the data.</p>
</div>
</div>

<pre><span id="VALcheck_key"><span class="keyword">val</span> check_key</span> : <code class="type">('k, 'd) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.check_key&nbsp;eph</code> returns <code class="code"><span class="keyword">true</span></code> if the key of the <code class="code">eph</code>
      is full, <code class="code"><span class="keyword">false</span></code> if it is empty. Note that even if
      <code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.check_key&nbsp;eph</code> returns <code class="code"><span class="keyword">true</span></code>, a subsequent
      <a href="Ephemeron.K1.html#VALget_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_key</code></a><code class="code">eph</code> can return <code class="code"><span class="constructor">None</span></code>.</p>
</div>
</div>

<pre><span id="VALblit_key"><span class="keyword">val</span> blit_key</span> : <code class="type">('k, 'a) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; ('k, 'b) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.blit_key&nbsp;eph1&nbsp;eph2</code> sets the key of <code class="code">eph2</code> with
      the key of <code class="code">eph1</code>. Contrary to using <a href="Ephemeron.K1.html#VALget_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_key</code></a>
      followed by <a href="Ephemeron.K1.html#VALset_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.set_key</code></a> or <a href="Ephemeron.K1.html#VALunset_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.unset_key</code></a>
      this function does not prevent the incremental GC from erasing
      the value in its current cycle.</p>
</div>
</div>

<pre><span id="VALget_data"><span class="keyword">val</span> get_data</span> : <code class="type">('k, 'd) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; 'd option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_data&nbsp;eph</code> returns <code class="code"><span class="constructor">None</span></code> if the data of <code class="code">eph</code> is
      empty, <code class="code"><span class="constructor">Some</span>&nbsp;x</code> (where <code class="code">x</code> is the data) if it is full.</p>
</div>
</div>

<pre><span id="VALget_data_copy"><span class="keyword">val</span> get_data_copy</span> : <code class="type">('k, 'd) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; 'd option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_data_copy&nbsp;eph</code> returns <code class="code"><span class="constructor">None</span></code> if the data of <code class="code">eph</code> is
      empty, <code class="code"><span class="constructor">Some</span>&nbsp;x</code> (where <code class="code">x</code> is a (shallow) copy of the data) if
      it is full. This function has the same GC friendliness as <a href="Weak.html#VALget_copy"><code class="code"><span class="constructor">Weak</span>.get_copy</code></a></p>

<p>If the element is a custom block it is not copied.</p>
</div>
</div>

<pre><span id="VALset_data"><span class="keyword">val</span> set_data</span> : <code class="type">('k, 'd) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; 'd -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.set_data&nbsp;eph&nbsp;el</code> sets the data of <code class="code">eph</code> to be a
      (full) data to <code class="code">el</code></p>
</div>
</div>

<pre><span id="VALunset_data"><span class="keyword">val</span> unset_data</span> : <code class="type">('k, 'd) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.unset_data&nbsp;eph&nbsp;el</code> sets the key of <code class="code">eph</code> to be an
      empty key. The ephemeron starts behaving like a weak pointer.</p>
</div>
</div>

<pre><span id="VALcheck_data"><span class="keyword">val</span> check_data</span> : <code class="type">('k, 'd) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.check_data&nbsp;eph</code> returns <code class="code"><span class="keyword">true</span></code> if the data of the <code class="code">eph</code>
      is full, <code class="code"><span class="keyword">false</span></code> if it is empty. Note that even if
      <code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.check_data&nbsp;eph</code> returns <code class="code"><span class="keyword">true</span></code>, a subsequent
      <a href="Ephemeron.K1.html#VALget_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_data</code></a><code class="code">eph</code> can return <code class="code"><span class="constructor">None</span></code>.</p>
</div>
</div>

<pre><span id="VALblit_data"><span class="keyword">val</span> blit_data</span> : <code class="type">('a, 'd) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; ('b, 'd) <a href="Ephemeron.K1.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.blit_data&nbsp;eph1&nbsp;eph2</code> sets the data of <code class="code">eph2</code> with
      the data of <code class="code">eph1</code>. Contrary to using <a href="Ephemeron.K1.html#VALget_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_data</code></a>
      followed by <a href="Ephemeron.K1.html#VALset_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.set_data</code></a> or <a href="Ephemeron.K1.html#VALunset_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.unset_data</code></a>
      this function does not prevent the incremental GC from erasing
      the value in its current cycle.</p>
</div>
</div>

<pre><span id="MODULEMake"><span class="keyword">module</span> <a href="Ephemeron.K1.Make.html">Make</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">H</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Hashtbl.HashedType.html">Hashtbl.HashedType</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Ephemeron.S.html">Ephemeron.S</a></code><code class="type">  with type key = H.t</code></div></pre><div class="info">
<p>Functor building an implementation of a weak hash table</p>

</div>

<pre><span id="MODULEMakeSeeded"><span class="keyword">module</span> <a href="Ephemeron.K1.MakeSeeded.html">MakeSeeded</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">H</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Hashtbl.SeededHashedType.html">Hashtbl.SeededHashedType</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Ephemeron.SeededS.html">Ephemeron.SeededS</a></code><code class="type">  with type key = H.t</code></div></pre><div class="info">
<p>Functor building an implementation of a weak hash table.</p>

</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>