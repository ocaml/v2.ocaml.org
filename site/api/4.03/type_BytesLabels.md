<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="BytesLabels.html">BytesLabels</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;length&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%string_length"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;get&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;=&nbsp;<span class="string">"%string_safe_get"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;set&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"%string_safe_set"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;create&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;=&nbsp;<span class="string">"caml_create_string"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;make&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;init&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;f:(int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;empty&nbsp;:&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;copy&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;of_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;to_string&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sub&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;pos:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;len:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sub_string&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fill&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;pos:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;len:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;blit&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;src:bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;src_pos:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;dst:bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;dst_pos:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;len:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;concat&nbsp;:&nbsp;sep:bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;iter&nbsp;:&nbsp;f:(char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;iteri&nbsp;:&nbsp;f:(int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;map&nbsp;:&nbsp;f:(char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mapi&nbsp;:&nbsp;f:(int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;trim&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;escaped&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;index&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rindex&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;index_from&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rindex_from&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;contains&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;contains_from&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rcontains_from&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;uppercase&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lowercase&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;capitalize&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;uncapitalize&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=&nbsp;bytes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare&nbsp;:&nbsp;<span class="constructor">BytesLabels</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">BytesLabels</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;unsafe_get&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;=&nbsp;<span class="string">"%string_unsafe_get"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;unsafe_set&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"%string_unsafe_set"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;unsafe_blit&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;src:bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;src_pos:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;dst:bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;dst_pos:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;len:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_blit_string"</span>&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;unsafe_fill&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;pos:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;len:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_fill_string"</span>&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unsafe_to_string&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unsafe_of_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>