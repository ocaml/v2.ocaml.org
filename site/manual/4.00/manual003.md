<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li class="active"><a href="manual003.html">The core language</a></li><li><a href="manual004.html">The module system</a></li><li><a href="manual005.html">Objects in OCaml</a></li><li><a href="manual006.html">Labels and variants</a></li><li><a href="manual007.html">Advanced examples with classes and modules</a></li></ul>




<h1 class="chapter"><a name="htoc2"><span>Chapter 1</span></a>&nbsp;&nbsp;The core language</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The core language</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#toc4">Basics</a>
</li><li><a href="#toc5">Data types</a>
</li><li><a href="#toc6">Functions as values</a>
</li><li><a href="#toc7">Records and variants</a>
</li><li><a href="#toc8">Imperative features</a>
</li><li><a href="#toc9">Exceptions</a>
</li><li><a href="#toc10">Symbolic processing of expressions</a>
</li><li><a href="#toc11">Pretty-printing and parsing</a>
</li><li><a href="#toc12">Standalone OCaml programs</a>
</li></ul></nav></header>
<p> <a name="c:core-xamples"></a>
</p><p>This part of the manual is a tutorial introduction to the
OCaml language. A good familiarity with programming in a conventional
languages (say, Pascal or C) is assumed, but no prior exposure to
functional languages is required. The present chapter introduces the
core language. Chapter&nbsp;<a href="manual004.html#c:moduleexamples">2</a> deals with the
module system, chapter&nbsp;<a href="manual005.html#c:objectexamples">3</a> with the
object-oriented features, chapter&nbsp;<a href="manual006.html#c:labl-examples">4</a> with
extensions to the core language (labeled arguments and polymorphic
variants), and chapter&nbsp;<a href="manual007.html#c:advexamples">5</a> gives some advanced examples.</p><h2 class="section"><a name="toc4"></a><a name="htoc3">1</a>&nbsp;&nbsp;Basics</h2><p>For this overview of OCaml, we use the interactive system, which
is started by running <tt>ocaml</tt> from the Unix shell, or by launching the
<tt>OCamlwin.exe</tt> application under Windows. This tutorial is presented
as the transcript of a session with the interactive system:
lines starting with <tt>#</tt> represent user input; the system responses are
printed below, without a leading <tt>#</tt>.</p><p>Under the interactive system, the user types OCaml phrases terminated
by <tt>;;</tt> in response to the <tt>#</tt> prompt, and the system compiles them
on the fly, executes them, and prints the outcome of evaluation.
Phrases are either simple expressions, or <tt>let</tt> definitions of
identifiers (either values or functions).
</p><pre><font color="black">#</font><font color="#006000"> 1+2*3;;
<font color="maroon">- : int = 7

</font><font color="black">#</font> let pi = 4.0 *. atan 1.0;;
<font color="maroon">val pi : float = 3.14159265358979312

</font><font color="black">#</font> let square x = x *. x;;
<font color="maroon">val square : float -&gt; float = &lt;fun&gt;

</font><font color="black">#</font> square(sin pi) +. square(cos pi);;
</font><font color="maroon">- : float = 1.
</font></pre><p>
The OCaml system computes both the value and the type for
each phrase. Even function parameters need no explicit type declaration:
the system infers their types from their usage in the
function. Notice also that integers and floating-point numbers are
distinct types, with distinct operators: <tt>+</tt> and <tt>*</tt> operate on
integers, but <tt>+.</tt> and <tt>*.</tt> operate on floats.
</p><pre><font color="black">#</font> <font color="#006000"><u>1.0</u> * 2;;
</font><font color="maroon">Error: This expression has type float but an expression was expected of type
         int
</font></pre><p>Recursive functions are defined with the <tt>let rec</tt> binding:
</p><pre><font color="black">#</font><font color="#006000"> let rec fib n =
    if n &lt; 2 then n else fib(n-1) + fib(n-2);;
<font color="maroon">val fib : int -&gt; int = &lt;fun&gt;

</font><font color="black">#</font> fib 10;;
</font><font color="maroon">- : int = 55
</font></pre><h2 class="section"><a name="toc5"></a><a name="htoc4">2</a>&nbsp;&nbsp;Data types</h2><p>In addition to integers and floating-point numbers, OCaml offers the
usual basic data types: booleans, characters, and character strings.
</p><pre><font color="black">#</font><font color="#006000"> (1 &lt; 2) = false;;
<font color="maroon">- : bool = false

