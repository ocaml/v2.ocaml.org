<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="CamlinternalOO.html">CamlinternalOO</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;tag
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;label
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;table
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;meth
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;obj
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;closure
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;public_method_label&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.tag
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;new_method&nbsp;:&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.label
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;new_variable&nbsp;:&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;new_methods_variables&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.label&nbsp;array
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_variable&nbsp;:&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_variables&nbsp;:&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;array
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_method_label&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.label
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_method_labels&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.label&nbsp;array
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_method&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.label&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.meth
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_method&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.label&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.meth&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_methods&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.label&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;narrow&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;widen&nbsp;:&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;add_initializer&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="constructor">CamlinternalOO</span>.obj&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dummy_table&nbsp;:&nbsp;<span class="constructor">CamlinternalOO</span>.table
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;create_table&nbsp;:&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.table
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;init_class&nbsp;:&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inherits&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.t&nbsp;*
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.obj&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Obj</span>.t)&nbsp;*
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.t&nbsp;*&nbsp;<span class="constructor">CamlinternalOO</span>.obj&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Obj</span>.t&nbsp;array
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;make_class&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.t)&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.t&nbsp;*&nbsp;(<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.t)&nbsp;*
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.t)&nbsp;*&nbsp;<span class="constructor">Obj</span>.t
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;init_table
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;make_class_store&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.t)&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.init_table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dummy_class&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;*&nbsp;int&nbsp;*&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.t&nbsp;*&nbsp;(<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.t)&nbsp;*
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Obj</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.t)&nbsp;*&nbsp;<span class="constructor">Obj</span>.t
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;copy&nbsp;:&nbsp;(&lt;&nbsp;..&nbsp;&gt;&nbsp;<span class="keyword">as</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;create_object&nbsp;:&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.obj
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;create_object_opt&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.obj&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.obj
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;run_initializers&nbsp;:&nbsp;<span class="constructor">CamlinternalOO</span>.obj&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;run_initializers_opt&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.obj&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.obj&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.obj
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;create_object_and_run_initializers&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.obj&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.table&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.obj
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;send&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.obj&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.tag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.t&nbsp;=&nbsp;<span class="string">"%send"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;sendcache&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.obj&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.tag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.t
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"%sendcache"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;sendself&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.obj&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.label&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.t
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"%sendself"</span>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;get_public_method&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.obj&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.tag&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.closure
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_get_public_method"</span>&nbsp;[@@noalloc]
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;tables
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lookup_tables&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.tables&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalOO</span>.closure&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.tables
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;impl&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">GetConst</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">GetVar</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">GetEnv</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">GetMeth</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SetVar</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AppConst</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AppVar</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AppEnv</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AppMeth</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AppConstConst</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AppConstVar</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AppConstEnv</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AppConstMeth</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AppVarConst</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AppEnvConst</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AppMethConst</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">MethAppConst</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">MethAppVar</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">MethAppEnv</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">MethAppMeth</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SendConst</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SendVar</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SendEnv</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SendMeth</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Closure</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">CamlinternalOO</span>.closure
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;params&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;compact_table&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;copy_parent&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;clean_when_copying&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;retry_count&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;bucket_small_size&nbsp;:&nbsp;int;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;params&nbsp;:&nbsp;<span class="constructor">CamlinternalOO</span>.params
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;stats&nbsp;=&nbsp;{&nbsp;classes&nbsp;:&nbsp;int;&nbsp;methods&nbsp;:&nbsp;int;&nbsp;inst_vars&nbsp;:&nbsp;int;&nbsp;}
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stats&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalOO</span>.stats
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>