<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual034.html">The core library</a></li><li><a href="manual035.html">The standard library</a></li><li><a href="manual036.html">The unix library: Unix system calls</a></li><li><a href="manual037.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="manual038.html">The str library: regular expressions and string processing</a></li><li><a href="manual039.html">The threads library</a></li><li><a href="manual040.html">The graphics library</a></li><li><a href="manual041.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="manual042.html">The LablTk library: Tcl/Tk GUI interface</a></li><li class="active"><a href="manual043.html">The bigarray library</a></li></ul>




<h1 class="chapter"><a name="htoc307"><span>Chapter 29</span></a>&nbsp;&nbsp;The bigarray library</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The bigarray library</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#toc157">Module <tt>Bigarray</tt>: large, multi-dimensional, numerical arrays</a>
</li><li><a href="#toc158">Big arrays in the OCaml-C interface</a>
</li></ul></nav></header>
<p>The <tt>bigarray</tt> library implements large, multi-dimensional, numerical
arrays. These arrays are called “big arrays” to distinguish them
from the standard OCaml arrays described in
<a href="../../api/4.00/Array.html">Module <tt>Array</tt></a>.
The main differences between “big arrays” and standard OCaml arrays
are as follows:
</p><ul class="itemize"><li class="li-itemize">
Big arrays are not limited in size, unlike OCaml arrays
(<tt>float array</tt> are limited to 2097151 elements on a 32-bit platform,
other <tt>array</tt> types to 4194303 elements).
</li><li class="li-itemize">Big arrays are multi-dimensional. Any number of dimensions
between 1 and 16 is supported. In contrast, OCaml arrays are
mono-dimensional and require encoding multi-dimensional arrays as
arrays of arrays.
</li><li class="li-itemize">Big arrays can only contain integers and floating-point
numbers, while OCaml arrays can contain arbitrary OCaml data types.
However, big arrays provide more space-efficient storage of integer
and floating-point elements, in particular because they support
“small” types such as single-precision floats and 8 and 16-bit
integers, in addition to the standard OCaml types of double-precision
floats and 32 and 64-bit integers.
</li><li class="li-itemize">The memory layout of big arrays is entirely compatible with that
of arrays in C and Fortran, allowing large arrays to be passed back
and forth between OCaml code and C / Fortran code with no data copying
at all.
</li><li class="li-itemize">Big arrays support interesting high-level operations that normal
arrays do not provide efficiently, such as extracting sub-arrays and
“slicing” a multi-dimensional array along certain dimensions, all
without any copying.
</li></ul><p>
Programs that use the <tt>bigarray</tt> library must be linked as follows:
</p><pre>        ocamlc <i>other options</i> bigarray.cma <i>other files</i>
        ocamlopt <i>other options</i> bigarray.cmxa <i>other files</i>
</pre><p>
For interactive use of the <tt>bigarray</tt> library, do:
</p><pre>        ocamlmktop -o mytop bigarray.cma
        ./mytop
