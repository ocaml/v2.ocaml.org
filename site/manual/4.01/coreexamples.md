<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li class="active"><a href="coreexamples.html">The core language</a></li><li><a href="moduleexamples.html">The module system</a></li><li><a href="objectexamples.html">Objects in OCaml</a></li><li><a href="lablexamples.html">Labels and variants</a></li><li><a href="advexamples.html">Advanced examples with classes and modules</a></li></ul>




<h1 class="chapter" id="sec7"><span>Chapter 1</span>&nbsp;&nbsp;The core language</h1>
<header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.01</a></div><div class="toc_title"><a href="#">The core language</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="coreexamples.html#sec8">Basics</a>
</li><li><a href="coreexamples.html#sec9">Data types</a>
</li><li><a href="coreexamples.html#sec10">Functions as values</a>
</li><li><a href="coreexamples.html#sec11">Records and variants</a>
</li><li><a href="coreexamples.html#sec12">Imperative features</a>
</li><li><a href="coreexamples.html#sec13">Exceptions</a>
</li><li><a href="coreexamples.html#sec14">Symbolic processing of expressions</a>
</li><li><a href="coreexamples.html#sec15">Pretty-printing and parsing</a>
</li><li><a href="coreexamples.html#sec16">Standalone OCaml programs</a>
</li></ul></nav></header>
<p> <a id="c:core-xamples"></a>

</p><p>This part of the manual is a tutorial introduction to the
OCaml language. A good familiarity with programming in a conventional
languages (say, Pascal or C) is assumed, but no prior exposure to
functional languages is required. The present chapter introduces the
core language. Chapter&nbsp;<a href="moduleexamples.html#c%3Amoduleexamples">2</a> deals with the
module system, chapter&nbsp;<a href="objectexamples.html#c%3Aobjectexamples">3</a> with the
object-oriented features, chapter&nbsp;<a href="lablexamples.html#c%3Alabl-examples">4</a> with
extensions to the core language (labeled arguments and polymorphic
variants), and chapter&nbsp;<a href="advexamples.html#c%3Aadvexamples">5</a> gives some advanced examples.</p>
<h2 class="section" id="sec8">1&nbsp;&nbsp;Basics</h2>
<p>For this overview of OCaml, we use the interactive system, which
is started by running <span class="c007">ocaml</span> from the Unix shell, or by launching the
<span class="c007">OCamlwin.exe</span> application under Windows. This tutorial is presented
as the transcript of a session with the interactive system:
lines starting with <span class="c007">#</span> represent user input; the system responses are
printed below, without a leading <span class="c007">#</span>.</p><p>Under the interactive system, the user types OCaml phrases terminated
by <span class="c007">;;</span> in response to the <span class="c007">#</span> prompt, and the system compiles them
on the fly, executes them, and prints the outcome of evaluation.
Phrases are either simple expressions, or <span class="c007">let</span> definitions of
identifiers (either values or functions).
</p><pre><span class="c004">#</span><span class="c003"> 1+2*3;;
<span class="c006">- : int = 7

</span><span class="c004">#</span> let pi = 4.0 *. atan 1.0;;
<span class="c006">val pi : float = 3.14159265358979312

</span><span class="c004">#</span> let square x = x *. x;;
<span class="c006">val square : float -&gt; float = &lt;fun&gt;

</span><span class="c004">#</span> square (sin pi) +. square (cos pi);;
</span><span class="c006">- : float = 1.
</span></pre><p>
The OCaml system computes both the value and the type for
each phrase. Even function parameters need no explicit type declaration:
the system infers their types from their usage in the
function. Notice also that integers and floating-point numbers are
distinct types, with distinct operators: <span class="c007">+</span> and <span class="c007">*</span> operate on
integers, but <span class="c007">+.</span> and <span class="c007">*.</span> operate on floats.
</p><pre><span class="c004">#</span> <span class="c003"><u>1.0</u> * 2;;
</span><span class="c006">Error: This expression has type float but an expression was expected of type
         int
</span></pre><p>Recursive functions are defined with the <span class="c007">let rec</span> binding:
</p><pre><span class="c004">#</span><span class="c003"> let rec fib n =
    if n &lt; 2 then n else fib (n-1) + fib (n-2);;
<span class="c006">val fib : int -&gt; int = &lt;fun&gt;

</span><span class="c004">#</span> fib 10;;
</span><span class="c006">- : int = 55
</span></pre>
<h2 class="section" id="sec9">2&nbsp;&nbsp;Data types</h2>
<p>In addition to integers and floating-point numbers, OCaml offers the
usual basic data types: booleans, characters, and character strings.
</p><pre><span class="c004">#</span><span class="c003"> (1 &lt; 2) = false;;
<span class="c006">- : bool = false