</font><font color="black">#</font> 'a';;
<font color="maroon">- : char = 'a'

</font><font color="black">#</font> "Hello world";;
</font><font color="maroon">- : string = "Hello world"
</font></pre><p>Predefined data structures include tuples, arrays, and lists. General
mechanisms for defining your own data structures are also provided.
They will be covered in more details later; for now, we concentrate on lists.
Lists are either given in extension as a bracketed list of
semicolon-separated elements, or built from the empty list <tt>[]</tt>
(pronounce “nil”) by adding elements in front using the <tt>::</tt>
(“cons”) operator.
</p><pre><font color="black">#</font><font color="#006000"> let l = ["is"; "a"; "tale"; "told"; "etc."];;
<font color="maroon">val l : string list = ["is"; "a"; "tale"; "told"; "etc."]

</font><font color="black">#</font> "Life" :: l;;
</font><font color="maroon">- : string list = ["Life"; "is"; "a"; "tale"; "told"; "etc."]
</font></pre><p>
As with all other OCaml data structures, lists do not need to be
explicitly allocated and deallocated from memory: all memory
management is entirely automatic in OCaml. Similarly, there is no
explicit handling of pointers: the OCaml compiler silently introduces
pointers where necessary.</p><p>As with most OCaml data structures, inspecting and destructuring lists
is performed by pattern-matching. List patterns have the exact same
shape as list expressions, with identifier representing unspecified
parts of the list. As an example, here is insertion sort on a list:
</p><pre><font color="black">#</font><font color="#006000"> let rec sort lst =
    match lst with
      [] -&gt; []
    | head :: tail -&gt; insert head (sort tail)
  and insert elt lst =
    match lst with
      [] -&gt; [elt]
    | head :: tail -&gt; if elt &lt;= head then elt :: lst else head :: insert elt tail
  ;;
<font color="maroon">val sort : 'a list -&gt; 'a list = &lt;fun&gt;
val insert : 'a -&gt; 'a list -&gt; 'a list = &lt;fun&gt;

</font><font color="black">#</font> sort l;;
</font><font color="maroon">- : string list = ["a"; "etc."; "is"; "tale"; "told"]
</font></pre><p>The type inferred for <tt>sort</tt>, <tt>'a list -&gt; 'a list</tt>, means that <tt>sort</tt>
can actually apply to lists of any type, and returns a list of the
same type. The type <tt>'a</tt> is a <em>type variable</em>, and stands for any
given type. The reason why <tt>sort</tt> can apply to lists of any type is
that the comparisons (<tt>=</tt>, <tt>&lt;=</tt>, etc.) are <em>polymorphic</em> in OCaml:
they operate between any two values of the same type. This makes
<tt>sort</tt> itself polymorphic over all list types.
</p><pre><font color="black">#</font><font color="#006000"> sort [6;2;5;3];;
<font color="maroon">- : int list = [2; 3; 5; 6]

</font><font color="black">#</font> sort [3.14; 2.718];;
</font><font color="maroon">- : float list = [2.718; 3.14]
</font></pre><p>The <tt>sort</tt> function above does not modify its input list: it builds
and returns a new list containing the same elements as the input list,
in ascending order. There is actually no way in OCaml to modify
in-place a list once it is built: we say that lists are <em>immutable</em>
data structures. Most OCaml data structures are immutable, but a few
(most notably arrays) are <em>mutable</em>, meaning that they can be
modified in-place at any time.</p><h2 class="section"><a name="toc6"></a><a name="htoc5">3</a>&nbsp;&nbsp;Functions as values</h2><p>OCaml is a functional language: functions in the full mathematical
sense are supported and can be passed around freely just as any other
piece of data. For instance, here is a <tt>deriv</tt> function that takes any
float function as argument and returns an approximation of its
derivative function:
</p><pre><font color="black">#</font><font color="#006000"> let deriv f dx = function x -&gt; (f(x +. dx) -. f(x)) /. dx;;
<font color="maroon">val deriv : (float -&gt; float) -&gt; float -&gt; float -&gt; float = &lt;fun&gt;

</font><font color="black">#</font> let sin' = deriv sin 1e-6;;
<font color="maroon">val sin' : float -&gt; float = &lt;fun&gt;

