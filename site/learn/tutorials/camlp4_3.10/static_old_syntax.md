<!-- ((! set title Static Old Syntax !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Static Old Syntax

**Deprecation Warning:** this tutorial describes technology that is considered obsolete. It's been replaced by [extensions points and ppx rewriters](/releases/latest/manual.html/extn.html#sec243)

static_old_syntax.ml:

```ocaml
type t1 = A | B
type t2 = Foo of string * t1
module Gram = Grammar.GMake(...)
let foo = Gram.Entry.mk "foo"
let bar = Gram.Entry.mk "bar"
let () =
  GEXTEND Gram
    GLOBAL: foo bor;
    foo: [ [ "foo"; i = LIDENT; b = bar -> Foo(i, b) ] ];
    bar: [ [ "?" -> A | "." -> B ] ];
  END;;
Gram.Entry.parse foo (Stream.of_string "foo x?") = Foo("x", A);;
GDELETE_RULE Gram foo: "foo"; LIDENT; bar END
```
