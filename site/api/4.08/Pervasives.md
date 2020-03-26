<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Pervasives</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Pervasives.html">Pervasives</a></h1>

<pre><span id="MODULEPervasives"><span class="keyword">module</span> Pervasives</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Pervasives.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-deprecated">
<span class="warning">Deprecated.</span>Use <a href="Stdlib.html"><code class="code"><span class="constructor">Stdlib</span></code></a></div>
</div>
<hr width="100%">

<pre><span id="VALraise"><span class="keyword">val</span> raise</span> : <code class="type">exn -&gt; 'a</code></pre>
<pre><span id="VALraise_notrace"><span class="keyword">val</span> raise_notrace</span> : <code class="type">exn -&gt; 'a</code></pre>
<pre><span id="VALinvalid_arg"><span class="keyword">val</span> invalid_arg</span> : <code class="type">string -&gt; 'a</code></pre>
<pre><span id="VALfailwith"><span class="keyword">val</span> failwith</span> : <code class="type">string -&gt; 'a</code></pre>
<pre><span id="EXCEPTIONExit"><span class="keyword">exception</span> Exit</span></pre>

<pre><span id="VAL(=)"><span class="keyword">val</span> (=)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre>
<pre><span id="VAL(<>)"><span class="keyword">val</span> (&lt;&gt;)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre>
<pre><span id="VAL(<)"><span class="keyword">val</span> (&lt;)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre>
<pre><span id="VAL(>)"><span class="keyword">val</span> (&gt;)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre>
<pre><span id="VAL(<=)"><span class="keyword">val</span> (&lt;=)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre>
<pre><span id="VAL(>=)"><span class="keyword">val</span> (&gt;=)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre>
<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type">'a -&gt; 'a -&gt; int</code></pre>
<pre><span id="VALmin"><span class="keyword">val</span> min</span> : <code class="type">'a -&gt; 'a -&gt; 'a</code></pre>
<pre><span id="VALmax"><span class="keyword">val</span> max</span> : <code class="type">'a -&gt; 'a -&gt; 'a</code></pre>
<pre><span id="VAL(==)"><span class="keyword">val</span> (==)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre>
<pre><span id="VAL(!=)"><span class="keyword">val</span> (!=)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre>
<pre><span id="VALnot"><span class="keyword">val</span> not</span> : <code class="type">bool -&gt; bool</code></pre>
<pre><span id="VAL(&amp;&amp;)"><span class="keyword">val</span> (&amp;&amp;)</span> : <code class="type">bool -&gt; bool -&gt; bool</code></pre>
<pre><span id="VAL(&amp;)"><span class="keyword">val</span> (&amp;)</span> : <code class="type">bool -&gt; bool -&gt; bool</code></pre>
<pre><span id="VAL(||)"><span class="keyword">val</span> (||)</span> : <code class="type">bool -&gt; bool -&gt; bool</code></pre>
<pre><span id="VAL(or)"><span class="keyword">val</span> (or)</span> : <code class="type">bool -&gt; bool -&gt; bool</code></pre>
<pre><span id="VAL__LOC__"><span class="keyword">val</span> __LOC__</span> : <code class="type">string</code></pre>
<pre><span id="VAL__FILE__"><span class="keyword">val</span> __FILE__</span> : <code class="type">string</code></pre>
<pre><span id="VAL__LINE__"><span class="keyword">val</span> __LINE__</span> : <code class="type">int</code></pre>
<pre><span id="VAL__MODULE__"><span class="keyword">val</span> __MODULE__</span> : <code class="type">string</code></pre>
<pre><span id="VAL__POS__"><span class="keyword">val</span> __POS__</span> : <code class="type">string * int * int * int</code></pre>
<pre><span id="VAL__LOC_OF__"><span class="keyword">val</span> __LOC_OF__</span> : <code class="type">'a -&gt; string * 'a</code></pre>
<pre><span id="VAL__LINE_OF__"><span class="keyword">val</span> __LINE_OF__</span> : <code class="type">'a -&gt; int * 'a</code></pre>
<pre><span id="VAL__POS_OF__"><span class="keyword">val</span> __POS_OF__</span> : <code class="type">'a -&gt; (string * int * int * int) * 'a</code></pre>
<pre><span id="VAL(|>)"><span class="keyword">val</span> (|&gt;)</span> : <code class="type">'a -&gt; ('a -&gt; 'b) -&gt; 'b</code></pre>
<pre><span id="VAL(@@)"><span class="keyword">val</span> (@@)</span> : <code class="type">('a -&gt; 'b) -&gt; 'a -&gt; 'b</code></pre>
<pre><span id="VAL(~-)"><span class="keyword">val</span> (~-)</span> : <code class="type">int -&gt; int</code></pre>
<pre><span id="VAL(~+)"><span class="keyword">val</span> (~+)</span> : <code class="type">int -&gt; int</code></pre>
<pre><span id="VALsucc"><span class="keyword">val</span> succ</span> : <code class="type">int -&gt; int</code></pre>
<pre><span id="VALpred"><span class="keyword">val</span> pred</span> : <code class="type">int -&gt; int</code></pre>
<pre><span id="VAL(+)"><span class="keyword">val</span> (+)</span> : <code class="type">int -&gt; int -&gt; int</code></pre>
<pre><span id="VAL(-)"><span class="keyword">val</span> (-)</span> : <code class="type">int -&gt; int -&gt; int</code></pre>
<pre><span id="VAL( * )"><span class="keyword">val</span> ( * )</span> : <code class="type">int -&gt; int -&gt; int</code></pre>
<pre><span id="VAL(/)"><span class="keyword">val</span> (/)</span> : <code class="type">int -&gt; int -&gt; int</code></pre>
<pre><span id="VAL(mod)"><span class="keyword">val</span> (mod)</span> : <code class="type">int -&gt; int -&gt; int</code></pre>
<pre><span id="VALabs"><span class="keyword">val</span> abs</span> : <code class="type">int -&gt; int</code></pre>
<pre><span id="VALmax_int"><span class="keyword">val</span> max_int</span> : <code class="type">int</code></pre>
<pre><span id="VALmin_int"><span class="keyword">val</span> min_int</span> : <code class="type">int</code></pre>
<pre><span id="VAL(land)"><span class="keyword">val</span> (land)</span> : <code class="type">int -&gt; int -&gt; int</code></pre>
<pre><span id="VAL(lor)"><span class="keyword">val</span> (lor)</span> : <code class="type">int -&gt; int -&gt; int</code></pre>
<pre><span id="VAL(lxor)"><span class="keyword">val</span> (lxor)</span> : <code class="type">int -&gt; int -&gt; int</code></pre>
<pre><span id="VALlnot"><span class="keyword">val</span> lnot</span> : <code class="type">int -&gt; int</code></pre>
<pre><span id="VAL(lsl)"><span class="keyword">val</span> (lsl)</span> : <code class="type">int -&gt; int -&gt; int</code></pre>
<pre><span id="VAL(lsr)"><span class="keyword">val</span> (lsr)</span> : <code class="type">int -&gt; int -&gt; int</code></pre>
<pre><span id="VAL(asr)"><span class="keyword">val</span> (asr)</span> : <code class="type">int -&gt; int -&gt; int</code></pre>
<pre><span id="VAL(~-.)"><span class="keyword">val</span> (~-.)</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VAL(~+.)"><span class="keyword">val</span> (~+.)</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VAL(+.)"><span class="keyword">val</span> (+.)</span> : <code class="type">float -&gt; float -&gt; float</code></pre>
<pre><span id="VAL(-.)"><span class="keyword">val</span> (-.)</span> : <code class="type">float -&gt; float -&gt; float</code></pre>
<pre><span id="VAL( *. )"><span class="keyword">val</span> ( *. )</span> : <code class="type">float -&gt; float -&gt; float</code></pre>
<pre><span id="VAL(/.)"><span class="keyword">val</span> (/.)</span> : <code class="type">float -&gt; float -&gt; float</code></pre>
<pre><span id="VAL( ** )"><span class="keyword">val</span> ( ** )</span> : <code class="type">float -&gt; float -&gt; float</code></pre>
<pre><span id="VALsqrt"><span class="keyword">val</span> sqrt</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALexp"><span class="keyword">val</span> exp</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALlog"><span class="keyword">val</span> log</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALlog10"><span class="keyword">val</span> log10</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALexpm1"><span class="keyword">val</span> expm1</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALlog1p"><span class="keyword">val</span> log1p</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALcos"><span class="keyword">val</span> cos</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALsin"><span class="keyword">val</span> sin</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALtan"><span class="keyword">val</span> tan</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALacos"><span class="keyword">val</span> acos</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALasin"><span class="keyword">val</span> asin</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALatan"><span class="keyword">val</span> atan</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALatan2"><span class="keyword">val</span> atan2</span> : <code class="type">float -&gt; float -&gt; float</code></pre>
<pre><span id="VALhypot"><span class="keyword">val</span> hypot</span> : <code class="type">float -&gt; float -&gt; float</code></pre>
<pre><span id="VALcosh"><span class="keyword">val</span> cosh</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALsinh"><span class="keyword">val</span> sinh</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALtanh"><span class="keyword">val</span> tanh</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALceil"><span class="keyword">val</span> ceil</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALfloor"><span class="keyword">val</span> floor</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALabs_float"><span class="keyword">val</span> abs_float</span> : <code class="type">float -&gt; float</code></pre>
<pre><span id="VALcopysign"><span class="keyword">val</span> copysign</span> : <code class="type">float -&gt; float -&gt; float</code></pre>
<pre><span id="VALmod_float"><span class="keyword">val</span> mod_float</span> : <code class="type">float -&gt; float -&gt; float</code></pre>
<pre><span id="VALfrexp"><span class="keyword">val</span> frexp</span> : <code class="type">float -&gt; float * int</code></pre>
<pre><span id="VALldexp"><span class="keyword">val</span> ldexp</span> : <code class="type">float -&gt; int -&gt; float</code></pre>
<pre><span id="VALmodf"><span class="keyword">val</span> modf</span> : <code class="type">float -&gt; float * float</code></pre>
<pre><span id="VALfloat"><span class="keyword">val</span> float</span> : <code class="type">int -&gt; float</code></pre>
<pre><span id="VALfloat_of_int"><span class="keyword">val</span> float_of_int</span> : <code class="type">int -&gt; float</code></pre>
<pre><span id="VALtruncate"><span class="keyword">val</span> truncate</span> : <code class="type">float -&gt; int</code></pre>
<pre><span id="VALint_of_float"><span class="keyword">val</span> int_of_float</span> : <code class="type">float -&gt; int</code></pre>
<pre><span id="VALinfinity"><span class="keyword">val</span> infinity</span> : <code class="type">float</code></pre>
<pre><span id="VALneg_infinity"><span class="keyword">val</span> neg_infinity</span> : <code class="type">float</code></pre>
<pre><span id="VALnan"><span class="keyword">val</span> nan</span> : <code class="type">float</code></pre>
<pre><span id="VALmax_float"><span class="keyword">val</span> max_float</span> : <code class="type">float</code></pre>
<pre><span id="VALmin_float"><span class="keyword">val</span> min_float</span> : <code class="type">float</code></pre>
<pre><span id="VALepsilon_float"><span class="keyword">val</span> epsilon_float</span> : <code class="type">float</code></pre>
<pre><span id="TYPEfpclass"><span class="keyword">type</span> <code class="type"></code>fpclass</span> = <code class="type"><a href="Stdlib.html#TYPEfpclass">fpclass</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfpclass.FP_normal"><span class="constructor">FP_normal</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfpclass.FP_subnormal"><span class="constructor">FP_subnormal</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfpclass.FP_zero"><span class="constructor">FP_zero</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfpclass.FP_infinite"><span class="constructor">FP_infinite</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfpclass.FP_nan"><span class="constructor">FP_nan</span></span></code></td>

