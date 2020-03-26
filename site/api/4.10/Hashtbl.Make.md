<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Hashtbl.Make</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_Hashtbl.Make.html">Hashtbl.Make</a></h1>

<pre><span id="MODULEMake"><span class="keyword">module</span> Make</span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">H</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Hashtbl.HashedType.html">HashedType</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Hashtbl.S.html">S</a></code><code class="type">  with type key = H.t</code></div></pre><div class="info module top">
<div class="info-desc">
<p>Functor building an implementation of the hashtable structure.
    The functor <code class="code"><span class="constructor">Hashtbl</span>.<span class="constructor">Make</span></code> returns a structure containing
    a type <code class="code">key</code> of keys and a type <code class="code"><span class="keywordsign">'</span>a&nbsp;t</code> of hash tables
    associating data of type <code class="code"><span class="keywordsign">'</span>a</code> to keys of type <code class="code">key</code>.
    The operations perform similarly to those of the generic
    interface, but use the hashing and equality functions
    specified in the functor argument <code class="code"><span class="constructor">H</span></code> instead of generic
    equality and hashing.  Since the hash function is not seeded,
    the <code class="code">create</code> operation of the result structure always returns
    non-randomized hash tables.</p>
</div>
</div>
<table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>H</code></td>
<td align="center" valign="top">:</td>
<td><code class="type"><a href="Hashtbl.HashedType.html">HashedType</a></code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<pre><span id="TYPEkey"><span class="keyword">type</span> <code class="type"></code>key</span> </pre>


<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> </pre>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">int -&gt; 'a <a href="Hashtbl.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALclear"><span class="keyword">val</span> clear</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALreset"><span class="keyword">val</span> reset</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.00.0</li>
</ul>
</div>

<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; 'a <a href="Hashtbl.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; <a href="Hashtbl.S.html#TYPEkey">key</a> -&gt; 'a -&gt; unit</code></pre>
<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; <a href="Hashtbl.S.html#TYPEkey">key</a> -&gt; unit</code></pre>
<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; <a href="Hashtbl.S.html#TYPEkey">key</a> -&gt; 'a</code></pre>
<pre><span id="VALfind_opt"><span class="keyword">val</span> find_opt</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; <a href="Hashtbl.S.html#TYPEkey">key</a> -&gt; 'a option</code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>

<pre><span id="VALfind_all"><span class="keyword">val</span> find_all</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; <a href="Hashtbl.S.html#TYPEkey">key</a> -&gt; 'a list</code></pre>
<pre><span id="VALreplace"><span class="keyword">val</span> replace</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; <a href="Hashtbl.S.html#TYPEkey">key</a> -&gt; 'a -&gt; unit</code></pre>
<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; <a href="Hashtbl.S.html#TYPEkey">key</a> -&gt; bool</code></pre>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">(<a href="Hashtbl.S.html#TYPEkey">key</a> -&gt; 'a -&gt; unit) -&gt; 'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALfilter_map_inplace"><span class="keyword">val</span> filter_map_inplace</span> : <code class="type">(<a href="Hashtbl.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'a option) -&gt; 'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.03.0</li>
</ul>
</div>

<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">(<a href="Hashtbl.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'b -&gt; 'b) -&gt; 'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; 'b -&gt; 'b</code></pre>
<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; int</code></pre>
<pre><span id="VALstats"><span class="keyword">val</span> stats</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; <a href="Hashtbl.html#TYPEstatistics">Hashtbl.statistics</a></code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.00.0</li>
</ul>
</div>

<pre><span id="VALto_seq"><span class="keyword">val</span> to_seq</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; (<a href="Hashtbl.S.html#TYPEkey">key</a> * 'a) <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALto_seq_keys"><span class="keyword">val</span> to_seq_keys</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; <a href="Hashtbl.S.html#TYPEkey">key</a> <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALto_seq_values"><span class="keyword">val</span> to_seq_values</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; 'a <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALadd_seq"><span class="keyword">val</span> add_seq</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; (<a href="Hashtbl.S.html#TYPEkey">key</a> * 'a) <a href="Seq.html#TYPEt">Seq.t</a> -&gt; unit</code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALreplace_seq"><span class="keyword">val</span> replace_seq</span> : <code class="type">'a <a href="Hashtbl.S.html#TYPEt">t</a> -&gt; (<a href="Hashtbl.S.html#TYPEkey">key</a> * 'a) <a href="Seq.html#TYPEt">Seq.t</a> -&gt; unit</code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALof_seq"><span class="keyword">val</span> of_seq</span> : <code class="type">(<a href="Hashtbl.S.html#TYPEkey">key</a> * 'a) <a href="Seq.html#TYPEt">Seq.t</a> -&gt; 'a <a href="Hashtbl.S.html#TYPEt">t</a></code></pre><div class="info ">
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>