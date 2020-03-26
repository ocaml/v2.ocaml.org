<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Map.Make</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_Map.Make.html">Map.Make</a></h1>

<pre><span id="MODULEMake"><span class="keyword">module</span> Make</span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">Ord</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Map.OrderedType.html">OrderedType</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Map.S.html">S</a></code><code class="type">  with type key = Ord.t</code></div></pre><div class="info module top">
<div class="info-desc">
<p>Functor building an implementation of the map structure
   given a totally ordered type.</p>
</div>
</div>
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
<div class="info ">
<div class="info-desc">
<p>The type of the map keys.</p>
</div>
</div>


<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">+'a</code> t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of maps from type <code class="code">key</code> to type <code class="code"><span class="keywordsign">'</span>a</code>.</p>
</div>
</div>


<pre><span id="VALempty"><span class="keyword">val</span> empty</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>The empty map.</p>
</div>
</div>

<pre><span id="VALis_empty"><span class="keyword">val</span> is_empty</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Test whether a map is empty or not.</p>
</div>
</div>

<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">mem&nbsp;x&nbsp;m</code> returns <code class="code"><span class="keyword">true</span></code> if <code class="code">m</code> contains a binding for <code class="code">x</code>,
       and <code class="code"><span class="keyword">false</span></code> otherwise.</p>
</div>
</div>

<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">add&nbsp;x&nbsp;y&nbsp;m</code> returns a map containing the same bindings as
       <code class="code">m</code>, plus a binding of <code class="code">x</code> to <code class="code">y</code>. If <code class="code">x</code> was already bound
       in <code class="code">m</code> to a value that is physically equal to <code class="code">y</code>,
       <code class="code">m</code> is returned unchanged (the result of the function is
       then physically equal to <code class="code">m</code>). Otherwise, the previous binding
       of <code class="code">x</code> in <code class="code">m</code> disappears.</p>
</div>
<ul class="info-attributes">
<li><b>Before 4.03 </b> Physical equality was not ensured.</li>
</ul>
</div>

<pre><span id="VALupdate"><span class="keyword">val</span> update</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; ('a option -&gt; 'a option) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">update&nbsp;x&nbsp;f&nbsp;m</code> returns a map containing the same bindings as
        <code class="code">m</code>, except for the binding of <code class="code">x</code>. Depending on the value of
        <code class="code">y</code> where <code class="code">y</code> is <code class="code">f&nbsp;(find_opt&nbsp;x&nbsp;m)</code>, the binding of <code class="code">x</code> is
        added, removed or updated. If <code class="code">y</code> is <code class="code"><span class="constructor">None</span></code>, the binding is
        removed if it exists; otherwise, if <code class="code">y</code> is <code class="code"><span class="constructor">Some</span>&nbsp;z</code> then <code class="code">x</code>
        is associated to <code class="code">z</code> in the resulting map.  If <code class="code">x</code> was already
        bound in <code class="code">m</code> to a value that is physically equal to <code class="code">z</code>, <code class="code">m</code>
        is returned unchanged (the result of the function is then
        physically equal to <code class="code">m</code>).</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.06.0</li>
</ul>
</div>

<pre><span id="VALsingleton"><span class="keyword">val</span> singleton</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">singleton&nbsp;x&nbsp;y</code> returns the one-element map that contains a binding <code class="code">y</code>
        for <code class="code">x</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">remove&nbsp;x&nbsp;m</code> returns a map containing the same bindings as
       <code class="code">m</code>, except for <code class="code">x</code> which is unbound in the returned map.
       If <code class="code">x</code> was not in <code class="code">m</code>, <code class="code">m</code> is returned unchanged
       (the result of the function is then physically equal to <code class="code">m</code>).</p>
</div>
<ul class="info-attributes">
<li><b>Before 4.03 </b> Physical equality was not ensured.</li>
</ul>
</div>