</tr></tbody></table>



<pre><span id="VALclassify_float"><span class="keyword">val</span> classify_float</span> : <code class="type">float -&gt; <a href="Pervasives.html#TYPEfpclass">fpclass</a></code></pre>
<pre><span id="VAL(^)"><span class="keyword">val</span> (^)</span> : <code class="type">string -&gt; string -&gt; string</code></pre>
<pre><span id="VALint_of_char"><span class="keyword">val</span> int_of_char</span> : <code class="type">char -&gt; int</code></pre>
<pre><span id="VALchar_of_int"><span class="keyword">val</span> char_of_int</span> : <code class="type">int -&gt; char</code></pre>
<pre><span id="VALignore"><span class="keyword">val</span> ignore</span> : <code class="type">'a -&gt; unit</code></pre>
<pre><span id="VALstring_of_bool"><span class="keyword">val</span> string_of_bool</span> : <code class="type">bool -&gt; string</code></pre>
<pre><span id="VALbool_of_string"><span class="keyword">val</span> bool_of_string</span> : <code class="type">string -&gt; bool</code></pre>
<pre><span id="VALbool_of_string_opt"><span class="keyword">val</span> bool_of_string_opt</span> : <code class="type">string -&gt; bool option</code></pre>
<pre><span id="VALstring_of_int"><span class="keyword">val</span> string_of_int</span> : <code class="type">int -&gt; string</code></pre>
<pre><span id="VALint_of_string"><span class="keyword">val</span> int_of_string</span> : <code class="type">string -&gt; int</code></pre>
<pre><span id="VALint_of_string_opt"><span class="keyword">val</span> int_of_string_opt</span> : <code class="type">string -&gt; int option</code></pre>
<pre><span id="VALstring_of_float"><span class="keyword">val</span> string_of_float</span> : <code class="type">float -&gt; string</code></pre>
<pre><span id="VALfloat_of_string"><span class="keyword">val</span> float_of_string</span> : <code class="type">string -&gt; float</code></pre>
<pre><span id="VALfloat_of_string_opt"><span class="keyword">val</span> float_of_string_opt</span> : <code class="type">string -&gt; float option</code></pre>
<pre><span id="VALfst"><span class="keyword">val</span> fst</span> : <code class="type">'a * 'b -&gt; 'a</code></pre>
<pre><span id="VALsnd"><span class="keyword">val</span> snd</span> : <code class="type">'a * 'b -&gt; 'b</code></pre>
<pre><span id="VAL(@)"><span class="keyword">val</span> (@)</span> : <code class="type">'a list -&gt; 'a list -&gt; 'a list</code></pre>
<pre><span id="TYPEin_channel"><span class="keyword">type</span> <code class="type"></code>in_channel</span> = <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a></code> </pre>


