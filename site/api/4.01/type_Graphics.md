<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Graphics.html">Graphics</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Graphic_failure</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_graph&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;close_graph&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_window_title&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;resize_window&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;clear_graph&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gr_clear_graph"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;size_x&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_gr_size_x"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;size_y&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_gr_size_y"</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;color&nbsp;=&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rgb&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Graphics</span>.color<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;set_color&nbsp;:&nbsp;<span class="constructor">Graphics</span>.color&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gr_set_color"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;background&nbsp;:&nbsp;<span class="constructor">Graphics</span>.color<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;foreground&nbsp;:&nbsp;<span class="constructor">Graphics</span>.color<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;black&nbsp;:&nbsp;<span class="constructor">Graphics</span>.color<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;white&nbsp;:&nbsp;<span class="constructor">Graphics</span>.color<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;red&nbsp;:&nbsp;<span class="constructor">Graphics</span>.color<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;green&nbsp;:&nbsp;<span class="constructor">Graphics</span>.color<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;blue&nbsp;:&nbsp;<span class="constructor">Graphics</span>.color<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;yellow&nbsp;:&nbsp;<span class="constructor">Graphics</span>.color<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;cyan&nbsp;:&nbsp;<span class="constructor">Graphics</span>.color<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;magenta&nbsp;:&nbsp;<span class="constructor">Graphics</span>.color<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;plot&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gr_plot"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;plots&nbsp;:&nbsp;(int&nbsp;*&nbsp;int)&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;point_color&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Graphics</span>.color&nbsp;=&nbsp;<span class="string">"caml_gr_point_color"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;moveto&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gr_moveto"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rmoveto&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;current_x&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_gr_current_x"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;current_y&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_gr_current_y"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;current_point&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;*&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;lineto&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gr_lineto"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rlineto&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;curveto&nbsp;:&nbsp;int&nbsp;*&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;*&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;*&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;draw_rect&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;draw_poly_line&nbsp;:&nbsp;(int&nbsp;*&nbsp;int)&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;draw_poly&nbsp;:&nbsp;(int&nbsp;*&nbsp;int)&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;draw_segments&nbsp;:&nbsp;(int&nbsp;*&nbsp;int&nbsp;*&nbsp;int&nbsp;*&nbsp;int)&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;draw_arc&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;draw_ellipse&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;draw_circle&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_line_width&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;draw_char&nbsp;:&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gr_draw_char"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;draw_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gr_draw_string"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;set_font&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gr_set_font"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_text_size&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;text_size&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;*&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_gr_text_size"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fill_rect&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;fill_poly&nbsp;:&nbsp;(int&nbsp;*&nbsp;int)&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gr_fill_poly"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fill_arc&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fill_ellipse&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fill_circle&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;image<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;transp&nbsp;:&nbsp;<span class="constructor">Graphics</span>.color<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;make_image&nbsp;:&nbsp;<span class="constructor">Graphics</span>.color&nbsp;array&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Graphics</span>.image<br>
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_gr_make_image"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;dump_image&nbsp;:&nbsp;<span class="constructor">Graphics</span>.image&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Graphics</span>.color&nbsp;array&nbsp;array<br>
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_gr_dump_image"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;draw_image&nbsp;:&nbsp;<span class="constructor">Graphics</span>.image&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_gr_draw_image"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_image&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Graphics</span>.image<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;create_image&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Graphics</span>.image<br>
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_gr_create_image"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;blit_image&nbsp;:&nbsp;<span class="constructor">Graphics</span>.image&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_gr_blit_image"</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;status&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;mouse_x&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;mouse_y&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;button&nbsp;:&nbsp;bool;<br>
&nbsp;&nbsp;&nbsp;&nbsp;keypressed&nbsp;:&nbsp;bool;<br>
&nbsp;&nbsp;&nbsp;&nbsp;key&nbsp;:&nbsp;char;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;event&nbsp;=&nbsp;<span class="constructor">Button_down</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Button_up</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Key_pressed</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Mouse_motion</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Poll</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;wait_next_event&nbsp;:&nbsp;<span class="constructor">Graphics</span>.event&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Graphics</span>.status<br>
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_gr_wait_event"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;loop_at_exit&nbsp;:&nbsp;<span class="constructor">Graphics</span>.event&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="constructor">Graphics</span>.status&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mouse_pos&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;*&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;button_down&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;read_key&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;key_pressed&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;sound&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gr_sound"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;auto_synchronize&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;synchronize&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gr_synchronize"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;display_mode&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gr_display_mode"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;remember_mode&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_gr_remember_mode"</span><br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>