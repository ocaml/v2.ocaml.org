<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Float.Array</a></div><ul><li><ul><li><a href="#2_Iterators">Iterators</a></li><li><a href="#2_Iteratorsontwoarrays">Iterators on two arrays</a></li><li><a href="#2_Arrayscanning">Array scanning</a></li><li><a href="#2_Sorting">Sorting</a></li><li><a href="#2_Iterators">Iterators</a></li><li><a href="#2_Undocumentedfunctions">Undocumented functions</a></li></ul></li></ul></nav></header>

<h1>Module <a href="type_Float.Array.html">Float.Array</a></h1>

<pre><span id="MODULEArray"><span class="keyword">module</span> Array</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Float.Array.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">floatarray</code> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of float arrays with packed representation.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.08.0</li>
</ul>
</div>


<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Return the length (number of elements) of the given floatarray.</p>
</div>
</div>

<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; int -&gt; float</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">get&nbsp;a&nbsp;n</code> returns the element number <code class="code">n</code> of floatarray <code class="code">a</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n</code> is outside the range 0 to
      <code class="code">(length&nbsp;a&nbsp;-&nbsp;1)</code>.</p>
</div>
</div>

<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; int -&gt; float -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">set&nbsp;a&nbsp;n&nbsp;x</code> modifies floatarray <code class="code">a</code> in place, replacing element
      number <code class="code">n</code> with <code class="code">x</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n</code> is outside the range 0 to
      <code class="code">(length&nbsp;a&nbsp;-&nbsp;1)</code>.</p>
</div>
</div>

<pre><span id="VALmake"><span class="keyword">val</span> make</span> : <code class="type">int -&gt; float -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">make&nbsp;n&nbsp;x</code> returns a fresh floatarray of length <code class="code">n</code>, initialized with <code class="code">x</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n&nbsp;&lt;&nbsp;0</code> or <code class="code">n&nbsp;&gt;&nbsp;<span class="constructor">Sys</span>.max_floatarray_length</code>.</p>
</div>
</div>

<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">int -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">create&nbsp;n</code> returns a fresh floatarray of length <code class="code">n</code>,
      with uninitialized data.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n&nbsp;&lt;&nbsp;0</code> or <code class="code">n&nbsp;&gt;&nbsp;<span class="constructor">Sys</span>.max_floatarray_length</code>.</p>
</div>
</div>

<pre><span id="VALinit"><span class="keyword">val</span> init</span> : <code class="type">int -&gt; (int -&gt; float) -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">init&nbsp;n&nbsp;f</code> returns a fresh floatarray of length <code class="code">n</code>,
     with element number <code class="code">i</code> initialized to the result of <code class="code">f&nbsp;i</code>.
     In other terms, <code class="code">init&nbsp;n&nbsp;f</code> tabulates the results of <code class="code">f</code>
     applied to the integers <code class="code">0</code> to <code class="code">n-1</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n&nbsp;&lt;&nbsp;0</code> or <code class="code">n&nbsp;&gt;&nbsp;<span class="constructor">Sys</span>.max_floatarray_length</code>.</p>
</div>
</div>

<pre><span id="VALappend"><span class="keyword">val</span> append</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">append&nbsp;v1&nbsp;v2</code> returns a fresh floatarray containing the
     concatenation of the floatarrays <code class="code">v1</code> and <code class="code">v2</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if
     <code class="code">length&nbsp;v1&nbsp;+&nbsp;length&nbsp;v2&nbsp;&gt;&nbsp;<span class="constructor">Sys</span>.max_floatarray_length</code>.</p>
</div>
</div>

<pre><span id="VALconcat"><span class="keyword">val</span> concat</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> list -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Float.Array.html#VALappend"><code class="code"><span class="constructor">Float</span>.<span class="constructor">Array</span>.append</code></a>, but concatenates a list of floatarrays.</p>
</div>
</div>

<pre><span id="VALsub"><span class="keyword">val</span> sub</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">sub&nbsp;a&nbsp;start&nbsp;len</code> returns a fresh floatarray of length <code class="code">len</code>,
     containing the elements number <code class="code">start</code> to <code class="code">start&nbsp;+&nbsp;len&nbsp;-&nbsp;1</code>
     of floatarray <code class="code">a</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">start</code> and <code class="code">len</code> do not
     designate a valid subarray of <code class="code">a</code>; that is, if
     <code class="code">start&nbsp;&lt;&nbsp;0</code>, or <code class="code">len&nbsp;&lt;&nbsp;0</code>, or <code class="code">start&nbsp;+&nbsp;len&nbsp;&gt;&nbsp;length&nbsp;a</code>.</p>
