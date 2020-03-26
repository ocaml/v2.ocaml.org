<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">UnixLabels.LargeFile</a></div><ul></ul></nav></header>

<h1>Module <a href="type_UnixLabels.LargeFile.html">UnixLabels.LargeFile</a></h1>

<pre><span id="MODULELargeFile"><span class="keyword">module</span> LargeFile</span>: <code class="code"><span class="keyword">sig</span></code> <a href="UnixLabels.LargeFile.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>File operations on large files.
  This sub-module provides 64-bit variants of the functions
  <a href="UnixLabels.html#VALlseek"><code class="code"><span class="constructor">UnixLabels</span>.lseek</code></a> (for positioning a file descriptor),
  <a href="UnixLabels.html#VALtruncate"><code class="code"><span class="constructor">UnixLabels</span>.truncate</code></a> and <a href="UnixLabels.html#VALftruncate"><code class="code"><span class="constructor">UnixLabels</span>.ftruncate</code></a>
  (for changing the size of a file),
  and <a href="UnixLabels.html#VALstat"><code class="code"><span class="constructor">UnixLabels</span>.stat</code></a>, <a href="UnixLabels.html#VALlstat"><code class="code"><span class="constructor">UnixLabels</span>.lstat</code></a> and <a href="UnixLabels.html#VALfstat"><code class="code"><span class="constructor">UnixLabels</span>.fstat</code></a>
  (for obtaining information on files).  These alternate functions represent
  positions and sizes by 64-bit integers (type <code class="code">int64</code>) instead of
  regular integers (type <code class="code">int</code>), thus allowing operating on files
  whose sizes are greater than <code class="code">max_int</code>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="VALlseek"><span class="keyword">val</span> lseek</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">UnixLabels.file_descr</a> -&gt; int64 -&gt; mode:<a href="UnixLabels.html#TYPEseek_command">UnixLabels.seek_command</a> -&gt; int64</code></pre>
<pre><span id="VALtruncate"><span class="keyword">val</span> truncate</span> : <code class="type">string -&gt; len:int64 -&gt; unit</code></pre>
<pre><span id="VALftruncate"><span class="keyword">val</span> ftruncate</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">UnixLabels.file_descr</a> -&gt; len:int64 -&gt; unit</code></pre>
<pre><span id="TYPEstats"><span class="keyword">type</span> <code class="type"></code>stats</span> = <code class="type"><a href="Unix.LargeFile.html#TYPEstats">Unix.LargeFile.stats</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_dev">st_dev</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>Device number</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_ino">st_ino</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>Inode number</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_kind">st_kind</span>&nbsp;: <code class="type"><a href="UnixLabels.html#TYPEfile_kind">UnixLabels.file_kind</a></code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>Kind of the file</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_perm">st_perm</span>&nbsp;: <code class="type"><a href="UnixLabels.html#TYPEfile_perm">UnixLabels.file_perm</a></code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>Access rights</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_nlink">st_nlink</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>Number of links</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_uid">st_uid</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>User id of the owner</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_gid">st_gid</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>Group ID of the file's group</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_rdev">st_rdev</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>Device minor number</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_size">st_size</span>&nbsp;: <code class="type">int64</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>Size in bytes</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_atime">st_atime</span>&nbsp;: <code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>Last access time</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_mtime">st_mtime</span>&nbsp;: <code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>Last modification time</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_ctime">st_ctime</span>&nbsp;: <code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>Last status change time</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>
}



<pre><span id="VALstat"><span class="keyword">val</span> stat</span> : <code class="type">string -&gt; <a href="UnixLabels.LargeFile.html#TYPEstats">stats</a></code></pre>
<pre><span id="VALlstat"><span class="keyword">val</span> lstat</span> : <code class="type">string -&gt; <a href="UnixLabels.LargeFile.html#TYPEstats">stats</a></code></pre>
<pre><span id="VALfstat"><span class="keyword">val</span> fstat</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">UnixLabels.file_descr</a> -&gt; <a href="UnixLabels.LargeFile.html#TYPEstats">stats</a></code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>