<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
  <title>FAQ</title>
  <link href="ocaml.css" media="all" type="text/css" rel="stylesheet" />
</head>
<body>
<h1>FAQ</h1>

<p>See also <a href="http://stackoverflow.com/tags/ocaml/info">Stack
Overflow</a>, which is widely used by the OCaml community.</p>

<ul class="nav nav-tabs">
  <li class="active"><a href="#general" data-toggle="tab">General Questions</a></li>
  <li><a href="#ocaml" data-toggle="tab">Core Language</a></li>
  <li><a href="#module" data-toggle="tab">Module Language</a></li>
  <li><a href="#tools" data-toggle="tab">Development Tools</a></li>
</ul>


<div class="tab-content">
<div class="tab-pane" id="ocaml">
<h2>Core Language</h2><hr />

<h3>Basic types</h3>

<div class="Q">Is it possible to do computations with arbritrary
precision arithmetics?</div>
<div class="A">OCaml and Caml Light both provide a library that
handles exact arithmetic computation for rational numbers. The library
is called <code>Num</code> in OCaml and <code>camlnum</code> in Caml
Light.<br />

Operations on big numbers gets the suffix <code>/</code>: addition is
thus <code>+/</code>. You build big numbers using conversion from
(small) integers or character strings.  For printing in the toplevel,
a custom printer can be used.  An example under OCaml is given below.

<pre ml:content="ocaml">
  #load "nums.cma";;
  open Num
  open Format;;
  let print_num ff n = fprintf ff "%s" (string_of_num n);;
  #install_printer print_num;;
  num_of_string "2/3";;
  let n = num_of_string "1/3" +/ num_of_string "2/3";;
  let rec fact n =
    if n <= 0 then (num_of_int 1) else num_of_int n */ (fact (n - 1));;
  fact 100;;
</pre>
</div>


<h3>Data structures</h3>

<div class="Q">My array is modified, and I don't know why</div>
<div class="A">This is due to the physical sharing of two arrays that
you missed. In OCaml there are no implicit array copying. If you give
two names to the same array, every modification on one array will be
visible to the other:

<pre ml:content="ocaml">
  let v = Array.make 3 0;;
  let w = v;;
  w.(0) <- 4;;
  v;;
</pre>

The physical sharing effect also applies to elements stored in
vectors: if these elements are also vectors, the sharing of these
vectors implies that modifying one of these elements modifies the
others (see also the entry below).
</div>

<div class="Q">How to define multidimensional arrays?</div>
<div class="A">The only way is to define an array whose elements are
arrays themselves (OCaml arrays are unidimensional, they modelize
mathematical vectors).

The naive way to define multidimensional arrays is bogus: the result
is not right because there is some unexpected physical sharing between
the lines of the new array (see also previous entry):

<pre ml:content="ocaml">
  let m = Array.make 2 (Array.make 3 0);;
  m.(0).(0) <- 1;;
  m;;
</pre>

The allocation of a new array has two phases. First, the initial value
is computed; then this value is written in each element of the new
array. That's why the line which is allocated by <code>Array.make 3
0</code> is unique and physically shared by all the lines of the array
<code>m</code>.<br />

The solution is to use the <code>make_matrix</code> primitive that
builds the matrix with all elements equal to the initial value
provided. Alternatively, write the program that allocates a new line
for each line of your matrix. For instance:

<pre ml:content="ocaml">
  let matrix n m init =
    let result = Array.make n (Array.make m init) in
    for i = 1 to n - 1 do
      result.(i) <- Array.make m init
    done;
    result
</pre>

In the same vein, the <code>copy_vect</code> primitive gives strange
results, when applied to matrices: you need to write a function that
explicitly copies each line of the matrix at hand:

<pre ml:content="ocaml">
  let copy_matrix m =
    let l = Array.length m in
    if l = 0 then m else
      let result = Array.make l m.(0) in
      for i = 0 to l - 1 do
        result.(i) <- Array.copy m.(i)
      done;
      result
</pre>
</div>

<h3>Types definitions</h3>

<div class="Q">How to define an enumerated type?</div>
<div class="A">An enumerated type is a sum type with only
constants. For instance, a type with 3 constants:

<pre ml:content="ocaml">
  type color = Blue | White | Red;;
  Blue;;