</div>
</div>

<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">copy&nbsp;a</code> returns a copy of <code class="code">a</code>, that is, a fresh floatarray
      containing the same elements as <code class="code">a</code>.</p>
</div>
</div>

<pre><span id="VALfill"><span class="keyword">val</span> fill</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; float -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">fill&nbsp;a&nbsp;ofs&nbsp;len&nbsp;x</code> modifies the floatarray <code class="code">a</code> in place,
     storing <code class="code">x</code> in elements number <code class="code">ofs</code> to <code class="code">ofs&nbsp;+&nbsp;len&nbsp;-&nbsp;1</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">ofs</code> and <code class="code">len</code> do not
     designate a valid subarray of <code class="code">a</code>.</p>
</div>
</div>

<pre><span id="VALblit"><span class="keyword">val</span> blit</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; int -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">blit&nbsp;v1&nbsp;o1&nbsp;v2&nbsp;o2&nbsp;len</code> copies <code class="code">len</code> elements
      from floatarray <code class="code">v1</code>, starting at element number <code class="code">o1</code>, to floatarray <code class="code">v2</code>,
      starting at element number <code class="code">o2</code>. It works correctly even if
      <code class="code">v1</code> and <code class="code">v2</code> are the same floatarray, and the source and
      destination chunks overlap.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">o1</code> and <code class="code">len</code> do not
      designate a valid subarray of <code class="code">v1</code>, or if <code class="code">o2</code> and <code class="code">len</code> do not
      designate a valid subarray of <code class="code">v2</code>.</p>
</div>
</div>

<pre><span id="VALto_list"><span class="keyword">val</span> to_list</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; float list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_list&nbsp;a</code> returns the list of all the elements of <code class="code">a</code>.</p>
</div>
</div>

<pre><span id="VALof_list"><span class="keyword">val</span> of_list</span> : <code class="type">float list -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">of_list&nbsp;l</code> returns a fresh floatarray containing the elements
      of <code class="code">l</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the length of <code class="code">l</code> is greater than
      <code class="code"><span class="constructor">Sys</span>.max_floatarray_length</code>.</p>
</div>
</div>
<h3 id="2_Iterators">Iterators</h3>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">(float -&gt; unit) -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">iter&nbsp;f&nbsp;a</code> applies function <code class="code">f</code> in turn to all
      the elements of <code class="code">a</code>.  It is equivalent to
      <code class="code">f&nbsp;a.(0);&nbsp;f&nbsp;a.(1);&nbsp;...;&nbsp;f&nbsp;a.(length&nbsp;a&nbsp;-&nbsp;1);&nbsp;()</code>.</p>
</div>
</div>

<pre><span id="VALiteri"><span class="keyword">val</span> iteri</span> : <code class="type">(int -&gt; float -&gt; unit) -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Float.Array.html#VALiter"><code class="code"><span class="constructor">Float</span>.<span class="constructor">Array</span>.iter</code></a>, but the
      function is applied with the index of the element as first argument,
      and the element itself as second argument.</p>
</div>
</div>

<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">(float -&gt; float) -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">map&nbsp;f&nbsp;a</code> applies function <code class="code">f</code> to all the elements of <code class="code">a</code>,
      and builds a floatarray with the results returned by <code class="code">f</code>.</p>
</div>
</div>

<pre><span id="VALmapi"><span class="keyword">val</span> mapi</span> : <code class="type">(int -&gt; float -&gt; float) -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Float.Array.html#VALmap"><code class="code"><span class="constructor">Float</span>.<span class="constructor">Array</span>.map</code></a>, but the
      function is applied to the index of the element as first argument,
      and the element itself as second argument.</p>
</div>
</div>

<pre><span id="VALfold_left"><span class="keyword">val</span> fold_left</span> : <code class="type">('a -&gt; float -&gt; 'a) -&gt; 'a -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">fold_left&nbsp;f&nbsp;x&nbsp;a</code> computes
      <code class="code">f&nbsp;(...&nbsp;(f&nbsp;(f&nbsp;x&nbsp;a.(0))&nbsp;a.(1))&nbsp;...)&nbsp;a.(n-1)</code>,
      where <code class="code">n</code> is the length of the floatarray <code class="code">a</code>.</p>
</div>
</div>

<pre><span id="VALfold_right"><span class="keyword">val</span> fold_right</span> : <code class="type">(float -&gt; 'a -&gt; 'a) -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; 'a -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">fold_right&nbsp;f&nbsp;a&nbsp;x</code> computes
      <code class="code">f&nbsp;a.(0)&nbsp;(f&nbsp;a.(1)&nbsp;(&nbsp;...&nbsp;(f&nbsp;a.(n-1)&nbsp;x)&nbsp;...))</code>,
      where <code class="code">n</code> is the length of the floatarray <code class="code">a</code>.</p>
