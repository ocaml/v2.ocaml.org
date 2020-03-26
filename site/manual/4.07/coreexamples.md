<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li class="active"><a href="coreexamples.html">The core language</a></li><li><a href="moduleexamples.html">The module system</a></li><li><a href="objectexamples.html">Objects in OCaml</a></li><li><a href="lablexamples.html">Labels and variants</a></li><li><a href="polymorphism.html">Polymorphism and its limitations</a></li><li><a href="advexamples.html">Advanced examples with classes and modules</a></li></ul>




<h1 class="chapter" id="sec7"><span>Chapter 1</span>&nbsp;&nbsp;The core language</h1>
<header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.07</a></div><div class="toc_title"><a href="#">The core language</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="coreexamples.html#sec8">1&nbsp;&nbsp;Basics</a>
</li><li><a href="coreexamples.html#sec9">2&nbsp;&nbsp;Data types</a>
</li><li><a href="coreexamples.html#sec10">3&nbsp;&nbsp;Functions as values</a>
</li><li><a href="coreexamples.html#sec11">4&nbsp;&nbsp;Records and variants</a>
</li><li><a href="coreexamples.html#sec13">5&nbsp;&nbsp;Imperative features</a>
</li><li><a href="coreexamples.html#sec14">6&nbsp;&nbsp;Exceptions</a>
</li><li><a href="coreexamples.html#sec15">7&nbsp;&nbsp;Symbolic processing of expressions</a>
</li><li><a href="coreexamples.html#sec16">8&nbsp;&nbsp;Pretty-printing</a>
</li><li><a href="coreexamples.html#sec17">9&nbsp;&nbsp;Standalone OCaml programs</a>
</li></ul></nav></header>
<p> <a id="c:core-xamples"></a>

</p><p>This part of the manual is a tutorial introduction to the
OCaml language. A good familiarity with programming in a conventional
languages (say, C or Java) is assumed, but no prior exposure to
functional languages is required. The present chapter introduces the
core language. Chapter&nbsp;<a href="moduleexamples.html#c%3Amoduleexamples">2</a> deals with the
module system, chapter&nbsp;<a href="objectexamples.html#c%3Aobjectexamples">3</a> with the
object-oriented features, chapter&nbsp;<a href="lablexamples.html#c%3Alabl-examples">4</a> with
extensions to the core language (labeled arguments and polymorphic
variants), and chapter&nbsp;<a href="advexamples.html#c%3Aadvexamples">6</a> gives some advanced examples.</p>
<h2 class="section" id="sec8">1&nbsp;&nbsp;Basics</h2>
<p>For this overview of OCaml, we use the interactive system, which
is started by running <span class="c003">ocaml</span> from the Unix shell, or by launching the
<span class="c003">OCamlwin.exe</span> application under Windows. This tutorial is presented
as the transcript of a session with the interactive system:
lines starting with <span class="c003">#</span> represent user input; the system responses are
printed below, without a leading <span class="c003">#</span>.</p><p>Under the interactive system, the user types OCaml phrases terminated
by <span class="c003">;;</span> in response to the <span class="c003">#</span> prompt, and the system compiles them
on the fly, executes them, and prints the outcome of evaluation.
Phrases are either simple expressions, or <span class="c003">let</span> definitions of
identifiers (either values or functions).


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="numeric">1</span><span class="numeric">+2</span><span class="text">*</span><span class="numeric">3</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 7
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">pi</span><span class="text"> = </span><span class="numeric">4.0</span><span class="text"> *. </span><span class="id">atan</span><span class="text"> </span><span class="numeric">1.0</span><span class="text">;;
</span></code><code class="caml-output ok">val pi : float = 3.14159265358979312
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">square</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">x</span><span class="text"> *. </span><span class="id">x</span><span class="text">;;
</span></code><code class="caml-output ok">val square : float -&gt; float = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">square</span><span class="text"> (</span><span class="id">sin</span><span class="text"> </span><span class="id">pi</span><span class="text">) +. </span><span class="id">square</span><span class="text"> (</span><span class="id">cos</span><span class="text"> </span><span class="id">pi</span><span class="text">);;
</span></code><code class="caml-output ok">- : float = 1.
</code></pre>


</div><p>

The OCaml system computes both the value and the type for
each phrase. Even function parameters need no explicit type declaration:
the system infers their types from their usage in the
function. Notice also that integers and floating-point numbers are
distinct types, with distinct operators: <span class="c003">+</span> and <span class="c003">*</span> operate on
integers, but <span class="c003">+.</span> and <span class="c003">*.</span> operate on floats.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"> <u>1.0</u> * 2;;
</code><code class="caml-output error">Error: This expression has type float but an expression was expected of type
         int
</code></pre>


</div><p>Recursive functions are defined with the <span class="c003">let rec</span> binding:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">fib</span><span class="text"> </span><span class="id">n</span><span class="text"> =
    </span><span class="kw1">if</span><span class="text"> </span><span class="id">n</span><span class="text"> &lt; </span><span class="numeric">2</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">n</span><span class="text"> </span><span class="kw1">else</span><span class="text"> </span><span class="id">fib</span><span class="text"> (</span><span class="id">n</span><span class="numeric">-1</span><span class="text">) + </span><span class="id">fib</span><span class="text"> (</span><span class="id">n</span><span class="numeric">-2</span><span class="text">);;
</span></code><code class="caml-output ok">val fib : int -&gt; int = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">fib</span><span class="text"> </span><span class="numeric">10</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 55
</code></pre>


</div>
<h2 class="section" id="sec9">2&nbsp;&nbsp;Data types</h2>
<p>In addition to integers and floating-point numbers, OCaml offers the
usual basic data types: booleans, characters, and immutable character strings.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> (</span><span class="numeric">1</span><span class="text"> &lt; </span><span class="numeric">2</span><span class="text">) = </span><span class="constant">false</span><span class="text">;;
</span></code><code class="caml-output ok">- : bool = false
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="string">'a'</span><span class="text">;;
</span></code><code class="caml-output ok">- : char = 'a'
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="string">"Hello world"</span><span class="text">;;
</span></code><code class="caml-output ok">- : string = "Hello world"
</code></pre>


</div><p>Predefined data structures include tuples, arrays, and lists. There are also
general mechanisms for defining your own data structures, such as records and
variants, which will be covered in more detail later; for now, we concentrate
on lists. Lists are either given in extension as a bracketed list of
semicolon-separated elements, or built from the empty list <span class="c003">[]</span>
(pronounce “nil”) by adding elements in front using the <span class="c003">::</span>
(“cons”) operator.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">l</span><span class="text"> = [</span><span class="string">"is"</span><span class="text">; </span><span class="string">"a"</span><span class="text">; </span><span class="string">"tale"</span><span class="text">; </span><span class="string">"told"</span><span class="text">; </span><span class="string">"etc."</span><span class="text">];;
</span></code><code class="caml-output ok">val l : string list = ["is"; "a"; "tale"; "told"; "etc."]
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="string">"Life"</span><span class="text"> :: </span><span class="id">l</span><span class="text">;;
</span></code><code class="caml-output ok">- : string list = ["Life"; "is"; "a"; "tale"; "told"; "etc."]
</code></pre>


</div><p>

As with all other OCaml data structures, lists do not need to be
explicitly allocated and deallocated from memory: all memory
management is entirely automatic in OCaml. Similarly, there is no
explicit handling of pointers: the OCaml compiler silently introduces
pointers where necessary.</p><p>As with most OCaml data structures, inspecting and destructuring lists
is performed by pattern-matching. List patterns have exactly the same
form as list expressions, with identifiers representing unspecified
parts of the list. As an example, here is insertion sort on a list:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">sort</span><span class="text"> </span><span class="id">lst</span><span class="text"> =
    </span><span class="kw1">match</span><span class="text"> </span><span class="id">lst</span><span class="text"> </span><span class="kw1">with</span><span class="text">
      [] -&gt; []
    | </span><span class="id">head</span><span class="text"> :: </span><span class="id">tail</span><span class="text"> -&gt; </span><span class="id">insert</span><span class="text"> </span><span class="id">head</span><span class="text"> (</span><span class="id">sort</span><span class="text"> </span><span class="id">tail</span><span class="text">)
  </span><span class="kw">and</span><span class="text"> </span><span class="id">insert</span><span class="text"> </span><span class="id">elt</span><span class="text"> </span><span class="id">lst</span><span class="text"> =
    </span><span class="kw1">match</span><span class="text"> </span><span class="id">lst</span><span class="text"> </span><span class="kw1">with</span><span class="text">
      [] -&gt; [</span><span class="id">elt</span><span class="text">]
    | </span><span class="id">head</span><span class="text"> :: </span><span class="id">tail</span><span class="text"> -&gt; </span><span class="kw1">if</span><span class="text"> </span><span class="id">elt</span><span class="text"> &lt;= </span><span class="id">head</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">elt</span><span class="text"> :: </span><span class="id">lst</span><span class="text"> </span><span class="kw1">else</span><span class="text"> </span><span class="id">head</span><span class="text"> :: </span><span class="id">insert</span><span class="text"> </span><span class="id">elt</span><span class="text"> </span><span class="id">tail</span><span class="text">
  ;;
