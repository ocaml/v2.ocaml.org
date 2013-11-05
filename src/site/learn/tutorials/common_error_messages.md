<head>
<title>Common error messages</title>
</head>
<body>
<h1><span>Common error messages</span></h1>

<p>This page gives a list of quick explanations for some error or warning messages that are emitted by the OCaml compilers. Longer explanations are usually given in dedicated sections of this tutorial.</p>
<a name="Type_errors"></a><h2><span>Type errors</span></h2>
<h3>This expression has type ... but is here used with type ...</h3>
<p>When the type of an object is not compatible with the context in which it is used, it is frequent to obtain this kind of message:</p>
<pre ml:content="ocaml">
1 + 2.5;;
</pre>

<p>&quot;This expression has type <em>X</em> but is here used with type <em>Y</em>&quot; means that if the contents of the expression is isolated (2.5), its type  is inferred as <em>X</em> (float). But the context, i.e. everything which is around (1 + ...) tells that the gap expects an expression of type <em>Y</em> (int) which is not compatible with <em>X</em>.</p>
<p>More disturbing is the following message:</p>
<pre>
 This expression has type my_type but is here used with type my_type
</pre>

<p>This error happens often while testing some type definitions using the toplevel.  In OCaml, it is perfectly legal to define a type with a name that is already taken by another type. Consider the following session:</p>
<pre ml:content="ocaml">
type my_type = A | B;;
let a = A;;
type my_type = A | B;;
let b = B;;
a = b;;
</pre>

<p>For the compiler, the second definition of my_type is totally independent from the first definition. So we have defined two types which have the same name. Since &quot;a&quot; was defined earlier, it belongs to the first type while &quot;b&quot; belongs to the second type. In this example, redefining &quot;a&quot; after the last definition of my_type solves the problem. This kind of problem should not happen in real programs unless you use the same name for the same type in the same module, which is highly discouraged.</p>
<h3>Warning: This optional argument cannot be erased</h3>
<p>Functions with optional arguments must have at least one non-labelled argument. For instance, this is not OK:</p>
<pre ml:content="ocaml">
let f ?(x = 0) ?(y = 0) = print_int (x + y)
</pre>

<p>The solution is simply to add one argument of type unit, like this:</p>
<pre ml:content="ocaml">
let f ?(x = 0) ?(y = 0) () = print_int (x + y);;
</pre>

<p>See the <a href="labels.html" class="internal" title="Labels">Labels</a> section for more details on functions with labelled arguments.</p>

<h3>The type of this expression... contains type variables that cannot be generalized</h3>

<p>This happens in some cases when the full type of an object is not
known by the compiler when it reaches the end of the compilation unit
(file) but for some reason it cannot remain polymorphic. Example:</p>
<pre ml:content="ocaml noeval">
let x = ref None
</pre>
<p>triggers the following message during the compilation:</p>
<pre>
The type of this expression, '_a option ref,
contains type variables that cannot be generalized
</pre>

<p>Solution: help the compiler with a type annotation, like for instance:</p>
<pre ml:content="ocaml noeval">
let x : string option ref = ref None
</pre>
<p>or:</p>
<pre ml:content="ocaml noeval">
let x = ref (None : string option)
</pre>

<p>Data of type <code>'_a</code> may be allowed temporarily, for
  instance during a toplevel session. It means that the given object has
  an unknown type, but it cannot be any type: it is not polymorphic
  data. In the toplevel, our example gives these results:</p>
<pre ml:content="ocaml">
let x = ref None
</pre>

<p>The compiler tells us that the type of x is not fully known
  yet. But by using <code>x</code> later, the compiler can infer the
  type of&nbsp;<code>x</code>:</p>
<pre ml:content="ocaml">
x := Some 0
</pre>
<p>Now <code>x</code> has a known type:</p>
<pre ml:content="ocaml">
x;;
</pre>

<p>More details are given in the <a href="http://caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html#variables_de_types_faibles" class="external" title="http://caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html#variables_de_types_faibles">OCaml FAQ</a>.</p>

<h2><a name="Pattern_matching_warnings_and_errors"></a>
  Pattern matching warnings and errors</h2>

<h3>This pattern is unused</h3>

<p>This warning should be considered as an error, since there is no reason to intentionally keep such code. It may happen when the programmer introduced a catch-all pattern unintentionally such as in the following situation:</p>
<pre ml:content="ocaml">
  let test_member x tup =
    match tup with
    | (y, _) | (_, y) when y = x -> true
    | _ -> false;;
</pre>

<p>Obviously, the programmer had a misconception of what OCaml's pattern matching is about. Remember the following:</p>
<ul><li>the tree of cases is traversed linearly, from left to right. There is <em>no backtracking</em> as in regexp matching.</li>
<li>a guard (&quot;when&quot; clause) is not part of a pattern. It is simply a condition which is evaluated at most once and is used as a last resort to jump to the next match case.</li>
<li>lowercase identifiers (bindings such as &quot;y&quot; above) are just names, so they will always match.</li></ul>
<p>In our example, it is now clear that only the first item of the pair will ever be tested. This leads to the following results:</p>
<pre ml:content="ocaml">
test_member 1 (1, 0);;
test_member 1 (0, 1);;
</pre>

<h3>This pattern-matching is not exhaustive</h3>
<p>OCaml's pattern matching can check whether a set of patterns is exhaustive or not, based on the <em>type</em> only. So in the following example, the compiler doesn't know what range of ints the &quot;mod&quot; operator would return:</p>
<pre  ml:content="ocaml">
  let is_even x =
    match x mod 2 with
    | 0 -> true
    | 1 | -1 -> false
</pre>

<p>A short solution without pattern matching would be:</p>
<pre ml:content="ocaml">
let is_even x = x mod 2 = 0
</pre>

<p>In general, that kind of simplification is not possible and the best solution is to add a catch-all case which should never be reached:</p>
<pre ml:content="ocaml">
  let is_even x =
    match x mod 2 with
    | 0 -> true
    | 1 | -1 -> false
    | _ -> assert false
</pre>


<h2><a name="Problems_recompiling_valid_programs"></a>
  Problems recompiling valid programs</h2>

<h3>x.cmi is not a compiled interface</h3>
<p>When recompiling some old program or compiling a program from an external source that was not cleaned properly, it is possible to get this error message:</p>
<pre>
some_module.cmi is not a compiled interface
</pre>

<p>It means that some_module.cmi is not valid according to the <em>current version</em> of the OCaml compiler. Most of the time, removing the old compiled files (*.cmi, *.cmo, *.cmx, ...) and recompiling is sufficient to solve this problem.</p>

<h3>Warning: Illegal backslash escape in string</h3>
<p>Recent versions of OCaml warn you against unprotected backslashes in strings since they should be doubled. Such a message may be displayed when compiling an older program, and can be turned off with the &quot;-w x&quot; option.</p>
<pre ml:content="ocaml">
"\e\n" (* bad practice *);;
"\\e\n" (* good practice *);;
</pre>


</div>
</body>