<pre><span id="TYPEout_channel"><span class="keyword">type</span> <code class="type"></code>out_channel</span> = <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a></code> </pre>


<pre><span id="VALstdin"><span class="keyword">val</span> stdin</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a></code></pre>
<pre><span id="VALstdout"><span class="keyword">val</span> stdout</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a></code></pre>
<pre><span id="VALstderr"><span class="keyword">val</span> stderr</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a></code></pre>
<pre><span id="VALprint_char"><span class="keyword">val</span> print_char</span> : <code class="type">char -&gt; unit</code></pre>
<pre><span id="VALprint_string"><span class="keyword">val</span> print_string</span> : <code class="type">string -&gt; unit</code></pre>
<pre><span id="VALprint_bytes"><span class="keyword">val</span> print_bytes</span> : <code class="type">bytes -&gt; unit</code></pre>
<pre><span id="VALprint_int"><span class="keyword">val</span> print_int</span> : <code class="type">int -&gt; unit</code></pre>
<pre><span id="VALprint_float"><span class="keyword">val</span> print_float</span> : <code class="type">float -&gt; unit</code></pre>
<pre><span id="VALprint_endline"><span class="keyword">val</span> print_endline</span> : <code class="type">string -&gt; unit</code></pre>
<pre><span id="VALprint_newline"><span class="keyword">val</span> print_newline</span> : <code class="type">unit -&gt; unit</code></pre>
<pre><span id="VALprerr_char"><span class="keyword">val</span> prerr_char</span> : <code class="type">char -&gt; unit</code></pre>
<pre><span id="VALprerr_string"><span class="keyword">val</span> prerr_string</span> : <code class="type">string -&gt; unit</code></pre>
<pre><span id="VALprerr_bytes"><span class="keyword">val</span> prerr_bytes</span> : <code class="type">bytes -&gt; unit</code></pre>
<pre><span id="VALprerr_int"><span class="keyword">val</span> prerr_int</span> : <code class="type">int -&gt; unit</code></pre>
<pre><span id="VALprerr_float"><span class="keyword">val</span> prerr_float</span> : <code class="type">float -&gt; unit</code></pre>
<pre><span id="VALprerr_endline"><span class="keyword">val</span> prerr_endline</span> : <code class="type">string -&gt; unit</code></pre>
<pre><span id="VALprerr_newline"><span class="keyword">val</span> prerr_newline</span> : <code class="type">unit -&gt; unit</code></pre>
<pre><span id="VALread_line"><span class="keyword">val</span> read_line</span> : <code class="type">unit -&gt; string</code></pre>
<pre><span id="VALread_int"><span class="keyword">val</span> read_int</span> : <code class="type">unit -&gt; int</code></pre>
<pre><span id="VALread_int_opt"><span class="keyword">val</span> read_int_opt</span> : <code class="type">unit -&gt; int option</code></pre>
<pre><span id="VALread_float"><span class="keyword">val</span> read_float</span> : <code class="type">unit -&gt; float</code></pre>
<pre><span id="VALread_float_opt"><span class="keyword">val</span> read_float_opt</span> : <code class="type">unit -&gt; float option</code></pre>
<pre><span id="TYPEopen_flag"><span class="keyword">type</span> <code class="type"></code>open_flag</span> = <code class="type"><a href="Stdlib.html#TYPEopen_flag">open_flag</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_rdonly"><span class="constructor">Open_rdonly</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_wronly"><span class="constructor">Open_wronly</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_append"><span class="constructor">Open_append</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_creat"><span class="constructor">Open_creat</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_trunc"><span class="constructor">Open_trunc</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_excl"><span class="constructor">Open_excl</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_binary"><span class="constructor">Open_binary</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_text"><span class="constructor">Open_text</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_nonblock"><span class="constructor">Open_nonblock</span></span></code></td>