</span></code><code class="caml-output ok">val sort : 'a list -&gt; 'a list = &lt;fun&gt;
val insert : 'a -&gt; 'a list -&gt; 'a list = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">sort</span><span class="text"> </span><span class="id">l</span><span class="text">;;
</span></code><code class="caml-output ok">- : string list = ["a"; "etc."; "is"; "tale"; "told"]
</code></pre>


</div><p>The type inferred for <span class="c003">sort</span>, <span class="c003">'a list -&gt; 'a list</span>, means that <span class="c003">sort</span>
can actually apply to lists of any type, and returns a list of the
same type. The type <span class="c003">'a</span> is a <em>type variable</em>, and stands for any
given type. The reason why <span class="c003">sort</span> can apply to lists of any type is
that the comparisons (<span class="c003">=</span>, <span class="c003">&lt;=</span>, etc.) are <em>polymorphic</em> in OCaml:
they operate between any two values of the same type. This makes
<span class="c003">sort</span> itself polymorphic over all list types.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="id">sort</span><span class="text"> [</span><span class="numeric">6</span><span class="text">;</span><span class="numeric">2</span><span class="text">;</span><span class="numeric">5</span><span class="text">;</span><span class="numeric">3</span><span class="text">];;
</span></code><code class="caml-output ok">- : int list = [2; 3; 5; 6]
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">sort</span><span class="text"> [</span><span class="numeric">3.14</span><span class="text">; </span><span class="numeric">2.718</span><span class="text">];;
</span></code><code class="caml-output ok">- : float list = [2.718; 3.14]
</code></pre>


</div><p>The <span class="c003">sort</span> function above does not modify its input list: it builds
and returns a new list containing the same elements as the input list,
in ascending order. There is actually no way in OCaml to modify
a list in-place once it is built: we say that lists are <em>immutable</em>
data structures. Most OCaml data structures are immutable, but a few
(most notably arrays) are <em>mutable</em>, meaning that they can be
modified in-place at any time.</p><p>The OCaml notation for the type of a function with multiple arguments is <br>
<span class="c003">arg1_type -&gt; arg2_type -&gt; ... -&gt; return_type</span>. For example,
the type inferred for <span class="c003">insert</span>, <span class="c003">'a -&gt; 'a list -&gt; 'a list</span>, means that <span class="c003">insert</span>
takes two arguments, an element of any type <span class="c003">'a</span> and a list with elements of
the same type <span class="c003">'a</span> and returns a list of the same type.
</p>
<h2 class="section" id="sec10">3&nbsp;&nbsp;Functions as values</h2>
<p>OCaml is a functional language: functions in the full mathematical
sense are supported and can be passed around freely just as any other
piece of data. For instance, here is a <span class="c003">deriv</span> function that takes any
float function as argument and returns an approximation of its
derivative function:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">deriv</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">dx</span><span class="text"> = </span><span class="kw">function</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; (</span><span class="id">f</span><span class="text"> (</span><span class="id">x</span><span class="text"> +. </span><span class="id">dx</span><span class="text">) -. </span><span class="id">f</span><span class="text"> </span><span class="id">x</span><span class="text">) /. </span><span class="id">dx</span><span class="text">;;
</span></code><code class="caml-output ok">val deriv : (float -&gt; float) -&gt; float -&gt; float -&gt; float = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">sin</span><span class="text">' = </span><span class="id">deriv</span><span class="text"> </span><span class="id">sin</span><span class="text"> </span><span class="numeric">1e-6</span><span class="text">;;
</span></code><code class="caml-output ok">val sin' : float -&gt; float = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">sin</span><span class="text">' </span><span class="id">pi</span><span class="text">;;
</span></code><code class="caml-output ok">- : float = -1.00000000013961143
</code></pre>


</div><p>

Even function composition is definable:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">compose</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">g</span><span class="text"> = </span><span class="kw">function</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; </span><span class="id">f</span><span class="text"> (</span><span class="id">g</span><span class="text"> </span><span class="id">x</span><span class="text">);;
</span></code><code class="caml-output ok">val compose : ('a -&gt; 'b) -&gt; ('c -&gt; 'a) -&gt; 'c -&gt; 'b = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">cos2</span><span class="text"> = </span><span class="id">compose</span><span class="text"> </span><span class="id">square</span><span class="text"> </span><span class="id">cos</span><span class="text">;;
</span></code><code class="caml-output ok">val cos2 : float -&gt; float = &lt;fun&gt;
</code></pre>


</div><p>Functions that take other functions as arguments are called
“functionals”, or “higher-order functions”. Functionals are
especially useful to provide iterators or similar generic operations
over a data structure. For instance, the standard OCaml library
provides a <span class="c003">List.map</span> functional that applies a given function to each
element of a list, and returns the list of the results:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw2">List</span><span class="text">.</span><span class="id">map</span><span class="text"> (</span><span class="kw">function</span><span class="text"> </span><span class="id">n</span><span class="text"> -&gt; </span><span class="id">n</span><span class="text"> * </span><span class="numeric">2</span><span class="text"> + </span><span class="numeric">1</span><span class="text">) [</span><span class="numeric">0</span><span class="text">;</span><span class="numeric">1</span><span class="text">;</span><span class="numeric">2</span><span class="text">;</span><span class="numeric">3</span><span class="text">;</span><span class="numeric">4</span><span class="text">];;
</span></code><code class="caml-output ok">- : int list = [1; 3; 5; 7; 9]
</code></pre>


</div><p>

This functional, along with a number of other list and array
functionals, is predefined because it is often useful, but there is
nothing magic with it: it can easily be defined as follows.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">map</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">l</span><span class="text"> =
    </span><span class="kw1">match</span><span class="text"> </span><span class="id">l</span><span class="text"> </span><span class="kw1">with</span><span class="text">
      [] -&gt; []
    | </span><span class="id">hd</span><span class="text"> :: </span><span class="id">tl</span><span class="text"> -&gt; </span><span class="id">f</span><span class="text"> </span><span class="id">hd</span><span class="text"> :: </span><span class="id">map</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">tl</span><span class="text">;;
</span></code><code class="caml-output ok">val map : ('a -&gt; 'b) -&gt; 'a list -&gt; 'b list = &lt;fun&gt;
</code></pre>


</div>
<h2 class="section" id="sec11">4&nbsp;&nbsp;Records and variants</h2>
<p>

<a id="s:tut-recvariants"></a></p><p>User-defined data structures include records and variants. Both are
defined with the <span class="c003">type</span> declaration. Here, we declare a record type to
represent rational numbers.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">ratio</span><span class="text"> = {</span><span class="id">num</span><span class="text">: </span><span class="kw3">int</span><span class="text">; </span><span class="id">denom</span><span class="text">: </span><span class="kw3">int</span><span class="text">};;
</span></code><code class="caml-output ok">type ratio = { num : int; denom : int; }
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">add_ratio</span><span class="text"> </span><span class="id">r1</span><span class="text"> </span><span class="id">r2</span><span class="text"> =
    {</span><span class="id">num</span><span class="text"> = </span><span class="id">r1</span><span class="text">.</span><span class="id">num</span><span class="text"> * </span><span class="id">r2</span><span class="text">.</span><span class="id">denom</span><span class="text"> + </span><span class="id">r2</span><span class="text">.</span><span class="id">num</span><span class="text"> * </span><span class="id">r1</span><span class="text">.</span><span class="id">denom</span><span class="text">;
     </span><span class="id">denom</span><span class="text"> = </span><span class="id">r1</span><span class="text">.</span><span class="id">denom</span><span class="text"> * </span><span class="id">r2</span><span class="text">.</span><span class="id">denom</span><span class="text">};;
</span></code><code class="caml-output ok">val add_ratio : ratio -&gt; ratio -&gt; ratio = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">add_ratio</span><span class="text"> {</span><span class="id">num</span><span class="text">=</span><span class="numeric">1</span><span class="text">; </span><span class="id">denom</span><span class="text">=</span><span class="numeric">3</span><span class="text">} {</span><span class="id">num</span><span class="text">=</span><span class="numeric">2</span><span class="text">; </span><span class="id">denom</span><span class="text">=</span><span class="numeric">5</span><span class="text">};;
</span></code><code class="caml-output ok">- : ratio = {num = 11; denom = 15}
</code></pre>


</div><p>

Record fields can also be accessed through pattern-matching:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">integer_part</span><span class="text"> </span><span class="id">r</span><span class="text"> =
    </span><span class="kw1">match</span><span class="text"> </span><span class="id">r</span><span class="text"> </span><span class="kw1">with</span><span class="text">
      {</span><span class="id">num</span><span class="text">=</span><span class="id">num</span><span class="text">; </span><span class="id">denom</span><span class="text">=</span><span class="id">denom</span><span class="text">} -&gt; </span><span class="id">num</span><span class="text"> / </span><span class="id">denom</span><span class="text">;;
</span></code><code class="caml-output ok">val integer_part : ratio -&gt; int = &lt;fun&gt;
</code></pre>


</div><p>

