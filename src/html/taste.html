<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <title>A Hundred Lines of OCaml</title>
    <link href="ocaml.css" media="all" type="text/css" rel="stylesheet" />
  </head>
  <body>
    <h1>A Hundred Lines of OCaml</h1>

    <div class="pull-right hero-unit" style="margin-left: 1em" >
      <em>Table of contents</em>
      <div ml:replace="toc"></div>
    </div>

    <p>OCaml possesses an <a href="description.html#interactive" >
    interactive system</a>, called “toploop”, that lets you type OCaml
    code and have it evaluated immediately.  It is a great way to
    learn the language and to quickly experiment with ideas.  Below,
    we demonstrate the use of the toploop to illustrate basic
    capabilities of the language.
    </p>

    <p>Some indications for the code below.  The prompt at which you
      type is “<code><span class="ocamltop-prompt">#</span></code>”.
      The code must end with
      “<code><span class="ocamltop-prompt">;;</span></code>” (this is
      only an indication to the interactive system that the input has
      to be evaluated and is not really part of the OCaml code).  The
      output of the system is displayed in
      <code><span class="ocamltop-output">this color</span></code>.
    </p>

    <h2><a name="elementary"></a>Elementary functions</h2>

    <p>Let us define the square function and the recursive factorial
    function.  Then, let us apply these functions to sample values.
    Unlike the majority of languages, OCaml uses parentheses
    for grouping but not for the arguments of a function.
    </p>

    <pre class="listing" ml:content="ocaml">
let square x = x * x;;
  square 3;;
  let rec fact x =
    if x <= 1 then 1 else x * fact (x - 1);;
fact 5;;
square 120;;
</pre>


  <h2><a name="memory"></a>Automatic memory management</h2>

  <p>All allocation and deallocation operations are fully automatic.
  For example, let us consider simply linked lists.
  </p>
  <p>Lists are predefined in OCaml. The empty list is
  written <code>[]</code>.  The constructor that allows
  prepending an element to a list is written <code>::</code> (in infix
  form).
  </p>

<pre class="listing" ml:content="ocaml">
let l = 1 :: 2 :: 3 :: [];;
[1; 2; 3];;
5 :: l;;
</pre>

  <h2><a name="polymorphism"></a>Polymorphism: sorting lists</h2>

  <p>Insertion sort is defined using two recursive functions.
  </p>
<pre class="listing" ml:content="ocaml">
let rec sort = function
  | [] -> []
  | x :: l -> insert x (sort l)
and insert elem = function
  | [] -> [elem]
  | x :: l -> if elem < x then elem :: x :: l
              else x :: insert elem l;;
</pre>

  <p>Note that the type of the list elements remains unspecified: it
  is represented by a <em>type
  variable</em> <code>'a</code>. Thus, <code>sort</code> can be
  applied both to a list of integers and to a list of strings.
  </p>
<pre class="listing" ml:content="ocaml">
sort [2; 1; 0];;
sort ["yes"; "ok"; "sure"; "ya"; "yep"];;
</pre>


<h2><a name="imperative"></a>Imperative features</h2>

    <p>Let us encode polynomials as arrays of integer
      coefficients. Then, to add two polynomials, we first allocate the
      result array, then fill its slots using two successive
      <code><b>for</b></code> loops.
    </p>

<pre class="listing" ml:content="ocaml">
let add_polynom p1 p2 =
  let n1 = Array.length p1
  and n2 = Array.length p2 in
  let result = Array.create (max n1 n2) 0 in
  for i = 0 to n1 - 1 do result.(i) <- p1.(i) done;
  for i = 0 to n2 - 1 do result.(i) <- result.(i) + p2.(i) done;
  result;;
add_polynom [| 1; 2 |] [| 1; 2; 3 |];;
</pre>

  <p>OCaml offers updatable memory cells, called
    <em>references</em>:
    <code>ref init</code> returns a new cell with initial contents
    <code>init</code>, <code>!cell</code> returns the current contents
    of
    <code>cell</code>, and 
    <code>cell :=<b></b> v</code> 
    writes the value <code>v</code> into <code>cell</code>.
  </p>

  <p>We may redefine <code>fact</code> using a reference cell and
      a <code><b>for</b></code> loop:
  </p>
<pre class="listing" ml:content="ocaml">
  let fact n =
    let result = ref 1 in
    for i = 2 to n do
      result := i * !result
    done;
    !result;;
  fact 5;;
</pre>



  <h2><a name="functionality"></a>Higher-order functions</h2>

  <p>There is no restriction on functions, which may thus be passed as
    arguments to other functions.  Let us define a function
    <code>sigma</code> that returns the sum of the results of applying a given
    function <code>f</code> to each element of a list:
  </p>

