<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="CamlinternalMenhirLib.Engine.Make.html">CamlinternalMenhirLib.Engine.Make</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">functor</span>&nbsp;(<span class="constructor">T</span>&nbsp;:&nbsp;<span class="constructor">EngineTypes</span>.<span class="constructor">TABLE</span>)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;state&nbsp;=&nbsp;<span class="constructor">T</span>.state<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;token&nbsp;=&nbsp;<span class="constructor">T</span>.token<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;semantic_value&nbsp;=&nbsp;<span class="constructor">T</span>.semantic_value<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Error</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;entry&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;state&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;token)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;semantic_value<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;production&nbsp;=&nbsp;<span class="constructor">T</span>.production<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;=&nbsp;(<span class="constructor">T</span>.state,&nbsp;<span class="constructor">T</span>.semantic_value,&nbsp;<span class="constructor">T</span>.token)&nbsp;<span class="constructor">EngineTypes</span>.env<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;=&nbsp;<span class="keyword">private</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">InputNeeded</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Shifting</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;*&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;*&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AboutToReduce</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;*&nbsp;production<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">HandlingError</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Accepted</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Rejected</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;offer&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;token&nbsp;*&nbsp;<span class="constructor">IncrementalEngine</span>.position&nbsp;*&nbsp;<span class="constructor">IncrementalEngine</span>.position&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;resume&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;supplier&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;token&nbsp;*&nbsp;<span class="constructor">IncrementalEngine</span>.position&nbsp;*&nbsp;<span class="constructor">IncrementalEngine</span>.position<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lexer_lexbuf_to_supplier&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;token)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;supplier<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;loop&nbsp;:&nbsp;supplier&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;loop_handle&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;supplier&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;loop_handle_undo&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;supplier&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>answer<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;shifts&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;acceptable&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;token&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">IncrementalEngine</span>.position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state&nbsp;=&nbsp;state<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;number&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;production_index&nbsp;:&nbsp;production&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;find_production&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;production<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;element&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Element</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state&nbsp;*&nbsp;<span class="keywordsign">'</span>a&nbsp;*&nbsp;<span class="constructor">IncrementalEngine</span>.position&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">IncrementalEngine</span>.position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;element<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;stack&nbsp;=&nbsp;element&nbsp;<span class="constructor">General</span>.stream<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stack&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;stack<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;top&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;element&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pop_many&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;element&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;current_state_number&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;equal&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;positions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">IncrementalEngine</span>.position&nbsp;*&nbsp;<span class="constructor">IncrementalEngine</span>.position<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;env_has_default_reduction&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;state_has_default_reduction&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pop&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;force_reduction&nbsp;:&nbsp;production&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;input_needed&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;checkpoint<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;start&nbsp;:&nbsp;state&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;semantic_value&nbsp;checkpoint<br>
&nbsp;&nbsp;<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>