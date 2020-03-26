<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">MoreLabels.Map.Make</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_MoreLabels.Map.Make.html">MoreLabels.Map.Make</a></h1>

<pre><span id="MODULEMake"><span class="keyword">module</span> Make</span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">Ord</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="MoreLabels.Map.OrderedType.html">OrderedType</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="MoreLabels.Map.S.html">S</a></code><code class="type"> 
    with type key = Ord.t
     and type 'a t = 'a <a href="Map.Make.html">Map.Make</a>(Ord).t</code></div></pre><table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>Ord</code></td>
<td align="center" valign="top">:</td>
<td><code class="type"><a href="MoreLabels.Map.OrderedType.html">OrderedType</a></code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<pre><span id="TYPEkey"><span class="keyword">type</span> <code class="type"></code>key</span> </pre>


<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">+'a</code> t</span> </pre>


<pre><span id="VALempty"><span class="keyword">val</span> empty</span> : <code class="type">'a <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALis_empty"><span class="keyword">val</span> is_empty</span> : <code class="type">'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type"><a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type">key:<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt;<br>       data:'a -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALupdate"><span class="keyword">val</span> update</span> : <code class="type">key:<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt;<br>       f:('a option -&gt; 'a option) -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALsingleton"><span class="keyword">val</span> singleton</span> : <code class="type"><a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type"><a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALmerge"><span class="keyword">val</span> merge</span> : <code class="type">f:(<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; 'a option -&gt; 'b option -&gt; 'c option) -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'b <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'c <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALunion"><span class="keyword">val</span> union</span> : <code class="type">f:(<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'a -&gt; 'a option) -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type">cmp:('a -&gt; 'a -&gt; int) -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; int</code></pre>
<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type">cmp:('a -&gt; 'a -&gt; bool) -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">f:(key:<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; data:'a -&gt; unit) -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">f:(key:<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; data:'a -&gt; 'b -&gt; 'b) -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; init:'b -&gt; 'b</code></pre>
<pre><span id="VALfor_all"><span class="keyword">val</span> for_all</span> : <code class="type">f:(<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; bool) -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALexists"><span class="keyword">val</span> exists</span> : <code class="type">f:(<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; bool) -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALfilter"><span class="keyword">val</span> filter</span> : <code class="type">f:(<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; bool) -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALpartition"><span class="keyword">val</span> partition</span> : <code class="type">f:(<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; bool) -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> * 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALcardinal"><span class="keyword">val</span> cardinal</span> : <code class="type">'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; int</code></pre>
<pre><span id="VALbindings"><span class="keyword">val</span> bindings</span> : <code class="type">'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; (<a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a) list</code></pre>
<pre><span id="VALmin_binding"><span class="keyword">val</span> min_binding</span> : <code class="type">'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a</code></pre>
<pre><span id="VALmin_binding_opt"><span class="keyword">val</span> min_binding_opt</span> : <code class="type">'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; (<a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a) option</code></pre>
<pre><span id="VALmax_binding"><span class="keyword">val</span> max_binding</span> : <code class="type">'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a</code></pre>
<pre><span id="VALmax_binding_opt"><span class="keyword">val</span> max_binding_opt</span> : <code class="type">'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; (<a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a) option</code></pre>
<pre><span id="VALchoose"><span class="keyword">val</span> choose</span> : <code class="type">'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a</code></pre>
<pre><span id="VALchoose_opt"><span class="keyword">val</span> choose_opt</span> : <code class="type">'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; (<a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a) option</code></pre>
<pre><span id="VALsplit"><span class="keyword">val</span> split</span> : <code class="type"><a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> * 'a option * 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type"><a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'a</code></pre>
<pre><span id="VALfind_opt"><span class="keyword">val</span> find_opt</span> : <code class="type"><a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'a option</code></pre>
<pre><span id="VALfind_first"><span class="keyword">val</span> find_first</span> : <code class="type">f:(<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; bool) -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a</code></pre>
<pre><span id="VALfind_first_opt"><span class="keyword">val</span> find_first_opt</span> : <code class="type">f:(<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; bool) -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; (<a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a) option</code></pre>
<pre><span id="VALfind_last"><span class="keyword">val</span> find_last</span> : <code class="type">f:(<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; bool) -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a</code></pre>
<pre><span id="VALfind_last_opt"><span class="keyword">val</span> find_last_opt</span> : <code class="type">f:(<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; bool) -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; (<a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a) option</code></pre>
<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">f:('a -&gt; 'b) -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'b <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALmapi"><span class="keyword">val</span> mapi</span> : <code class="type">f:(<a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'b) -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'b <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALto_seq"><span class="keyword">val</span> to_seq</span> : <code class="type">'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; (<a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a) <a href="Seq.html#TYPEt">Seq.t</a></code></pre>
<pre><span id="VALto_seq_from"><span class="keyword">val</span> to_seq_from</span> : <code class="type"><a href="MoreLabels.Map.S.html#TYPEkey">key</a> -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; (<a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a) <a href="Seq.html#TYPEt">Seq.t</a></code></pre>
<pre><span id="VALadd_seq"><span class="keyword">val</span> add_seq</span> : <code class="type">(<a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a) <a href="Seq.html#TYPEt">Seq.t</a> -&gt;<br>       'a <a href="MoreLabels.Map.S.html#TYPEt">t</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALof_seq"><span class="keyword">val</span> of_seq</span> : <code class="type">(<a href="MoreLabels.Map.S.html#TYPEkey">key</a> * 'a) <a href="Seq.html#TYPEt">Seq.t</a> -&gt; 'a <a href="MoreLabels.Map.S.html#TYPEt">t</a></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>