<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Map.Make</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_Map.Make.html">Map.Make</a></h1>
<pre><span class="keyword">module</span> Make: <div class="sig_block"><code class="code"><span class="keyword">functor</span> (</code><code class="code"><span class="constructor">Ord</span></code><code class="code"> : </code><code class="type"><a href="Map.OrderedType.html">OrderedType</a></code><code class="code">) <span class="keywordsign">-&gt;</span> </code><code class="type"><a href="Map.S.html">S</a></code><code class="type">  with type key = Ord.t</code></div></pre>Functor building an implementation of the map structure
   given a totally ordered type.<br>
<table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>Ord</code></td>
<td align="center" valign="top">:</td>
<td><code class="type"><a href="Map.OrderedType.html">OrderedType</a></code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">
<pre><span id="TYPEkey"><span class="keyword">type</span> <code class="type"></code>key</span> </pre>
<div class="info">
The type of the map keys.<br>
</div>

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">+'a</code> t</span> </pre>
<div class="info">
The type of maps from type <code class="code">key</code> to type <code class="code"><span class="keywordsign">'</span>a</code>.<br>
</div>

<pre><span id="VALempty"><span class="keyword">val</span> empty</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info">
The empty map.<br>
</div>
<pre><span id="VALis_empty"><span class="keyword">val</span> is_empty</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info">
Test whether a map is empty or not.<br>
</div>
<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info">
<code class="code">mem x m</code> returns <code class="code"><span class="keyword">true</span></code> if <code class="code">m</code> contains a binding for <code class="code">x</code>,
       and <code class="code"><span class="keyword">false</span></code> otherwise.<br>
</div>
<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info">
<code class="code">add x y m</code> returns a map containing the same bindings as
       <code class="code">m</code>, plus a binding of <code class="code">x</code> to <code class="code">y</code>. If <code class="code">x</code> was already bound
       in <code class="code">m</code>, its previous binding disappears.<br>
</div>
<pre><span id="VALsingleton"><span class="keyword">val</span> singleton</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info">
<code class="code">singleton x y</code> returns the one-element map that contains a binding <code class="code">y</code>
        for <code class="code">x</code>.<br>
<b>Since</b> 3.12.0<br>
</div>
<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info">
<code class="code">remove x m</code> returns a map containing the same bindings as
       <code class="code">m</code>, except for <code class="code">x</code> which is unbound in the returned map.<br>
</div>
<pre><span id="VALmerge"><span class="keyword">val</span> merge</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a option -&gt; 'b option -&gt; 'c option) -&gt;<br>       'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'b <a href="Map.S.html#TYPEt">t</a> -&gt; 'c <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info">
<code class="code">merge f m1 m2</code> computes a map whose keys is a subset of keys of <code class="code">m1</code>
        and of <code class="code">m2</code>. The presence of each such binding, and the corresponding
        value, is determined with the function <code class="code">f</code>.<br>
<b>Since</b> 3.12.0<br>
</div>
<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type">('a -&gt; 'a -&gt; int) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; int</code></pre><div class="info">
Total ordering between maps.  The first argument is a total ordering
        used to compare data associated with equal keys in the two maps.<br>
</div>
<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type">('a -&gt; 'a -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info">
<code class="code">equal cmp m1 m2</code> tests whether the maps <code class="code">m1</code> and <code class="code">m2</code> are
       equal, that is, contain equal keys and associate them with
       equal data.  <code class="code">cmp</code> is the equality predicate used to compare
       the data associated with the keys.<br>
</div>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; unit) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info">
<code class="code">iter f m</code> applies <code class="code">f</code> to all bindings in map <code class="code">m</code>.
       <code class="code">f</code> receives the key as first argument, and the associated value
       as second argument.  The bindings are passed to <code class="code">f</code> in increasing
       order with respect to the ordering over the type of the keys.<br>
</div>
<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'b -&gt; 'b) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'b -&gt; 'b</code></pre><div class="info">
<code class="code">fold f m a</code> computes <code class="code">(f kN dN ... (f k1 d1 a)...)</code>,
       where <code class="code">k1 ... kN</code> are the keys of all bindings in <code class="code">m</code>
       (in increasing order), and <code class="code">d1 ... dN</code> are the associated data.<br>
</div>
<pre><span id="VALfor_all"><span class="keyword">val</span> for_all</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info">
<code class="code">for_all p m</code> checks if all the bindings of the map
        satisfy the predicate <code class="code">p</code>.<br>
<b>Since</b> 3.12.0<br>
</div>
<pre><span id="VALexists"><span class="keyword">val</span> exists</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info">
<code class="code">exists p m</code> checks if at least one binding of the map
        satisfy the predicate <code class="code">p</code>.<br>
