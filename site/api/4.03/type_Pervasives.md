<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Pervasives.html">Pervasives</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;raise&nbsp;:&nbsp;exn&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;=&nbsp;<span class="string">"%raise"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;raise_notrace&nbsp;:&nbsp;exn&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;=&nbsp;<span class="string">"%raise_notrace"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;invalid_arg&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;failwith&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Exit</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;=&nbsp;)&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%equal"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;&lt;&gt;&nbsp;)&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%notequal"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;&lt;&nbsp;)&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%lessthan"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;&gt;&nbsp;)&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%greaterthan"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;&lt;=&nbsp;)&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%lessequal"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;&gt;=&nbsp;)&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%greaterequal"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;compare&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%compare"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;min&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;max&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;==&nbsp;)&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%eq"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;!=&nbsp;)&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%noteq"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;not&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%boolnot"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keywordsign">&amp;&amp;</span>&nbsp;)&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%sequand"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keywordsign">&amp;</span>&nbsp;)&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%sequand"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keywordsign">||</span>&nbsp;)&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%sequor"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keyword">or</span>&nbsp;)&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"%sequor"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;__LOC__&nbsp;:&nbsp;string&nbsp;=&nbsp;<span class="string">"%loc_LOC"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;__FILE__&nbsp;:&nbsp;string&nbsp;=&nbsp;<span class="string">"%loc_FILE"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;__LINE__&nbsp;:&nbsp;int&nbsp;=&nbsp;<span class="string">"%loc_LINE"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;__MODULE__&nbsp;:&nbsp;string&nbsp;=&nbsp;<span class="string">"%loc_MODULE"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;__POS__&nbsp;:&nbsp;string&nbsp;*&nbsp;int&nbsp;*&nbsp;int&nbsp;*&nbsp;int&nbsp;=&nbsp;<span class="string">"%loc_POS"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;__LOC_OF__&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;*&nbsp;<span class="keywordsign">'</span>a&nbsp;=&nbsp;<span class="string">"%loc_LOC"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;__LINE_OF__&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;*&nbsp;<span class="keywordsign">'</span>a&nbsp;=&nbsp;<span class="string">"%loc_LINE"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;__POS_OF__&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(string&nbsp;*&nbsp;int&nbsp;*&nbsp;int&nbsp;*&nbsp;int)&nbsp;*&nbsp;<span class="keywordsign">'</span>a&nbsp;=&nbsp;<span class="string">"%loc_POS"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;|&gt;&nbsp;)&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;=&nbsp;<span class="string">"%revapply"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;@@&nbsp;)&nbsp;:&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;=&nbsp;<span class="string">"%apply"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keywordsign">~-</span>&nbsp;)&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%negint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keywordsign">~+</span>&nbsp;)&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%identity"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;succ&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%succint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;pred&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%predint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;+&nbsp;)&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%addint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;-&nbsp;)&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%subint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;*&nbsp;)&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%mulint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;/&nbsp;)&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%divint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keyword">mod</span>&nbsp;)&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%modint"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;abs&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;max_int&nbsp;:&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;min_int&nbsp;:&nbsp;int
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keyword">land</span>&nbsp;)&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%andint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keyword">lor</span>&nbsp;)&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%orint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keyword">lxor</span>&nbsp;)&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%xorint"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lnot&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keyword">lsl</span>&nbsp;)&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%lslint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keyword">lsr</span>&nbsp;)&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%lsrint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keyword">asr</span>&nbsp;)&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%asrint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keywordsign">~-.</span>&nbsp;)&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%negfloat"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;<span class="keywordsign">~+.</span>&nbsp;)&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%identity"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;+.&nbsp;)&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%addfloat"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;-.&nbsp;)&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%subfloat"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;*.&nbsp;)&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%mulfloat"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;/.&nbsp;)&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%divfloat"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;**&nbsp;)&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_power_float"</span>&nbsp;<span class="string">"pow"</span>
&nbsp;&nbsp;&nbsp;&nbsp;[@@unboxed]&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;sqrt&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_sqrt_float"</span>&nbsp;<span class="string">"sqrt"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;exp&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_exp_float"</span>&nbsp;<span class="string">"exp"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;log&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_log_float"</span>&nbsp;<span class="string">"log"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;log10&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_log10_float"</span>&nbsp;<span class="string">"log10"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;expm1&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_expm1_float"</span>&nbsp;<span class="string">"caml_expm1"</span>
&nbsp;&nbsp;&nbsp;&nbsp;[@@unboxed]&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;log1p&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_log1p_float"</span>&nbsp;<span class="string">"caml_log1p"</span>
&nbsp;&nbsp;&nbsp;&nbsp;[@@unboxed]&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;cos&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_cos_float"</span>&nbsp;<span class="string">"cos"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;sin&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_sin_float"</span>&nbsp;<span class="string">"sin"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;tan&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_tan_float"</span>&nbsp;<span class="string">"tan"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;acos&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_acos_float"</span>&nbsp;<span class="string">"acos"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;asin&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_asin_float"</span>&nbsp;<span class="string">"asin"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;atan&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_atan_float"</span>&nbsp;<span class="string">"atan"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;atan2&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_atan2_float"</span>&nbsp;<span class="string">"atan2"</span>
&nbsp;&nbsp;&nbsp;&nbsp;[@@unboxed]&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;hypot&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_hypot_float"</span>&nbsp;<span class="string">"caml_hypot"</span>
&nbsp;&nbsp;&nbsp;&nbsp;[@@unboxed]&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;cosh&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_cosh_float"</span>&nbsp;<span class="string">"cosh"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;sinh&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_sinh_float"</span>&nbsp;<span class="string">"sinh"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;tanh&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_tanh_float"</span>&nbsp;<span class="string">"tanh"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;ceil&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_ceil_float"</span>&nbsp;<span class="string">"ceil"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;floor&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_floor_float"</span>&nbsp;<span class="string">"floor"</span>&nbsp;[@@unboxed]
&nbsp;&nbsp;&nbsp;&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;abs_float&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%absfloat"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;copysign&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_copysign_float"</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="string">"caml_copysign"</span>&nbsp;[@@unboxed]&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;mod_float&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_fmod_float"</span>&nbsp;<span class="string">"fmod"</span>
&nbsp;&nbsp;&nbsp;&nbsp;[@@unboxed]&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;frexp&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;*&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_frexp_float"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;ldexp&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;(float&nbsp;[@unboxed])&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(int&nbsp;[@untagged])&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(float&nbsp;[@unboxed])
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_ldexp_float"</span>&nbsp;<span class="string">"caml_ldexp_float_unboxed"</span>&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;modf&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;*&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_modf_float"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;float&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%floatofint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;float_of_int&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"%floatofint"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;truncate&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%intoffloat"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;int_of_float&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%intoffloat"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;infinity&nbsp;:&nbsp;float
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;neg_infinity&nbsp;:&nbsp;float
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;nan&nbsp;:&nbsp;float
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;max_float&nbsp;:&nbsp;float
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;min_float&nbsp;:&nbsp;float
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;epsilon_float&nbsp;:&nbsp;float
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;fpclass&nbsp;=&nbsp;<span class="constructor">FP_normal</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FP_subnormal</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FP_zero</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FP_infinite</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FP_nan</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;classify_float&nbsp;:&nbsp;(float&nbsp;[@unboxed])&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.fpclass
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_classify_float"</span>&nbsp;<span class="string">"caml_classify_float_unboxed"</span>&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;(&nbsp;^&nbsp;)&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;int_of_char&nbsp;:&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"%identity"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;char_of_int&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;ignore&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"%ignore"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;string_of_bool&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;bool_of_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;string_of_int&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;int_of_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_int_of_string"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;string_of_float&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;float_of_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_float_of_string"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;fst&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;*&nbsp;<span class="keywordsign">'</span>b&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;=&nbsp;<span class="string">"%field0"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;snd&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;*&nbsp;<span class="keywordsign">'</span>b&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;=&nbsp;<span class="string">"%field1"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;(&nbsp;@&nbsp;)&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;list
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;in_channel
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;out_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stdin&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stdout&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stderr&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_char&nbsp;:&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_bytes&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_int&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_float&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_endline&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_newline&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;prerr_char&nbsp;:&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;prerr_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;prerr_bytes&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;prerr_int&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;prerr_float&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;prerr_endline&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;prerr_newline&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;read_line&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;read_int&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;read_float&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;open_flag&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Open_rdonly</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Open_wronly</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Open_append</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Open_creat</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Open_trunc</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Open_excl</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Open_binary</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Open_text</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Open_nonblock</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_out&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.out_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_out_bin&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.out_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_out_gen&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Pervasives</span>.open_flag&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.out_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;flush&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;flush_all&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;output_char&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;output_string&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;output_bytes&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;output&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;output_substring&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;output_byte&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;output_binary_int&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;output_value&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;seek_out&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pos_out&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;out_channel_length&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;close_out&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;close_out_noerr&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_binary_mode_out&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_in&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.in_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_in_bin&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.in_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_in_gen&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Pervasives</span>.open_flag&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.in_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;input_char&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;input_line&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;input&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;really_input&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;really_input_string&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;input_byte&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;input_binary_int&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;input_value&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;seek_in&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pos_in&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;in_channel_length&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;close_in&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;close_in_noerr&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_binary_mode_in&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">LargeFile</span>&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;seek_out&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pos_out&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;out_channel_length&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;seek_in&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pos_in&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;in_channel_length&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;ref&nbsp;=&nbsp;{&nbsp;<span class="keyword">mutable</span>&nbsp;contents&nbsp;:&nbsp;<span class="keywordsign">'</span>a;&nbsp;}
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;ref&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;=&nbsp;<span class="string">"%makemutable"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;!&nbsp;)&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;=&nbsp;<span class="string">"%field0"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;(&nbsp;:=&nbsp;)&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"%setfield0"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;incr&nbsp;:&nbsp;int&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"%incr"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;decr&nbsp;:&nbsp;int&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"%decr"</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="keywordsign">'</span>b)&nbsp;result&nbsp;=&nbsp;<span class="constructor">Ok</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Error</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="keywordsign">'</span>b
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="keywordsign">'</span>b,&nbsp;<span class="keywordsign">'</span>c,&nbsp;<span class="keywordsign">'</span>d,&nbsp;<span class="keywordsign">'</span>e,&nbsp;<span class="keywordsign">'</span>f)&nbsp;format6&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="keywordsign">'</span>b,&nbsp;<span class="keywordsign">'</span>c,&nbsp;<span class="keywordsign">'</span>d,&nbsp;<span class="keywordsign">'</span>e,&nbsp;<span class="keywordsign">'</span>f)&nbsp;<span class="constructor">CamlinternalFormatBasics</span>.format6
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="keywordsign">'</span>b,&nbsp;<span class="keywordsign">'</span>c,&nbsp;<span class="keywordsign">'</span>d)&nbsp;format4&nbsp;=&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="keywordsign">'</span>b,&nbsp;<span class="keywordsign">'</span>c,&nbsp;<span class="keywordsign">'</span>c,&nbsp;<span class="keywordsign">'</span>c,&nbsp;<span class="keywordsign">'</span>d)&nbsp;<span class="constructor">Pervasives</span>.format6
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="keywordsign">'</span>b,&nbsp;<span class="keywordsign">'</span>c)&nbsp;format&nbsp;=&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="keywordsign">'</span>b,&nbsp;<span class="keywordsign">'</span>c,&nbsp;<span class="keywordsign">'</span>c)&nbsp;<span class="constructor">Pervasives</span>.format4
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;string_of_format&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="keywordsign">'</span>b,&nbsp;<span class="keywordsign">'</span>c,&nbsp;<span class="keywordsign">'</span>d,&nbsp;<span class="keywordsign">'</span>e,&nbsp;<span class="keywordsign">'</span>f)&nbsp;<span class="constructor">Pervasives</span>.format6&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;format_of_string&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="keywordsign">'</span>b,&nbsp;<span class="keywordsign">'</span>c,&nbsp;<span class="keywordsign">'</span>d,&nbsp;<span class="keywordsign">'</span>e,&nbsp;<span class="keywordsign">'</span>f)&nbsp;<span class="constructor">Pervasives</span>.format6&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="keywordsign">'</span>b,&nbsp;<span class="keywordsign">'</span>c,&nbsp;<span class="keywordsign">'</span>d,&nbsp;<span class="keywordsign">'</span>e,&nbsp;<span class="keywordsign">'</span>f)&nbsp;<span class="constructor">Pervasives</span>.format6&nbsp;=&nbsp;<span class="string">"%identity"</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;(&nbsp;^^&nbsp;)&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="keywordsign">'</span>b,&nbsp;<span class="keywordsign">'</span>c,&nbsp;<span class="keywordsign">'</span>d,&nbsp;<span class="keywordsign">'</span>e,&nbsp;<span class="keywordsign">'</span>f)&nbsp;<span class="constructor">Pervasives</span>.format6&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>f,&nbsp;<span class="keywordsign">'</span>b,&nbsp;<span class="keywordsign">'</span>c,&nbsp;<span class="keywordsign">'</span>e,&nbsp;<span class="keywordsign">'</span>g,&nbsp;<span class="keywordsign">'</span>h)&nbsp;<span class="constructor">Pervasives</span>.format6&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a,&nbsp;<span class="keywordsign">'</span>b,&nbsp;<span class="keywordsign">'</span>c,&nbsp;<span class="keywordsign">'</span>d,&nbsp;<span class="keywordsign">'</span>g,&nbsp;<span class="keywordsign">'</span>h)&nbsp;<span class="constructor">Pervasives</span>.format6
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;exit&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;at_exit&nbsp;:&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;valid_float_lexem&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unsafe_really_input&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;do_at_exit&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>