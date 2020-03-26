<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">StdLabels.List</a></div><ul><li><a href="#1_Iterators">Iterators</a></li><li><a href="#1_Iteratorsontwolists">Iterators on two lists</a></li><li><a href="#1_Listscanning">List scanning</a></li><li><a href="#1_Listsearching">List searching</a></li><li><a href="#1_Associationlists">Association lists</a></li><li><a href="#1_Listsofpairs">Lists of pairs</a></li><li><a href="#1_Sorting">Sorting</a></li><li><a href="#1_Iterators">Iterators</a></li></ul></nav></header>

<h1>Module <a href="type_StdLabels.List.html">StdLabels.List</a></h1>

<pre><span id="MODULEList"><span class="keyword">module</span> List</span>: <code class="type"><a href="Stdlib.ListLabels.html">ListLabels</a></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> = <code class="type">'a list</code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.[]"><span class="constructor">[]</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.::"><span class="constructor">::</span></span> <span class="keyword">of</span> <code class="type">'a * 'a list</code></code></td>

</tr></tbody></table>

<div class="info ">
<div class="info-desc">
<p>An alias for the type of lists.</p>
</div>
</div>

<p>List operations.</p>

<p>Some functions are flagged as not tail-recursive.  A tail-recursive
   function uses constant stack space, while a non-tail-recursive function
   uses stack space proportional to the length of its list argument, which
   can be a problem with very long lists.  When the function takes several
   list arguments, an approximate formula giving stack usage (in some
   unspecified constant unit) is shown in parentheses.</p>

<p>The above considerations can usually be ignored if your lists are not
   longer than about 10000 elements.</p>

<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">'a list -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Return the length (number of elements) of the given list.</p>
</div>
</div>

<pre><span id="VALhd"><span class="keyword">val</span> hd</span> : <code class="type">'a list -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p>Return the first element of the given list. Raise
   <code class="code"><span class="constructor">Failure</span>&nbsp;<span class="string">"hd"</span></code> if the list is empty.</p>
</div>
</div>

<pre><span id="VALcompare_lengths"><span class="keyword">val</span> compare_lengths</span> : <code class="type">'a list -&gt; 'b list -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Compare the lengths of two lists. <code class="code">compare_lengths&nbsp;l1&nbsp;l2</code> is
   equivalent to <code class="code">compare&nbsp;(length&nbsp;l1)&nbsp;(length&nbsp;l2)</code>, except that
   the computation stops after itering on the shortest list.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>

<pre><span id="VALcompare_length_with"><span class="keyword">val</span> compare_length_with</span> : <code class="type">'a list -&gt; len:int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Compare the length of a list to an integer. <code class="code">compare_length_with&nbsp;l&nbsp;n</code> is
   equivalent to <code class="code">compare&nbsp;(length&nbsp;l)&nbsp;n</code>, except that
   the computation stops after at most <code class="code">n</code> iterations on the list.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>

<pre><span id="VALcons"><span class="keyword">val</span> cons</span> : <code class="type">'a -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">cons&nbsp;x&nbsp;xs</code> is <code class="code">x&nbsp;::&nbsp;xs</code></p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>

<pre><span id="VALtl"><span class="keyword">val</span> tl</span> : <code class="type">'a list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p>Return the given list without its first element. Raise
   <code class="code"><span class="constructor">Failure</span>&nbsp;<span class="string">"tl"</span></code> if the list is empty.</p>
</div>
</div>

<pre><span id="VALnth"><span class="keyword">val</span> nth</span> : <code class="type">'a list -&gt; int -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p>Return the <code class="code">n</code>-th element of the given list.
   The first element (head of the list) is at position 0.
   Raise <code class="code"><span class="constructor">Failure</span>&nbsp;<span class="string">"nth"</span></code> if the list is too short.
   Raise <code class="code"><span class="constructor">Invalid_argument</span>&nbsp;<span class="string">"List.nth"</span></code> if <code class="code">n</code> is negative.</p>
