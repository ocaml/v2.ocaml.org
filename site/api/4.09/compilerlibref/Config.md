<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Config</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Config.html">Config</a></h1>

<pre><span id="MODULEConfig"><span class="keyword">module</span> Config</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Config.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>System configuration</p>

<p><b>Warning:</b> this module is unstable and part of
  <a href="Compiler_libs.html">compiler-libs</a>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="VALversion"><span class="keyword">val</span> version</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The current version number of the system</p>
</div>
</div>

<pre><span id="VALstandard_library"><span class="keyword">val</span> standard_library</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The directory containing the standard libraries</p>
</div>
</div>

<pre><span id="VALccomp_type"><span class="keyword">val</span> ccomp_type</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The "kind" of the C compiler, assembler and linker used: one of
    "cc" (for Unix-style C compilers)
    "msvc" (for Microsoft Visual C++ and MASM)</p>
</div>
</div>

<pre><span id="VALc_compiler"><span class="keyword">val</span> c_compiler</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The compiler to use for compiling C files</p>
</div>
</div>

<pre><span id="VALc_output_obj"><span class="keyword">val</span> c_output_obj</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Name of the option of the C compiler for specifying the output
    file</p>
</div>
</div>

<pre><span id="VALc_has_debug_prefix_map"><span class="keyword">val</span> c_has_debug_prefix_map</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether the C compiler supports -fdebug-prefix-map</p>
</div>
</div>

<pre><span id="VALas_has_debug_prefix_map"><span class="keyword">val</span> as_has_debug_prefix_map</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether the assembler supports --debug-prefix-map</p>
</div>
</div>

<pre><span id="VALocamlc_cflags"><span class="keyword">val</span> ocamlc_cflags</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The flags ocamlc should pass to the C compiler</p>
</div>
</div>

<pre><span id="VALocamlc_cppflags"><span class="keyword">val</span> ocamlc_cppflags</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The flags ocamlc should pass to the C preprocessor</p>
</div>
</div>

<pre><span id="VALocamlopt_cflags"><span class="keyword">val</span> ocamlopt_cflags</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The flags ocamlopt should pass to the C compiler</p>
</div>
</div>

<pre><span id="VALocamlopt_cppflags"><span class="keyword">val</span> ocamlopt_cppflags</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The flags ocamlopt should pass to the C preprocessor</p>
</div>
</div>

<pre><span id="VALbytecomp_c_libraries"><span class="keyword">val</span> bytecomp_c_libraries</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The C libraries to link with custom runtimes</p>
</div>
</div>

<pre><span id="VALnative_c_libraries"><span class="keyword">val</span> native_c_libraries</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The C libraries to link with native-code programs</p>
</div>
</div>

<pre><span id="VALnative_pack_linker"><span class="keyword">val</span> native_pack_linker</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The linker to use for packaging (ocamlopt -pack) and for partial
    links (ocamlopt -output-obj).</p>
</div>
</div>

<pre><span id="VALmkdll"><span class="keyword">val</span> mkdll</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The linker command line to build dynamic libraries.</p>
</div>
</div>

<pre><span id="VALmkexe"><span class="keyword">val</span> mkexe</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The linker command line to build executables.</p>
</div>
</div>

<pre><span id="VALmkmaindll"><span class="keyword">val</span> mkmaindll</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The linker command line to build main programs as dlls.</p>
</div>
</div>

<pre><span id="VALranlib"><span class="keyword">val</span> ranlib</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Command to randomize a library, or "" if not needed</p>
</div>
</div>

<pre><span id="VALar"><span class="keyword">val</span> ar</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Name of the ar command, or "" if not needed  (MSVC)</p>
</div>
</div>

<pre><span id="VALinterface_suffix"><span class="keyword">val</span> interface_suffix</span> : <code class="type">string ref</code></pre><div class="info ">
<div class="info-desc">
<p>Suffix for interface file names</p>
</div>
</div>

<pre><span id="VALexec_magic_number"><span class="keyword">val</span> exec_magic_number</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Magic number for bytecode executable files</p>
</div>
</div>

<pre><span id="VALcmi_magic_number"><span class="keyword">val</span> cmi_magic_number</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Magic number for compiled interface files</p>
</div>
</div>

