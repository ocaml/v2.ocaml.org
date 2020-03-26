<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Filename.html">Filename</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;current_dir_name&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parent_dir_name&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dir_sep&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;concat&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;is_relative&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;is_implicit&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;check_suffix&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;chop_suffix&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;chop_suffix_opt&nbsp;:&nbsp;suffix:string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;extension&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;remove_extension&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;chop_extension&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;basename&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dirname&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;temp_file&nbsp;:&nbsp;?temp_dir:string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_temp_file&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?mode:<span class="constructor">Stdlib</span>.open_flag&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?perms:int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?temp_dir:string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;*&nbsp;<span class="constructor">Stdlib</span>.out_channel<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get_temp_dir_name&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_temp_dir_name&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;temp_dir_name&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;quote&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>