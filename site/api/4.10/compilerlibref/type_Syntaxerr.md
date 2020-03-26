<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Syntaxerr.html">Syntaxerr</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;error&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unclosed</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;*&nbsp;string&nbsp;*&nbsp;<span class="constructor">Location</span>.t&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Expecting</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Not_expecting</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Applicative_path</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Variable_in_scope</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Other</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Ill_formed_ast</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Invalid_package_type</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Error</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Syntaxerr</span>.error<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Escape_error</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;location_of_error&nbsp;:&nbsp;<span class="constructor">Syntaxerr</span>.error&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ill_formed_ast&nbsp;:&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>