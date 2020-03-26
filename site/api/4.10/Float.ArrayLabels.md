<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Float.ArrayLabels</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Float.ArrayLabels.html">Float.ArrayLabels</a></h1>

<pre><span id="MODULEArrayLabels"><span class="keyword">module</span> ArrayLabels</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Float.ArrayLabels.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">floatarray</code> </pre>


<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type"><a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; int</code></pre>
<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type"><a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; int -&gt; float</code></pre>
<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type"><a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; int -&gt; float -&gt; unit</code></pre>
<pre><span id="VALmake"><span class="keyword">val</span> make</span> : <code class="type">int -&gt; float -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a></code></pre>
<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">int -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a></code></pre>
<pre><span id="VALinit"><span class="keyword">val</span> init</span> : <code class="type">int -&gt; f:(int -&gt; float) -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a></code></pre>
<pre><span id="VALappend"><span class="keyword">val</span> append</span> : <code class="type"><a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a></code></pre>
<pre><span id="VALconcat"><span class="keyword">val</span> concat</span> : <code class="type"><a href="Float.ArrayLabels.html#TYPEt">t</a> list -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a></code></pre>
<pre><span id="VALsub"><span class="keyword">val</span> sub</span> : <code class="type"><a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; pos:int -&gt; len:int -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a></code></pre>
<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type"><a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a></code></pre>
<pre><span id="VALfill"><span class="keyword">val</span> fill</span> : <code class="type"><a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; pos:int -&gt; len:int -&gt; float -&gt; unit</code></pre>
<pre><span id="VALblit"><span class="keyword">val</span> blit</span> : <code class="type">src:<a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt;<br>       src_pos:int -&gt; dst:<a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; dst_pos:int -&gt; len:int -&gt; unit</code></pre>
<pre><span id="VALto_list"><span class="keyword">val</span> to_list</span> : <code class="type"><a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; float list</code></pre>
<pre><span id="VALof_list"><span class="keyword">val</span> of_list</span> : <code class="type">float list -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a></code></pre>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">f:(float -&gt; unit) -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALiteri"><span class="keyword">val</span> iteri</span> : <code class="type">f:(int -&gt; float -&gt; unit) -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">f:(float -&gt; float) -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a></code></pre>
<pre><span id="VALmapi"><span class="keyword">val</span> mapi</span> : <code class="type">f:(int -&gt; float -&gt; float) -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a></code></pre>
<pre><span id="VALfold_left"><span class="keyword">val</span> fold_left</span> : <code class="type">f:('a -&gt; float -&gt; 'a) -&gt; init:'a -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; 'a</code></pre>
<pre><span id="VALfold_right"><span class="keyword">val</span> fold_right</span> : <code class="type">f:(float -&gt; 'a -&gt; 'a) -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; init:'a -&gt; 'a</code></pre>
<pre><span id="VALiter2"><span class="keyword">val</span> iter2</span> : <code class="type">f:(float -&gt; float -&gt; unit) -&gt;<br>       <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALmap2"><span class="keyword">val</span> map2</span> : <code class="type">f:(float -&gt; float -&gt; float) -&gt;<br>       <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a></code></pre>
<pre><span id="VALfor_all"><span class="keyword">val</span> for_all</span> : <code class="type">f:(float -&gt; bool) -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALexists"><span class="keyword">val</span> exists</span> : <code class="type">f:(float -&gt; bool) -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type">float -&gt; set:<a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALmem_ieee"><span class="keyword">val</span> mem_ieee</span> : <code class="type">float -&gt; set:<a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALsort"><span class="keyword">val</span> sort</span> : <code class="type">cmp:(float -&gt; float -&gt; int) -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALstable_sort"><span class="keyword">val</span> stable_sort</span> : <code class="type">cmp:(float -&gt; float -&gt; int) -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALfast_sort"><span class="keyword">val</span> fast_sort</span> : <code class="type">cmp:(float -&gt; float -&gt; int) -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALto_seq"><span class="keyword">val</span> to_seq</span> : <code class="type"><a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; float <a href="Seq.html#TYPEt">Seq.t</a></code></pre>
<pre><span id="VALto_seqi"><span class="keyword">val</span> to_seqi</span> : <code class="type"><a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; (int * float) <a href="Seq.html#TYPEt">Seq.t</a></code></pre>
<pre><span id="VALof_seq"><span class="keyword">val</span> of_seq</span> : <code class="type">float <a href="Seq.html#TYPEt">Seq.t</a> -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a></code></pre>
<pre><span id="VALmap_to_array"><span class="keyword">val</span> map_to_array</span> : <code class="type">f:(float -&gt; 'a) -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; 'a array</code></pre>
<pre><span id="VALmap_from_array"><span class="keyword">val</span> map_from_array</span> : <code class="type">f:('a -&gt; float) -&gt; 'a array -&gt; <a href="Float.ArrayLabels.html#TYPEt">t</a></code></pre>
<pre><span id="VALunsafe_get"><span class="keyword">val</span> unsafe_get</span> : <code class="type"><a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; int -&gt; float</code></pre>
<pre><span id="VALunsafe_set"><span class="keyword">val</span> unsafe_set</span> : <code class="type"><a href="Float.ArrayLabels.html#TYPEt">t</a> -&gt; int -&gt; float -&gt; unit</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>