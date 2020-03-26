<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="CamlinternalMenhirLib.IncrementalEngine.html">CamlinternalMenhirLib.IncrementalEngine</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;position&nbsp;=&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.position<br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="keyword">type</span>&nbsp;<span class="constructor">INCREMENTAL_ENGINE</span>&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;token<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;production<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;=&nbsp;<span class="keyword">private</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">InputNeeded</span>&nbsp;<span class="keyword">of</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Shifting</span>&nbsp;<span class="keyword">of</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AboutToReduce</span>&nbsp;<span class="keyword">of</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.production<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">HandlingError</span>&nbsp;<span class="keyword">of</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Accepted</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Rejected</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;offer&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.checkpoint&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.token&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.position&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.position&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.checkpoint<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;resume&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.checkpoint&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.checkpoint<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;supplier&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.token&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.position&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.position<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lexer_lexbuf_to_supplier&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.token)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.supplier<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;loop&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.supplier&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.checkpoint&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;loop_handle&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.checkpoint&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>answer)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.supplier&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.checkpoint&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>answer<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;loop_handle_undo&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.checkpoint&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.checkpoint&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>answer)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.supplier&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.checkpoint&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>answer<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;shifts&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.checkpoint&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;acceptable&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.checkpoint&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.token&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;number&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.lr1state&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;production_index&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.production&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;find_production&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.production<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;element&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Element</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.lr1state&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;*&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.position&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.element<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;stack&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.element<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">General</span>.stream<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stack&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.stack<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;top&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.element<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pop_many&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.element<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;current_state_number&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;equal&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;positions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.position&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.position<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;env_has_default_reduction&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;state_has_default_reduction&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.lr1state&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pop&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;force_reduction&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.production&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;input_needed&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INCREMENTAL_ENGINE</span>.checkpoint<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="keyword">type</span>&nbsp;<span class="constructor">SYMBOLS</span>&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">T</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">SYMBOLS</span>.terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">SYMBOLS</span>.symbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">N</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">SYMBOLS</span>.nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">SYMBOLS</span>.symbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;xsymbol&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">X</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">SYMBOLS</span>.symbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">SYMBOLS</span>.xsymbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="keyword">type</span>&nbsp;<span class="constructor">INSPECTION</span>&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">T</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">N</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;xsymbol&nbsp;=&nbsp;<span class="constructor">X</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;xsymbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;production<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;item&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.production&nbsp;*&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_terminals&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_nonterminals&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_symbols&nbsp;:&nbsp;xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_productions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.production&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.production&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_items&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.item&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.item&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;incoming_symbol&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.lr1state&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;items&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.lr1state&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.item&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lhs&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.production&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xsymbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.production&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xsymbol&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;nullable&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;first&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;xfirst&nbsp;:&nbsp;xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;foreach_terminal&nbsp;:&nbsp;(xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;foreach_terminal_but_error&nbsp;:&nbsp;(xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;feed&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.position&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.position&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>b&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>b&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.env<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="keyword">type</span>&nbsp;<span class="constructor">EVERYTHING</span>&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;token<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;production<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;=&nbsp;<span class="keyword">private</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">InputNeeded</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Shifting</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;*&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;*&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AboutToReduce</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;*&nbsp;production<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">HandlingError</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Accepted</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Rejected</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;offer&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;token&nbsp;*&nbsp;position&nbsp;*&nbsp;position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;resume&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;supplier&nbsp;=&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;token&nbsp;*&nbsp;position&nbsp;*&nbsp;position<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lexer_lexbuf_to_supplier&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;token)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;supplier<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;loop&nbsp;:&nbsp;supplier&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;loop_handle&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;supplier&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;loop_handle_undo&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;supplier&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;shifts&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;acceptable&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;token&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;number&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;production_index&nbsp;:&nbsp;production&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;find_production&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;production<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;element&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Element</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state&nbsp;*&nbsp;<span class="keywordsign">'</span>a&nbsp;*&nbsp;position&nbsp;*&nbsp;position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;element<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;stack&nbsp;=&nbsp;element&nbsp;<span class="constructor">General</span>.stream<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stack&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;stack<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;top&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;element&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pop_many&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;element&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;current_state_number&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;equal&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;positions&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;position&nbsp;*&nbsp;position<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;env_has_default_reduction&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;state_has_default_reduction&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pop&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;force_reduction&nbsp;:&nbsp;production&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;input_needed&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">T</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">N</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;xsymbol&nbsp;=&nbsp;<span class="constructor">X</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;xsymbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;item&nbsp;=&nbsp;production&nbsp;*&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_terminals&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_nonterminals&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_symbols&nbsp;:&nbsp;xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_productions&nbsp;:&nbsp;production&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;production&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_items&nbsp;:&nbsp;item&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;item&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;incoming_symbol&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;items&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;item&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lhs&nbsp;:&nbsp;production&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;xsymbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs&nbsp;:&nbsp;production&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;xsymbol&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;nullable&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;first&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;xfirst&nbsp;:&nbsp;xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;foreach_terminal&nbsp;:&nbsp;(xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;foreach_terminal_but_error&nbsp;:&nbsp;(xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;feed&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;env<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>