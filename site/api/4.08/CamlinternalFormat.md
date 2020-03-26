<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalFormat</a></div><ul></ul></nav></header>

<h1>Module <a href="type_CamlinternalFormat.html">CamlinternalFormat</a></h1>

<pre><span id="MODULECamlinternalFormat"><span class="keyword">module</span> CamlinternalFormat</span>: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalFormat.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="VALis_in_char_set"><span class="keyword">val</span> is_in_char_set</span> : <code class="type"><a href="CamlinternalFormatBasics.html#TYPEchar_set">CamlinternalFormatBasics.char_set</a> -&gt; char -&gt; bool</code></pre>
<pre><span id="VALrev_char_set"><span class="keyword">val</span> rev_char_set</span> : <code class="type"><a href="CamlinternalFormatBasics.html#TYPEchar_set">CamlinternalFormatBasics.char_set</a> -&gt; <a href="CamlinternalFormatBasics.html#TYPEchar_set">CamlinternalFormatBasics.char_set</a></code></pre>
<pre><span id="TYPEmutable_char_set"><span class="keyword">type</span> <code class="type"></code>mutable_char_set</span> = <code class="type">bytes</code> </pre>


<pre><span id="VALcreate_char_set"><span class="keyword">val</span> create_char_set</span> : <code class="type">unit -&gt; <a href="CamlinternalFormat.html#TYPEmutable_char_set">mutable_char_set</a></code></pre>
<pre><span id="VALadd_in_char_set"><span class="keyword">val</span> add_in_char_set</span> : <code class="type"><a href="CamlinternalFormat.html#TYPEmutable_char_set">mutable_char_set</a> -&gt; char -&gt; unit</code></pre>
<pre><span id="VALfreeze_char_set"><span class="keyword">val</span> freeze_char_set</span> : <code class="type"><a href="CamlinternalFormat.html#TYPEmutable_char_set">mutable_char_set</a> -&gt; <a href="CamlinternalFormatBasics.html#TYPEchar_set">CamlinternalFormatBasics.char_set</a></code></pre>
<pre><code><span id="TYPEparam_format_ebb"><span class="keyword">type</span> <code class="type">('a, 'b, 'c, 'd, 'e, 'f)</code> param_format_ebb</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTparam_format_ebb.Param_format_EBB"><span class="constructor">Param_format_EBB</span></span> <span class="keyword">:</span> <code class="type">('x -&gt; 'a0, 'b0, 'c0, 'd0, 'e0, 'f0) <a href="CamlinternalFormatBasics.html#TYPEfmt">CamlinternalFormatBasics.fmt</a></code> <span class="keyword">-&gt;</span> <code class="type">('a0, 'b0, 'c0, 'd0, 'e0, 'f0) <a href="CamlinternalFormat.html#TYPEparam_format_ebb">param_format_ebb</a></code></code></td>

</tr></tbody></table>