<pre><span id="VALcmo_magic_number"><span class="keyword">val</span> cmo_magic_number</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Magic number for object bytecode files</p>
</div>
</div>

<pre><span id="VALcma_magic_number"><span class="keyword">val</span> cma_magic_number</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Magic number for archive files</p>
</div>
</div>

<pre><span id="VALcmx_magic_number"><span class="keyword">val</span> cmx_magic_number</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Magic number for compilation unit descriptions</p>
</div>
</div>

<pre><span id="VALcmxa_magic_number"><span class="keyword">val</span> cmxa_magic_number</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Magic number for libraries of compilation unit descriptions</p>
</div>
</div>

<pre><span id="VALast_intf_magic_number"><span class="keyword">val</span> ast_intf_magic_number</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Magic number for file holding an interface syntax tree</p>
</div>
</div>

<pre><span id="VALast_impl_magic_number"><span class="keyword">val</span> ast_impl_magic_number</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Magic number for file holding an implementation syntax tree</p>
</div>
</div>

<pre><span id="VALcmxs_magic_number"><span class="keyword">val</span> cmxs_magic_number</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Magic number for dynamically-loadable plugins</p>
</div>
</div>

<pre><span id="VALcmt_magic_number"><span class="keyword">val</span> cmt_magic_number</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Magic number for compiled interface files</p>
</div>
</div>

<pre><span id="VALmax_tag"><span class="keyword">val</span> max_tag</span> : <code class="type">int</code></pre><div class="info ">
<div class="info-desc">
<p>Biggest tag that can be stored in the header of a regular block.</p>
</div>
</div>

<pre><span id="VALlazy_tag"><span class="keyword">val</span> lazy_tag</span> : <code class="type">int</code></pre><div class="info ">
<div class="info-desc">
<p>Normally the same as Obj.lazy_tag.  Separate definition because
    of technical reasons for bootstrapping.</p>
</div>
</div>

<pre><span id="VALmax_young_wosize"><span class="keyword">val</span> max_young_wosize</span> : <code class="type">int</code></pre><div class="info ">
<div class="info-desc">
<p>Maximal size of arrays that are directly allocated in the
    minor heap</p>
</div>
</div>

<pre><span id="VALstack_threshold"><span class="keyword">val</span> stack_threshold</span> : <code class="type">int</code></pre><div class="info ">
<div class="info-desc">
<p>Size in words of safe area at bottom of VM stack,
    see runtime/caml/config.h</p>
</div>
</div>

<pre><span id="VALstack_safety_margin"><span class="keyword">val</span> stack_safety_margin</span> : <code class="type">int</code></pre><div class="info ">
<div class="info-desc">
<p>Size in words of the safety margin between the bottom of
    the stack and the stack pointer. This margin can be used by
    intermediate computations of some instructions, or the event
    handler.</p>
</div>
</div>

<pre><span id="VALarchitecture"><span class="keyword">val</span> architecture</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Name of processor type for the native-code compiler</p>
</div>
</div>

<pre><span id="VALmodel"><span class="keyword">val</span> model</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Name of processor submodel for the native-code compiler</p>
</div>
</div>

<pre><span id="VALsystem"><span class="keyword">val</span> system</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Name of operating system for the native-code compiler</p>
</div>
</div>

<pre><span id="VALasm"><span class="keyword">val</span> asm</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>The assembler (and flags) to use for assembling
    ocamlopt-generated code.</p>
</div>
</div>

<pre><span id="VALasm_cfi_supported"><span class="keyword">val</span> asm_cfi_supported</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether assembler understands CFI directives</p>
</div>
</div>

<pre><span id="VALwith_frame_pointers"><span class="keyword">val</span> with_frame_pointers</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether assembler should maintain frame pointers</p>
</div>
</div>

<pre><span id="VALext_obj"><span class="keyword">val</span> ext_obj</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Extension for object files, e.g. <code class="code">.o</code> under Unix.</p>
</div>
</div>

<pre><span id="VALext_asm"><span class="keyword">val</span> ext_asm</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Extension for assembler files, e.g. <code class="code">.s</code> under Unix.</p>
</div>
</div>