</font><font color="black">#</font> sin' pi;;
</font><font color="maroon">- : float = -1.00000000013961143
</font></pre><p>
Even function composition is definable:
</p><pre><font color="black">#</font><font color="#006000"> let compose f g = function x -&gt; f(g(x));;
<font color="maroon">val compose : ('a -&gt; 'b) -&gt; ('c -&gt; 'a) -&gt; 'c -&gt; 'b = &lt;fun&gt;

</font><font color="black">#</font> let cos2 = compose square cos;;
</font><font color="maroon">val cos2 : float -&gt; float = &lt;fun&gt;
</font></pre><p>Functions that take other functions as arguments are called
“functionals”, or “higher-order functions”. Functionals are
especially useful to provide iterators or similar generic operations
over a data structure. For instance, the standard OCaml library
provides a <tt>List.map</tt> functional that applies a given function to each
element of a list, and returns the list of the results:
</p><pre><font color="black">#</font><font color="#006000"> List.map (function n -&gt; n * 2 + 1) [0;1;2;3;4];;
</font><font color="maroon">- : int list = [1; 3; 5; 7; 9]
</font></pre><p>
This functional, along with a number of other list and array
functionals, is predefined because it is often useful, but there is
nothing magic with it: it can easily be defined as follows.
</p><pre><font color="black">#</font><font color="#006000"> let rec map f l =
    match l with
      [] -&gt; []
    | hd :: tl -&gt; f hd :: map f tl;;
</font><font color="maroon">val map : ('a -&gt; 'b) -&gt; 'a list -&gt; 'b list = &lt;fun&gt;
</font></pre><h2 class="section"><a name="toc7"></a><a name="htoc6">4</a>&nbsp;&nbsp;Records and variants</h2><p>

<a name="s:tut-recvariants"></a></p><p>User-defined data structures include records and variants. Both are
defined with the <tt>type</tt> declaration. Here, we declare a record type to
represent rational numbers.
</p><pre><font color="black">#</font><font color="#006000"> type ratio = {num: int; denom: int};;
<font color="maroon">type ratio = { num : int; denom : int; }

</font><font color="black">#</font> let add_ratio r1 r2 =
    {num = r1.num * r2.denom + r2.num * r1.denom;
     denom = r1.denom * r2.denom};;
<font color="maroon">val add_ratio : ratio -&gt; ratio -&gt; ratio = &lt;fun&gt;

</font><font color="black">#</font> add_ratio {num=1; denom=3} {num=2; denom=5};;
</font><font color="maroon">- : ratio = {num = 11; denom = 15}
</font></pre><p>The declaration of a variant type lists all possible shapes for values
of that type. Each case is identified by a name, called a constructor,
which serves both for constructing values of the variant type and
inspecting them by pattern-matching. Constructor names are capitalized
to distinguish them from variable names (which must start with a
lowercase letter). For instance, here is a variant
type for doing mixed arithmetic (integers and floats):
</p><pre><font color="black">#</font><font color="#006000"> type number = Int of int | Float of float | Error;;
</font><font color="maroon">type number = Int of int | Float of float | Error
</font></pre><p>
This declaration expresses that a value of type <tt>number</tt> is either an
integer, a floating-point number, or the constant <tt>Error</tt> representing
the result of an invalid operation (e.g. a division by zero).</p><p>Enumerated types are a special case of variant types, where all
alternatives are constants:
</p><pre><font color="black">#</font><font color="#006000"> type sign = Positive | Negative;;
<font color="maroon">type sign = Positive | Negative

</font><font color="black">#</font> let sign_int n = if n &gt;= 0 then Positive else Negative;;
</font><font color="maroon">val sign_int : int -&gt; sign = &lt;fun&gt;
</font></pre><p>To define arithmetic operations for the <tt>number</tt> type, we use
pattern-matching on the two numbers involved:
</p><pre><font color="black">#</font><font color="#006000"> let add_num n1 n2 =
    match (n1, n2) with
      (Int i1, Int i2) -&gt;
        (* Check for overflow of integer addition *)
        if sign_int i1 = sign_int i2 &amp;&amp; sign_int(i1 + i2) &lt;&gt; sign_int i1
        then Float(float i1 +. float i2)
        else Int(i1 + i2)
    | (Int i1, Float f2) -&gt; Float(float i1 +. f2)
    | (Float f1, Int i2) -&gt; Float(f1 +. float i2)
    | (Float f1, Float f2) -&gt; Float(f1 +. f2)
    | (Error, _) -&gt; Error
    | (_, Error) -&gt; Error;;
