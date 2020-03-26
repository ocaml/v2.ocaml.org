<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">StdLabels.List</a></div><ul></ul></nav></header>

<h1>Module <a href="type_StdLabels.List.html">StdLabels.List</a></h1>

<pre><span class="keyword">module</span> List: <code class="code"><span class="keyword">sig</span></code> <a href="StdLabels.List.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">'a list -&gt; int</code></pre>
<pre><span id="VALhd"><span class="keyword">val</span> hd</span> : <code class="type">'a list -&gt; 'a</code></pre>
<pre><span id="VALtl"><span class="keyword">val</span> tl</span> : <code class="type">'a list -&gt; 'a list</code></pre>
<pre><span id="VALnth"><span class="keyword">val</span> nth</span> : <code class="type">'a list -&gt; int -&gt; 'a</code></pre>
<pre><span id="VALrev"><span class="keyword">val</span> rev</span> : <code class="type">'a list -&gt; 'a list</code></pre>
<pre><span id="VALappend"><span class="keyword">val</span> append</span> : <code class="type">'a list -&gt; 'a list -&gt; 'a list</code></pre>
<pre><span id="VALrev_append"><span class="keyword">val</span> rev_append</span> : <code class="type">'a list -&gt; 'a list -&gt; 'a list</code></pre>
<pre><span id="VALconcat"><span class="keyword">val</span> concat</span> : <code class="type">'a list list -&gt; 'a list</code></pre>
<pre><span id="VALflatten"><span class="keyword">val</span> flatten</span> : <code class="type">'a list list -&gt; 'a list</code></pre>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">f:('a -&gt; unit) -&gt; 'a list -&gt; unit</code></pre>
<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">f:('a -&gt; 'b) -&gt; 'a list -&gt; 'b list</code></pre>
<pre><span id="VALrev_map"><span class="keyword">val</span> rev_map</span> : <code class="type">f:('a -&gt; 'b) -&gt; 'a list -&gt; 'b list</code></pre>
<pre><span id="VALfold_left"><span class="keyword">val</span> fold_left</span> : <code class="type">f:('a -&gt; 'b -&gt; 'a) -&gt; init:'a -&gt; 'b list -&gt; 'a</code></pre>
<pre><span id="VALfold_right"><span class="keyword">val</span> fold_right</span> : <code class="type">f:('a -&gt; 'b -&gt; 'b) -&gt; 'a list -&gt; init:'b -&gt; 'b</code></pre>
<pre><span id="VALiter2"><span class="keyword">val</span> iter2</span> : <code class="type">f:('a -&gt; 'b -&gt; unit) -&gt; 'a list -&gt; 'b list -&gt; unit</code></pre>
<pre><span id="VALmap2"><span class="keyword">val</span> map2</span> : <code class="type">f:('a -&gt; 'b -&gt; 'c) -&gt; 'a list -&gt; 'b list -&gt; 'c list</code></pre>
<pre><span id="VALrev_map2"><span class="keyword">val</span> rev_map2</span> : <code class="type">f:('a -&gt; 'b -&gt; 'c) -&gt; 'a list -&gt; 'b list -&gt; 'c list</code></pre>
<pre><span id="VALfold_left2"><span class="keyword">val</span> fold_left2</span> : <code class="type">f:('a -&gt; 'b -&gt; 'c -&gt; 'a) -&gt; init:'a -&gt; 'b list -&gt; 'c list -&gt; 'a</code></pre>
<pre><span id="VALfold_right2"><span class="keyword">val</span> fold_right2</span> : <code class="type">f:('a -&gt; 'b -&gt; 'c -&gt; 'c) -&gt; 'a list -&gt; 'b list -&gt; init:'c -&gt; 'c</code></pre>
<pre><span id="VALfor_all"><span class="keyword">val</span> for_all</span> : <code class="type">f:('a -&gt; bool) -&gt; 'a list -&gt; bool</code></pre>
<pre><span id="VALexists"><span class="keyword">val</span> exists</span> : <code class="type">f:('a -&gt; bool) -&gt; 'a list -&gt; bool</code></pre>
<pre><span id="VALfor_all2"><span class="keyword">val</span> for_all2</span> : <code class="type">f:('a -&gt; 'b -&gt; bool) -&gt; 'a list -&gt; 'b list -&gt; bool</code></pre>
<pre><span id="VALexists2"><span class="keyword">val</span> exists2</span> : <code class="type">f:('a -&gt; 'b -&gt; bool) -&gt; 'a list -&gt; 'b list -&gt; bool</code></pre>
<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type">'a -&gt; set:'a list -&gt; bool</code></pre>
<pre><span id="VALmemq"><span class="keyword">val</span> memq</span> : <code class="type">'a -&gt; set:'a list -&gt; bool</code></pre>
<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type">f:('a -&gt; bool) -&gt; 'a list -&gt; 'a</code></pre>
<pre><span id="VALfilter"><span class="keyword">val</span> filter</span> : <code class="type">f:('a -&gt; bool) -&gt; 'a list -&gt; 'a list</code></pre>
<pre><span id="VALfind_all"><span class="keyword">val</span> find_all</span> : <code class="type">f:('a -&gt; bool) -&gt; 'a list -&gt; 'a list</code></pre>
<pre><span id="VALpartition"><span class="keyword">val</span> partition</span> : <code class="type">f:('a -&gt; bool) -&gt; 'a list -&gt; 'a list * 'a list</code></pre>
<pre><span id="VALassoc"><span class="keyword">val</span> assoc</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; 'b</code></pre>
<pre><span id="VALassq"><span class="keyword">val</span> assq</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; 'b</code></pre>
<pre><span id="VALmem_assoc"><span class="keyword">val</span> mem_assoc</span> : <code class="type">'a -&gt; map:('a * 'b) list -&gt; bool</code></pre>
<pre><span id="VALmem_assq"><span class="keyword">val</span> mem_assq</span> : <code class="type">'a -&gt; map:('a * 'b) list -&gt; bool</code></pre>
<pre><span id="VALremove_assoc"><span class="keyword">val</span> remove_assoc</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; ('a * 'b) list</code></pre>
<pre><span id="VALremove_assq"><span class="keyword">val</span> remove_assq</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; ('a * 'b) list</code></pre>
<pre><span id="VALsplit"><span class="keyword">val</span> split</span> : <code class="type">('a * 'b) list -&gt; 'a list * 'b list</code></pre>
<pre><span id="VALcombine"><span class="keyword">val</span> combine</span> : <code class="type">'a list -&gt; 'b list -&gt; ('a * 'b) list</code></pre>
<pre><span id="VALsort"><span class="keyword">val</span> sort</span> : <code class="type">cmp:('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list</code></pre>
<pre><span id="VALstable_sort"><span class="keyword">val</span> stable_sort</span> : <code class="type">cmp:('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list</code></pre>
<pre><span id="VALfast_sort"><span class="keyword">val</span> fast_sort</span> : <code class="type">cmp:('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list</code></pre>
<pre><span id="VALmerge"><span class="keyword">val</span> merge</span> : <code class="type">cmp:('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list -&gt; 'a list</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>