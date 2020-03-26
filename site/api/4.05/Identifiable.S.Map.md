<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Identifiable.S.Map</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Identifiable.S.Map.html">Identifiable.S.Map</a></h1>

<pre><span class="keyword">module</span> Map: <code class="code"><span class="keyword">sig</span></code> <a href="Identifiable.S.Map.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span class="keyword">include</span> <a href="Map.S.html">Map.S</a></pre>

<pre><span id="VALfilter_map"><span class="keyword">val</span> filter_map</span> : <code class="type">'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; f:(key -&gt; 'a -&gt; 'b option) -&gt; 'b <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a></code></pre>
<pre><span id="VALof_list"><span class="keyword">val</span> of_list</span> : <code class="type">(key * 'a) list -&gt; 'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a></code></pre>
<pre><span id="VALdisjoint_union"><span class="keyword">val</span> disjoint_union</span> : <code class="type">?eq:('a -&gt; 'a -&gt; bool) -&gt;<br>       ?print:(<a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; 'a -&gt; unit) -&gt;<br>       'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; 'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; 'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a></code></pre><div class="info ">
<code class="code">disjoint_union&nbsp;m1&nbsp;m2</code> contains all bindings from <code class="code">m1</code> and
        <code class="code">m2</code>. If some binding is present in both and the associated
        value is not equal, a Fatal_error is raised<br>
</div>

<pre><span id="VALunion_right"><span class="keyword">val</span> union_right</span> : <code class="type">'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; 'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; 'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a></code></pre><div class="info ">
<code class="code">union_right&nbsp;m1&nbsp;m2</code> contains all bindings from <code class="code">m1</code> and <code class="code">m2</code>. If
        some binding is present in both, the one from <code class="code">m2</code> is taken<br>
</div>

<pre><span id="VALunion_left"><span class="keyword">val</span> union_left</span> : <code class="type">'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; 'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; 'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a></code></pre><div class="info ">
<code class="code">union_left&nbsp;m1&nbsp;m2&nbsp;=&nbsp;union_right&nbsp;m2&nbsp;m1</code><br>
</div>

<pre><span id="VALunion_merge"><span class="keyword">val</span> union_merge</span> : <code class="type">('a -&gt; 'a -&gt; 'a) -&gt;<br>       'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; 'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; 'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a></code></pre>
<pre><span id="VALrename"><span class="keyword">val</span> rename</span> : <code class="type">key <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; key -&gt; key</code></pre>
<pre><span id="VALmap_keys"><span class="keyword">val</span> map_keys</span> : <code class="type">(key -&gt; key) -&gt; 'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; 'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a></code></pre>
<pre><span id="VALkeys"><span class="keyword">val</span> keys</span> : <code class="type">'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; Identifiable.S.Set.t</code></pre>
<pre><span id="VALdata"><span class="keyword">val</span> data</span> : <code class="type">'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; 'a list</code></pre>
<pre><span id="VALof_set"><span class="keyword">val</span> of_set</span> : <code class="type">(key -&gt; 'a) -&gt; Identifiable.S.Set.t -&gt; 'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a></code></pre>
<pre><span id="VALtranspose_keys_and_data"><span class="keyword">val</span> transpose_keys_and_data</span> : <code class="type">key <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; key <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a></code></pre>
<pre><span id="VALtranspose_keys_and_data_set"><span class="keyword">val</span> transpose_keys_and_data_set</span> : <code class="type">key <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; Identifiable.S.Set.t <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a></code></pre>
<pre><span id="VALprint"><span class="keyword">val</span> print</span> : <code class="type">(<a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; 'a -&gt; unit) -&gt;<br>       <a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; 'a <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; unit</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>