<pre class="listing" ml:content="ocaml">
  let rec sigma f = function
    | [] -> 0
    | x :: l -> f x + sigma f l
</pre>

  <p>Anonymous functions may be defined using the
    <code><b>fun</b></code> or <code><b>function</b></code> construct:
  </p>
<pre class="listing" ml:content="ocaml">
sigma (fun x -> x * x) [1; 2; 3];;
</pre>

  <p>Polymorphism and higher-order functions allow defining function
  composition in its most general form:
  </p>
<pre class="listing" ml:content="ocaml">
  let compose f g = fun x -> f (g x);;
  let square_o_fact = compose square fact;;
  square_o_fact 5;;
</pre>


  <h2><a name="power"></a>The power of functions</h2>

  <p>The power of functions cannot be better illustrated than by
      the <code>power</code> function:
  </p>

<pre class="listing" ml:content="ocaml">
  let rec power f n = 
    if n = 0 then fun x -> x 
    else</b> compose f (power f (n - 1));;
</pre>

<p>The <code>n</code><sup>th</sup> derivative of a function can be
  computed as in mathematics by raising the derivative function to
  the <code>n</code><sup>th</sup> power:
</p>

<pre class="listing" ml:content="ocaml">
  let derivative dx f = fun x -> (f (x +. dx) -. f x) /. dx;;
  let sin''' = power (derivative 1e-5) 3 sin;;
  let pi = 4.0 *. atan 1.0 in sin''' pi;;
</pre>


  <h2><a name="symbolic"></a>Symbolic computation</h2>

  <p>Let us consider simple symbolic expressions made up of integers,
    variables, <code><b>let</b></code> bindings, and binary
    operators. Such expressions can be defined as a new data type,
    as follows:
  </p>
<pre class="listing" ml:content="ocaml silent">
  type expression =
    | Num of int
    | Var of string
    | Let of string * expression * expression
    | Binop of string * expression * expression;;
</pre>

  <p>Evaluation of these expressions involves an environment that maps
    identifiers to values, represented as a list of pairs.
  </p>
<pre class="listing" ml:content="ocaml">
  let rec eval env = function
    | Num i -> i
    | Var x -> List.assoc x env
    | Let (x, e1, in_e2) ->
       let val_x = eval env e1 in
       eval ((x, val_x) :: env) in_e2
    | Binop (op, e1, e2) ->
       let v1 = eval env e1 in
       let v2 = eval env e2 in
       eval_op op v1 v2
  and eval_op op v1 v2 =
    match op with
    | "+" -> v1 + v2
    | "-" -> v1 - v2
    | "*" -> v1 * v2
    | "/" -> v1 / v2
    | _ -> failwith ("Unknown operator: " ^ op);;
</pre>

  <p>As an example, we evaluate the phrase <code><b>let</b>
  x <b></b>=<b></b> 1 <b>in</b> x
  + <b></b> <b></b> <b></b> <b></b> <b></b> <b></b> x</code>:
  </p>

<pre class="listing" ml:content="ocaml">
  eval [] (Let ("x", Num 1, Binop ("+", Var "x", Var "x")));;
</pre>

  <p>Pattern matching eases the definition of functions operating on
  symbolic data, by giving function definitions and type declarations
  similar shapes. Indeed, note the close resemblance between the
  definition of the <code>eval</code> function and that of the
    <code>expression</code> type.
  </p>


  <h2><a name="debugging"></a>Elementary debugging</h2>

  <p>To conclude, here is the simplest way of spying over functions:
  </p>
<pre class="listing">
<code ml:replace="ocaml">
  let rec fib x = if x <= 1 then 1 else fib (x - 1) + fib (x - 2);;
</code
><span class="ocamltop-prompt"># </span>#trace fib<span class="ocamltop-prompt">;;</span>
<span class="ocamltop-output">fib is now traced.</span>
<span class="ocamltop-prompt"># </span>fib 3<span class="ocamltop-prompt">;;</span>
<span class="ocamltop-output"
>fib &lt;-- 3
fib &lt;-- 1
fib --&gt; 1
fib &lt;-- 2
fib &lt;-- 0
fib --&gt; 1
fib &lt;-- 1
fib --&gt; 1
fib --&gt; 2
fib --&gt; 3
- : int = 3
</pre>

<p>Go and <a href="http://try.ocamlpro.com/" >try it in your
    browser</a> or <a href="install.html" >install</a> it and read
    some <a href="tutorials/" >tutorials</a>.
</p>

  </body>
</html>
