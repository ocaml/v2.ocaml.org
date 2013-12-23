<!-- ((! set title Foreach Tutorial !)) ((! set learn !)) -->

*Table of contents*

# Camlp4 3.10 Foreach Tutorial

This is a tutorial that guides you, step by step, how to write syntax
extension using Camlp4 in Objective CAML. The example we present in this
tutorial should give you a practical idea how syntax extension works,
but this is not meant to be comprehensive. There are many resources on
the web for Camlp4 prior to version 3.10, but Camlp4 3.10 introduces
incompatible changes. This tutorial targets Camlp4 3.10 only.

Throughout the tutorial, we intentionally introduce subtle bugs in the
interest of simplicity, but these bugs will be later explained.

The reader is expected to be familiar with context-free parsing. Some
experience with yacc or ocamlyacc will be helpful. Knowing the
difference between LL, LR and LALR parsers is a plus.

## Motivation

One of the greatest strengths of OCaml is Camlp4, a modular
pre-processor pretty-printer that lets you add syntactic sugar to the
language without rewriting the entire grammar from scratch. A syntactic
sugar is a language construct that can be decomposed to an existing
construct. For example, OCaml doesn't have a "for-each" syntax, which
can be illustrated by the following Python code:

```python
a_list = ["hello", "world"]
for s in a_list:
  print s
```

This code outputs:

```
hello
world
```

However, that doesn't mean OCaml can't support iterators! As it turns
out, many modules in OCaml that define a data structure also provide an
"iter" higher-order function that works similarly:

```ocaml
let a_list = ["hello"; "world"] in
List.iter (fun s -> print_endline s) a_list
```

Besides `List`, other modules that provide "iter" are
`Array`, `Hashtbl`, `Map.Make(*)`,
`Queue`, `Set.Make(*)`, `Stack`, and
even `String`. Wouldn't it be nice if one can write:

```ocaml
let a_list = ["hello"; "world"] in
for s in a_list do
  print_endline s
done
```

instead? Imagine a long for-each body; this style of writing puts the
"each" variable and the list next to each other, which results in
cleaner code.

The idea is to transform the latter code into former, leveraging the
`iter` function provided by these modules.

Notice that we can't generally look up a module specific `iter` function
by the type of the expression we want to iterate over, so we have to
specify a module like this:


```ocaml
let a_list = ["hello"; "world"] in
for s in List a_list do
  print_endline s
done
```

More generally, the syntactic sugar takes the following form:


```ocaml
for v in M e do
  seq
done
```

where module `M` implements an iterator over the elements in
collection *e*; most of the time, *e* also has the type
`M.t`, though this is not strictly required.

## Towards the First Try

Without going into too much detail, we can write a simple extension as
the following:

```ocaml
open Camlp4.PreCast
open Syntax

let () =
  EXTEND Gram
    expr: LEVEL "top"
    [ [ "for"; v = a_LIDENT; "in"; m = a_UIDENT; e = expr; "do";
        seq = sequence; "done" ->
          <:expr< $uid:m$.iter (fun $lid:v$ -> $seq$) $e$ >>
      ] ];
  END
```

For what follows, it is assumed that this code is written to a file
`pa_foreach.ml`.

All the prerequisites are provided by the module
`Camlp4.PreCast`, including the `Syntax` module
that provides the terminals `a_LIDENT` and
`a_UIDENT` (for lowercase and uppercase identifiers
respectively), and the non-terminals `expr` (expressions) and
`sequence` (semicolon separated expressions). The
`Gram` module provides functions to manipulate non-terminal
rules.

Suppose we save this syntax extension in the file called
`pa_foreach.ml`. Notice that a syntax extension is just a
regular OCaml file with some fancy `EXTEND` syntax. It can be
compiled using the command:

```
ocamlc -I +camlp4 camlp4lib.cma -pp camlp4orf -c pa_foreach.ml
```

<ul><li>
FYI: Camlp4 is complicated to learn because a syntax extension consists
of two domain-specific languages that are foreign to OCaml: parsing and
code embedding. To add insult to injury, Camlp4 has a
"<a href="http://caml.inria.fr/pub/docs/manual-camlp4/manual007.html" class="external" title="http://caml.inria.fr/pub/docs/manual-camlp4/manual007.html">revised
syntax</a>" dialect of OCaml that can be used, in addition to the
original OCaml dialect, both as the host (top-level) language and as the
embedded language. This tutorial uses original OCaml as the host
language and revised dialect as the embedded language. This choice is
reflected in the camlp4 executable that we use here,
`camlp4orf`. See
<a href="http://brion.inria.fr/gallium/index.php/Using_Camlp4" class="external" title="http://brion.inria.fr/gallium/index.php/Using_Camlp4">Using
Camlp4</a> for the explanation and additional options.
</li></ul>

