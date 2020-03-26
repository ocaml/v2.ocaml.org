<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Bigarray.Array2</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Bigarray.Array2.html">Bigarray.Array2</a></h1>

<pre><span id="MODULEArray2"><span class="keyword">module</span> Array2</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Bigarray.Array2.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Two-dimensional arrays. The <code class="code"><span class="constructor">Array2</span></code> structure provides operations
   similar to those of <a href="Bigarray.Genarray.html"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span></code></a>, but specialized to the
   case of two-dimensional arrays.</p>
</div>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">('a, 'b, 'c)</code> t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of two-dimensional Bigarrays whose elements have
     OCaml type <code class="code"><span class="keywordsign">'</span>a</code>, representation kind <code class="code"><span class="keywordsign">'</span>b</code>, and memory layout <code class="code"><span class="keywordsign">'</span>c</code>.</p>
</div>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a> -&gt;<br>       'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt; int -&gt; int -&gt; ('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Array2</span>.create&nbsp;kind&nbsp;layout&nbsp;dim1&nbsp;dim2</code> returns a new Bigarray of
     two dimension, whose size is <code class="code">dim1</code> in the first dimension
     and <code class="code">dim2</code> in the second dimension.  <code class="code">kind</code> and <code class="code">layout</code>
     determine the array element kind and the array layout
     as described for <a href="Bigarray.Genarray.html#VALcreate"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.create</code></a>.</p>
</div>
</div>

<pre><span id="VALdim1"><span class="keyword">val</span> dim1</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Return the first dimension of the given two-dimensional Bigarray.</p>
</div>
</div>

<pre><span id="VALdim2"><span class="keyword">val</span> dim2</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Return the second dimension of the given two-dimensional Bigarray.</p>
</div>
</div>

<pre><span id="VALkind"><span class="keyword">val</span> kind</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt; ('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return the kind of the given Bigarray.</p>
</div>
</div>

<pre><span id="VALlayout"><span class="keyword">val</span> layout</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt; 'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return the layout of the given Bigarray.</p>
</div>
</div>

<pre><span id="VALchange_layout"><span class="keyword">val</span> change_layout</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt;<br>       'd <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt; ('a, 'b, 'd) <a href="Bigarray.Array2.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Array2</span>.change_layout&nbsp;a&nbsp;layout</code> returns a Bigarray with the
      specified <code class="code">layout</code>, sharing the data with <code class="code">a</code> (and hence having
      the same dimensions as <code class="code">a</code>). No copying of elements is involved: the
      new array and the original array share the same storage space.
      The dimensions are reversed, such that <code class="code">get&nbsp;v&nbsp;[|&nbsp;a;&nbsp;b&nbsp;|]</code> in
      C layout becomes <code class="code">get&nbsp;v&nbsp;[|&nbsp;b+1;&nbsp;a+1&nbsp;|]</code> in Fortran layout.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.06.0</li>
</ul>
</div>

<pre><span id="VALsize_in_bytes"><span class="keyword">val</span> size_in_bytes</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">size_in_bytes&nbsp;a</code> is the number of elements in <code class="code">a</code>
    multiplied by <code class="code">a</code>'s <a href="Bigarray.html#VALkind_size_in_bytes"><code class="code"><span class="constructor">Bigarray</span>.kind_size_in_bytes</code></a>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.03.0</li>
</ul>
</div>

<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Array2</span>.get&nbsp;a&nbsp;x&nbsp;y</code>, also written <code class="code">a.{x,y}</code>,
     returns the element of <code class="code">a</code> at coordinates (<code class="code">x</code>, <code class="code">y</code>).
     <code class="code">x</code> and <code class="code">y</code> must be within the bounds
     of <code class="code">a</code>, as described for <a href="Bigarray.Genarray.html#VALget"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.get</code></a>;
     otherwise, <code class="code"><span class="constructor">Invalid_argument</span></code> is raised.</p>
</div>
</div>

