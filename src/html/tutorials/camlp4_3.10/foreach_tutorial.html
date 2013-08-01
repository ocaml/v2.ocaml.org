<head>
<title>Camlp4 3.10 Foreach Tutorial</title>
</head>
<body>

<div class="pull-right hero-unit" style="margin-left: 1em" >
      <em>Table of contents</em>
      <div ml:replace="toc 2 2"></div>
</div>

<h1><a name="Camlp4_3_10_Foreach_Tutorial">Camlp4 3.10 Foreach Tutorial</a></h1>

<p>This is a tutorial that guides you, step by step, how to write syntax extension using Camlp4 in Objective CAML. The example we present in this tutorial should give you a practical idea how syntax extension works, but this is not meant to be comprehensive. There are many resources on the web for Camlp4 prior to version 3.10, but Camlp4 3.10 introduces incompatible changes. This tutorial targets Camlp4 3.10 only.</p>

<p>Throughout the tutorial, we intentionally introduce subtle bugs in the interest of simplicity, but these bugs will be later explained.</p>

<p>The reader is expected to be familiar with context-free parsing. Some experience with yacc or ocamlyacc will be helpful. Knowing the difference between LL, LR and LALR parsers is a plus.</p>

<h2><a name="Camlp4_3_10_Motivtion">Motivation</a></h2>

<p>One of the greatest strengths of OCaml is Camlp4, a modular pre-processor pretty-printer that lets you add syntactic sugar to the language without rewriting the entire grammar from scratch. A syntactic sugar is a language construct that can be decomposed to an existing construct. For example, OCaml doesn't have a "for-each" syntax, which can be illustrated by the following Python code:</p>

<pre>
a_list = ["hello", "world"]
for s in a_list:
  print s
</pre>

<p>This code outputs:</p>

<pre>
hello
world
</pre>

<p>However, that doesn't mean OCaml can't support iterators! As it turns out, many modules in OCaml that define a data structure also provide an "iter" higher-order function that works similarly:</p>

<pre ml:content="ocaml noeval">
let a_list = ["hello"; "world"] in
List.iter (fun s -> print_endline s) a_list
</pre>


<p>Besides <code>List</code>, other modules that provide "iter" are <code>Array</code>, <code>Hashtbl</code>, <code>Map.Make(_)</code>, <code>Queue</code>, <code>Set.Make(_)</code>, <code>Stack</code>, and even <code>String</code>. Wouldn't it be nice if one can write:</p>

<pre ml:content="ocaml noeval">
let a_list = ["hello"; "world"] in
for s in a_list do
  print_endline s
done
</pre>

<p>instead? Imagine a long for-each body; this style of writing puts the "each" variable and the list next to each other, which results in cleaner code.</p>
<p>The idea is to transform the latter code into former, leveraging the "iter" function provided by these modules.</p>
<p>Notice that we can't generally look up a module specific "iter" function by the type of the expression we want to iterate over, so we have to specify a module like this:</p>

<pre ml:content="ocaml noeval">
let a_list = ["hello"; "world"] in
for s in List a_list do
  print_endline s
done
</pre>

<p>More generally, the syntactic sugar takes the following form:</p>
<pre  ml:content="ocaml noeval">
for v in M e do
  seq
done
</pre>

<p>where module <code>M</code> implements an iterator over the elements in collection <em>e</em>; most of the time, <em>e</em> also has the type <code>M.t</code>, though this is not strictly required.</p>
<h2><a name="Towards_the_First_Try">Towards the First Try</a></h2>
<p>Without going into too much detail, we can write a simple extension
  as the following: </p>
<pre ml:content="ocaml noeval">
  <span ml:replace="include pa_foreach.ml"></span>
</pre>
<p>For what follows, it is assumed that this code is written to a
  file <code>pa_foreach.ml</code>.</p>

<p>All the prerequisites are provided by the module <code>Camlp4.PreCast</code>, including the <code>Syntax</code> module that provides the terminals <code>a_LIDENT</code> and <code>a_UIDENT</code> (for lowercase and uppercase identifiers respectively), and the non-terminals <code>expr</code> (expressions) and <code>sequence</code> (semicolon separated expressions). The <code>Gram</code> module provides functions to manipulate non-terminal rules.</p>
<p>Suppose we save this syntax extension in the file called <code>pa_foreach.ml</code>. Notice that a syntax extension is just a regular OCaml file with some fancy <code>EXTEND</code> syntax. It can be compiled using the command:</p>
<pre>
ocamlc -I +camlp4 camlp4lib.cma -pp camlp4orf -c pa_foreach.ml
</pre>