Since there is only one case in this pattern matching, it
is safe to expand directly the argument <span class="c003">r</span> in a record pattern:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">integer_part</span><span class="text"> {</span><span class="id">num</span><span class="text">=</span><span class="id">num</span><span class="text">; </span><span class="id">denom</span><span class="text">=</span><span class="id">denom</span><span class="text">} = </span><span class="id">num</span><span class="text"> / </span><span class="id">denom</span><span class="text">;;
</span></code><code class="caml-output ok">val integer_part : ratio -&gt; int = &lt;fun&gt;
</code></pre>


</div><p>

Unneeded fields can be omitted:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">get_denom</span><span class="text"> {</span><span class="id">denom</span><span class="text">=</span><span class="id">denom</span><span class="text">} = </span><span class="id">denom</span><span class="text">;;
</span></code><code class="caml-output ok">val get_denom : ratio -&gt; int = &lt;fun&gt;
</code></pre>


</div><p>

Optionally, missing fields can be made explicit by ending the list of
fields with a trailing wildcard <span class="c003">_</span>::


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">get_num</span><span class="text"> {</span><span class="id">num</span><span class="text">=</span><span class="id">num</span><span class="text">; </span><span class="numeric">_</span><span class="text"> } = </span><span class="id">num</span><span class="text">;;
</span></code><code class="caml-output ok">val get_num : ratio -&gt; int = &lt;fun&gt;
</code></pre>


</div><p>

When both sides of the <span class="c003">=</span> sign are the same, it is possible to avoid
repeating the field name by eliding the <span class="c003">=field</span> part:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">integer_part</span><span class="text"> {</span><span class="id">num</span><span class="text">; </span><span class="id">denom</span><span class="text">} = </span><span class="id">num</span><span class="text"> / </span><span class="id">denom</span><span class="text">;;
</span></code><code class="caml-output ok">val integer_part : ratio -&gt; int = &lt;fun&gt;
</code></pre>


</div><p>

This short notation for fields also works when constructing records:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">ratio</span><span class="text"> </span><span class="id">num</span><span class="text"> </span><span class="id">denom</span><span class="text"> = {</span><span class="id">num</span><span class="text">; </span><span class="id">denom</span><span class="text">};;
</span></code><code class="caml-output ok">val ratio : int -&gt; int -&gt; ratio = &lt;fun&gt;
</code></pre>


</div><p>

At last, it is possible to update few fields of a record at once:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text">   </span><span class="kw">let</span><span class="text"> </span><span class="id">integer_product</span><span class="text"> </span><span class="id">integer</span><span class="text"> </span><span class="id">ratio</span><span class="text"> = { </span><span class="id">ratio</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="id">num</span><span class="text"> = </span><span class="id">integer</span><span class="text"> * </span><span class="id">ratio</span><span class="text">.</span><span class="id">num</span><span class="text"> };;
</span></code><code class="caml-output ok">val integer_product : int -&gt; ratio -&gt; ratio = &lt;fun&gt;
</code></pre>


</div><p>

With this functional update notation, the record on the left-hand side
of <span class="c003">with</span> is copied except for the fields on the right-hand side which
are updated.</p><p>The declaration of a variant type lists all possible forms for values
of that type. Each case is identified by a name, called a constructor,
which serves both for constructing values of the variant type and
inspecting them by pattern-matching. Constructor names are capitalized
to distinguish them from variable names (which must start with a
lowercase letter). For instance, here is a variant
type for doing mixed arithmetic (integers and floats):


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">number</span><span class="text"> = </span><span class="kw2">Int</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">int</span><span class="text"> | </span><span class="kw2">Float</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">float</span><span class="text"> | </span><span class="kw2">Error</span><span class="text">;;
</span></code><code class="caml-output ok">type number = Int of int | Float of float | Error
</code></pre>


</div><p>

This declaration expresses that a value of type <span class="c003">number</span> is either an
integer, a floating-point number, or the constant <span class="c003">Error</span> representing
the result of an invalid operation (e.g. a division by zero).</p><p>Enumerated types are a special case of variant types, where all
alternatives are constants:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">sign</span><span class="text"> = </span><span class="kw2">Positive</span><span class="text"> | </span><span class="kw2">Negative</span><span class="text">;;
</span></code><code class="caml-output ok">type sign = Positive | Negative
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">sign_int</span><span class="text"> </span><span class="id">n</span><span class="text"> = </span><span class="kw1">if</span><span class="text"> </span><span class="id">n</span><span class="text"> &gt;= </span><span class="numeric">0</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="kw2">Positive</span><span class="text"> </span><span class="kw1">else</span><span class="text"> </span><span class="kw2">Negative</span><span class="text">;;
</span></code><code class="caml-output ok">val sign_int : int -&gt; sign = &lt;fun&gt;
</code></pre>


</div><p>To define arithmetic operations for the <span class="c003">number</span> type, we use
pattern-matching on the two numbers involved:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">add_num</span><span class="text"> </span><span class="id">n1</span><span class="text"> </span><span class="id">n2</span><span class="text"> =
    </span><span class="kw1">match</span><span class="text"> (</span><span class="id">n1</span><span class="text">, </span><span class="id">n2</span><span class="text">) </span><span class="kw1">with</span><span class="text">
      (</span><span class="kw2">Int</span><span class="text"> </span><span class="id">i1</span><span class="text">, </span><span class="kw2">Int</span><span class="text"> </span><span class="id">i2</span><span class="text">) -&gt;
        </span><span class="comment">(* Check for overflow of integer addition *)</span><span class="text">
        </span><span class="kw1">if</span><span class="text"> </span><span class="id">sign_int</span><span class="text"> </span><span class="id">i1</span><span class="text"> = </span><span class="id">sign_int</span><span class="text"> </span><span class="id">i2</span><span class="text"> &amp;&amp; </span><span class="id">sign_int</span><span class="text"> (</span><span class="id">i1</span><span class="text"> + </span><span class="id">i2</span><span class="text">) &lt;&gt; </span><span class="id">sign_int</span><span class="text"> </span><span class="id">i1</span><span class="text">
        </span><span class="kw1">then</span><span class="text"> </span><span class="kw2">Float</span><span class="text">(</span><span class="kw3">float</span><span class="text"> </span><span class="id">i1</span><span class="text"> +. </span><span class="kw3">float</span><span class="text"> </span><span class="id">i2</span><span class="text">)
        </span><span class="kw1">else</span><span class="text"> </span><span class="kw2">Int</span><span class="text">(</span><span class="id">i1</span><span class="text"> + </span><span class="id">i2</span><span class="text">)
    | (</span><span class="kw2">Int</span><span class="text"> </span><span class="id">i1</span><span class="text">, </span><span class="kw2">Float</span><span class="text"> </span><span class="id">f2</span><span class="text">) -&gt; </span><span class="kw2">Float</span><span class="text">(</span><span class="kw3">float</span><span class="text"> </span><span class="id">i1</span><span class="text"> +. </span><span class="id">f2</span><span class="text">)
    | (</span><span class="kw2">Float</span><span class="text"> </span><span class="id">f1</span><span class="text">, </span><span class="kw2">Int</span><span class="text"> </span><span class="id">i2</span><span class="text">) -&gt; </span><span class="kw2">Float</span><span class="text">(</span><span class="id">f1</span><span class="text"> +. </span><span class="kw3">float</span><span class="text"> </span><span class="id">i2</span><span class="text">)
    | (</span><span class="kw2">Float</span><span class="text"> </span><span class="id">f1</span><span class="text">, </span><span class="kw2">Float</span><span class="text"> </span><span class="id">f2</span><span class="text">) -&gt; </span><span class="kw2">Float</span><span class="text">(</span><span class="id">f1</span><span class="text"> +. </span><span class="id">f2</span><span class="text">)
    | (</span><span class="kw2">Error</span><span class="text">, </span><span class="numeric">_</span><span class="text">) -&gt; </span><span class="kw2">Error</span><span class="text">
    | (</span><span class="numeric">_</span><span class="text">, </span><span class="kw2">Error</span><span class="text">) -&gt; </span><span class="kw2">Error</span><span class="text">;;
</span></code><code class="caml-output ok">val add_num : number -&gt; number -&gt; number = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">add_num</span><span class="text"> (</span><span class="kw2">Int</span><span class="text"> </span><span class="numeric">123</span><span class="text">) (</span><span class="kw2">Float</span><span class="text"> </span><span class="numeric">3.14159</span><span class="text">);;
</span></code><code class="caml-output ok">- : number = Float 126.14159
</code></pre>


</div><p>Another interesting example of variant type is the built-in
<span class="c003">'a option</span> type which represents either a value of type <span class="c003">'a</span> or an
absence of value:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> '</span><span class="id">a</span><span class="text"> </span><span class="id">option</span><span class="text"> = </span><span class="kw2">Some</span><span class="text"> </span><span class="kw">of</span><span class="text"> '</span><span class="id">a</span><span class="text"> | </span><span class="kw2">None</span><span class="text">;;
</span></code><code class="caml-output ok">type 'a option = Some of 'a | None
</code></pre>


</div><p>