<font color="maroon">val add_num : number -&gt; number -&gt; number = &lt;fun&gt;

</font><font color="black">#</font> add_num (Int 123) (Float 3.14159);;
</font><font color="maroon">- : number = Float 126.14159
</font></pre><p>The most common usage of variant types is to describe recursive data
structures. Consider for example the type of binary trees:
</p><pre><font color="black">#</font><font color="#006000"> type 'a btree = Empty | Node of 'a * 'a btree * 'a btree;;
</font><font color="maroon">type 'a btree = Empty | Node of 'a * 'a btree * 'a btree
</font></pre><p>
This definition reads as follow: a binary tree containing values of
type <tt>'a</tt> (an arbitrary type) is either empty, or is a node containing
one value of type <tt>'a</tt> and two subtrees containing also values of type
<tt>'a</tt>, that is, two <tt>'a btree</tt>.</p><p>Operations on binary trees are naturally expressed as recursive functions
following the same structure as the type definition itself. For
instance, here are functions performing lookup and insertion in
ordered binary trees (elements increase from left to right):
</p><pre><font color="black">#</font><font color="#006000"> let rec member x btree =
    match btree with
      Empty -&gt; false
    | Node(y, left, right) -&gt;
        if x = y then true else
        if x &lt; y then member x left else member x right;;
<font color="maroon">val member : 'a -&gt; 'a btree -&gt; bool = &lt;fun&gt;

</font><font color="black">#</font> let rec insert x btree =
    match btree with
      Empty -&gt; Node(x, Empty, Empty)
    | Node(y, left, right) -&gt;
        if x &lt;= y then Node(y, insert x left, right)
                  else Node(y, left, insert x right);;
</font><font color="maroon">val insert : 'a -&gt; 'a btree -&gt; 'a btree = &lt;fun&gt;
</font></pre><h2 class="section"><a name="toc8"></a><a name="htoc7">5</a>&nbsp;&nbsp;Imperative features</h2><p>Though all examples so far were written in purely applicative style,
OCaml is also equipped with full imperative features. This includes the
usual <tt>while</tt> and <tt>for</tt> loops, as well as mutable data structures such
as arrays. Arrays are either given in extension between <tt>[|</tt> and <tt>|]</tt>
brackets, or allocated and initialized with the <tt>Array.create</tt>
function, then filled up later by assignments. For instance, the
function below sums two vectors (represented as float arrays) componentwise.
</p><pre><font color="black">#</font><font color="#006000"> let add_vect v1 v2 =
    let len = min (Array.length v1) (Array.length v2) in
    let res = Array.create len 0.0 in
    for i = 0 to len - 1 do
      res.(i) &lt;- v1.(i) +. v2.(i)
    done;
    res;;
<font color="maroon">val add_vect : float array -&gt; float array -&gt; float array = &lt;fun&gt;

</font><font color="black">#</font> add_vect [| 1.0; 2.0 |] [| 3.0; 4.0 |];;
</font><font color="maroon">- : float array = [|4.; 6.|]
</font></pre><p>Record fields can also be modified by assignment, provided they are
declared <tt>mutable</tt> in the definition of the record type:
</p><pre><font color="black">#</font><font color="#006000"> type mutable_point = { mutable x: float; mutable y: float };;
<font color="maroon">type mutable_point = { mutable x : float; mutable y : float; }

</font><font color="black">#</font> let translate p dx dy =
    p.x &lt;- p.x +. dx; p.y &lt;- p.y +. dy;;
<font color="maroon">val translate : mutable_point -&gt; float -&gt; float -&gt; unit = &lt;fun&gt;

</font><font color="black">#</font> let mypoint = { x = 0.0; y = 0.0 };;
<font color="maroon">val mypoint : mutable_point = {x = 0.; y = 0.}

</font><font color="black">#</font> translate mypoint 1.0 2.0;;
<font color="maroon">- : unit = ()

