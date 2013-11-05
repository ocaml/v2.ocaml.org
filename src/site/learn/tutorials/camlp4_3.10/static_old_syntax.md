<head>
<title>Camlp4 3.10 :: static_old_syntax.ml</title>
</head>
<body>

<h1>Camlp4 3.10: static old syntax</h1>

<p>static_old_syntax.ml:</p>
<pre ml:content="ocaml noeval">
type t1 = A | B
type t2 = Foo of string * t1
module Gram = Grammar.GMake(...)
let foo = Gram.Entry.mk &quot;foo&quot;
let bar = Gram.Entry.mk &quot;bar&quot;
GEXTEND Gram
  GLOBAL: foo bor;
  foo: [ [ &quot;foo&quot;; i = LIDENT; b = bar -&gt; Foo(i, b) ] ];
  bar: [ [ &quot;?&quot; -&gt; A | &quot;.&quot; -&gt; B ] ];
END;;
Gram.Entry.parse foo (Stream.of_string &quot;foo x?&quot;) = Foo(&quot;x&quot;, A)
GDELETE_RULE Gram foo: &quot;foo&quot;; LIDENT; bar END
</pre>

  
 