</div>
</div>
<h3 id="2_Iteratorsontwoarrays">Iterators on two arrays</h3>
<pre><span id="VALiter2"><span class="keyword">val</span> iter2</span> : <code class="type">(float -&gt; float -&gt; unit) -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Array</span>.iter2&nbsp;f&nbsp;a&nbsp;b</code> applies function <code class="code">f</code> to all the elements of <code class="code">a</code>
      and <code class="code">b</code>.
      Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the floatarrays are not the same size.</p>
</div>
</div>

<pre><span id="VALmap2"><span class="keyword">val</span> map2</span> : <code class="type">(float -&gt; float -&gt; float) -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">map2&nbsp;f&nbsp;a&nbsp;b</code> applies function <code class="code">f</code> to all the elements of <code class="code">a</code>
      and <code class="code">b</code>, and builds a floatarray with the results returned by <code class="code">f</code>:
      <code class="code">[|&nbsp;f&nbsp;a.(0)&nbsp;b.(0);&nbsp;...;&nbsp;f&nbsp;a.(length&nbsp;a&nbsp;-&nbsp;1)&nbsp;b.(length&nbsp;b&nbsp;-&nbsp;1)|]</code>.
      Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the floatarrays are not the same size.</p>
</div>
</div>
<h3 id="2_Arrayscanning">Array scanning</h3>
<pre><span id="VALfor_all"><span class="keyword">val</span> for_all</span> : <code class="type">(float -&gt; bool) -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">for_all&nbsp;p&nbsp;[|a1;&nbsp;...;&nbsp;an|]</code> checks if all elements of the floatarray
      satisfy the predicate <code class="code">p</code>. That is, it returns
      <code class="code">(p&nbsp;a1)&nbsp;<span class="keywordsign">&amp;&amp;</span>&nbsp;(p&nbsp;a2)&nbsp;<span class="keywordsign">&amp;&amp;</span>&nbsp;...&nbsp;<span class="keywordsign">&amp;&amp;</span>&nbsp;(p&nbsp;an)</code>.</p>
</div>
</div>

<pre><span id="VALexists"><span class="keyword">val</span> exists</span> : <code class="type">(float -&gt; bool) -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">exists&nbsp;p&nbsp;[|a1;&nbsp;...;&nbsp;an|]</code> checks if at least one element of
      the floatarray satisfies the predicate <code class="code">p</code>. That is, it returns
      <code class="code">(p&nbsp;a1)&nbsp;<span class="keywordsign">||</span>&nbsp;(p&nbsp;a2)&nbsp;<span class="keywordsign">||</span>&nbsp;...&nbsp;<span class="keywordsign">||</span>&nbsp;(p&nbsp;an)</code>.</p>
</div>
</div>

<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type">float -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">mem&nbsp;a&nbsp;l</code> is true if and only if there is an element of <code class="code">l</code> that is
      structurally equal to <code class="code">a</code>, i.e. there is an <code class="code">x</code> in <code class="code">l</code> such
      that <code class="code">compare&nbsp;a&nbsp;x&nbsp;=&nbsp;0</code>.</p>
</div>
</div>

<pre><span id="VALmem_ieee"><span class="keyword">val</span> mem_ieee</span> : <code class="type">float -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Float.Array.html#VALmem"><code class="code"><span class="constructor">Float</span>.<span class="constructor">Array</span>.mem</code></a>, but uses IEEE equality instead of structural equality.</p>
</div>
</div>
<h3 id="2_Sorting">Sorting</h3>
<pre><span id="VALsort"><span class="keyword">val</span> sort</span> : <code class="type">(float -&gt; float -&gt; int) -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Sort a floatarray in increasing order according to a comparison
      function.  The comparison function must return 0 if its arguments
      compare as equal, a positive integer if the first is greater,
      and a negative integer if the first is smaller (see below for a
      complete specification).  For example, <a href="Stdlib.html#VALcompare"><code class="code">compare</code></a> is
      a suitable comparison function.  After calling <code class="code">sort</code>, the
      array is sorted in place in increasing order.
      <code class="code">sort</code> is guaranteed to run in constant heap space
      and (at most) logarithmic stack space.</p>

<p>The current implementation uses Heap Sort.  It runs in constant
      stack space.</p>