</pre>

The names <code>Blue</code>, <code>White</code> and <code>Red</code>
are the constructors of the <code>color</code> type.  One can define
functions on this type by pattern matching:

<pre ml:content="ocaml">
  let string_of_color =function
    | Blue -> "blue"
    | White -> "white"
    | Red -> "red"
</pre>
</div>

<div class="Q">How to share a label between two different record
types?</div>
<div class="A">When you define two types sharing a label name, the
last defined type hides the labels of the first type. For instance:

<pre ml:content="ocaml">
  type point_3d = {x : float; y : float; z : float};;
  type point_2d = {x : float; y : float};;
  {x = 10.; y = 20.; z = 30.};;
</pre>

The simplest way to overcome this problem is simply ... to use
different names! For instance

<pre ml:content="ocaml">
  type point3d = {x3d : float; y3d : float; z3d : float};;
  type point2d = {x2d : float; y2d : float};;
</pre>

With OCaml, one can propose two others solutions.  First, it is
possible to use modules to define the two types in different name
spaces:

<pre ml:content="ocaml">
  module D3 = struct
    type point = {x : float; y : float; z : float}
  end;;

  module D2 = struct
    type point = {x : float; y : float}
  end;;
</pre>

This way labels can be fully qualified as <code>D3.x</code>
<code>D2.x</code>:

<pre ml:content="ocaml">
  {D3.x = 10.; D3.y = 20.; D3.z = 30.};;
  {D2.x = 10.; D2.y = 20.};;
</pre>

You can also use objects that provide overloading on method names:

<pre ml:content="ocaml">
  class point_3d ~x ~y ~z = object
    method x : float = x
    method y : float = y
    method z : float = z
  end;;

  class point_2d ~x ~y = object
    method x : float = x
    method y : float = y
  end;;
</pre>

Note that objects provide you more than overloading: you can define
truly polymorphic functions, working on both <code>point_3d</code> and
<code>point_2d</code>, and you can even coerce a <code>point_3d</code>
to a <code>point_2d</code>.
</div>

<div class="Q">How to define two sum types that share constructor
names?</div>
<div class="A">Generally speaking you cannot. As for all other names,
you must use distinct name constructors. However, you can define the
two types in two different name spaces, i.e. into two different
modules. As for labels discussed above, you obtain constructors that
can be qualified by their module names.

With OCaml you can alternatively use polymorphic variants,
i.e. constructors that are, in some sense, <i>predefined</i>, since
they are not defined by a type definition. For instance:

