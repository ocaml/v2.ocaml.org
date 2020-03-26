<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">List</a></div><ul></ul></nav></header>

<h1>Module <a href="type_List.html">List</a></h1>

<pre><span class="keyword">module</span> List: <code class="code"><span class="keyword">sig</span></code> <a href="List.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
List operations.
<p>

   Some functions are flagged as not tail-recursive.  A tail-recursive
   function uses constant stack space, while a non-tail-recursive function
   uses stack space proportional to the length of its list argument, which
   can be a problem with very long lists.  When the function takes several
   list arguments, an approximate formula giving stack usage (in some
   unspecified constant unit) is shown in parentheses.
</p><p>

   The above considerations can usually be ignored if your lists are not
   longer than about 10000 elements.<br>
</p></div>
<hr width="100%">

<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">'a list -&gt; int</code></pre><div class="info ">
Return the length (number of elements) of the given list.<br>
</div>

<pre><span id="VALcons"><span class="keyword">val</span> cons</span> : <code class="type">'a -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<code class="code">cons x xs</code> is <code class="code">x :: xs</code><br>
<b>Since</b> 4.03.0<br>
</div>

<pre><span id="VALhd"><span class="keyword">val</span> hd</span> : <code class="type">'a list -&gt; 'a</code></pre><div class="info ">
Return the first element of the given list. Raise
   <code class="code"><span class="constructor">Failure</span> <span class="string">"hd"</span></code> if the list is empty.<br>
</div>

<pre><span id="VALtl"><span class="keyword">val</span> tl</span> : <code class="type">'a list -&gt; 'a list</code></pre><div class="info ">
Return the given list without its first element. Raise
   <code class="code"><span class="constructor">Failure</span> <span class="string">"tl"</span></code> if the list is empty.<br>
</div>

<pre><span id="VALnth"><span class="keyword">val</span> nth</span> : <code class="type">'a list -&gt; int -&gt; 'a</code></pre><div class="info ">
Return the <code class="code">n</code>-th element of the given list.
   The first element (head of the list) is at position 0.
   Raise <code class="code"><span class="constructor">Failure</span> <span class="string">"nth"</span></code> if the list is too short.
   Raise <code class="code"><span class="constructor">Invalid_argument</span> <span class="string">"List.nth"</span></code> if <code class="code">n</code> is negative.<br>
</div>

<pre><span id="VALrev"><span class="keyword">val</span> rev</span> : <code class="type">'a list -&gt; 'a list</code></pre><div class="info ">
List reversal.<br>
</div>

<pre><span id="VALappend"><span class="keyword">val</span> append</span> : <code class="type">'a list -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
Concatenate two lists.  Same as the infix operator <code class="code">@</code>.
   Not tail-recursive (length of the first argument).<br>
</div>

<pre><span id="VALrev_append"><span class="keyword">val</span> rev_append</span> : <code class="type">'a list -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<code class="code"><span class="constructor">List</span>.rev_append l1 l2</code> reverses <code class="code">l1</code> and concatenates it to <code class="code">l2</code>.
   This is equivalent to <a href="List.html#VALrev"><code class="code"><span class="constructor">List</span>.rev</code></a><code class="code"> l1 @ l2</code>, but <code class="code">rev_append</code> is
   tail-recursive and more efficient.<br>
</div>

<pre><span id="VALconcat"><span class="keyword">val</span> concat</span> : <code class="type">'a list list -&gt; 'a list</code></pre><div class="info ">
Concatenate a list of lists.  The elements of the argument are all
   concatenated together (in the same order) to give the result.
   Not tail-recursive
   (length of the argument + length of the longest sub-list).<br>
</div>

<pre><span id="VALflatten"><span class="keyword">val</span> flatten</span> : <code class="type">'a list list -&gt; 'a list</code></pre><div class="info ">
Same as <code class="code">concat</code>.  Not tail-recursive
   (length of the argument + length of the longest sub-list).<br>