This type is particularly useful when defining function that can
fail in common situations, for instance


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">safe_square_root</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="kw1">if</span><span class="text"> </span><span class="id">x</span><span class="text"> &gt; </span><span class="numeric">0</span><span class="text">. </span><span class="kw1">then</span><span class="text"> </span><span class="kw2">Some</span><span class="text">(</span><span class="id">sqrt</span><span class="text"> </span><span class="id">x</span><span class="text">) </span><span class="kw1">else</span><span class="text"> </span><span class="kw2">None</span><span class="text">;;
</span></code><code class="caml-output ok">val safe_square_root : float -&gt; float option = &lt;fun&gt;
</code></pre>


</div><p>The most common usage of variant types is to describe recursive data
structures. Consider for example the type of binary trees:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> '</span><span class="id">a</span><span class="text"> </span><span class="id">btree</span><span class="text"> = </span><span class="kw2">Empty</span><span class="text"> | </span><span class="kw2">Node</span><span class="text"> </span><span class="kw">of</span><span class="text"> '</span><span class="id">a</span><span class="text"> * '</span><span class="id">a</span><span class="text"> </span><span class="id">btree</span><span class="text"> * '</span><span class="id">a</span><span class="text"> </span><span class="id">btree</span><span class="text">;;
</span></code><code class="caml-output ok">type 'a btree = Empty | Node of 'a * 'a btree * 'a btree
</code></pre>


</div><p>

This definition reads as follows: a binary tree containing values of
type <span class="c003">'a</span> (an arbitrary type) is either empty, or is a node containing
one value of type <span class="c003">'a</span> and two subtrees also containing values of type
<span class="c003">'a</span>, that is, two <span class="c003">'a btree</span>.</p><p>Operations on binary trees are naturally expressed as recursive functions
following the same structure as the type definition itself. For
instance, here are functions performing lookup and insertion in
ordered binary trees (elements increase from left to right):


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">member</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">btree</span><span class="text"> =
    </span><span class="kw1">match</span><span class="text"> </span><span class="id">btree</span><span class="text"> </span><span class="kw1">with</span><span class="text">
      </span><span class="kw2">Empty</span><span class="text"> -&gt; </span><span class="constant">false</span><span class="text">
    | </span><span class="kw2">Node</span><span class="text">(</span><span class="id">y</span><span class="text">, </span><span class="id">left</span><span class="text">, </span><span class="id">right</span><span class="text">) -&gt;
        </span><span class="kw1">if</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">y</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="constant">true</span><span class="text"> </span><span class="kw1">else</span><span class="text">
        </span><span class="kw1">if</span><span class="text"> </span><span class="id">x</span><span class="text"> &lt; </span><span class="id">y</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">member</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">left</span><span class="text"> </span><span class="kw1">else</span><span class="text"> </span><span class="id">member</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">right</span><span class="text">;;