</tr></tbody></table>



<pre><span id="VALopen_out"><span class="keyword">val</span> open_out</span> : <code class="type">string -&gt; <a href="Stdlib.html#TYPEout_channel">out_channel</a></code></pre>
<pre><span id="VALopen_out_bin"><span class="keyword">val</span> open_out_bin</span> : <code class="type">string -&gt; <a href="Stdlib.html#TYPEout_channel">out_channel</a></code></pre>
<pre><span id="VALopen_out_gen"><span class="keyword">val</span> open_out_gen</span> : <code class="type"><a href="Stdlib.html#TYPEopen_flag">open_flag</a> list -&gt; int -&gt; string -&gt; <a href="Stdlib.html#TYPEout_channel">out_channel</a></code></pre>
<pre><span id="VALflush"><span class="keyword">val</span> flush</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; unit</code></pre>
<pre><span id="VALflush_all"><span class="keyword">val</span> flush_all</span> : <code class="type">unit -&gt; unit</code></pre>
<pre><span id="VALoutput_char"><span class="keyword">val</span> output_char</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; char -&gt; unit</code></pre>
<pre><span id="VALoutput_string"><span class="keyword">val</span> output_string</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; string -&gt; unit</code></pre>
<pre><span id="VALoutput_bytes"><span class="keyword">val</span> output_bytes</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; bytes -&gt; unit</code></pre>
<pre><span id="VALoutput"><span class="keyword">val</span> output</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; bytes -&gt; int -&gt; int -&gt; unit</code></pre>
<pre><span id="VALoutput_substring"><span class="keyword">val</span> output_substring</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; string -&gt; int -&gt; int -&gt; unit</code></pre>
<pre><span id="VALoutput_byte"><span class="keyword">val</span> output_byte</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALoutput_binary_int"><span class="keyword">val</span> output_binary_int</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALoutput_value"><span class="keyword">val</span> output_value</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; 'a -&gt; unit</code></pre>
<pre><span id="VALseek_out"><span class="keyword">val</span> seek_out</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALpos_out"><span class="keyword">val</span> pos_out</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; int</code></pre>
<pre><span id="VALout_channel_length"><span class="keyword">val</span> out_channel_length</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; int</code></pre>
<pre><span id="VALclose_out"><span class="keyword">val</span> close_out</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; unit</code></pre>
<pre><span id="VALclose_out_noerr"><span class="keyword">val</span> close_out_noerr</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; unit</code></pre>
<pre><span id="VALset_binary_mode_out"><span class="keyword">val</span> set_binary_mode_out</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; bool -&gt; unit</code></pre>
<pre><span id="VALopen_in"><span class="keyword">val</span> open_in</span> : <code class="type">string -&gt; <a href="Stdlib.html#TYPEin_channel">in_channel</a></code></pre>
<pre><span id="VALopen_in_bin"><span class="keyword">val</span> open_in_bin</span> : <code class="type">string -&gt; <a href="Stdlib.html#TYPEin_channel">in_channel</a></code></pre>
<pre><span id="VALopen_in_gen"><span class="keyword">val</span> open_in_gen</span> : <code class="type"><a href="Stdlib.html#TYPEopen_flag">open_flag</a> list -&gt; int -&gt; string -&gt; <a href="Stdlib.html#TYPEin_channel">in_channel</a></code></pre>
<pre><span id="VALinput_char"><span class="keyword">val</span> input_char</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; char</code></pre>
<pre><span id="VALinput_line"><span class="keyword">val</span> input_line</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; string</code></pre>
<pre><span id="VALinput"><span class="keyword">val</span> input</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; bytes -&gt; int -&gt; int -&gt; int</code></pre>
<pre><span id="VALreally_input"><span class="keyword">val</span> really_input</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; bytes -&gt; int -&gt; int -&gt; unit</code></pre>
<pre><span id="VALreally_input_string"><span class="keyword">val</span> really_input_string</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; int -&gt; string</code></pre>
<pre><span id="VALinput_byte"><span class="keyword">val</span> input_byte</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; int</code></pre>
<pre><span id="VALinput_binary_int"><span class="keyword">val</span> input_binary_int</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; int</code></pre>
<pre><span id="VALinput_value"><span class="keyword">val</span> input_value</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; 'a</code></pre>
<pre><span id="VALseek_in"><span class="keyword">val</span> seek_in</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALpos_in"><span class="keyword">val</span> pos_in</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; int</code></pre>
<pre><span id="VALin_channel_length"><span class="keyword">val</span> in_channel_length</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; int</code></pre>
<pre><span id="VALclose_in"><span class="keyword">val</span> close_in</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; unit</code></pre>
<pre><span id="VALclose_in_noerr"><span class="keyword">val</span> close_in_noerr</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; unit</code></pre>
<pre><span id="VALset_binary_mode_in"><span class="keyword">val</span> set_binary_mode_in</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; bool -&gt; unit</code></pre>
<pre><span id="MODULELargeFile"><span class="keyword">module</span> <a href="Pervasives.LargeFile.html">LargeFile</a></span>: <code class="type"><a href="Stdlib.LargeFile.html">LargeFile</a></code></pre>
<pre><span id="TYPEref"><span class="keyword">type</span> <code class="type">'a</code> ref</span> = <code class="type">'a <a href="Stdlib.html#TYPEref">ref</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTref.contents">contents</span>&nbsp;: <code class="type">'a</code>;</code></td>

