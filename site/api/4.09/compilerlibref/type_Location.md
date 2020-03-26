<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Location.html">Location</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Warnings</span>.loc&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;loc_start&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.position;<br>
&nbsp;&nbsp;&nbsp;&nbsp;loc_end&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.position;<br>
&nbsp;&nbsp;&nbsp;&nbsp;loc_ghost&nbsp;:&nbsp;bool;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;none&nbsp;:&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;in_file&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;init&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;curr&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symbol_rloc&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symbol_gloc&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs_loc&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs_interval&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_pos_info&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;*&nbsp;int&nbsp;*&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;loc&nbsp;=&nbsp;{&nbsp;txt&nbsp;:&nbsp;<span class="keywordsign">'</span>a;&nbsp;loc&nbsp;:&nbsp;<span class="constructor">Location</span>.t;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mknoloc&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Location</span>.loc<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mkloc&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Location</span>.loc<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;input_name&nbsp;:&nbsp;string&nbsp;<span class="constructor">Stdlib</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;input_lexbuf&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;option&nbsp;<span class="constructor">Stdlib</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;echo_eof&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;reset&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rewrite_absolute_path&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;absolute_path&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;show_filename&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_filename&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_loc&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_locs&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;highlight_terminfo&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;msg&nbsp;=&nbsp;(<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="constructor">Location</span>.loc<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;msg&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter,&nbsp;unit,&nbsp;<span class="constructor">Location</span>.msg)&nbsp;<span class="constructor">Stdlib</span>.format4&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;report_kind&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Report_error</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Report_warning</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Report_warning_as_error</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Report_alert</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Report_alert_as_error</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;report&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;kind&nbsp;:&nbsp;<span class="constructor">Location</span>.report_kind;<br>
&nbsp;&nbsp;&nbsp;&nbsp;main&nbsp;:&nbsp;<span class="constructor">Location</span>.msg;<br>
&nbsp;&nbsp;&nbsp;&nbsp;sub&nbsp;:&nbsp;<span class="constructor">Location</span>.msg&nbsp;list;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;report_printer&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;pp&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report_printer&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.report&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit;<br>
&nbsp;&nbsp;&nbsp;&nbsp;pp_report_kind&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report_printer&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.report_kind&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit;<br>
&nbsp;&nbsp;&nbsp;&nbsp;pp_main_loc&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report_printer&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit;<br>
&nbsp;&nbsp;&nbsp;&nbsp;pp_main_txt&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report_printer&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit;<br>
&nbsp;&nbsp;&nbsp;&nbsp;pp_submsgs&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report_printer&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.msg&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit;<br>
&nbsp;&nbsp;&nbsp;&nbsp;pp_submsg&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report_printer&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.msg&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit;<br>
&nbsp;&nbsp;&nbsp;&nbsp;pp_submsg_loc&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report_printer&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit;<br>
&nbsp;&nbsp;&nbsp;&nbsp;pp_submsg_txt&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report_printer&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.report&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;batch_mode_printer&nbsp;:&nbsp;<span class="constructor">Location</span>.report_printer<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;terminfo_toplevel_printer&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.report_printer<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;best_toplevel_printer&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.report_printer<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_report&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.report&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;report_printer&nbsp;:&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.report_printer)&nbsp;<span class="constructor">Stdlib</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_report_printer&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.report_printer<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;report_warning&nbsp;:&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Warnings</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.report&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;warning_reporter&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Warnings</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.report&nbsp;option)&nbsp;<span class="constructor">Stdlib</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_warning_reporter&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Warnings</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.report&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;formatter_for_warnings&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="constructor">Stdlib</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_warning&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Warnings</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;prerr_warning&nbsp;:&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Warnings</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;report_alert&nbsp;:&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Warnings</span>.alert&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.report&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;alert_reporter&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Warnings</span>.alert&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.report&nbsp;option)&nbsp;<span class="constructor">Stdlib</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_alert_reporter&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Warnings</span>.alert&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.report&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_alert&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Warnings</span>.alert&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;prerr_alert&nbsp;:&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Warnings</span>.alert&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;deprecated&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?def:<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;?use:<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;alert&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?def:<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?use:<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;kind:string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;error&nbsp;=&nbsp;<span class="constructor">Location</span>.report<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;error&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;?sub:<span class="constructor">Location</span>.msg&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.error<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;errorf&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?sub:<span class="constructor">Location</span>.msg&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter,&nbsp;unit,&nbsp;<span class="constructor">Location</span>.error)&nbsp;<span class="constructor">Stdlib</span>.format4&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;error_of_printer&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?sub:<span class="constructor">Location</span>.msg&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.error<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;error_of_printer_file&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.error<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;register_error_of_exn&nbsp;:&nbsp;(exn&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.error&nbsp;option)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;error_of_exn&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;exn&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;[&nbsp;<span class="keywordsign">`</span><span class="constructor">Already_displayed</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Ok</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.error&nbsp;]&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Error</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.error<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Already_displayed_error</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;raise_errorf&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?loc:<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?sub:<span class="constructor">Location</span>.msg&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter,&nbsp;unit,&nbsp;<span class="keywordsign">'</span>b)&nbsp;<span class="constructor">Stdlib</span>.format4&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;report_exception&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;exn&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>