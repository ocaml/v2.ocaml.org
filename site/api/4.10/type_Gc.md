<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Gc.html">Gc</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;stat&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;minor_words&nbsp;:&nbsp;float;<br>
&nbsp;&nbsp;&nbsp;&nbsp;promoted_words&nbsp;:&nbsp;float;<br>
&nbsp;&nbsp;&nbsp;&nbsp;major_words&nbsp;:&nbsp;float;<br>
&nbsp;&nbsp;&nbsp;&nbsp;minor_collections&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;major_collections&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;heap_words&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;heap_chunks&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;live_words&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;live_blocks&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;free_words&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;free_blocks&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;largest_free&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;fragments&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;compactions&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;top_heap_words&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;stack_size&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;control&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;minor_heap_size&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;major_heap_increment&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;space_overhead&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;verbose&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;max_overhead&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;stack_limit&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;allocation_policy&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;window_size&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;custom_major_ratio&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;custom_minor_ratio&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;custom_minor_max_size&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;stat&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Gc</span>.stat&nbsp;=&nbsp;<span class="string">"caml_gc_stat"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;quick_stat&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Gc</span>.stat&nbsp;=&nbsp;<span class="string">"caml_gc_quick_stat"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;counters&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;*&nbsp;float&nbsp;*&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_gc_counters"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;minor_words&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(float&nbsp;[@unboxed])&nbsp;=&nbsp;<span class="string">"caml_gc_minor_words"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="string">"caml_gc_minor_words_unboxed"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;get&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Gc</span>.control&nbsp;=&nbsp;<span class="string">"caml_gc_get"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;set&nbsp;:&nbsp;<span class="constructor">Gc</span>.control&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gc_set"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;minor&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gc_minor"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;major_slice&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_gc_major_slice"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;major&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gc_major"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;full_major&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gc_full_major"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;compact&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gc_compaction"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_stat&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;allocated_bytes&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;get_minor_free&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_get_minor_free"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;get_bucket&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_get_major_bucket"</span>&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;get_credit&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_get_major_credit"</span>&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;huge_fallback_count&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_gc_huge_fallback_count"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;finalise&nbsp;:&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;finalise_last&nbsp;:&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;finalise_release&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;alarm<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;create_alarm&nbsp;:&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Gc</span>.alarm<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;delete_alarm&nbsp;:&nbsp;<span class="constructor">Gc</span>.alarm&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>