<pre><span id="VALmerge"><span class="keyword">val</span> merge</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a option -&gt; 'b option -&gt; 'c option) -&gt;<br>       'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'b <a href="Map.S.html#TYPEt">t</a> -&gt; 'c <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">merge&nbsp;f&nbsp;m1&nbsp;m2</code> computes a map whose keys is a subset of keys of <code class="code">m1</code>
        and of <code class="code">m2</code>. The presence of each such binding, and the corresponding
        value, is determined with the function <code class="code">f</code>.
        In terms of the <code class="code">find_opt</code> operation, we have
        <code class="code">find_opt&nbsp;x&nbsp;(merge&nbsp;f&nbsp;m1&nbsp;m2)&nbsp;=&nbsp;f&nbsp;(find_opt&nbsp;x&nbsp;m1)&nbsp;(find_opt&nbsp;x&nbsp;m2)</code>
        for any key <code class="code">x</code>, provided that <code class="code">f&nbsp;<span class="constructor">None</span>&nbsp;<span class="constructor">None</span>&nbsp;=&nbsp;<span class="constructor">None</span></code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALunion"><span class="keyword">val</span> union</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'a -&gt; 'a option) -&gt;<br>       'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">union&nbsp;f&nbsp;m1&nbsp;m2</code> computes a map whose keys is the union of keys
        of <code class="code">m1</code> and of <code class="code">m2</code>.  When the same binding is defined in both
        arguments, the function <code class="code">f</code> is used to combine them.
        This is a special case of <code class="code">merge</code>: <code class="code">union&nbsp;f&nbsp;m1&nbsp;m2</code> is equivalent
        to <code class="code">merge&nbsp;f'&nbsp;m1&nbsp;m2</code>, where</p>
<ul>
<li><code class="code">f'&nbsp;<span class="constructor">None</span>&nbsp;<span class="constructor">None</span>&nbsp;=&nbsp;<span class="constructor">None</span></code></li>
<li><code class="code">f'&nbsp;(<span class="constructor">Some</span>&nbsp;v)&nbsp;<span class="constructor">None</span>&nbsp;=&nbsp;<span class="constructor">Some</span>&nbsp;v</code></li>
<li><code class="code">f'&nbsp;<span class="constructor">None</span>&nbsp;(<span class="constructor">Some</span>&nbsp;v)&nbsp;=&nbsp;<span class="constructor">Some</span>&nbsp;v</code></li>
<li><code class="code">f'&nbsp;(<span class="constructor">Some</span>&nbsp;v1)&nbsp;(<span class="constructor">Some</span>&nbsp;v2)&nbsp;=&nbsp;f&nbsp;v1&nbsp;v2</code></li>
</ul>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.03.0</li>
</ul>
</div>

<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type">('a -&gt; 'a -&gt; int) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Total ordering between maps.  The first argument is a total ordering
        used to compare data associated with equal keys in the two maps.</p>
</div>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type">('a -&gt; 'a -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">equal&nbsp;cmp&nbsp;m1&nbsp;m2</code> tests whether the maps <code class="code">m1</code> and <code class="code">m2</code> are
       equal, that is, contain equal keys and associate them with
       equal data.  <code class="code">cmp</code> is the equality predicate used to compare
       the data associated with the keys.</p>
</div>
</div>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; unit) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">iter&nbsp;f&nbsp;m</code> applies <code class="code">f</code> to all bindings in map <code class="code">m</code>.
       <code class="code">f</code> receives the key as first argument, and the associated value
       as second argument.  The bindings are passed to <code class="code">f</code> in increasing
       order with respect to the ordering over the type of the keys.</p>
</div>
</div>

<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'b -&gt; 'b) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'b -&gt; 'b</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">fold&nbsp;f&nbsp;m&nbsp;a</code> computes <code class="code">(f&nbsp;kN&nbsp;dN&nbsp;...&nbsp;(f&nbsp;k1&nbsp;d1&nbsp;a)...)</code>,
       where <code class="code">k1&nbsp;...&nbsp;kN</code> are the keys of all bindings in <code class="code">m</code>
       (in increasing order), and <code class="code">d1&nbsp;...&nbsp;dN</code> are the associated data.</p>
</div>
</div>

<pre><span id="VALfor_all"><span class="keyword">val</span> for_all</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">for_all&nbsp;p&nbsp;m</code> checks if all the bindings of the map
        satisfy the predicate <code class="code">p</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALexists"><span class="keyword">val</span> exists</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">exists&nbsp;p&nbsp;m</code> checks if at least one binding of the map
        satisfies the predicate <code class="code">p</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALfilter"><span class="keyword">val</span> filter</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">filter&nbsp;p&nbsp;m</code> returns the map with all the bindings in <code class="code">m</code>
        that satisfy predicate <code class="code">p</code>. If <code class="code">p</code> satisfies every binding in <code class="code">m</code>,
        <code class="code">m</code> is returned unchanged (the result of the function is then
        physically equal to <code class="code">m</code>)</p>