We can verify that it works:

```ocaml
#load "camlp4o.cma";;
(* Add directory where the syntax extension is compiled to the module
   path (not required if pa_foreach.cmo is in the current directory). *)
#directory "_build/src/html/tutorials/camlp4_3.10/";;
#load "pa_foreach.cmo";;
for s in List ["hello"; "world"] do print_endline s done;;
```

Now we have a rudimentary syntax extension. However, it is quite
restrictive. For example, it would be nice to do pattern matching like
this:

```ocaml
for (k, v) in List [(0, "hello"); (1, "world")] do
  Printf.printf "%d: %sn" k v
done
```

```ocaml
And it doesn't support `Hashtbl.iter` yet because, so far, we
can only generate functions with one argument. `Hashtbl.iter`
passes two arguments to the function, the key and the value. We will
address these issues in the next section.
```

## Supporting Multiple Patterns

We're now beginning to use Camlp4 features that are less documented. It
is useful to keep in mind that syntax extension <em>is</em> modifying
existing parsing rules, and we can't do without an understanding of how
existing rules work. It is recommended that you take a quick look at two
files in the OCaml source distribution under
`ocaml-3.10.0/camlp4/Camlp4Parsers`:

<ul><li>
`Camlp4OCamlRevisedParser.ml`; this provides the bulk of the
syntax rules.
</li>
<li>
`Camlp4OCamlParser.ml` implicitly borrows most of its rules
from `Camlp4OCamlRevisedParser`, but clears some of the rules
that are particular to the revised syntax and replaces them with the
original OCaml syntax.
</li></ul>

From these files, we can see that `ipatt` rule supplies what
we want for matching patterns, and `LIST1` modifier allows us
to take one or more patterns. There is also a `LIST0`
modifier for "zero or more" matching.

```ocaml
open Camlp4.PreCast
open Syntax

let rec mkfun _loc patts e =
  match patts with
  | p :: patts ->
      <:expr< fun $p$ -> $mkfun _loc patts e$ >>
  | [] ->
      e

let () =
  EXTEND Gram
    expr: LEVEL "top"
    [ [ "for"; patts = LIST1 ipatt; "in"; m = a_UIDENT; e = expr; "do";
        seq = sequence; "done" ->
          let f = mkfun _loc patts seq in
          <:expr< $uid:m$.iter $f$ $e$ >>
      ] ];
  END
```

In order to generate a higher-order function according to a list of
patterns, we use the helper `mkfun` that essentially
generates, for patterns `patt1` ... `pattN`,

```ocaml
fun patt1 ->
  ...
    fun pattN ->
      seq
```

which is the desugared form for `fun patt1 ... pattN -> seq`.

We can verify that pattern works:

```
ocamlc -I +camlp4 camlp4lib.cma -pp camlp4orf -c pa_foreach2.ml
```

```ocaml
#load "pa_foreach2.cmo";;
for (k, v) in List [(0, "hello"); (1, "world")] do
  Printf.printf "%d: %sn" k v
done;;
```

and that multiple arguments work:

```ocaml
let tbl = Hashtbl.create 3;;
Hashtbl.add tbl 0 "hello";;
Hashtbl.add tbl 1 "world";;
Hashtbl.add tbl 2 "foobar";;
for k v in Hashtbl tbl do
  Printf.printf "%d: %sn" k v
done;;
```

There are still some subtle problems with this approach. In the next
section, we'll discuss solutions to these problems.

## Final Touch-up

The first problem we find out is that foreach body is supposed to be a
sequence, but that doesn't work:

```ocaml
# for s in List ["hello"; "world"] do print_endline s; () done;;
Failure: "expr; expr: not allowed here, use do {...} or [|...|] to surround them"
```

The problem is due to the desugared form, which becomes:

```ocaml
  List.iter (fun s -> print_endline s; ()) ["hello"; "world"]
```

