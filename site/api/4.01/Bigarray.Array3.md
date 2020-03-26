<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Bigarray.Array3</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Bigarray.Array3.html">Bigarray.Array3</a></h1>

<pre><span class="keyword">module</span> Array3: <code class="code"><span class="keyword">sig</span></code> <a href="Bigarray.Array3.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Three-dimensional arrays. The <code class="code"><span class="constructor">Array3</span></code> structure provides operations
   similar to those of <a href="Bigarray.Genarray.html"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span></code></a>, but specialized to the case
   of three-dimensional arrays.<br>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">('a, 'b, 'c)</code> t</span> </pre>
<div class="info ">
The type of three-dimensional big arrays whose elements have
     OCaml type <code class="code"><span class="keywordsign">'</span>a</code>, representation kind <code class="code"><span class="keywordsign">'</span>b</code>, and memory layout <code class="code"><span class="keywordsign">'</span>c</code>.<br>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a> -&gt;<br>       'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt; int -&gt; int -&gt; int -&gt; ('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Array3</span>.create kind layout dim1 dim2 dim3</code> returns a new bigarray of
     three dimension, whose size is <code class="code">dim1</code> in the first dimension,
     <code class="code">dim2</code> in the second dimension, and <code class="code">dim3</code> in the third.
     <code class="code">kind</code> and <code class="code">layout</code> determine the array element kind and
     the array layout as described for <a href="Bigarray.Genarray.html#VALcreate"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.create</code></a>.<br>
</div>

<pre><span id="VALdim1"><span class="keyword">val</span> dim1</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
Return the first dimension of the given three-dimensional big array.<br>
</div>

<pre><span id="VALdim2"><span class="keyword">val</span> dim2</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
Return the second dimension of the given three-dimensional big array.<br>
</div>

<pre><span id="VALdim3"><span class="keyword">val</span> dim3</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
Return the third dimension of the given three-dimensional big array.<br>
</div>

<pre><span id="VALkind"><span class="keyword">val</span> kind</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt; ('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a></code></pre><div class="info ">
Return the kind of the given big array.<br>
</div>

<pre><span id="VALlayout"><span class="keyword">val</span> layout</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt; 'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a></code></pre><div class="info ">
Return the layout of the given big array.<br>
</div>

<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; int -&gt; 'a</code></pre><div class="info ">
<code class="code"><span class="constructor">Array3</span>.get a x y z</code>, also written <code class="code">a.{x,y,z}</code>,
     returns the element of <code class="code">a</code> at coordinates (<code class="code">x</code>, <code class="code">y</code>, <code class="code">z</code>).
     <code class="code">x</code>, <code class="code">y</code> and <code class="code">z</code> must be within the bounds of <code class="code">a</code>,
     as described for <a href="Bigarray.Genarray.html#VALget"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.get</code></a>;
     otherwise, <code class="code"><span class="constructor">Invalid_argument</span></code> is raised.<br>
</div>

<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; int -&gt; 'a -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">Array3</span>.set a x y v</code>, or alternatively <code class="code">a.{x,y,z} &lt;- v</code>,
     stores the value <code class="code">v</code> at coordinates (<code class="code">x</code>, <code class="code">y</code>, <code class="code">z</code>) in <code class="code">a</code>.
     <code class="code">x</code>, <code class="code">y</code> and <code class="code">z</code> must be within the bounds of <code class="code">a</code>,
     as described for <a href="Bigarray.Genarray.html#VALset"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.set</code></a>;
     otherwise, <code class="code"><span class="constructor">Invalid_argument</span></code> is raised.<br>
</div>

<pre><span id="VALsub_left"><span class="keyword">val</span> sub_left</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt;<br>       int -&gt; int -&gt; ('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Array3.html#TYPEt">t</a></code></pre><div class="info ">
Extract a three-dimensional sub-array of the given
     three-dimensional big array by restricting the first dimension.
     See <a href="Bigarray.Genarray.html#VALsub_left"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.sub_left</code></a> for more details.  <code class="code"><span class="constructor">Array3</span>.sub_left</code>
     applies only to arrays with C layout.<br>
</div>

<pre><span id="VALsub_right"><span class="keyword">val</span> sub_right</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt;<br>       int -&gt; int -&gt; ('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Array3.html#TYPEt">t</a></code></pre><div class="info ">
Extract a three-dimensional sub-array of the given
     three-dimensional big array by restricting the second dimension.
     See <a href="Bigarray.Genarray.html#VALsub_right"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.sub_right</code></a> for more details.  <code class="code"><span class="constructor">Array3</span>.sub_right</code>
     applies only to arrays with Fortran layout.<br>
</div>

<pre><span id="VALslice_left_1"><span class="keyword">val</span> slice_left_1</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt;<br>       int -&gt; int -&gt; ('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Array1.html#TYPEt">Bigarray.Array1.t</a></code></pre><div class="info ">
Extract a one-dimensional slice of the given three-dimensional
     big array by fixing the first two coordinates.
     The integer parameters are the coordinates of the slice to
     extract.  See <a href="Bigarray.Genarray.html#VALslice_left"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.slice_left</code></a> for more details.
     <code class="code"><span class="constructor">Array3</span>.slice_left_1</code> applies only to arrays with C layout.<br>
</div>

<pre><span id="VALslice_right_1"><span class="keyword">val</span> slice_right_1</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt;<br>       int -&gt; int -&gt; ('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Array1.html#TYPEt">Bigarray.Array1.t</a></code></pre><div class="info ">
Extract a one-dimensional slice of the given three-dimensional
     big array by fixing the last two coordinates.
     The integer parameters are the coordinates of the slice to
     extract.  See <a href="Bigarray.Genarray.html#VALslice_right"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.slice_right</code></a> for more details.
     <code class="code"><span class="constructor">Array3</span>.slice_right_1</code> applies only to arrays with Fortran
     layout.<br>
</div>

<pre><span id="VALslice_left_2"><span class="keyword">val</span> slice_left_2</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt;<br>       int -&gt; ('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Array2.html#TYPEt">Bigarray.Array2.t</a></code></pre><div class="info ">
Extract a  two-dimensional slice of the given three-dimensional
     big array by fixing the first coordinate.
     The integer parameter is the first coordinate of the slice to
     extract.  See <a href="Bigarray.Genarray.html#VALslice_left"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.slice_left</code></a> for more details.
     <code class="code"><span class="constructor">Array3</span>.slice_left_2</code> applies only to arrays with C layout.<br>
</div>

<pre><span id="VALslice_right_2"><span class="keyword">val</span> slice_right_2</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt;<br>       int -&gt; ('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Array2.html#TYPEt">Bigarray.Array2.t</a></code></pre><div class="info ">
Extract a two-dimensional slice of the given
     three-dimensional big array by fixing the last coordinate.
     The integer parameter is the coordinate of the slice
     to extract.  See <a href="Bigarray.Genarray.html#VALslice_right"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.slice_right</code></a> for more details.
     <code class="code"><span class="constructor">Array3</span>.slice_right_2</code> applies only to arrays with Fortran
     layout.<br>
</div>

<pre><span id="VALblit"><span class="keyword">val</span> blit</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt; ('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
Copy the first big array to the second big array.
     See <a href="Bigarray.Genarray.html#VALblit"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.blit</code></a> for more details.<br>
</div>

<pre><span id="VALfill"><span class="keyword">val</span> fill</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt; 'a -&gt; unit</code></pre><div class="info ">
Fill the given big array with the given value.
     See <a href="Bigarray.Genarray.html#VALfill"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.fill</code></a> for more details.<br>
</div>

<pre><span id="VALof_array"><span class="keyword">val</span> of_array</span> : <code class="type">('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a> -&gt;<br>       'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt; 'a array array array -&gt; ('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a></code></pre><div class="info ">
Build a three-dimensional big array initialized from the
     given array of arrays of arrays.<br>
</div>

<pre><span id="VALmap_file"><span class="keyword">val</span> map_file</span> : <code class="type"><a href="Unix.html#TYPEfile_descr">Unix.file_descr</a> -&gt;<br>       ?pos:int64 -&gt;<br>       ('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a> -&gt;<br>       'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt;<br>       bool -&gt; int -&gt; int -&gt; int -&gt; ('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a></code></pre><div class="info ">
Memory mapping of a file as a three-dimensional big array.
     See <a href="Bigarray.Genarray.html#VALmap_file"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Genarray</span>.map_file</code></a> for more details.<br>
</div>

<pre><span id="VALunsafe_get"><span class="keyword">val</span> unsafe_get</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; int -&gt; 'a</code></pre><div class="info ">
Like <a href="Bigarray.Array3.html#VALget"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array3</span>.get</code></a>, but bounds checking is not always
      performed.<br>
</div>

<pre><span id="VALunsafe_set"><span class="keyword">val</span> unsafe_set</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; int -&gt; 'a -&gt; unit</code></pre><div class="info ">
Like <a href="Bigarray.Array3.html#VALset"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array3</span>.set</code></a>, but bounds checking is not always
      performed.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>