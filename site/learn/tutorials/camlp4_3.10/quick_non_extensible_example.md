<!-- ((! set title Camlp4 3.10   !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Camlp4 3.10: quick non extensible example
quick_non_extensible_example.ml

```ocaml
(* This scheme only works when the grammar value is not really
   used for other things than entry creation. In fact grammars
   are now static by default. *)
type t1 = A | B
type t2 = Foo of string * t1
open Camlp4.PreCast
open Syntax
let foo = Gram.Entry.mk "foo"
let bar = Gram.Entry.mk "bar"
EXTEND Gram
  GLOBAL: foo bar;
  foo: [ [ "foo"; i = LIDENT; b = bar -> Foo(i, b) ] ];
  bar: [ [ "?" -> A | "." -> B ] ];
END;;
Gram.parse_string foo (Loc.mk "<string>") "foo x?" = Foo("x", A)
DELETE_RULE Gram foo: "foo"; LIDENT; bar END

```
