<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Clflags</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Clflags.html">Clflags</a></h1>

<pre><span class="keyword">module</span> Clflags: <code class="code"><span class="keyword">sig</span></code> <a href="Clflags.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Optimization parameters represented as ints indexed by round number.<br>
</div>
<hr width="100%">

<pre><span class="keyword">module</span> <a href="Clflags.Int_arg_helper.html">Int_arg_helper</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Clflags.Int_arg_helper.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span class="keyword">module</span> <a href="Clflags.Float_arg_helper.html">Float_arg_helper</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Clflags.Float_arg_helper.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Optimization parameters represented as floats indexed by round number.
</div>

<pre><code><span id="TYPEinlining_arguments"><span class="keyword">type</span> <code class="type"></code>inlining_arguments</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinlining_arguments.inline_call_cost">inline_call_cost</span>&nbsp;: <code class="type">int option</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinlining_arguments.inline_alloc_cost">inline_alloc_cost</span>&nbsp;: <code class="type">int option</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinlining_arguments.inline_prim_cost">inline_prim_cost</span>&nbsp;: <code class="type">int option</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinlining_arguments.inline_branch_cost">inline_branch_cost</span>&nbsp;: <code class="type">int option</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinlining_arguments.inline_indirect_cost">inline_indirect_cost</span>&nbsp;: <code class="type">int option</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinlining_arguments.inline_lifting_benefit">inline_lifting_benefit</span>&nbsp;: <code class="type">int option</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinlining_arguments.inline_branch_factor">inline_branch_factor</span>&nbsp;: <code class="type">float option</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinlining_arguments.inline_max_depth">inline_max_depth</span>&nbsp;: <code class="type">int option</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinlining_arguments.inline_max_unroll">inline_max_unroll</span>&nbsp;: <code class="type">int option</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinlining_arguments.inline_threshold">inline_threshold</span>&nbsp;: <code class="type">float option</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinlining_arguments.inline_toplevel_threshold">inline_toplevel_threshold</span>&nbsp;: <code class="type">int option</code>;</code></td>

</tr></tbody></table>
}



<pre><span id="VALclassic_arguments"><span class="keyword">val</span> classic_arguments</span> : <code class="type"><a href="Clflags.html#TYPEinlining_arguments">inlining_arguments</a></code></pre>
<pre><span id="VALo1_arguments"><span class="keyword">val</span> o1_arguments</span> : <code class="type"><a href="Clflags.html#TYPEinlining_arguments">inlining_arguments</a></code></pre>
<pre><span id="VALo2_arguments"><span class="keyword">val</span> o2_arguments</span> : <code class="type"><a href="Clflags.html#TYPEinlining_arguments">inlining_arguments</a></code></pre>
<pre><span id="VALo3_arguments"><span class="keyword">val</span> o3_arguments</span> : <code class="type"><a href="Clflags.html#TYPEinlining_arguments">inlining_arguments</a></code></pre>
<pre><span id="VALuse_inlining_arguments_set"><span class="keyword">val</span> use_inlining_arguments_set</span> : <code class="type">?round:int -&gt; <a href="Clflags.html#TYPEinlining_arguments">inlining_arguments</a> -&gt; unit</code></pre><div class="info ">
Set all the inlining arguments for a round.
    The default is set if no round is provided.<br>
</div>