</span></code><code class="caml-output ok">val member : 'a -&gt; 'a btree -&gt; bool = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">insert</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">btree</span><span class="text"> =
    </span><span class="kw1">match</span><span class="text"> </span><span class="id">btree</span><span class="text"> </span><span class="kw1">with</span><span class="text">
      </span><span class="kw2">Empty</span><span class="text"> -&gt; </span><span class="kw2">Node</span><span class="text">(</span><span class="id">x</span><span class="text">, </span><span class="kw2">Empty</span><span class="text">, </span><span class="kw2">Empty</span><span class="text">)
    | </span><span class="kw2">Node</span><span class="text">(</span><span class="id">y</span><span class="text">, </span><span class="id">left</span><span class="text">, </span><span class="id">right</span><span class="text">) -&gt;
        </span><span class="kw1">if</span><span class="text"> </span><span class="id">x</span><span class="text"> &lt;= </span><span class="id">y</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="kw2">Node</span><span class="text">(</span><span class="id">y</span><span class="text">, </span><span class="id">insert</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">left</span><span class="text">, </span><span class="id">right</span><span class="text">)
                  </span><span class="kw1">else</span><span class="text"> </span><span class="kw2">Node</span><span class="text">(</span><span class="id">y</span><span class="text">, </span><span class="id">left</span><span class="text">, </span><span class="id">insert</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">right</span><span class="text">);;
</span></code><code class="caml-output ok">val insert : 'a -&gt; 'a btree -&gt; 'a btree = &lt;fun&gt;
</code></pre>


</div>
<h3 class="subsection" id="sec12">4.1&nbsp;&nbsp;Record and variant disambiguation</h3>
<p>
( This subsection can be skipped on the first reading )</p><p>Astute readers may have wondered what happens when two or more record
fields or constructors share the same name</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">first_record</span><span class="text">  = { </span><span class="id">x</span><span class="text">:</span><span class="kw3">int</span><span class="text">; </span><span class="id">y</span><span class="text">:</span><span class="kw3">int</span><span class="text">; </span><span class="id">z</span><span class="text">:</span><span class="kw3">int</span><span class="text"> }
  </span><span class="kw">type</span><span class="text"> </span><span class="id">middle_record</span><span class="text"> = { </span><span class="id">x</span><span class="text">:</span><span class="kw3">int</span><span class="text">; </span><span class="id">z</span><span class="text">:</span><span class="kw3">int</span><span class="text"> }
  </span><span class="kw">type</span><span class="text"> </span><span class="id">last_record</span><span class="text">   = { </span><span class="id">x</span><span class="text">:</span><span class="kw3">int</span><span class="text"> };;
</span></code>
</pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">first_variant</span><span class="text"> = </span><span class="kw2">A</span><span class="text"> | </span><span class="kw2">B</span><span class="text"> | </span><span class="kw2">C</span><span class="text">
  </span><span class="kw">type</span><span class="text"> </span><span class="id">last_variant</span><span class="text">  = </span><span class="kw2">A</span><span class="text">;;
</span></code>
</pre>


</div><p>The answer is that when confronted with multiple options, OCaml tries to
use locally available information to disambiguate between the various fields
and constructors. First, if the type of the record or variant is known,
OCaml can pick unambiguously the corresponding field or constructor.
For instance:</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">look_at_x_then_z</span><span class="text"> (</span><span class="id">r</span><span class="text">:</span><span class="id">first_record</span><span class="text">) =
    </span><span class="kw">let</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">r</span><span class="text">.</span><span class="id">x</span><span class="text"> </span><span class="kw">in</span><span class="text">
    </span><span class="id">x</span><span class="text"> + </span><span class="id">r</span><span class="text">.</span><span class="id">z</span><span class="text">;;
</span></code><code class="caml-output ok">val look_at_x_then_z : first_record -&gt; int = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">permute</span><span class="text"> (</span><span class="id">x</span><span class="text">:</span><span class="id">first_variant</span><span class="text">) = </span><span class="kw1">match</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="kw1">with</span><span class="text">
    | </span><span class="kw2">A</span><span class="text"> -&gt; (</span><span class="kw2">B</span><span class="text">:</span><span class="id">first_variant</span><span class="text">)
    | </span><span class="kw2">B</span><span class="text"> -&gt; </span><span class="kw2">A</span><span class="text">
    | </span><span class="kw2">C</span><span class="text"> -&gt; </span><span class="kw2">C</span><span class="text">;;
</span></code><code class="caml-output ok">val permute : first_variant -&gt; first_variant = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">wrapped</span><span class="text"> = </span><span class="kw2">First</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="id">first_record</span><span class="text">
  </span><span class="kw">let</span><span class="text"> </span><span class="id">f</span><span class="text"> (</span><span class="kw2">First</span><span class="text"> </span><span class="id">r</span><span class="text">) = </span><span class="id">r</span><span class="text">, </span><span class="id">r</span><span class="text">.</span><span class="id">x</span><span class="text">;;
</span></code><code class="caml-output ok">type wrapped = First of first_record
val f : wrapped -&gt; first_record * int = &lt;fun&gt;
</code></pre>


</div><p>In the first example, <span class="c003">(r:first_record)</span> is an explicit annotation
telling OCaml that the type of <span class="c003">r</span> is <span class="c003">first_record</span>. With this
annotation, Ocaml knows that <span class="c003">r.x</span> refers to the <span class="c003">x</span> field of the first
record type. Similarly, the type annotation in the second example makes
it clear to OCaml that the constructors <span class="c003">A</span>, <span class="c003">B</span> and <span class="c003">C</span> come from the
first variant type. Contrarily, in the last example, OCaml has inferred
by itself that the type of <span class="c003">r</span> can only be <span class="c003">first_record</span> and there are
no needs for explicit type annotations.</p><p>Those explicit type annotations can in fact be used anywhere.
Most of the time they are unnecessary, but they are useful to guide
disambiguation, to debug unexpected type errors, or combined with some
of the more advanced features of OCaml described in later chapters.</p><p>Secondly, for records, OCaml can also deduce the right record type by
looking at the whole set of fields used in a expression or pattern:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">project_and_rotate</span><span class="text"> {</span><span class="id">x</span><span class="text">;</span><span class="id">y</span><span class="text">; </span><span class="numeric">_</span><span class="text"> } = { </span><span class="id">x</span><span class="text">= - </span><span class="id">y</span><span class="text">; </span><span class="id">y</span><span class="text"> = </span><span class="id">x</span><span class="text"> ; </span><span class="id">z</span><span class="text"> = </span><span class="numeric">0</span><span class="text">} ;;
</span></code><code class="caml-output ok">val project_and_rotate : first_record -&gt; first_record = &lt;fun&gt;
</code></pre>


</div><p>

Since the fields <span class="c003">x</span> and <span class="c003">y</span> can only appear simultaneously in the first
record type, OCaml infers that the type of <span class="c003">project_and_rotate</span> is
<span class="c003">first_record -&gt; first_record</span>.</p><p>In last resort, if there is not enough information to disambiguate between
different fields or constructors, Ocaml picks the last defined type
amongst all locally valid choices:</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">look_at_xz</span><span class="text"> {</span><span class="id">x</span><span class="text">;</span><span class="id">z</span><span class="text">} = </span><span class="id">x</span><span class="text">;;
</span></code><code class="caml-output ok">val look_at_xz : middle_record -&gt; int = &lt;fun&gt;
</code></pre>


</div><p>Here, OCaml has inferred that the possible choices for the type of
<span class="c003">{x;z}</span> are <span class="c003">first_record</span> and <span class="c003">middle_record</span>, since the type
<span class="c003">last_record</span> has no field <span class="c003">z</span>. Ocaml then picks the type <span class="c003">middle_record</span>
as the last defined type between the two possibilities.</p><p>Beware that this last resort disambiguation is local: once Ocaml has
chosen a disambiguation, it sticks to this choice, even if it leads to
an ulterior type error:</p><div class="caml-example toplevel">

<pre><code class="caml-input"> let look_at_x_then_y r =
    let x = r.x in (* Ocaml deduces [r: last_record] *)
    x + r.<u>y</u>;;
</code><code class="caml-output error">Error: This expression has type last_record
       The field y does not belong to type last_record
</code></pre>

<pre><code class="caml-input"> let is_a_or_b x = match x with
    | A -&gt; true (* OCaml infers [x: last_variant] *)
    | <u>B</u> -&gt; true;;
</code><code class="caml-output error">Error: This variant pattern is expected to have type last_variant
       The constructor B does not belong to type last_variant
</code></pre>


</div><p>Moreover, being the last defined type is a quite unstable position that
may change surreptitiously after adding or moving around a type
definition, or after opening a module (see chapter <a href="moduleexamples.html#c%3Amoduleexamples">2</a>).
Consequently, adding explicit type annotations to guide disambiguation is
more robust than relying on the last defined type disambiguation.</p>
<h2 class="section" id="sec13">5&nbsp;&nbsp;Imperative features</h2>
<p>Though all examples so far were written in purely applicative style,
OCaml is also equipped with full imperative features. This includes the
usual <span class="c003">while</span> and <span class="c003">for</span> loops, as well as mutable data structures such
as arrays. Arrays are either created by listing semicolon-separated element
values between <span class="c003">[|</span> and <span class="c003">|]</span> brackets, or allocated and initialized with the
<span class="c003">Array.make</span> function, then filled up later by assignments. For instance, the
function below sums two vectors (represented as float arrays) componentwise.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">add_vect</span><span class="text"> </span><span class="id">v1</span><span class="text"> </span><span class="id">v2</span><span class="text"> =
    </span><span class="kw">let</span><span class="text"> </span><span class="id">len</span><span class="text"> = </span><span class="id">min</span><span class="text"> (</span><span class="kw2">Array</span><span class="text">.</span><span class="id">length</span><span class="text"> </span><span class="id">v1</span><span class="text">) (</span><span class="kw2">Array</span><span class="text">.</span><span class="id">length</span><span class="text"> </span><span class="id">v2</span><span class="text">) </span><span class="kw">in</span><span class="text">
    </span><span class="kw">let</span><span class="text"> </span><span class="id">res</span><span class="text"> = </span><span class="kw2">Array</span><span class="text">.</span><span class="id">make</span><span class="text"> </span><span class="id">len</span><span class="text"> </span><span class="numeric">0.0</span><span class="text"> </span><span class="kw">in</span><span class="text">
    </span><span class="kw1">for</span><span class="text"> </span><span class="id">i</span><span class="text"> = </span><span class="numeric">0</span><span class="text"> </span><span class="kw1">to</span><span class="text"> </span><span class="id">len</span><span class="text"> - </span><span class="numeric">1</span><span class="text"> </span><span class="kw1">do</span><span class="text">
      </span><span class="id">res</span><span class="text">.(</span><span class="id">i</span><span class="text">) &lt;- </span><span class="id">v1</span><span class="text">.(</span><span class="id">i</span><span class="text">) +. </span><span class="id">v2</span><span class="text">.(</span><span class="id">i</span><span class="text">)
    </span><span class="kw1">done</span><span class="text">;
    </span><span class="id">res</span><span class="text">;;
</span></code><code class="caml-output ok">val add_vect : float array -&gt; float array -&gt; float array = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">add_vect</span><span class="text"> [| </span><span class="numeric">1.0</span><span class="text">; </span><span class="numeric">2.0</span><span class="text"> |] [| </span><span class="numeric">3.0</span><span class="text">; </span><span class="numeric">4.0</span><span class="text"> |];;
</span></code><code class="caml-output ok">- : float array = [|4.; 6.|]
</code></pre>


</div><p>Record fields can also be modified by assignment, provided they are
declared <span class="c003">mutable</span> in the definition of the record type:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">mutable_point</span><span class="text"> = { </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text">: </span><span class="kw3">float</span><span class="text">; </span><span class="kw">mutable</span><span class="text"> </span><span class="id">y</span><span class="text">: </span><span class="kw3">float</span><span class="text"> };;
</span></code><code class="caml-output ok">type mutable_point = { mutable x : float; mutable y : float; }
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">translate</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="id">dx</span><span class="text"> </span><span class="id">dy</span><span class="text"> =
    </span><span class="id">p</span><span class="text">.</span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">p</span><span class="text">.</span><span class="id">x</span><span class="text"> +. </span><span class="id">dx</span><span class="text">; </span><span class="id">p</span><span class="text">.</span><span class="id">y</span><span class="text"> &lt;- </span><span class="id">p</span><span class="text">.</span><span class="id">y</span><span class="text"> +. </span><span class="id">dy</span><span class="text">;;
</span></code><code class="caml-output ok">val translate : mutable_point -&gt; float -&gt; float -&gt; unit = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">mypoint</span><span class="text"> = { </span><span class="id">x</span><span class="text"> = </span><span class="numeric">0.0</span><span class="text">; </span><span class="id">y</span><span class="text"> = </span><span class="numeric">0.0</span><span class="text"> };;
</span></code><code class="caml-output ok">val mypoint : mutable_point = {x = 0.; y = 0.}
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">translate</span><span class="text"> </span><span class="id">mypoint</span><span class="text"> </span><span class="numeric">1.0</span><span class="text"> </span><span class="numeric">2.0</span><span class="text">;;
</span></code><code class="caml-output ok">- : unit = ()
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">mypoint</span><span class="text">;;
</span></code><code class="caml-output ok">- : mutable_point = {x = 1.; y = 2.}
</code></pre>


</div><p>OCaml has no built-in notion of variable – identifiers whose current
value can be changed by assignment. (The <span class="c003">let</span> binding is not an
assignment, it introduces a new identifier with a new scope.)
However, the standard library provides references, which are mutable
indirection cells, with operators <span class="c003">!</span> to fetch
the current contents of the reference and <span class="c003">:=</span> to assign the contents.
Variables can then be emulated by <span class="c003">let</span>-binding a reference. For
instance, here is an in-place insertion sort over arrays:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">insertion_sort</span><span class="text"> </span><span class="id">a</span><span class="text"> =
    </span><span class="kw1">for</span><span class="text"> </span><span class="id">i</span><span class="text"> = </span><span class="numeric">1</span><span class="text"> </span><span class="kw1">to</span><span class="text"> </span><span class="kw2">Array</span><span class="text">.</span><span class="id">length</span><span class="text"> </span><span class="id">a</span><span class="text"> - </span><span class="numeric">1</span><span class="text"> </span><span class="kw1">do</span><span class="text">
      </span><span class="kw">let</span><span class="text"> </span><span class="id">val_i</span><span class="text"> = </span><span class="id">a</span><span class="text">.(</span><span class="id">i</span><span class="text">) </span><span class="kw">in</span><span class="text">
      </span><span class="kw">let</span><span class="text"> </span><span class="id">j</span><span class="text"> = </span><span class="kw1">ref</span><span class="text"> </span><span class="id">i</span><span class="text"> </span><span class="kw">in</span><span class="text">
      </span><span class="kw1">while</span><span class="text"> !</span><span class="id">j</span><span class="text"> &gt; </span><span class="numeric">0</span><span class="text"> &amp;&amp; </span><span class="id">val_i</span><span class="text"> &lt; </span><span class="id">a</span><span class="text">.(!</span><span class="id">j</span><span class="text"> - </span><span class="numeric">1</span><span class="text">) </span><span class="kw1">do</span><span class="text">
        </span><span class="id">a</span><span class="text">.(!</span><span class="id">j</span><span class="text">) &lt;- </span><span class="id">a</span><span class="text">.(!</span><span class="id">j</span><span class="text"> - </span><span class="numeric">1</span><span class="text">);
        </span><span class="id">j</span><span class="text"> := !</span><span class="id">j</span><span class="text"> - </span><span class="numeric">1</span><span class="text">
      </span><span class="kw1">done</span><span class="text">;
      </span><span class="id">a</span><span class="text">.(!</span><span class="id">j</span><span class="text">) &lt;- </span><span class="id">val_i</span><span class="text">
    </span><span class="kw1">done</span><span class="text">;;
</span></code><code class="caml-output ok">val insertion_sort : 'a array -&gt; unit = &lt;fun&gt;
</code></pre>


</div><p>References are also useful to write functions that maintain a current
state between two calls to the function. For instance, the following
pseudo-random number generator keeps the last returned number in a
reference:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">current_rand</span><span class="text"> = </span><span class="kw1">ref</span><span class="text"> </span><span class="numeric">0</span><span class="text">;;
</span></code><code class="caml-output ok">val current_rand : int ref = {contents = 0}
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">random</span><span class="text"> () =
    </span><span class="id">current_rand</span><span class="text"> := !</span><span class="id">current_rand</span><span class="text"> * </span><span class="numeric">25713</span><span class="text"> + </span><span class="numeric">1345</span><span class="text">;
    !</span><span class="id">current_rand</span><span class="text">;;
</span></code><code class="caml-output ok">val random : unit -&gt; int = &lt;fun&gt;
</code></pre>


</div><p>Again, there is nothing magical with references: they are implemented as
a single-field mutable record, as follows.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> '</span><span class="id">a</span><span class="text"> </span><span class="kw1">ref</span><span class="text"> = { </span><span class="kw">mutable</span><span class="text"> </span><span class="id">contents</span><span class="text">: '</span><span class="id">a</span><span class="text"> };;
</span></code><code class="caml-output ok">type 'a ref = { mutable contents : 'a; }
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> ( ! ) </span><span class="id">r</span><span class="text"> = </span><span class="id">r</span><span class="text">.</span><span class="id">contents</span><span class="text">;;
</span></code><code class="caml-output ok">val ( ! ) : 'a ref -&gt; 'a = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> ( := ) </span><span class="id">r</span><span class="text"> </span><span class="id">newval</span><span class="text"> = </span><span class="id">r</span><span class="text">.</span><span class="id">contents</span><span class="text"> &lt;- </span><span class="id">newval</span><span class="text">;;
</span></code><code class="caml-output ok">val ( := ) : 'a ref -&gt; 'a -&gt; unit = &lt;fun&gt;
</code></pre>


