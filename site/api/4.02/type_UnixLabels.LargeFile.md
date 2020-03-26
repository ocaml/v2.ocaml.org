<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="UnixLabels.LargeFile.html">UnixLabels.LargeFile</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lseek&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">UnixLabels</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;mode:<span class="constructor">UnixLabels</span>.seek_command&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;truncate&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;len:int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ftruncate&nbsp;:&nbsp;<span class="constructor">UnixLabels</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;len:int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;stats&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.<span class="constructor">LargeFile</span>.stats&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;st_dev&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;st_ino&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;st_kind&nbsp;:&nbsp;<span class="constructor">UnixLabels</span>.file_kind;<br>
&nbsp;&nbsp;&nbsp;&nbsp;st_perm&nbsp;:&nbsp;<span class="constructor">UnixLabels</span>.file_perm;<br>
&nbsp;&nbsp;&nbsp;&nbsp;st_nlink&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;st_uid&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;st_gid&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;st_rdev&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;st_size&nbsp;:&nbsp;int64;<br>
&nbsp;&nbsp;&nbsp;&nbsp;st_atime&nbsp;:&nbsp;float;<br>
&nbsp;&nbsp;&nbsp;&nbsp;st_mtime&nbsp;:&nbsp;float;<br>
&nbsp;&nbsp;&nbsp;&nbsp;st_ctime&nbsp;:&nbsp;float;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stat&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">UnixLabels</span>.<span class="constructor">LargeFile</span>.stats<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lstat&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">UnixLabels</span>.<span class="constructor">LargeFile</span>.stats<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fstat&nbsp;:&nbsp;<span class="constructor">UnixLabels</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">UnixLabels</span>.<span class="constructor">LargeFile</span>.stats<br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>