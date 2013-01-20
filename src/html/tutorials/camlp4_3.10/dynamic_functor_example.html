<head>
<title>Camlp4 3.10 dynamic_functor_example.ml</title>
</head>
<body>

<h1>Camlp4 3.10 dynamic_functor_example.ml</h1>

<p>dynamic_functor_example.ml:</p>
<pre ml:content="ocaml noeval">
type t1 = A | B
type t2 = Foo of string * t1
open Camlp4

module Id = struct (* Information for dynamic loading *)
  let name = &quot;My_extension&quot;
  let version = &quot;$Id$&quot;
end

(* An extension is just a functor: Syntax -&gt; Syntax *)
module Make (Syntax : Sig.Syntax) = struct
  include Syntax
  let foo = Gram.Entry.mk &quot;foo&quot;
  let bar = Gram.Entry.mk &quot;bar&quot;
  open Camlp4.Sig
  EXTEND Gram
    GLOBAL: foo bar;
    foo: [ [ &quot;foo&quot;; i = LIDENT; b = bar -&gt; Foo(i, b) ] ];
    bar: [ [ &quot;?&quot; -&gt; A | &quot;.&quot; -&gt; B ] ];
  END;;
  Gram.parse_string foo (Loc.mk &quot;&lt;string&gt;&quot;) &quot;foo x?&quot; = Foo(&quot;x&quot;, A)
  DELETE_RULE Gram foo: &quot;foo&quot;; LIDENT; bar END
end

(* Register it to make it usable via the camlp4 binary. *)
module M = Register.SyntaxExtension(Id)(Make)
</pre>