</span><span class="c004">#</span> 'a';;
<span class="c006">- : char = 'a'

</span><span class="c004">#</span> "Hello world";;
</span><span class="c006">- : string = "Hello world"
</span></pre><p>Predefined data structures include tuples, arrays, and lists. General
mechanisms for defining your own data structures are also provided.
They will be covered in more details later; for now, we concentrate on lists.
Lists are either given in extension as a bracketed list of
semicolon-separated elements, or built from the empty list <span class="c007">[]</span>
(pronounce “nil”) by adding elements in front using the <span class="c007">::</span>
(“cons”) operator.
</p><pre><span class="c004">#</span><span class="c003"> let l = ["is"; "a"; "tale"; "told"; "etc."];;
<span class="c006">val l : string list = ["is"; "a"; "tale"; "told"; "etc."]

</span><span class="c004">#</span> "Life" :: l;;
</span><span class="c006">- : string list = ["Life"; "is"; "a"; "tale"; "told"; "etc."]
</span></pre><p>
As with all other OCaml data structures, lists do not need to be
explicitly allocated and deallocated from memory: all memory
management is entirely automatic in OCaml. Similarly, there is no
explicit handling of pointers: the OCaml compiler silently introduces
pointers where necessary.</p><p>As with most OCaml data structures, inspecting and destructuring lists
is performed by pattern-matching. List patterns have the exact same
shape as list expressions, with identifier representing unspecified
parts of the list. As an example, here is insertion sort on a list:
</p><pre><span class="c004">#</span><span class="c003"> let rec sort lst =
    match lst with
      [] -&gt; []
    | head :: tail -&gt; insert head (sort tail)
  and insert elt lst =
    match lst with
      [] -&gt; [elt]
    | head :: tail -&gt; if elt &lt;= head then elt :: lst else head :: insert elt tail
  ;;
<span class="c006">val sort : 'a list -&gt; 'a list = &lt;fun&gt;
val insert : 'a -&gt; 'a list -&gt; 'a list = &lt;fun&gt;

</span><span class="c004">#</span> sort l;;
</span><span class="c006">- : string list = ["a"; "etc."; "is"; "tale"; "told"]
</span></pre><p>The type inferred for <span class="c007">sort</span>, <span class="c007">'a list -&gt; 'a list</span>, means that <span class="c007">sort</span>
can actually apply to lists of any type, and returns a list of the
same type. The type <span class="c007">'a</span> is a <em>type variable</em>, and stands for any
given type. The reason why <span class="c007">sort</span> can apply to lists of any type is
that the comparisons (<span class="c007">=</span>, <span class="c007">&lt;=</span>, etc.) are <em>polymorphic</em> in OCaml:
they operate between any two values of the same type. This makes
<span class="c007">sort</span> itself polymorphic over all list types.
</p><pre><span class="c004">#</span><span class="c003"> sort [6;2;5;3];;
<span class="c006">- : int list = [2; 3; 5; 6]

</span><span class="c004">#</span> sort [3.14; 2.718];;
</span><span class="c006">- : float list = [2.718; 3.14]
</span></pre><p>The <span class="c007">sort</span> function above does not modify its input list: it builds
and returns a new list containing the same elements as the input list,
in ascending order. There is actually no way in OCaml to modify
in-place a list once it is built: we say that lists are <em>immutable</em>
data structures. Most OCaml data structures are immutable, but a few
(most notably arrays) are <em>mutable</em>, meaning that they can be
modified in-place at any time.</p>
<h2 class="section" id="sec10">3&nbsp;&nbsp;Functions as values</h2>
<p>OCaml is a functional language: functions in the full mathematical
sense are supported and can be passed around freely just as any other
piece of data. For instance, here is a <span class="c007">deriv</span> function that takes any
float function as argument and returns an approximation of its
derivative function:
</p><pre><span class="c004">#</span><span class="c003"> let deriv f dx = function x -&gt; (f (x +. dx) -. f x) /. dx;;
<span class="c006">val deriv : (float -&gt; float) -&gt; float -&gt; float -&gt; float = &lt;fun&gt;

</span><span class="c004">#</span> let sin' = deriv sin 1e-6;;
<span class="c006">val sin' : float -&gt; float = &lt;fun&gt;

</span><span class="c004">#</span> sin' pi;;
</span><span class="c006">- : float = -1.00000000013961143
</span></pre><p>
Even function composition is definable:
</p><pre><span class="c004">#</span><span class="c003"> let compose f g = function x -&gt; f (g x);;
<span class="c006">val compose : ('a -&gt; 'b) -&gt; ('c -&gt; 'a) -&gt; 'c -&gt; 'b = &lt;fun&gt;

