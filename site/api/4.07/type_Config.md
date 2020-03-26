<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Config.html">Config</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;version&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;standard_library&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;standard_runtime&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ccomp_type&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;c_compiler&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;c_output_obj&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ocamlc_cflags&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ocamlc_cppflags&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ocamlopt_cflags&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ocamlopt_cppflags&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;bytecomp_c_libraries&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;native_c_libraries&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;native_pack_linker&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mkdll&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mkexe&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mkmaindll&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ranlib&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ar&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;cc_profile&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;load_path&nbsp;:&nbsp;string&nbsp;list&nbsp;<span class="constructor">Pervasives</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;interface_suffix&nbsp;:&nbsp;string&nbsp;<span class="constructor">Pervasives</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;exec_magic_number&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;cmi_magic_number&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;cmo_magic_number&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;cma_magic_number&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;cmx_magic_number&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;cmxa_magic_number&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ast_intf_magic_number&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ast_impl_magic_number&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;cmxs_magic_number&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;cmt_magic_number&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;max_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lazy_tag&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;max_young_wosize&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stack_threshold&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stack_safety_margin&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;architecture&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;model&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;system&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;asm&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;asm_cfi_supported&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;with_frame_pointers&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ext_obj&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ext_asm&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ext_lib&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ext_dll&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_executable_name&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;systhread_supported&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;flexdll_dirs&nbsp;:&nbsp;string&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;host&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;target&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_config&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;profiling&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;flambda&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;with_flambda_invariants&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;spacetime&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;enable_call_counts&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;profinfo&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;profinfo_width&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;libunwind_available&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;libunwind_link_flags&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;safe_string&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_safe_string&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;flat_float_array&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;windows_unicode&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;afl_instrument&nbsp;:&nbsp;bool<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>