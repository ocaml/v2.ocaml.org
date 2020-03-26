<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Printexc.html">Printexc</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;to_string&nbsp;:&nbsp;exn&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print&nbsp;:&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;catch&nbsp;:&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_backtrace&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_backtrace&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;record_backtrace&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;backtrace_status&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;register_printer&nbsp;:&nbsp;(exn&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;option)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;raw_backtrace<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_raw_backtrace&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Printexc</span>.raw_backtrace<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_raw_backtrace&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Printexc</span>.raw_backtrace&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;raw_backtrace_to_string&nbsp;:&nbsp;<span class="constructor">Printexc</span>.raw_backtrace&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;raise_with_backtrace&nbsp;:&nbsp;exn&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Printexc</span>.raw_backtrace&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"%raise_with_backtrace"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_callstack&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Printexc</span>.raw_backtrace<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_uncaught_exception_handler&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(exn&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Printexc</span>.raw_backtrace&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;backtrace_slot<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;backtrace_slots&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Printexc</span>.raw_backtrace&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Printexc</span>.backtrace_slot&nbsp;array&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;location&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;filename&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;line_number&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;start_char&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;end_char&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Slot</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=&nbsp;<span class="constructor">Printexc</span>.backtrace_slot<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;is_raise&nbsp;:&nbsp;<span class="constructor">Printexc</span>.<span class="constructor">Slot</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;is_inline&nbsp;:&nbsp;<span class="constructor">Printexc</span>.<span class="constructor">Slot</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;location&nbsp;:&nbsp;<span class="constructor">Printexc</span>.<span class="constructor">Slot</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Printexc</span>.location&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;format&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Printexc</span>.<span class="constructor">Slot</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;raw_backtrace_slot<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;raw_backtrace_length&nbsp;:&nbsp;<span class="constructor">Printexc</span>.raw_backtrace&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_raw_backtrace_slot&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Printexc</span>.raw_backtrace&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Printexc</span>.raw_backtrace_slot<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;convert_raw_backtrace_slot&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Printexc</span>.raw_backtrace_slot&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Printexc</span>.backtrace_slot<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_raw_backtrace_next_slot&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Printexc</span>.raw_backtrace_slot&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Printexc</span>.raw_backtrace_slot&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;exn_slot_id&nbsp;:&nbsp;exn&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;exn_slot_name&nbsp;:&nbsp;exn&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>