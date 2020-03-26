<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Ast_helper.Te.html">Ast_helper.Te</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?params:(<span class="constructor">Parsetree</span>.core_type&nbsp;*&nbsp;<span class="constructor">Asttypes</span>.variance)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?priv:<span class="constructor">Asttypes</span>.private_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension_constructor&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.type_extension<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constructor&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?info:<span class="constructor">Docstrings</span>.info&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension_constructor_kind&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension_constructor<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;decl&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?info:<span class="constructor">Docstrings</span>.info&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?args:<span class="constructor">Parsetree</span>.constructor_arguments&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?res:<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension_constructor<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rebind&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?info:<span class="constructor">Docstrings</span>.info&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension_constructor<br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>