<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Set.S</a></div><ul><li><a href="#1_Iterators">Iterators</a></li></ul></nav></header>

<h1>Module type <a href="type_Set.S.html">Set.S</a></h1>

<pre><span id="MODULETYPES"><span class="keyword">module type</span> S</span> = <code class="code"><span class="keyword">sig</span></code> <a href="Set.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info modtype top">
<div class="info-desc">
<p>Output signature of the functor <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="TYPEelt"><span class="keyword">type</span> <code class="type"></code>elt</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of the set elements.</p>
</div>
</div>


<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of sets.</p>
</div>
</div>


<pre><span id="VALempty"><span class="keyword">val</span> empty</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>The empty set.</p>
</div>
</div>

<pre><span id="VALis_empty"><span class="keyword">val</span> is_empty</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Test whether a set is empty or not.</p>
</div>
</div>

<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">mem&nbsp;x&nbsp;s</code> tests whether <code class="code">x</code> belongs to the set <code class="code">s</code>.</p>
</div>
</div>

<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">add&nbsp;x&nbsp;s</code> returns a set containing all elements of <code class="code">s</code>,
       plus <code class="code">x</code>. If <code class="code">x</code> was already in <code class="code">s</code>, <code class="code">s</code> is returned unchanged
       (the result of the function is then physically equal to <code class="code">s</code>).</p>
</div>
<ul class="info-attributes">
<li><b>Before 4.03 </b> Physical equality was not ensured.</li>
</ul>
</div>

<pre><span id="VALsingleton"><span class="keyword">val</span> singleton</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">singleton&nbsp;x</code> returns the one-element set containing only <code class="code">x</code>.</p>
</div>
</div>

<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">remove&nbsp;x&nbsp;s</code> returns a set containing all elements of <code class="code">s</code>,
       except <code class="code">x</code>. If <code class="code">x</code> was not in <code class="code">s</code>, <code class="code">s</code> is returned unchanged
       (the result of the function is then physically equal to <code class="code">s</code>).</p>
</div>
<ul class="info-attributes">
<li><b>Before 4.03 </b> Physical equality was not ensured.</li>
</ul>
</div>

<pre><span id="VALunion"><span class="keyword">val</span> union</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Set union.</p>
</div>
</div>

<pre><span id="VALinter"><span class="keyword">val</span> inter</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Set intersection.</p>
</div>
</div>

<pre><span id="VALdisjoint"><span class="keyword">val</span> disjoint</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Test if two sets are disjoint.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.08.0</li>
</ul>
</div>

<pre><span id="VALdiff"><span class="keyword">val</span> diff</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Set difference: <code class="code">diff&nbsp;s1&nbsp;s2</code> contains the elements of <code class="code">s1</code>
       that are not in <code class="code">s2</code>.</p>
</div>
</div>

<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Total ordering between sets. Can be used as the ordering function
       for doing sets of sets.</p>
</div>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">equal&nbsp;s1&nbsp;s2</code> tests whether the sets <code class="code">s1</code> and <code class="code">s2</code> are
       equal, that is, contain equal elements.</p>
</div>
</div>

<pre><span id="VALsubset"><span class="keyword">val</span> subset</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">subset&nbsp;s1&nbsp;s2</code> tests whether the set <code class="code">s1</code> is a subset of
       the set <code class="code">s2</code>.</p>
</div>
</div>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; unit) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">iter&nbsp;f&nbsp;s</code> applies <code class="code">f</code> in turn to all elements of <code class="code">s</code>.
       The elements of <code class="code">s</code> are presented to <code class="code">f</code> in increasing order
       with respect to the ordering over the type of the elements.</p>
</div>
</div>

<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a>) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">map&nbsp;f&nbsp;s</code> is the set whose elements are <code class="code">f&nbsp;a0</code>,<code class="code">f&nbsp;a1</code>... <code class="code">f<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;aN</code>, where <code class="code">a0</code>,<code class="code">a1</code>...<code class="code">aN</code> are the elements of <code class="code">s</code>.</p>

<p>The elements are passed to <code class="code">f</code> in increasing order
       with respect to the ordering over the type of the elements.</p>

<p>If no element of <code class="code">s</code> is changed by <code class="code">f</code>, <code class="code">s</code> is returned
       unchanged. (If each output of <code class="code">f</code> is physically equal to its
       input, the returned set is physically equal to <code class="code">s</code>.)</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.04.0</li>
</ul>
</div>

