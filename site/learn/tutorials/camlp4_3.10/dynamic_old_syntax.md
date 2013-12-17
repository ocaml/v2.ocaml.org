<!-- ((! set title Camlp4 3.10  !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Camlp4 3.10 dynamic_old_syntax.ml
dynamic_old_syntax.ml:

```ocamltop
#load "camlp4o.cma";;
type t1 = A | B
type t2 = Foo of string * t1
open Pcaml
let foo = Entry.mk gram "foo"
let bar = Entry.mk gram "bar"
EXTEND
  GLOBAL: foo bar;
  foo: [ [ "foo"; i = LIDENT; b = bar -> Foo(i, b) ] ];
  bar: [ [ "?" -> A | "." -> B ] ];
END;;
Entry.parse foo (Stream.of_string "foo x?") = Foo("x", A)
DELETE_RULE foo: "foo"; LIDENT; bar END

```