</pre><p>
or (if dynamic linking of C libraries is supported on your platform),
start <tt>ocaml</tt> and type <tt>#load "bigarray.cma";;</tt>.</p><h2 class="section"><a name="toc157"></a><a name="htoc308">1</a>&nbsp;&nbsp;Module <tt>Bigarray</tt>: large, multi-dimensional, numerical arrays</h2><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.00/Bigarray.html">Module <tt>Bigarray</tt></a>
</li></ul><h2 class="section"><a name="toc158"></a><a name="htoc309">2</a>&nbsp;&nbsp;Big arrays in the OCaml-C interface</h2><p>C stub code that interface C or Fortran code with OCaml code, as
described in chapter&nbsp;<a href="manual033.html#c:intf-c">19</a>, can exploit big arrays as
follows.</p><h3 class="subsection"><a name="htoc310">29.2.1</a>&nbsp;&nbsp;Include file</h3><p>The include file <tt>&lt;caml/bigarray.h&gt;</tt> must be included in the C stub
file. It declares the functions, constants and macros discussed
below.</p><h3 class="subsection"><a name="htoc311">29.2.2</a>&nbsp;&nbsp;Accessing an OCaml bigarray from C or Fortran</h3><p>If <i>v</i> is a OCaml <tt>value</tt> representing a big array, the expression
<tt>Data_bigarray_val(</tt><i>v</i><tt>)</tt> returns a pointer to the data part of the array.
This pointer is of type <tt>void *</tt> and can be cast to the appropriate C
type for the array (e.g. <tt>double []</tt>, <tt>char [][10]</tt>, etc).</p><p>Various characteristics of the OCaml big array can be consulted from C
as follows:
</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>C expression</b></td><td align="center" nowrap=""><b>Returns</b></td></tr>
<tr><td align="left" nowrap="">
<tt>Bigarray_val(</tt><i>v</i><tt>)-&gt;num_dims</tt></td><td align="left" nowrap="">number of dimensions</td></tr>
<tr><td align="left" nowrap=""><tt>Bigarray_val(</tt><i>v</i><tt>)-&gt;dim[</tt><i>i</i><tt>]</tt></td><td align="left" nowrap=""><i>i</i>-th dimension</td></tr>
<tr><td align="left" nowrap=""><tt>Bigarray_val(</tt><i>v</i><tt>)-&gt;flags &amp; BIGARRAY_KIND_MASK</tt></td><td align="left" nowrap="">kind of array elements</td></tr>
</tbody></table></div><p>
The kind of array elements is one of the following constants:
</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Constant</b></td><td align="center" nowrap=""><b>Element kind</b></td></tr>
<tr><td align="left" nowrap="">
<tt>BIGARRAY_FLOAT32</tt></td><td align="left" nowrap="">32-bit single-precision floats</td></tr>
<tr><td align="left" nowrap=""><tt>BIGARRAY_FLOAT64</tt></td><td align="left" nowrap="">64-bit double-precision floats</td></tr>
<tr><td align="left" nowrap=""><tt>BIGARRAY_SINT8</tt></td><td align="left" nowrap="">8-bit signed integers</td></tr>
<tr><td align="left" nowrap=""><tt>BIGARRAY_UINT8</tt></td><td align="left" nowrap="">8-bit unsigned integers</td></tr>
<tr><td align="left" nowrap=""><tt>BIGARRAY_SINT16</tt></td><td align="left" nowrap="">16-bit signed integers</td></tr>
<tr><td align="left" nowrap=""><tt>BIGARRAY_UINT16</tt></td><td align="left" nowrap="">16-bit unsigned integers</td></tr>
<tr><td align="left" nowrap=""><tt>BIGARRAY_INT32</tt></td><td align="left" nowrap="">32-bit signed integers</td></tr>
<tr><td align="left" nowrap=""><tt>BIGARRAY_INT64</tt></td><td align="left" nowrap="">64-bit signed integers</td></tr>
<tr><td align="left" nowrap=""><tt>BIGARRAY_CAML_INT</tt></td><td align="left" nowrap="">31- or 63-bit signed integers</td></tr>
<tr><td align="left" nowrap=""><tt>BIGARRAY_NATIVE_INT</tt></td><td align="left" nowrap="">32- or 64-bit (platform-native) integers</td></tr>
</tbody></table></div><p>
The following example shows the passing of a two-dimensional big array
to a C function and a Fortran function.
</p><pre>    extern void my_c_function(double * data, int dimx, int dimy);
    extern void my_fortran_function_(double * data, int * dimx, int * dimy);

    value caml_stub(value bigarray)
    {
      int dimx = Bigarray_val(bigarray)-&gt;dim[0];
      int dimy = Bigarray_val(bigarray)-&gt;dim[1];
      /* C passes scalar parameters by value */
      my_c_function(Data_bigarray_val(bigarray), dimx, dimy);
      /* Fortran passes all parameters by reference */
      my_fortran_function_(Data_bigarray_val(bigarray), &amp;dimx, &amp;dimy);
      return Val_unit;
    }
</pre><h3 class="subsection"><a name="htoc312">29.2.3</a>&nbsp;&nbsp;Wrapping a C or Fortran array as an OCaml big array</h3><p>A pointer <i>p</i> to an already-allocated C or Fortran array can be
wrapped and returned to OCaml as a big array using the <tt>alloc_bigarray</tt>
or <tt>alloc_bigarray_dims</tt> functions.
</p><ul class="itemize"><li class="li-itemize">
<tt>alloc_bigarray(</tt><i>kind</i> <tt>|</tt> <i>layout</i>, <i>numdims</i>, <i>p</i>, <i>dims</i><tt>)</tt><p>Return an OCaml big array wrapping the data pointed to by <i>p</i>.
<i>kind</i> is the kind of array elements (one of the <tt>BIGARRAY_</tt>
kind constants above). <i>layout</i> is <tt>BIGARRAY_C_LAYOUT</tt> for an
array with C layout and <tt>BIGARRAY_FORTRAN_LAYOUT</tt> for an array with
Fortran layout. <i>numdims</i> is the number of dimensions in the
array. <i>dims</i> is an array of <i>numdims</i> long integers, giving
the sizes of the array in each dimension.</p></li><li class="li-itemize"><tt>alloc_bigarray_dims(</tt><i>kind</i> <tt>|</tt> <i>layout</i>, <i>numdims</i>,
<i>p</i>, <tt>(long) </tt><i>dim</i><sub>1</sub>, <tt>(long) </tt><i>dim</i><sub>2</sub>, …, <tt>(long) </tt><i>dim<sub>numdims</sub></i><tt>)</tt><p>Same as <tt>alloc_bigarray</tt>, but the sizes of the array in each dimension
are listed as extra arguments in the function call, rather than being
passed as an array.
</p></li></ul><p>
The following example illustrates how statically-allocated C and
Fortran arrays can be made available to OCaml.
</p><pre>    extern long my_c_array[100][200];
    extern float my_fortran_array_[300][400];

    value caml_get_c_array(value unit)
    {
      long dims[2];
      dims[0] = 100; dims[1] = 200;
      return alloc_bigarray(BIGARRAY_NATIVE_INT | BIGARRAY_C_LAYOUT,
                            2, my_c_array, dims);
    }

    value caml_get_fortran_array(value unit)
    {
      return alloc_bigarray_dims(BIGARRAY_FLOAT32 | BIGARRAY_FORTRAN_LAYOUT,
                                 2, my_fortran_array_, 300L, 400L);
    }
</pre><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>