</span><span class="c004">#</span> let cos2 = compose square cos;;
</span><span class="c006">val cos2 : float -&gt; float = &lt;fun&gt;
</span></pre><p>Functions that take other functions as arguments are called
“functionals”, or “higher-order functions”. Functionals are
especially useful to provide iterators or similar generic operations
over a data structure. For instance, the standard OCaml library
provides a <span class="c007">List.map</span> functional that applies a given function to each
element of a list, and returns the list of the results:
</p><pre><span class="c004">#<span class="c003"> List.map (function n -&gt; n * 2 + 1) [0;1;2;3;4];;
<span class="c006">- : int list = [1; 3; 5; 7; 9]
</span></span></span></pre><p>
This functional, along with a number of other list and array
functionals, is predefined because it is often useful, but there is
nothing magic with it: it can easily be defined as follows.
</p><pre><span class="c004">#<span class="c003"> let rec map f l =
    match l with
      [] -&gt; []
    | hd :: tl -&gt; f hd :: map f tl;;
<span class="c006">val map : ('a -&gt; 'b) -&gt; 'a list -&gt; 'b list = &lt;fun&gt;
</span></span></span></pre>
<h2 class="section" id="sec11">4&nbsp;&nbsp;Records and variants</h2>
<p>

<a id="s:tut-recvariants"></a></p><p>User-defined data structures include records and variants. Both are
defined with the <span class="c007">type</span> declaration. Here, we declare a record type to
represent rational numbers.
</p><pre><span class="c004">#</span><span class="c003"> type ratio = {num: int; denom: int};;
<span class="c006">type ratio = { num : int; denom : int; }

</span><span class="c004">#</span> let add_ratio r1 r2 =
    {num = r1.num * r2.denom + r2.num * r1.denom;
     denom = r1.denom * r2.denom};;
<span class="c006">val add_ratio : ratio -&gt; ratio -&gt; ratio = &lt;fun&gt;

</span><span class="c004">#</span> add_ratio {num=1; denom=3} {num=2; denom=5};;
</span><span class="c006">- : ratio = {num = 11; denom = 15}
</span></pre><p>The declaration of a variant type lists all possible shapes for values
of that type. Each case is identified by a name, called a constructor,
which serves both for constructing values of the variant type and
inspecting them by pattern-matching. Constructor names are capitalized
to distinguish them from variable names (which must start with a
lowercase letter). For instance, here is a variant
type for doing mixed arithmetic (integers and floats):
</p><pre><span class="c004">#<span class="c003"> type number = Int of int | Float of float | Error;;
<span class="c006">type number = Int of int | Float of float | Error
</span></span></span></pre><p>
This declaration expresses that a value of type <span class="c007">number</span> is either an
integer, a floating-point number, or the constant <span class="c007">Error</span> representing
the result of an invalid operation (e.g. a division by zero).</p><p>Enumerated types are a special case of variant types, where all
alternatives are constants:
</p><pre><span class="c004">#</span><span class="c003"> type sign = Positive | Negative;;
<span class="c006">type sign = Positive | Negative

</span><span class="c004">#</span> let sign_int n = if n &gt;= 0 then Positive else Negative;;
</span><span class="c006">val sign_int : int -&gt; sign = &lt;fun&gt;
</span></pre><p>To define arithmetic operations for the <span class="c007">number</span> type, we use
pattern-matching on the two numbers involved:
</p><pre><span class="c004">#</span><span class="c003"> let add_num n1 n2 =
    match (n1, n2) with
      (Int i1, Int i2) -&gt;
        (* Check for overflow of integer addition *)
        if sign_int i1 = sign_int i2 &amp;&amp; sign_int (i1 + i2) &lt;&gt; sign_int i1
        then Float(float i1 +. float i2)
        else Int(i1 + i2)
    | (Int i1, Float f2) -&gt; Float(float i1 +. f2)
    | (Float f1, Int i2) -&gt; Float(f1 +. float i2)
    | (Float f1, Float f2) -&gt; Float(f1 +. f2)
    | (Error, _) -&gt; Error
    | (_, Error) -&gt; Error;;
<span class="c006">val add_num : number -&gt; number -&gt; number = &lt;fun&gt;