<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; 'a -&gt; 'a) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; 'a -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">fold&nbsp;f&nbsp;s&nbsp;a</code> computes <code class="code">(f&nbsp;xN&nbsp;...&nbsp;(f&nbsp;x2&nbsp;(f&nbsp;x1&nbsp;a))...)</code>,
       where <code class="code">x1&nbsp;...&nbsp;xN</code> are the elements of <code class="code">s</code>, in increasing order.</p>
</div>
</div>

<pre><span id="VALfor_all"><span class="keyword">val</span> for_all</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">for_all&nbsp;p&nbsp;s</code> checks if all elements of the set
       satisfy the predicate <code class="code">p</code>.</p>
</div>
</div>

<pre><span id="VALexists"><span class="keyword">val</span> exists</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">exists&nbsp;p&nbsp;s</code> checks if at least one element of
       the set satisfies the predicate <code class="code">p</code>.</p>
</div>
</div>

<pre><span id="VALfilter"><span class="keyword">val</span> filter</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">filter&nbsp;p&nbsp;s</code> returns the set of all elements in <code class="code">s</code>
       that satisfy predicate <code class="code">p</code>. If <code class="code">p</code> satisfies every element in <code class="code">s</code>,
       <code class="code">s</code> is returned unchanged (the result of the function is then
       physically equal to <code class="code">s</code>).</p>
</div>
<ul class="info-attributes">
<li><b>Before 4.03 </b> Physical equality was not ensured.</li>
</ul>
</div>

<pre><span id="VALpartition"><span class="keyword">val</span> partition</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> * <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">partition&nbsp;p&nbsp;s</code> returns a pair of sets <code class="code">(s1,&nbsp;s2)</code>, where
       <code class="code">s1</code> is the set of all the elements of <code class="code">s</code> that satisfy the
       predicate <code class="code">p</code>, and <code class="code">s2</code> is the set of all the elements of
       <code class="code">s</code> that do not satisfy <code class="code">p</code>.</p>
</div>
</div>

<pre><span id="VALcardinal"><span class="keyword">val</span> cardinal</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Return the number of elements of a set.</p>
</div>
</div>

<pre><span id="VALelements"><span class="keyword">val</span> elements</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a> list</code></pre><div class="info ">
<div class="info-desc">
<p>Return the list of all elements of the given set.
       The returned list is sorted in increasing order with respect
       to the ordering <code class="code"><span class="constructor">Ord</span>.compare</code>, where <code class="code"><span class="constructor">Ord</span></code> is the argument
       given to <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a>.</p>
</div>
</div>

<pre><span id="VALmin_elt"><span class="keyword">val</span> min_elt</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return the smallest element of the given set
       (with respect to the <code class="code"><span class="constructor">Ord</span>.compare</code> ordering), or raise
       <code class="code"><span class="constructor">Not_found</span></code> if the set is empty.</p>
</div>
</div>

<pre><span id="VALmin_elt_opt"><span class="keyword">val</span> min_elt_opt</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a> option</code></pre><div class="info ">
<div class="info-desc">
<p>Return the smallest element of the given set
       (with respect to the <code class="code"><span class="constructor">Ord</span>.compare</code> ordering), or <code class="code"><span class="constructor">None</span></code>
       if the set is empty.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALmax_elt"><span class="keyword">val</span> max_elt</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a></code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Set.S.html#VALmin_elt"><code class="code"><span class="constructor">Set</span>.<span class="constructor">S</span>.min_elt</code></a>, but returns the largest element of the
       given set.</p>
</div>
</div>

<pre><span id="VALmax_elt_opt"><span class="keyword">val</span> max_elt_opt</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a> option</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Set.S.html#VALmin_elt_opt"><code class="code"><span class="constructor">Set</span>.<span class="constructor">S</span>.min_elt_opt</code></a>, but returns the largest element of the
        given set.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALchoose"><span class="keyword">val</span> choose</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return one element of the given set, or raise <code class="code"><span class="constructor">Not_found</span></code> if
       the set is empty. Which element is chosen is unspecified,
       but equal elements will be chosen for equal sets.</p>
</div>
</div>

