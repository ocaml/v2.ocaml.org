<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Marshal.html">Marshal</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;extern_flags&nbsp;=&nbsp;<span class="constructor">No_sharing</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Closures</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Compat_32</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;to_channel&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Marshal</span>.extern_flags&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;to_bytes&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Marshal</span>.extern_flags&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes<br>
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_output_value_to_bytes"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;to_string&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Marshal</span>.extern_flags&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_output_value_to_string"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;to_buffer&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Marshal</span>.extern_flags&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;from_channel&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;from_bytes&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;from_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;header_size&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;data_size&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;total_size&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>