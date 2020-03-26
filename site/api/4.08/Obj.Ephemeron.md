<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Obj.Ephemeron</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Obj.Ephemeron.html">Obj.Ephemeron</a></h1>

<pre><span id="MODULEEphemeron"><span class="keyword">module</span> Ephemeron</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Obj.Ephemeron.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">
<p>Ephemeron with arbitrary arity and untyped</p>

<pre><span id="TYPEobj_t"><span class="keyword">type</span> <code class="type"></code>obj_t</span> = <code class="type"><a href="Obj.html#TYPEt">Obj.t</a></code> </pre>
<div class="info ">
<div class="info-desc">
<p>alias for <a href="Obj.html#TYPEt"><code class="code"><span class="constructor">Obj</span>.t</code></a></p>
</div>
</div>


<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>an ephemeron cf <a href="Ephemeron.html"><code class="code"><span class="constructor">Ephemeron</span></code></a></p>
</div>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">int -&gt; <a href="Obj.Ephemeron.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">create&nbsp;n</code> returns an ephemeron with <code class="code">n</code> keys.
      All the keys and the data are initially empty.
      The argument <code class="code">n</code> must be between zero
      and <a href="Obj.Ephemeron.html#VALmax_ephe_length"><code class="code"><span class="constructor">Obj</span>.<span class="constructor">Ephemeron</span>.max_ephe_length</code></a> (limits included).</p>
</div>
</div>

<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type"><a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>return the number of keys</p>
</div>
</div>

<pre><span id="VALget_key"><span class="keyword">val</span> get_key</span> : <code class="type"><a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; int -&gt; <a href="Obj.Ephemeron.html#TYPEobj_t">obj_t</a> option</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALget_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_key</code></a></p>
</div>
</div>

<pre><span id="VALget_key_copy"><span class="keyword">val</span> get_key_copy</span> : <code class="type"><a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; int -&gt; <a href="Obj.Ephemeron.html#TYPEobj_t">obj_t</a> option</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALget_key_copy"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_key_copy</code></a></p>
</div>
</div>

<pre><span id="VALset_key"><span class="keyword">val</span> set_key</span> : <code class="type"><a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; int -&gt; <a href="Obj.Ephemeron.html#TYPEobj_t">obj_t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALset_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.set_key</code></a></p>
</div>
</div>

<pre><span id="VALunset_key"><span class="keyword">val</span> unset_key</span> : <code class="type"><a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; int -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALunset_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.unset_key</code></a></p>
</div>
</div>

<pre><span id="VALcheck_key"><span class="keyword">val</span> check_key</span> : <code class="type"><a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; int -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALcheck_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.check_key</code></a></p>
</div>
</div>

<pre><span id="VALblit_key"><span class="keyword">val</span> blit_key</span> : <code class="type"><a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; int -&gt; <a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALblit_key"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.blit_key</code></a></p>
</div>
</div>

<pre><span id="VALget_data"><span class="keyword">val</span> get_data</span> : <code class="type"><a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; <a href="Obj.Ephemeron.html#TYPEobj_t">obj_t</a> option</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALget_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_data</code></a></p>
</div>
</div>

<pre><span id="VALget_data_copy"><span class="keyword">val</span> get_data_copy</span> : <code class="type"><a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; <a href="Obj.Ephemeron.html#TYPEobj_t">obj_t</a> option</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALget_data_copy"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.get_data_copy</code></a></p>
</div>
</div>

<pre><span id="VALset_data"><span class="keyword">val</span> set_data</span> : <code class="type"><a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; <a href="Obj.Ephemeron.html#TYPEobj_t">obj_t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALset_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.set_data</code></a></p>
</div>
</div>

<pre><span id="VALunset_data"><span class="keyword">val</span> unset_data</span> : <code class="type"><a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALunset_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.unset_data</code></a></p>
</div>
</div>

<pre><span id="VALcheck_data"><span class="keyword">val</span> check_data</span> : <code class="type"><a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALcheck_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.check_data</code></a></p>
</div>
</div>

<pre><span id="VALblit_data"><span class="keyword">val</span> blit_data</span> : <code class="type"><a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; <a href="Obj.Ephemeron.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Ephemeron.K1.html#VALblit_data"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.blit_data</code></a></p>
</div>
</div>

<pre><span id="VALmax_ephe_length"><span class="keyword">val</span> max_ephe_length</span> : <code class="type">int</code></pre><div class="info ">
<div class="info-desc">
<p>Maximum length of an ephemeron, ie the maximum number of keys an
      ephemeron could contain</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>