</font><font color="black">#</font> mypoint;;
</font><font color="maroon">- : mutable_point = {x = 1.; y = 2.}
</font></pre><p>OCaml has no built-in notion of variable – identifiers whose current
value can be changed by assignment. (The <tt>let</tt> binding is not an
assignment, it introduces a new identifier with a new scope.)
However, the standard library provides references, which are mutable
indirection cells (or one-element arrays), with operators <tt>!</tt> to fetch
the current contents of the reference and <tt>:=</tt> to assign the contents.
Variables can then be emulated by <tt>let</tt>-binding a reference. For
instance, here is an in-place insertion sort over arrays:
</p><pre><font color="black">#</font><font color="#006000"> let insertion_sort a =
    for i = 1 to Array.length a - 1 do
      let val_i = a.(i) in
      let j = ref i in
      while !j &gt; 0 &amp;&amp; val_i &lt; a.(!j - 1) do
        a.(!j) &lt;- a.(!j - 1);
        j := !j - 1
      done;
      a.(!j) &lt;- val_i
    done;;
</font><font color="maroon">val insertion_sort : 'a array -&gt; unit = &lt;fun&gt;
</font></pre><p>References are also useful to write functions that maintain a current
state between two calls to the function. For instance, the following
pseudo-random number generator keeps the last returned number in a
reference:
</p><pre><font color="black">#</font><font color="#006000"> let current_rand = ref 0;;
<font color="maroon">val current_rand : int ref = {contents = 0}

</font><font color="black">#</font> let random () =
    current_rand := !current_rand * 25713 + 1345;
    !current_rand;;
</font><font color="maroon">val random : unit -&gt; int = &lt;fun&gt;
</font></pre><p>Again, there is nothing magical with references: they are implemented as
a single-field mutable record, as follows.
</p><pre><font color="black">#</font><font color="#006000"> type 'a ref = { mutable contents: 'a };;
<font color="maroon">type 'a ref = { mutable contents : 'a; }

</font><font color="black">#</font> let (!) r = r.contents;;
<font color="maroon">val ( ! ) : 'a ref -&gt; 'a = &lt;fun&gt;

