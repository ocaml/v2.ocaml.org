<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Bigarray.Array1</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Bigarray.Array1.html">Bigarray.Array1</a></h1>

<pre><span class="keyword">module</span> Array1: <code class="code"><span class="keyword">sig</span></code> <a href="Bigarray.Array1.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
One-dimensional arrays. The <code class="code"><span class="constructor">Array1</span></code> structure provides operations
   similar to those of
   <a href="Bigarray.Genarray.html"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span></code></a>, but specialized to the case of one-dimensional arrays.
   (The <a href="Bigarray.Array2.html"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array2</span></code></a> and <a href="Bigarray.Array3.html"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array3</span></code></a> structures below provide operations
   specialized for two- and three-dimensional arrays.)
   Statically knowing the number of dimensions of the array allows
   faster operations, and more precise static type-checking.<br>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">('a, 'b, 'c)</code> t</span> </pre>
<div class="info ">
The type of one-dimensional big arrays whose elements have
     OCaml type <code class="code"><span class="keywordsign">'</span>a</code>, representation kind <code class="code"><span class="keywordsign">'</span>b</code>, and memory layout <code class="code"><span class="keywordsign">'</span>c</code>.<br>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a> -&gt;<br>       'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt; int -&gt; ('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Array1</span>.create&nbsp;kind&nbsp;layout&nbsp;dim</code> returns a new bigarray of
     one dimension, whose size is <code class="code">dim</code>.  <code class="code">kind</code> and <code class="code">layout</code>
     determine the array element kind and the array layout
     as described for <a href="Bigarray.Genarray.html#VALcreate"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.create</code></a>.<br>
</div>

<pre><span id="VALdim"><span class="keyword">val</span> dim</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
Return the size (dimension) of the given one-dimensional
     big array.<br>
</div>

<pre><span id="VALkind"><span class="keyword">val</span> kind</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a> -&gt; ('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a></code></pre><div class="info ">
Return the kind of the given big array.<br>
</div>

<pre><span id="VALlayout"><span class="keyword">val</span> layout</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a> -&gt; 'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a></code></pre><div class="info ">
Return the layout of the given big array.<br>
</div>

<pre><span id="VALsize_in_bytes"><span class="keyword">val</span> size_in_bytes</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<code class="code">size_in_bytes&nbsp;a</code> is the number of elements in <code class="code">a</code>
    multiplied by <code class="code">a</code>'s <a href="Bigarray.html#VALkind_size_in_bytes"><code class="code"><span class="constructor">Bigarray</span>.kind_size_in_bytes</code></a>.<br>
<b>Since</b> 4.03.0<br>
</div>

<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a> -&gt; int -&gt; 'a</code></pre><div class="info ">
<code class="code"><span class="constructor">Array1</span>.get&nbsp;a&nbsp;x</code>, or alternatively <code class="code">a.{x}</code>,
     returns the element of <code class="code">a</code> at index <code class="code">x</code>.
     <code class="code">x</code> must be greater or equal than <code class="code">0</code> and strictly less than
     <code class="code"><span class="constructor">Array1</span>.dim&nbsp;a</code> if <code class="code">a</code> has C layout.  If <code class="code">a</code> has Fortran layout,
     <code class="code">x</code> must be greater or equal than <code class="code">1</code> and less or equal than
     <code class="code"><span class="constructor">Array1</span>.dim&nbsp;a</code>.  Otherwise, <code class="code"><span class="constructor">Invalid_argument</span></code> is raised.<br>
</div>

<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a> -&gt; int -&gt; 'a -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">Array1</span>.set&nbsp;a&nbsp;x&nbsp;v</code>, also written <code class="code">a.{x}&nbsp;&lt;-&nbsp;v</code>,
     stores the value <code class="code">v</code> at index <code class="code">x</code> in <code class="code">a</code>.
     <code class="code">x</code> must be inside the bounds of <code class="code">a</code> as described in
     <a href="Bigarray.Array1.html#VALget"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array1</span>.get</code></a>;
     otherwise, <code class="code"><span class="constructor">Invalid_argument</span></code> is raised.<br>
</div>

<pre><span id="VALsub"><span class="keyword">val</span> sub</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a> -&gt;<br>       int -&gt; int -&gt; ('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a></code></pre><div class="info ">
Extract a sub-array of the given one-dimensional big array.
     See <a href="Bigarray.Genarray.html#VALsub_left"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.sub_left</code></a> for more details.<br>
</div>

<pre><span id="VALslice"><span class="keyword">val</span> slice</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a> -&gt; int -&gt; ('a, 'b, 'c) <a href="Bigarray.Array0.html#TYPEt">Bigarray.Array0.t</a></code></pre><div class="info ">
Extract a scalar (zero-dimensional slice) of the given one-dimensional
     big array.  The integer parameter is the index of the scalar to
     extract.  See <a href="Bigarray.Genarray.html#VALslice_left"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.slice_left</code></a> and
     <a href="Bigarray.Genarray.html#VALslice_right"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.slice_right</code></a> for more details.<br>
<b>Since</b> 4.05.0<br>
</div>

<pre><span id="VALblit"><span class="keyword">val</span> blit</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a> -&gt; ('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
Copy the first big array to the second big array.
     See <a href="Bigarray.Genarray.html#VALblit"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.blit</code></a> for more details.<br>
</div>

<pre><span id="VALfill"><span class="keyword">val</span> fill</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a> -&gt; 'a -&gt; unit</code></pre><div class="info ">
Fill the given big array with the given value.
     See <a href="Bigarray.Genarray.html#VALfill"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.fill</code></a> for more details.<br>
</div>

<pre><span id="VALof_array"><span class="keyword">val</span> of_array</span> : <code class="type">('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a> -&gt;<br>       'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt; 'a array -&gt; ('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a></code></pre><div class="info ">
Build a one-dimensional big array initialized from the
     given array.<br>
</div>

<pre><span id="VALmap_file"><span class="keyword">val</span> map_file</span> : <code class="type"><a href="Unix.html#TYPEfile_descr">Unix.file_descr</a> -&gt;<br>       ?pos:int64 -&gt;<br>       ('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a> -&gt;<br>       'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt; bool -&gt; int -&gt; ('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a></code></pre><div class="info ">
Memory mapping of a file as a one-dimensional big array.
     See <a href="Bigarray.Genarray.html#VALmap_file"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.map_file</code></a> for more details.<br>
</div>

<pre><span id="VALunsafe_get"><span class="keyword">val</span> unsafe_get</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a> -&gt; int -&gt; 'a</code></pre><div class="info ">
Like <a href="Bigarray.Array1.html#VALget"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array1</span>.get</code></a>, but bounds checking is not always performed.
      Use with caution and only when the program logic guarantees that
      the access is within bounds.<br>
</div>

<pre><span id="VALunsafe_set"><span class="keyword">val</span> unsafe_set</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">t</a> -&gt; int -&gt; 'a -&gt; unit</code></pre><div class="info ">
Like <a href="Bigarray.Array1.html#VALset"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array1</span>.set</code></a>, but bounds checking is not always performed.
      Use with caution and only when the program logic guarantees that
      the access is within bounds.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>