<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Ephemeron.Kn</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Ephemeron.Kn.html">Ephemeron.Kn</a></h1>

<pre><span id="MODULEKn"><span class="keyword">module</span> Kn</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ephemeron.Kn.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">('k, 'd)</code> t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>an ephemeron with an arbitrary number of keys
                      of the same type</p>
</div>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">int -&gt; ('k, 'd) <a href="Ephemeron.Kn.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALcreate"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.create</code></a></p>
</div>
</div>

<pre><span id="VALget_key"><span class="keyword">val</span> get_key</span> : <code class="type">('k, 'd) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt; int -&gt; 'k option</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALget_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_key</code></a></p>
</div>
</div>

<pre><span id="VALget_key_copy"><span class="keyword">val</span> get_key_copy</span> : <code class="type">('k, 'd) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt; int -&gt; 'k option</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALget_key_copy"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_key_copy</code></a></p>
</div>
</div>

<pre><span id="VALset_key"><span class="keyword">val</span> set_key</span> : <code class="type">('k, 'd) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt; int -&gt; 'k -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALset_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.set_key</code></a></p>
</div>
</div>

<pre><span id="VALunset_key"><span class="keyword">val</span> unset_key</span> : <code class="type">('k, 'd) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt; int -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALunset_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.unset_key</code></a></p>
</div>
</div>

<pre><span id="VALcheck_key"><span class="keyword">val</span> check_key</span> : <code class="type">('k, 'd) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt; int -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALcheck_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.check_key</code></a></p>
</div>
</div>

<pre><span id="VALblit_key"><span class="keyword">val</span> blit_key</span> : <code class="type">('k, 'a) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt;<br>       int -&gt; ('k, 'b) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALblit_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.blit_key</code></a></p>
</div>
</div>

<pre><span id="VALget_data"><span class="keyword">val</span> get_data</span> : <code class="type">('k, 'd) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt; 'd option</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALget_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_data</code></a></p>
</div>
</div>

<pre><span id="VALget_data_copy"><span class="keyword">val</span> get_data_copy</span> : <code class="type">('k, 'd) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt; 'd option</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALget_data_copy"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_data_copy</code></a></p>
</div>
</div>

<pre><span id="VALset_data"><span class="keyword">val</span> set_data</span> : <code class="type">('k, 'd) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt; 'd -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALset_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.set_data</code></a></p>
</div>
</div>

<pre><span id="VALunset_data"><span class="keyword">val</span> unset_data</span> : <code class="type">('k, 'd) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALunset_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.unset_data</code></a></p>
</div>
</div>

<pre><span id="VALcheck_data"><span class="keyword">val</span> check_data</span> : <code class="type">('k, 'd) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALcheck_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.check_data</code></a></p>
</div>
</div>

<pre><span id="VALblit_data"><span class="keyword">val</span> blit_data</span> : <code class="type">('k, 'd) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt; ('k, 'd) <a href="Ephemeron.Kn.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALblit_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.blit_data</code></a></p>
</div>
</div>

<pre><span id="MODULEMake"><span class="keyword">module</span> <a href="Ephemeron.Kn.Make.html">Make</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">H</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Hashtbl.HashedType.html">Hashtbl.HashedType</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Ephemeron.S.html">Ephemeron.S</a></code><code class="type">  with type key = H.t array</code></div></pre><div class="info">
<p>Functor building an implementation of a weak hash table</p>

</div>

<pre><span id="MODULEMakeSeeded"><span class="keyword">module</span> <a href="Ephemeron.Kn.MakeSeeded.html">MakeSeeded</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">H</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Hashtbl.SeededHashedType.html">Hashtbl.SeededHashedType</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Ephemeron.SeededS.html">Ephemeron.SeededS</a></code><code class="type">  with type key = H.t array</code></div></pre><div class="info">
<p>Functor building an implementation of a weak hash table.</p>

</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>