<pre><span id="VALparam_format_of_ignored_format"><span class="keyword">val</span> param_format_of_ignored_format</span> : <code class="type">('a, 'b, 'c, 'd, 'y, 'x) <a href="CamlinternalFormatBasics.html#TYPEignored">CamlinternalFormatBasics.ignored</a> -&gt;<br>       ('x, 'b, 'c, 'y, 'e, 'f) <a href="CamlinternalFormatBasics.html#TYPEfmt">CamlinternalFormatBasics.fmt</a> -&gt;<br>       ('a, 'b, 'c, 'd, 'e, 'f) <a href="CamlinternalFormat.html#TYPEparam_format_ebb">param_format_ebb</a></code></pre>
<pre><code><span id="TYPEacc_formatting_gen"><span class="keyword">type</span> <code class="type">('b, 'c)</code> acc_formatting_gen</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTacc_formatting_gen.Acc_open_tag"><span class="constructor">Acc_open_tag</span></span> <span class="keyword">of</span> <code class="type">('b, 'c) <a href="CamlinternalFormat.html#TYPEacc">acc</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTacc_formatting_gen.Acc_open_box"><span class="constructor">Acc_open_box</span></span> <span class="keyword">of</span> <code class="type">('b, 'c) <a href="CamlinternalFormat.html#TYPEacc">acc</a></code></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEacc"><span class="keyword">type</span> <code class="type">('b, 'c)</code> acc</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTacc.Acc_formatting_lit"><span class="constructor">Acc_formatting_lit</span></span> <span class="keyword">of</span> <code class="type">('b, 'c) <a href="CamlinternalFormat.html#TYPEacc">acc</a> * <a href="CamlinternalFormatBasics.html#TYPEformatting_lit">CamlinternalFormatBasics.formatting_lit</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTacc.Acc_formatting_gen"><span class="constructor">Acc_formatting_gen</span></span> <span class="keyword">of</span> <code class="type">('b, 'c) <a href="CamlinternalFormat.html#TYPEacc">acc</a><br>        * ('b, 'c) <a href="CamlinternalFormat.html#TYPEacc_formatting_gen">acc_formatting_gen</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTacc.Acc_string_literal"><span class="constructor">Acc_string_literal</span></span> <span class="keyword">of</span> <code class="type">('b, 'c) <a href="CamlinternalFormat.html#TYPEacc">acc</a> * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTacc.Acc_char_literal"><span class="constructor">Acc_char_literal</span></span> <span class="keyword">of</span> <code class="type">('b, 'c) <a href="CamlinternalFormat.html#TYPEacc">acc</a> * char</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTacc.Acc_data_string"><span class="constructor">Acc_data_string</span></span> <span class="keyword">of</span> <code class="type">('b, 'c) <a href="CamlinternalFormat.html#TYPEacc">acc</a> * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTacc.Acc_data_char"><span class="constructor">Acc_data_char</span></span> <span class="keyword">of</span> <code class="type">('b, 'c) <a href="CamlinternalFormat.html#TYPEacc">acc</a> * char</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTacc.Acc_delay"><span class="constructor">Acc_delay</span></span> <span class="keyword">of</span> <code class="type">('b, 'c) <a href="CamlinternalFormat.html#TYPEacc">acc</a> * ('b -&gt; 'c)</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTacc.Acc_flush"><span class="constructor">Acc_flush</span></span> <span class="keyword">of</span> <code class="type">('b, 'c) <a href="CamlinternalFormat.html#TYPEacc">acc</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTacc.Acc_invalid_arg"><span class="constructor">Acc_invalid_arg</span></span> <span class="keyword">of</span> <code class="type">('b, 'c) <a href="CamlinternalFormat.html#TYPEacc">acc</a> * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTacc.End_of_acc"><span class="constructor">End_of_acc</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEheter_list"><span class="keyword">type</span> <code class="type">('a, 'b)</code> heter_list</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTheter_list.Cons"><span class="constructor">Cons</span></span> <span class="keyword">:</span> <code class="type">'c * ('a0, 'b0) <a href="CamlinternalFormat.html#TYPEheter_list">heter_list</a></code> <span class="keyword">-&gt;</span> <code class="type">('c -&gt; 'a0, 'b0) <a href="CamlinternalFormat.html#TYPEheter_list">heter_list</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTheter_list.Nil"><span class="constructor">Nil</span></span> <span class="keyword">:</span> <code class="type">('b1, 'b1) <a href="CamlinternalFormat.html#TYPEheter_list">heter_list</a></code></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEfmt_ebb"><span class="keyword">type</span> <code class="type">('b, 'c, 'e, 'f)</code> fmt_ebb</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfmt_ebb.Fmt_EBB"><span class="constructor">Fmt_EBB</span></span> <span class="keyword">:</span> <code class="type">('a, 'b0, 'c0, 'd, 'e0, 'f0) <a href="CamlinternalFormatBasics.html#TYPEfmt">CamlinternalFormatBasics.fmt</a></code> <span class="keyword">-&gt;</span> <code class="type">('b0, 'c0, 'e0, 'f0) <a href="CamlinternalFormat.html#TYPEfmt_ebb">fmt_ebb</a></code></code></td>

</tr></tbody></table>



