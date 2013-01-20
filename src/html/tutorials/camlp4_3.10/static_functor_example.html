<head>
<title>Camlp4 3.10 :: static_functor_example.ml</title>
</head>
<body>

<h1>Camlp4 3.10: static functor example</h1>

<p>static_functor_example.ml</p>
<pre ml:content="ocaml noeval">
type t1 = A | B
type t2 = Foo of string * t1
open Camlp4.PreCast
module Lexer = struct
  ... if you need a different lexer ...
end
module Gram = MakeGram(Lexer)
let foo = Gram.Entry.mk &quot;foo&quot;
let foo = Gram.Entry.mk &quot;foo&quot;
EXTEND Gram
  GLOBAL: foo;
  foo: [ [ &quot;foo&quot;; i = LIDENT; b = bar -&gt; Foo(i, b) ] ];
  bar: [ [ &quot;?&quot; -&gt; A | &quot;.&quot; -&gt; B ] ];
END;;
Gram.parse_string foo (Loc.mk &quot;&lt;string&gt;&quot;) &quot;foo x?&quot; = Foo(&quot;x&quot;, A)
DELETE_RULE Gram foo: &quot;foo&quot;; LIDENT; bar END
</pre>
