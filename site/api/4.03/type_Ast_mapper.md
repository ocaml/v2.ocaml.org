<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Ast_mapper.html">Ast_mapper</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;mapper&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;attribute&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute;
&nbsp;&nbsp;&nbsp;&nbsp;attributes&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;list;
&nbsp;&nbsp;&nbsp;&nbsp;case&nbsp;:&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.case&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.case;
&nbsp;&nbsp;&nbsp;&nbsp;cases&nbsp;:&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.case&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.case&nbsp;list;
&nbsp;&nbsp;&nbsp;&nbsp;class_declaration&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_declaration;
&nbsp;&nbsp;&nbsp;&nbsp;class_description&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_description&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_description;
&nbsp;&nbsp;&nbsp;&nbsp;class_expr&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_expr;
&nbsp;&nbsp;&nbsp;&nbsp;class_field&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field;
&nbsp;&nbsp;&nbsp;&nbsp;class_signature&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_signature&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_signature;
&nbsp;&nbsp;&nbsp;&nbsp;class_structure&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_structure&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_structure;
&nbsp;&nbsp;&nbsp;&nbsp;class_type&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type;
&nbsp;&nbsp;&nbsp;&nbsp;class_type_declaration&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_type_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type_declaration;
&nbsp;&nbsp;&nbsp;&nbsp;class_type_field&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_type_field&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type_field;
&nbsp;&nbsp;&nbsp;&nbsp;constructor_declaration&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.constructor_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constructor_declaration;
&nbsp;&nbsp;&nbsp;&nbsp;expr&nbsp;:&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression;
&nbsp;&nbsp;&nbsp;&nbsp;extension&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension;
&nbsp;&nbsp;&nbsp;&nbsp;extension_constructor&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension_constructor&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension_constructor;
&nbsp;&nbsp;&nbsp;&nbsp;include_declaration&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.include_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.include_declaration;
&nbsp;&nbsp;&nbsp;&nbsp;include_description&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.include_description&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.include_description;
&nbsp;&nbsp;&nbsp;&nbsp;label_declaration&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.label_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.label_declaration;
&nbsp;&nbsp;&nbsp;&nbsp;location&nbsp;:&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t;
&nbsp;&nbsp;&nbsp;&nbsp;module_binding&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_binding&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_binding;
&nbsp;&nbsp;&nbsp;&nbsp;module_declaration&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_declaration;
&nbsp;&nbsp;&nbsp;&nbsp;module_expr&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr;
&nbsp;&nbsp;&nbsp;&nbsp;module_type&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type;
&nbsp;&nbsp;&nbsp;&nbsp;module_type_declaration&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_type_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type_declaration;
&nbsp;&nbsp;&nbsp;&nbsp;open_description&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.open_description&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.open_description;
&nbsp;&nbsp;&nbsp;&nbsp;pat&nbsp;:&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern;
&nbsp;&nbsp;&nbsp;&nbsp;payload&nbsp;:&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.payload&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.payload;
&nbsp;&nbsp;&nbsp;&nbsp;signature&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature;
&nbsp;&nbsp;&nbsp;&nbsp;signature_item&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.signature_item&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item;
&nbsp;&nbsp;&nbsp;&nbsp;structure&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure;
&nbsp;&nbsp;&nbsp;&nbsp;structure_item&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.structure_item&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item;
&nbsp;&nbsp;&nbsp;&nbsp;typ&nbsp;:&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type;
&nbsp;&nbsp;&nbsp;&nbsp;type_declaration&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.type_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.type_declaration;
&nbsp;&nbsp;&nbsp;&nbsp;type_extension&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.type_extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.type_extension;
&nbsp;&nbsp;&nbsp;&nbsp;type_kind&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.type_kind&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.type_kind;
&nbsp;&nbsp;&nbsp;&nbsp;value_binding&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.value_binding&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.value_binding;
&nbsp;&nbsp;&nbsp;&nbsp;value_description&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.value_description&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.value_description;
&nbsp;&nbsp;&nbsp;&nbsp;with_constraint&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.with_constraint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.with_constraint;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_mapper&nbsp;:&nbsp;<span class="constructor">Ast_mapper</span>.mapper
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;tool_name&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;apply&nbsp;:&nbsp;source:string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;target:string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_mapper</span>.mapper&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;run_main&nbsp;:&nbsp;(string&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_mapper</span>.mapper)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;register_function&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(string&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_mapper</span>.mapper)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;register&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(string&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_mapper</span>.mapper)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;map_opt&nbsp;:&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;option
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension_of_error&nbsp;:&nbsp;<span class="constructor">Location</span>.error&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attribute_of_warning&nbsp;:&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;add_ppx_context_str&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;tool_name:string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;add_ppx_context_sig&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;tool_name:string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;drop_ppx_context_str&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;restore:bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;drop_ppx_context_sig&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;restore:bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_cookie&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_cookie&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;option
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>