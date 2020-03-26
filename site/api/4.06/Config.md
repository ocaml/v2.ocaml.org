<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Config</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Config.html">Config</a></h1>

<pre><span id="MODULEConfig"><span class="keyword">module</span> Config</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Config.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="VALversion"><span class="keyword">val</span> version</span> : <code class="type">string</code></pre>
<pre><span id="VALstandard_library"><span class="keyword">val</span> standard_library</span> : <code class="type">string</code></pre>
<pre><span id="VALstandard_runtime"><span class="keyword">val</span> standard_runtime</span> : <code class="type">string</code></pre>
<pre><span id="VALccomp_type"><span class="keyword">val</span> ccomp_type</span> : <code class="type">string</code></pre>
<pre><span id="VALc_compiler"><span class="keyword">val</span> c_compiler</span> : <code class="type">string</code></pre>
<pre><span id="VALc_output_obj"><span class="keyword">val</span> c_output_obj</span> : <code class="type">string</code></pre>
<pre><span id="VALocamlc_cflags"><span class="keyword">val</span> ocamlc_cflags</span> : <code class="type">string</code></pre>
<pre><span id="VALocamlc_cppflags"><span class="keyword">val</span> ocamlc_cppflags</span> : <code class="type">string</code></pre>
<pre><span id="VALocamlopt_cflags"><span class="keyword">val</span> ocamlopt_cflags</span> : <code class="type">string</code></pre>
<pre><span id="VALocamlopt_cppflags"><span class="keyword">val</span> ocamlopt_cppflags</span> : <code class="type">string</code></pre>
<pre><span id="VALbytecomp_c_libraries"><span class="keyword">val</span> bytecomp_c_libraries</span> : <code class="type">string</code></pre>
<pre><span id="VALnative_c_libraries"><span class="keyword">val</span> native_c_libraries</span> : <code class="type">string</code></pre>
<pre><span id="VALnative_pack_linker"><span class="keyword">val</span> native_pack_linker</span> : <code class="type">string</code></pre>
<pre><span id="VALmkdll"><span class="keyword">val</span> mkdll</span> : <code class="type">string</code></pre>
<pre><span id="VALmkexe"><span class="keyword">val</span> mkexe</span> : <code class="type">string</code></pre>
<pre><span id="VALmkmaindll"><span class="keyword">val</span> mkmaindll</span> : <code class="type">string</code></pre>
<pre><span id="VALranlib"><span class="keyword">val</span> ranlib</span> : <code class="type">string</code></pre>
<pre><span id="VALar"><span class="keyword">val</span> ar</span> : <code class="type">string</code></pre>
<pre><span id="VALcc_profile"><span class="keyword">val</span> cc_profile</span> : <code class="type">string</code></pre>
<pre><span id="VALload_path"><span class="keyword">val</span> load_path</span> : <code class="type">string list <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALinterface_suffix"><span class="keyword">val</span> interface_suffix</span> : <code class="type">string <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALexec_magic_number"><span class="keyword">val</span> exec_magic_number</span> : <code class="type">string</code></pre>
<pre><span id="VALcmi_magic_number"><span class="keyword">val</span> cmi_magic_number</span> : <code class="type">string</code></pre>
<pre><span id="VALcmo_magic_number"><span class="keyword">val</span> cmo_magic_number</span> : <code class="type">string</code></pre>
<pre><span id="VALcma_magic_number"><span class="keyword">val</span> cma_magic_number</span> : <code class="type">string</code></pre>
<pre><span id="VALcmx_magic_number"><span class="keyword">val</span> cmx_magic_number</span> : <code class="type">string</code></pre>
<pre><span id="VALcmxa_magic_number"><span class="keyword">val</span> cmxa_magic_number</span> : <code class="type">string</code></pre>
<pre><span id="VALast_intf_magic_number"><span class="keyword">val</span> ast_intf_magic_number</span> : <code class="type">string</code></pre>
<pre><span id="VALast_impl_magic_number"><span class="keyword">val</span> ast_impl_magic_number</span> : <code class="type">string</code></pre>
<pre><span id="VALcmxs_magic_number"><span class="keyword">val</span> cmxs_magic_number</span> : <code class="type">string</code></pre>
<pre><span id="VALcmt_magic_number"><span class="keyword">val</span> cmt_magic_number</span> : <code class="type">string</code></pre>
<pre><span id="VALmax_tag"><span class="keyword">val</span> max_tag</span> : <code class="type">int</code></pre>
<pre><span id="VALlazy_tag"><span class="keyword">val</span> lazy_tag</span> : <code class="type">int</code></pre>
<pre><span id="VALmax_young_wosize"><span class="keyword">val</span> max_young_wosize</span> : <code class="type">int</code></pre>
<pre><span id="VALstack_threshold"><span class="keyword">val</span> stack_threshold</span> : <code class="type">int</code></pre>
<pre><span id="VALstack_safety_margin"><span class="keyword">val</span> stack_safety_margin</span> : <code class="type">int</code></pre>
<pre><span id="VALarchitecture"><span class="keyword">val</span> architecture</span> : <code class="type">string</code></pre>
<pre><span id="VALmodel"><span class="keyword">val</span> model</span> : <code class="type">string</code></pre>
<pre><span id="VALsystem"><span class="keyword">val</span> system</span> : <code class="type">string</code></pre>
<pre><span id="VALasm"><span class="keyword">val</span> asm</span> : <code class="type">string</code></pre>
<pre><span id="VALasm_cfi_supported"><span class="keyword">val</span> asm_cfi_supported</span> : <code class="type">bool</code></pre>
<pre><span id="VALwith_frame_pointers"><span class="keyword">val</span> with_frame_pointers</span> : <code class="type">bool</code></pre>
<pre><span id="VALext_obj"><span class="keyword">val</span> ext_obj</span> : <code class="type">string</code></pre>
<pre><span id="VALext_asm"><span class="keyword">val</span> ext_asm</span> : <code class="type">string</code></pre>
<pre><span id="VALext_lib"><span class="keyword">val</span> ext_lib</span> : <code class="type">string</code></pre>
<pre><span id="VALext_dll"><span class="keyword">val</span> ext_dll</span> : <code class="type">string</code></pre>
<pre><span id="VALdefault_executable_name"><span class="keyword">val</span> default_executable_name</span> : <code class="type">string</code></pre>
<pre><span id="VALsysthread_supported"><span class="keyword">val</span> systhread_supported</span> : <code class="type">bool</code></pre>
<pre><span id="VALflexdll_dirs"><span class="keyword">val</span> flexdll_dirs</span> : <code class="type">string list</code></pre>
<pre><span id="VALhost"><span class="keyword">val</span> host</span> : <code class="type">string</code></pre>
<pre><span id="VALtarget"><span class="keyword">val</span> target</span> : <code class="type">string</code></pre>
<pre><span id="VALprint_config"><span class="keyword">val</span> print_config</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; unit</code></pre>
<pre><span id="VALprofiling"><span class="keyword">val</span> profiling</span> : <code class="type">bool</code></pre>
<pre><span id="VALflambda"><span class="keyword">val</span> flambda</span> : <code class="type">bool</code></pre>
<pre><span id="VALspacetime"><span class="keyword">val</span> spacetime</span> : <code class="type">bool</code></pre>
<pre><span id="VALenable_call_counts"><span class="keyword">val</span> enable_call_counts</span> : <code class="type">bool</code></pre>
<pre><span id="VALprofinfo"><span class="keyword">val</span> profinfo</span> : <code class="type">bool</code></pre>
<pre><span id="VALprofinfo_width"><span class="keyword">val</span> profinfo_width</span> : <code class="type">int</code></pre>
<pre><span id="VALlibunwind_available"><span class="keyword">val</span> libunwind_available</span> : <code class="type">bool</code></pre>
<pre><span id="VALlibunwind_link_flags"><span class="keyword">val</span> libunwind_link_flags</span> : <code class="type">string</code></pre>
<pre><span id="VALsafe_string"><span class="keyword">val</span> safe_string</span> : <code class="type">bool</code></pre>
<pre><span id="VALdefault_safe_string"><span class="keyword">val</span> default_safe_string</span> : <code class="type">bool</code></pre>
<pre><span id="VALflat_float_array"><span class="keyword">val</span> flat_float_array</span> : <code class="type">bool</code></pre>
<pre><span id="VALwindows_unicode"><span class="keyword">val</span> windows_unicode</span> : <code class="type">bool</code></pre>
<pre><span id="VALafl_instrument"><span class="keyword">val</span> afl_instrument</span> : <code class="type">bool</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>