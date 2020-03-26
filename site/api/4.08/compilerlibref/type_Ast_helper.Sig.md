<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Ast_helper.Sig.html">Ast_helper.Sig</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.signature_item_desc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;value&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.value_description&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.rec_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.type_declaration&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_subst&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.type_declaration&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.type_extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;exception_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.type_exception&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;module_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mod_subst&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_substitution&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rec_module&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_declaration&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;modtype&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_type_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.open_description&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;include_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.include_description&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;class_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_description&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;class_type&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_type_declaration&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attribute&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;text&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.text&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item&nbsp;list<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>