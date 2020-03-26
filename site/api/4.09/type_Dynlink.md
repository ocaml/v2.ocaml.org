<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Dynlink.html">Dynlink</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;is_native&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;loadfile&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;loadfile_private&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;adapt_filename&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_allowed_units&nbsp;:&nbsp;string&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;allow_only&nbsp;:&nbsp;string&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;prohibit&nbsp;:&nbsp;string&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;main_program_units&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;public_dynamically_loaded_units&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;all_units&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;allow_unsafe_modules&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;linking_error&nbsp;=&nbsp;<span class="keyword">private</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Undefined_global</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unavailable_primitive</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Uninitialized_global</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;error&nbsp;=&nbsp;<span class="keyword">private</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Not_a_bytecode_file</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Inconsistent_import</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unavailable_unit</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unsafe_file</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Linking_error</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;<span class="constructor">Dynlink</span>.linking_error<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Corrupted_interface</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Cannot_open_dynamic_library</span>&nbsp;<span class="keyword">of</span>&nbsp;exn<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Library's_module_initializers_failed</span>&nbsp;<span class="keyword">of</span>&nbsp;exn<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Inconsistent_implementation</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Module_already_loaded</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Private_library_cannot_implement_interface</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Error</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Dynlink</span>.error<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;error_message&nbsp;:&nbsp;<span class="constructor">Dynlink</span>.error&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unsafe_get_global_value&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;bytecode_or_asm_symbol:string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Obj</span>.t&nbsp;option<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>