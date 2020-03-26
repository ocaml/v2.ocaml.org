<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Arg.html">Arg</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;spec&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unit</span>&nbsp;<span class="keyword">of</span>&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Bool</span>&nbsp;<span class="keyword">of</span>&nbsp;(bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Set</span>&nbsp;<span class="keyword">of</span>&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Clear</span>&nbsp;<span class="keyword">of</span>&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">String</span>&nbsp;<span class="keyword">of</span>&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Set_string</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;<span class="constructor">Pervasives</span>.ref<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Int</span>&nbsp;<span class="keyword">of</span>&nbsp;(int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Set_int</span>&nbsp;<span class="keyword">of</span>&nbsp;int&nbsp;<span class="constructor">Pervasives</span>.ref<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Float</span>&nbsp;<span class="keyword">of</span>&nbsp;(float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Set_float</span>&nbsp;<span class="keyword">of</span>&nbsp;float&nbsp;<span class="constructor">Pervasives</span>.ref<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Tuple</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Arg</span>.spec&nbsp;list<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Symbol</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;list&nbsp;*&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Rest</span>&nbsp;<span class="keyword">of</span>&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Expand</span>&nbsp;<span class="keyword">of</span>&nbsp;(string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array)<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;key&nbsp;=&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;doc&nbsp;=&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;usage_msg&nbsp;=&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;anon_fun&nbsp;=&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Arg</span>.key&nbsp;*&nbsp;<span class="constructor">Arg</span>.spec&nbsp;*&nbsp;<span class="constructor">Arg</span>.doc)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Arg</span>.anon_fun&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Arg</span>.usage_msg&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_dynamic&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Arg</span>.key&nbsp;*&nbsp;<span class="constructor">Arg</span>.spec&nbsp;*&nbsp;<span class="constructor">Arg</span>.doc)&nbsp;list&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Arg</span>.anon_fun&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Arg</span>.usage_msg&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_argv&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?current:int&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Arg</span>.key&nbsp;*&nbsp;<span class="constructor">Arg</span>.spec&nbsp;*&nbsp;<span class="constructor">Arg</span>.doc)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Arg</span>.anon_fun&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Arg</span>.usage_msg&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_argv_dynamic&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?current:int&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Arg</span>.key&nbsp;*&nbsp;<span class="constructor">Arg</span>.spec&nbsp;*&nbsp;<span class="constructor">Arg</span>.doc)&nbsp;list&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Arg</span>.anon_fun&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_and_expand_argv_dynamic&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Arg</span>.key&nbsp;*&nbsp;<span class="constructor">Arg</span>.spec&nbsp;*&nbsp;<span class="constructor">Arg</span>.doc)&nbsp;list&nbsp;<span class="constructor">Pervasives</span>.ref&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Arg</span>.anon_fun&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_expand&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Arg</span>.key&nbsp;*&nbsp;<span class="constructor">Arg</span>.spec&nbsp;*&nbsp;<span class="constructor">Arg</span>.doc)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Arg</span>.anon_fun&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Arg</span>.usage_msg&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Help</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Bad</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;usage&nbsp;:&nbsp;(<span class="constructor">Arg</span>.key&nbsp;*&nbsp;<span class="constructor">Arg</span>.spec&nbsp;*&nbsp;<span class="constructor">Arg</span>.doc)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Arg</span>.usage_msg&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;usage_string&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Arg</span>.key&nbsp;*&nbsp;<span class="constructor">Arg</span>.spec&nbsp;*&nbsp;<span class="constructor">Arg</span>.doc)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Arg</span>.usage_msg&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;align&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?limit:int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Arg</span>.key&nbsp;*&nbsp;<span class="constructor">Arg</span>.spec&nbsp;*&nbsp;<span class="constructor">Arg</span>.doc)&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Arg</span>.key&nbsp;*&nbsp;<span class="constructor">Arg</span>.spec&nbsp;*&nbsp;<span class="constructor">Arg</span>.doc)&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;current&nbsp;:&nbsp;int&nbsp;<span class="constructor">Pervasives</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;read_arg&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;read_arg0&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;write_arg&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;write_arg0&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>