</tr></tbody></table>
}



<pre><span id="VALref"><span class="keyword">val</span> ref</span> : <code class="type">'a -&gt; 'a <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VAL(!)"><span class="keyword">val</span> (!)</span> : <code class="type">'a <a href="Pervasives.html#TYPEref">ref</a> -&gt; 'a</code></pre>
<pre><span id="VAL(:=)"><span class="keyword">val</span> (:=)</span> : <code class="type">'a <a href="Pervasives.html#TYPEref">ref</a> -&gt; 'a -&gt; unit</code></pre>
<pre><span id="VALincr"><span class="keyword">val</span> incr</span> : <code class="type">int <a href="Pervasives.html#TYPEref">ref</a> -&gt; unit</code></pre>
<pre><span id="VALdecr"><span class="keyword">val</span> decr</span> : <code class="type">int <a href="Pervasives.html#TYPEref">ref</a> -&gt; unit</code></pre>
<pre><span id="TYPEresult"><span class="keyword">type</span> <code class="type">('a, 'b)</code> result</span> = <code class="type">('a, 'b) <a href="Stdlib.html#TYPEresult">result</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTresult.Ok"><span class="constructor">Ok</span></span> <span class="keyword">of</span> <code class="type">'a</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTresult.Error"><span class="constructor">Error</span></span> <span class="keyword">of</span> <code class="type">'b</code></code></td>

