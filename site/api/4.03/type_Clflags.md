<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Clflags.html">Clflags</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Int_arg_helper</span>&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;parsed
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;help_text:string&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;update:<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;parse_result&nbsp;=&nbsp;<span class="constructor">Ok</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Parse_failed</span>&nbsp;<span class="keyword">of</span>&nbsp;exn
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_no_error&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;update:<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parse_result
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get&nbsp;:&nbsp;key:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Float_arg_helper</span>&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;parsed
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;help_text:string&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;update:<span class="constructor">Clflags</span>.<span class="constructor">Float_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;parse_result&nbsp;=&nbsp;<span class="constructor">Ok</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Parse_failed</span>&nbsp;<span class="keyword">of</span>&nbsp;exn
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_no_error&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;update:<span class="constructor">Clflags</span>.<span class="constructor">Float_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Float_arg_helper</span>.parse_result
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get&nbsp;:&nbsp;key:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Float_arg_helper</span>.parsed&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;inlining_arguments&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;inline_call_cost&nbsp;:&nbsp;int&nbsp;option;
&nbsp;&nbsp;&nbsp;&nbsp;inline_alloc_cost&nbsp;:&nbsp;int&nbsp;option;
&nbsp;&nbsp;&nbsp;&nbsp;inline_prim_cost&nbsp;:&nbsp;int&nbsp;option;
&nbsp;&nbsp;&nbsp;&nbsp;inline_branch_cost&nbsp;:&nbsp;int&nbsp;option;
&nbsp;&nbsp;&nbsp;&nbsp;inline_indirect_cost&nbsp;:&nbsp;int&nbsp;option;
&nbsp;&nbsp;&nbsp;&nbsp;inline_lifting_benefit&nbsp;:&nbsp;int&nbsp;option;
&nbsp;&nbsp;&nbsp;&nbsp;inline_branch_factor&nbsp;:&nbsp;float&nbsp;option;
&nbsp;&nbsp;&nbsp;&nbsp;inline_max_depth&nbsp;:&nbsp;int&nbsp;option;
&nbsp;&nbsp;&nbsp;&nbsp;inline_max_unroll&nbsp;:&nbsp;int&nbsp;option;
&nbsp;&nbsp;&nbsp;&nbsp;inline_threshold&nbsp;:&nbsp;float&nbsp;option;
&nbsp;&nbsp;&nbsp;&nbsp;inline_toplevel_threshold&nbsp;:&nbsp;int&nbsp;option;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;classic_arguments&nbsp;:&nbsp;<span class="constructor">Clflags</span>.inlining_arguments
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;o1_arguments&nbsp;:&nbsp;<span class="constructor">Clflags</span>.inlining_arguments
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;o2_arguments&nbsp;:&nbsp;<span class="constructor">Clflags</span>.inlining_arguments
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;o3_arguments&nbsp;:&nbsp;<span class="constructor">Clflags</span>.inlining_arguments
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;use_inlining_arguments_set&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;?round:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Clflags</span>.inlining_arguments&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;objfiles&nbsp;:&nbsp;string&nbsp;list&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ccobjs&nbsp;:&nbsp;string&nbsp;list&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dllibs&nbsp;:&nbsp;string&nbsp;list&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compile_only&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;output_name&nbsp;:&nbsp;string&nbsp;option&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;include_dirs&nbsp;:&nbsp;string&nbsp;list&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;no_std_include&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_types&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;make_archive&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;debug&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fast&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;link_everything&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;custom_runtime&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;no_check_prims&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;bytecode_compatible_32&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;output_c_object&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;output_complete_object&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;all_ccopts&nbsp;:&nbsp;string&nbsp;list&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;classic&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;nopervasives&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_modules&nbsp;:&nbsp;string&nbsp;list&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;preprocessor&nbsp;:&nbsp;string&nbsp;option&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;all_ppx&nbsp;:&nbsp;string&nbsp;list&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;annotations&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;binary_annotations&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;use_threads&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;use_vmthreads&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;noassert&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;verbose&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;noprompt&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;nopromptcont&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;init_file&nbsp;:&nbsp;string&nbsp;option&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;noinit&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;use_prims&nbsp;:&nbsp;string&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;use_runtime&nbsp;:&nbsp;string&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;principal&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;real_paths&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;recursive_types&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;strict_sequence&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;strict_formats&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;applicative_functors&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;make_runtime&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;gprofile&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;c_compiler&nbsp;:&nbsp;string&nbsp;option&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;no_auto_link&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dllpaths&nbsp;:&nbsp;string&nbsp;list&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;make_package&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;for_package&nbsp;:&nbsp;string&nbsp;option&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;error_size&nbsp;:&nbsp;int&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;float_const_prop&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;transparent_modules&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_source&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_parsetree&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_typedtree&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_rawlambda&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_lambda&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_rawclambda&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_clambda&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_rawflambda&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_flambda&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_flambda_let&nbsp;:&nbsp;int&nbsp;option&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_instr&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;keep_asm_file&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;optimize_for_speed&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_cmm&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_selection&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_cse&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_live&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_spill&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_split&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_interf&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_prefer&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_regalloc&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_reload&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_scheduling&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_linear&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;keep_startup_file&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_combine&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;native_code&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_inline_threshold&nbsp;:&nbsp;float
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inline_threshold&nbsp;:&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Float_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inlining_report&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;simplify_rounds&nbsp;:&nbsp;int&nbsp;option&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_simplify_rounds&nbsp;:&nbsp;int&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rounds&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_inline_max_unroll&nbsp;:&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inline_max_unroll&nbsp;:&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_inline_toplevel_threshold&nbsp;:&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inline_toplevel_threshold&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_inline_call_cost&nbsp;:&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_inline_alloc_cost&nbsp;:&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_inline_prim_cost&nbsp;:&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_inline_branch_cost&nbsp;:&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_inline_indirect_cost&nbsp;:&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_inline_lifting_benefit&nbsp;:&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inline_call_cost&nbsp;:&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inline_alloc_cost&nbsp;:&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inline_prim_cost&nbsp;:&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inline_branch_cost&nbsp;:&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inline_indirect_cost&nbsp;:&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inline_lifting_benefit&nbsp;:&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_inline_branch_factor&nbsp;:&nbsp;float
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inline_branch_factor&nbsp;:&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Float_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dont_write_files&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;std_include_flag&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;std_include_dir&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;list
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;shared&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dlcode&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pic_code&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;runtime_variant&nbsp;:&nbsp;string&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;force_slash&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;keep_docs&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;keep_locs&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unsafe_string&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;opaque&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_timings&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;flambda_invariant_checks&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unbox_closures&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unbox_closures_factor&nbsp;:&nbsp;int&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_unbox_closures_factor&nbsp;:&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unbox_free_vars_of_closures&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unbox_specialised_args&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;clambda_checks&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_inline_max_depth&nbsp;:&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inline_max_depth&nbsp;:&nbsp;<span class="constructor">Clflags</span>.<span class="constructor">Int_arg_helper</span>.parsed&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;remove_unused_arguments&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dump_flambda_verbose&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;classic_inlining&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;all_passes&nbsp;:&nbsp;string&nbsp;list&nbsp;<span class="constructor">Pervasives</span>.ref
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dumped_pass&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_dumped_pass&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_color_setting&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Misc</span>.<span class="constructor">Color</span>.setting&nbsp;option
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;color&nbsp;:&nbsp;<span class="constructor">Misc</span>.<span class="constructor">Color</span>.setting&nbsp;<span class="constructor">Pervasives</span>.ref
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>