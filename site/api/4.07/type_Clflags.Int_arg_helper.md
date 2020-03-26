<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Clflags.Int_arg_helper.html">Clflags.Int_arg_helper</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;parsed<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;parse_result&nbsp;=&nbsp;<span class="constructor">Ok</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Parse_failed</span>&nbsp;<span class="keyword">of</span>&nbsp;exn<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_no_error&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parse_result<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get&nbsp;:&nbsp;key:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>