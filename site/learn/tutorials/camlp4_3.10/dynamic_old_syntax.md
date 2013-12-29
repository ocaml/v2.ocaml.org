<!-- ((! set title Dynamic Old Syntax !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Dynamic Old Syntax

dynamic_old_syntax.ml:

```ocaml
(* #load "camlp4orf.cma" *)
type t1 = A | B
type t2 = Foo of string * t1
open Pcaml
let foo = Entry.mk gram "foo"
let bar = Entry.mk gram "bar"
let () =
  EXTEND
    GLOBAL: foo bar;
    foo: [ [ "foo"; i = LIDENT; b = bar -> Foo(i, b) ] ];
    bar: [ [ "?" -> A | "." -> B ] ];
  END;;
Entry.parse foo (Stream.of_string "foo x?") = Foo("x", A);;
DELETE_RULE foo: "foo"; LIDENT; bar END;;
```