<pre><span id="VALchoose_opt"><span class="keyword">val</span> choose_opt</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a> option</code></pre><div class="info ">
<div class="info-desc">
<p>Return one element of the given set, or <code class="code"><span class="constructor">None</span></code> if
        the set is empty. Which element is chosen is unspecified,
        but equal elements will be chosen for equal sets.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALsplit"><span class="keyword">val</span> split</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> * bool * <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">split&nbsp;x&nbsp;s</code> returns a triple <code class="code">(l,&nbsp;present,&nbsp;r)</code>, where
          <code class="code">l</code> is the set of elements of <code class="code">s</code> that are
          strictly less than <code class="code">x</code>;
          <code class="code">r</code> is the set of elements of <code class="code">s</code> that are
          strictly greater than <code class="code">x</code>;
          <code class="code">present</code> is <code class="code"><span class="keyword">false</span></code> if <code class="code">s</code> contains no element equal to <code class="code">x</code>,
          or <code class="code"><span class="keyword">true</span></code> if <code class="code">s</code> contains an element equal to <code class="code">x</code>.</p>
</div>
</div>

<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find&nbsp;x&nbsp;s</code> returns the element of <code class="code">s</code> equal to <code class="code">x</code> (according
        to <code class="code"><span class="constructor">Ord</span>.compare</code>), or raise <code class="code"><span class="constructor">Not_found</span></code> if no such element
        exists.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.01.0</li>
</ul>
</div>

<pre><span id="VALfind_opt"><span class="keyword">val</span> find_opt</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a> option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_opt&nbsp;x&nbsp;s</code> returns the element of <code class="code">s</code> equal to <code class="code">x</code> (according
        to <code class="code"><span class="constructor">Ord</span>.compare</code>), or <code class="code"><span class="constructor">None</span></code> if no such element
        exists.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALfind_first"><span class="keyword">val</span> find_first</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_first&nbsp;f&nbsp;s</code>, where <code class="code">f</code> is a monotonically increasing function,
       returns the lowest element <code class="code">e</code> of <code class="code">s</code> such that <code class="code">f&nbsp;e</code>,
       or raises <code class="code"><span class="constructor">Not_found</span></code> if no such element exists.</p>

<p>For example, <code class="code">find_first&nbsp;(<span class="keyword">fun</span>&nbsp;e&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ord</span>.compare&nbsp;e&nbsp;x&nbsp;&gt;=&nbsp;0)&nbsp;s</code> will return
       the first element <code class="code">e</code> of <code class="code">s</code> where <code class="code"><span class="constructor">Ord</span>.compare&nbsp;e&nbsp;x&nbsp;&gt;=&nbsp;0</code> (intuitively:
       <code class="code">e&nbsp;&gt;=&nbsp;x</code>), or raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">x</code> is greater than any element of
       <code class="code">s</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALfind_first_opt"><span class="keyword">val</span> find_first_opt</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a> option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_first_opt&nbsp;f&nbsp;s</code>, where <code class="code">f</code> is a monotonically increasing function,
       returns an option containing the lowest element <code class="code">e</code> of <code class="code">s</code> such that
       <code class="code">f&nbsp;e</code>, or <code class="code"><span class="constructor">None</span></code> if no such element exists.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALfind_last"><span class="keyword">val</span> find_last</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_last&nbsp;f&nbsp;s</code>, where <code class="code">f</code> is a monotonically decreasing function,
       returns the highest element <code class="code">e</code> of <code class="code">s</code> such that <code class="code">f&nbsp;e</code>,
       or raises <code class="code"><span class="constructor">Not_found</span></code> if no such element exists.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALfind_last_opt"><span class="keyword">val</span> find_last_opt</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a> option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_last_opt&nbsp;f&nbsp;s</code>, where <code class="code">f</code> is a monotonically decreasing function,
       returns an option containing the highest element <code class="code">e</code> of <code class="code">s</code> such that
       <code class="code">f&nbsp;e</code>, or <code class="code"><span class="constructor">None</span></code> if no such element exists.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALof_list"><span class="keyword">val</span> of_list</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> list -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">of_list&nbsp;l</code> creates a set from a list of elements.
        This is usually more efficient than folding <code class="code">add</code> over the list,
        except perhaps for lists with many duplicated elements.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.02.0</li>
</ul>
</div>
<h2 id="1_Iterators">Iterators</h2>
<pre><span id="VALto_seq_from"><span class="keyword">val</span> to_seq_from</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a> <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_seq_from&nbsp;x&nbsp;s</code> iterates on a subset of the elements of <code class="code">s</code>
        in ascending order, from <code class="code">x</code> or above.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALto_seq"><span class="keyword">val</span> to_seq</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a> <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Iterate on the whole set, in ascending order</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALadd_seq"><span class="keyword">val</span> add_seq</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> <a href="Seq.html#TYPEt">Seq.t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Add the given elements to the set, in order.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALof_seq"><span class="keyword">val</span> of_seq</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> <a href="Seq.html#TYPEt">Seq.t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Build a set from the given bindings</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>