<pre><span id="VALext_lib"><span class="keyword">val</span> ext_lib</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Extension for library files, e.g. <code class="code">.a</code> under Unix.</p>
</div>
</div>

<pre><span id="VALext_dll"><span class="keyword">val</span> ext_dll</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Extension for dynamically-loaded libraries, e.g. <code class="code">.so</code> under Unix.</p>
</div>
</div>

<pre><span id="VALdefault_executable_name"><span class="keyword">val</span> default_executable_name</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Name of executable produced by linking if none is given with -o,
    e.g. <code class="code">a.out</code> under Unix.</p>
</div>
</div>

<pre><span id="VALsysthread_supported"><span class="keyword">val</span> systhread_supported</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether the system thread library is implemented</p>
</div>
</div>

<pre><span id="VALflexdll_dirs"><span class="keyword">val</span> flexdll_dirs</span> : <code class="type">string list</code></pre><div class="info ">
<div class="info-desc">
<p>Directories needed for the FlexDLL objects</p>
</div>
</div>

<pre><span id="VALhost"><span class="keyword">val</span> host</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Whether the compiler is a cross-compiler</p>
</div>
</div>

<pre><span id="VALtarget"><span class="keyword">val</span> target</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Whether the compiler is a cross-compiler</p>
</div>
</div>

<pre><span id="VALflambda"><span class="keyword">val</span> flambda</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether the compiler was configured for flambda</p>
</div>
</div>

<pre><span id="VALwith_flambda_invariants"><span class="keyword">val</span> with_flambda_invariants</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether the invariants checks for flambda are enabled</p>
</div>
</div>

<pre><span id="VALspacetime"><span class="keyword">val</span> spacetime</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether the compiler was configured for Spacetime profiling</p>
</div>
</div>

<pre><span id="VALenable_call_counts"><span class="keyword">val</span> enable_call_counts</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether call counts are to be available when Spacetime profiling</p>
</div>
</div>

<pre><span id="VALprofinfo"><span class="keyword">val</span> profinfo</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether the compiler was configured for profiling</p>
</div>
</div>

<pre><span id="VALprofinfo_width"><span class="keyword">val</span> profinfo_width</span> : <code class="type">int</code></pre><div class="info ">
<div class="info-desc">
<p>How many bits are to be used in values' headers for profiling
    information</p>
</div>
</div>

<pre><span id="VALlibunwind_available"><span class="keyword">val</span> libunwind_available</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether the libunwind library is available on the target</p>
</div>
</div>

<pre><span id="VALlibunwind_link_flags"><span class="keyword">val</span> libunwind_link_flags</span> : <code class="type">string</code></pre><div class="info ">
<div class="info-desc">
<p>Linker flags to use libunwind</p>
</div>
</div>

<pre><span id="VALsafe_string"><span class="keyword">val</span> safe_string</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether the compiler was configured with -force-safe-string;
    in that case, the -unsafe-string compile-time option is unavailable</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>

<pre><span id="VALdefault_safe_string"><span class="keyword">val</span> default_safe_string</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether the compiler was configured to use the -safe-string
    or -unsafe-string compile-time option by default.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.06.0</li>
</ul>
</div>

<pre><span id="VALflat_float_array"><span class="keyword">val</span> flat_float_array</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether the compiler and runtime automagically flatten float
    arrays</p>
</div>
</div>

<pre><span id="VALwindows_unicode"><span class="keyword">val</span> windows_unicode</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether Windows Unicode runtime is enabled</p>
</div>
</div>

<pre><span id="VALsupports_shared_libraries"><span class="keyword">val</span> supports_shared_libraries</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether shared libraries are supported</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.08.0</li>
</ul>
</div>

<pre><span id="VALafl_instrument"><span class="keyword">val</span> afl_instrument</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p>Whether afl-fuzz instrumentation is generated by default</p>
</div>
</div>

<pre><span id="VALprint_config"><span class="keyword">val</span> print_config</span> : <code class="type">out_channel -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Access to configuration values</p>
</div>
</div>

<pre><span id="VALconfig_var"><span class="keyword">val</span> config_var</span> : <code class="type">string -&gt; string option</code></pre><div class="info ">
<div class="info-desc">
<p>the configuration value of a variable, if it exists</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>