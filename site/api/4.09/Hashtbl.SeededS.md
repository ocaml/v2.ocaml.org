<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Hashtbl.SeededS</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_Hashtbl.SeededS.html">Hashtbl.SeededS</a></h1>

<pre><span id="MODULETYPESeededS"><span class="keyword">module type</span> SeededS</span> = <code class="code"><span class="keyword">sig</span></code> <a href="Hashtbl.SeededS.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info modtype top">
<div class="info-desc">
<p>The output signature of the functor <a href="Hashtbl.MakeSeeded.html"><code class="code"><span class="constructor">Hashtbl</span>.<span class="constructor">MakeSeeded</span></code></a>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.00.0</li>
</ul>
</div>
<hr width="100%">

<pre><span id="TYPEkey"><span class="keyword">type</span> <code class="type"></code>key</span> </pre>


<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> </pre>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">?random:bool -&gt; int -&gt; 'a <a href="Hashtbl.SeededS.html#TYPEt">t</a></code></pre>
<pre><span id="VALclear"><span class="keyword">val</span> clear</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALreset"><span class="keyword">val</span> reset</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; 'a <a href="Hashtbl.SeededS.html#TYPEt">t</a></code></pre>
<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; <a href="Hashtbl.SeededS.html#TYPEkey">key</a> -&gt; 'a -&gt; unit</code></pre>
<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; <a href="Hashtbl.SeededS.html#TYPEkey">key</a> -&gt; unit</code></pre>
<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; <a href="Hashtbl.SeededS.html#TYPEkey">key</a> -&gt; 'a</code></pre>
<pre><span id="VALfind_opt"><span class="keyword">val</span> find_opt</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; <a href="Hashtbl.SeededS.html#TYPEkey">key</a> -&gt; 'a option</code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>

<pre><span id="VALfind_all"><span class="keyword">val</span> find_all</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; <a href="Hashtbl.SeededS.html#TYPEkey">key</a> -&gt; 'a list</code></pre>
<pre><span id="VALreplace"><span class="keyword">val</span> replace</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; <a href="Hashtbl.SeededS.html#TYPEkey">key</a> -&gt; 'a -&gt; unit</code></pre>
<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; <a href="Hashtbl.SeededS.html#TYPEkey">key</a> -&gt; bool</code></pre>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">(<a href="Hashtbl.SeededS.html#TYPEkey">key</a> -&gt; 'a -&gt; unit) -&gt; 'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALfilter_map_inplace"><span class="keyword">val</span> filter_map_inplace</span> : <code class="type">(<a href="Hashtbl.SeededS.html#TYPEkey">key</a> -&gt; 'a -&gt; 'a option) -&gt; 'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.03.0</li>
</ul>
</div>

<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">(<a href="Hashtbl.SeededS.html#TYPEkey">key</a> -&gt; 'a -&gt; 'b -&gt; 'b) -&gt; 'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; 'b -&gt; 'b</code></pre>
<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; int</code></pre>
<pre><span id="VALstats"><span class="keyword">val</span> stats</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; <a href="Hashtbl.html#TYPEstatistics">Hashtbl.statistics</a></code></pre>
<pre><span id="VALto_seq"><span class="keyword">val</span> to_seq</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; (<a href="Hashtbl.SeededS.html#TYPEkey">key</a> * 'a) <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALto_seq_keys"><span class="keyword">val</span> to_seq_keys</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; <a href="Hashtbl.SeededS.html#TYPEkey">key</a> <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALto_seq_values"><span class="keyword">val</span> to_seq_values</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; 'a <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALadd_seq"><span class="keyword">val</span> add_seq</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; (<a href="Hashtbl.SeededS.html#TYPEkey">key</a> * 'a) <a href="Seq.html#TYPEt">Seq.t</a> -&gt; unit</code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALreplace_seq"><span class="keyword">val</span> replace_seq</span> : <code class="type">'a <a href="Hashtbl.SeededS.html#TYPEt">t</a> -&gt; (<a href="Hashtbl.SeededS.html#TYPEkey">key</a> * 'a) <a href="Seq.html#TYPEt">Seq.t</a> -&gt; unit</code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALof_seq"><span class="keyword">val</span> of_seq</span> : <code class="type">(<a href="Hashtbl.SeededS.html#TYPEkey">key</a> * 'a) <a href="Seq.html#TYPEt">Seq.t</a> -&gt; 'a <a href="Hashtbl.SeededS.html#TYPEt">t</a></code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>