</div><p>In some special cases, you may need to store a polymorphic function in
a data structure, keeping its polymorphism. Doing this requires
user-provided type annotations, since polymorphism is only introduced
automatically for global definitions. However, you can explicitly give
polymorphic types to record fields.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">idref</span><span class="text"> = { </span><span class="kw">mutable</span><span class="text"> </span><span class="id">id</span><span class="text">: '</span><span class="id">a</span><span class="text">. '</span><span class="id">a</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text"> };;
</span></code><code class="caml-output ok">type idref = { mutable id : 'a. 'a -&gt; 'a; }
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">r</span><span class="text"> = {</span><span class="id">id</span><span class="text"> = </span><span class="kw">fun</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; </span><span class="id">x</span><span class="text">};;
</span></code><code class="caml-output ok">val r : idref = {id = &lt;fun&gt;}
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">g</span><span class="text"> </span><span class="id">s</span><span class="text"> = (</span><span class="id">s</span><span class="text">.</span><span class="id">id</span><span class="text"> </span><span class="numeric">1</span><span class="text">, </span><span class="id">s</span><span class="text">.</span><span class="id">id</span><span class="text"> </span><span class="constant">true</span><span class="text">);;
</span></code><code class="caml-output ok">val g : idref -&gt; int * bool = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">r</span><span class="text">.</span><span class="id">id</span><span class="text"> &lt;- (</span><span class="kw">fun</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; </span><span class="id">print_string</span><span class="text"> </span><span class="string">"called id\n"</span><span class="text">; </span><span class="id">x</span><span class="text">);;
</span></code><code class="caml-output ok">- : unit = ()
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">g</span><span class="text"> </span><span class="id">r</span><span class="text">;;
</span></code><code class="caml-output ok">called id
called id
- : int * bool = (1, true)
</code></pre>


</div>
<h2 class="section" id="sec14">6&nbsp;&nbsp;Exceptions</h2>
<p>OCaml provides exceptions for signalling and handling exceptional
conditions. Exceptions can also be used as a general-purpose non-local
control structure, although this should not be overused since it can
make the code harder to understand. Exceptions are declared with the
<span class="c003">exception</span> construct, and signalled with the <span class="c003">raise</span> operator. For instance,
the function below for taking the head of a list uses an exception to
signal the case where an empty list is given.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">exception</span><span class="text"> </span><span class="kw2">Empty_list</span><span class="text">;;
</span></code><code class="caml-output ok">exception Empty_list
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">head</span><span class="text"> </span><span class="id">l</span><span class="text"> =
    </span><span class="kw1">match</span><span class="text"> </span><span class="id">l</span><span class="text"> </span><span class="kw1">with</span><span class="text">
      [] -&gt; </span><span class="id">raise</span><span class="text"> </span><span class="kw2">Empty_list</span><span class="text">
    | </span><span class="id">hd</span><span class="text"> :: </span><span class="id">tl</span><span class="text"> -&gt; </span><span class="id">hd</span><span class="text">;;
</span></code><code class="caml-output ok">val head : 'a list -&gt; 'a = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">head</span><span class="text"> [</span><span class="numeric">1</span><span class="text">;</span><span class="numeric">2</span><span class="text">];;
</span></code><code class="caml-output ok">- : int = 1
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">head</span><span class="text"> [];;
</span></code><code class="caml-output ok">Exception: Empty_list.
</code></pre>


</div><p>Exceptions are used throughout the standard library to signal cases
where the library functions cannot complete normally. For instance,
the <span class="c003">List.assoc</span> function, which returns the data associated with a
given key in a list of (key, data) pairs, raises the predefined
exception <span class="c003">Not_found</span> when the key does not appear in the list:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw2">List</span><span class="text">.</span><span class="id">assoc</span><span class="text"> </span><span class="numeric">1</span><span class="text"> [(</span><span class="numeric">0</span><span class="text">, </span><span class="string">"zero"</span><span class="text">); (</span><span class="numeric">1</span><span class="text">, </span><span class="string">"one"</span><span class="text">)];;
</span></code><code class="caml-output ok">- : string = "one"
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw2">List</span><span class="text">.</span><span class="id">assoc</span><span class="text"> </span><span class="numeric">2</span><span class="text"> [(</span><span class="numeric">0</span><span class="text">, </span><span class="string">"zero"</span><span class="text">); (</span><span class="numeric">1</span><span class="text">, </span><span class="string">"one"</span><span class="text">)];;
</span></code><code class="caml-output ok">Exception: Not_found.
</code></pre>


</div><p>Exceptions can be trapped with the <span class="c003">try</span>…<span class="c003">with</span> construct:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">name_of_binary_digit</span><span class="text"> </span><span class="id">digit</span><span class="text"> =
    </span><span class="kw1">try</span><span class="text">
      </span><span class="kw2">List</span><span class="text">.</span><span class="id">assoc</span><span class="text"> </span><span class="id">digit</span><span class="text"> [</span><span class="numeric">0</span><span class="text">, </span><span class="string">"zero"</span><span class="text">; </span><span class="numeric">1</span><span class="text">, </span><span class="string">"one"</span><span class="text">]
    </span><span class="kw1">with</span><span class="text"> </span><span class="kw2">Not_found</span><span class="text"> -&gt;
      </span><span class="string">"not a binary digit"</span><span class="text">;;
</span></code><code class="caml-output ok">val name_of_binary_digit : int -&gt; string = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">name_of_binary_digit</span><span class="text"> </span><span class="numeric">0</span><span class="text">;;
</span></code><code class="caml-output ok">- : string = "zero"
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">name_of_binary_digit</span><span class="text"> (</span><span class="numeric">-1</span><span class="text">);;
</span></code><code class="caml-output ok">- : string = "not a binary digit"
</code></pre>


</div><p>The <span class="c003">with</span> part does pattern matching on the
exception value with the same syntax and behavior as <span class="c003">match</span>. Thus,
several exceptions can be caught by one
<span class="c003">try</span>…<span class="c003">with</span> construct. Also, finalization can be performed by
trapping all exceptions, performing the finalization, then re-raising
the exception:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">temporarily_set_reference</span><span class="text"> </span><span class="kw1">ref</span><span class="text"> </span><span class="id">newval</span><span class="text"> </span><span class="id">funct</span><span class="text"> =
    </span><span class="kw">let</span><span class="text"> </span><span class="id">oldval</span><span class="text"> = !</span><span class="kw1">ref</span><span class="text"> </span><span class="kw">in</span><span class="text">
    </span><span class="kw1">try</span><span class="text">
      </span><span class="kw1">ref</span><span class="text"> := </span><span class="id">newval</span><span class="text">;
      </span><span class="kw">let</span><span class="text"> </span><span class="id">res</span><span class="text"> = </span><span class="id">funct</span><span class="text"> () </span><span class="kw">in</span><span class="text">
      </span><span class="kw1">ref</span><span class="text"> := </span><span class="id">oldval</span><span class="text">;
      </span><span class="id">res</span><span class="text">
    </span><span class="kw1">with</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt;
      </span><span class="kw1">ref</span><span class="text"> := </span><span class="id">oldval</span><span class="text">;
      </span><span class="id">raise</span><span class="text"> </span><span class="id">x</span><span class="text">;;
</span></code><code class="caml-output ok">val temporarily_set_reference : 'a ref -&gt; 'a -&gt; (unit -&gt; 'b) -&gt; 'b = &lt;fun&gt;
</code></pre>


</div>
<h2 class="section" id="sec15">7&nbsp;&nbsp;Symbolic processing of expressions</h2>
<p>We finish this introduction with a more complete example
representative of the use of OCaml for symbolic processing: formal
manipulations of arithmetic expressions containing variables. The
following variant type describes the expressions we shall manipulate:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">expression</span><span class="text"> =
      </span><span class="kw2">Const</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">float</span><span class="text">
    | </span><span class="kw2">Var</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text">
    | </span><span class="kw2">Sum</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="id">expression</span><span class="text"> * </span><span class="id">expression</span><span class="text">    </span><span class="comment">(* e1 + e2 *)</span><span class="text">
    | </span><span class="kw2">Diff</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="id">expression</span><span class="text"> * </span><span class="id">expression</span><span class="text">   </span><span class="comment">(* e1 - e2 *)</span><span class="text">
    | </span><span class="kw2">Prod</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="id">expression</span><span class="text"> * </span><span class="id">expression</span><span class="text">   </span><span class="comment">(* e1 * e2 *)</span><span class="text">
    | </span><span class="kw2">Quot</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="id">expression</span><span class="text"> * </span><span class="id">expression</span><span class="text">   </span><span class="comment">(* e1 / e2 *)</span><span class="text">
  ;;
</span></code><code class="caml-output ok">type expression =
    Const of float
  | Var of string
  | Sum of expression * expression
  | Diff of expression * expression
  | Prod of expression * expression
  | Quot of expression * expression
</code></pre>


</div><p>We first define a function to evaluate an expression given an
environment that maps variable names to their values. For simplicity,
the environment is represented as an association list.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">exception</span><span class="text"> </span><span class="kw2">Unbound_variable</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text">;;
</span></code><code class="caml-output ok">exception Unbound_variable of string
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">eval</span><span class="text"> </span><span class="id">env</span><span class="text"> </span><span class="id">exp</span><span class="text"> =
    </span><span class="kw1">match</span><span class="text"> </span><span class="id">exp</span><span class="text"> </span><span class="kw1">with</span><span class="text">
      </span><span class="kw2">Const</span><span class="text"> </span><span class="id">c</span><span class="text"> -&gt; </span><span class="id">c</span><span class="text">
    | </span><span class="kw2">Var</span><span class="text"> </span><span class="id">v</span><span class="text"> -&gt;
        (</span><span class="kw1">try</span><span class="text"> </span><span class="kw2">List</span><span class="text">.</span><span class="id">assoc</span><span class="text"> </span><span class="id">v</span><span class="text"> </span><span class="id">env</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="kw2">Not_found</span><span class="text"> -&gt; </span><span class="id">raise</span><span class="text"> (</span><span class="kw2">Unbound_variable</span><span class="text"> </span><span class="id">v</span><span class="text">))
    | </span><span class="kw2">Sum</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">g</span><span class="text">) -&gt; </span><span class="id">eval</span><span class="text"> </span><span class="id">env</span><span class="text"> </span><span class="id">f</span><span class="text"> +. </span><span class="id">eval</span><span class="text"> </span><span class="id">env</span><span class="text"> </span><span class="id">g</span><span class="text">
    | </span><span class="kw2">Diff</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">g</span><span class="text">) -&gt; </span><span class="id">eval</span><span class="text"> </span><span class="id">env</span><span class="text"> </span><span class="id">f</span><span class="text"> -. </span><span class="id">eval</span><span class="text"> </span><span class="id">env</span><span class="text"> </span><span class="id">g</span><span class="text">
    | </span><span class="kw2">Prod</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">g</span><span class="text">) -&gt; </span><span class="id">eval</span><span class="text"> </span><span class="id">env</span><span class="text"> </span><span class="id">f</span><span class="text"> *. </span><span class="id">eval</span><span class="text"> </span><span class="id">env</span><span class="text"> </span><span class="id">g</span><span class="text">
    | </span><span class="kw2">Quot</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">g</span><span class="text">) -&gt; </span><span class="id">eval</span><span class="text"> </span><span class="id">env</span><span class="text"> </span><span class="id">f</span><span class="text"> /. </span><span class="id">eval</span><span class="text"> </span><span class="id">env</span><span class="text"> </span><span class="id">g</span><span class="text">;;
</span></code><code class="caml-output ok">val eval : (string * float) list -&gt; expression -&gt; float = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">eval</span><span class="text"> [(</span><span class="string">"x"</span><span class="text">, </span><span class="numeric">1.0</span><span class="text">); (</span><span class="string">"y"</span><span class="text">, </span><span class="numeric">3.14</span><span class="text">)] (</span><span class="kw2">Prod</span><span class="text">(</span><span class="kw2">Sum</span><span class="text">(</span><span class="kw2">Var</span><span class="text"> </span><span class="string">"x"</span><span class="text">, </span><span class="kw2">Const</span><span class="text"> </span><span class="numeric">2.0</span><span class="text">), </span><span class="kw2">Var</span><span class="text"> </span><span class="string">"y"</span><span class="text">));;
</span></code><code class="caml-output ok">- : float = 9.42
</code></pre>


</div><p>Now for a real symbolic processing, we define the derivative of an
expression with respect to a variable <span class="c003">dv</span>:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">deriv</span><span class="text"> </span><span class="id">exp</span><span class="text"> </span><span class="id">dv</span><span class="text"> =
    </span><span class="kw1">match</span><span class="text"> </span><span class="id">exp</span><span class="text"> </span><span class="kw1">with</span><span class="text">
      </span><span class="kw2">Const</span><span class="text"> </span><span class="id">c</span><span class="text"> -&gt; </span><span class="kw2">Const</span><span class="text"> </span><span class="numeric">0.0</span><span class="text">
    | </span><span class="kw2">Var</span><span class="text"> </span><span class="id">v</span><span class="text"> -&gt; </span><span class="kw1">if</span><span class="text"> </span><span class="id">v</span><span class="text"> = </span><span class="id">dv</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="kw2">Const</span><span class="text"> </span><span class="numeric">1.0</span><span class="text"> </span><span class="kw1">else</span><span class="text"> </span><span class="kw2">Const</span><span class="text"> </span><span class="numeric">0.0</span><span class="text">
    | </span><span class="kw2">Sum</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">g</span><span class="text">) -&gt; </span><span class="kw2">Sum</span><span class="text">(</span><span class="id">deriv</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">dv</span><span class="text">, </span><span class="id">deriv</span><span class="text"> </span><span class="id">g</span><span class="text"> </span><span class="id">dv</span><span class="text">)
    | </span><span class="kw2">Diff</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">g</span><span class="text">) -&gt; </span><span class="kw2">Diff</span><span class="text">(</span><span class="id">deriv</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">dv</span><span class="text">, </span><span class="id">deriv</span><span class="text"> </span><span class="id">g</span><span class="text"> </span><span class="id">dv</span><span class="text">)
    | </span><span class="kw2">Prod</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">g</span><span class="text">) -&gt; </span><span class="kw2">Sum</span><span class="text">(</span><span class="kw2">Prod</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">deriv</span><span class="text"> </span><span class="id">g</span><span class="text"> </span><span class="id">dv</span><span class="text">), </span><span class="kw2">Prod</span><span class="text">(</span><span class="id">deriv</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">dv</span><span class="text">, </span><span class="id">g</span><span class="text">))
    | </span><span class="kw2">Quot</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">g</span><span class="text">) -&gt; </span><span class="kw2">Quot</span><span class="text">(</span><span class="kw2">Diff</span><span class="text">(</span><span class="kw2">Prod</span><span class="text">(</span><span class="id">deriv</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">dv</span><span class="text">, </span><span class="id">g</span><span class="text">), </span><span class="kw2">Prod</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">deriv</span><span class="text"> </span><span class="id">g</span><span class="text"> </span><span class="id">dv</span><span class="text">)),
                         </span><span class="kw2">Prod</span><span class="text">(</span><span class="id">g</span><span class="text">, </span><span class="id">g</span><span class="text">))
  ;;