<ul><li>FYI: Camlp4 is complicated to learn because a syntax extension consists of two domain-specific languages that are foreign to OCaml: parsing and code embedding. To add insult to injury, Camlp4 has a "<a href="http://caml.inria.fr/pub/docs/manual-camlp4/manual007.html" class="external" title="http://caml.inria.fr/pub/docs/manual-camlp4/manual007.html">revised syntax</a>" dialect of OCaml that can be used, in addition to the original OCaml dialect, both as the host (top-level) language and as the embedded language. This tutorial uses original OCaml as the host language and revised dialect as the embedded language. This choice is reflected in the camlp4 executable that we use here, <code>camlp4orf</code>. See <a href="http://brion.inria.fr/gallium/index.php/Using_Camlp4" class="external" title="http://brion.inria.fr/gallium/index.php/Using_Camlp4">Using Camlp4</a> for the explanation and additional options.</li></ul>
<p>We can verify that it works:</p>
<pre ml:content="ocaml">
  #load "camlp4o.cma";;
  (* Add directory where the syntax extension is compiled to the module
     path (not required if pa_foreach.cmo is in the current directory). *)
  #directory "_build/src/html/tutorials/camlp4_3.10/";;
  #load "pa_foreach.cmo";;
  for s in List ["hello"; "world"] do print_endline s done;;
</pre>

<p>Now we have a rudimentary syntax extension. However, it is quite restrictive. For example, it would be nice to do pattern matching like this:</p>
<pre  ml:content="ocaml noeval">
for (k, v) in List [(0, "hello"); (1, "world")] do
  Printf.printf "%d: %s\n" k v
done
</pre>

<p>And it doesn't support <code>Hashtbl.iter</code> yet because, so far, we can only generate functions with one argument. <code>Hashtbl.iter</code> passes two arguments to the function, the key and the value. We will address these issues in the next section.</p>
<h2><a name="Supporting_Multiple_Patterns">Supporting Multiple Patterns</a></h2>
<p>We're now beginning to use Camlp4 features that are less documented. It is useful to keep in mind that syntax extension <em>is</em> modifying existing parsing rules, and we can't do without an understanding of how existing rules work. It is recommended that you take a quick look at two files in the OCaml source distribution under <code>ocaml-3.10.0/camlp4/Camlp4Parsers</code>:</p>
<ul><li><code>Camlp4OCamlRevisedParser.ml</code>; this provides the bulk of the syntax rules.</li>
<li><code>Camlp4OCamlParser.ml</code> implicitly borrows most of its rules from <code>Camlp4OCamlRevisedParser</code>, but clears some of the rules that are particular to the revised syntax and replaces them with the original OCaml syntax.</li></ul>
<p>From these files, we can see that <code>ipatt</code> rule supplies what we want for matching patterns, and <code>LIST1</code> modifier allows us to take one or more patterns. There is also a <code>LIST0</code> modifier for "zero or more" matching.</p>
<pre ml:content="ocaml noeval">
  <span ml:replace="include pa_foreach2.ml" ></span>
</pre>

<p>In order to generate a higher-order function according to a list of patterns, we use the helper <code>mkfun</code> that essentially generates, for patterns <code>patt1</code> ... <code>pattN</code>,</p>
<pre ml:content="ocaml noeval">
fun patt1 ->
  ...
    fun pattN ->
      seq
</pre>

<p>which is the desugared form for <code ml:content="ocaml noeval"
  >fun patt1 ... pattN -> seq</code>.</p>
<p>We can verify that pattern works:</p>
<pre>
ocamlc -I +camlp4 camlp4lib.cma -pp camlp4orf -c pa_foreach2.ml
</pre>
<pre ml:content="ocaml">
  #load "pa_foreach2.cmo";;
  for (k, v) in List [(0, "hello"); (1, "world")] do
    Printf.printf "%d: %s\n" k v
  done;;
</pre>

<p>and that multiple arguments work:</p>
<pre  ml:content="ocaml">
  let tbl = Hashtbl.create 3;;
  Hashtbl.add tbl 0 "hello";;
  Hashtbl.add tbl 1 "world";;
  Hashtbl.add tbl 2 "foobar";;
  for k v in Hashtbl tbl do
    Printf.printf "%d: %s\n" k v
  done;;
</pre>