and this is ambiguous. Do we interpret the expression 
`fun s -> print_endline s; ()` as 
`(fun s -> print_endline s); ()`
or `fun s -> (print_endline (); ())`? 
In order to avoid ambiguity, we wrap the sequence using `do {*s**e**q*}`
when it is a sequence. The function `mksequence'` in
`Camlp4OCamlRevisedParser.ml` provides some inspiration how
to handle this.

<ul><li>
FYI: see
<a href="http://caml.inria.fr/pub/ml-archives/caml-list/2007/07/40966461d8ade5dcee6790fa32cc9983.en.html" title="http://caml.inria.fr/pub/ml-archives/caml-list/2007/07/40966461d8ade5dcee6790fa32cc9983.en.html">this
post</a> by Nicolas Pouillard for a discussion of a similar issue.
</li></ul>

We also notice that the original for-loop syntax ceases working:

```ocaml
# for i = 0 to 5 do print_int i done;;
Parse error: [ipatt] or [a_LIDENT] expected after "for" (in [expr])
```

<!-- FIXME: If one tries to eval the code, an error is raised by
     Errors.report_error -->

It turns out that the new rule we add for `for` doesn't play nice with
the original rule. The solution is to rewrite the original rule so it
becomes compatible with the new rule.


The code listing that addresses these issues can be found below:

```ocaml
open Camlp4.PreCast
open Syntax

let mksequence _loc = function
  | <:expr< $_$; $_$ >> as e -> <:expr< $e$ >>
  | e -> e

let rec mkfun _loc patts e =
  match patts with
  | p :: patts -> <:expr< fun $p$ -> $mkfun _loc patts e$ >>
  | [] -> mksequence _loc e

let lident_of_patt p =
  match p with
  | <:patt< $lid:i$ >> -> i
  | _ -> invalid_arg "lident_of_patt"

let () =
  DELETE_RULE Gram
  expr:
    "for"; a_LIDENT; "="; sequence; direction_flag; sequence; "do"; do_sequence
  END;

  EXTEND Gram
  expr: LEVEL "top"
    [ [ "for"; i = ipatt; "="; e1 = sequence; df = direction_flag;
        e2 = sequence; "do"; seq = do_sequence ->
         <:expr<
           for $lident_of_patt i$ =
             $mksequence _loc e1$ $to:df$ $mksequence _loc e2$
             do $seq$ done
         >>
      | "for"; p = ipatt; patts = LIST0 ipatt; "in"; m = a_UIDENT; e = expr;
        "do"; seq = do_sequence ->
         let patts = p :: patts in
         let f = mkfun _loc patts seq in
         <:expr< $uid:m$.iter $f$ $e$ >>
      ] ];
  END
```


In order for alternative rules to "fall through" correctly, rules must
share a common prefix, and the rest of the non-terminals must be
distinct enough. The way we structured the "for" syntax before, we
essentially have the following two rules:

```ocaml
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
```

Once the "for" keyword is matched, the parser proceeds to match the next
token, but `ipatt` also matches `a_LIDENT` (a
lowercase identifier is also a legal pattern). At this point, the parser
fixes on a rule (whichever comes first) and no longer backtracks to the
alternative option.

The solution is to make the original for loop always match
`ipatt`, but refuse anything except a lowercase identifier.

We can now verify that everything works as expected.

```
$ ocamlc -I +camlp4 camlp4lib.cma -pp camlp4orf -c pa_foreach3.ml
```

```ocaml
#load "pa_foreach3.cmo";;
let tbl = Hashtbl.create 3;;
Hashtbl.add tbl 0 "hello";;
Hashtbl.add tbl 1 "world";;
Hashtbl.add tbl 2 "foo";;
for k v in Hashtbl tbl do Printf.printf "%d: %sn" k v done;;
for i = 0 to 5 do print_int i done;;
for k, v in List [0, "hello"; 1, "world"; 2, "foo"] do
  Printf.printf "%d: %sn" k v
done;;
```

## Conclusion

We begin with a simple Camlp4 syntax extension for the for-each iterator
syntax, then explored further refinements to that idea that works around
parsing issues both in embedded code and in the rules.

This tutorial is written by
<a href="http://cs-people.bu.edu/liulk" class="external" title="http://cs-people.bu.edu/liulk">Likai
Liu</a>. The text has not been peer reviewed, so use this at your own
risk. Questions and comments are welcome.

