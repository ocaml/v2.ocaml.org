<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Typemod.html">Typemod</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_module&nbsp;:&nbsp;<span class="constructor">Env</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.module_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Typedtree</span>.module_expr<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_structure&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Env</span>.t&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.structure&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Typedtree</span>.structure&nbsp;*&nbsp;<span class="constructor">Types</span>.signature&nbsp;*&nbsp;<span class="constructor">Env</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_toplevel_phrase&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Env</span>.t&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.structure&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Typedtree</span>.structure&nbsp;*&nbsp;<span class="constructor">Types</span>.signature&nbsp;*&nbsp;<span class="constructor">Env</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_implementation&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Env</span>.t&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsetree</span>.structure&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Typedtree</span>.structure&nbsp;*&nbsp;<span class="constructor">Typedtree</span>.module_coercion<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_interface&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Env</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Typedtree</span>.signature<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;transl_signature&nbsp;:&nbsp;<span class="constructor">Env</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Typedtree</span>.signature<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;check_nongen_schemes&nbsp;:&nbsp;<span class="constructor">Env</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Types</span>.signature&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;type_open_&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?used_slot:bool&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?toplevel:bool&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Asttypes</span>.override_flag&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Env</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Longident</span>.t&nbsp;<span class="constructor">Asttypes</span>.loc&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Path</span>.t&nbsp;*&nbsp;<span class="constructor">Env</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;modtype_of_package&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Env</span>.t&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Path</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Longident</span>.t&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Types</span>.type_expr&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Types</span>.module_type<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;simplify_signature&nbsp;:&nbsp;<span class="constructor">Types</span>.signature&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Types</span>.signature<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;path_of_module&nbsp;:&nbsp;<span class="constructor">Typedtree</span>.module_expr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Path</span>.t&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;save_signature&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Typedtree</span>.signature&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Env</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Cmi_format</span>.cmi_infos&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;package_units&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Env</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Typedtree</span>.module_coercion<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;error&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Cannot_apply</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Types</span>.module_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Not_included</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Includemod</span>.error&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Cannot_eliminate_dependency</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Types</span>.module_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Signature_expected</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Structure_expected</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Types</span>.module_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">With_no_component</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Longident</span>.t<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">With_mismatch</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Longident</span>.t&nbsp;*&nbsp;<span class="constructor">Includemod</span>.error&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">With_makes_applicative_functor_ill_typed</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Longident</span>.t&nbsp;*&nbsp;<span class="constructor">Path</span>.t&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Includemod</span>.error&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">With_changes_module_alias</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Longident</span>.t&nbsp;*&nbsp;<span class="constructor">Ident</span>.t&nbsp;*&nbsp;<span class="constructor">Path</span>.t<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">With_cannot_remove_constrained_type</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Repeated_name</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Non_generalizable</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Types</span>.type_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Non_generalizable_class</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Ident</span>.t&nbsp;*&nbsp;<span class="constructor">Types</span>.class_declaration<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Non_generalizable_module</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Types</span>.module_type<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Implementation_is_required</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Interface_not_compiled</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Not_allowed_in_functor_body</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Not_a_packed_module</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Types</span>.type_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Incomplete_packed_module</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Types</span>.type_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Scoping_pack</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Longident</span>.t&nbsp;*&nbsp;<span class="constructor">Types</span>.type_expr<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Recursive_module_require_explicit_type</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Apply_generative</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Cannot_scrape_alias</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Path</span>.t<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Error</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;*&nbsp;<span class="constructor">Env</span>.t&nbsp;*&nbsp;<span class="constructor">Typemod</span>.error<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Error_forward</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.error<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;report_error&nbsp;:&nbsp;<span class="constructor">Env</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Typemod</span>.error&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">ImplementationHooks</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=&nbsp;<span class="constructor">Typedtree</span>.structure&nbsp;*&nbsp;<span class="constructor">Typedtree</span>.module_coercion<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;add_hook&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="constructor">Misc</span>.hook_info&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;apply_hooks&nbsp;:&nbsp;<span class="constructor">Misc</span>.hook_info&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">InterfaceHooks</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=&nbsp;<span class="constructor">Typedtree</span>.signature<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;add_hook&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="constructor">Misc</span>.hook_info&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;apply_hooks&nbsp;:&nbsp;<span class="constructor">Misc</span>.hook_info&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>