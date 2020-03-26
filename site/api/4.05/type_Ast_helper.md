<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Ast_helper.html">Ast_helper</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;lid&nbsp;=&nbsp;<span class="constructor">Longident</span>.t&nbsp;<span class="constructor">Asttypes</span>.loc<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;str&nbsp;=&nbsp;string&nbsp;<span class="constructor">Asttypes</span>.loc<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;loc&nbsp;=&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;attrs&nbsp;=&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_loc&nbsp;:&nbsp;<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="constructor">Pervasives</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;with_default_loc&nbsp;:&nbsp;<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Const</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;char&nbsp;:&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constant<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;string&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?quotation_delimiter:string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constant<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;integer&nbsp;:&nbsp;?suffix:char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constant<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;int&nbsp;:&nbsp;?suffix:char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constant<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;int32&nbsp;:&nbsp;?suffix:char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int32&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constant<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;int64&nbsp;:&nbsp;?suffix:char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constant<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;nativeint&nbsp;:&nbsp;?suffix:char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;nativeint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constant<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;float&nbsp;:&nbsp;?suffix:char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constant<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Typ</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type_desc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attr&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;any&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;var&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;arrow&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.arg_label&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;tuple&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constr&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;object_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Ast_helper</span>.str&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.attributes&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.core_type)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.closed_flag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;class_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;alias&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;variant&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.row_field&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.closed_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.label&nbsp;list&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;poly&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;package&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Ast_helper</span>.lid&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.core_type)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;force_poly&nbsp;:&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;varify_constructors&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Pat</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.pattern_desc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attr&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;any&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;var&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;alias&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constant&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constant&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;interval&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.constant&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constant&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;tuple&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;construct&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;variant&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.label&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;record&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Ast_helper</span>.lid&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.pattern)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.closed_flag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;array&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;or_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constraint_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lazy_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unpack&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;exception_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Exp</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression_desc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attr&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ident&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constant&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constant&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;let_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.rec_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.value_binding&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fun_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.arg_label&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;function_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.case&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;apply&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Asttypes</span>.arg_label&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.expression)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;match_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.case&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;try_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.case&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;tuple&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;construct&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;variant&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.label&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;record&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Ast_helper</span>.lid&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.expression)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;field&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;setfield&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;array&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ifthenelse&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sequence&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;while_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;for_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.direction_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;coerce&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constraint_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;send&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;new_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;setinstvar&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;override&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Ast_helper</span>.str&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.expression)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;letmodule&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;letexception&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension_constructor&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;assert_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lazy_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;poly&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;object_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_structure&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;newtype&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pack&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.override_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unreachable&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;case&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?guard:<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.case<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Val</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?prim:string&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.value_description<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Type</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?text:<span class="constructor">Docstrings</span>.text&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?params:(<span class="constructor">Parsetree</span>.core_type&nbsp;*&nbsp;<span class="constructor">Asttypes</span>.variance)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?cstrs:(<span class="constructor">Parsetree</span>.core_type&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;*&nbsp;<span class="constructor">Ast_helper</span>.loc)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?kind:<span class="constructor">Parsetree</span>.type_kind&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?priv:<span class="constructor">Asttypes</span>.private_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?manifest:<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.type_declaration<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constructor&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?info:<span class="constructor">Docstrings</span>.info&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?args:<span class="constructor">Parsetree</span>.constructor_arguments&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?res:<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.constructor_declaration<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;field&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?info:<span class="constructor">Docstrings</span>.info&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?mut:<span class="constructor">Asttypes</span>.mutable_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.label_declaration<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Te</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?params:(<span class="constructor">Parsetree</span>.core_type&nbsp;*&nbsp;<span class="constructor">Asttypes</span>.variance)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?priv:<span class="constructor">Asttypes</span>.private_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension_constructor&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.type_extension<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constructor&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?info:<span class="constructor">Docstrings</span>.info&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension_constructor_kind&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension_constructor<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;decl&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?info:<span class="constructor">Docstrings</span>.info&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?args:<span class="constructor">Parsetree</span>.constructor_arguments&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?res:<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension_constructor<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rebind&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?info:<span class="constructor">Docstrings</span>.info&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.extension_constructor<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Mty</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_type_desc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attr&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ident&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;alias&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;signature&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.signature&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;functor_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_type&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;with_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_type&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.with_constraint&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;typeof_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Mod</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_expr_desc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attr&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ident&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;structure&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.structure&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;functor_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_type&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;apply&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_expr&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constraint_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_expr&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unpack&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Sig</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.signature_item_desc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;value&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.value_description&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.rec_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.type_declaration&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.type_extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;exception_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension_constructor&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;module_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rec_module&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_declaration&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;modtype&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_type_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.open_description&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;include_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.include_description&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;class_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_description&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;class_type&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_type_declaration&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attribute&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;text&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.text&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature_item&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Str</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.structure_item_desc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;eval&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Parsetree</span>.attributes&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;value&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.rec_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.value_binding&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;primitive&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.value_description&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.rec_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.type_declaration&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.type_extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;exception_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension_constructor&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;module_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_binding&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rec_module&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_binding&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;modtype&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_type_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.open_description&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;class_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_declaration&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;class_type&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_type_declaration&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;include_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.include_declaration&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attribute&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;text&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.text&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure_item&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Md</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?text:<span class="constructor">Docstrings</span>.text&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.module_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_declaration<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Mtd</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?text:<span class="constructor">Docstrings</span>.text&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?typ:<span class="constructor">Parsetree</span>.module_type&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_type_declaration<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Mb</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?text:<span class="constructor">Docstrings</span>.text&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_binding<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Opn</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?override:<span class="constructor">Asttypes</span>.override_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.open_description<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Incl</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Parsetree</span>.include_infos<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Vb</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?text:<span class="constructor">Docstrings</span>.text&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.value_binding<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Cty</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_type_desc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attr&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constr&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;signature&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_signature&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;arrow&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.arg_label&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Ctf</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_type_field_desc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attr&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_type_field&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inherit_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;val_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.mutable_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.virtual_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;method_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.private_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.virtual_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constraint_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attribute&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;text&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.text&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type_field&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Cl</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_expr_desc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attr&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constr&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.lid&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;structure&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_structure&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fun_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.arg_label&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;apply&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_expr&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Asttypes</span>.arg_label&nbsp;*&nbsp;<span class="constructor">Parsetree</span>.expression)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;let_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.rec_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.value_binding&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constraint_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Cf</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_field_desc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attr&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_field&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inherit_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.override_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_expr&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;val_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.mutable_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_field_kind&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;method_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.private_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_field_kind&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;constraint_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;initializer_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.extension&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;attribute&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;text&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.text&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;virtual_&nbsp;:&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field_kind<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;concrete&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.override_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.expression&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_field_kind<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Ci</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Ast_helper</span>.loc&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?attrs:<span class="constructor">Ast_helper</span>.attrs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?docs:<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?text:<span class="constructor">Docstrings</span>.text&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?virt:<span class="constructor">Asttypes</span>.virtual_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?params:(<span class="constructor">Parsetree</span>.core_type&nbsp;*&nbsp;<span class="constructor">Asttypes</span>.variance)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Ast_helper</span>.str&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Parsetree</span>.class_infos<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Csig</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.core_type&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_type_field&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_signature<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Cstr</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.pattern&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.class_field&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.class_structure<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>