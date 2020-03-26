<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Warnings.html">Warnings</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Comment_start</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Comment_not_end</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Deprecated</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Fragile_match</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Partial_application</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Labels_omitted</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Method_override</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Partial_match</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Non_closed_record_pattern</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Statement_type</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_match</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_pat</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Instance_variable_override</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Illegal_backslash</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Implicit_public_methods</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unerasable_optional_argument</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Undeclared_virtual_method</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Not_principal</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Without_principality</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_argument</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Nonreturning_statement</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Preprocessor</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Useless_record_with</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Bad_module_name</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">All_clauses_guarded</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_var</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_var_strict</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Wildcard_arg_to_constant_constr</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Eol_in_string</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Duplicate_definitions</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;string&nbsp;*&nbsp;string&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Multiple_definition</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;string&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_value_declaration</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_open</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_type_declaration</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_for_index</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_ancestor</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_constructor</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;bool&nbsp;*&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_extension</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;bool&nbsp;*&nbsp;bool&nbsp;*&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_rec_flag</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Name_out_of_scope</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;string&nbsp;list&nbsp;*&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Ambiguous_name</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;list&nbsp;*&nbsp;string&nbsp;list&nbsp;*&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Disambiguated_name</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Nonoptional_label</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Open_shadow_identifier</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Open_shadow_label_constructor</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Bad_env_variable</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Attribute_payload</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Eliminated_optional_arguments</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">No_cmi_file</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;string&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Bad_docstring</span>&nbsp;<span class="keyword">of</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Expect_tailcall</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Fragile_literal_pattern</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Misplaced_attribute</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Duplicated_attribute</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Inlining_impossible</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unreachable_case</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Ambiguous_pattern</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">No_cmx_file</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Assignment_to_non_mutable_value</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unused_module</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unboxable_type_in_prim_decl</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_options&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;is_active&nbsp;:&nbsp;<span class="constructor">Warnings</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;is_error&nbsp;:&nbsp;<span class="constructor">Warnings</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;defaults_w&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;defaults_warn_error&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Warnings</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Errors</span>&nbsp;<span class="keyword">of</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;check_fatal&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;reset_fatal&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;help_warnings&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;state<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;backup&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Warnings</span>.state<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;restore&nbsp;:&nbsp;<span class="constructor">Warnings</span>.state&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>