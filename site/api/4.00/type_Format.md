<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Format.html">Format</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_box&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;close_box&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_as&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_int&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_float&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_char&nbsp;:&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_bool&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_space&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_cut&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_break&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_flush&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_newline&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;force_newline&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_if_newline&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_margin&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_margin&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_max_indent&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_max_indent&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_max_boxes&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_max_boxes&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;over_max_boxes&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_hbox&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_vbox&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_hvbox&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_hovbox&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_tbox&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;close_tbox&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_tbreak&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_tab&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_tab&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_ellipsis_text&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_ellipsis_text&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;tag&nbsp;=&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_tag&nbsp;:&nbsp;<span class="constructor">Format</span>.tag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;close_tag&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_tags&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_print_tags&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_mark_tags&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_print_tags&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_mark_tags&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_formatter_out_channel&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_formatter_output_functions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_formatter_output_functions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;*&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_all_formatter_output_functions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;out:(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;flush:(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;newline:(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;spaces:(int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_all_formatter_output_functions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;*&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;*&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;(int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;formatter_tag_functions&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;mark_open_tag&nbsp;:&nbsp;<span class="constructor">Format</span>.tag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;mark_close_tag&nbsp;:&nbsp;<span class="constructor">Format</span>.tag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;print_open_tag&nbsp;:&nbsp;<span class="constructor">Format</span>.tag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit;<br>
&nbsp;&nbsp;&nbsp;&nbsp;print_close_tag&nbsp;:&nbsp;<span class="constructor">Format</span>.tag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_formatter_tag_functions&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter_tag_functions&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_formatter_tag_functions&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Format</span>.formatter_tag_functions<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;formatter<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;formatter_of_out_channel&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Format</span>.formatter<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;std_formatter&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;err_formatter&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;formatter_of_buffer&nbsp;:&nbsp;<span class="constructor">Buffer</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Format</span>.formatter<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stdbuf&nbsp;:&nbsp;<span class="constructor">Buffer</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;str_formatter&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;flush_str_formatter&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;make_formatter&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Format</span>.formatter<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_open_hbox&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_open_vbox&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_open_hvbox&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_open_hovbox&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_open_box&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_close_box&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_open_tag&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_close_tag&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_string&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_as&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_int&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_float&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_char&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_bool&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_break&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_cut&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_space&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_force_newline&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_flush&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_newline&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_if_newline&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_open_tbox&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_close_tbox&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_tbreak&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_set_tab&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_print_tab&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_set_tags&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_set_print_tags&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_set_mark_tags&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_get_print_tags&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_get_mark_tags&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_set_margin&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_get_margin&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_set_max_indent&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_get_max_indent&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_set_max_boxes&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_get_max_boxes&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_over_max_boxes&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_set_ellipsis_text&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_get_ellipsis_text&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_set_formatter_out_channel&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_set_formatter_output_functions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_get_formatter_output_functions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;*&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_set_all_formatter_output_functions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;out:(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;flush:(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;newline:(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;spaces:(int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_get_all_formatter_output_functions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;*&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;*&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;(int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_set_formatter_tag_functions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Format</span>.formatter_tag_functions&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pp_get_formatter_tag_functions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Format</span>.formatter_tag_functions<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fprintf&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="constructor">Format</span>.formatter,&nbsp;unit)&nbsp;<span class="constructor">Pervasives</span>.format&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;printf&nbsp;:&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="constructor">Format</span>.formatter,&nbsp;unit)&nbsp;<span class="constructor">Pervasives</span>.format&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;eprintf&nbsp;:&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="constructor">Format</span>.formatter,&nbsp;unit)&nbsp;<span class="constructor">Pervasives</span>.format&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sprintf&nbsp;:&nbsp;(<span class="keywordsign">'</span>a,&nbsp;unit,&nbsp;string)&nbsp;<span class="constructor">Pervasives</span>.format&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ifprintf&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="constructor">Format</span>.formatter,&nbsp;unit)&nbsp;<span class="constructor">Pervasives</span>.format&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;kfprintf&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>b,&nbsp;<span class="constructor">Format</span>.formatter,&nbsp;unit,&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="constructor">Pervasives</span>.format4&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ikfprintf&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>b,&nbsp;<span class="constructor">Format</span>.formatter,&nbsp;unit,&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="constructor">Pervasives</span>.format4&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ksprintf&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="keywordsign">'</span>b,&nbsp;unit,&nbsp;string,&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="constructor">Pervasives</span>.format4&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;bprintf&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Buffer</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="constructor">Format</span>.formatter,&nbsp;unit)&nbsp;<span class="constructor">Pervasives</span>.format&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;kprintf&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="keywordsign">'</span>b,&nbsp;unit,&nbsp;string,&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="constructor">Pervasives</span>.format4&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b<br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>