<p>There are still some subtle problems with this approach. In the next section, we'll discuss solutions to these problems.</p>
<h2><a name="Final_Touch_up">Final Touch-up</a></h2>
<p>The first problem we find out is that foreach body is supposed to be a sequence, but that doesn't work:</p>
<pre ml:content="ocaml noeval">
# for s in List ["hello"; "world"] do print_endline s; () done;;
Failure: "expr; expr: not allowed here, use do {...} or [|...|] to surround them"
</pre>

<p>The problem is due to the desugared form, which becomes:</p>
<pre ml:content="ocaml noeval">
  List.iter (fun s -> print_endline s; ()) ["hello"; "world"]
</pre>

<p>and this is ambiguous. Do we interpret the expression <code>fun s -> print_endline s; ()</code> as <code>(fun s -> print_endline s); ()</code> or <code>fun s -> (print_endline (); ())</code>? In order to avoid ambiguity, we wrap the sequence using <code>do {$seq$}</code> when it is a sequence. The function <code>mksequence'</code> in <code>Camlp4OCamlRevisedParser.ml</code> provides some inspiration how to handle this.</p>
<ul><li>FYI: see <a href="http://caml.inria.fr/pub/ml-archives/caml-list/2007/07/40966461d8ade5dcee6790fa32cc9983.en.html" class="external" title="http://caml.inria.fr/pub/ml-archives/caml-list/2007/07/40966461d8ade5dcee6790fa32cc9983.en.html">this post</a> by Nicolas Pouillard for a discussion of a similar issue.</li></ul>
<p>We also notice that the original for-loop syntax ceases working:</p>
<pre  ml:content="ocaml noeval">
# for i = 0 to 5 do print_int i done;;
Parse error: [ipatt] or [a_LIDENT] expected after "for" (in [expr])
</pre>
<!-- FIXME: If one tries to eval the code, an error is raised by
     Errors.report_error -->

<p>It turns out that the new rule we add for "for" doesn't play nice with the original rule. The solution is to rewrite the original rule so it becomes compatible with the new rule.</p>
<p>The code listing that addresses these issues can be found below:</p>
<pre ml:content="ocaml noeval">
  <span ml:replace="include pa_foreach3.ml"></span>
</pre>

<p>In order for alternative rules to "fall through" correctly, rules must share a common prefix, and the rest of the non-terminals must be distinct enough. The way we structured the "for" syntax before, we essentially have the following two rules:</p>
<pre ml:content="ocaml noeval">
EXTEND Gram
  expr: LEVEL "top"
    [ [ "for"; patts = LIST1 ipatt; "in"; m = a_UIDENT; e = expr;
       "do"; seq = do_sequence ->
         (* ... *)
      | "for"; i = a_LIDENT; "="; e1 = sequence; df = direction_flag;
       e2 = sequence; "do"; seq = do_sequence ->
         (* ... *)
      ] ]
  ;
END
</pre>

<p>Once the "for" keyword is matched, the parser proceeds to match the next token, but <code>ipatt</code> also matches <code>a_LIDENT</code> (a lowercase identifier is also a legal pattern). At this point, the parser fixes on a rule (whichever comes first) and no longer backtracks to the alternative option.</p>
<p>The solution is to make the original for loop always match <code>ipatt</code>, but refuse anything except a lowercase identifier.</p>
<p>We can now verify that everything works as expected.</p>
<pre>
$ ocamlc -I +camlp4 camlp4lib.cma -pp camlp4orf -c pa_foreach3.ml
</pre>
<pre ml:content="ocaml">
  #load "pa_foreach3.cmo";;
  let tbl = Hashtbl.create 3;;
  Hashtbl.add tbl 0 "hello";;
  Hashtbl.add tbl 1 "world";;
  Hashtbl.add tbl 2 "foo";;
  for k v in Hashtbl tbl do Printf.printf "%d: %s\n" k v done;;
  for i = 0 to 5 do print_int i done;;
  for k, v in List [0, "hello"; 1, "world"; 2, "foo"] do
    Printf.printf "%d: %s\n" k v
  done;;
</pre>

<h2><a name="Conclusion">Conclusion</a></h2>
<p>We begin with a simple Camlp4 syntax extension for the for-each iterator syntax, then explored further refinements to that idea that works around parsing issues both in embedded code and in the rules.</p>
<p>This tutorial is written by <a href="http://cs-people.bu.edu/liulk" class="external" title="http://cs-people.bu.edu/liulk">Likai Liu</a>. The text has not been peer reviewed, so use this at your own risk. Questions and comments are welcome.</p>