<pre  ml:content="ocaml">
  type ids = [ `Name | `Val ];;
  type person = [ `Name of string ];;
  let f : person -> string = function `Name s -> s;;
  let is_name : ids -> bool = function `Name -> true | _ -> false;;
</pre>
</div>

<h3>Functions and procedures</h3>

<div class="Q">How to define a function?</div>

<div class="A">In OCaml, the syntax to define functions is close to the
mathematical usage: the definition is introduced by the keyword
<code><b>let</b></code>, followed by the name of the function and its
arguments; then the formula that computes the image of the argument is
written after an <code>=</code> sign.

<pre ml:content="ocaml">
  let successor (n) = n + 1;;
</pre>

In fact, parens surrounding the argument may be omitted, so we
generally write:

<pre ml:content="ocaml">
  let successor n = n + 1;;
</pre>
</div>

<div class="Q">How to define a recursive function?</div>
<div class="A">You need to explicitly tell that you want to define a
recursive function: use &#8220;let rec&#8221; instead of
&#8220;let&#8221;. For instance:

<pre ml:content="ocaml">
  let rec fact n =
    if n = 0 then 1 else n * fact (n - 1);;
  let rec fib n =
    if n <= 1 then n else fib (n - 1) + fib (n - 2);;
</pre>

Functions may be mutually recursive:

<pre ml:content="ocaml">
  let rec odd n =
    if n = 0 then true
    else if n = 1 then false else even (n - 1)
  and even n =
    if n = 0 then false
    else if n = 1 then true else odd (n - 1);;
</pre>
</div>

<div class="Q">How to apply a function?</div>
<div class="A">Functions are applied as in mathematics: write the
function's name, followed by its argument enclosed in parens: f
(x). In practice, parens are omitted in case of constants or
identifiers: we write <code>fib 2</code> instead of <code>fib
(2)</code>, and <code>fact x</code> instead of <code>fact
(x)</code>.<br />

When the argument of a function is more complex than just an
identifier, you must enclose this argument between parentheses. In
particular you need parens when the argument is a negative constant
number: to apply <code>f</code> to <code>-1</code> you must write
<code>f (-1)</code> and <strong>not</strong> <code>f -1</code>
that is syntactically similar to <code>f - 1</code> (hence it is a
subtraction, not an application).
</div>

<div class="Q">How to define a procedure?</div>
<div class="A">Recall that <em>procedures</em> are commands that
produce an <em>effect</em> (for instance printing something on the
terminal or writing some memory location), but have no mathematically
meaningful result.<br />

In OCaml, there is no special treatment of procedures: they are just
considered as special cases of functions that return the special
&#8220;meaningless&#8221; value <a
href="donnees_de_base-eng.html#units"
shape="rect"><code>()</code></a>. For instance, the
<code>print_string</code> primitive that prints a character string on
the terminal, just returns <code>()</code> as a way of
indicating that its job has been properly completed.<br />

Procedures that do not need any meaningful argument, get
<code>()</code> as dummy argument. For instance, the
<code>print_newline</code> procedure, that outputs a newline on the
terminal, gets no meaningful argument: it has type <code>unit 
     -&gt; unit</code>.<br />
Procedures with argument are defined exactly as ordinary
functions. For instance:

<pre ml:content="ocaml">
  let message s = print_string s; print_newline();;
  message "Hello world!";;
</pre>
</div>

<div class="Q">How to define a procedure/function that takes no
argument?</div>
<div class="A">Note that it is impossible to define a procedure
without any argument at all: its definition would imply to execute it,
and there would be no way to call it afterwards. In the following
fragment <code>double_newline</code> is bound to
<code>()</code>, and its further evaluation never
produces carriage returns as may be erroneously expected by the user.

<pre ml:content="ocaml">
  let double_newline = print_newline(); print_newline();;
  double_newline;;
</pre>

The correct definition and usage of this procedure is:

<pre ml:content="ocaml">
  let double_newline () = print_newline(); print_newline();;
  double_newline;;
  double_newline ();;
</pre>
</div>

<div class="Q">How to define a function with more than one
argument?</div>
<div class="A">Just write the list of successive arguments when
defining the function. For instance:

<pre ml:content="ocaml">
  let sum x y = x + y;;
</pre>

then gives the actual arguments in the same order when applying the
function:

<pre ml:content="ocaml">
  sum 1 2;;
</pre>

These functions are named &#8220;curried&#8221; functions, as opposed
to functions with tuples as argument:

<pre ml:content="ocaml">
  let sum' (x, y) = x + y;;
  sum' (1, 2);;
</pre>
</div>

<div class="Q">How to define a function that has several
results?</div>
<div class="A">You can define a function that return a pair or a
tuple:

<pre ml:content="ocaml">
  let div_mod x y = (x / y, x mod y);;
  div_mod 15 7;;
</pre>
</div>

<div class="Q">What is an &#8220;anonymous function&#8221;?</div>
<div class="A">You may use functions that have no names: we call them
functional values or anonymous functions. A functional value is
introduced by the keyword <code><b>fun</b></code>, followed by
its argument, then an arrow <code>-&gt;</code> and the function body.
For instance:

<pre ml:content="ocaml">
  fun x -> x + 1;;
  (fun x -> x + 1) 2;;
</pre>
</div>

<div class="Q">What is the difference between <code><b>fun</b></code>
and <code><b>function</b></code>?</div>

<div class="A">Functions are usually introduced by the keyword
<code><b>fun</b></code>. Each parameter is introduced by its own
<code><b>fun</b></code> construct. For instance, the construct:

<pre ml:content="ocaml noeval">
  fun x -> fun y -> ...
</pre>
defines a function with two parameters <code>x</code> and
<code>y</code>.  An equivalent but shorter form is:
<pre ml:content="ocaml noeval">
  fun x y -> ...
</pre>

<p> Functions that use pattern-matching are
introduced by the keyword <code><b>function</b></code>.
For example:
<pre ml:content="ocaml noeval">
  function None -> false | Some _ -> true
</pre>

</div>

<div class="Q">My function is never applied</div>
<div class="A">This is probably due to a missing argument: since OCaml
is a functional programming language, there is no error when you
evaluate a function with missing arguments: in this case, a functional
value is returned, but the function is evidently not applied. Example:
if you evaluate <code>print_newline</code> without argument, there is
no error, but nothing happens. The compiler issues a warning in case
of a blatant misuse.

<pre ml:content="ocaml">
  print_newline;;
  print_newline ();;
</pre>
</div>


<h3>Pattern matching</h3>

<div class="Q">How to do nested pattern matching?</div>
<div class="A">You imperatively need to enclose between parens a
pattern matching which is written inside another pattern matching. In
effect, the internal pattern matching &#8220;catches&#8221; all the
pattern matching clauses that are written after it. For instance:

<pre ml:content="ocaml noeval">
let f = function
  | 0 -> match ... with | a -> ... | b -> ...
  | 1 -> ...
  | 2 -> ...
</pre>

is parsed as

<pre ml:content="ocaml noeval">
let f = function
  | 0 ->
     match ... with
     | a -> ...
     | b -> ...
     | 1 -> ...
     | 2 -> ...
</pre>

This error may occur for every syntactic construct that involves
pattern matching: <code><b>function</b></code>, <code><b>match</b>
      .. <b>with</b></code>
and <code><b>try</b> ... <b>with</b></code>. The usual trick is to
enclose inner pattern matchings with <code><b>begin</b></code> and
<code><b>end</b></code>. One write:

<pre ml:content="ocaml noeval">
let f = function
  | 0 ->
     begin match ... with
     | a -> ...
     | b -> ...
     end
  | 1 -> ...
  | 2 -> ...
</pre>
</div>

<h3>Exceptions</h3>

<h3>Typing</h3>

<div class="Q">Error message: a type is not compatible with
itself</div>
<div class="A">You may obtain the message: This expression has type
&#8220;some type&#8221; but is used with type &#8220;the same some
type&#8221;. This may occur very often when using the interactive
system.<br />

The reason is that two types with the same name have been defined the
compiler does not confuse the two types, but the types are evidently
written the same. Consider for instance:

<pre ml:content="ocaml">
  type t = T of int;;
  let x = T 1;;
  type t = T of int;;
  let incr = function T x -> T (x+1);;
  incr x;;
</pre>

This phenomenon appears when you load many times the same file into
the interactive system, since each reloading redefines the types. The
solution is to quit your interactive system and reload your files in a
new session.
</div>

<div class="Q">A function obtained through partial application is not
polymorphic enough</div>
<div class="A"> The more common case to get a ``not polymorphic
enough'' definition is when defining a function via partial
application of a general polymorphic function. In OCaml polymorphism is
introduced only through the &#8220;let&#8221; construct, and results
from application are weakly polymorph; hence the function resulting
from the application is not polymorph.

In this case, you recover a fully polymorphic definition by clearly
exhibiting the functionality to the type-checker : define the function
with an explicit functional abstraction, that is, add a
<code><b>function</b></code> construct or an extra parameter (this
rewriting is known as eta-expansion):

<pre ml:content="ocaml">
  let map_id = List.map (function x -> x) (* Result is weakly polymorphic *);;
  map_id [1;2];;
  map_id (* No longer polymorphic *);;
  let map_id' l = List.map (function x -> x) l;;
  map_id' [1;2];;
  map_id' (* Still fully polymorphic *);;
</pre>

The two definitions are semantically equivalent, and the new one can
be assigned a polymorphic type scheme, since it is no more a function
application.
</div>

<div class="Q">The type of this expression contains type variables
that cannot be generalized</div>
<div class="A"> This message appears when the OCaml compiler tries to
compile a function or a value which is monorphic, but for which some
types have not been completely inferred. Some types variables are left
in the type, which are are called &#8220;weak&#8221; (and are
displayed by an underscore: <code>'_a</code>); they will disappear
thanks to type inference as soon as enough informations will be given.

<pre ml:content="ocaml">
  let r = ref [];;
  let f = List.map (fun x -> x);;
</pre>

Since the expression mentionned in the error message cannot be
compiled as is, two cases must be envisioned:

<ul>
  <li>The expression can really not be turned into a polymorphic
  expression, as in <code>r</code> above. You must use an explicit
  type annotation, in order to turn it into something completely
  monomorphic.</li>

  <li>The expression can be transformed into something polymorphic
  through rewriting some part of the code (for example using <a
  href="#eta-expansion" shape="rect">eta-expansion</a>) as in the case
  of <code>f</code>.</li>
</ul>
</div>

<div class="Q">How to write a function with polymorphic
arguments?</div>
<div class="A">In ML, an argument of a function cannot be polymorphic
inside the body of the function; hence the following typing:

<pre ml:content="ocaml">
  let f (g : 'a -> 'a) x y = g x, g y;;
</pre>

The function is not as polymorphic as we could have hoped.<br />

Nevertheless, in OCaml it is possible to use first-order
polymorphism. For this, you can use either records or objects; in the
case of records, you need to declare the type before using it in the
function.

<pre ml:content="ocaml">
  let f (o : < g : 'a. 'a -> 'a >) x y = o#g x, o#g y;;
  type id = { g : 'a. 'a -> 'a };;
  let f r x y = r.g x, r.g y;;
</pre>

  FIXME: A direct way now exists.
</div>


<h3>Intput/output</h3>

<div class="Q">Why some printing material is mixed up and does not
appear in the right order?</div>
<div class="A">If you use printing functions of the
<code>format</code> module, you might not mix printing commands from
<code>format</code> with printing commands from the basic I/O
system. In effect, the material printed by functions from the
<code>format</code> module is delayed (stored into the pretty-printing
queue) in order to find out the proper line breaking to perform with
the material at hand. By contrast low level output is performed with
no more buffering than usual I/O buffering.

<pre ml:content="ocaml">
  print_endline "before";
  Format.print_string "MIDDLE";
  print_endline "after";;
  <!-- FIXME: stdout not shown if we use print_string! -->
</pre>

To avoid this kind of problems you should not mix printing orders from
<code>format</code> and basic printing commands; that's the reason why
when using functions from the <code>format</code> module, it is
considered good programming habit to open <code>format</code> globally
in order to completely mask low level printing functions by the high
level printing functions provided by <code>format</code>.
</div>

</div><!-- Core Language -->


<div class="tab-pane active" id="general">
<h2>General Questions</h2>

<div class="Q">What is OCaml?</div>
<div class="A">OCaml is a programming language. It is a functional
language, since the basic units of programs are functions.  It is a
strongly-typed language; it means that the objects that you use belong
to a set that has a name, called its type.  In OCaml, types are
managed by the computer, the user has nothing to do about types (types
are synthesized).  The language is available on almost every Unix
platform (including Linux and MacOS X) and on PCs under Windows.  A
brief tour on main <a href="description.html" >features</a> of OCaml.</div>

<div class="Q">Under what licensing terms is the OCaml software
available?</div>
<div class="A">The OCaml system is open source software: the compiler
is distributed under the terms of the Q Public License, and its
library is under LGPL; please read the <a
href="license.html">license</a> document for more details.  A
BSD-style license is also available for a fee through the <a
href="support.html#consortium"> OCaml Consortium</a>.</div>

<div class="Q">What is the meaning of the name
&#8220;OCaml&#8221;</div>
<div class="A">&#8220;Caml&#8221; is an acronym: it stands for
&#8220;Categorical Abstract Machine Language&#8221;. The
&#8220;Categorical Abstract Machine&#8221; is an abstract machine to
define and execute functions. It is issued from theoretical
considerations on the relationship between category theory and
lambda-calculus. The first Caml compiler produced code for this
abstract machine (in 1984).  The &#8220;O&#8221; stands for
&#8220;Objective&#8221; and was added after object oriented features
were available in the language.<br />

In addition, OCaml is issued from the ML programming language,
designed by Robin Milner in 1978, and used as the programming language
to write the &#8220;proof tactics&#8221; in the LCF proof system.</div>

<div class="Q">Do you write &#8220;Caml&#8221; or &#8220;CAML&#8221;,
&#8220;OCaml&#8221;, &#8220;Ocaml&#8221; or &#8220;OCAML&#8221;?</div>
<div class="A">We write OCaml.<br />

According to usual rules for acronyms, we should write CAML, as we
write USA. On the other hand, this upper case name seems to
yell all over the place, and writing OCaml is far more pretty and
elegant — with &#8220;O&#8221; and &#8220;C&#8221; capitalized.</div>

<div class="Q">Is OCaml a compiled or interpreted language?</div>
<div class="A">OCaml is compiled.  However each OCaml compiler offers
a top-level interactive loop, that is similar to an interpreter. In
fact, in the interactive system, the user may type in program chunks
(we call these pieces OCaml &#8220;phrases&#8221;) that the system
handles at once, compiling them, executing them, and writing their
results.</div>

<div class="Q">What are the differences between Caml V3.1, Caml Light,
and OCaml?</div>
<div class="A">These are different Caml implementations that have been
developed successively at Inria.  These systems share many features
since they all implement the core of the OCaml language; so the basic
syntax is nearly the same.  However, all these systems have their own
extensions to the Caml core language.<br />

Caml V3.1 is no longer maintained nor distributed.  <a
href="caml-light/" >Caml Light</a> is no longer developed, but still
maintained.  Because of its stable status, it is actively used in
education.  Most other users have switched to OCaml, the latest
variant of the language.  This is the version we suggest using in new
software developments. See our brief <a href="history.html"
>history</a> of the OCaml language.</div>

<div class="Q">How to report a bug in the compilers?</div>
<div class="A">Use the <a href="http://caml.inria.fr/mantis/" >bug
tracking system</a> to browse bug reports and features request, and
submit new ones.</div>

</div><!-- General Questions -->

<div class="tab-pane" id="module">
<h2>Module Language</h2>

<div class="Q">Can I have two mutually recursive compilation units /
structures / signatures / functors?</div>
<div class="A">Currently not in the stable langage. However there
exists an <a
href="http://caml.inria.fr/pub/docs/manual-ocaml/manual021.html#toc75"
shape="rect">OCaml extension</a> (which is subject to change or
removal at any time) which adresses some of these problems.</div>

<div class="Q">How do I express sharing constraints between
modules?</div>
<div class="A">Use manifest type specifications in the arguments of
the functor. For instance, assume defined the following signatures:

<pre ml:content="ocaml noeval">
module type S1 = sig ... type t ... end
module type S2 = sig ... type u ... end
</pre>

To define a functor <code>F</code> that takes two arguments
<code>X:S1</code> and <code>Y:S2</code> such that <code>X.t</code> and
<code>Y.u</code> are the same, write:

<pre ml:content="ocaml noeval">
module F (X: S1) (Y: S2 with type u = X.t) =
  struct ... end
</pre>

Indeed, internally this expands to

<pre ml:content="ocaml noeval">
module F (X: S1) (Y: sig ... type u = X.t ... end) =
  struct ... end
</pre>

</div>


<div class="Q">Compilation units are forced to be modules. What if I
want to make a unit with a functor or a signature instead?</div>
<div class="A">In OCaml, functors and signatures (module types) can be
components of modules. So, just make the functor or signature be a
component of a compilation unit. A good example is the module
<code>Set</code> from the standard library.
</div>

</div><!-- Module Language -->

<div class="tab-pane" id="tools">
<h2>Development Tools</h2>

<h3>Interactive loop (toplevel)</h3>

<div class="Q">How to stop the evaluation (execution) of an
expression?</div>
<div class="A">It is often possible to interrupt a program or the OCaml
system by typing some combination of keys that is operating system
dependent: under Unix send an interrupt signal (generally
<tt>Control-C</tt>), under Macintosh OS type <tt>Command-.</tt>, under
Windows use the &#8220;OCaml&#8221; menu.
</div>

<div class="Q">How to quit the interactive loop?</div>
<div class="A">With Caml Light, type <code>quit();;</code>.
With OCaml, type <code>#quit;;</code>.  In both, you can also send an
end-of-file (CTRL-D for Unix, CTRL-Z for DOS, etc.).</div>

<h3>Batch Compilers</h3>

<h3>Yacc</h3>

<h3>Lex</h3>
</div><!-- Development Tools -->

</div><!-- tab-content -->
</body>
</html>
