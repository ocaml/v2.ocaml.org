<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Build_path_prefix_map.html">Build_path_prefix_map</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;path&nbsp;=&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;path_prefix&nbsp;=&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;error_message&nbsp;=&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;encode_prefix&nbsp;:&nbsp;<span class="constructor">Build_path_prefix_map</span>.path_prefix&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;decode_prefix&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Build_path_prefix_map</span>.path_prefix,&nbsp;<span class="constructor">Build_path_prefix_map</span>.error_message)<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Stdlib</span>.result<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;pair&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;target&nbsp;:&nbsp;<span class="constructor">Build_path_prefix_map</span>.path_prefix;<br>
&nbsp;&nbsp;&nbsp;&nbsp;source&nbsp;:&nbsp;<span class="constructor">Build_path_prefix_map</span>.path_prefix;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;encode_pair&nbsp;:&nbsp;<span class="constructor">Build_path_prefix_map</span>.pair&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;decode_pair&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Build_path_prefix_map</span>.pair,&nbsp;<span class="constructor">Build_path_prefix_map</span>.error_message)<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Stdlib</span>.result<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;map&nbsp;=&nbsp;<span class="constructor">Build_path_prefix_map</span>.pair&nbsp;option&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;encode_map&nbsp;:&nbsp;<span class="constructor">Build_path_prefix_map</span>.map&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;decode_map&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Build_path_prefix_map</span>.map,&nbsp;<span class="constructor">Build_path_prefix_map</span>.error_message)<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Stdlib</span>.result<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rewrite_opt&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Build_path_prefix_map</span>.map&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Build_path_prefix_map</span>.path&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Build_path_prefix_map</span>.path&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rewrite&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Build_path_prefix_map</span>.map&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Build_path_prefix_map</span>.path&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Build_path_prefix_map</span>.path<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>