<b>Since</b> 3.12.0<br>
</div>
<pre><span id="VALfilter"><span class="keyword">val</span> filter</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info">
<code class="code">filter p m</code> returns the map with all the bindings in <code class="code">m</code>
        that satisfy predicate <code class="code">p</code>.<br>
<b>Since</b> 3.12.0<br>
</div>
<pre><span id="VALpartition"><span class="keyword">val</span> partition</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> * 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info">
<code class="code">partition p m</code> returns a pair of maps <code class="code">(m1, m2)</code>, where
        <code class="code">m1</code> contains all the bindings of <code class="code">s</code> that satisfy the
        predicate <code class="code">p</code>, and <code class="code">m2</code> is the map with all the bindings of
        <code class="code">s</code> that do not satisfy <code class="code">p</code>.<br>
<b>Since</b> 3.12.0<br>
</div>
<pre><span id="VALcardinal"><span class="keyword">val</span> cardinal</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; int</code></pre><div class="info">
Return the number of bindings of a map.<br>
<b>Since</b> 3.12.0<br>
</div>
<pre><span id="VALbindings"><span class="keyword">val</span> bindings</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; (<a href="Map.S.html#TYPEkey">key</a> * 'a) list</code></pre><div class="info">
Return the list of all bindings of the given map.
       The returned list is sorted in increasing order with respect
       to the ordering <code class="code"><span class="constructor">Ord</span>.compare</code>, where <code class="code"><span class="constructor">Ord</span></code> is the argument
       given to <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.<br>
<b>Since</b> 3.12.0<br>
</div>
<pre><span id="VALmin_binding"><span class="keyword">val</span> min_binding</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; <a href="Map.S.html#TYPEkey">key</a> * 'a</code></pre><div class="info">
Return the smallest binding of the given map
       (with respect to the <code class="code"><span class="constructor">Ord</span>.compare</code> ordering), or raise
       <code class="code"><span class="constructor">Not_found</span></code> if the map is empty.<br>
<b>Since</b> 3.12.0<br>
</div>
<pre><span id="VALmax_binding"><span class="keyword">val</span> max_binding</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; <a href="Map.S.html#TYPEkey">key</a> * 'a</code></pre><div class="info">
Same as <a href="Map.S.html#VALmin_binding"><code class="code"><span class="constructor">Map</span>.<span class="constructor">S</span>.min_binding</code></a>, but returns the largest binding
        of the given map.<br>
<b>Since</b> 3.12.0<br>
</div>
<pre><span id="VALchoose"><span class="keyword">val</span> choose</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; <a href="Map.S.html#TYPEkey">key</a> * 'a</code></pre><div class="info">
Return one binding of the given map, or raise <code class="code"><span class="constructor">Not_found</span></code> if
       the map is empty. Which binding is chosen is unspecified,
       but equal bindings will be chosen for equal maps.<br>
<b>Since</b> 3.12.0<br>
</div>
<pre><span id="VALsplit"><span class="keyword">val</span> split</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> * 'a option * 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info">
<code class="code">split x m</code> returns a triple <code class="code">(l, data, r)</code>, where
          <code class="code">l</code> is the map with all the bindings of <code class="code">m</code> whose key
        is strictly less than <code class="code">x</code>;
          <code class="code">r</code> is the map with all the bindings of <code class="code">m</code> whose key
        is strictly greater than <code class="code">x</code>;
          <code class="code">data</code> is <code class="code"><span class="constructor">None</span></code> if <code class="code">m</code> contains no binding for <code class="code">x</code>,
          or <code class="code"><span class="constructor">Some</span> v</code> if <code class="code">m</code> binds <code class="code">v</code> to <code class="code">x</code>.<br>
<b>Since</b> 3.12.0<br>
</div>
<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info">
<code class="code">find x m</code> returns the current binding of <code class="code">x</code> in <code class="code">m</code>,
       or raises <code class="code"><span class="constructor">Not_found</span></code> if no such binding exists.<br>
</div>
<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">('a -&gt; 'b) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'b <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info">
<code class="code">map f m</code> returns a map with same domain as <code class="code">m</code>, where the
       associated value <code class="code">a</code> of all bindings of <code class="code">m</code> has been
       replaced by the result of the application of <code class="code">f</code> to <code class="code">a</code>.
       The bindings are passed to <code class="code">f</code> in increasing order
       with respect to the ordering over the type of the keys.<br>
</div>
<pre><span id="VALmapi"><span class="keyword">val</span> mapi</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'b) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'b <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info">
Same as <a href="Map.S.html#VALmap"><code class="code"><span class="constructor">Map</span>.<span class="constructor">S</span>.map</code></a>, but the function receives as arguments both the
       key and the associated value for each binding of the map.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>