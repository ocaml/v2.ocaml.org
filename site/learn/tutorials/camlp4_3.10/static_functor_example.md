<!-- ((! set title Camlp4 3.10   !)) ((! set learn !)) -->

# Camlp4 3.10: static functor example
static_functor_example.ml

```ocaml
type t1 = A | B
type t2 = Foo of string * t1
open Camlp4.PreCast
module Lexer = struct
  ... if you need a different lexer ...
end
module Gram = MakeGram(Lexer)
let foo = Gram.Entry.mk "foo"
let foo = Gram.Entry.mk "foo"
EXTEND Gram
  GLOBAL: foo;
  foo: [ [ "foo"; i = LIDENT; b = bar -> Foo(i, b) ] ];
  bar: [ [ "?" -> A | "." -> B ] ];
END;;
Gram.parse_string foo (Loc.mk "<string>") "foo x?" = Foo("x", A)
DELETE_RULE Gram foo: "foo"; LIDENT; bar END
```
