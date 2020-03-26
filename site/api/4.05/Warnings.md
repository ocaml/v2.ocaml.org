<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Warnings</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Warnings.html">Warnings</a></h1>

<pre><span class="keyword">module</span> Warnings: <code class="code"><span class="keyword">sig</span></code> <a href="Warnings.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><code><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Comment_start"><span class="constructor">Comment_start</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Comment_not_end"><span class="constructor">Comment_not_end</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Deprecated"><span class="constructor">Deprecated</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Fragile_match"><span class="constructor">Fragile_match</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Partial_application"><span class="constructor">Partial_application</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Labels_omitted"><span class="constructor">Labels_omitted</span></span> <span class="keyword">of</span> <code class="type">string list</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Method_override"><span class="constructor">Method_override</span></span> <span class="keyword">of</span> <code class="type">string list</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Partial_match"><span class="constructor">Partial_match</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Non_closed_record_pattern"><span class="constructor">Non_closed_record_pattern</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Statement_type"><span class="constructor">Statement_type</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_match"><span class="constructor">Unused_match</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_pat"><span class="constructor">Unused_pat</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Instance_variable_override"><span class="constructor">Instance_variable_override</span></span> <span class="keyword">of</span> <code class="type">string list</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Illegal_backslash"><span class="constructor">Illegal_backslash</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Implicit_public_methods"><span class="constructor">Implicit_public_methods</span></span> <span class="keyword">of</span> <code class="type">string list</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unerasable_optional_argument"><span class="constructor">Unerasable_optional_argument</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Undeclared_virtual_method"><span class="constructor">Undeclared_virtual_method</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Not_principal"><span class="constructor">Not_principal</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Without_principality"><span class="constructor">Without_principality</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_argument"><span class="constructor">Unused_argument</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Nonreturning_statement"><span class="constructor">Nonreturning_statement</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Preprocessor"><span class="constructor">Preprocessor</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Useless_record_with"><span class="constructor">Useless_record_with</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Bad_module_name"><span class="constructor">Bad_module_name</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.All_clauses_guarded"><span class="constructor">All_clauses_guarded</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_var"><span class="constructor">Unused_var</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_var_strict"><span class="constructor">Unused_var_strict</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Wildcard_arg_to_constant_constr"><span class="constructor">Wildcard_arg_to_constant_constr</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Eol_in_string"><span class="constructor">Eol_in_string</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Duplicate_definitions"><span class="constructor">Duplicate_definitions</span></span> <span class="keyword">of</span> <code class="type">string * string * string * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Multiple_definition"><span class="constructor">Multiple_definition</span></span> <span class="keyword">of</span> <code class="type">string * string * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_value_declaration"><span class="constructor">Unused_value_declaration</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_open"><span class="constructor">Unused_open</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_type_declaration"><span class="constructor">Unused_type_declaration</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_for_index"><span class="constructor">Unused_for_index</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_ancestor"><span class="constructor">Unused_ancestor</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_constructor"><span class="constructor">Unused_constructor</span></span> <span class="keyword">of</span> <code class="type">string * bool * bool</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_extension"><span class="constructor">Unused_extension</span></span> <span class="keyword">of</span> <code class="type">string * bool * bool * bool</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_rec_flag"><span class="constructor">Unused_rec_flag</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Name_out_of_scope"><span class="constructor">Name_out_of_scope</span></span> <span class="keyword">of</span> <code class="type">string * string list * bool</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Ambiguous_name"><span class="constructor">Ambiguous_name</span></span> <span class="keyword">of</span> <code class="type">string list * string list * bool</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Disambiguated_name"><span class="constructor">Disambiguated_name</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Nonoptional_label"><span class="constructor">Nonoptional_label</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Open_shadow_identifier"><span class="constructor">Open_shadow_identifier</span></span> <span class="keyword">of</span> <code class="type">string * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Open_shadow_label_constructor"><span class="constructor">Open_shadow_label_constructor</span></span> <span class="keyword">of</span> <code class="type">string * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Bad_env_variable"><span class="constructor">Bad_env_variable</span></span> <span class="keyword">of</span> <code class="type">string * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Attribute_payload"><span class="constructor">Attribute_payload</span></span> <span class="keyword">of</span> <code class="type">string * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Eliminated_optional_arguments"><span class="constructor">Eliminated_optional_arguments</span></span> <span class="keyword">of</span> <code class="type">string list</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.No_cmi_file"><span class="constructor">No_cmi_file</span></span> <span class="keyword">of</span> <code class="type">string * string option</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Bad_docstring"><span class="constructor">Bad_docstring</span></span> <span class="keyword">of</span> <code class="type">bool</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Expect_tailcall"><span class="constructor">Expect_tailcall</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Fragile_literal_pattern"><span class="constructor">Fragile_literal_pattern</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Misplaced_attribute"><span class="constructor">Misplaced_attribute</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Duplicated_attribute"><span class="constructor">Duplicated_attribute</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Inlining_impossible"><span class="constructor">Inlining_impossible</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unreachable_case"><span class="constructor">Unreachable_case</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Ambiguous_pattern"><span class="constructor">Ambiguous_pattern</span></span> <span class="keyword">of</span> <code class="type">string list</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.No_cmx_file"><span class="constructor">No_cmx_file</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Assignment_to_non_mutable_value"><span class="constructor">Assignment_to_non_mutable_value</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unused_module"><span class="constructor">Unused_module</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Unboxable_type_in_prim_decl"><span class="constructor">Unboxable_type_in_prim_decl</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr></tbody></table>



<pre><span id="VALparse_options"><span class="keyword">val</span> parse_options</span> : <code class="type">bool -&gt; string -&gt; unit</code></pre>
<pre><span id="VALis_active"><span class="keyword">val</span> is_active</span> : <code class="type"><a href="Warnings.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALis_error"><span class="keyword">val</span> is_error</span> : <code class="type"><a href="Warnings.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALdefaults_w"><span class="keyword">val</span> defaults_w</span> : <code class="type">string</code></pre>
<pre><span id="VALdefaults_warn_error"><span class="keyword">val</span> defaults_warn_error</span> : <code class="type">string</code></pre>
<pre><span id="VALprint"><span class="keyword">val</span> print</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Warnings.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="EXCEPTIONErrors"><span class="keyword">exception</span> Errors</span> <span class="keyword">of</span> <code class="type">int</code></pre>

<pre><span id="VALcheck_fatal"><span class="keyword">val</span> check_fatal</span> : <code class="type">unit -&gt; unit</code></pre>
<pre><span id="VALreset_fatal"><span class="keyword">val</span> reset_fatal</span> : <code class="type">unit -&gt; unit</code></pre>
<pre><span id="VALhelp_warnings"><span class="keyword">val</span> help_warnings</span> : <code class="type">unit -&gt; unit</code></pre>
<pre><span id="TYPEstate"><span class="keyword">type</span> <code class="type"></code>state</span> </pre>


<pre><span id="VALbackup"><span class="keyword">val</span> backup</span> : <code class="type">unit -&gt; <a href="Warnings.html#TYPEstate">state</a></code></pre>
<pre><span id="VALrestore"><span class="keyword">val</span> restore</span> : <code class="type"><a href="Warnings.html#TYPEstate">state</a> -&gt; unit</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>