<pre><span id="VALmake_printf"><span class="keyword">val</span> make_printf</span> : <code class="type">(('b, 'c) <a href="CamlinternalFormat.html#TYPEacc">acc</a> -&gt; 'd) -&gt;<br>       ('b, 'c) <a href="CamlinternalFormat.html#TYPEacc">acc</a> -&gt;<br>       ('a, 'b, 'c, 'c, 'c, 'd) <a href="CamlinternalFormatBasics.html#TYPEfmt">CamlinternalFormatBasics.fmt</a> -&gt; 'a</code></pre>
<pre><span id="VALmake_iprintf"><span class="keyword">val</span> make_iprintf</span> : <code class="type">('s -&gt; 'f) -&gt;<br>       's -&gt; ('a, 'b, 'c, 'd, 'e, 'f) <a href="CamlinternalFormatBasics.html#TYPEfmt">CamlinternalFormatBasics.fmt</a> -&gt; 'a</code></pre>
<pre><span id="VALoutput_acc"><span class="keyword">val</span> output_acc</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt;<br>       (<a href="Stdlib.html#TYPEout_channel">out_channel</a>, unit) <a href="CamlinternalFormat.html#TYPEacc">acc</a> -&gt; unit</code></pre>
<pre><span id="VALbufput_acc"><span class="keyword">val</span> bufput_acc</span> : <code class="type"><a href="Buffer.html#TYPEt">Buffer.t</a> -&gt; (<a href="Buffer.html#TYPEt">Buffer.t</a>, unit) <a href="CamlinternalFormat.html#TYPEacc">acc</a> -&gt; unit</code></pre>
<pre><span id="VALstrput_acc"><span class="keyword">val</span> strput_acc</span> : <code class="type"><a href="Buffer.html#TYPEt">Buffer.t</a> -&gt; (unit, string) <a href="CamlinternalFormat.html#TYPEacc">acc</a> -&gt; unit</code></pre>
<pre><span id="VALtype_format"><span class="keyword">val</span> type_format</span> : <code class="type">('x, 'b, 'c, 't, 'u, 'v) <a href="CamlinternalFormatBasics.html#TYPEfmt">CamlinternalFormatBasics.fmt</a> -&gt;<br>       ('a, 'b, 'c, 'd, 'e, 'f) <a href="CamlinternalFormatBasics.html#TYPEfmtty">CamlinternalFormatBasics.fmtty</a> -&gt;<br>       ('a, 'b, 'c, 'd, 'e, 'f) <a href="CamlinternalFormatBasics.html#TYPEfmt">CamlinternalFormatBasics.fmt</a></code></pre>
<pre><span id="VALfmt_ebb_of_string"><span class="keyword">val</span> fmt_ebb_of_string</span> : <code class="type">?legacy_behavior:bool -&gt;<br>       string -&gt; ('b, 'c, 'e, 'f) <a href="CamlinternalFormat.html#TYPEfmt_ebb">fmt_ebb</a></code></pre>
<pre><span id="VALformat_of_string_fmtty"><span class="keyword">val</span> format_of_string_fmtty</span> : <code class="type">string -&gt;<br>       ('a, 'b, 'c, 'd, 'e, 'f) <a href="CamlinternalFormatBasics.html#TYPEfmtty">CamlinternalFormatBasics.fmtty</a> -&gt;<br>       ('a, 'b, 'c, 'd, 'e, 'f) <a href="CamlinternalFormatBasics.html#TYPEformat6">CamlinternalFormatBasics.format6</a></code></pre>
<pre><span id="VALformat_of_string_format"><span class="keyword">val</span> format_of_string_format</span> : <code class="type">string -&gt;<br>       ('a, 'b, 'c, 'd, 'e, 'f) <a href="CamlinternalFormatBasics.html#TYPEformat6">CamlinternalFormatBasics.format6</a> -&gt;<br>       ('a, 'b, 'c, 'd, 'e, 'f) <a href="CamlinternalFormatBasics.html#TYPEformat6">CamlinternalFormatBasics.format6</a></code></pre>
<pre><span id="VALchar_of_iconv"><span class="keyword">val</span> char_of_iconv</span> : <code class="type"><a href="CamlinternalFormatBasics.html#TYPEint_conv">CamlinternalFormatBasics.int_conv</a> -&gt; char</code></pre>
<pre><span id="VALstring_of_formatting_lit"><span class="keyword">val</span> string_of_formatting_lit</span> : <code class="type"><a href="CamlinternalFormatBasics.html#TYPEformatting_lit">CamlinternalFormatBasics.formatting_lit</a> -&gt; string</code></pre>
<pre><span id="VALstring_of_formatting_gen"><span class="keyword">val</span> string_of_formatting_gen</span> : <code class="type">('a, 'b, 'c, 'd, 'e, 'f) <a href="CamlinternalFormatBasics.html#TYPEformatting_gen">CamlinternalFormatBasics.formatting_gen</a> -&gt; string</code></pre>
<pre><span id="VALstring_of_fmtty"><span class="keyword">val</span> string_of_fmtty</span> : <code class="type">('a, 'b, 'c, 'd, 'e, 'f) <a href="CamlinternalFormatBasics.html#TYPEfmtty">CamlinternalFormatBasics.fmtty</a> -&gt; string</code></pre>
<pre><span id="VALstring_of_fmt"><span class="keyword">val</span> string_of_fmt</span> : <code class="type">('a, 'b, 'c, 'd, 'e, 'f) <a href="CamlinternalFormatBasics.html#TYPEfmt">CamlinternalFormatBasics.fmt</a> -&gt; string</code></pre>
<pre><span id="VALopen_box_of_string"><span class="keyword">val</span> open_box_of_string</span> : <code class="type">string -&gt; int * <a href="CamlinternalFormatBasics.html#TYPEblock_type">CamlinternalFormatBasics.block_type</a></code></pre>
<pre><span id="VALsymm"><span class="keyword">val</span> symm</span> : <code class="type">('a1, 'b1, 'c1, 'd1, 'e1, 'f1, 'a2, 'b2, 'c2, 'd2, 'e2, 'f2)<br>       <a href="CamlinternalFormatBasics.html#TYPEfmtty_rel">CamlinternalFormatBasics.fmtty_rel</a> -&gt;<br>       ('a2, 'b2, 'c2, 'd2, 'e2, 'f2, 'a1, 'b1, 'c1, 'd1, 'e1, 'f1)<br>       <a href="CamlinternalFormatBasics.html#TYPEfmtty_rel">CamlinternalFormatBasics.fmtty_rel</a></code></pre>
<pre><span id="VALtrans"><span class="keyword">val</span> trans</span> : <code class="type">('a1, 'b1, 'c1, 'd1, 'e1, 'f1, 'a2, 'b2, 'c2, 'd2, 'e2, 'f2)<br>       <a href="CamlinternalFormatBasics.html#TYPEfmtty_rel">CamlinternalFormatBasics.fmtty_rel</a> -&gt;<br>       ('a2, 'b2, 'c2, 'd2, 'e2, 'f2, 'a3, 'b3, 'c3, 'd3, 'e3, 'f3)<br>       <a href="CamlinternalFormatBasics.html#TYPEfmtty_rel">CamlinternalFormatBasics.fmtty_rel</a> -&gt;<br>       ('a1, 'b1, 'c1, 'd1, 'e1, 'f1, 'a3, 'b3, 'c3, 'd3, 'e3, 'f3)<br>       <a href="CamlinternalFormatBasics.html#TYPEfmtty_rel">CamlinternalFormatBasics.fmtty_rel</a></code></pre>
<pre><span id="VALrecast"><span class="keyword">val</span> recast</span> : <code class="type">('a1, 'b1, 'c1, 'd1, 'e1, 'f1) <a href="CamlinternalFormatBasics.html#TYPEfmt">CamlinternalFormatBasics.fmt</a> -&gt;<br>       ('a1, 'b1, 'c1, 'd1, 'e1, 'f1, 'a2, 'b2, 'c2, 'd2, 'e2, 'f2)<br>       <a href="CamlinternalFormatBasics.html#TYPEfmtty_rel">CamlinternalFormatBasics.fmtty_rel</a> -&gt;<br>       ('a2, 'b2, 'c2, 'd2, 'e2, 'f2) <a href="CamlinternalFormatBasics.html#TYPEfmt">CamlinternalFormatBasics.fmt</a></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>