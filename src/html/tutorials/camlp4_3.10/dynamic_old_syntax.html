<head>
<title>Camlp4 3.10/dynamic_old_syntax.ml</title>
</head>
<body>

<h1>Camlp4 3.10 dynamic_old_syntax.ml</h1>

<p>dynamic_old_syntax.ml:</p>
<pre ml:content="ocaml noeval">
type t1 = A | B
type t2 = Foo of string * t1
open Pcaml
let foo = Entry.mk gram &quot;foo&quot;
let bar = Entry.mk gram &quot;bar&quot;
EXTEND
  GLOBAL: foo bar;
  foo: [ [ &quot;foo&quot;; i = LIDENT; b = bar -&gt; Foo(i, b) ] ];
  bar: [ [ &quot;?&quot; -&gt; A | &quot;.&quot; -&gt; B ] ];
END;;
Entry.parse foo (Stream.of_string &quot;foo x?&quot;) = Foo(&quot;x&quot;, A)
DELETE_RULE foo: &quot;foo&quot;; LIDENT; bar END
</pre>
