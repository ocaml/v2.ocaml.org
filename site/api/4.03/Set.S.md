<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Set.S</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_Set.S.html">Set.S</a></h1>

<pre><span class="keyword">module type</span> S = <code class="code"><span class="keyword">sig</span></code> <a href="Set.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info modtype top">
Output signature of the functor <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a>.<br>
</div>
<hr width="100%">

<pre><span id="TYPEelt"><span class="keyword">type</span> <code class="type"></code>elt</span> </pre>
<div class="info ">
The type of the set elements.<br>
</div>


<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
The type of sets.<br>
</div>


<pre><span id="VALempty"><span class="keyword">val</span> empty</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
The empty set.<br>
</div>

<pre><span id="VALis_empty"><span class="keyword">val</span> is_empty</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
Test whether a set is empty or not.<br>
</div>

<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<code class="code">mem x s</code> tests whether <code class="code">x</code> belongs to the set <code class="code">s</code>.<br>
</div>

<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">add x s</code> returns a set containing all elements of <code class="code">s</code>,
       plus <code class="code">x</code>. If <code class="code">x</code> was already in <code class="code">s</code>, <code class="code">s</code> is returned unchanged
       (the result of the function is then physically equal to <code class="code">s</code>).<br>
<b>Before 4.03 </b> Physical equality was not ensured.<br>
</div>

<pre><span id="VALsingleton"><span class="keyword">val</span> singleton</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">singleton x</code> returns the one-element set containing only <code class="code">x</code>.<br>
</div>

<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">remove x s</code> returns a set containing all elements of <code class="code">s</code>,
       except <code class="code">x</code>. If <code class="code">x</code> was not in <code class="code">s</code>, <code class="code">s</code> is returned unchanged
       (the result of the function is then physically equal to <code class="code">s</code>).<br>
<b>Before 4.03 </b> Physical equality was not ensured.<br>
</div>

<pre><span id="VALunion"><span class="keyword">val</span> union</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
Set union.<br>
</div>

<pre><span id="VALinter"><span class="keyword">val</span> inter</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
Set intersection.<br>
</div>

<pre><span id="VALdiff"><span class="keyword">val</span> diff</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
Set difference.<br>
</div>

<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
Total ordering between sets. Can be used as the ordering function
       for doing sets of sets.<br>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<code class="code">equal s1 s2</code> tests whether the sets <code class="code">s1</code> and <code class="code">s2</code> are
       equal, that is, contain equal elements.<br>
</div>

<pre><span id="VALsubset"><span class="keyword">val</span> subset</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<code class="code">subset s1 s2</code> tests whether the set <code class="code">s1</code> is a subset of
       the set <code class="code">s2</code>.<br>
</div>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; unit) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<code class="code">iter f s</code> applies <code class="code">f</code> in turn to all elements of <code class="code">s</code>.
       The elements of <code class="code">s</code> are presented to <code class="code">f</code> in increasing order
       with respect to the ordering over the type of the elements.<br>
</div>

<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; 'a -&gt; 'a) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; 'a -&gt; 'a</code></pre><div class="info ">
<code class="code">fold f s a</code> computes <code class="code">(f xN ... (f x2 (f x1 a))...)</code>,
       where <code class="code">x1 ... xN</code> are the elements of <code class="code">s</code>, in increasing order.<br>
</div>

<pre><span id="VALfor_all"><span class="keyword">val</span> for_all</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<code class="code">for_all p s</code> checks if all elements of the set
       satisfy the predicate <code class="code">p</code>.<br>
</div>

<pre><span id="VALexists"><span class="keyword">val</span> exists</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<code class="code">exists p s</code> checks if at least one element of
       the set satisfies the predicate <code class="code">p</code>.<br>
</div>

<pre><span id="VALfilter"><span class="keyword">val</span> filter</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">filter p s</code> returns the set of all elements in <code class="code">s</code>
       that satisfy predicate <code class="code">p</code>. If <code class="code">p</code> satisfies every element in <code class="code">s</code>,
       <code class="code">s</code> is returned unchanged (the result of the function is then
       physically equal to <code class="code">s</code>).<br>
