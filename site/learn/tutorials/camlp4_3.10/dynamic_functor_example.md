<!-- ((! set title Camlp4 3.10  !)) ((! set learn !)) -->

# Camlp4 3.10 dynamic_functor_example.ml
dynamic_functor_example.ml:

```ocaml
type t1 = A | B
type t2 = Foo of string * t1
open Camlp4

module Id = struct (* Information for dynamic loading *)
  let name = "My_extension"
  let version = "$Id$"
end

(* An extension is just a functor: Syntax -> Syntax *)
module Make (Syntax : Sig.Syntax) = struct
  include Syntax
  let foo = Gram.Entry.mk "foo"
  let bar = Gram.Entry.mk "bar"
  open Camlp4.Sig
  EXTEND Gram
    GLOBAL: foo bar;
    foo: [ [ "foo"; i = LIDENT; b = bar -> Foo(i, b) ] ];
    bar: [ [ "?" -> A | "." -> B ] ];
  END;;
  Gram.parse_string foo (Loc.mk "<string>") "foo x?" = Foo("x", A)
  DELETE_RULE Gram foo: "foo"; LIDENT; bar END
end

(* Register it to make it usable via the camlp4 binary. *)
module M = Register.SyntaxExtension(Id)(Make)

```