</tr></tbody></table>



<pre><span id="TYPEformat6"><span class="keyword">type</span> <code class="type">('a, 'b, 'c, 'd, 'e, 'f)</code> format6</span> = <code class="type">('a, 'b, 'c, 'd, 'e, 'f) <a href="CamlinternalFormatBasics.html#TYPEformat6">CamlinternalFormatBasics.format6</a></code> </pre>


<pre><span id="TYPEformat4"><span class="keyword">type</span> <code class="type">('a, 'b, 'c, 'd)</code> format4</span> = <code class="type">('a, 'b, 'c, 'c, 'c, 'd) <a href="Pervasives.html#TYPEformat6">format6</a></code> </pre>


<pre><span id="TYPEformat"><span class="keyword">type</span> <code class="type">('a, 'b, 'c)</code> format</span> = <code class="type">('a, 'b, 'c, 'c) <a href="Pervasives.html#TYPEformat4">format4</a></code> </pre>


<pre><span id="VALstring_of_format"><span class="keyword">val</span> string_of_format</span> : <code class="type">('a, 'b, 'c, 'd, 'e, 'f) <a href="Stdlib.html#TYPEformat6">format6</a> -&gt; string</code></pre>
<pre><span id="VALformat_of_string"><span class="keyword">val</span> format_of_string</span> : <code class="type">('a, 'b, 'c, 'd, 'e, 'f) <a href="Pervasives.html#TYPEformat6">format6</a> -&gt;<br>       ('a, 'b, 'c, 'd, 'e, 'f) <a href="Pervasives.html#TYPEformat6">format6</a></code></pre>
<pre><span id="VAL(^^)"><span class="keyword">val</span> (^^)</span> : <code class="type">('a, 'b, 'c, 'd, 'e, 'f) <a href="Stdlib.html#TYPEformat6">format6</a> -&gt;<br>       ('f, 'b, 'c, 'e, 'g, 'h) <a href="Stdlib.html#TYPEformat6">format6</a> -&gt;<br>       ('a, 'b, 'c, 'd, 'g, 'h) <a href="Stdlib.html#TYPEformat6">format6</a></code></pre>
<pre><span id="VALexit"><span class="keyword">val</span> exit</span> : <code class="type">int -&gt; 'a</code></pre>
<pre><span id="VALat_exit"><span class="keyword">val</span> at_exit</span> : <code class="type">(unit -&gt; unit) -&gt; unit</code></pre>
<pre><span id="VALvalid_float_lexem"><span class="keyword">val</span> valid_float_lexem</span> : <code class="type">string -&gt; string</code></pre>
<pre><span id="VALdo_at_exit"><span class="keyword">val</span> do_at_exit</span> : <code class="type">unit -&gt; unit</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>