<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Nativeint.html">Nativeint</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;zero&nbsp;:&nbsp;nativeint
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;one&nbsp;:&nbsp;nativeint
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;minus_one&nbsp;:&nbsp;nativeint
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;neg&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%nativeint_neg"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;add&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%nativeint_add"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;sub&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%nativeint_sub"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;mul&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%nativeint_mul"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;div&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%nativeint_div"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;rem&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%nativeint_mod"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;succ&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pred&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;abs&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;size&nbsp;:&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;max_int&nbsp;:&nbsp;nativeint
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;min_int&nbsp;:&nbsp;nativeint
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;logand&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%nativeint_and"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;logor&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%nativeint_or"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;logxor&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%nativeint_xor"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lognot&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;shift_left&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%nativeint_lsl"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;shift_right&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%nativeint_asr"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;shift_right_logical&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"%nativeint_lsr"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;of_int&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%nativeint_of_int"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;to_int&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%nativeint_to_int"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;of_float&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"caml_nativeint_of_float"</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="string">"caml_nativeint_of_float_unboxed"</span>&nbsp;[@@unboxed]&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;to_float&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_nativeint_to_float"</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="string">"caml_nativeint_to_float_unboxed"</span>&nbsp;[@@unboxed]&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;of_int32&nbsp;:&nbsp;int32&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%nativeint_of_int32"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;to_int32&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int32&nbsp;=&nbsp;<span class="string">"%nativeint_to_int32"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;of_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"caml_nativeint_of_string"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;to_string&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=&nbsp;nativeint
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare&nbsp;:&nbsp;<span class="constructor">Nativeint</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Nativeint</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;equal&nbsp;:&nbsp;<span class="constructor">Nativeint</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Nativeint</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;format&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;=&nbsp;<span class="string">"caml_nativeint_format"</span>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>