<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Float.html">Float</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;neg&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%negfloat"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;add&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%addfloat"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;sub&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%subfloat"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;mul&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%mulfloat"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;div&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%divfloat"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;rem&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_fmod_float"</span>&nbsp;<span class="string">"fmod"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@unboxed]&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;abs&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%absfloat"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;infinity&nbsp;:&nbsp;float<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;neg_infinity&nbsp;:&nbsp;float<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;nan&nbsp;:&nbsp;float<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pi&nbsp;:&nbsp;float<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;max_float&nbsp;:&nbsp;float<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;min_float&nbsp;:&nbsp;float<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;epsilon&nbsp;:&nbsp;float<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;of_int&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%floatofint"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;to_int&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%intoffloat"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;of_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_float_of_string"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;of_string_opt&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;to_string&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;fpclass&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Pervasives</span>.fpclass&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">FP_normal</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FP_subnormal</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FP_zero</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FP_infinite</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FP_nan</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;classify_float&nbsp;:&nbsp;(float&nbsp;[@unboxed])&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Float</span>.fpclass<br>
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_classify_float"</span>&nbsp;<span class="string">"caml_classify_float_unboxed"</span>&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;pow&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_power_float"</span>&nbsp;<span class="string">"pow"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@unboxed]&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;sqrt&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_sqrt_float"</span>&nbsp;<span class="string">"sqrt"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;exp&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_exp_float"</span>&nbsp;<span class="string">"exp"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;log&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_log_float"</span>&nbsp;<span class="string">"log"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;log10&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_log10_float"</span>&nbsp;<span class="string">"log10"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;expm1&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_expm1_float"</span>&nbsp;<span class="string">"caml_expm1"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@unboxed]&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;log1p&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_log1p_float"</span>&nbsp;<span class="string">"caml_log1p"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@unboxed]&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;cos&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_cos_float"</span>&nbsp;<span class="string">"cos"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;sin&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_sin_float"</span>&nbsp;<span class="string">"sin"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;tan&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_tan_float"</span>&nbsp;<span class="string">"tan"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;acos&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_acos_float"</span>&nbsp;<span class="string">"acos"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;asin&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_asin_float"</span>&nbsp;<span class="string">"asin"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;atan&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_atan_float"</span>&nbsp;<span class="string">"atan"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;atan2&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_atan2_float"</span>&nbsp;<span class="string">"atan2"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@unboxed]&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;hypot&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_hypot_float"</span>&nbsp;<span class="string">"caml_hypot"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@unboxed]&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;cosh&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_cosh_float"</span>&nbsp;<span class="string">"cosh"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;sinh&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_sinh_float"</span>&nbsp;<span class="string">"sinh"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;tanh&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_tanh_float"</span>&nbsp;<span class="string">"tanh"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;ceil&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_ceil_float"</span>&nbsp;<span class="string">"ceil"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;floor&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_floor_float"</span>&nbsp;<span class="string">"floor"</span>&nbsp;[@@unboxed]<br>
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;copysign&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_copysign_float"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="string">"caml_copysign"</span>&nbsp;[@@unboxed]&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;frexp&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;*&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_frexp_float"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;ldexp&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(float&nbsp;[@unboxed])&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(int&nbsp;[@untagged])&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(float&nbsp;[@unboxed])<br>
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_ldexp_float"</span>&nbsp;<span class="string">"caml_ldexp_float_unboxed"</span>&nbsp;[@@noalloc]<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;modf&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;*&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_modf_float"</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=&nbsp;float<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare&nbsp;:&nbsp;<span class="constructor">Float</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Float</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;equal&nbsp;:&nbsp;<span class="constructor">Float</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Float</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;hash&nbsp;:&nbsp;<span class="constructor">Float</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Array</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=&nbsp;floatarray<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;create&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Float</span>.<span class="constructor">Array</span>.t&nbsp;=&nbsp;<span class="string">"caml_floatarray_create"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;length&nbsp;:&nbsp;<span class="constructor">Float</span>.<span class="constructor">Array</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%floatarray_length"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;get&nbsp;:&nbsp;<span class="constructor">Float</span>.<span class="constructor">Array</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%floatarray_safe_get"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;set&nbsp;:&nbsp;<span class="constructor">Float</span>.<span class="constructor">Array</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"%floatarray_safe_set"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;unsafe_get&nbsp;:&nbsp;<span class="constructor">Float</span>.<span class="constructor">Array</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"%floatarray_unsafe_get"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;unsafe_set&nbsp;:&nbsp;<span class="constructor">Float</span>.<span class="constructor">Array</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"%floatarray_unsafe_set"</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>