</div>
<br>
<h6 id="6_Iterators">Iterators</h6><br>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">('a -&gt; unit) -&gt; 'a list -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">List</span>.iter f [a1; ...; an]</code> applies function <code class="code">f</code> in turn to
   <code class="code">a1; ...; an</code>. It is equivalent to
   <code class="code"><span class="keyword">begin</span> f a1; f a2; ...; f an; () <span class="keyword">end</span></code>.<br>
</div>

<pre><span id="VALiteri"><span class="keyword">val</span> iteri</span> : <code class="type">(int -&gt; 'a -&gt; unit) -&gt; 'a list -&gt; unit</code></pre><div class="info ">
Same as <a href="List.html#VALiter"><code class="code"><span class="constructor">List</span>.iter</code></a>, but the function is applied to the index of
   the element as first argument (counting from 0), and the element
   itself as second argument.<br>
<b>Since</b> 4.00.0<br>
</div>

<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">('a -&gt; 'b) -&gt; 'a list -&gt; 'b list</code></pre><div class="info ">
<code class="code"><span class="constructor">List</span>.map f [a1; ...; an]</code> applies function <code class="code">f</code> to <code class="code">a1, ..., an</code>,
   and builds the list <code class="code">[f a1; ...; f an]</code>
   with the results returned by <code class="code">f</code>.  Not tail-recursive.<br>
</div>

<pre><span id="VALmapi"><span class="keyword">val</span> mapi</span> : <code class="type">(int -&gt; 'a -&gt; 'b) -&gt; 'a list -&gt; 'b list</code></pre><div class="info ">
Same as <a href="List.html#VALmap"><code class="code"><span class="constructor">List</span>.map</code></a>, but the function is applied to the index of
   the element as first argument (counting from 0), and the element
   itself as second argument.  Not tail-recursive.<br>
<b>Since</b> 4.00.0<br>
</div>

<pre><span id="VALrev_map"><span class="keyword">val</span> rev_map</span> : <code class="type">('a -&gt; 'b) -&gt; 'a list -&gt; 'b list</code></pre><div class="info ">
<code class="code"><span class="constructor">List</span>.rev_map f l</code> gives the same result as
   <a href="List.html#VALrev"><code class="code"><span class="constructor">List</span>.rev</code></a><code class="code"> (</code><a href="List.html#VALmap"><code class="code"><span class="constructor">List</span>.map</code></a><code class="code"> f l)</code>, but is tail-recursive and
   more efficient.<br>
</div>

<pre><span id="VALfold_left"><span class="keyword">val</span> fold_left</span> : <code class="type">('a -&gt; 'b -&gt; 'a) -&gt; 'a -&gt; 'b list -&gt; 'a</code></pre><div class="info ">
<code class="code"><span class="constructor">List</span>.fold_left f a [b1; ...; bn]</code> is
   <code class="code">f (... (f (f a b1) b2) ...) bn</code>.<br>
</div>

<pre><span id="VALfold_right"><span class="keyword">val</span> fold_right</span> : <code class="type">('a -&gt; 'b -&gt; 'b) -&gt; 'a list -&gt; 'b -&gt; 'b</code></pre><div class="info ">
<code class="code"><span class="constructor">List</span>.fold_right f [a1; ...; an] b</code> is
   <code class="code">f a1 (f a2 (... (f an b) ...))</code>.  Not tail-recursive.<br>
</div>
<br>
<h6 id="6_Iteratorsontwolists">Iterators on two lists</h6><br>

<pre><span id="VALiter2"><span class="keyword">val</span> iter2</span> : <code class="type">('a -&gt; 'b -&gt; unit) -&gt; 'a list -&gt; 'b list -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">List</span>.iter2 f [a1; ...; an] [b1; ...; bn]</code> calls in turn
   <code class="code">f a1 b1; ...; f an bn</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists are determined
   to have different lengths.<br>
</div>

<pre><span id="VALmap2"><span class="keyword">val</span> map2</span> : <code class="type">('a -&gt; 'b -&gt; 'c) -&gt; 'a list -&gt; 'b list -&gt; 'c list</code></pre><div class="info ">
<code class="code"><span class="constructor">List</span>.map2 f [a1; ...; an] [b1; ...; bn]</code> is
   <code class="code">[f a1 b1; ...; f an bn]</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists are determined
   to have different lengths.  Not tail-recursive.<br>
</div>

<pre><span id="VALrev_map2"><span class="keyword">val</span> rev_map2</span> : <code class="type">('a -&gt; 'b -&gt; 'c) -&gt; 'a list -&gt; 'b list -&gt; 'c list</code></pre><div class="info ">
<code class="code"><span class="constructor">List</span>.rev_map2 f l1 l2</code> gives the same result as
   <a href="List.html#VALrev"><code class="code"><span class="constructor">List</span>.rev</code></a><code class="code"> (</code><a href="List.html#VALmap2"><code class="code"><span class="constructor">List</span>.map2</code></a><code class="code"> f l1 l2)</code>, but is tail-recursive and
   more efficient.<br>
</div>

<pre><span id="VALfold_left2"><span class="keyword">val</span> fold_left2</span> : <code class="type">('a -&gt; 'b -&gt; 'c -&gt; 'a) -&gt; 'a -&gt; 'b list -&gt; 'c list -&gt; 'a</code></pre><div class="info ">
<code class="code"><span class="constructor">List</span>.fold_left2 f a [b1; ...; bn] [c1; ...; cn]</code> is
   <code class="code">f (... (f (f a b1 c1) b2 c2) ...) bn cn</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists are determined
   to have different lengths.<br>
</div>

<pre><span id="VALfold_right2"><span class="keyword">val</span> fold_right2</span> : <code class="type">('a -&gt; 'b -&gt; 'c -&gt; 'c) -&gt; 'a list -&gt; 'b list -&gt; 'c -&gt; 'c</code></pre><div class="info ">
<code class="code"><span class="constructor">List</span>.fold_right2 f [a1; ...; an] [b1; ...; bn] c</code> is
   <code class="code">f a1 b1 (f a2 b2 (... (f an bn c) ...))</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists are determined
   to have different lengths.  Not tail-recursive.<br>
</div>
<br>
<h6 id="6_Listscanning">List scanning</h6><br>

<pre><span id="VALfor_all"><span class="keyword">val</span> for_all</span> : <code class="type">('a -&gt; bool) -&gt; 'a list -&gt; bool</code></pre><div class="info ">
<code class="code">for_all p [a1; ...; an]</code> checks if all elements of the list
   satisfy the predicate <code class="code">p</code>. That is, it returns
   <code class="code">(p a1) <span class="keywordsign">&amp;&amp;</span> (p a2) <span class="keywordsign">&amp;&amp;</span> ... <span class="keywordsign">&amp;&amp;</span> (p an)</code>.<br>
</div>

<pre><span id="VALexists"><span class="keyword">val</span> exists</span> : <code class="type">('a -&gt; bool) -&gt; 'a list -&gt; bool</code></pre><div class="info ">
<code class="code">exists p [a1; ...; an]</code> checks if at least one element of
   the list satisfies the predicate <code class="code">p</code>. That is, it returns
   <code class="code">(p a1) <span class="keywordsign">||</span> (p a2) <span class="keywordsign">||</span> ... <span class="keywordsign">||</span> (p an)</code>.<br>
</div>

<pre><span id="VALfor_all2"><span class="keyword">val</span> for_all2</span> : <code class="type">('a -&gt; 'b -&gt; bool) -&gt; 'a list -&gt; 'b list -&gt; bool</code></pre><div class="info ">
Same as <a href="List.html#VALfor_all"><code class="code"><span class="constructor">List</span>.for_all</code></a>, but for a two-argument predicate.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists are determined
   to have different lengths.<br>
</div>

<pre><span id="VALexists2"><span class="keyword">val</span> exists2</span> : <code class="type">('a -&gt; 'b -&gt; bool) -&gt; 'a list -&gt; 'b list -&gt; bool</code></pre><div class="info ">
Same as <a href="List.html#VALexists"><code class="code"><span class="constructor">List</span>.exists</code></a>, but for a two-argument predicate.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists are determined
   to have different lengths.<br>
</div>

<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type">'a -&gt; 'a list -&gt; bool</code></pre><div class="info ">
<code class="code">mem a l</code> is true if and only if <code class="code">a</code> is equal
   to an element of <code class="code">l</code>.<br>
</div>

<pre><span id="VALmemq"><span class="keyword">val</span> memq</span> : <code class="type">'a -&gt; 'a list -&gt; bool</code></pre><div class="info ">
Same as <a href="List.html#VALmem"><code class="code"><span class="constructor">List</span>.mem</code></a>, but uses physical equality instead of structural
   equality to compare list elements.<br>
</div>
<br>
<h6 id="6_Listsearching">List searching</h6><br>

<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type">('a -&gt; bool) -&gt; 'a list -&gt; 'a</code></pre><div class="info ">
<code class="code">find p l</code> returns the first element of the list <code class="code">l</code>
   that satisfies the predicate <code class="code">p</code>.
   Raise <code class="code"><span class="constructor">Not_found</span></code> if there is no value that satisfies <code class="code">p</code> in the
   list <code class="code">l</code>.<br>
</div>

<pre><span id="VALfilter"><span class="keyword">val</span> filter</span> : <code class="type">('a -&gt; bool) -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<code class="code">filter p l</code> returns all the elements of the list <code class="code">l</code>
   that satisfy the predicate <code class="code">p</code>.  The order of the elements
   in the input list is preserved.<br>
</div>

<pre><span id="VALfind_all"><span class="keyword">val</span> find_all</span> : <code class="type">('a -&gt; bool) -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
<code class="code">find_all</code> is another name for <a href="List.html#VALfilter"><code class="code"><span class="constructor">List</span>.filter</code></a>.<br>
</div>

<pre><span id="VALpartition"><span class="keyword">val</span> partition</span> : <code class="type">('a -&gt; bool) -&gt; 'a list -&gt; 'a list * 'a list</code></pre><div class="info ">
<code class="code">partition p l</code> returns a pair of lists <code class="code">(l1, l2)</code>, where
   <code class="code">l1</code> is the list of all the elements of <code class="code">l</code> that
   satisfy the predicate <code class="code">p</code>, and <code class="code">l2</code> is the list of all the
   elements of <code class="code">l</code> that do not satisfy <code class="code">p</code>.
   The order of the elements in the input list is preserved.<br>
</div>
<br>
<h6 id="6_Associationlists">Association lists</h6><br>

<pre><span id="VALassoc"><span class="keyword">val</span> assoc</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; 'b</code></pre><div class="info ">
<code class="code">assoc a l</code> returns the value associated with key <code class="code">a</code> in the list of
   pairs <code class="code">l</code>. That is,
   <code class="code">assoc a [ ...; (a,b); ...] = b</code>
   if <code class="code">(a,b)</code> is the leftmost binding of <code class="code">a</code> in list <code class="code">l</code>.
   Raise <code class="code"><span class="constructor">Not_found</span></code> if there is no value associated with <code class="code">a</code> in the
   list <code class="code">l</code>.<br>
</div>

<pre><span id="VALassq"><span class="keyword">val</span> assq</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; 'b</code></pre><div class="info ">
Same as <a href="List.html#VALassoc"><code class="code"><span class="constructor">List</span>.assoc</code></a>, but uses physical equality instead of structural
   equality to compare keys.<br>
</div>

<pre><span id="VALmem_assoc"><span class="keyword">val</span> mem_assoc</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; bool</code></pre><div class="info ">
Same as <a href="List.html#VALassoc"><code class="code"><span class="constructor">List</span>.assoc</code></a>, but simply return true if a binding exists,
   and false if no bindings exist for the given key.<br>
</div>

<pre><span id="VALmem_assq"><span class="keyword">val</span> mem_assq</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; bool</code></pre><div class="info ">
Same as <a href="List.html#VALmem_assoc"><code class="code"><span class="constructor">List</span>.mem_assoc</code></a>, but uses physical equality instead of
   structural equality to compare keys.<br>
</div>

<pre><span id="VALremove_assoc"><span class="keyword">val</span> remove_assoc</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; ('a * 'b) list</code></pre><div class="info ">
<code class="code">remove_assoc a l</code> returns the list of
   pairs <code class="code">l</code> without the first pair with key <code class="code">a</code>, if any.
   Not tail-recursive.<br>
</div>

<pre><span id="VALremove_assq"><span class="keyword">val</span> remove_assq</span> : <code class="type">'a -&gt; ('a * 'b) list -&gt; ('a * 'b) list</code></pre><div class="info ">
Same as <a href="List.html#VALremove_assoc"><code class="code"><span class="constructor">List</span>.remove_assoc</code></a>, but uses physical equality instead
   of structural equality to compare keys.  Not tail-recursive.<br>
</div>
<br>
<h6 id="6_Listsofpairs">Lists of pairs</h6><br>

<pre><span id="VALsplit"><span class="keyword">val</span> split</span> : <code class="type">('a * 'b) list -&gt; 'a list * 'b list</code></pre><div class="info ">
Transform a list of pairs into a pair of lists:
   <code class="code">split [(a1,b1); ...; (an,bn)]</code> is <code class="code">([a1; ...; an], [b1; ...; bn])</code>.
   Not tail-recursive.<br>
</div>

<pre><span id="VALcombine"><span class="keyword">val</span> combine</span> : <code class="type">'a list -&gt; 'b list -&gt; ('a * 'b) list</code></pre><div class="info ">
Transform a pair of lists into a list of pairs:
   <code class="code">combine [a1; ...; an] [b1; ...; bn]</code> is
   <code class="code">[(a1,b1); ...; (an,bn)]</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the two lists
   have different lengths.  Not tail-recursive.<br>
</div>
<br>
<h6 id="6_Sorting">Sorting</h6><br>

<pre><span id="VALsort"><span class="keyword">val</span> sort</span> : <code class="type">('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
Sort a list in increasing order according to a comparison
   function.  The comparison function must return 0 if its arguments
   compare as equal, a positive integer if the first is greater,
   and a negative integer if the first is smaller (see Array.sort for
   a complete specification).  For example,
   <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a> is a suitable comparison function.
   The resulting list is sorted in increasing order.
   <code class="code"><span class="constructor">List</span>.sort</code> is guaranteed to run in constant heap space
   (in addition to the size of the result list) and logarithmic
   stack space.
<p>

   The current implementation uses Merge Sort. It runs in constant
   heap space and logarithmic stack space.<br>
</p></div>

<pre><span id="VALstable_sort"><span class="keyword">val</span> stable_sort</span> : <code class="type">('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
Same as <a href="List.html#VALsort"><code class="code"><span class="constructor">List</span>.sort</code></a>, but the sorting algorithm is guaranteed to
   be stable (i.e. elements that compare equal are kept in their
   original order) .
<p>

   The current implementation uses Merge Sort. It runs in constant
   heap space and logarithmic stack space.<br>
</p></div>

<pre><span id="VALfast_sort"><span class="keyword">val</span> fast_sort</span> : <code class="type">('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
Same as <a href="List.html#VALsort"><code class="code"><span class="constructor">List</span>.sort</code></a> or <a href="List.html#VALstable_sort"><code class="code"><span class="constructor">List</span>.stable_sort</code></a>, whichever is faster
    on typical input.<br>
</div>

<pre><span id="VALsort_uniq"><span class="keyword">val</span> sort_uniq</span> : <code class="type">('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
Same as <a href="List.html#VALsort"><code class="code"><span class="constructor">List</span>.sort</code></a>, but also remove duplicates.<br>
<b>Since</b> 4.02.0<br>
</div>

<pre><span id="VALmerge"><span class="keyword">val</span> merge</span> : <code class="type">('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
Merge two lists:
    Assuming that <code class="code">l1</code> and <code class="code">l2</code> are sorted according to the
    comparison function <code class="code">cmp</code>, <code class="code">merge cmp l1 l2</code> will return a
    sorted list containting all the elements of <code class="code">l1</code> and <code class="code">l2</code>.
    If several elements compare equal, the elements of <code class="code">l1</code> will be
    before the elements of <code class="code">l2</code>.
    Not tail-recursive (sum of the lengths of the arguments).<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>