</span></code><code class="caml-output ok">val deriv : expression -&gt; string -&gt; expression = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">deriv</span><span class="text"> (</span><span class="kw2">Quot</span><span class="text">(</span><span class="kw2">Const</span><span class="text"> </span><span class="numeric">1.0</span><span class="text">, </span><span class="kw2">Var</span><span class="text"> </span><span class="string">"x"</span><span class="text">)) </span><span class="string">"x"</span><span class="text">;;
</span></code><code class="caml-output ok">- : expression =
Quot (Diff (Prod (Const 0., Var "x"), Prod (Const 1., Const 1.)),
 Prod (Var "x", Var "x"))
</code></pre>


</div>
<h2 class="section" id="sec16">8&nbsp;&nbsp;Pretty-printing</h2>
<p>As shown in the examples above, the internal representation (also
called <em>abstract syntax</em>) of expressions quickly becomes hard to
read and write as the expressions get larger. We need a printer and a
parser to go back and forth between the abstract syntax and the <em>concrete syntax</em>, which in the case of expressions is the familiar
algebraic notation (e.g. <span class="c003">2*x+1</span>).</p><p>For the printing function, we take into account the usual precedence
rules (i.e. <span class="c003">*</span> binds tighter than <span class="c003">+</span>) to avoid printing unnecessary
parentheses. To this end, we maintain the current operator precedence
and print parentheses around an operator only if its precedence is
less than the current precedence.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">print_expr</span><span class="text"> </span><span class="id">exp</span><span class="text"> =
    </span><span class="comment">(* Local function definitions *)</span><span class="text">
    </span><span class="kw">let</span><span class="text"> </span><span class="id">open_paren</span><span class="text"> </span><span class="id">prec</span><span class="text"> </span><span class="id">op_prec</span><span class="text"> =
      </span><span class="kw1">if</span><span class="text"> </span><span class="id">prec</span><span class="text"> &gt; </span><span class="id">op_prec</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">print_string</span><span class="text"> </span><span class="string">"("</span><span class="text"> </span><span class="kw">in</span><span class="text">
    </span><span class="kw">let</span><span class="text"> </span><span class="id">close_paren</span><span class="text"> </span><span class="id">prec</span><span class="text"> </span><span class="id">op_prec</span><span class="text"> =
      </span><span class="kw1">if</span><span class="text"> </span><span class="id">prec</span><span class="text"> &gt; </span><span class="id">op_prec</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">print_string</span><span class="text"> </span><span class="string">")"</span><span class="text"> </span><span class="kw">in</span><span class="text">
    </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">print</span><span class="text"> </span><span class="id">prec</span><span class="text"> </span><span class="id">exp</span><span class="text"> =     </span><span class="comment">(* prec is the current precedence *)</span><span class="text">
      </span><span class="kw1">match</span><span class="text"> </span><span class="id">exp</span><span class="text"> </span><span class="kw1">with</span><span class="text">
        </span><span class="kw2">Const</span><span class="text"> </span><span class="id">c</span><span class="text"> -&gt; </span><span class="id">print_float</span><span class="text"> </span><span class="id">c</span><span class="text">
      | </span><span class="kw2">Var</span><span class="text"> </span><span class="id">v</span><span class="text"> -&gt; </span><span class="id">print_string</span><span class="text"> </span><span class="id">v</span><span class="text">
      | </span><span class="kw2">Sum</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">g</span><span class="text">) -&gt;
          </span><span class="id">open_paren</span><span class="text"> </span><span class="id">prec</span><span class="text"> </span><span class="numeric">0</span><span class="text">;
          </span><span class="id">print</span><span class="text"> </span><span class="numeric">0</span><span class="text"> </span><span class="id">f</span><span class="text">; </span><span class="id">print_string</span><span class="text"> </span><span class="string">" + "</span><span class="text">; </span><span class="id">print</span><span class="text"> </span><span class="numeric">0</span><span class="text"> </span><span class="id">g</span><span class="text">;
          </span><span class="id">close_paren</span><span class="text"> </span><span class="id">prec</span><span class="text"> </span><span class="numeric">0</span><span class="text">
      | </span><span class="kw2">Diff</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">g</span><span class="text">) -&gt;
          </span><span class="id">open_paren</span><span class="text"> </span><span class="id">prec</span><span class="text"> </span><span class="numeric">0</span><span class="text">;
          </span><span class="id">print</span><span class="text"> </span><span class="numeric">0</span><span class="text"> </span><span class="id">f</span><span class="text">; </span><span class="id">print_string</span><span class="text"> </span><span class="string">" - "</span><span class="text">; </span><span class="id">print</span><span class="text"> </span><span class="numeric">1</span><span class="text"> </span><span class="id">g</span><span class="text">;
          </span><span class="id">close_paren</span><span class="text"> </span><span class="id">prec</span><span class="text"> </span><span class="numeric">0</span><span class="text">
      | </span><span class="kw2">Prod</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">g</span><span class="text">) -&gt;
          </span><span class="id">open_paren</span><span class="text"> </span><span class="id">prec</span><span class="text"> </span><span class="numeric">2</span><span class="text">;
          </span><span class="id">print</span><span class="text"> </span><span class="numeric">2</span><span class="text"> </span><span class="id">f</span><span class="text">; </span><span class="id">print_string</span><span class="text"> </span><span class="string">" * "</span><span class="text">; </span><span class="id">print</span><span class="text"> </span><span class="numeric">2</span><span class="text"> </span><span class="id">g</span><span class="text">;
          </span><span class="id">close_paren</span><span class="text"> </span><span class="id">prec</span><span class="text"> </span><span class="numeric">2</span><span class="text">
      | </span><span class="kw2">Quot</span><span class="text">(</span><span class="id">f</span><span class="text">, </span><span class="id">g</span><span class="text">) -&gt;
          </span><span class="id">open_paren</span><span class="text"> </span><span class="id">prec</span><span class="text"> </span><span class="numeric">2</span><span class="text">;
          </span><span class="id">print</span><span class="text"> </span><span class="numeric">2</span><span class="text"> </span><span class="id">f</span><span class="text">; </span><span class="id">print_string</span><span class="text"> </span><span class="string">" / "</span><span class="text">; </span><span class="id">print</span><span class="text"> </span><span class="numeric">3</span><span class="text"> </span><span class="id">g</span><span class="text">;
          </span><span class="id">close_paren</span><span class="text"> </span><span class="id">prec</span><span class="text"> </span><span class="numeric">2</span><span class="text">
    </span><span class="kw">in</span><span class="text"> </span><span class="id">print</span><span class="text"> </span><span class="numeric">0</span><span class="text"> </span><span class="id">exp</span><span class="text">;;