</font><font color="black">#</font> let (:=) r newval = r.contents &lt;- newval;;
</font><font color="maroon">val ( := ) : 'a ref -&gt; 'a -&gt; unit = &lt;fun&gt;
</font></pre><p>In some special cases, you may need to store a polymorphic function in
a data structure, keeping its polymorphism. Without user-provided
type annotations, this is not allowed, as polymorphism is only
introduced on a global level. However, you can give explicitly
polymorphic types to record fields.
</p><pre><font color="black">#</font><font color="#006000"> type idref = { mutable id: 'a. 'a -&gt; 'a };;
<font color="maroon">type idref = { mutable id : 'a. 'a -&gt; 'a; }

</font><font color="black">#</font> let r = {id = fun x -&gt; x};;
<font color="maroon">val r : idref = {id = &lt;fun&gt;}

</font><font color="black">#</font> let g s = (s.id 1, s.id true);;
<font color="maroon">val g : idref -&gt; int * bool = &lt;fun&gt;

</font><font color="black">#</font> r.id &lt;- (fun x -&gt; print_string "called id\n"; x);;
<font color="maroon">- : unit = ()

</font><font color="black">#</font> g r;;
</font><font color="maroon">called id
called id
- : int * bool = (1, true)
</font></pre><h2 class="section"><a name="toc9"></a><a name="htoc8">6</a>&nbsp;&nbsp;Exceptions</h2><p>OCaml provides exceptions for signalling and handling exceptional
conditions. Exceptions can also be used as a general-purpose non-local
control structure. Exceptions are declared with the <tt>exception</tt>
construct, and signalled with the <tt>raise</tt> operator. For instance, the
function below for taking the head of a list uses an exception to
signal the case where an empty list is given.
</p><pre><font color="black">#</font><font color="#006000"> exception Empty_list;;
<font color="maroon">exception Empty_list

</font><font color="black">#</font> let head l =
    match l with
      [] -&gt; raise Empty_list
    | hd :: tl -&gt; hd;;
<font color="maroon">val head : 'a list -&gt; 'a = &lt;fun&gt;

</font><font color="black">#</font> head [1;2];;
<font color="maroon">- : int = 1

</font><font color="black">#</font> head [];;
</font><font color="maroon">Exception: Empty_list.
</font></pre><p>Exceptions are used throughout the standard library to signal cases
where the library functions cannot complete normally. For instance,
the <tt>List.assoc</tt> function, which returns the data associated with a
given key in a list of (key, data) pairs, raises the predefined
exception <tt>Not_found</tt> when the key does not appear in the list:
</p><pre><font color="black">#</font><font color="#006000"> List.assoc 1 [(0, "zero"); (1, "one")];;
<font color="maroon">- : string = "one"

</font><font color="black">#</font> List.assoc 2 [(0, "zero"); (1, "one")];;
</font><font color="maroon">Exception: Not_found.
</font></pre><p>Exceptions can be trapped with the <tt>try</tt>…<tt>with</tt> construct:
</p><pre><font color="black">#</font><font color="#006000"> let name_of_binary_digit digit =
    try
      List.assoc digit [0, "zero"; 1, "one"]
    with Not_found -&gt;
      "not a binary digit";;
<font color="maroon">val name_of_binary_digit : int -&gt; string = &lt;fun&gt;

</font><font color="black">#</font> name_of_binary_digit 0;;
<font color="maroon">- : string = "zero"

</font><font color="black">#</font> name_of_binary_digit (-1);;
</font><font color="maroon">- : string = "not a binary digit"
</font></pre><p>The <tt>with</tt> part is actually a regular pattern-matching on the
exception value. Thus, several exceptions can be caught by one
<tt>try</tt>…<tt>with</tt> construct. Also, finalization can be performed by
trapping all exceptions, performing the finalization, then raising
again the exception:
</p><pre><font color="black">#</font><font color="#006000"> let temporarily_set_reference ref newval funct =
    let oldval = !ref in
    try
      ref := newval;
      let res = funct () in
      ref := oldval;
      res
    with x -&gt;
      ref := oldval;
      raise x;;
</font><font color="maroon">val temporarily_set_reference : 'a ref -&gt; 'a -&gt; (unit -&gt; 'b) -&gt; 'b = &lt;fun&gt;
</font></pre><h2 class="section"><a name="toc10"></a><a name="htoc9">7</a>&nbsp;&nbsp;Symbolic processing of expressions</h2><p>We finish this introduction with a more complete example
representative of the use of OCaml for symbolic processing: formal
manipulations of arithmetic expressions containing variables. The
following variant type describes the expressions we shall manipulate:
</p><pre><font color="black">#</font><font color="#006000"> type expression =
      Const of float
    | Var of string
    | Sum of expression * expression    (* e1 + e2 *)
    | Diff of expression * expression   (* e1 - e2 *)
    | Prod of expression * expression   (* e1 * e2 *)
    | Quot of expression * expression   (* e1 / e2 *)
  ;;
</font><font color="maroon">type expression =
    Const of float
  | Var of string
  | Sum of expression * expression
  | Diff of expression * expression
  | Prod of expression * expression
  | Quot of expression * expression
</font></pre><p>We first define a function to evaluate an expression given an
environment that maps variable names to their values. For simplicity,
the environment is represented as an association list.
</p><pre><font color="black">#</font><font color="#006000"> exception Unbound_variable of string;;
<font color="maroon">exception Unbound_variable of string

</font><font color="black">#</font> let rec eval env exp =
    match exp with
      Const c -&gt; c
    | Var v -&gt;
        (try List.assoc v env with Not_found -&gt; raise(Unbound_variable v))
    | Sum(f, g) -&gt; eval env f +. eval env g
    | Diff(f, g) -&gt; eval env f -. eval env g
    | Prod(f, g) -&gt; eval env f *. eval env g
    | Quot(f, g) -&gt; eval env f /. eval env g;;
<font color="maroon">val eval : (string * float) list -&gt; expression -&gt; float = &lt;fun&gt;

</font><font color="black">#</font> eval [("x", 1.0); ("y", 3.14)] (Prod(Sum(Var "x", Const 2.0), Var "y"));;
</font><font color="maroon">- : float = 9.42
</font></pre><p>Now for a real symbolic processing, we define the derivative of an
expression with respect to a variable <tt>dv</tt>:
</p><pre><font color="black">#</font><font color="#006000"> let rec deriv exp dv =
    match exp with
      Const c -&gt; Const 0.0
    | Var v -&gt; if v = dv then Const 1.0 else Const 0.0
    | Sum(f, g) -&gt; Sum(deriv f dv, deriv g dv)
    | Diff(f, g) -&gt; Diff(deriv f dv, deriv g dv)
    | Prod(f, g) -&gt; Sum(Prod(f, deriv g dv), Prod(deriv f dv, g))
    | Quot(f, g) -&gt; Quot(Diff(Prod(deriv f dv, g), Prod(f, deriv g dv)),
                         Prod(g, g))
  ;;
<font color="maroon">val deriv : expression -&gt; string -&gt; expression = &lt;fun&gt;

</font><font color="black">#</font> deriv (Quot(Const 1.0, Var "x")) "x";;
</font><font color="maroon">- : expression =
Quot (Diff (Prod (Const 0., Var "x"), Prod (Const 1., Const 1.)),
 Prod (Var "x", Var "x"))
</font></pre><h2 class="section"><a name="toc11"></a><a name="htoc10">8</a>&nbsp;&nbsp;Pretty-printing and parsing</h2><p>As shown in the examples above, the internal representation (also
called <em>abstract syntax</em>) of expressions quickly becomes hard to
read and write as the expressions get larger. We need a printer and a
parser to go back and forth between the abstract syntax and the <em>concrete syntax</em>, which in the case of expressions is the familiar
algebraic notation (e.g. <tt>2*x+1</tt>).</p><p>For the printing function, we take into account the usual precedence
rules (i.e. <tt>*</tt> binds tighter than <tt>+</tt>) to avoid printing unnecessary
parentheses. To this end, we maintain the current operator precedence
and print parentheses around an operator only if its precedence is
less than the current precedence.
</p><pre><font color="black">#</font><font color="#006000"> let print_expr exp =
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
<font color="maroon">val print_expr : expression -&gt; unit = &lt;fun&gt;

</font><font color="black">#</font> let e = Sum(Prod(Const 2.0, Var "x"), Const 1.0);;
<font color="maroon">val e : expression = Sum (Prod (Const 2., Var "x"), Const 1.)

</font><font color="black">#</font> print_expr e; print_newline();;
<font color="maroon">2. * x + 1.
- : unit = ()

</font><font color="black">#</font> print_expr (deriv e "x"); print_newline();;
</font><font color="maroon">2. * 1. + 0. * x + 0.
- : unit = ()
</font></pre><p>Parsing (transforming concrete syntax into abstract syntax) is usually
more delicate. OCaml offers several tools to help write parsers:
on the one hand, OCaml versions of the lexer generator Lex and the
parser generator Yacc (see chapter&nbsp;<a href="manual026.html#c:ocamlyacc">12</a>), which handle
LALR(1) languages using push-down automata; on the other hand, a
predefined type of streams (of characters or tokens) and
pattern-matching over streams, which facilitate the writing of
recursive-descent parsers for LL(1) languages. An example using
<tt>ocamllex</tt> and <tt>ocamlyacc</tt> is given in
chapter&nbsp;<a href="manual026.html#c:ocamlyacc">12</a>. Here, we will use stream parsers.
The syntactic support for stream parsers is provided by the Camlp4
preprocessor, which can be loaded into the interactive toplevel via
the <tt>#load</tt> directives below.</p><pre><font color="black">#</font><font color="#006000"> #load "dynlink.cma";;

  #load "camlp4o.cma";;
<font color="maroon">	Camlp4 Parsing version 4.00.0


</font><font color="black">#</font> open Genlex;;

  let lexer = make_lexer ["("; ")"; "+"; "-"; "*"; "/"];;
</font><font color="maroon">val lexer : char Stream.t -&gt; Genlex.token Stream.t = &lt;fun&gt;
</font></pre><p>
For the lexical analysis phase (transformation of the input text into
a stream of tokens), we use a “generic” lexer provided in the
standard library module <tt>Genlex</tt>. The <tt>make_lexer</tt> function takes a
list of keywords and returns a lexing function that “tokenizes” an
input stream of characters. Tokens are either identifiers, keywords,
or literals (integer, floats, characters, strings). Whitespace and
comments are skipped.
</p><pre><font color="black">#</font><font color="#006000"> let token_stream = lexer(Stream.of_string "1.0 +x");;
<font color="maroon">val token_stream : Genlex.token Stream.t = &lt;abstr&gt;

</font><font color="black">#</font> Stream.next token_stream;;
<font color="maroon">- : Genlex.token = Float 1.

</font><font color="black">#</font> Stream.next token_stream;;
<font color="maroon">- : Genlex.token = Kwd "+"

</font><font color="black">#</font> Stream.next token_stream;;
</font><font color="maroon">- : Genlex.token = Ident "x"
</font></pre><p>The parser itself operates by pattern-matching on the stream of
tokens. As usual with recursive descent parsers, we use several
intermediate parsing functions to reflect the precedence and
associativity of operators. Pattern-matching over streams is more
powerful than on regular data structures, as it allows recursive calls
to parsing functions inside the patterns, for matching sub-components of
the input stream. See the Camlp4 documentation for more details.</p><pre><font color="black">#</font><font color="#006000"> let rec parse_expr = parser
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
<font color="maroon">val parse_expr : Genlex.token Stream.t -&gt; expression = &lt;fun&gt;
val parse_more_adds : expression -&gt; Genlex.token Stream.t -&gt; expression =
  &lt;fun&gt;
val parse_mult : Genlex.token Stream.t -&gt; expression = &lt;fun&gt;
val parse_more_mults : expression -&gt; Genlex.token Stream.t -&gt; expression =
  &lt;fun&gt;
val parse_simple : Genlex.token Stream.t -&gt; expression = &lt;fun&gt;

</font><font color="black">#</font> let parse_expression = parser [&lt; e = parse_expr; _ = Stream.empty &gt;] -&gt; e;;
</font><font color="maroon">val parse_expression : Genlex.token Stream.t -&gt; expression = &lt;fun&gt;
</font></pre><p>Composing the lexer and parser, we finally obtain a function to read
an expression from a character string:
</p><pre><font color="black">#</font><font color="#006000"> let read_expression s = parse_expression(lexer(Stream.of_string s));;
<font color="maroon">val read_expression : string -&gt; expression = &lt;fun&gt;

</font><font color="black">#</font> read_expression "2*(x+y)";;
</font><font color="maroon">- : expression = Prod (Const 2., Sum (Var "x", Var "y"))
</font></pre><p>
A small puzzle: why do we get different results in the following two
examples?
</p><pre><font color="black">#</font><font color="#006000"> read_expression "x - 1";;
<font color="maroon">- : expression = Diff (Var "x", Const 1.)

</font><font color="black">#</font> read_expression "x-1";;
</font><font color="maroon">Exception: Stream.Error "".
</font></pre><p>
Answer: the generic lexer provided by <tt>Genlex</tt> recognizes negative
integer literals as one integer token. Hence, <tt>x-1</tt> is read as
the token <tt>Ident "x"</tt> followed by the token <tt>Int(-1)</tt>; this sequence
does not match any of the parser rules. On the other hand,
the second space in <tt>x - 1</tt> causes the lexer to return the three
expected tokens: <tt>Ident "x"</tt>, then <tt>Kwd "-"</tt>, then <tt>Int(1)</tt>.</p><h2 class="section"><a name="toc12"></a><a name="htoc11">9</a>&nbsp;&nbsp;Standalone OCaml programs</h2><p>All examples given so far were executed under the interactive system.
OCaml code can also be compiled separately and executed
non-interactively using the batch compilers <tt>ocamlc</tt> and <tt>ocamlopt</tt>.
The source code must be put in a file with extension <tt>.ml</tt>. It
consists of a sequence of phrases, which will be evaluated at runtime
in their order of appearance in the source file. Unlike in interactive
mode, types and values are not printed automatically; the program must
call printing functions explicitly to produce some output. Here is a
sample standalone program to print Fibonacci numbers:
</p><pre>(* File fib.ml *)
let rec fib n =
  if n &lt; 2 then 1 else fib(n-1) + fib(n-2);;
let main () =
  let arg = int_of_string Sys.argv.(1) in
  print_int(fib arg);
  print_newline();
  exit 0;;
main ();;
</pre><p><tt>Sys.argv</tt> is an array of strings containing the command-line
parameters. <tt>Sys.argv.(1)</tt> is thus the first command-line parameter.
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
Chapters&nbsp;<a href="manual022.html#c:camlc">8</a> and&nbsp;<a href="manual025.html#c:nativecomp">11</a> explain how to use the
batch compilers <tt>ocamlc</tt> and <tt>ocamlopt</tt>. Recompilation of
multi-file OCaml projects can be automated using the <tt>ocamlbuild</tt>
compilation manager, documented in chapter&nbsp;<a href="manual032.html#c:ocamlbuild">18</a>.

</p><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>