</span><span class="c004">#</span> add_num (Int 123) (Float 3.14159);;
</span><span class="c006">- : number = Float 126.14159
</span></pre><p>The most common usage of variant types is to describe recursive data
structures. Consider for example the type of binary trees:
</p><pre><span class="c004">#<span class="c003"> type 'a btree = Empty | Node of 'a * 'a btree * 'a btree;;
<span class="c006">type 'a btree = Empty | Node of 'a * 'a btree * 'a btree
</span></span></span></pre><p>
This definition reads as follow: a binary tree containing values of
type <span class="c007">'a</span> (an arbitrary type) is either empty, or is a node containing
one value of type <span class="c007">'a</span> and two subtrees containing also values of type
<span class="c007">'a</span>, that is, two <span class="c007">'a btree</span>.</p><p>Operations on binary trees are naturally expressed as recursive functions
following the same structure as the type definition itself. For
instance, here are functions performing lookup and insertion in
ordered binary trees (elements increase from left to right):
</p><pre><span class="c004">#</span><span class="c003"> let rec member x btree =
    match btree with
      Empty -&gt; false
    | Node(y, left, right) -&gt;
        if x = y then true else
        if x &lt; y then member x left else member x right;;
<span class="c006">val member : 'a -&gt; 'a btree -&gt; bool = &lt;fun&gt;

</span><span class="c004">#</span> let rec insert x btree =
    match btree with
      Empty -&gt; Node(x, Empty, Empty)
    | Node(y, left, right) -&gt;
        if x &lt;= y then Node(y, insert x left, right)
                  else Node(y, left, insert x right);;
</span><span class="c006">val insert : 'a -&gt; 'a btree -&gt; 'a btree = &lt;fun&gt;
</span></pre>
<h2 class="section" id="sec12">5&nbsp;&nbsp;Imperative features</h2>
<p>Though all examples so far were written in purely applicative style,
OCaml is also equipped with full imperative features. This includes the
usual <span class="c007">while</span> and <span class="c007">for</span> loops, as well as mutable data structures such
as arrays. Arrays are either given in extension between <span class="c007">[|</span> and <span class="c007">|]</span>
brackets, or allocated and initialized with the <span class="c007">Array.create</span>
function, then filled up later by assignments. For instance, the
function below sums two vectors (represented as float arrays) componentwise.
</p><pre><span class="c004">#</span><span class="c003"> let add_vect v1 v2 =
    let len = min (Array.length v1) (Array.length v2) in
    let res = Array.create len 0.0 in
    for i = 0 to len - 1 do
      res.(i) &lt;- v1.(i) +. v2.(i)
    done;
    res;;
<span class="c006">val add_vect : float array -&gt; float array -&gt; float array = &lt;fun&gt;

</span><span class="c004">#</span> add_vect [| 1.0; 2.0 |] [| 3.0; 4.0 |];;
</span><span class="c006">- : float array = [|4.; 6.|]
</span></pre><p>Record fields can also be modified by assignment, provided they are
declared <span class="c007">mutable</span> in the definition of the record type:
</p><pre><span class="c004">#</span><span class="c003"> type mutable_point = { mutable x: float; mutable y: float };;
<span class="c006">type mutable_point = { mutable x : float; mutable y : float; }

</span><span class="c004">#</span> let translate p dx dy =
    p.x &lt;- p.x +. dx; p.y &lt;- p.y +. dy;;
<span class="c006">val translate : mutable_point -&gt; float -&gt; float -&gt; unit = &lt;fun&gt;

</span><span class="c004">#</span> let mypoint = { x = 0.0; y = 0.0 };;
<span class="c006">val mypoint : mutable_point = {x = 0.; y = 0.}

</span><span class="c004">#</span> translate mypoint 1.0 2.0;;
<span class="c006">- : unit = ()

</span><span class="c004">#</span> mypoint;;
</span><span class="c006">- : mutable_point = {x = 1.; y = 2.}
</span></pre><p>OCaml has no built-in notion of variable – identifiers whose current
value can be changed by assignment. (The <span class="c007">let</span> binding is not an
assignment, it introduces a new identifier with a new scope.)
However, the standard library provides references, which are mutable
indirection cells (or one-element arrays), with operators <span class="c007">!</span> to fetch
the current contents of the reference and <span class="c007">:=</span> to assign the contents.
Variables can then be emulated by <span class="c007">let</span>-binding a reference. For
instance, here is an in-place insertion sort over arrays:
</p><pre><span class="c004">#<span class="c003"> let insertion_sort a =
    for i = 1 to Array.length a - 1 do
      let val_i = a.(i) in
      let j = ref i in
      while !j &gt; 0 &amp;&amp; val_i &lt; a.(!j - 1) do
        a.(!j) &lt;- a.(!j - 1);
        j := !j - 1
      done;
      a.(!j) &lt;- val_i
    done;;
