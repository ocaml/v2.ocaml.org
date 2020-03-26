<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Obj.html">Obj</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;repr&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Obj</span>.t&nbsp;=&nbsp;<span class="string">"%identity"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;obj&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;=&nbsp;<span class="string">"%identity"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;magic&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;=&nbsp;<span class="string">"%identity"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;is_block&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"caml_obj_is_block"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;is_int&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%obj_is_int"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;tag&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_obj_tag"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;set_tag&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_obj_set_tag"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;size&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%obj_size"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;field&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Obj</span>.t&nbsp;=&nbsp;<span class="string">"%obj_field"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;set_field&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"%obj_set_field"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;double_field&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_double_field&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;new_block&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Obj</span>.t&nbsp;=&nbsp;<span class="string">"caml_obj_block"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;dup&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Obj</span>.t&nbsp;=&nbsp;<span class="string">"caml_obj_dup"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;truncate&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_obj_truncate"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;add_offset&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Int32</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Obj</span>.t&nbsp;=&nbsp;<span class="string">"caml_obj_add_offset"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lazy_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;closure_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;object_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;infix_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;forward_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;no_scan_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;abstract_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;string_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;double_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;double_array_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;custom_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;final_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;int_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;out_of_heap_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unaligned_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension_name&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension_id&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension_slot&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Obj</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;marshal&nbsp;:&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unmarshal&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Obj</span>.t&nbsp;*&nbsp;int<br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>