<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; 'a -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Array2</span>.set&nbsp;a&nbsp;x&nbsp;y&nbsp;v</code>, or alternatively <code class="code">a.{x,y}&nbsp;&lt;-&nbsp;v</code>,
     stores the value <code class="code">v</code> at coordinates (<code class="code">x</code>, <code class="code">y</code>) in <code class="code">a</code>.
     <code class="code">x</code> and <code class="code">y</code> must be within the bounds of <code class="code">a</code>,
     as described for <a href="Bigarray.Genarray.html#VALset"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.set</code></a>;
     otherwise, <code class="code"><span class="constructor">Invalid_argument</span></code> is raised.</p>
</div>
</div>

<pre><span id="VALsub_left"><span class="keyword">val</span> sub_left</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt;<br>       int -&gt; int -&gt; ('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Array2.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Extract a two-dimensional sub-array of the given two-dimensional
     Bigarray by restricting the first dimension.
     See <a href="Bigarray.Genarray.html#VALsub_left"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.sub_left</code></a> for more details.
     <code class="code"><span class="constructor">Array2</span>.sub_left</code> applies only to arrays with C layout.</p>
</div>
</div>

<pre><span id="VALsub_right"><span class="keyword">val</span> sub_right</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt;<br>       int -&gt; int -&gt; ('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Array2.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Extract a two-dimensional sub-array of the given two-dimensional
     Bigarray by restricting the second dimension.
     See <a href="Bigarray.Genarray.html#VALsub_right"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.sub_right</code></a> for more details.
     <code class="code"><span class="constructor">Array2</span>.sub_right</code> applies only to arrays with Fortran layout.</p>
</div>
</div>

<pre><span id="VALslice_left"><span class="keyword">val</span> slice_left</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt;<br>       int -&gt; ('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Array1.html#TYPEt">Bigarray.Array1.t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Extract a row (one-dimensional slice) of the given two-dimensional
     Bigarray.  The integer parameter is the index of the row to
     extract.  See <a href="Bigarray.Genarray.html#VALslice_left"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.slice_left</code></a> for more details.
     <code class="code"><span class="constructor">Array2</span>.slice_left</code> applies only to arrays with C layout.</p>
</div>
</div>

<pre><span id="VALslice_right"><span class="keyword">val</span> slice_right</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt;<br>       int -&gt; ('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Array1.html#TYPEt">Bigarray.Array1.t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Extract a column (one-dimensional slice) of the given
     two-dimensional Bigarray.  The integer parameter is the
     index of the column to extract.  See <a href="Bigarray.Genarray.html#VALslice_right"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.slice_right</code></a>
     for more details.  <code class="code"><span class="constructor">Array2</span>.slice_right</code> applies only to arrays
     with Fortran layout.</p>
</div>
</div>

<pre><span id="VALblit"><span class="keyword">val</span> blit</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt; ('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Copy the first Bigarray to the second Bigarray.
     See <a href="Bigarray.Genarray.html#VALblit"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.blit</code></a> for more details.</p>
</div>
</div>

<pre><span id="VALfill"><span class="keyword">val</span> fill</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt; 'a -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Fill the given Bigarray with the given value.
     See <a href="Bigarray.Genarray.html#VALfill"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.fill</code></a> for more details.</p>
</div>
</div>

<pre><span id="VALof_array"><span class="keyword">val</span> of_array</span> : <code class="type">('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a> -&gt;<br>       'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt; 'a array array -&gt; ('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Build a two-dimensional Bigarray initialized from the
     given array of arrays.</p>
</div>
</div>

<pre><span id="VALunsafe_get"><span class="keyword">val</span> unsafe_get</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p>Like <a href="Bigarray.Array2.html#VALget"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array2</span>.get</code></a>, but bounds checking is not always
      performed.</p>
</div>
</div>

<pre><span id="VALunsafe_set"><span class="keyword">val</span> unsafe_set</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; 'a -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Like <a href="Bigarray.Array2.html#VALset"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array2</span>.set</code></a>, but bounds checking is not always
      performed.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>