<p>Specification of the comparison function:
      Let <code class="code">a</code> be the floatarray and <code class="code">cmp</code> the comparison function. The following
      must be true for all <code class="code">x</code>, <code class="code">y</code>, <code class="code">z</code> in <code class="code">a</code> :</p>
<ul>
<li>     <code class="code">cmp&nbsp;x&nbsp;y</code> &gt; 0 if and only if <code class="code">cmp&nbsp;y&nbsp;x</code> &lt; 0</li>
<li>     if <code class="code">cmp&nbsp;x&nbsp;y</code> &gt;= 0 and <code class="code">cmp&nbsp;y&nbsp;z</code> &gt;= 0 then <code class="code">cmp&nbsp;x&nbsp;z</code> &gt;= 0</li>
</ul>
<p>When <code class="code">sort</code> returns, <code class="code">a</code> contains the same elements as before,
      reordered in such a way that for all i and j valid indices of <code class="code">a</code> :</p>
<ul>
<li>     <code class="code">cmp&nbsp;a.(i)&nbsp;a.(j)</code> &gt;= 0 if and only if i &gt;= j</li>
</ul>
</div>
</div>

<pre><span id="VALstable_sort"><span class="keyword">val</span> stable_sort</span> : <code class="type">(float -&gt; float -&gt; int) -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Float.Array.html#VALsort"><code class="code"><span class="constructor">Float</span>.<span class="constructor">Array</span>.sort</code></a>, but the sorting algorithm is stable (i.e.
       elements that compare equal are kept in their original order) and
       not guaranteed to run in constant heap space.</p>

<p>The current implementation uses Merge Sort. It uses a temporary
       floatarray of length <code class="code">n/2</code>, where <code class="code">n</code> is the length of the floatarray.
       It is usually faster than the current implementation of <a href="Float.Array.html#VALsort"><code class="code"><span class="constructor">Float</span>.<span class="constructor">Array</span>.sort</code></a>.</p>
</div>
</div>

<pre><span id="VALfast_sort"><span class="keyword">val</span> fast_sort</span> : <code class="type">(float -&gt; float -&gt; int) -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Float.Array.html#VALsort"><code class="code"><span class="constructor">Float</span>.<span class="constructor">Array</span>.sort</code></a> or <a href="Float.Array.html#VALstable_sort"><code class="code"><span class="constructor">Float</span>.<span class="constructor">Array</span>.stable_sort</code></a>, whichever is faster
      on typical input.</p>
</div>
</div>
<h3 id="2_Iterators">Iterators</h3>
<pre><span id="VALto_seq"><span class="keyword">val</span> to_seq</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; float <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Iterate on the floatarray, in increasing order. Modifications of the
      floatarray during iteration will be reflected in the iterator.</p>
</div>
</div>

<pre><span id="VALto_seqi"><span class="keyword">val</span> to_seqi</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; (int * float) <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Iterate on the floatarray, in increasing order, yielding indices along
      elements. Modifications of the floatarray during iteration will be
      reflected in the iterator.</p>
</div>
</div>

<pre><span id="VALof_seq"><span class="keyword">val</span> of_seq</span> : <code class="type">float <a href="Seq.html#TYPEt">Seq.t</a> -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Create an array from the generator.</p>
</div>
</div>

<pre><span id="VALmap_to_array"><span class="keyword">val</span> map_to_array</span> : <code class="type">(float -&gt; 'a) -&gt; <a href="Float.Array.html#TYPEt">t</a> -&gt; 'a array</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">map_to_array&nbsp;f&nbsp;a</code> applies function <code class="code">f</code> to all the elements of <code class="code">a</code>,
      and builds an array with the results returned by <code class="code">f</code>:
      <code class="code">[|&nbsp;f&nbsp;a.(0);&nbsp;f&nbsp;a.(1);&nbsp;...;&nbsp;f&nbsp;a.(length&nbsp;a&nbsp;-&nbsp;1)&nbsp;|]</code>.</p>
</div>
</div>

<pre><span id="VALmap_from_array"><span class="keyword">val</span> map_from_array</span> : <code class="type">('a -&gt; float) -&gt; 'a array -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">map_from_array&nbsp;f&nbsp;a</code> applies function <code class="code">f</code> to all the elements of <code class="code">a</code>,
      and builds a floatarray with the results returned by <code class="code">f</code>.</p>
</div>
</div>
<h3 id="2_Undocumentedfunctions">Undocumented functions</h3>
<pre><span id="VALunsafe_get"><span class="keyword">val</span> unsafe_get</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; int -&gt; float</code></pre>
<pre><span id="VALunsafe_set"><span class="keyword">val</span> unsafe_set</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; int -&gt; float -&gt; unit</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>