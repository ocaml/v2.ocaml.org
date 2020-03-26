<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Sort</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Sort.html">Sort</a></h1>

<pre><span class="keyword">module</span> Sort: <code class="code"><span class="keyword">sig</span></code> <a href="Sort.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<span class="warning">Deprecated.</span>This module is obsolete and exists only for backward
   compatibility.
   The sorting functions in <a href="Array.html"><code class="code"><span class="constructor">Array</span></code></a> and <a href="List.html"><code class="code"><span class="constructor">List</span></code></a> should be used instead.
   The new functions are faster and use less memory.<br>
Sorting and merging lists.<br>
</div>
<hr width="100%">

<pre><span id="VALlist"><span class="keyword">val</span> list</span> : <code class="type">('a -&gt; 'a -&gt; bool) -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
Sort a list in increasing order according to an ordering predicate.
   The predicate should return <code class="code"><span class="keyword">true</span></code> if its first argument is
   less than or equal to its second argument.<br>
</div>

<pre><span id="VALarray"><span class="keyword">val</span> array</span> : <code class="type">('a -&gt; 'a -&gt; bool) -&gt; 'a array -&gt; unit</code></pre><div class="info ">
Sort an array in increasing order according to an
   ordering predicate.
   The predicate should return <code class="code"><span class="keyword">true</span></code> if its first argument is
   less than or equal to its second argument.
   The array is sorted in place.<br>
</div>

<pre><span id="VALmerge"><span class="keyword">val</span> merge</span> : <code class="type">('a -&gt; 'a -&gt; bool) -&gt; 'a list -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
Merge two lists according to the given predicate.
   Assuming the two argument lists are sorted according to the
   predicate, <code class="code">merge</code> returns a sorted list containing the elements
   from the two lists. The behavior is undefined if the two
   argument lists were not sorted.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>