<span class="c006">val insertion_sort : 'a array -&gt; unit = &lt;fun&gt;
</span></span></span></pre><p>References are also useful to write functions that maintain a current
state between two calls to the function. For instance, the following
pseudo-random number generator keeps the last returned number in a
reference:
</p><pre><span class="c004">#</span><span class="c003"> let current_rand = ref 0;;
<span class="c006">val current_rand : int ref = {contents = 0}

</span><span class="c004">#</span> let random () =
    current_rand := !current_rand * 25713 + 1345;
    !current_rand;;
</span><span class="c006">val random : unit -&gt; int = &lt;fun&gt;
</span></pre><p>Again, there is nothing magical with references: they are implemented as
a single-field mutable record, as follows.
</p><pre><span class="c004">#</span><span class="c003"> type 'a ref = { mutable contents: 'a };;
<span class="c006">type 'a ref = { mutable contents : 'a; }

</span><span class="c004">#</span> let ( ! ) r = r.contents;;
<span class="c006">val ( ! ) : 'a ref -&gt; 'a = &lt;fun&gt;

</span><span class="c004">#</span> let ( := ) r newval = r.contents &lt;- newval;;
</span><span class="c006">val ( := ) : 'a ref -&gt; 'a -&gt; unit = &lt;fun&gt;
</span></pre><p>In some special cases, you may need to store a polymorphic function in
a data structure, keeping its polymorphism. Without user-provided
type annotations, this is not allowed, as polymorphism is only
introduced on a global level. However, you can give explicitly
polymorphic types to record fields.
</p><pre><span class="c004">#</span><span class="c003"> type idref = { mutable id: 'a. 'a -&gt; 'a };;
<span class="c006">type idref = { mutable id : 'a. 'a -&gt; 'a; }

</span><span class="c004">#</span> let r = {id = fun x -&gt; x};;
<span class="c006">val r : idref = {id = &lt;fun&gt;}

</span><span class="c004">#</span> let g s = (s.id 1, s.id true);;
<span class="c006">val g : idref -&gt; int * bool = &lt;fun&gt;

</span><span class="c004">#</span> r.id &lt;- (fun x -&gt; print_string "called id\n"; x);;
<span class="c006">- : unit = ()

</span><span class="c004">#</span> g r;;
</span><span class="c006">called id
called id
- : int * bool = (1, true)
</span></pre>
<h2 class="section" id="sec13">6&nbsp;&nbsp;Exceptions</h2>
<p>OCaml provides exceptions for signalling and handling exceptional
conditions. Exceptions can also be used as a general-purpose non-local
control structure. Exceptions are declared with the <span class="c007">exception</span>
construct, and signalled with the <span class="c007">raise</span> operator. For instance, the
function below for taking the head of a list uses an exception to
signal the case where an empty list is given.
</p><pre><span class="c004">#</span><span class="c003"> exception Empty_list;;
<span class="c006">exception Empty_list

</span><span class="c004">#</span> let head l =
    match l with
      [] -&gt; raise Empty_list
    | hd :: tl -&gt; hd;;
<span class="c006">val head : 'a list -&gt; 'a = &lt;fun&gt;

</span><span class="c004">#</span> head [1;2];;
<span class="c006">- : int = 1

</span><span class="c004">#</span> head [];;
</span><span class="c006">Exception: Empty_list.
</span></pre><p>Exceptions are used throughout the standard library to signal cases
where the library functions cannot complete normally. For instance,
the <span class="c007">List.assoc</span> function, which returns the data associated with a
given key in a list of (key, data) pairs, raises the predefined
exception <span class="c007">Not_found</span> when the key does not appear in the list:
</p><pre><span class="c004">#</span><span class="c003"> List.assoc 1 [(0, "zero"); (1, "one")];;
<span class="c006">- : string = "one"

</span><span class="c004">#</span> List.assoc 2 [(0, "zero"); (1, "one")];;
</span><span class="c006">Exception: Not_found.
</span></pre><p>Exceptions can be trapped with the <span class="c007">try</span>…<span class="c007">with</span> construct:
</p><pre><span class="c004">#</span><span class="c003"> let name_of_binary_digit digit =
    try
      List.assoc digit [0, "zero"; 1, "one"]
    with Not_found -&gt;
      "not a binary digit";;
<span class="c006">val name_of_binary_digit : int -&gt; string = &lt;fun&gt;

</span><span class="c004">#</span> name_of_binary_digit 0;;
<span class="c006">- : string = "zero"

</span><span class="c004">#</span> name_of_binary_digit (-1);;
</span><span class="c006">- : string = "not a binary digit"
</span></pre><p>The <span class="c007">with</span> part is actually a regular pattern-matching on the
exception value. Thus, several exceptions can be caught by one
<span class="c007">try</span>…<span class="c007">with</span> construct. Also, finalization can be performed by
trapping all exceptions, performing the finalization, then raising
again the exception:
</p><pre><span class="c004">#<span class="c003"> let temporarily_set_reference ref newval funct =
    let oldval = !ref in
    try
      ref := newval;
      let res = funct () in
      ref := oldval;
      res
    with x -&gt;
      ref := oldval;
      raise x;;
<span class="c006">val temporarily_set_reference : 'a ref -&gt; 'a -&gt; (unit -&gt; 'b) -&gt; 'b = &lt;fun&gt;
</span></span></span></pre>
<h2 class="section" id="sec14">7&nbsp;&nbsp;Symbolic processing of expressions</h2>
<p>We finish this introduction with a more complete example
representative of the use of OCaml for symbolic processing: formal
manipulations of arithmetic expressions containing variables. The
following variant type describes the expressions we shall manipulate:
</p><pre><span class="c004">#<span class="c003"> type expression =
      Const of float
    | Var of string
    | Sum of expression * expression    (* e1 + e2 *)
    | Diff of expression * expression   (* e1 - e2 *)
    | Prod of expression * expression   (* e1 * e2 *)
    | Quot of expression * expression   (* e1 / e2 *)
  ;;
<span class="c006">type expression =
    Const of float
  | Var of string
  | Sum of expression * expression
  | Diff of expression * expression
  | Prod of expression * expression
  | Quot of expression * expression
</span></span></span></pre><p>We first define a function to evaluate an expression given an
environment that maps variable names to their values. For simplicity,
the environment is represented as an association list.
</p><pre><span class="c004">#</span><span class="c003"> exception Unbound_variable of string;;
<span class="c006">exception Unbound_variable of string

</span><span class="c004">#</span> let rec eval env exp =
    match exp with
      Const c -&gt; c
    | Var v -&gt;
        (try List.assoc v env with Not_found -&gt; raise (Unbound_variable v))
    | Sum(f, g) -&gt; eval env f +. eval env g
    | Diff(f, g) -&gt; eval env f -. eval env g
    | Prod(f, g) -&gt; eval env f *. eval env g
    | Quot(f, g) -&gt; eval env f /. eval env g;;
<span class="c006">val eval : (string * float) list -&gt; expression -&gt; float = &lt;fun&gt;

</span><span class="c004">#</span> eval [("x", 1.0); ("y", 3.14)] (Prod(Sum(Var "x", Const 2.0), Var "y"));;
</span><span class="c006">- : float = 9.42
</span></pre><p>Now for a real symbolic processing, we define the derivative of an
expression with respect to a variable <span class="c007">dv</span>:
</p><pre><span class="c004">#</span><span class="c003"> let rec deriv exp dv =
    match exp with
      Const c -&gt; Const 0.0
    | Var v -&gt; if v = dv then Const 1.0 else Const 0.0
    | Sum(f, g) -&gt; Sum(deriv f dv, deriv g dv)
    | Diff(f, g) -&gt; Diff(deriv f dv, deriv g dv)
    | Prod(f, g) -&gt; Sum(Prod(f, deriv g dv), Prod(deriv f dv, g))
    | Quot(f, g) -&gt; Quot(Diff(Prod(deriv f dv, g), Prod(f, deriv g dv)),
                         Prod(g, g))
  ;;
<span class="c006">val deriv : expression -&gt; string -&gt; expression = &lt;fun&gt;

</span><span class="c004">#</span> deriv (Quot(Const 1.0, Var "x")) "x";;
</span><span class="c006">- : expression =
Quot (Diff (Prod (Const 0., Var "x"), Prod (Const 1., Const 1.)),
 Prod (Var "x", Var "x"))
</span></pre>
<h2 class="section" id="sec15">8&nbsp;&nbsp;Pretty-printing and parsing</h2>
<p>As shown in the examples above, the internal representation (also
called <em>abstract syntax</em>) of expressions quickly becomes hard to
read and write as the expressions get larger. We need a printer and a
parser to go back and forth between the abstract syntax and the <em>concrete syntax</em>, which in the case of expressions is the familiar
algebraic notation (e.g. <span class="c007">2*x+1</span>).</p><p>For the printing function, we take into account the usual precedence
rules (i.e. <span class="c007">*</span> binds tighter than <span class="c007">+</span>) to avoid printing unnecessary
parentheses. To this end, we maintain the current operator precedence
and print parentheses around an operator only if its precedence is
less than the current precedence.
</p><pre><span class="c004">#</span><span class="c003"> let print_expr exp =
    (* Local function definitions *)
    let open_paren prec op_prec =
      if prec &gt; op_prec then print_string "(" in
    let close_paren prec op_prec =
      if prec &gt; op_prec then print_string ")" in
    let rec print prec exp =     (* prec is the current precedence *)
      match exp with
        Const c -&gt; print_float c
      | Var v -&gt; print_string v
      | Sum(f, g) -&gt;
          open_paren prec 0;
          print 0 f; print_string " + "; print 0 g;
          close_paren prec 0
      | Diff(f, g) -&gt;
          open_paren prec 0;
          print 0 f; print_string " - "; print 1 g;
          close_paren prec 0
      | Prod(f, g) -&gt;
          open_paren prec 2;
          print 2 f; print_string " * "; print 2 g;
          close_paren prec 2
      | Quot(f, g) -&gt;
          open_paren prec 2;
          print 2 f; print_string " / "; print 3 g;
          close_paren prec 2
    in print 0 exp;;
<span class="c006">val print_expr : expression -&gt; unit = &lt;fun&gt;

</span><span class="c004">#</span> let e = Sum(Prod(Const 2.0, Var "x"), Const 1.0);;
<span class="c006">val e : expression = Sum (Prod (Const 2., Var "x"), Const 1.)

</span><span class="c004">#</span> print_expr e; print_newline ();;
<span class="c006">2. * x + 1.
- : unit = ()

</span><span class="c004">#</span> print_expr (deriv e "x"); print_newline ();;
</span><span class="c006">2. * 1. + 0. * x + 0.
- : unit = ()
</span></pre><p>Parsing (transforming concrete syntax into abstract syntax) is usually
more delicate. OCaml offers several tools to help write parsers:
on the one hand, OCaml versions of the lexer generator Lex and the
parser generator Yacc (see chapter&nbsp;<a href="lexyacc.html#c%3Aocamlyacc">12</a>), which handle
LALR(1) languages using push-down automata; on the other hand, a
predefined type of streams (of characters or tokens) and
pattern-matching over streams, which facilitate the writing of
recursive-descent parsers for LL(1) languages. An example using
<span class="c007">ocamllex</span> and <span class="c007">ocamlyacc</span> is given in
chapter&nbsp;<a href="lexyacc.html#c%3Aocamlyacc">12</a>. Here, we will use stream parsers.
The syntactic support for stream parsers is provided by the Camlp4
preprocessor, which can be loaded into the interactive toplevel via
the <span class="c007">#load</span> directives below.</p><pre><span class="c004">#</span><span class="c003"> #load "dynlink.cma";;

  #load "camlp4o.cma";;
<span class="c006">	Camlp4 Parsing version 4.01.0+dev26-2013-09-06


</span><span class="c004">#</span> open Genlex;;

  let lexer = make_lexer ["("; ")"; "+"; "-"; "*"; "/"];;
</span><span class="c006">val lexer : char Stream.t -&gt; Genlex.token Stream.t = &lt;fun&gt;
</span></pre><p>
For the lexical analysis phase (transformation of the input text into
a stream of tokens), we use a “generic” lexer provided in the
standard library module <span class="c007">Genlex</span>. The <span class="c007">make_lexer</span> function takes a
list of keywords and returns a lexing function that “tokenizes” an
input stream of characters. Tokens are either identifiers, keywords,
or literals (integer, floats, characters, strings). Whitespace and
comments are skipped.
</p><pre><span class="c004">#</span><span class="c003"> let token_stream = lexer (Stream.of_string "1.0 +x");;
<span class="c006">val token_stream : Genlex.token Stream.t = &lt;abstr&gt;

</span><span class="c004">#</span> Stream.next token_stream;;
<span class="c006">- : Genlex.token = Float 1.

</span><span class="c004">#</span> Stream.next token_stream;;
<span class="c006">- : Genlex.token = Kwd "+"

</span><span class="c004">#</span> Stream.next token_stream;;
</span><span class="c006">- : Genlex.token = Ident "x"
</span></pre><p>The parser itself operates by pattern-matching on the stream of
tokens. As usual with recursive descent parsers, we use several
intermediate parsing functions to reflect the precedence and
associativity of operators. Pattern-matching over streams is more
powerful than on regular data structures, as it allows recursive calls
to parsing functions inside the patterns, for matching sub-components of
the input stream. See the Camlp4 documentation for more details.</p><pre><span class="c004">#</span><span class="c003"> let rec parse_expr = parser
      [&lt; e1 = parse_mult; e = parse_more_adds e1 &gt;] -&gt; e
  and parse_more_adds e1 = parser
      [&lt; 'Kwd "+"; e2 = parse_mult; e = parse_more_adds (Sum(e1, e2)) &gt;] -&gt; e
    | [&lt; 'Kwd "-"; e2 = parse_mult; e = parse_more_adds (Diff(e1, e2)) &gt;] -&gt; e
    | [&lt; &gt;] -&gt; e1
  and parse_mult = parser
      [&lt; e1 = parse_simple; e = parse_more_mults e1 &gt;] -&gt; e
  and parse_more_mults e1 = parser
      [&lt; 'Kwd "*"; e2 = parse_simple; e = parse_more_mults (Prod(e1, e2)) &gt;] -&gt; e
    | [&lt; 'Kwd "/"; e2 = parse_simple; e = parse_more_mults (Quot(e1, e2)) &gt;] -&gt; e
    | [&lt; &gt;] -&gt; e1
  and parse_simple = parser
      [&lt; 'Ident s &gt;] -&gt; Var s
    | [&lt; 'Int i &gt;] -&gt; Const(float i)
    | [&lt; 'Float f &gt;] -&gt; Const f
    | [&lt; 'Kwd "("; e = parse_expr; 'Kwd ")" &gt;] -&gt; e;;
<span class="c006">val parse_expr : Genlex.token Stream.t -&gt; expression = &lt;fun&gt;
val parse_more_adds : expression -&gt; Genlex.token Stream.t -&gt; expression =
  &lt;fun&gt;
val parse_mult : Genlex.token Stream.t -&gt; expression = &lt;fun&gt;
val parse_more_mults : expression -&gt; Genlex.token Stream.t -&gt; expression =
  &lt;fun&gt;
val parse_simple : Genlex.token Stream.t -&gt; expression = &lt;fun&gt;

</span><span class="c004">#</span> let parse_expression = parser [&lt; e = parse_expr; _ = Stream.empty &gt;] -&gt; e;;
</span><span class="c006">val parse_expression : Genlex.token Stream.t -&gt; expression = &lt;fun&gt;
</span></pre><p>Composing the lexer and parser, we finally obtain a function to read
an expression from a character string:
</p><pre><span class="c004">#</span><span class="c003"> let read_expression s = parse_expression (lexer (Stream.of_string s));;
<span class="c006">val read_expression : string -&gt; expression = &lt;fun&gt;

</span><span class="c004">#</span> read_expression "2*(x+y)";;
</span><span class="c006">- : expression = Prod (Const 2., Sum (Var "x", Var "y"))
</span></pre><p>
A small puzzle: why do we get different results in the following two
examples?
</p><pre><span class="c004">#</span><span class="c003"> read_expression "x - 1";;
<span class="c006">- : expression = Diff (Var "x", Const 1.)

</span><span class="c004">#</span> read_expression "x-1";;
</span><span class="c006">Exception: Stream.Error "".
</span></pre><p>
Answer: the generic lexer provided by <span class="c007">Genlex</span> recognizes negative
integer literals as one integer token. Hence, <span class="c007">x-1</span> is read as
the token <span class="c007">Ident "x"</span> followed by the token <span class="c007">Int(-1)</span>; this sequence
does not match any of the parser rules. On the other hand,
the second space in <span class="c007">x - 1</span> causes the lexer to return the three
expected tokens: <span class="c007">Ident "x"</span>, then <span class="c007">Kwd "-"</span>, then <span class="c007">Int(1)</span>.</p>
<h2 class="section" id="sec16">9&nbsp;&nbsp;Standalone OCaml programs</h2>
<p>All examples given so far were executed under the interactive system.
OCaml code can also be compiled separately and executed
non-interactively using the batch compilers <span class="c007">ocamlc</span> and <span class="c007">ocamlopt</span>.
The source code must be put in a file with extension <span class="c007">.ml</span>. It
consists of a sequence of phrases, which will be evaluated at runtime
in their order of appearance in the source file. Unlike in interactive
mode, types and values are not printed automatically; the program must
call printing functions explicitly to produce some output. Here is a
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
</pre><p><span class="c007">Sys.argv</span> is an array of strings containing the command-line
parameters. <span class="c007">Sys.argv.(1)</span> is thus the first command-line parameter.
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
Chapters&nbsp;<a href="comp.html#c%3Acamlc">8</a> and&nbsp;<a href="native.html#c%3Anativecomp">11</a> explain how to use the
batch compilers <span class="c007">ocamlc</span> and <span class="c007">ocamlopt</span>. Recompilation of
multi-file OCaml projects can be automated using the <span class="c007">ocamlbuild</span>
compilation manager, documented in chapter&nbsp;<a href="ocamlbuild.html#c%3Aocamlbuild">18</a>.

</p>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>