</div>
<ul class="info-attributes">
<li><b>Before 4.03 </b> Physical equality was not ensured.</li>
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALpartition"><span class="keyword">val</span> partition</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> * 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">partition&nbsp;p&nbsp;m</code> returns a pair of maps <code class="code">(m1,&nbsp;m2)</code>, where
        <code class="code">m1</code> contains all the bindings of <code class="code">s</code> that satisfy the
        predicate <code class="code">p</code>, and <code class="code">m2</code> is the map with all the bindings of
        <code class="code">s</code> that do not satisfy <code class="code">p</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALcardinal"><span class="keyword">val</span> cardinal</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Return the number of bindings of a map.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALbindings"><span class="keyword">val</span> bindings</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; (<a href="Map.S.html#TYPEkey">key</a> * 'a) list</code></pre><div class="info ">
<div class="info-desc">
<p>Return the list of all bindings of the given map.
       The returned list is sorted in increasing order with respect
       to the ordering <code class="code"><span class="constructor">Ord</span>.compare</code>, where <code class="code"><span class="constructor">Ord</span></code> is the argument
       given to <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALmin_binding"><span class="keyword">val</span> min_binding</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; <a href="Map.S.html#TYPEkey">key</a> * 'a</code></pre><div class="info ">
<div class="info-desc">
<p>Return the smallest binding of the given map
       (with respect to the <code class="code"><span class="constructor">Ord</span>.compare</code> ordering), or raise
       <code class="code"><span class="constructor">Not_found</span></code> if the map is empty.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALmin_binding_opt"><span class="keyword">val</span> min_binding_opt</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; (<a href="Map.S.html#TYPEkey">key</a> * 'a) option</code></pre><div class="info ">
<div class="info-desc">
<p>Return the smallest binding of the given map
       (with respect to the <code class="code"><span class="constructor">Ord</span>.compare</code> ordering), or <code class="code"><span class="constructor">None</span></code>
       if the map is empty.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALmax_binding"><span class="keyword">val</span> max_binding</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; <a href="Map.S.html#TYPEkey">key</a> * 'a</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Map.S.html#VALmin_binding"><code class="code"><span class="constructor">Map</span>.<span class="constructor">S</span>.min_binding</code></a>, but returns the largest binding
        of the given map.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALmax_binding_opt"><span class="keyword">val</span> max_binding_opt</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; (<a href="Map.S.html#TYPEkey">key</a> * 'a) option</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Map.S.html#VALmin_binding_opt"><code class="code"><span class="constructor">Map</span>.<span class="constructor">S</span>.min_binding_opt</code></a>, but returns the largest binding
        of the given map.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALchoose"><span class="keyword">val</span> choose</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; <a href="Map.S.html#TYPEkey">key</a> * 'a</code></pre><div class="info ">
<div class="info-desc">
<p>Return one binding of the given map, or raise <code class="code"><span class="constructor">Not_found</span></code> if
       the map is empty. Which binding is chosen is unspecified,
       but equal bindings will be chosen for equal maps.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALchoose_opt"><span class="keyword">val</span> choose_opt</span> : <code class="type">'a <a href="Map.S.html#TYPEt">t</a> -&gt; (<a href="Map.S.html#TYPEkey">key</a> * 'a) option</code></pre><div class="info ">
<div class="info-desc">
<p>Return one binding of the given map, or <code class="code"><span class="constructor">None</span></code> if
       the map is empty. Which binding is chosen is unspecified,
       but equal bindings will be chosen for equal maps.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALsplit"><span class="keyword">val</span> split</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> * 'a option * 'a <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">split&nbsp;x&nbsp;m</code> returns a triple <code class="code">(l,&nbsp;data,&nbsp;r)</code>, where
          <code class="code">l</code> is the map with all the bindings of <code class="code">m</code> whose key
        is strictly less than <code class="code">x</code>;
          <code class="code">r</code> is the map with all the bindings of <code class="code">m</code> whose key
        is strictly greater than <code class="code">x</code>;
          <code class="code">data</code> is <code class="code"><span class="constructor">None</span></code> if <code class="code">m</code> contains no binding for <code class="code">x</code>,
          or <code class="code"><span class="constructor">Some</span>&nbsp;v</code> if <code class="code">m</code> binds <code class="code">v</code> to <code class="code">x</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find&nbsp;x&nbsp;m</code> returns the current binding of <code class="code">x</code> in <code class="code">m</code>,
       or raises <code class="code"><span class="constructor">Not_found</span></code> if no such binding exists.</p>
</div>
</div>

<pre><span id="VALfind_opt"><span class="keyword">val</span> find_opt</span> : <code class="type"><a href="Map.S.html#TYPEkey">key</a> -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'a option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_opt&nbsp;x&nbsp;m</code> returns <code class="code"><span class="constructor">Some</span>&nbsp;v</code> if the current binding of <code class="code">x</code>
        in <code class="code">m</code> is <code class="code">v</code>, or <code class="code"><span class="constructor">None</span></code> if no such binding exists.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALfind_first"><span class="keyword">val</span> find_first</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; <a href="Map.S.html#TYPEkey">key</a> * 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_first&nbsp;f&nbsp;m</code>, where <code class="code">f</code> is a monotonically increasing function,
       returns the binding of <code class="code">m</code> with the lowest key <code class="code">k</code> such that <code class="code">f&nbsp;k</code>,
       or raises <code class="code"><span class="constructor">Not_found</span></code> if no such key exists.</p>

<p>For example, <code class="code">find_first&nbsp;(<span class="keyword">fun</span>&nbsp;k&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ord</span>.compare&nbsp;k&nbsp;x&nbsp;&gt;=&nbsp;0)&nbsp;m</code> will return
       the first binding <code class="code">k,&nbsp;v</code> of <code class="code">m</code> where <code class="code"><span class="constructor">Ord</span>.compare&nbsp;k&nbsp;x&nbsp;&gt;=&nbsp;0</code>
       (intuitively: <code class="code">k&nbsp;&gt;=&nbsp;x</code>), or raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">x</code> is greater than any
       element of <code class="code">m</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALfind_first_opt"><span class="keyword">val</span> find_first_opt</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; (<a href="Map.S.html#TYPEkey">key</a> * 'a) option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_first_opt&nbsp;f&nbsp;m</code>, where <code class="code">f</code> is a monotonically increasing function,
       returns an option containing the binding of <code class="code">m</code> with the lowest key <code class="code">k</code>
       such that <code class="code">f&nbsp;k</code>, or <code class="code"><span class="constructor">None</span></code> if no such key exists.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALfind_last"><span class="keyword">val</span> find_last</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; <a href="Map.S.html#TYPEkey">key</a> * 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_last&nbsp;f&nbsp;m</code>, where <code class="code">f</code> is a monotonically decreasing function,
       returns the binding of <code class="code">m</code> with the highest key <code class="code">k</code> such that <code class="code">f&nbsp;k</code>,
       or raises <code class="code"><span class="constructor">Not_found</span></code> if no such key exists.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALfind_last_opt"><span class="keyword">val</span> find_last_opt</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; bool) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; (<a href="Map.S.html#TYPEkey">key</a> * 'a) option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_last_opt&nbsp;f&nbsp;m</code>, where <code class="code">f</code> is a monotonically decreasing function,
       returns an option containing the binding of <code class="code">m</code> with the highest key <code class="code">k</code>
       such that <code class="code">f&nbsp;k</code>, or <code class="code"><span class="constructor">None</span></code> if no such key exists.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">('a -&gt; 'b) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'b <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">map&nbsp;f&nbsp;m</code> returns a map with same domain as <code class="code">m</code>, where the
       associated value <code class="code">a</code> of all bindings of <code class="code">m</code> has been
       replaced by the result of the application of <code class="code">f</code> to <code class="code">a</code>.
       The bindings are passed to <code class="code">f</code> in increasing order
       with respect to the ordering over the type of the keys.</p>
</div>
</div>

<pre><span id="VALmapi"><span class="keyword">val</span> mapi</span> : <code class="type">(<a href="Map.S.html#TYPEkey">key</a> -&gt; 'a -&gt; 'b) -&gt; 'a <a href="Map.S.html#TYPEt">t</a> -&gt; 'b <a href="Map.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Map.S.html#VALmap"><code class="code"><span class="constructor">Map</span>.<span class="constructor">S</span>.map</code></a>, but the function receives as arguments both the
       key and the associated value for each binding of the map.</p>
</div>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>