<b>Before 4.03 </b> Physical equality was not ensured.<br>
</div>

<pre><span id="VALpartition"><span class="keyword">val</span> partition</span> : <code class="type">(<a href="Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> * <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">partition p s</code> returns a pair of sets <code class="code">(s1, s2)</code>, where
       <code class="code">s1</code> is the set of all the elements of <code class="code">s</code> that satisfy the
       predicate <code class="code">p</code>, and <code class="code">s2</code> is the set of all the elements of
       <code class="code">s</code> that do not satisfy <code class="code">p</code>.<br>
</div>

<pre><span id="VALcardinal"><span class="keyword">val</span> cardinal</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
Return the number of elements of a set.<br>
</div>

<pre><span id="VALelements"><span class="keyword">val</span> elements</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a> list</code></pre><div class="info ">
Return the list of all elements of the given set.
       The returned list is sorted in increasing order with respect
       to the ordering <code class="code"><span class="constructor">Ord</span>.compare</code>, where <code class="code"><span class="constructor">Ord</span></code> is the argument
       given to <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a>.<br>
</div>

<pre><span id="VALmin_elt"><span class="keyword">val</span> min_elt</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a></code></pre><div class="info ">
Return the smallest element of the given set
       (with respect to the <code class="code"><span class="constructor">Ord</span>.compare</code> ordering), or raise
       <code class="code"><span class="constructor">Not_found</span></code> if the set is empty.<br>
</div>

<pre><span id="VALmax_elt"><span class="keyword">val</span> max_elt</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a></code></pre><div class="info ">
Same as <a href="Set.S.html#VALmin_elt"><code class="code"><span class="constructor">Set</span>.<span class="constructor">S</span>.min_elt</code></a>, but returns the largest element of the
       given set.<br>
</div>

<pre><span id="VALchoose"><span class="keyword">val</span> choose</span> : <code class="type"><a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a></code></pre><div class="info ">
Return one element of the given set, or raise <code class="code"><span class="constructor">Not_found</span></code> if
       the set is empty. Which element is chosen is unspecified,
       but equal elements will be chosen for equal sets.<br>
</div>

<pre><span id="VALsplit"><span class="keyword">val</span> split</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEt">t</a> * bool * <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">split x s</code> returns a triple <code class="code">(l, present, r)</code>, where
          <code class="code">l</code> is the set of elements of <code class="code">s</code> that are
          strictly less than <code class="code">x</code>;
          <code class="code">r</code> is the set of elements of <code class="code">s</code> that are
          strictly greater than <code class="code">x</code>;
          <code class="code">present</code> is <code class="code"><span class="keyword">false</span></code> if <code class="code">s</code> contains no element equal to <code class="code">x</code>,
          or <code class="code"><span class="keyword">true</span></code> if <code class="code">s</code> contains an element equal to <code class="code">x</code>.<br>
</div>

<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> -&gt; <a href="Set.S.html#TYPEt">t</a> -&gt; <a href="Set.S.html#TYPEelt">elt</a></code></pre><div class="info ">
<code class="code">find x s</code> returns the element of <code class="code">s</code> equal to <code class="code">x</code> (according
        to <code class="code"><span class="constructor">Ord</span>.compare</code>), or raise <code class="code"><span class="constructor">Not_found</span></code> if no such element
        exists.<br>
<b>Since</b> 4.01.0<br>
</div>

<pre><span id="VALof_list"><span class="keyword">val</span> of_list</span> : <code class="type"><a href="Set.S.html#TYPEelt">elt</a> list -&gt; <a href="Set.S.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">of_list l</code> creates a set from a list of elements.
        This is usually more efficient than folding <code class="code">add</code> over the list,
        except perhaps for lists with many duplicated elements.<br>
<b>Since</b> 4.02.0<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>