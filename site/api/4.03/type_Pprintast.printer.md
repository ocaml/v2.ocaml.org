<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Pprintast.printer.html">Pprintast.printer</a></div><ul></ul></nav></header>
<code class="code">unit&nbsp;<span class="keywordsign">-&gt;</span>
<span class="keyword">object</span>&nbsp;(<span class="keywordsign">'</span>b)
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pipe&nbsp;:&nbsp;bool
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;semi&nbsp;:&nbsp;bool
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;attribute&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;attributes&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attributes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;binding&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.value_binding&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;bindings&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.rec_flag&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.value_binding&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;case_list&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.case&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;class_expr&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;class_field&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;class_params_def&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Parsetree</span>.core_type&nbsp;*&nbsp;<span class="constructor">Asttypes</span>.variance)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;class_signature&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_signature&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;class_structure&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_structure&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;class_type&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;class_type_declaration_list&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type_declaration&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;constant&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constant&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;constant_string&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;constructor_declaration&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.constructor_arguments&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;option&nbsp;*
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.attributes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;core_type&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;core_type1&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;direction_flag&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Asttypes</span>.direction_flag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;directive_argument&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.directive_argument&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;exception_declaration&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension_constructor&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;expression&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;expression1&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;expression2&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;extension&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;extension_constructor&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension_constructor&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;floating_attribute&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;item_attribute&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;item_attributes&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attributes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;item_extension&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;label_exp&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.arg_label&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;option&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;label_x_expression_param&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Asttypes</span>.arg_label&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;list&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;?sep:<span class="constructor">Pprintast</span>.space_formatter&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;?first:<span class="constructor">Pprintast</span>.space_formatter&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;?last:<span class="constructor">Pprintast</span>.space_formatter&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;longident&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Longident</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;longident_loc&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Longident</span>.t&nbsp;<span class="constructor">Asttypes</span>.loc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;module_expr&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;module_type&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;mutable_flag&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Asttypes</span>.mutable_flag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;nonrec_flag&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Asttypes</span>.rec_flag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;option&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;?first:<span class="constructor">Pprintast</span>.space_formatter&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;?last:<span class="constructor">Pprintast</span>.space_formatter&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;paren&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;?first:<span class="constructor">Pprintast</span>.space_formatter&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;?last:<span class="constructor">Pprintast</span>.space_formatter&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;pattern&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;pattern1&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;payload&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.payload&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;private_flag&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Asttypes</span>.private_flag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;rec_flag&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Asttypes</span>.rec_flag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;record_declaration&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.label_declaration&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;reset&nbsp;:&nbsp;<span class="keywordsign">'</span>b
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;reset_ifthenelse&nbsp;:&nbsp;<span class="keywordsign">'</span>b
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;reset_pipe&nbsp;:&nbsp;<span class="keywordsign">'</span>b
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;reset_semi&nbsp;:&nbsp;<span class="keywordsign">'</span>b
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;signature&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;signature_item&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;simple_expr&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;simple_pattern&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;string_quot&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Asttypes</span>.label&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;structure&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;structure_item&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;sugar_expr&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;toplevel_phrase&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.toplevel_phrase&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;type_declaration&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.type_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;type_def_list&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.rec_flag&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.type_declaration&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;type_extension&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.type_extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;type_param&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;*&nbsp;<span class="constructor">Asttypes</span>.variance&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;type_params&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Parsetree</span>.core_type&nbsp;*&nbsp;<span class="constructor">Asttypes</span>.variance)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;type_with_label&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Asttypes</span>.arg_label&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;tyvar&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;under_ifthenelse&nbsp;:&nbsp;<span class="keywordsign">'</span>b
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;under_pipe&nbsp;:&nbsp;<span class="keywordsign">'</span>b
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;under_semi&nbsp;:&nbsp;<span class="keywordsign">'</span>b
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;value_description&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.value_description&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">method</span>&nbsp;virtual_flag&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Asttypes</span>.virtual_flag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>