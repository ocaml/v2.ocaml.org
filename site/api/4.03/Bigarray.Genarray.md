<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Bigarray.Genarray</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Bigarray.Genarray.html">Bigarray.Genarray</a></h1>

<pre><span class="keyword">module</span> Genarray: <code class="code"><span class="keyword">sig</span></code> <a href="Bigarray.Genarray.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">('a, 'b, 'c)</code> t</span> </pre>
<div class="info ">
The type <code class="code"><span class="constructor">Genarray</span>.t</code> is the type of big arrays with variable
     numbers of dimensions.  Any number of dimensions between 1 and 16
     is supported.
<p>

     The three type parameters to <code class="code"><span class="constructor">Genarray</span>.t</code> identify the array element
     kind and layout, as follows:</p><ul>
<li>the first parameter, <code class="code"><span class="keywordsign">'</span>a</code>, is the OCaml type for accessing array
       elements (<code class="code">float</code>, <code class="code">int</code>, <code class="code">int32</code>, <code class="code">int64</code>, <code class="code">nativeint</code>);</li>
<li>the second parameter, <code class="code"><span class="keywordsign">'</span>b</code>, is the actual kind of array elements
       (<code class="code">float32_elt</code>, <code class="code">float64_elt</code>, <code class="code">int8_signed_elt</code>, <code class="code">int8_unsigned_elt</code>,
       etc);</li>
<li>the third parameter, <code class="code"><span class="keywordsign">'</span>c</code>, identifies the array layout
       (<code class="code">c_layout</code> or <code class="code">fortran_layout</code>).</li>
</ul>

     For instance, <code class="code">(float, float32_elt, fortran_layout) <span class="constructor">Genarray</span>.t</code>
     is the type of generic big arrays containing 32-bit floats
     in Fortran layout; reads and writes in this array use the
     OCaml type <code class="code">float</code>.<br>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a> -&gt;<br>       'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt; int array -&gt; ('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Genarray</span>.create kind layout dimensions</code> returns a new big array
     whose element kind is determined by the parameter <code class="code">kind</code> (one of
     <code class="code">float32</code>, <code class="code">float64</code>, <code class="code">int8_signed</code>, etc) and whose layout is
     determined by the parameter <code class="code">layout</code> (one of <code class="code">c_layout</code> or
     <code class="code">fortran_layout</code>).  The <code class="code">dimensions</code> parameter is an array of
     integers that indicate the size of the big array in each dimension.
     The length of <code class="code">dimensions</code> determines the number of dimensions
     of the bigarray.
<p>

     For instance, <code class="code"><span class="constructor">Genarray</span>.create int32 c_layout [|4;6;8|]</code>
     returns a fresh big array of 32-bit integers, in C layout,
     having three dimensions, the three dimensions being 4, 6 and 8
     respectively.
</p><p>

     Big arrays returned by <code class="code"><span class="constructor">Genarray</span>.create</code> are not initialized:
     the initial values of array elements is unspecified.
</p><p>

     <code class="code"><span class="constructor">Genarray</span>.create</code> raises <code class="code"><span class="constructor">Invalid_argument</span></code> if the number of dimensions
     is not in the range 1 to 16 inclusive, or if one of the dimensions
     is negative.<br>
</p></div>

<pre><span id="VALnum_dims"><span class="keyword">val</span> num_dims</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
Return the number of dimensions of the given big array.<br>
</div>

<pre><span id="VALdims"><span class="keyword">val</span> dims</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt; int array</code></pre><div class="info ">
<code class="code"><span class="constructor">Genarray</span>.dims a</code> returns all dimensions of the big array <code class="code">a</code>,
     as an array of integers of length <code class="code"><span class="constructor">Genarray</span>.num_dims a</code>.<br>
</div>

<pre><span id="VALnth_dim"><span class="keyword">val</span> nth_dim</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt; int -&gt; int</code></pre><div class="info ">
<code class="code"><span class="constructor">Genarray</span>.nth_dim a n</code> returns the <code class="code">n</code>-th dimension of the
     big array <code class="code">a</code>.  The first dimension corresponds to <code class="code">n = 0</code>;
     the second dimension corresponds to <code class="code">n = 1</code>; the last dimension,
     to <code class="code">n = <span class="constructor">Genarray</span>.num_dims a - 1</code>.
     Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n</code> is less than 0 or greater or equal than
     <code class="code"><span class="constructor">Genarray</span>.num_dims a</code>.<br>
</div>

<pre><span id="VALkind"><span class="keyword">val</span> kind</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt; ('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a></code></pre><div class="info ">
Return the kind of the given big array.<br>
</div>

<pre><span id="VALlayout"><span class="keyword">val</span> layout</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt; 'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a></code></pre><div class="info ">
Return the layout of the given big array.<br>
</div>

<pre><span id="VALsize_in_bytes"><span class="keyword">val</span> size_in_bytes</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<code class="code">size_in_bytes a</code> is the number of elements in <code class="code">a</code> multiplied
    by <code class="code">a</code>'s <a href="Bigarray.html#VALkind_size_in_bytes"><code class="code"><span class="constructor">Bigarray</span>.kind_size_in_bytes</code></a>.<br>
</div>

<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt; int array -&gt; 'a</code></pre><div class="info ">
Read an element of a generic big array.
     <code class="code"><span class="constructor">Genarray</span>.get a [|i1; ...; iN|]</code> returns the element of <code class="code">a</code>
     whose coordinates are <code class="code">i1</code> in the first dimension, <code class="code">i2</code> in
     the second dimension, ..., <code class="code">iN</code> in the <code class="code"><span class="constructor">N</span></code>-th dimension.
<p>

     If <code class="code">a</code> has C layout, the coordinates must be greater or equal than 0
     and strictly less than the corresponding dimensions of <code class="code">a</code>.
     If <code class="code">a</code> has Fortran layout, the coordinates must be greater or equal
     than 1 and less or equal than the corresponding dimensions of <code class="code">a</code>.
     Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the array <code class="code">a</code> does not have exactly <code class="code"><span class="constructor">N</span></code>
     dimensions, or if the coordinates are outside the array bounds.
</p><p>

     If <code class="code"><span class="constructor">N</span> &gt; 3</code>, alternate syntax is provided: you can write
     <code class="code">a.{i1, i2, ..., iN}</code> instead of <code class="code"><span class="constructor">Genarray</span>.get a [|i1; ...; iN|]</code>.
     (The syntax <code class="code">a.{...}</code> with one, two or three coordinates is
     reserved for accessing one-, two- and three-dimensional arrays
     as described below.)<br>
</p></div>

<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt; int array -&gt; 'a -&gt; unit</code></pre><div class="info ">
Assign an element of a generic big array.
     <code class="code"><span class="constructor">Genarray</span>.set a [|i1; ...; iN|] v</code> stores the value <code class="code">v</code> in the
     element of <code class="code">a</code> whose coordinates are <code class="code">i1</code> in the first dimension,
     <code class="code">i2</code> in the second dimension, ..., <code class="code">iN</code> in the <code class="code"><span class="constructor">N</span></code>-th dimension.
<p>

     The array <code class="code">a</code> must have exactly <code class="code"><span class="constructor">N</span></code> dimensions, and all coordinates
     must lie inside the array bounds, as described for <code class="code"><span class="constructor">Genarray</span>.get</code>;
     otherwise, <code class="code"><span class="constructor">Invalid_argument</span></code> is raised.
</p><p>

     If <code class="code"><span class="constructor">N</span> &gt; 3</code>, alternate syntax is provided: you can write
     <code class="code">a.{i1, i2, ..., iN} &lt;- v</code> instead of
     <code class="code"><span class="constructor">Genarray</span>.set a [|i1; ...; iN|] v</code>.
     (The syntax <code class="code">a.{...} &lt;- v</code> with one, two or three coordinates is
     reserved for updating one-, two- and three-dimensional arrays
     as described below.)<br>
</p></div>

<pre><span id="VALsub_left"><span class="keyword">val</span> sub_left</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt;<br>       int -&gt; int -&gt; ('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Genarray.html#TYPEt">t</a></code></pre><div class="info ">
Extract a sub-array of the given big array by restricting the
     first (left-most) dimension.  <code class="code"><span class="constructor">Genarray</span>.sub_left a ofs len</code>
     returns a big array with the same number of dimensions as <code class="code">a</code>,
     and the same dimensions as <code class="code">a</code>, except the first dimension,
     which corresponds to the interval <code class="code">[ofs ... ofs + len - 1]</code>
     of the first dimension of <code class="code">a</code>.  No copying of elements is
     involved: the sub-array and the original array share the same
     storage space.  In other terms, the element at coordinates
     <code class="code">[|i1; ...; iN|]</code> of the sub-array is identical to the
     element at coordinates <code class="code">[|i1+ofs; ...; iN|]</code> of the original
     array <code class="code">a</code>.
<p>

     <code class="code"><span class="constructor">Genarray</span>.sub_left</code> applies only to big arrays in C layout.
     Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">ofs</code> and <code class="code">len</code> do not designate
     a valid sub-array of <code class="code">a</code>, that is, if <code class="code">ofs &lt; 0</code>, or <code class="code">len &lt; 0</code>,
     or <code class="code">ofs + len &gt; <span class="constructor">Genarray</span>.nth_dim a 0</code>.<br>
</p></div>

<pre><span id="VALsub_right"><span class="keyword">val</span> sub_right</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt;<br>       int -&gt; int -&gt; ('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Genarray.html#TYPEt">t</a></code></pre><div class="info ">
Extract a sub-array of the given big array by restricting the
     last (right-most) dimension.  <code class="code"><span class="constructor">Genarray</span>.sub_right a ofs len</code>
     returns a big array with the same number of dimensions as <code class="code">a</code>,
     and the same dimensions as <code class="code">a</code>, except the last dimension,
     which corresponds to the interval <code class="code">[ofs ... ofs + len - 1]</code>
     of the last dimension of <code class="code">a</code>.  No copying of elements is
     involved: the sub-array and the original array share the same
     storage space.  In other terms, the element at coordinates
     <code class="code">[|i1; ...; iN|]</code> of the sub-array is identical to the
     element at coordinates <code class="code">[|i1; ...; iN+ofs|]</code> of the original
     array <code class="code">a</code>.
<p>

     <code class="code"><span class="constructor">Genarray</span>.sub_right</code> applies only to big arrays in Fortran layout.
     Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">ofs</code> and <code class="code">len</code> do not designate
     a valid sub-array of <code class="code">a</code>, that is, if <code class="code">ofs &lt; 1</code>, or <code class="code">len &lt; 0</code>,
     or <code class="code">ofs + len &gt; <span class="constructor">Genarray</span>.nth_dim a (<span class="constructor">Genarray</span>.num_dims a - 1)</code>.<br>
</p></div>

<pre><span id="VALslice_left"><span class="keyword">val</span> slice_left</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt;<br>       int array -&gt; ('a, 'b, <a href="Bigarray.html#TYPEc_layout">Bigarray.c_layout</a>) <a href="Bigarray.Genarray.html#TYPEt">t</a></code></pre><div class="info ">
Extract a sub-array of lower dimension from the given big array
     by fixing one or several of the first (left-most) coordinates.
     <code class="code"><span class="constructor">Genarray</span>.slice_left a [|i1; ... ; iM|]</code> returns the 'slice'
     of <code class="code">a</code> obtained by setting the first <code class="code"><span class="constructor">M</span></code> coordinates to
     <code class="code">i1</code>, ..., <code class="code">iM</code>.  If <code class="code">a</code> has <code class="code"><span class="constructor">N</span></code> dimensions, the slice has
     dimension <code class="code"><span class="constructor">N</span> - <span class="constructor">M</span></code>, and the element at coordinates
     <code class="code">[|j1; ...; j(<span class="constructor">N</span>-<span class="constructor">M</span>)|]</code> in the slice is identical to the element
     at coordinates <code class="code">[|i1; ...; iM; j1; ...; j(<span class="constructor">N</span>-<span class="constructor">M</span>)|]</code> in the original
     array <code class="code">a</code>.  No copying of elements is involved: the slice and
     the original array share the same storage space.
<p>

     <code class="code"><span class="constructor">Genarray</span>.slice_left</code> applies only to big arrays in C layout.
     Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code"><span class="constructor">M</span> &gt;= <span class="constructor">N</span></code>, or if <code class="code">[|i1; ... ; iM|]</code>
     is outside the bounds of <code class="code">a</code>.<br>
</p></div>

<pre><span id="VALslice_right"><span class="keyword">val</span> slice_right</span> : <code class="type">('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt;<br>       int array -&gt; ('a, 'b, <a href="Bigarray.html#TYPEfortran_layout">Bigarray.fortran_layout</a>) <a href="Bigarray.Genarray.html#TYPEt">t</a></code></pre><div class="info ">
Extract a sub-array of lower dimension from the given big array
     by fixing one or several of the last (right-most) coordinates.
     <code class="code"><span class="constructor">Genarray</span>.slice_right a [|i1; ... ; iM|]</code> returns the 'slice'
     of <code class="code">a</code> obtained by setting the last <code class="code"><span class="constructor">M</span></code> coordinates to
     <code class="code">i1</code>, ..., <code class="code">iM</code>.  If <code class="code">a</code> has <code class="code"><span class="constructor">N</span></code> dimensions, the slice has
     dimension <code class="code"><span class="constructor">N</span> - <span class="constructor">M</span></code>, and the element at coordinates
     <code class="code">[|j1; ...; j(<span class="constructor">N</span>-<span class="constructor">M</span>)|]</code> in the slice is identical to the element
     at coordinates <code class="code">[|j1; ...; j(<span class="constructor">N</span>-<span class="constructor">M</span>); i1; ...; iM|]</code> in the original
     array <code class="code">a</code>.  No copying of elements is involved: the slice and
     the original array share the same storage space.
<p>

     <code class="code"><span class="constructor">Genarray</span>.slice_right</code> applies only to big arrays in Fortran layout.
     Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code"><span class="constructor">M</span> &gt;= <span class="constructor">N</span></code>, or if <code class="code">[|i1; ... ; iM|]</code>
     is outside the bounds of <code class="code">a</code>.<br>
</p></div>

<pre><span id="VALblit"><span class="keyword">val</span> blit</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt; ('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
Copy all elements of a big array in another big array.
     <code class="code"><span class="constructor">Genarray</span>.blit src dst</code> copies all elements of <code class="code">src</code> into
     <code class="code">dst</code>.  Both arrays <code class="code">src</code> and <code class="code">dst</code> must have the same number of
     dimensions and equal dimensions.  Copying a sub-array of <code class="code">src</code>
     to a sub-array of <code class="code">dst</code> can be achieved by applying <code class="code"><span class="constructor">Genarray</span>.blit</code>
     to sub-array or slices of <code class="code">src</code> and <code class="code">dst</code>.<br>
</div>

<pre><span id="VALfill"><span class="keyword">val</span> fill</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">t</a> -&gt; 'a -&gt; unit</code></pre><div class="info ">
Set all elements of a big array to a given value.
     <code class="code"><span class="constructor">Genarray</span>.fill a v</code> stores the value <code class="code">v</code> in all elements of
     the big array <code class="code">a</code>.  Setting only some elements of <code class="code">a</code> to <code class="code">v</code>
     can be achieved by applying <code class="code"><span class="constructor">Genarray</span>.fill</code> to a sub-array
     or a slice of <code class="code">a</code>.<br>
</div>

<pre><span id="VALmap_file"><span class="keyword">val</span> map_file</span> : <code class="type"><a href="Unix.html#TYPEfile_descr">Unix.file_descr</a> -&gt;<br>       ?pos:int64 -&gt;<br>       ('a, 'b) <a href="Bigarray.html#TYPEkind">Bigarray.kind</a> -&gt;<br>       'c <a href="Bigarray.html#TYPElayout">Bigarray.layout</a> -&gt; bool -&gt; int array -&gt; ('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">t</a></code></pre><div class="info ">
Memory mapping of a file as a big array.
     <code class="code"><span class="constructor">Genarray</span>.map_file fd kind layout shared dims</code>
     returns a big array of kind <code class="code">kind</code>, layout <code class="code">layout</code>,
     and dimensions as specified in <code class="code">dims</code>.  The data contained in
     this big array are the contents of the file referred to by
     the file descriptor <code class="code">fd</code> (as opened previously with
     <code class="code"><span class="constructor">Unix</span>.openfile</code>, for example).  The optional <code class="code">pos</code> parameter
     is the byte offset in the file of the data being mapped;
     it defaults to 0 (map from the beginning of the file).
<p>

     If <code class="code">shared</code> is <code class="code"><span class="keyword">true</span></code>, all modifications performed on the array
     are reflected in the file.  This requires that <code class="code">fd</code> be opened
     with write permissions.  If <code class="code">shared</code> is <code class="code"><span class="keyword">false</span></code>, modifications
     performed on the array are done in memory only, using
     copy-on-write of the modified pages; the underlying file is not
     affected.
</p><p>

     <code class="code"><span class="constructor">Genarray</span>.map_file</code> is much more efficient than reading
     the whole file in a big array, modifying that big array,
     and writing it afterwards.
</p><p>

     To adjust automatically the dimensions of the big array to
     the actual size of the file, the major dimension (that is,
     the first dimension for an array with C layout, and the last
     dimension for an array with Fortran layout) can be given as
     <code class="code">-1</code>.  <code class="code"><span class="constructor">Genarray</span>.map_file</code> then determines the major dimension
     from the size of the file.  The file must contain an integral
     number of sub-arrays as determined by the non-major dimensions,
     otherwise <code class="code"><span class="constructor">Failure</span></code> is raised.
</p><p>

     If all dimensions of the big array are given, the file size is
     matched against the size of the big array.  If the file is larger
     than the big array, only the initial portion of the file is
     mapped to the big array.  If the file is smaller than the big
     array, the file is automatically grown to the size of the big array.
     This requires write permissions on <code class="code">fd</code>.
</p><p>

     Array accesses are bounds-checked, but the bounds are determined by
     the initial call to <code class="code">map_file</code>. Therefore, you should make sure no
     other process modifies the mapped file while you're accessing it,
     or a SIGBUS signal may be raised. This happens, for instance, if the
     file is shrunk.
</p><p>

     This function raises <code class="code"><span class="constructor">Sys_error</span></code> in the case of any errors from the
     underlying system calls.  <code class="code"><span class="constructor">Invalid_argument</span></code> or <code class="code"><span class="constructor">Failure</span></code> may be
     raised in cases where argument validation fails.<br>
</p></div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>