<pre><span id="VALobjfiles"><span class="keyword">val</span> objfiles</span> : <code class="type">string list <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALccobjs"><span class="keyword">val</span> ccobjs</span> : <code class="type">string list <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdllibs"><span class="keyword">val</span> dllibs</span> : <code class="type">string list <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALcompile_only"><span class="keyword">val</span> compile_only</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALoutput_name"><span class="keyword">val</span> output_name</span> : <code class="type">string option <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALinclude_dirs"><span class="keyword">val</span> include_dirs</span> : <code class="type">string list <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALno_std_include"><span class="keyword">val</span> no_std_include</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALprint_types"><span class="keyword">val</span> print_types</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALmake_archive"><span class="keyword">val</span> make_archive</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdebug"><span class="keyword">val</span> debug</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALfast"><span class="keyword">val</span> fast</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALlink_everything"><span class="keyword">val</span> link_everything</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALcustom_runtime"><span class="keyword">val</span> custom_runtime</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALno_check_prims"><span class="keyword">val</span> no_check_prims</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALbytecode_compatible_32"><span class="keyword">val</span> bytecode_compatible_32</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALoutput_c_object"><span class="keyword">val</span> output_c_object</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALoutput_complete_object"><span class="keyword">val</span> output_complete_object</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALall_ccopts"><span class="keyword">val</span> all_ccopts</span> : <code class="type">string list <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALclassic"><span class="keyword">val</span> classic</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALnopervasives"><span class="keyword">val</span> nopervasives</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALopen_modules"><span class="keyword">val</span> open_modules</span> : <code class="type">string list <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALpreprocessor"><span class="keyword">val</span> preprocessor</span> : <code class="type">string option <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALall_ppx"><span class="keyword">val</span> all_ppx</span> : <code class="type">string list <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALannotations"><span class="keyword">val</span> annotations</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALbinary_annotations"><span class="keyword">val</span> binary_annotations</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALuse_threads"><span class="keyword">val</span> use_threads</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALuse_vmthreads"><span class="keyword">val</span> use_vmthreads</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALnoassert"><span class="keyword">val</span> noassert</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALverbose"><span class="keyword">val</span> verbose</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALnoprompt"><span class="keyword">val</span> noprompt</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALnopromptcont"><span class="keyword">val</span> nopromptcont</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALinit_file"><span class="keyword">val</span> init_file</span> : <code class="type">string option <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALnoinit"><span class="keyword">val</span> noinit</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALnoversion"><span class="keyword">val</span> noversion</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALuse_prims"><span class="keyword">val</span> use_prims</span> : <code class="type">string <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALuse_runtime"><span class="keyword">val</span> use_runtime</span> : <code class="type">string <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALprincipal"><span class="keyword">val</span> principal</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALreal_paths"><span class="keyword">val</span> real_paths</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALrecursive_types"><span class="keyword">val</span> recursive_types</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALstrict_sequence"><span class="keyword">val</span> strict_sequence</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALstrict_formats"><span class="keyword">val</span> strict_formats</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALapplicative_functors"><span class="keyword">val</span> applicative_functors</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALmake_runtime"><span class="keyword">val</span> make_runtime</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALgprofile"><span class="keyword">val</span> gprofile</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALc_compiler"><span class="keyword">val</span> c_compiler</span> : <code class="type">string option <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALno_auto_link"><span class="keyword">val</span> no_auto_link</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdllpaths"><span class="keyword">val</span> dllpaths</span> : <code class="type">string list <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALmake_package"><span class="keyword">val</span> make_package</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALfor_package"><span class="keyword">val</span> for_package</span> : <code class="type">string option <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALerror_size"><span class="keyword">val</span> error_size</span> : <code class="type">int <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALfloat_const_prop"><span class="keyword">val</span> float_const_prop</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALtransparent_modules"><span class="keyword">val</span> transparent_modules</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_source"><span class="keyword">val</span> dump_source</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_parsetree"><span class="keyword">val</span> dump_parsetree</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_typedtree"><span class="keyword">val</span> dump_typedtree</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_rawlambda"><span class="keyword">val</span> dump_rawlambda</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_lambda"><span class="keyword">val</span> dump_lambda</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_rawclambda"><span class="keyword">val</span> dump_rawclambda</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_clambda"><span class="keyword">val</span> dump_clambda</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_rawflambda"><span class="keyword">val</span> dump_rawflambda</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_flambda"><span class="keyword">val</span> dump_flambda</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_flambda_let"><span class="keyword">val</span> dump_flambda_let</span> : <code class="type">int option <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_instr"><span class="keyword">val</span> dump_instr</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALkeep_asm_file"><span class="keyword">val</span> keep_asm_file</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALoptimize_for_speed"><span class="keyword">val</span> optimize_for_speed</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_cmm"><span class="keyword">val</span> dump_cmm</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_selection"><span class="keyword">val</span> dump_selection</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_cse"><span class="keyword">val</span> dump_cse</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_live"><span class="keyword">val</span> dump_live</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_spill"><span class="keyword">val</span> dump_spill</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_split"><span class="keyword">val</span> dump_split</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_interf"><span class="keyword">val</span> dump_interf</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_prefer"><span class="keyword">val</span> dump_prefer</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_regalloc"><span class="keyword">val</span> dump_regalloc</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_reload"><span class="keyword">val</span> dump_reload</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_scheduling"><span class="keyword">val</span> dump_scheduling</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_linear"><span class="keyword">val</span> dump_linear</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALkeep_startup_file"><span class="keyword">val</span> keep_startup_file</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_combine"><span class="keyword">val</span> dump_combine</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALnative_code"><span class="keyword">val</span> native_code</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdefault_inline_threshold"><span class="keyword">val</span> default_inline_threshold</span> : <code class="type">float</code></pre>
<pre><span id="VALinline_threshold"><span class="keyword">val</span> inline_threshold</span> : <code class="type"><a href="Clflags.Float_arg_helper.html#TYPEparsed">Float_arg_helper.parsed</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALinlining_report"><span class="keyword">val</span> inlining_report</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALsimplify_rounds"><span class="keyword">val</span> simplify_rounds</span> : <code class="type">int option <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdefault_simplify_rounds"><span class="keyword">val</span> default_simplify_rounds</span> : <code class="type">int <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALrounds"><span class="keyword">val</span> rounds</span> : <code class="type">unit -&gt; int</code></pre>
<pre><span id="VALdefault_inline_max_unroll"><span class="keyword">val</span> default_inline_max_unroll</span> : <code class="type">int</code></pre>
<pre><span id="VALinline_max_unroll"><span class="keyword">val</span> inline_max_unroll</span> : <code class="type"><a href="Clflags.Int_arg_helper.html#TYPEparsed">Int_arg_helper.parsed</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdefault_inline_toplevel_threshold"><span class="keyword">val</span> default_inline_toplevel_threshold</span> : <code class="type">int</code></pre>
<pre><span id="VALinline_toplevel_threshold"><span class="keyword">val</span> inline_toplevel_threshold</span> : <code class="type"><a href="Clflags.Int_arg_helper.html#TYPEparsed">Int_arg_helper.parsed</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdefault_inline_call_cost"><span class="keyword">val</span> default_inline_call_cost</span> : <code class="type">int</code></pre>
<pre><span id="VALdefault_inline_alloc_cost"><span class="keyword">val</span> default_inline_alloc_cost</span> : <code class="type">int</code></pre>
<pre><span id="VALdefault_inline_prim_cost"><span class="keyword">val</span> default_inline_prim_cost</span> : <code class="type">int</code></pre>
<pre><span id="VALdefault_inline_branch_cost"><span class="keyword">val</span> default_inline_branch_cost</span> : <code class="type">int</code></pre>
<pre><span id="VALdefault_inline_indirect_cost"><span class="keyword">val</span> default_inline_indirect_cost</span> : <code class="type">int</code></pre>
<pre><span id="VALdefault_inline_lifting_benefit"><span class="keyword">val</span> default_inline_lifting_benefit</span> : <code class="type">int</code></pre>
<pre><span id="VALinline_call_cost"><span class="keyword">val</span> inline_call_cost</span> : <code class="type"><a href="Clflags.Int_arg_helper.html#TYPEparsed">Int_arg_helper.parsed</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALinline_alloc_cost"><span class="keyword">val</span> inline_alloc_cost</span> : <code class="type"><a href="Clflags.Int_arg_helper.html#TYPEparsed">Int_arg_helper.parsed</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALinline_prim_cost"><span class="keyword">val</span> inline_prim_cost</span> : <code class="type"><a href="Clflags.Int_arg_helper.html#TYPEparsed">Int_arg_helper.parsed</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALinline_branch_cost"><span class="keyword">val</span> inline_branch_cost</span> : <code class="type"><a href="Clflags.Int_arg_helper.html#TYPEparsed">Int_arg_helper.parsed</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALinline_indirect_cost"><span class="keyword">val</span> inline_indirect_cost</span> : <code class="type"><a href="Clflags.Int_arg_helper.html#TYPEparsed">Int_arg_helper.parsed</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALinline_lifting_benefit"><span class="keyword">val</span> inline_lifting_benefit</span> : <code class="type"><a href="Clflags.Int_arg_helper.html#TYPEparsed">Int_arg_helper.parsed</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdefault_inline_branch_factor"><span class="keyword">val</span> default_inline_branch_factor</span> : <code class="type">float</code></pre>
<pre><span id="VALinline_branch_factor"><span class="keyword">val</span> inline_branch_factor</span> : <code class="type"><a href="Clflags.Float_arg_helper.html#TYPEparsed">Float_arg_helper.parsed</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdont_write_files"><span class="keyword">val</span> dont_write_files</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALstd_include_flag"><span class="keyword">val</span> std_include_flag</span> : <code class="type">string -&gt; string</code></pre>
<pre><span id="VALstd_include_dir"><span class="keyword">val</span> std_include_dir</span> : <code class="type">unit -&gt; string list</code></pre>
<pre><span id="VALshared"><span class="keyword">val</span> shared</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdlcode"><span class="keyword">val</span> dlcode</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALpic_code"><span class="keyword">val</span> pic_code</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALruntime_variant"><span class="keyword">val</span> runtime_variant</span> : <code class="type">string <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALforce_slash"><span class="keyword">val</span> force_slash</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALkeep_docs"><span class="keyword">val</span> keep_docs</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALkeep_locs"><span class="keyword">val</span> keep_locs</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALunsafe_string"><span class="keyword">val</span> unsafe_string</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALopaque"><span class="keyword">val</span> opaque</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALprint_timings"><span class="keyword">val</span> print_timings</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALflambda_invariant_checks"><span class="keyword">val</span> flambda_invariant_checks</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALunbox_closures"><span class="keyword">val</span> unbox_closures</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALunbox_closures_factor"><span class="keyword">val</span> unbox_closures_factor</span> : <code class="type">int <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdefault_unbox_closures_factor"><span class="keyword">val</span> default_unbox_closures_factor</span> : <code class="type">int</code></pre>
<pre><span id="VALunbox_free_vars_of_closures"><span class="keyword">val</span> unbox_free_vars_of_closures</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALunbox_specialised_args"><span class="keyword">val</span> unbox_specialised_args</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALclambda_checks"><span class="keyword">val</span> clambda_checks</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdefault_inline_max_depth"><span class="keyword">val</span> default_inline_max_depth</span> : <code class="type">int</code></pre>
<pre><span id="VALinline_max_depth"><span class="keyword">val</span> inline_max_depth</span> : <code class="type"><a href="Clflags.Int_arg_helper.html#TYPEparsed">Int_arg_helper.parsed</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALremove_unused_arguments"><span class="keyword">val</span> remove_unused_arguments</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdump_flambda_verbose"><span class="keyword">val</span> dump_flambda_verbose</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALclassic_inlining"><span class="keyword">val</span> classic_inlining</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALall_passes"><span class="keyword">val</span> all_passes</span> : <code class="type">string list <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALdumped_pass"><span class="keyword">val</span> dumped_pass</span> : <code class="type">string -&gt; bool</code></pre>
<pre><span id="VALset_dumped_pass"><span class="keyword">val</span> set_dumped_pass</span> : <code class="type">string -&gt; bool -&gt; unit</code></pre>
<pre><span id="VALparse_color_setting"><span class="keyword">val</span> parse_color_setting</span> : <code class="type">string -&gt; <a href="Misc.Color.html#TYPEsetting">Misc.Color.setting</a> option</code></pre>
<pre><span id="VALcolor"><span class="keyword">val</span> color</span> : <code class="type"><a href="Misc.Color.html#TYPEsetting">Misc.Color.setting</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALunboxed_types"><span class="keyword">val</span> unboxed_types</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>