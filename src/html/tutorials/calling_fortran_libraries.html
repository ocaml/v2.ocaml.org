<head>
<title>Calling Fortran libraries</title>
</head>
<body>
<h1><span>Calling Fortran libraries</span></h1>

<p class="first_para"><strong>Calling Fortran libraries</strong></p>
<p>Fortran isn't a language the many people write new codes in but it still is in extensive use in the scientific communities.  Many, many libraries exist for doing numerical calculation that will never be written in C or C++.  It is quite possible though to call Fortran routines from OCaml as they are normally compiled into the same object format, with minimal name mangling, as C programs.  </p>
<p>This tutorial will step by step through the process of compiling an interface module for a fortran function.  The steps that are involved here are the same steps as for wrapping a C function with a few considerations that have to be taken into account for Fortran.</p>
<p>The Fortran function is contained in a file called func.f and has the following signature</p>
<p><code>subroutine gtd6(integer iyd, real sec, real alt, real lat, real lon, real dens(8), real temp(2))</code></p>
<p>The <code>iyd</code>, <code>sec</code>, <code>alt</code>, <code>lat</code>, and <code>lon</code> parameters are input parameters while <code>dens</code> and <code>temp</code> are output parameters.</p>
<p>All of the examples below use the GNU Fortran 77 compiler (g77). None of these have been tested with the GNU fortran 90 compiler (gfort) and will not be until it has proven itself through some time.</p>
<h3>Step 1: Compile the Fortran routine</h3>
<p class="first_para">Where C/C++ have only one category of subroutine (the function), Fortran has two: the function and the subroutine.  The function is the equivalent to a non-void C function in that it takes parameters and always returns a value.  The subroutine is equivalent to a void C function.</p>
<p>When g77 compiles a fortran function it creates a named function that has an underscore appended.  If the fortran name for the function contains any underscores then the compiled function name will have two underscores appended.  The generated function can be called by this name.  Subroutines will be converted into a C function that returns an int.</p>
<p>To compile the funcs.f file into an object file, one can use the following:</p>
<p><code>prompt&gt; g77 -c funcs.f</code></p>
<p>Which will generate the file 'funcs.o'.  You can then see the names of the compiled functions by executing </p>
<p><code>prompt&gt; nm funcs.o</code></p>
<p>In this output you will see a line that has the following</p>
<p><code> T gtd6_ </code></p>
<p>This shows that the function gtd6_ has been created and is in the object file.</p>
<p>Fortran has support for both integer and real types and those are the names that they go by.  In our case we have only real and integer types.  Reals are equivalent to C doubles and integers are equivalent to C longs.  In addition, Fortran passes everything by reference so the corresponding C prototype for our gtd6 function is</p>
<p><code> int gtd6_(integer *iyd, real* sec, real* alt, real* glat, real* glong, real* dens, real* temp);</code></p>
<p>Note that its up to the caller to know that <code>dens</code> and <code>temp</code> are actually arrays.  Failure to pass an array will cause a segmentation violation since the gtd6_ function is using them as arrays (yet another reason OCaml shines).</p>
<h3>Step 2: Create the C wrapper</h3>
<p class="first_para">Because OCaml's foreign function interface is C based, it is necessary to create a C wrapper.  To avoid difficulties in passing back arrays of values, we are going to simply create a function that will return the second element of the temperature array as computed by the function and ignore the other return values (this is a very frequent use of the function).  This function will be in the source file wrapper.c.</p>
<pre>
CAMLprim value gtd6_t (value iydV, value secVal, value altVal, value latVal, value lonVal) {
   CAMLparam5( iydV, secVal, altVal, latVal, lonVal );
   long iyd = Long_val( iydV );
   float    sec = Double_val( secVal );
   float    alt = Double_val( altVal );
   float    lat = Double_val( latVal );
   float    lon = Double_val( lonVal );

   gtd6_(&amp;iyd, &amp;sec, &amp;alt, &amp;glat, &amp;glon, d, t);
   CAMLreturn( caml_copy_double( t[1] ) );
}
</pre>

<p>A few points of interest</p>
<ol><li>The file must include the OCaml header files <code>alloc.h</code>, <code>memory.h</code>, and <code>mlvalue.h</code>.</li>
<li>The function first calls the CAMLparam5 macro.  This is required at the start of any function that uses the CAML types.</li>
<li>The function uses the Double_val and Long_val macros to extract the C types from the OCaml value object.</li>
<li>All of the values are passed by reference to the gtd6_ routine as required by the prototype.</li>
<li>The function uses the copy_caml_double function and the CAMLreturn macro to create a new value containing the return value and to return it respectively.</li></ol>
<h3>Step 3: Compile the shared library.</h3>
<p class="first_para">Now having the two source files funcs.f and wrapper.c we need to create a shared library that can be loaded by OCaml.  Its easier to do this as a multistep process, so here are the commands:</p>
<p><code>prompt&gt; g77 -c funcs.f</code></p>
<p><code>prompt&gt; cc -I&lt;ocaml include path&gt; -c wrapper.c </code></p>
<p><code>prompt&gt; cc -shared -o wrapper.so wrapper.o funcs.o -lg2c</code></p>
<p>This will create a shared object library called wrapper.so containing the fortran function and the wrapper function.  The -lg2c option is required to provide the implementations of the built in fortran functions that are used.</p>

<h3>Step 4: Now to OCaml</h3>

<p>Now in an OCaml file (gtd6.ml) we have to define the external
  reference to the function and a function to call it.</p>
<pre ml:content="ocaml noeval">
external temp : int -> float -> float -> float -> float -> float = "gtd6_t"

let () =
  print_double (temp 1 2.0 3.0 4.0 5.0);
  print_newline ()
</pre>

<p>This tells OCaml that the temp function takes 5 parameters and
  returns a single floating point and calls the C function gtd6_t.</p>
<p>At this point, the steps that are given are to compile this into
  bytecode.  I don't yet have much experience compiling to native so
  I'll let some else help out (or wait until I learn how to do it).</p>
<pre>
prompt&gt; ocamlc -c gtd6.ml prompt&gt; ocamlc -o test gtd6.cmo wrapper.so
</pre>
<p>And voila, we've called the fortran function from OCaml.</p>


</body>