</span></code><code class="caml-output ok">val print_expr : expression -&gt; unit = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">e</span><span class="text"> = </span><span class="kw2">Sum</span><span class="text">(</span><span class="kw2">Prod</span><span class="text">(</span><span class="kw2">Const</span><span class="text"> </span><span class="numeric">2.0</span><span class="text">, </span><span class="kw2">Var</span><span class="text"> </span><span class="string">"x"</span><span class="text">), </span><span class="kw2">Const</span><span class="text"> </span><span class="numeric">1.0</span><span class="text">);;
</span></code><code class="caml-output ok">val e : expression = Sum (Prod (Const 2., Var "x"), Const 1.)
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">print_expr</span><span class="text"> </span><span class="id">e</span><span class="text">; </span><span class="id">print_newline</span><span class="text"> ();;
</span></code><code class="caml-output ok">2. * x + 1.
- : unit = ()
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">print_expr</span><span class="text"> (</span><span class="id">deriv</span><span class="text"> </span><span class="id">e</span><span class="text"> </span><span class="string">"x"</span><span class="text">); </span><span class="id">print_newline</span><span class="text"> ();;
</span></code><code class="caml-output ok">2. * 1. + 0. * x + 0.
- : unit = ()
</code></pre>


</div>
<h2 class="section" id="sec17">9&nbsp;&nbsp;Standalone OCaml programs</h2>
<p>All examples given so far were executed under the interactive system.
OCaml code can also be compiled separately and executed
non-interactively using the batch compilers <span class="c003">ocamlc</span> and <span class="c003">ocamlopt</span>.
The source code must be put in a file with extension <span class="c003">.ml</span>. It
consists of a sequence of phrases, which will be evaluated at runtime
in their order of appearance in the source file. Unlike in interactive
mode, types and values are not printed automatically; the program must
call printing functions explicitly to produce some output. The <span class="c003">;;</span> used
in the interactive examples is not required in
source files created for use with OCaml compilers, but can be helpful
to mark the end of a top-level expression unambiguously even when
there are syntax errors.
Here is a
sample standalone program to print Fibonacci numbers:
</p><pre>(* File fib.ml *)
let rec fib n =
  if n &lt; 2 then 1 else fib (n-1) + fib (n-2);;
let main () =
  let arg = int_of_string Sys.argv.(1) in
  print_int (fib arg);
  print_newline ();
  exit 0;;
main ();;
</pre><p><span class="c003">Sys.argv</span> is an array of strings containing the command-line
parameters. <span class="c003">Sys.argv.(1)</span> is thus the first command-line parameter.
The program above is compiled and executed with the following shell
commands:
</p><pre>$ ocamlc -o fib fib.ml
$ ./fib 10
89
$ ./fib 20
10946
</pre><p>
More complex standalone OCaml programs are typically composed of
multiple source files, and can link with precompiled libraries.
Chapters&nbsp;<a href="comp.html#c%3Acamlc">9</a> and&nbsp;<a href="native.html#c%3Anativecomp">12</a> explain how to use the
batch compilers <span class="c003">ocamlc</span> and <span class="c003">ocamlopt</span>. Recompilation of
multi-file OCaml projects can be automated using third-party
build systems, such as the
<a href="https://github.com/ocaml/ocamlbuild/">ocamlbuild</a>
compilation manager.

</p>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>