</div>
</div>

<pre><span id="VALnth_opt"><span class="keyword">val</span> nth_opt</span> : <code class="type">'a list -&gt; int -&gt; 'a option</code></pre><div class="info ">
<div class="info-desc">
<p>Return the <code class="code">n</code>-th element of the given list.
    The first element (head of the list) is at position 0.
    Return <code class="code"><span class="constructor">None</span></code> if the list is too short.
    Raise <code class="code"><span class="constructor">Invalid_argument</span>&nbsp;<span class="string">"List.nth"</span></code> if <code class="code">n</code> is negative.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALrev"><span class="keyword">val</span> rev</span> : <code class="type">'a list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p>List reversal.</p>
</div>
</div>

<pre><span id="VALinit"><span class="keyword">val</span> init</span> : <code class="type">len:int -&gt; f:(int -&gt; 'a) -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">List</span>.init&nbsp;len&nbsp;f</code> is <code class="code">f&nbsp;0;&nbsp;f&nbsp;1;&nbsp;...;&nbsp;f&nbsp;(len-1)</code>, evaluated left to right.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.06.0</li>
<li><b>Raises</b> <code>Invalid_argument</code> if <code class="code">len&nbsp;&lt;&nbsp;0</code>.</li>
</ul>
</div>

<pre><span id="VALappend"><span class="keyword">val</span> append</span> : <code class="type">'a list -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p>Catenate two lists.  Same function as the infix operator <code class="code">@</code>.
   Not tail-recursive (length of the first argument).  The <code class="code">@</code>
   operator is not tail-recursive either.</p>
</div>
</div>

<pre><span id="VALrev_append"><span class="keyword">val</span> rev_append</span> : <code class="type">'a list -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">List</span>.rev_append&nbsp;l1&nbsp;l2</code> reverses <code class="code">l1</code> and concatenates it with <code class="code">l2</code>.
   This is equivalent to <code class="code">(</code><a href="List.html#VALrev"><code class="code"><span class="constructor">List</span>.rev</code></a><code class="code">&nbsp;l1)&nbsp;@&nbsp;l2</code>, but <code class="code">rev_append</code> is
   tail-recursive and more efficient.</p>
</div>
</div>

<pre><span id="VALconcat"><span class="keyword">val</span> concat</span> : <code class="type">'a list list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p>Concatenate a list of lists.  The elements of the argument are all
   concatenated together (in the same order) to give the result.
   Not tail-recursive
   (length of the argument + length of the longest sub-list).</p>
</div>
</div>

<pre><span id="VALflatten"><span class="keyword">val</span> flatten</span> : <code class="type">'a list list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <code class="code">concat</code>.  Not tail-recursive
   (length of the argument + length of the longest sub-list).</p>
</div>
</div>
<h2 id="1_Iterators">Iterators</h2>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">f:('a -&gt; unit) -&gt; 'a list -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">List</span>.iter&nbsp;f&nbsp;[a1;&nbsp;...;&nbsp;an]</code> applies function <code class="code">f</code> in turn to
   <code class="code">a1;&nbsp;...;&nbsp;an</code>. It is equivalent to
   <code class="code"><span class="keyword">begin</span>&nbsp;f&nbsp;a1;&nbsp;f&nbsp;a2;&nbsp;...;&nbsp;f&nbsp;an;&nbsp;()&nbsp;<span class="keyword">end</span></code>.</p>
</div>
</div>

<pre><span id="VALiteri"><span class="keyword">val</span> iteri</span> : <code class="type">f:(int -&gt; 'a -&gt; unit) -&gt; 'a list -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="List.html#VALiter"><code class="code"><span class="constructor">List</span>.iter</code></a>, but the function is applied to the index of
   the element as first argument (counting from 0), and the element
   itself as second argument.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.00.0</li>
</ul>
</div>

<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">f:('a -&gt; 'b) -&gt; 'a list -&gt; 'b list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">List</span>.map&nbsp;f&nbsp;[a1;&nbsp;...;&nbsp;an]</code> applies function <code class="code">f</code> to <code class="code">a1,&nbsp;...,&nbsp;an</code>,
   and builds the list <code class="code">[f&nbsp;a1;&nbsp;...;&nbsp;f&nbsp;an]</code>
   with the results returned by <code class="code">f</code>.  Not tail-recursive.</p>
</div>
</div>

<pre><span id="VALmapi"><span class="keyword">val</span> mapi</span> : <code class="type">f:(int -&gt; 'a -&gt; 'b) -&gt; 'a list -&gt; 'b list</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="List.html#VALmap"><code class="code"><span class="constructor">List</span>.map</code></a>, but the function is applied to the index of
   the element as first argument (counting from 0), and the element
   itself as second argument.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.00.0</li>
</ul>
</div>

<pre><span id="VALrev_map"><span class="keyword">val</span> rev_map</span> : <code class="type">f:('a -&gt; 'b) -&gt; 'a list -&gt; 'b list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">List</span>.rev_map&nbsp;f&nbsp;l</code> gives the same result as
   <a href="List.html#VALrev"><code class="code"><span class="constructor">List</span>.rev</code></a><code class="code">&nbsp;(</code><a href="List.html#VALmap"><code class="code"><span class="constructor">List</span>.map</code></a><code class="code">&nbsp;f&nbsp;l)</code>, but is tail-recursive and
   more efficient.</p>
</div>
</div>

<pre><span id="VALfilter_map"><span class="keyword">val</span> filter_map</span> : <code class="type">f:('a -&gt; 'b option) -&gt; 'a list -&gt; 'b list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">filter_map&nbsp;f&nbsp;l</code> applies <code class="code">f</code> to every element of <code class="code">l</code>, filters
    out the <code class="code"><span class="constructor">None</span></code> elements and returns the list of the arguments of
    the <code class="code"><span class="constructor">Some</span></code> elements.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.08.0</li>
</ul>
</div>

<pre><span id="VALfold_left"><span class="keyword">val</span> fold_left</span> : <code class="type">f:('a -&gt; 'b -&gt; 'a) -&gt; init:'a -&gt; 'b list -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">List</span>.fold_left&nbsp;f&nbsp;a&nbsp;[b1;&nbsp;...;&nbsp;bn]</code> is
   <code class="code">f&nbsp;(...&nbsp;(f&nbsp;(f&nbsp;a&nbsp;b1)&nbsp;b2)&nbsp;...)&nbsp;bn</code>.</p>
</div>
</div>

<pre><span id="VALfold_right"><span class="keyword">val</span> fold_right</span> : <code class="type">f:('a -&gt; 'b -&gt; 'b) -&gt; 'a list -&gt; init:'b -&gt; 'b</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">List</span>.fold_right&nbsp;f&nbsp;[a1;&nbsp;...;&nbsp;an]&nbsp;b</code> is
   <code class="code">f&nbsp;a1&nbsp;(f&nbsp;a2&nbsp;(...&nbsp;(f&nbsp;an&nbsp;b)&nbsp;...))</code>.  Not tail-recursive.</p>
</div>
</div>
<h2 id="1_Iteratorsontwolists">Iterators on two lists</h2>
<pre><span id="VALiter2"><span class="keyword">val</span> iter2</span> : <code class="type">f:('a -&gt; 'b -&gt; unit) -&gt; 'a list -&gt; 'b list -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">List</span>.iter2&nbsp;f&nbsp;[a1;&nbsp;...;&nbsp;an]&nbsp;[b1;&nbsp;...;&nbsp;bn]</code> calls in turn
   <code class="code">f&nbsp;a1&nbsp;b1;&nbsp;...;&nbsp;f&nbsp;an&nbsp;bn</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists are determined
   to have different lengths.</p>
</div>
</div>

<pre><span id="VALmap2"><span class="keyword">val</span> map2</span> : <code class="type">f:('a -&gt; 'b -&gt; 'c) -&gt; 'a list -&gt; 'b list -&gt; 'c list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">List</span>.map2&nbsp;f&nbsp;[a1;&nbsp;...;&nbsp;an]&nbsp;[b1;&nbsp;...;&nbsp;bn]</code> is
   <code class="code">[f&nbsp;a1&nbsp;b1;&nbsp;...;&nbsp;f&nbsp;an&nbsp;bn]</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists are determined
   to have different lengths.  Not tail-recursive.</p>
</div>
</div>

<pre><span id="VALrev_map2"><span class="keyword">val</span> rev_map2</span> : <code class="type">f:('a -&gt; 'b -&gt; 'c) -&gt; 'a list -&gt; 'b list -&gt; 'c list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">List</span>.rev_map2&nbsp;f&nbsp;l1&nbsp;l2</code> gives the same result as
   <a href="List.html#VALrev"><code class="code"><span class="constructor">List</span>.rev</code></a><code class="code">&nbsp;(</code><a href="List.html#VALmap2"><code class="code"><span class="constructor">List</span>.map2</code></a><code class="code">&nbsp;f&nbsp;l1&nbsp;l2)</code>, but is tail-recursive and
   more efficient.</p>
</div>
</div>

<pre><span id="VALfold_left2"><span class="keyword">val</span> fold_left2</span> : <code class="type">f:('a -&gt; 'b -&gt; 'c -&gt; 'a) -&gt; init:'a -&gt; 'b list -&gt; 'c list -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">List</span>.fold_left2&nbsp;f&nbsp;a&nbsp;[b1;&nbsp;...;&nbsp;bn]&nbsp;[c1;&nbsp;...;&nbsp;cn]</code> is
   <code class="code">f&nbsp;(...&nbsp;(f&nbsp;(f&nbsp;a&nbsp;b1&nbsp;c1)&nbsp;b2&nbsp;c2)&nbsp;...)&nbsp;bn&nbsp;cn</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists are determined
   to have different lengths.</p>
</div>
</div>

<pre><span id="VALfold_right2"><span class="keyword">val</span> fold_right2</span> : <code class="type">f:('a -&gt; 'b -&gt; 'c -&gt; 'c) -&gt; 'a list -&gt; 'b list -&gt; init:'c -&gt; 'c</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">List</span>.fold_right2&nbsp;f&nbsp;[a1;&nbsp;...;&nbsp;an]&nbsp;[b1;&nbsp;...;&nbsp;bn]&nbsp;c</code> is
   <code class="code">f&nbsp;a1&nbsp;b1&nbsp;(f&nbsp;a2&nbsp;b2&nbsp;(...&nbsp;(f&nbsp;an&nbsp;bn&nbsp;c)&nbsp;...))</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists are determined
   to have different lengths.  Not tail-recursive.</p>
</div>
</div>
<h2 id="1_Listscanning">List scanning</h2>
<pre><span id="VALfor_all"><span class="keyword">val</span> for_all</span> : <code class="type">f:('a -&gt; bool) -&gt; 'a list -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">for_all&nbsp;p&nbsp;[a1;&nbsp;...;&nbsp;an]</code> checks if all elements of the list
   satisfy the predicate <code class="code">p</code>. That is, it returns
   <code class="code">(p&nbsp;a1)&nbsp;<span class="keywordsign">&amp;&amp;</span>&nbsp;(p&nbsp;a2)&nbsp;<span class="keywordsign">&amp;&amp;</span>&nbsp;...&nbsp;<span class="keywordsign">&amp;&amp;</span>&nbsp;(p&nbsp;an)</code>.</p>
</div>
</div>

<pre><span id="VALexists"><span class="keyword">val</span> exists</span> : <code class="type">f:('a -&gt; bool) -&gt; 'a list -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">exists&nbsp;p&nbsp;[a1;&nbsp;...;&nbsp;an]</code> checks if at least one element of
   the list satisfies the predicate <code class="code">p</code>. That is, it returns
   <code class="code">(p&nbsp;a1)&nbsp;<span class="keywordsign">||</span>&nbsp;(p&nbsp;a2)&nbsp;<span class="keywordsign">||</span>&nbsp;...&nbsp;<span class="keywordsign">||</span>&nbsp;(p&nbsp;an)</code>.</p>
</div>
</div>

<pre><span id="VALfor_all2"><span class="keyword">val</span> for_all2</span> : <code class="type">f:('a -&gt; 'b -&gt; bool) -&gt; 'a list -&gt; 'b list -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="List.html#VALfor_all"><code class="code"><span class="constructor">List</span>.for_all</code></a>, but for a two-argument predicate.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists are determined
   to have different lengths.</p>
</div>
</div>

<pre><span id="VALexists2"><span class="keyword">val</span> exists2</span> : <code class="type">f:('a -&gt; 'b -&gt; bool) -&gt; 'a list -&gt; 'b list -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="List.html#VALexists"><code class="code"><span class="constructor">List</span>.exists</code></a>, but for a two-argument predicate.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists are determined
   to have different lengths.</p>
</div>
</div>

<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type">'a -&gt; set:'a list -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">mem&nbsp;a&nbsp;l</code> is true if and only if <code class="code">a</code> is equal
   to an element of <code class="code">l</code>.</p>
</div>
</div>

<pre><span id="VALmemq"><span class="keyword">val</span> memq</span> : <code class="type">'a -&gt; set:'a list -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="List.html#VALmem"><code class="code"><span class="constructor">List</span>.mem</code></a>, but uses physical equality instead of structural
   equality to compare list elements.</p>
</div>
</div>
<h2 id="1_Listsearching">List searching</h2>
<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type">f:('a -&gt; bool) -&gt; 'a list -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find&nbsp;p&nbsp;l</code> returns the first element of the list <code class="code">l</code>
   that satisfies the predicate <code class="code">p</code>.
   Raise <code class="code"><span class="constructor">Not_found</span></code> if there is no value that satisfies <code class="code">p</code> in the
   list <code class="code">l</code>.</p>
</div>
</div>

<pre><span id="VALfind_opt"><span class="keyword">val</span> find_opt</span> : <code class="type">f:('a -&gt; bool) -&gt; 'a list -&gt; 'a option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find&nbsp;p&nbsp;l</code> returns the first element of the list <code class="code">l</code>
   that satisfies the predicate <code class="code">p</code>.
   Returns <code class="code"><span class="constructor">None</span></code> if there is no value that satisfies <code class="code">p</code> in the
   list <code class="code">l</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALfilter"><span class="keyword">val</span> filter</span> : <code class="type">f:('a -&gt; bool) -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">filter&nbsp;p&nbsp;l</code> returns all the elements of the list <code class="code">l</code>
   that satisfy the predicate <code class="code">p</code>.  The order of the elements
   in the input list is preserved.</p>
</div>
</div>

<pre><span id="VALfind_all"><span class="keyword">val</span> find_all</span> : <code class="type">f:('a -&gt; bool) -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_all</code> is another name for <a href="List.html#VALfilter"><code class="code"><span class="constructor">List</span>.filter</code></a>.</p>
</div>
</div>

<pre><span id="VALpartition"><span class="keyword">val</span> partition</span> : <code class="type">f:('a -&gt; bool) -&gt; 'a list -&gt; 'a list * 'a list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">partition&nbsp;p&nbsp;l</code> returns a pair of lists <code class="code">(l1,&nbsp;l2)</code>, where
   <code class="code">l1</code> is the list of all the elements of <code class="code">l</code> that
   satisfy the predicate <code class="code">p</code>, and <code class="code">l2</code> is the list of all the
   elements of <code class="code">l</code> that do not satisfy <code class="code">p</code>.
   The order of the elements in the input list is preserved.</p>
</div>
</div>
<h2 id="1_Associationlists">Association lists</h2>
<pre><span id="VALassoc"><span class="keyword">val</span> assoc</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; 'b</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">assoc&nbsp;a&nbsp;l</code> returns the value associated with key <code class="code">a</code> in the list of
   pairs <code class="code">l</code>. That is,
   <code class="code">assoc&nbsp;a&nbsp;[&nbsp;...;&nbsp;(a,b);&nbsp;...]&nbsp;=&nbsp;b</code>
   if <code class="code">(a,b)</code> is the leftmost binding of <code class="code">a</code> in list <code class="code">l</code>.
   Raise <code class="code"><span class="constructor">Not_found</span></code> if there is no value associated with <code class="code">a</code> in the
   list <code class="code">l</code>.</p>
</div>
</div>

<pre><span id="VALassoc_opt"><span class="keyword">val</span> assoc_opt</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; 'b option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">assoc_opt&nbsp;a&nbsp;l</code> returns the value associated with key <code class="code">a</code> in the list of
    pairs <code class="code">l</code>. That is,
    <code class="code">assoc&nbsp;a&nbsp;[&nbsp;...;&nbsp;(a,b);&nbsp;...]&nbsp;=&nbsp;b</code>
    if <code class="code">(a,b)</code> is the leftmost binding of <code class="code">a</code> in list <code class="code">l</code>.
    Returns <code class="code"><span class="constructor">None</span></code> if there is no value associated with <code class="code">a</code> in the
    list <code class="code">l</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALassq"><span class="keyword">val</span> assq</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; 'b</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="List.html#VALassoc"><code class="code"><span class="constructor">List</span>.assoc</code></a>, but uses physical equality instead of
   structural equality to compare keys.</p>
</div>
</div>

<pre><span id="VALassq_opt"><span class="keyword">val</span> assq_opt</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; 'b option</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="List.html#VALassoc_opt"><code class="code"><span class="constructor">List</span>.assoc_opt</code></a>, but uses physical equality instead of
   structural equality to compare keys.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>

<pre><span id="VALmem_assoc"><span class="keyword">val</span> mem_assoc</span> : <code class="type">'a -&gt; map:('a * 'b) list -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="List.html#VALassoc"><code class="code"><span class="constructor">List</span>.assoc</code></a>, but simply return true if a binding exists,
   and false if no bindings exist for the given key.</p>
</div>
</div>

<pre><span id="VALmem_assq"><span class="keyword">val</span> mem_assq</span> : <code class="type">'a -&gt; map:('a * 'b) list -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="List.html#VALmem_assoc"><code class="code"><span class="constructor">List</span>.mem_assoc</code></a>, but uses physical equality instead of
   structural equality to compare keys.</p>
</div>
</div>

<pre><span id="VALremove_assoc"><span class="keyword">val</span> remove_assoc</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; ('a * 'b) list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">remove_assoc&nbsp;a&nbsp;l</code> returns the list of
   pairs <code class="code">l</code> without the first pair with key <code class="code">a</code>, if any.
   Not tail-recursive.</p>
</div>
</div>

<pre><span id="VALremove_assq"><span class="keyword">val</span> remove_assq</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; ('a * 'b) list</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="List.html#VALremove_assoc"><code class="code"><span class="constructor">List</span>.remove_assoc</code></a>, but uses physical equality instead
   of structural equality to compare keys.  Not tail-recursive.</p>
</div>
</div>
<h2 id="1_Listsofpairs">Lists of pairs</h2>
<pre><span id="VALsplit"><span class="keyword">val</span> split</span> : <code class="type">('a * 'b) list -&gt; 'a list * 'b list</code></pre><div class="info ">
<div class="info-desc">
<p>Transform a list of pairs into a pair of lists:
   <code class="code">split&nbsp;[(a1,b1);&nbsp;...;&nbsp;(an,bn)]</code> is <code class="code">([a1;&nbsp;...;&nbsp;an],&nbsp;[b1;&nbsp;...;&nbsp;bn])</code>.
   Not tail-recursive.</p>
</div>
</div>

<pre><span id="VALcombine"><span class="keyword">val</span> combine</span> : <code class="type">'a list -&gt; 'b list -&gt; ('a * 'b) list</code></pre><div class="info ">
<div class="info-desc">
<p>Transform a pair of lists into a list of pairs:
   <code class="code">combine&nbsp;[a1;&nbsp;...;&nbsp;an]&nbsp;[b1;&nbsp;...;&nbsp;bn]</code> is
   <code class="code">[(a1,b1);&nbsp;...;&nbsp;(an,bn)]</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists
   have different lengths.  Not tail-recursive.</p>
</div>
</div>
<h2 id="1_Sorting">Sorting</h2>
<pre><span id="VALsort"><span class="keyword">val</span> sort</span> : <code class="type">cmp:('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p>Sort a list in increasing order according to a comparison
   function.  The comparison function must return 0 if its arguments
   compare as equal, a positive integer if the first is greater,
   and a negative integer if the first is smaller (see Array.sort for
   a complete specification).  For example,
   <a href="Stdlib.html#VALcompare"><code class="code">compare</code></a> is a suitable comparison function.
   The resulting list is sorted in increasing order.
   <code class="code"><span class="constructor">List</span>.sort</code> is guaranteed to run in constant heap space
   (in addition to the size of the result list) and logarithmic
   stack space.</p>

<p>The current implementation uses Merge Sort. It runs in constant
   heap space and logarithmic stack space.</p>
</div>
</div>

<pre><span id="VALstable_sort"><span class="keyword">val</span> stable_sort</span> : <code class="type">cmp:('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="List.html#VALsort"><code class="code"><span class="constructor">List</span>.sort</code></a>, but the sorting algorithm is guaranteed to
   be stable (i.e. elements that compare equal are kept in their
   original order) .</p>

<p>The current implementation uses Merge Sort. It runs in constant
   heap space and logarithmic stack space.</p>
</div>
</div>

<pre><span id="VALfast_sort"><span class="keyword">val</span> fast_sort</span> : <code class="type">cmp:('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="List.html#VALsort"><code class="code"><span class="constructor">List</span>.sort</code></a> or <a href="List.html#VALstable_sort"><code class="code"><span class="constructor">List</span>.stable_sort</code></a>, whichever is
    faster on typical input.</p>
</div>
</div>

<pre><span id="VALsort_uniq"><span class="keyword">val</span> sort_uniq</span> : <code class="type">cmp:('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="List.html#VALsort"><code class="code"><span class="constructor">List</span>.sort</code></a>, but also remove duplicates.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.03.0</li>
</ul>
</div>

<pre><span id="VALmerge"><span class="keyword">val</span> merge</span> : <code class="type">cmp:('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p>Merge two lists:
    Assuming that <code class="code">l1</code> and <code class="code">l2</code> are sorted according to the
    comparison function <code class="code">cmp</code>, <code class="code">merge&nbsp;cmp&nbsp;l1&nbsp;l2</code> will return a
    sorted list containing all the elements of <code class="code">l1</code> and <code class="code">l2</code>.
    If several elements compare equal, the elements of <code class="code">l1</code> will be
    before the elements of <code class="code">l2</code>.
    Not tail-recursive (sum of the lengths of the arguments).</p>
</div>
</div>
<h2 id="1_Iterators">Iterators</h2>
<pre><span id="VALto_seq"><span class="keyword">val</span> to_seq</span> : <code class="type">'a list -&gt; 'a <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Iterate on the list</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALof_seq"><span class="keyword">val</span> of_seq</span> : <code class="type">'a <a href="Seq.html#TYPEt">Seq.t</a> -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p>Create a list from the iterator</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>