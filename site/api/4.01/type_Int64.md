<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Int64.html">Int64</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;zero&nbsp;:&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;one&nbsp;:&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;minus_one&nbsp;:&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;neg&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_neg"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;add&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_add"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;sub&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_sub"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;mul&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_mul"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;div&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_div"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;rem&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_mod"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;succ&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pred&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;abs&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;max_int&nbsp;:&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;min_int&nbsp;:&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;logand&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_and"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;logor&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_or"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;logxor&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_xor"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lognot&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;shift_left&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_lsl"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;shift_right&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_asr"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;shift_right_logical&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_lsr"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;of_int&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_of_int"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;to_int&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%int64_to_int"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;of_float&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"caml_int64_of_float"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;to_float&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_int64_to_float"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;of_int32&nbsp;:&nbsp;int32&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_of_int32"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;to_int32&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int32&nbsp;=&nbsp;<span class="string">"%int64_to_int32"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;of_nativeint&nbsp;:&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"%int64_of_nativeint"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;to_nativeint&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;=&nbsp;<span class="string">"%int64_to_nativeint"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;of_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"caml_int64_of_string"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;to_string&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;bits_of_float&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;=&nbsp;<span class="string">"caml_int64_bits_of_float"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;float_of_bits&nbsp;:&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_int64_float_of_bits"</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare&nbsp;:&nbsp;<span class="constructor">Int64</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Int64</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;format&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;=&nbsp;<span class="string">"caml_int64_format"</span><br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>