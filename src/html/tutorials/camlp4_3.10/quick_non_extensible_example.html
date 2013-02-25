<head>
<title>Camlp4 3.10 :: quick_non_extensible_example.ml</title>
</head>
<body>

<h1>Camlp4 3.10: quick non extensible example</h1>


<p>quick_non_extensible_example.ml</p>
<pre ml:content="ocaml noeval">
(* This scheme only works when the grammar value is not really
   used for other things than entry creation. In fact grammars
   are now static by default. *)
type t1 = A | B
type t2 = Foo of string * t1
open Camlp4.PreCast
open Syntax
let foo = Gram.Entry.mk &quot;foo&quot;
let bar = Gram.Entry.mk &quot;bar&quot;
EXTEND Gram
  GLOBAL: foo bar;
  foo: [ [ &quot;foo&quot;; i = LIDENT; b = bar -&gt; Foo(i, b) ] ];
  bar: [ [ &quot;?&quot; -&gt; A | &quot;.&quot; -&gt; B ] ];
END;;
Gram.parse_string foo (Loc.mk &quot;&lt;string&gt;&quot;) &quot;foo x?&quot; = Foo(&quot;x&quot;, A)
DELETE_RULE Gram foo: &quot;foo&quot;; LIDENT; bar END
</pre>
