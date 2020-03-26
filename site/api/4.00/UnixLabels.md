<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">UnixLabels</a></div><ul></ul></nav></header>

<h1>Module <a href="type_UnixLabels.html">UnixLabels</a></h1>
<pre><span class="keyword">module</span> UnixLabels: <code class="code"><span class="keyword">sig</span></code> <a href="UnixLabels.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>Interface to the Unix system.
   To use as replacement to default <a href="Unix.html"><code class="code"><span class="constructor">Unix</span></code></a> module,
   add <code class="code"><span class="keyword">module</span> <span class="constructor">Unix</span> = <span class="constructor">UnixLabels</span></code> in your implementation.<br>
<hr width="100%">
<br>
<span id="6_Errorreport"><h6>Error report</h6></span><br>
<pre><span id="TYPEerror"><span class="keyword">type</span> <code class="type"></code>error</span> = <code class="type"><a href="Unix.html#TYPEerror">Unix.error</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.E2BIG"><span class="constructor">E2BIG</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Argument list too long</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EACCES"><span class="constructor">EACCES</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Permission denied</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EAGAIN"><span class="constructor">EAGAIN</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Resource temporarily unavailable; try again</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EBADF"><span class="constructor">EBADF</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Bad file descriptor</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EBUSY"><span class="constructor">EBUSY</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Resource unavailable</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ECHILD"><span class="constructor">ECHILD</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">No child process</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EDEADLK"><span class="constructor">EDEADLK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Resource deadlock would occur</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EDOM"><span class="constructor">EDOM</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Domain error for math functions, etc.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EEXIST"><span class="constructor">EEXIST</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">File exists</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EFAULT"><span class="constructor">EFAULT</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Bad address</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EFBIG"><span class="constructor">EFBIG</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">File too large</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EINTR"><span class="constructor">EINTR</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Function interrupted by signal</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EINVAL"><span class="constructor">EINVAL</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Invalid argument</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EIO"><span class="constructor">EIO</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Hardware I/O error</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EISDIR"><span class="constructor">EISDIR</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Is a directory</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EMFILE"><span class="constructor">EMFILE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Too many open files by the process</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EMLINK"><span class="constructor">EMLINK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Too many links</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENAMETOOLONG"><span class="constructor">ENAMETOOLONG</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Filename too long</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENFILE"><span class="constructor">ENFILE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Too many open files in the system</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENODEV"><span class="constructor">ENODEV</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">No such device</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENOENT"><span class="constructor">ENOENT</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">No such file or directory</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENOEXEC"><span class="constructor">ENOEXEC</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Not an executable file</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENOLCK"><span class="constructor">ENOLCK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">No locks available</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENOMEM"><span class="constructor">ENOMEM</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Not enough memory</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENOSPC"><span class="constructor">ENOSPC</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">No space left on device</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENOSYS"><span class="constructor">ENOSYS</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Function not supported</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENOTDIR"><span class="constructor">ENOTDIR</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Not a directory</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENOTEMPTY"><span class="constructor">ENOTEMPTY</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Directory not empty</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENOTTY"><span class="constructor">ENOTTY</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Inappropriate I/O control operation</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENXIO"><span class="constructor">ENXIO</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">No such device or address</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EPERM"><span class="constructor">EPERM</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Operation not permitted</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EPIPE"><span class="constructor">EPIPE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Broken pipe</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ERANGE"><span class="constructor">ERANGE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Result too large</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EROFS"><span class="constructor">EROFS</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Read-only file system</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ESPIPE"><span class="constructor">ESPIPE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Invalid seek e.g. on a pipe</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ESRCH"><span class="constructor">ESRCH</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">No such process</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EXDEV"><span class="constructor">EXDEV</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Invalid link</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EWOULDBLOCK"><span class="constructor">EWOULDBLOCK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Operation would block</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EINPROGRESS"><span class="constructor">EINPROGRESS</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Operation now in progress</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EALREADY"><span class="constructor">EALREADY</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Operation already in progress</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENOTSOCK"><span class="constructor">ENOTSOCK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Socket operation on non-socket</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EDESTADDRREQ"><span class="constructor">EDESTADDRREQ</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Destination address required</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EMSGSIZE"><span class="constructor">EMSGSIZE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Message too long</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EPROTOTYPE"><span class="constructor">EPROTOTYPE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Protocol wrong type for socket</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENOPROTOOPT"><span class="constructor">ENOPROTOOPT</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Protocol not available</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EPROTONOSUPPORT"><span class="constructor">EPROTONOSUPPORT</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Protocol not supported</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ESOCKTNOSUPPORT"><span class="constructor">ESOCKTNOSUPPORT</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Socket type not supported</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EOPNOTSUPP"><span class="constructor">EOPNOTSUPP</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Operation not supported on socket</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EPFNOSUPPORT"><span class="constructor">EPFNOSUPPORT</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Protocol family not supported</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EAFNOSUPPORT"><span class="constructor">EAFNOSUPPORT</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Address family not supported by protocol family</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EADDRINUSE"><span class="constructor">EADDRINUSE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Address already in use</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EADDRNOTAVAIL"><span class="constructor">EADDRNOTAVAIL</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Can't assign requested address</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENETDOWN"><span class="constructor">ENETDOWN</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Network is down</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENETUNREACH"><span class="constructor">ENETUNREACH</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Network is unreachable</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENETRESET"><span class="constructor">ENETRESET</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Network dropped connection on reset</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ECONNABORTED"><span class="constructor">ECONNABORTED</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Software caused connection abort</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ECONNRESET"><span class="constructor">ECONNRESET</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Connection reset by peer</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENOBUFS"><span class="constructor">ENOBUFS</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">No buffer space available</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EISCONN"><span class="constructor">EISCONN</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Socket is already connected</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ENOTCONN"><span class="constructor">ENOTCONN</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Socket is not connected</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ESHUTDOWN"><span class="constructor">ESHUTDOWN</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Can't send after socket shutdown</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ETOOMANYREFS"><span class="constructor">ETOOMANYREFS</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Too many references: can't splice</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ETIMEDOUT"><span class="constructor">ETIMEDOUT</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Connection timed out</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ECONNREFUSED"><span class="constructor">ECONNREFUSED</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Connection refused</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EHOSTDOWN"><span class="constructor">EHOSTDOWN</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Host is down</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EHOSTUNREACH"><span class="constructor">EHOSTUNREACH</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">No route to host</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.ELOOP"><span class="constructor">ELOOP</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Too many levels of symbolic links</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EOVERFLOW"><span class="constructor">EOVERFLOW</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">File size or position not representable</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.EUNKNOWNERR"><span class="constructor">EUNKNOWNERR</span></span> <span class="keyword">of</span> <code class="type">int</code></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Unknown error</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
The type of error codes.
   Errors defined in the POSIX standard
   and additional errors from UNIX98 and BSD.
   All other errors are mapped to EUNKNOWNERR.<br>
</div>

<pre><span id="EXCEPTIONUnix_error"><span class="keyword">exception</span> Unix_error</span> <span class="keyword">of</span> <code class="type"><a href="UnixLabels.html#TYPEerror">error</a> * string * string</code></pre>
<div class="info">
Raised by the system calls below when an error is encountered.
   The first component is the error code; the second component
   is the function name; the third component is the string parameter
   to the function, if it has one, or the empty string otherwise.<br>
</div>
<pre><span id="VALerror_message"><span class="keyword">val</span> error_message</span> : <code class="type"><a href="UnixLabels.html#TYPEerror">error</a> -&gt; string</code></pre><div class="info">
Return a string describing the given error code.<br>
</div>
<pre><span id="VALhandle_unix_error"><span class="keyword">val</span> handle_unix_error</span> : <code class="type">('a -&gt; 'b) -&gt; 'a -&gt; 'b</code></pre><div class="info">
<code class="code">handle_unix_error f x</code> applies <code class="code">f</code> to <code class="code">x</code> and returns the result.
   If the exception <code class="code"><span class="constructor">Unix_error</span></code> is raised, it prints a message
   describing the error and exits with code 2.<br>
</div>
<br>
<span id="6_Accesstotheprocessenvironment"><h6>Access to the process environment</h6></span><br>
<pre><span id="VALenvironment"><span class="keyword">val</span> environment</span> : <code class="type">unit -&gt; string array</code></pre><div class="info">
Return the process environment, as an array of strings
    with the format ``variable=value''.<br>
</div>
<pre><span id="VALgetenv"><span class="keyword">val</span> getenv</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Return the value associated to a variable in the process
   environment. Raise <code class="code"><span class="constructor">Not_found</span></code> if the variable is unbound.
   (This function is identical to <code class="code"><span class="constructor">Sys</span>.getenv</code>.)<br>
</div>
<pre><span id="VALputenv"><span class="keyword">val</span> putenv</span> : <code class="type">string -&gt; string -&gt; unit</code></pre><div class="info">
<code class="code"><span class="constructor">Unix</span>.putenv name value</code> sets the value associated to a
   variable in the process environment.
   <code class="code">name</code> is the name of the environment variable,
   and <code class="code">value</code> its new associated value.<br>
</div>
<br>
<span id="6_Processhandling"><h6>Process handling</h6></span><br>
<pre><span id="TYPEprocess_status"><span class="keyword">type</span> <code class="type"></code>process_status</span> = <code class="type"><a href="Unix.html#TYPEprocess_status">Unix.process_status</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTprocess_status.WEXITED"><span class="constructor">WEXITED</span></span> <span class="keyword">of</span> <code class="type">int</code></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">The process terminated normally by <code class="code">exit</code>;
           the argument is the return code.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTprocess_status.WSIGNALED"><span class="constructor">WSIGNALED</span></span> <span class="keyword">of</span> <code class="type">int</code></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">The process was killed by a signal;
           the argument is the signal number.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTprocess_status.WSTOPPED"><span class="constructor">WSTOPPED</span></span> <span class="keyword">of</span> <code class="type">int</code></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">The process was stopped by a signal; the argument is the
           signal number.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
The termination status of a process.  See module <a href="Sys.html"><code class="code"><span class="constructor">Sys</span></code></a> for the
    definitions of the standard signal numbers.  Note that they are
    not the numbers used by the OS.<br>
</div>

<pre><span id="TYPEwait_flag"><span class="keyword">type</span> <code class="type"></code>wait_flag</span> = <code class="type"><a href="Unix.html#TYPEwait_flag">Unix.wait_flag</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTwait_flag.WNOHANG"><span class="constructor">WNOHANG</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">do not block if no child has
               died yet, but immediately return with a pid equal to 0.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTwait_flag.WUNTRACED"><span class="constructor">WUNTRACED</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">report also the children that receive stop signals.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
Flags for <a href="UnixLabels.html#VALwaitpid"><code class="code"><span class="constructor">UnixLabels</span>.waitpid</code></a>.<br>
</div>

<pre><span id="VALexecv"><span class="keyword">val</span> execv</span> : <code class="type">prog:string -&gt; args:string array -&gt; 'a</code></pre><div class="info">
<code class="code">execv prog args</code> execute the program in file <code class="code">prog</code>, with
   the arguments <code class="code">args</code>, and the current process environment.
   These <code class="code">execv*</code> functions never return: on success, the current
   program is replaced by the new one;
   on failure, a <a href="UnixLabels.html#EXCEPTIONUnix_error"><code class="code"><span class="constructor">UnixLabels</span>.<span class="constructor">Unix_error</span></code></a> exception is raised.<br>
</div>
<pre><span id="VALexecve"><span class="keyword">val</span> execve</span> : <code class="type">prog:string -&gt; args:string array -&gt; env:string array -&gt; 'a</code></pre><div class="info">
Same as <a href="UnixLabels.html#VALexecv"><code class="code"><span class="constructor">UnixLabels</span>.execv</code></a>, except that the third argument provides the
   environment to the program executed.<br>
</div>
<pre><span id="VALexecvp"><span class="keyword">val</span> execvp</span> : <code class="type">prog:string -&gt; args:string array -&gt; 'a</code></pre><div class="info">
Same as <a href="UnixLabels.html#VALexecv"><code class="code"><span class="constructor">UnixLabels</span>.execv</code></a>, except that
   the program is searched in the path.<br>
</div>
<pre><span id="VALexecvpe"><span class="keyword">val</span> execvpe</span> : <code class="type">prog:string -&gt; args:string array -&gt; env:string array -&gt; 'a</code></pre><div class="info">
Same as <a href="UnixLabels.html#VALexecve"><code class="code"><span class="constructor">UnixLabels</span>.execve</code></a>, except that
   the program is searched in the path.<br>
</div>
<pre><span id="VALfork"><span class="keyword">val</span> fork</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
Fork a new process. The returned integer is 0 for the child
   process, the pid of the child process for the parent process.<br>
</div>
<pre><span id="VALwait"><span class="keyword">val</span> wait</span> : <code class="type">unit -&gt; int * <a href="UnixLabels.html#TYPEprocess_status">process_status</a></code></pre><div class="info">
Wait until one of the children processes die, and return its pid
   and termination status.<br>
</div>
<pre><span id="VALwaitpid"><span class="keyword">val</span> waitpid</span> : <code class="type">mode:<a href="UnixLabels.html#TYPEwait_flag">wait_flag</a> list -&gt; int -&gt; int * <a href="UnixLabels.html#TYPEprocess_status">process_status</a></code></pre><div class="info">
Same as <a href="UnixLabels.html#VALwait"><code class="code"><span class="constructor">UnixLabels</span>.wait</code></a>, but waits for the child process whose pid is given.
   A pid of <code class="code">-1</code> means wait for any child.
   A pid of <code class="code">0</code> means wait for any child in the same process group
   as the current process.
   Negative pid arguments represent process groups.
   The list of options indicates whether <code class="code">waitpid</code> should return
   immediately without waiting, or also report stopped children.<br>
</div>
<pre><span id="VALsystem"><span class="keyword">val</span> system</span> : <code class="type">string -&gt; <a href="UnixLabels.html#TYPEprocess_status">process_status</a></code></pre><div class="info">
Execute the given command, wait until it terminates, and return
   its termination status. The string is interpreted by the shell
   <code class="code">/bin/sh</code> and therefore can contain redirections, quotes, variables,
   etc. The result <code class="code"><span class="constructor">WEXITED</span> 127</code> indicates that the shell couldn't
   be executed.<br>
</div>
<pre><span id="VALgetpid"><span class="keyword">val</span> getpid</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
Return the pid of the process.<br>
</div>
<pre><span id="VALgetppid"><span class="keyword">val</span> getppid</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
Return the pid of the parent process.<br>
</div>
<pre><span id="VALnice"><span class="keyword">val</span> nice</span> : <code class="type">int -&gt; int</code></pre><div class="info">
Change the process priority. The integer argument is added to the
   ``nice'' value. (Higher values of the ``nice'' value mean
   lower priorities.) Return the new nice value.<br>
</div>
<br>
<span id="6_Basicfileinputoutput"><h6>Basic file input/output</h6></span><br>
<pre><span id="TYPEfile_descr"><span class="keyword">type</span> <code class="type"></code>file_descr</span> = <code class="type"><a href="Unix.html#TYPEfile_descr">Unix.file_descr</a></code> </pre>
<div class="info">
The abstract type of file descriptors.<br>
</div>

<pre><span id="VALstdin"><span class="keyword">val</span> stdin</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a></code></pre><div class="info">
File descriptor for standard input.<br>
</div>
<pre><span id="VALstdout"><span class="keyword">val</span> stdout</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a></code></pre><div class="info">
File descriptor for standard output.<br>
</div>
<pre><span id="VALstderr"><span class="keyword">val</span> stderr</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a></code></pre><div class="info">
File descriptor for standard error.<br>
</div>
<pre><span id="TYPEopen_flag"><span class="keyword">type</span> <code class="type"></code>open_flag</span> = <code class="type"><a href="Unix.html#TYPEopen_flag">Unix.open_flag</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.O_RDONLY"><span class="constructor">O_RDONLY</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Open for reading</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.O_WRONLY"><span class="constructor">O_WRONLY</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Open for writing</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.O_RDWR"><span class="constructor">O_RDWR</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Open for reading and writing</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.O_NONBLOCK"><span class="constructor">O_NONBLOCK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Open in non-blocking mode</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.O_APPEND"><span class="constructor">O_APPEND</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Open for append</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.O_CREAT"><span class="constructor">O_CREAT</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Create if nonexistent</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.O_TRUNC"><span class="constructor">O_TRUNC</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Truncate to 0 length if existing</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.O_EXCL"><span class="constructor">O_EXCL</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Fail if existing</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.O_NOCTTY"><span class="constructor">O_NOCTTY</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Don't make this dev a controlling tty</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.O_DSYNC"><span class="constructor">O_DSYNC</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Writes complete as `Synchronised I/O data integrity completion'</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.O_SYNC"><span class="constructor">O_SYNC</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Writes complete as `Synchronised I/O file integrity completion'</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.O_RSYNC"><span class="constructor">O_RSYNC</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Reads complete as writes (depending on O_SYNC/O_DSYNC)</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.O_SHARE_DELETE"><span class="constructor">O_SHARE_DELETE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Windows only: allow the file to be deleted while still open</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
The flags to <a href="UnixLabels.html#VALopenfile"><code class="code"><span class="constructor">UnixLabels</span>.openfile</code></a>.<br>
</div>

<pre><span id="TYPEfile_perm"><span class="keyword">type</span> <code class="type"></code>file_perm</span> = <code class="type">int</code> </pre>
<div class="info">
The type of file access rights, e.g. <code class="code">0o640</code> is read and write for user,
    read for group, none for others<br>
</div>

<pre><span id="VALopenfile"><span class="keyword">val</span> openfile</span> : <code class="type">string -&gt;<br>       mode:<a href="UnixLabels.html#TYPEopen_flag">open_flag</a> list -&gt;<br>       perm:<a href="UnixLabels.html#TYPEfile_perm">file_perm</a> -&gt; <a href="UnixLabels.html#TYPEfile_descr">file_descr</a></code></pre><div class="info">
Open the named file with the given flags. Third argument is
   the permissions to give to the file if it is created. Return
   a file descriptor on the named file.<br>
</div>
<pre><span id="VALclose"><span class="keyword">val</span> close</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; unit</code></pre><div class="info">
Close a file descriptor.<br>
</div>
<pre><span id="VALread"><span class="keyword">val</span> read</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; buf:string -&gt; pos:int -&gt; len:int -&gt; int</code></pre><div class="info">
<code class="code">read fd buff ofs len</code> reads <code class="code">len</code> characters from descriptor
   <code class="code">fd</code>, storing them in string <code class="code">buff</code>, starting at position <code class="code">ofs</code>
   in string <code class="code">buff</code>. Return the number of characters actually read.<br>
</div>
<pre><span id="VALwrite"><span class="keyword">val</span> write</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; buf:string -&gt; pos:int -&gt; len:int -&gt; int</code></pre><div class="info">
<code class="code">write fd buff ofs len</code> writes <code class="code">len</code> characters to descriptor
   <code class="code">fd</code>, taking them from string <code class="code">buff</code>, starting at position <code class="code">ofs</code>
   in string <code class="code">buff</code>. Return the number of characters actually
   written.  <code class="code">write</code> repeats the writing operation until all characters
   have been written or an error occurs.<br>
</div>
<pre><span id="VALsingle_write"><span class="keyword">val</span> single_write</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; buf:string -&gt; pos:int -&gt; len:int -&gt; int</code></pre><div class="info">
Same as <code class="code">write</code>, but attempts to write only once.
   Thus, if an error occurs, <code class="code">single_write</code> guarantees that no data
   has been written.<br>
</div>
<br>
<span id="6_Interfacingwiththestandardinputoutputlibrary"><h6>Interfacing with the standard input/output library</h6></span><br>
<pre><span id="VALin_channel_of_descr"><span class="keyword">val</span> in_channel_of_descr</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="Pervasives.html#TYPEin_channel">in_channel</a></code></pre><div class="info">
Create an input channel reading from the given descriptor.
   The channel is initially in binary mode; use
   <code class="code">set_binary_mode_in ic <span class="keyword">false</span></code> if text mode is desired.<br>
</div>
<pre><span id="VALout_channel_of_descr"><span class="keyword">val</span> out_channel_of_descr</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="Pervasives.html#TYPEout_channel">out_channel</a></code></pre><div class="info">
Create an output channel writing on the given descriptor.
   The channel is initially in binary mode; use
   <code class="code">set_binary_mode_out oc <span class="keyword">false</span></code> if text mode is desired.<br>
</div>
<pre><span id="VALdescr_of_in_channel"><span class="keyword">val</span> descr_of_in_channel</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; <a href="UnixLabels.html#TYPEfile_descr">file_descr</a></code></pre><div class="info">
Return the descriptor corresponding to an input channel.<br>
</div>
<pre><span id="VALdescr_of_out_channel"><span class="keyword">val</span> descr_of_out_channel</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; <a href="UnixLabels.html#TYPEfile_descr">file_descr</a></code></pre><div class="info">
Return the descriptor corresponding to an output channel.<br>
</div>
<br>
<span id="6_Seekingandtruncating"><h6>Seeking and truncating</h6></span><br>
<pre><span id="TYPEseek_command"><span class="keyword">type</span> <code class="type"></code>seek_command</span> = <code class="type"><a href="Unix.html#TYPEseek_command">Unix.seek_command</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTseek_command.SEEK_SET"><span class="constructor">SEEK_SET</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">indicates positions relative to the beginning of the file</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTseek_command.SEEK_CUR"><span class="constructor">SEEK_CUR</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">indicates positions relative to the current position</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTseek_command.SEEK_END"><span class="constructor">SEEK_END</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">indicates positions relative to the end of the file</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
Positioning modes for <a href="UnixLabels.html#VALlseek"><code class="code"><span class="constructor">UnixLabels</span>.lseek</code></a>.<br>
</div>

<pre><span id="VALlseek"><span class="keyword">val</span> lseek</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; int -&gt; mode:<a href="UnixLabels.html#TYPEseek_command">seek_command</a> -&gt; int</code></pre><div class="info">
Set the current position for a file descriptor<br>
</div>
<pre><span id="VALtruncate"><span class="keyword">val</span> truncate</span> : <code class="type">string -&gt; len:int -&gt; unit</code></pre><div class="info">
Truncates the named file to the given size.<br>
</div>
<pre><span id="VALftruncate"><span class="keyword">val</span> ftruncate</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; len:int -&gt; unit</code></pre><div class="info">
Truncates the file corresponding to the given descriptor
   to the given size.<br>
</div>
<br>
<span id="6_Filestatus"><h6>File status</h6></span><br>
<pre><span id="TYPEfile_kind"><span class="keyword">type</span> <code class="type"></code>file_kind</span> = <code class="type"><a href="Unix.html#TYPEfile_kind">Unix.file_kind</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfile_kind.S_REG"><span class="constructor">S_REG</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Regular file</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfile_kind.S_DIR"><span class="constructor">S_DIR</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Directory</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfile_kind.S_CHR"><span class="constructor">S_CHR</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Character device</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfile_kind.S_BLK"><span class="constructor">S_BLK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Block device</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfile_kind.S_LNK"><span class="constructor">S_LNK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Symbolic link</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfile_kind.S_FIFO"><span class="constructor">S_FIFO</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Named pipe</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfile_kind.S_SOCK"><span class="constructor">S_SOCK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Socket</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>


<pre><span id="TYPEstats"><span class="keyword">type</span> <code class="type"></code>stats</span> = <code class="type"><a href="Unix.html#TYPEstats">Unix.stats</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_dev">st_dev</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Device number</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_ino">st_ino</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Inode number</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_kind">st_kind</span>&nbsp;:<code class="type"><a href="UnixLabels.html#TYPEfile_kind">file_kind</a></code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Kind of the file</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_perm">st_perm</span>&nbsp;:<code class="type"><a href="UnixLabels.html#TYPEfile_perm">file_perm</a></code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Access rights</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_nlink">st_nlink</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of links</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_uid">st_uid</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">User id of the owner</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_gid">st_gid</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Group ID of the file's group</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_rdev">st_rdev</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Device minor number</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_size">st_size</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Size in bytes</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_atime">st_atime</span>&nbsp;:<code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Last access time</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_mtime">st_mtime</span>&nbsp;:<code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Last modification time</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.st_ctime">st_ctime</span>&nbsp;:<code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Last status change time</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>
}

<div class="info">
The information returned by the <a href="UnixLabels.html#VALstat"><code class="code"><span class="constructor">UnixLabels</span>.stat</code></a> calls.<br>
</div>

<pre><span id="VALstat"><span class="keyword">val</span> stat</span> : <code class="type">string -&gt; <a href="UnixLabels.html#TYPEstats">stats</a></code></pre><div class="info">
Return the information for the named file.<br>
</div>
<pre><span id="VALlstat"><span class="keyword">val</span> lstat</span> : <code class="type">string -&gt; <a href="UnixLabels.html#TYPEstats">stats</a></code></pre><div class="info">
Same as <a href="UnixLabels.html#VALstat"><code class="code"><span class="constructor">UnixLabels</span>.stat</code></a>, but in case the file is a symbolic link,
   return the information for the link itself.<br>
</div>
<pre><span id="VALfstat"><span class="keyword">val</span> fstat</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEstats">stats</a></code></pre><div class="info">
Return the information for the file associated with the given
   descriptor.<br>
</div>
<pre><span id="VALisatty"><span class="keyword">val</span> isatty</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; bool</code></pre><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if the given file descriptor refers to a terminal or
   console window, <code class="code"><span class="keyword">false</span></code> otherwise.<br>
</div>
<br>
<span id="6_Fileoperationsonlargefiles"><h6>File operations on large files</h6></span><br>
<pre><span class="keyword">module</span> <a href="UnixLabels.LargeFile.html">LargeFile</a>: <code class="code"><span class="keyword">sig</span></code> <a href="UnixLabels.LargeFile.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
File operations on large files.
</div>
<br>
<span id="6_Operationsonfilenames"><h6>Operations on file names</h6></span><br>
<pre><span id="VALunlink"><span class="keyword">val</span> unlink</span> : <code class="type">string -&gt; unit</code></pre><div class="info">
Removes the named file<br>
</div>
<pre><span id="VALrename"><span class="keyword">val</span> rename</span> : <code class="type">src:string -&gt; dst:string -&gt; unit</code></pre><div class="info">
<code class="code">rename old <span class="keyword">new</span></code> changes the name of a file from <code class="code">old</code> to <code class="code"><span class="keyword">new</span></code>.<br>
</div>
<pre><span id="VALlink"><span class="keyword">val</span> link</span> : <code class="type">src:string -&gt; dst:string -&gt; unit</code></pre><div class="info">
<code class="code">link source dest</code> creates a hard link named <code class="code">dest</code> to the file
   named <code class="code">source</code>.<br>
</div>
<br>
<span id="6_Filepermissionsandownership"><h6>File permissions and ownership</h6></span><br>
<pre><span id="TYPEaccess_permission"><span class="keyword">type</span> <code class="type"></code>access_permission</span> = <code class="type"><a href="Unix.html#TYPEaccess_permission">Unix.access_permission</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTaccess_permission.R_OK"><span class="constructor">R_OK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Read permission</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTaccess_permission.W_OK"><span class="constructor">W_OK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Write permission</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTaccess_permission.X_OK"><span class="constructor">X_OK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Execution permission</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTaccess_permission.F_OK"><span class="constructor">F_OK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">File exists</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
Flags for the <a href="UnixLabels.html#VALaccess"><code class="code"><span class="constructor">UnixLabels</span>.access</code></a> call.<br>
</div>

<pre><span id="VALchmod"><span class="keyword">val</span> chmod</span> : <code class="type">string -&gt; perm:<a href="UnixLabels.html#TYPEfile_perm">file_perm</a> -&gt; unit</code></pre><div class="info">
Change the permissions of the named file.<br>
</div>
<pre><span id="VALfchmod"><span class="keyword">val</span> fchmod</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; perm:<a href="UnixLabels.html#TYPEfile_perm">file_perm</a> -&gt; unit</code></pre><div class="info">
Change the permissions of an opened file.<br>
</div>
<pre><span id="VALchown"><span class="keyword">val</span> chown</span> : <code class="type">string -&gt; uid:int -&gt; gid:int -&gt; unit</code></pre><div class="info">
Change the owner uid and owner gid of the named file.<br>
</div>
<pre><span id="VALfchown"><span class="keyword">val</span> fchown</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; uid:int -&gt; gid:int -&gt; unit</code></pre><div class="info">
Change the owner uid and owner gid of an opened file.<br>
</div>
<pre><span id="VALumask"><span class="keyword">val</span> umask</span> : <code class="type">int -&gt; int</code></pre><div class="info">
Set the process's file mode creation mask, and return the previous
    mask.<br>
</div>
<pre><span id="VALaccess"><span class="keyword">val</span> access</span> : <code class="type">string -&gt; perm:<a href="UnixLabels.html#TYPEaccess_permission">access_permission</a> list -&gt; unit</code></pre><div class="info">
Check that the process has the given permissions over the named
   file. Raise <code class="code"><span class="constructor">Unix_error</span></code> otherwise.<br>
</div>
<br>
<span id="6_Operationsonfiledescriptors"><h6>Operations on file descriptors</h6></span><br>
<pre><span id="VALdup"><span class="keyword">val</span> dup</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEfile_descr">file_descr</a></code></pre><div class="info">
Return a new file descriptor referencing the same file as
   the given descriptor.<br>
</div>
<pre><span id="VALdup2"><span class="keyword">val</span> dup2</span> : <code class="type">src:<a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; dst:<a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; unit</code></pre><div class="info">
<code class="code">dup2 fd1 fd2</code> duplicates <code class="code">fd1</code> to <code class="code">fd2</code>, closing <code class="code">fd2</code> if already
   opened.<br>
</div>
<pre><span id="VALset_nonblock"><span class="keyword">val</span> set_nonblock</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; unit</code></pre><div class="info">
Set the ``non-blocking'' flag on the given descriptor.
   When the non-blocking flag is set, reading on a descriptor
   on which there is temporarily no data available raises the
   <code class="code"><span class="constructor">EAGAIN</span></code> or <code class="code"><span class="constructor">EWOULDBLOCK</span></code> error instead of blocking;
   writing on a descriptor on which there is temporarily no room
   for writing also raises <code class="code"><span class="constructor">EAGAIN</span></code> or <code class="code"><span class="constructor">EWOULDBLOCK</span></code>.<br>
</div>
<pre><span id="VALclear_nonblock"><span class="keyword">val</span> clear_nonblock</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; unit</code></pre><div class="info">
Clear the ``non-blocking'' flag on the given descriptor.
   See <a href="UnixLabels.html#VALset_nonblock"><code class="code"><span class="constructor">UnixLabels</span>.set_nonblock</code></a>.<br>
</div>
<pre><span id="VALset_close_on_exec"><span class="keyword">val</span> set_close_on_exec</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; unit</code></pre><div class="info">
Set the ``close-on-exec'' flag on the given descriptor.
   A descriptor with the close-on-exec flag is automatically
   closed when the current process starts another program with
   one of the <code class="code">exec</code> functions.<br>
</div>
<pre><span id="VALclear_close_on_exec"><span class="keyword">val</span> clear_close_on_exec</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; unit</code></pre><div class="info">
Clear the ``close-on-exec'' flag on the given descriptor.
   See <a href="UnixLabels.html#VALset_close_on_exec"><code class="code"><span class="constructor">UnixLabels</span>.set_close_on_exec</code></a>.<br>
</div>
<br>
<span id="6_Directories"><h6>Directories</h6></span><br>
<pre><span id="VALmkdir"><span class="keyword">val</span> mkdir</span> : <code class="type">string -&gt; perm:<a href="UnixLabels.html#TYPEfile_perm">file_perm</a> -&gt; unit</code></pre><div class="info">
Create a directory with the given permissions.<br>
</div>
<pre><span id="VALrmdir"><span class="keyword">val</span> rmdir</span> : <code class="type">string -&gt; unit</code></pre><div class="info">
Remove an empty directory.<br>
</div>
<pre><span id="VALchdir"><span class="keyword">val</span> chdir</span> : <code class="type">string -&gt; unit</code></pre><div class="info">
Change the process working directory.<br>
</div>
<pre><span id="VALgetcwd"><span class="keyword">val</span> getcwd</span> : <code class="type">unit -&gt; string</code></pre><div class="info">
Return the name of the current working directory.<br>
</div>
<pre><span id="VALchroot"><span class="keyword">val</span> chroot</span> : <code class="type">string -&gt; unit</code></pre><div class="info">
Change the process root directory.<br>
</div>
<pre><span id="TYPEdir_handle"><span class="keyword">type</span> <code class="type"></code>dir_handle</span> = <code class="type"><a href="Unix.html#TYPEdir_handle">Unix.dir_handle</a></code> </pre>
<div class="info">
The type of descriptors over opened directories.<br>
</div>

<pre><span id="VALopendir"><span class="keyword">val</span> opendir</span> : <code class="type">string -&gt; <a href="UnixLabels.html#TYPEdir_handle">dir_handle</a></code></pre><div class="info">
Open a descriptor on a directory<br>
</div>
<pre><span id="VALreaddir"><span class="keyword">val</span> readdir</span> : <code class="type"><a href="UnixLabels.html#TYPEdir_handle">dir_handle</a> -&gt; string</code></pre><div class="info">
Return the next entry in a directory.<br>
<b>Raises</b> <code>End_of_file</code> when the end of the directory has been reached.<br>
</div>
<pre><span id="VALrewinddir"><span class="keyword">val</span> rewinddir</span> : <code class="type"><a href="UnixLabels.html#TYPEdir_handle">dir_handle</a> -&gt; unit</code></pre><div class="info">
Reposition the descriptor to the beginning of the directory<br>
</div>
<pre><span id="VALclosedir"><span class="keyword">val</span> closedir</span> : <code class="type"><a href="UnixLabels.html#TYPEdir_handle">dir_handle</a> -&gt; unit</code></pre><div class="info">
Close a directory descriptor.<br>
</div>
<br>
<span id="6_Pipesandredirections"><h6>Pipes and redirections</h6></span><br>
<pre><span id="VALpipe"><span class="keyword">val</span> pipe</span> : <code class="type">unit -&gt; <a href="UnixLabels.html#TYPEfile_descr">file_descr</a> * <a href="UnixLabels.html#TYPEfile_descr">file_descr</a></code></pre><div class="info">
Create a pipe. The first component of the result is opened
   for reading, that's the exit to the pipe. The second component is
   opened for writing, that's the entrance to the pipe.<br>
</div>
<pre><span id="VALmkfifo"><span class="keyword">val</span> mkfifo</span> : <code class="type">string -&gt; perm:<a href="UnixLabels.html#TYPEfile_perm">file_perm</a> -&gt; unit</code></pre><div class="info">
Create a named pipe with the given permissions.<br>
</div>
<br>
<span id="6_Highlevelprocessandredirectionmanagement"><h6>High-level process and redirection management</h6></span><br>
<pre><span id="VALcreate_process"><span class="keyword">val</span> create_process</span> : <code class="type">prog:string -&gt;<br>       args:string array -&gt;<br>       stdin:<a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt;<br>       stdout:<a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; stderr:<a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; int</code></pre><div class="info">
<code class="code">create_process prog args new_stdin new_stdout new_stderr</code>
   forks a new process that executes the program
   in file <code class="code">prog</code>, with arguments <code class="code">args</code>. The pid of the new
   process is returned immediately; the new process executes
   concurrently with the current process.
   The standard input and outputs of the new process are connected
   to the descriptors <code class="code">new_stdin</code>, <code class="code">new_stdout</code> and <code class="code">new_stderr</code>.
   Passing e.g. <code class="code">stdout</code> for <code class="code">new_stdout</code> prevents the redirection
   and causes the new process to have the same standard output
   as the current process.
   The executable file <code class="code">prog</code> is searched in the path.
   The new process has the same environment as the current process.<br>
</div>
<pre><span id="VALcreate_process_env"><span class="keyword">val</span> create_process_env</span> : <code class="type">prog:string -&gt;<br>       args:string array -&gt;<br>       env:string array -&gt;<br>       stdin:<a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt;<br>       stdout:<a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; stderr:<a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; int</code></pre><div class="info">
<code class="code">create_process_env prog args env new_stdin new_stdout new_stderr</code>
   works as <a href="UnixLabels.html#VALcreate_process"><code class="code"><span class="constructor">UnixLabels</span>.create_process</code></a>, except that the extra argument
   <code class="code">env</code> specifies the environment passed to the program.<br>
</div>
<pre><span id="VALopen_process_in"><span class="keyword">val</span> open_process_in</span> : <code class="type">string -&gt; <a href="Pervasives.html#TYPEin_channel">in_channel</a></code></pre><div class="info">
High-level pipe and process management. This function
   runs the given command in parallel with the program.
   The standard output of the command is redirected to a pipe,
   which can be read via the returned input channel.
   The command is interpreted by the shell <code class="code">/bin/sh</code> (cf. <code class="code">system</code>).<br>
</div>
<pre><span id="VALopen_process_out"><span class="keyword">val</span> open_process_out</span> : <code class="type">string -&gt; <a href="Pervasives.html#TYPEout_channel">out_channel</a></code></pre><div class="info">
Same as <a href="UnixLabels.html#VALopen_process_in"><code class="code"><span class="constructor">UnixLabels</span>.open_process_in</code></a>, but redirect the standard input of
   the command to a pipe.  Data written to the returned output channel
   is sent to the standard input of the command.
   Warning: writes on output channels are buffered, hence be careful
   to call <a href="Pervasives.html#VALflush"><code class="code">flush</code></a> at the right times to ensure
   correct synchronization.<br>
</div>
<pre><span id="VALopen_process"><span class="keyword">val</span> open_process</span> : <code class="type">string -&gt; <a href="Pervasives.html#TYPEin_channel">in_channel</a> * <a href="Pervasives.html#TYPEout_channel">out_channel</a></code></pre><div class="info">
Same as <a href="UnixLabels.html#VALopen_process_out"><code class="code"><span class="constructor">UnixLabels</span>.open_process_out</code></a>, but redirects both the standard
   input and standard output of the command to pipes connected to the two
   returned channels.  The input channel is connected to the output
   of the command, and the output channel to the input of the command.<br>
</div>
<pre><span id="VALopen_process_full"><span class="keyword">val</span> open_process_full</span> : <code class="type">string -&gt;<br>       env:string array -&gt;<br>       <a href="Pervasives.html#TYPEin_channel">in_channel</a> * <a href="Pervasives.html#TYPEout_channel">out_channel</a> * <a href="Pervasives.html#TYPEin_channel">in_channel</a></code></pre><div class="info">
Similar to <a href="UnixLabels.html#VALopen_process"><code class="code"><span class="constructor">UnixLabels</span>.open_process</code></a>, but the second argument specifies
   the environment passed to the command.  The result is a triple
   of channels connected respectively to the standard output, standard input,
   and standard error of the command.<br>
</div>
<pre><span id="VALclose_process_in"><span class="keyword">val</span> close_process_in</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; <a href="UnixLabels.html#TYPEprocess_status">process_status</a></code></pre><div class="info">
Close channels opened by <a href="UnixLabels.html#VALopen_process_in"><code class="code"><span class="constructor">UnixLabels</span>.open_process_in</code></a>,
   wait for the associated command to terminate,
   and return its termination status.<br>
</div>
<pre><span id="VALclose_process_out"><span class="keyword">val</span> close_process_out</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; <a href="UnixLabels.html#TYPEprocess_status">process_status</a></code></pre><div class="info">
Close channels opened by <a href="UnixLabels.html#VALopen_process_out"><code class="code"><span class="constructor">UnixLabels</span>.open_process_out</code></a>,
   wait for the associated command to terminate,
   and return its termination status.<br>
</div>
<pre><span id="VALclose_process"><span class="keyword">val</span> close_process</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> * <a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; <a href="UnixLabels.html#TYPEprocess_status">process_status</a></code></pre><div class="info">
Close channels opened by <a href="UnixLabels.html#VALopen_process"><code class="code"><span class="constructor">UnixLabels</span>.open_process</code></a>,
   wait for the associated command to terminate,
   and return its termination status.<br>
</div>
<pre><span id="VALclose_process_full"><span class="keyword">val</span> close_process_full</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> * <a href="Pervasives.html#TYPEout_channel">out_channel</a> * <a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt;<br>       <a href="UnixLabels.html#TYPEprocess_status">process_status</a></code></pre><div class="info">
Close channels opened by <a href="UnixLabels.html#VALopen_process_full"><code class="code"><span class="constructor">UnixLabels</span>.open_process_full</code></a>,
   wait for the associated command to terminate,
   and return its termination status.<br>
</div>
<br>
<span id="6_Symboliclinks"><h6>Symbolic links</h6></span><br>
<pre><span id="VALsymlink"><span class="keyword">val</span> symlink</span> : <code class="type">src:string -&gt; dst:string -&gt; unit</code></pre><div class="info">
<code class="code">symlink source dest</code> creates the file <code class="code">dest</code> as a symbolic link
   to the file <code class="code">source</code>.<br>
</div>
<pre><span id="VALreadlink"><span class="keyword">val</span> readlink</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Read the contents of a link.<br>
</div>
<br>
<span id="6_Polling"><h6>Polling</h6></span><br>
<pre><span id="VALselect"><span class="keyword">val</span> select</span> : <code class="type">read:<a href="UnixLabels.html#TYPEfile_descr">file_descr</a> list -&gt;<br>       write:<a href="UnixLabels.html#TYPEfile_descr">file_descr</a> list -&gt;<br>       except:<a href="UnixLabels.html#TYPEfile_descr">file_descr</a> list -&gt;<br>       timeout:float -&gt;<br>       <a href="UnixLabels.html#TYPEfile_descr">file_descr</a> list * <a href="UnixLabels.html#TYPEfile_descr">file_descr</a> list *<br>       <a href="UnixLabels.html#TYPEfile_descr">file_descr</a> list</code></pre><div class="info">
Wait until some input/output operations become possible on
   some channels. The three list arguments are, respectively, a set
   of descriptors to check for reading (first argument), for writing
   (second argument), or for exceptional conditions (third argument).
   The fourth argument is the maximal timeout, in seconds; a
   negative fourth argument means no timeout (unbounded wait).
   The result is composed of three sets of descriptors: those ready
   for reading (first component), ready for writing (second component),
   and over which an exceptional condition is pending (third
   component).<br>
</div>
<br>
<span id="6_Locking"><h6>Locking</h6></span><br>
<pre><span id="TYPElock_command"><span class="keyword">type</span> <code class="type"></code>lock_command</span> = <code class="type"><a href="Unix.html#TYPElock_command">Unix.lock_command</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlock_command.F_ULOCK"><span class="constructor">F_ULOCK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Unlock a region</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlock_command.F_LOCK"><span class="constructor">F_LOCK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Lock a region for writing, and block if already locked</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlock_command.F_TLOCK"><span class="constructor">F_TLOCK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Lock a region for writing, or fail if already locked</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlock_command.F_TEST"><span class="constructor">F_TEST</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Test a region for other process locks</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlock_command.F_RLOCK"><span class="constructor">F_RLOCK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Lock a region for reading, and block if already locked</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlock_command.F_TRLOCK"><span class="constructor">F_TRLOCK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Lock a region for reading, or fail if already locked</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
Commands for <a href="UnixLabels.html#VALlockf"><code class="code"><span class="constructor">UnixLabels</span>.lockf</code></a>.<br>
</div>

<pre><span id="VALlockf"><span class="keyword">val</span> lockf</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; mode:<a href="UnixLabels.html#TYPElock_command">lock_command</a> -&gt; len:int -&gt; unit</code></pre><div class="info">
<code class="code">lockf fd cmd size</code> puts a lock on a region of the file opened
   as <code class="code">fd</code>. The region starts at the current read/write position for
   <code class="code">fd</code> (as set by <a href="UnixLabels.html#VALlseek"><code class="code"><span class="constructor">UnixLabels</span>.lseek</code></a>), and extends <code class="code">size</code> bytes forward if
   <code class="code">size</code> is positive, <code class="code">size</code> bytes backwards if <code class="code">size</code> is negative,
   or to the end of the file if <code class="code">size</code> is zero.
   A write lock prevents any other
   process from acquiring a read or write lock on the region.
   A read lock prevents any other
   process from acquiring a write lock on the region, but lets
   other processes acquire read locks on it.
<p>

   The <code class="code"><span class="constructor">F_LOCK</span></code> and <code class="code"><span class="constructor">F_TLOCK</span></code> commands attempts to put a write lock
   on the specified region.
   The <code class="code"><span class="constructor">F_RLOCK</span></code> and <code class="code"><span class="constructor">F_TRLOCK</span></code> commands attempts to put a read lock
   on the specified region.
   If one or several locks put by another process prevent the current process
   from acquiring the lock, <code class="code"><span class="constructor">F_LOCK</span></code> and <code class="code"><span class="constructor">F_RLOCK</span></code> block until these locks
   are removed, while <code class="code"><span class="constructor">F_TLOCK</span></code> and <code class="code"><span class="constructor">F_TRLOCK</span></code> fail immediately with an
   exception.
   The <code class="code"><span class="constructor">F_ULOCK</span></code> removes whatever locks the current process has on
   the specified region.
   Finally, the <code class="code"><span class="constructor">F_TEST</span></code> command tests whether a write lock can be
   acquired on the specified region, without actually putting a lock.
   It returns immediately if successful, or fails otherwise.<br>
</p></div>
<br>
<span id="6_Signals"><h6>Signals</h6></span>
   Note: installation of signal handlers is performed via
   the functions <a href="Sys.html#VALsignal"><code class="code"><span class="constructor">Sys</span>.signal</code></a> and <a href="Sys.html#VALset_signal"><code class="code"><span class="constructor">Sys</span>.set_signal</code></a>.<br>
<pre><span id="VALkill"><span class="keyword">val</span> kill</span> : <code class="type">pid:int -&gt; signal:int -&gt; unit</code></pre><div class="info">
<code class="code">kill pid <span class="keyword">sig</span></code> sends signal number <code class="code"><span class="keyword">sig</span></code> to the process
   with id <code class="code">pid</code>.<br>
</div>
<pre><span id="TYPEsigprocmask_command"><span class="keyword">type</span> <code class="type"></code>sigprocmask_command</span> = <code class="type"><a href="Unix.html#TYPEsigprocmask_command">Unix.sigprocmask_command</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsigprocmask_command.SIG_SETMASK"><span class="constructor">SIG_SETMASK</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsigprocmask_command.SIG_BLOCK"><span class="constructor">SIG_BLOCK</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsigprocmask_command.SIG_UNBLOCK"><span class="constructor">SIG_UNBLOCK</span></span></code></td>

</tr></tbody></table>


<pre><span id="VALsigprocmask"><span class="keyword">val</span> sigprocmask</span> : <code class="type">mode:<a href="UnixLabels.html#TYPEsigprocmask_command">sigprocmask_command</a> -&gt; int list -&gt; int list</code></pre><div class="info">
<code class="code">sigprocmask cmd sigs</code> changes the set of blocked signals.
   If <code class="code">cmd</code> is <code class="code"><span class="constructor">SIG_SETMASK</span></code>, blocked signals are set to those in
   the list <code class="code">sigs</code>.
   If <code class="code">cmd</code> is <code class="code"><span class="constructor">SIG_BLOCK</span></code>, the signals in <code class="code">sigs</code> are added to
   the set of blocked signals.
   If <code class="code">cmd</code> is <code class="code"><span class="constructor">SIG_UNBLOCK</span></code>, the signals in <code class="code">sigs</code> are removed
   from the set of blocked signals.
   <code class="code">sigprocmask</code> returns the set of previously blocked signals.<br>
</div>
<pre><span id="VALsigpending"><span class="keyword">val</span> sigpending</span> : <code class="type">unit -&gt; int list</code></pre><div class="info">
Return the set of blocked signals that are currently pending.<br>
</div>
<pre><span id="VALsigsuspend"><span class="keyword">val</span> sigsuspend</span> : <code class="type">int list -&gt; unit</code></pre><div class="info">
<code class="code">sigsuspend sigs</code> atomically sets the blocked signals to <code class="code">sigs</code>
   and waits for a non-ignored, non-blocked signal to be delivered.
   On return, the blocked signals are reset to their initial value.<br>
</div>
<pre><span id="VALpause"><span class="keyword">val</span> pause</span> : <code class="type">unit -&gt; unit</code></pre><div class="info">
Wait until a non-ignored, non-blocked signal is delivered.<br>
</div>
<br>
<span id="6_Timefunctions"><h6>Time functions</h6></span><br>
<pre><span id="TYPEprocess_times"><span class="keyword">type</span> <code class="type"></code>process_times</span> = <code class="type"><a href="Unix.html#TYPEprocess_times">Unix.process_times</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTprocess_times.tms_utime">tms_utime</span>&nbsp;:<code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">User time for the process</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTprocess_times.tms_stime">tms_stime</span>&nbsp;:<code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">System time for the process</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTprocess_times.tms_cutime">tms_cutime</span>&nbsp;:<code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">User time for the children processes</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTprocess_times.tms_cstime">tms_cstime</span>&nbsp;:<code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">System time for the children processes</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>
}

<div class="info">
The execution times (CPU times) of a process.<br>
</div>

<pre><span id="TYPEtm"><span class="keyword">type</span> <code class="type"></code>tm</span> = <code class="type"><a href="Unix.html#TYPEtm">Unix.tm</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtm.tm_sec">tm_sec</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Seconds 0..60</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtm.tm_min">tm_min</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Minutes 0..59</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtm.tm_hour">tm_hour</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Hours 0..23</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtm.tm_mday">tm_mday</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Day of month 1..31</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtm.tm_mon">tm_mon</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Month of year 0..11</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtm.tm_year">tm_year</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Year - 1900</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtm.tm_wday">tm_wday</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Day of week (Sunday is 0)</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtm.tm_yday">tm_yday</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Day of year 0..365</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtm.tm_isdst">tm_isdst</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Daylight time savings in effect</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>
}

<div class="info">
The type representing wallclock time and calendar date.<br>
</div>

<pre><span id="VALtime"><span class="keyword">val</span> time</span> : <code class="type">unit -&gt; float</code></pre><div class="info">
Return the current time since 00:00:00 GMT, Jan. 1, 1970,
   in seconds.<br>
</div>
<pre><span id="VALgettimeofday"><span class="keyword">val</span> gettimeofday</span> : <code class="type">unit -&gt; float</code></pre><div class="info">
Same as <a href="UnixLabels.html#VALtime"><code class="code"><span class="constructor">UnixLabels</span>.time</code></a>, but with resolution better than 1 second.<br>
</div>
<pre><span id="VALgmtime"><span class="keyword">val</span> gmtime</span> : <code class="type">float -&gt; <a href="UnixLabels.html#TYPEtm">tm</a></code></pre><div class="info">
Convert a time in seconds, as returned by <a href="UnixLabels.html#VALtime"><code class="code"><span class="constructor">UnixLabels</span>.time</code></a>, into a date
   and a time. Assumes UTC (Coordinated Universal Time), also known as GMT.<br>
</div>
<pre><span id="VALlocaltime"><span class="keyword">val</span> localtime</span> : <code class="type">float -&gt; <a href="UnixLabels.html#TYPEtm">tm</a></code></pre><div class="info">
Convert a time in seconds, as returned by <a href="UnixLabels.html#VALtime"><code class="code"><span class="constructor">UnixLabels</span>.time</code></a>, into a date
   and a time. Assumes the local time zone.<br>
</div>
<pre><span id="VALmktime"><span class="keyword">val</span> mktime</span> : <code class="type"><a href="UnixLabels.html#TYPEtm">tm</a> -&gt; float * <a href="UnixLabels.html#TYPEtm">tm</a></code></pre><div class="info">
Convert a date and time, specified by the <code class="code">tm</code> argument, into
   a time in seconds, as returned by <a href="UnixLabels.html#VALtime"><code class="code"><span class="constructor">UnixLabels</span>.time</code></a>.  The <code class="code">tm_isdst</code>,
   <code class="code">tm_wday</code> and <code class="code">tm_yday</code> fields of <code class="code">tm</code> are ignored.  Also return a
   normalized copy of the given <code class="code">tm</code> record, with the <code class="code">tm_wday</code>,
   <code class="code">tm_yday</code>, and <code class="code">tm_isdst</code> fields recomputed from the other fields,
   and the other fields normalized (so that, e.g., 40 October is
   changed into 9 November).  The <code class="code">tm</code> argument is interpreted in the
   local time zone.<br>
</div>
<pre><span id="VALalarm"><span class="keyword">val</span> alarm</span> : <code class="type">int -&gt; int</code></pre><div class="info">
Schedule a <code class="code"><span class="constructor">SIGALRM</span></code> signal after the given number of seconds.<br>
</div>
<pre><span id="VALsleep"><span class="keyword">val</span> sleep</span> : <code class="type">int -&gt; unit</code></pre><div class="info">
Stop execution for the given number of seconds.<br>
</div>
<pre><span id="VALtimes"><span class="keyword">val</span> times</span> : <code class="type">unit -&gt; <a href="UnixLabels.html#TYPEprocess_times">process_times</a></code></pre><div class="info">
Return the execution times of the process.<br>
</div>
<pre><span id="VALutimes"><span class="keyword">val</span> utimes</span> : <code class="type">string -&gt; access:float -&gt; modif:float -&gt; unit</code></pre><div class="info">
Set the last access time (second arg) and last modification time
   (third arg) for a file. Times are expressed in seconds from
   00:00:00 GMT, Jan. 1, 1970.  A time of <code class="code">0.0</code> is interpreted as the
   current time.<br>
</div>
<pre><span id="TYPEinterval_timer"><span class="keyword">type</span> <code class="type"></code>interval_timer</span> = <code class="type"><a href="Unix.html#TYPEinterval_timer">Unix.interval_timer</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinterval_timer.ITIMER_REAL"><span class="constructor">ITIMER_REAL</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">decrements in real time, and sends the signal <code class="code"><span class="constructor">SIGALRM</span></code> when expired.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinterval_timer.ITIMER_VIRTUAL"><span class="constructor">ITIMER_VIRTUAL</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">decrements in process virtual time, and sends <code class="code"><span class="constructor">SIGVTALRM</span></code> when expired.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinterval_timer.ITIMER_PROF"><span class="constructor">ITIMER_PROF</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">(for profiling) decrements both when the process
         is running and when the system is running on behalf of the
         process; it sends <code class="code"><span class="constructor">SIGPROF</span></code> when expired.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
The three kinds of interval timers.<br>
</div>

<pre><span id="TYPEinterval_timer_status"><span class="keyword">type</span> <code class="type"></code>interval_timer_status</span> = <code class="type"><a href="Unix.html#TYPEinterval_timer_status">Unix.interval_timer_status</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinterval_timer_status.it_interval">it_interval</span>&nbsp;:<code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Period</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTinterval_timer_status.it_value">it_value</span>&nbsp;:<code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Current value of the timer</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>
}

<div class="info">
The type describing the status of an interval timer<br>
</div>

<pre><span id="VALgetitimer"><span class="keyword">val</span> getitimer</span> : <code class="type"><a href="UnixLabels.html#TYPEinterval_timer">interval_timer</a> -&gt; <a href="UnixLabels.html#TYPEinterval_timer_status">interval_timer_status</a></code></pre><div class="info">
Return the current status of the given interval timer.<br>
</div>
<pre><span id="VALsetitimer"><span class="keyword">val</span> setitimer</span> : <code class="type"><a href="UnixLabels.html#TYPEinterval_timer">interval_timer</a> -&gt;<br>       <a href="UnixLabels.html#TYPEinterval_timer_status">interval_timer_status</a> -&gt; <a href="UnixLabels.html#TYPEinterval_timer_status">interval_timer_status</a></code></pre><div class="info">
<code class="code">setitimer t s</code> sets the interval timer <code class="code">t</code> and returns
   its previous status. The <code class="code">s</code> argument is interpreted as follows:
   <code class="code">s.it_value</code>, if nonzero, is the time to the next timer expiration;
   <code class="code">s.it_interval</code>, if nonzero, specifies a value to
   be used in reloading it_value when the timer expires.
   Setting <code class="code">s.it_value</code> to zero disable the timer.
   Setting <code class="code">s.it_interval</code> to zero causes the timer to be disabled
   after its next expiration.<br>
</div>
<br>
<span id="6_Useridgroupid"><h6>User id, group id</h6></span><br>
<pre><span id="VALgetuid"><span class="keyword">val</span> getuid</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
Return the user id of the user executing the process.<br>
</div>
<pre><span id="VALgeteuid"><span class="keyword">val</span> geteuid</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
Return the effective user id under which the process runs.<br>
</div>
<pre><span id="VALsetuid"><span class="keyword">val</span> setuid</span> : <code class="type">int -&gt; unit</code></pre><div class="info">
Set the real user id and effective user id for the process.<br>
</div>
<pre><span id="VALgetgid"><span class="keyword">val</span> getgid</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
Return the group id of the user executing the process.<br>
</div>
<pre><span id="VALgetegid"><span class="keyword">val</span> getegid</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
Return the effective group id under which the process runs.<br>
</div>
<pre><span id="VALsetgid"><span class="keyword">val</span> setgid</span> : <code class="type">int -&gt; unit</code></pre><div class="info">
Set the real group id and effective group id for the process.<br>
</div>
<pre><span id="VALgetgroups"><span class="keyword">val</span> getgroups</span> : <code class="type">unit -&gt; int array</code></pre><div class="info">
Return the list of groups to which the user executing the process
   belongs.<br>
</div>
<pre><span id="VALsetgroups"><span class="keyword">val</span> setgroups</span> : <code class="type">int array -&gt; unit</code></pre><div class="info">
<code class="code">setgroups groups</code> sets the supplementary group IDs for the
      calling process. Appropriate privileges are required.<br>
</div>
<pre><span id="VALinitgroups"><span class="keyword">val</span> initgroups</span> : <code class="type">string -&gt; int -&gt; unit</code></pre><div class="info">
<code class="code">initgroups user group</code> initializes the group access list by
      reading the group database /etc/group and using all groups of
      which <code class="code">user</code> is a member. The additional group <code class="code">group</code> is also
      added to the list.<br>
</div>
<pre><span id="TYPEpasswd_entry"><span class="keyword">type</span> <code class="type"></code>passwd_entry</span> = <code class="type"><a href="Unix.html#TYPEpasswd_entry">Unix.passwd_entry</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTpasswd_entry.pw_name">pw_name</span>&nbsp;:<code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTpasswd_entry.pw_passwd">pw_passwd</span>&nbsp;:<code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTpasswd_entry.pw_uid">pw_uid</span>&nbsp;:<code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTpasswd_entry.pw_gid">pw_gid</span>&nbsp;:<code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTpasswd_entry.pw_gecos">pw_gecos</span>&nbsp;:<code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTpasswd_entry.pw_dir">pw_dir</span>&nbsp;:<code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTpasswd_entry.pw_shell">pw_shell</span>&nbsp;:<code class="type">string</code>;</code></td>

</tr></tbody></table>
}

<div class="info">
Structure of entries in the <code class="code">passwd</code> database.<br>
</div>

<pre><span id="TYPEgroup_entry"><span class="keyword">type</span> <code class="type"></code>group_entry</span> = <code class="type"><a href="Unix.html#TYPEgroup_entry">Unix.group_entry</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgroup_entry.gr_name">gr_name</span>&nbsp;:<code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgroup_entry.gr_passwd">gr_passwd</span>&nbsp;:<code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgroup_entry.gr_gid">gr_gid</span>&nbsp;:<code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgroup_entry.gr_mem">gr_mem</span>&nbsp;:<code class="type">string array</code>;</code></td>

</tr></tbody></table>
}

<div class="info">
Structure of entries in the <code class="code">groups</code> database.<br>
</div>

<pre><span id="VALgetlogin"><span class="keyword">val</span> getlogin</span> : <code class="type">unit -&gt; string</code></pre><div class="info">
Return the login name of the user executing the process.<br>
</div>
<pre><span id="VALgetpwnam"><span class="keyword">val</span> getpwnam</span> : <code class="type">string -&gt; <a href="UnixLabels.html#TYPEpasswd_entry">passwd_entry</a></code></pre><div class="info">
Find an entry in <code class="code">passwd</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.<br>
</div>
<pre><span id="VALgetgrnam"><span class="keyword">val</span> getgrnam</span> : <code class="type">string -&gt; <a href="UnixLabels.html#TYPEgroup_entry">group_entry</a></code></pre><div class="info">
Find an entry in <code class="code">group</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.<br>
</div>
<pre><span id="VALgetpwuid"><span class="keyword">val</span> getpwuid</span> : <code class="type">int -&gt; <a href="UnixLabels.html#TYPEpasswd_entry">passwd_entry</a></code></pre><div class="info">
Find an entry in <code class="code">passwd</code> with the given user id, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.<br>
</div>
<pre><span id="VALgetgrgid"><span class="keyword">val</span> getgrgid</span> : <code class="type">int -&gt; <a href="UnixLabels.html#TYPEgroup_entry">group_entry</a></code></pre><div class="info">
Find an entry in <code class="code">group</code> with the given group id, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.<br>
</div>
<br>
<span id="6_Internetaddresses"><h6>Internet addresses</h6></span><br>
<pre><span id="TYPEinet_addr"><span class="keyword">type</span> <code class="type"></code>inet_addr</span> = <code class="type"><a href="Unix.html#TYPEinet_addr">Unix.inet_addr</a></code> </pre>
<div class="info">
The abstract type of Internet addresses.<br>
</div>

<pre><span id="VALinet_addr_of_string"><span class="keyword">val</span> inet_addr_of_string</span> : <code class="type">string -&gt; <a href="UnixLabels.html#TYPEinet_addr">inet_addr</a></code></pre><div class="info">
Conversion from the printable representation of an Internet
    address to its internal representation.  The argument string
    consists of 4 numbers separated by periods (<code class="code"><span class="constructor">XXX</span>.<span class="constructor">YYY</span>.<span class="constructor">ZZZ</span>.<span class="constructor">TTT</span></code>)
    for IPv4 addresses, and up to 8 numbers separated by colons
    for IPv6 addresses.  Raise <code class="code"><span class="constructor">Failure</span></code> when given a string that
    does not match these formats.<br>
</div>
<pre><span id="VALstring_of_inet_addr"><span class="keyword">val</span> string_of_inet_addr</span> : <code class="type"><a href="UnixLabels.html#TYPEinet_addr">inet_addr</a> -&gt; string</code></pre><div class="info">
Return the printable representation of the given Internet address.
    See <a href="Unix.html#VALinet_addr_of_string"><code class="code"><span class="constructor">Unix</span>.inet_addr_of_string</code></a> for a description of the
    printable representation.<br>
</div>
<pre><span id="VALinet_addr_any"><span class="keyword">val</span> inet_addr_any</span> : <code class="type"><a href="UnixLabels.html#TYPEinet_addr">inet_addr</a></code></pre><div class="info">
A special IPv4 address, for use only with <code class="code">bind</code>, representing
   all the Internet addresses that the host machine possesses.<br>
</div>
<pre><span id="VALinet_addr_loopback"><span class="keyword">val</span> inet_addr_loopback</span> : <code class="type"><a href="UnixLabels.html#TYPEinet_addr">inet_addr</a></code></pre><div class="info">
A special IPv4 address representing the host machine (<code class="code">127.0.0.1</code>).<br>
</div>
<pre><span id="VALinet6_addr_any"><span class="keyword">val</span> inet6_addr_any</span> : <code class="type"><a href="UnixLabels.html#TYPEinet_addr">inet_addr</a></code></pre><div class="info">
A special IPv6 address, for use only with <code class="code">bind</code>, representing
   all the Internet addresses that the host machine possesses.<br>
</div>
<pre><span id="VALinet6_addr_loopback"><span class="keyword">val</span> inet6_addr_loopback</span> : <code class="type"><a href="UnixLabels.html#TYPEinet_addr">inet_addr</a></code></pre><div class="info">
A special IPv6 address representing the host machine (<code class="code">::1</code>).<br>
</div>
<br>
<span id="6_Sockets"><h6>Sockets</h6></span><br>
<pre><span id="TYPEsocket_domain"><span class="keyword">type</span> <code class="type"></code>socket_domain</span> = <code class="type"><a href="Unix.html#TYPEsocket_domain">Unix.socket_domain</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_domain.PF_UNIX"><span class="constructor">PF_UNIX</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Unix domain</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_domain.PF_INET"><span class="constructor">PF_INET</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Internet domain (IPv4)</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_domain.PF_INET6"><span class="constructor">PF_INET6</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Internet domain (IPv6)</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
The type of socket domains.  Not all platforms support
    IPv6 sockets (type <code class="code"><span class="constructor">PF_INET6</span></code>).<br>
</div>

<pre><span id="TYPEsocket_type"><span class="keyword">type</span> <code class="type"></code>socket_type</span> = <code class="type"><a href="Unix.html#TYPEsocket_type">Unix.socket_type</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_type.SOCK_STREAM"><span class="constructor">SOCK_STREAM</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Stream socket</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_type.SOCK_DGRAM"><span class="constructor">SOCK_DGRAM</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Datagram socket</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_type.SOCK_RAW"><span class="constructor">SOCK_RAW</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Raw socket</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_type.SOCK_SEQPACKET"><span class="constructor">SOCK_SEQPACKET</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Sequenced packets socket</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
The type of socket kinds, specifying the semantics of
   communications.<br>
</div>

<pre><span id="TYPEsockaddr"><span class="keyword">type</span> <code class="type"></code>sockaddr</span> = <code class="type"><a href="Unix.html#TYPEsockaddr">Unix.sockaddr</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsockaddr.ADDR_UNIX"><span class="constructor">ADDR_UNIX</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsockaddr.ADDR_INET"><span class="constructor">ADDR_INET</span></span> <span class="keyword">of</span> <code class="type"><a href="UnixLabels.html#TYPEinet_addr">inet_addr</a> * int</code></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">The type of socket addresses. <code class="code"><span class="constructor">ADDR_UNIX</span> name</code> is a socket
   address in the Unix domain; <code class="code">name</code> is a file name in the file
   system. <code class="code"><span class="constructor">ADDR_INET</span>(addr,port)</code> is a socket address in the Internet
   domain; <code class="code">addr</code> is the Internet address of the machine, and
   <code class="code">port</code> is the port number.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>


<pre><span id="VALsocket"><span class="keyword">val</span> socket</span> : <code class="type">domain:<a href="UnixLabels.html#TYPEsocket_domain">socket_domain</a> -&gt;<br>       kind:<a href="UnixLabels.html#TYPEsocket_type">socket_type</a> -&gt; protocol:int -&gt; <a href="UnixLabels.html#TYPEfile_descr">file_descr</a></code></pre><div class="info">
Create a new socket in the given domain, and with the
   given kind. The third argument is the protocol type; 0 selects
   the default protocol for that kind of sockets.<br>
</div>
<pre><span id="VALdomain_of_sockaddr"><span class="keyword">val</span> domain_of_sockaddr</span> : <code class="type"><a href="UnixLabels.html#TYPEsockaddr">sockaddr</a> -&gt; <a href="UnixLabels.html#TYPEsocket_domain">socket_domain</a></code></pre><div class="info">
Return the socket domain adequate for the given socket address.<br>
</div>
<pre><span id="VALsocketpair"><span class="keyword">val</span> socketpair</span> : <code class="type">domain:<a href="UnixLabels.html#TYPEsocket_domain">socket_domain</a> -&gt;<br>       kind:<a href="UnixLabels.html#TYPEsocket_type">socket_type</a> -&gt;<br>       protocol:int -&gt; <a href="UnixLabels.html#TYPEfile_descr">file_descr</a> * <a href="UnixLabels.html#TYPEfile_descr">file_descr</a></code></pre><div class="info">
Create a pair of unnamed sockets, connected together.<br>
</div>
<pre><span id="VALaccept"><span class="keyword">val</span> accept</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEfile_descr">file_descr</a> * <a href="UnixLabels.html#TYPEsockaddr">sockaddr</a></code></pre><div class="info">
Accept connections on the given socket. The returned descriptor
   is a socket connected to the client; the returned address is
   the address of the connecting client.<br>
</div>
<pre><span id="VALbind"><span class="keyword">val</span> bind</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; addr:<a href="UnixLabels.html#TYPEsockaddr">sockaddr</a> -&gt; unit</code></pre><div class="info">
Bind a socket to an address.<br>
</div>
<pre><span id="VALconnect"><span class="keyword">val</span> connect</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; addr:<a href="UnixLabels.html#TYPEsockaddr">sockaddr</a> -&gt; unit</code></pre><div class="info">
Connect a socket to an address.<br>
</div>
<pre><span id="VALlisten"><span class="keyword">val</span> listen</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; max:int -&gt; unit</code></pre><div class="info">
Set up a socket for receiving connection requests. The integer
   argument is the maximal number of pending requests.<br>
</div>
<pre><span id="TYPEshutdown_command"><span class="keyword">type</span> <code class="type"></code>shutdown_command</span> = <code class="type"><a href="Unix.html#TYPEshutdown_command">Unix.shutdown_command</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTshutdown_command.SHUTDOWN_RECEIVE"><span class="constructor">SHUTDOWN_RECEIVE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Close for receiving</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTshutdown_command.SHUTDOWN_SEND"><span class="constructor">SHUTDOWN_SEND</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Close for sending</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTshutdown_command.SHUTDOWN_ALL"><span class="constructor">SHUTDOWN_ALL</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Close both</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
The type of commands for <code class="code">shutdown</code>.<br>
</div>

<pre><span id="VALshutdown"><span class="keyword">val</span> shutdown</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; mode:<a href="UnixLabels.html#TYPEshutdown_command">shutdown_command</a> -&gt; unit</code></pre><div class="info">
Shutdown a socket connection. <code class="code"><span class="constructor">SHUTDOWN_SEND</span></code> as second argument
   causes reads on the other end of the connection to return
   an end-of-file condition.
   <code class="code"><span class="constructor">SHUTDOWN_RECEIVE</span></code> causes writes on the other end of the connection
   to return a closed pipe condition (<code class="code"><span class="constructor">SIGPIPE</span></code> signal).<br>
</div>
<pre><span id="VALgetsockname"><span class="keyword">val</span> getsockname</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEsockaddr">sockaddr</a></code></pre><div class="info">
Return the address of the given socket.<br>
</div>
<pre><span id="VALgetpeername"><span class="keyword">val</span> getpeername</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEsockaddr">sockaddr</a></code></pre><div class="info">
Return the address of the host connected to the given socket.<br>
</div>
<pre><span id="TYPEmsg_flag"><span class="keyword">type</span> <code class="type"></code>msg_flag</span> = <code class="type"><a href="Unix.html#TYPEmsg_flag">Unix.msg_flag</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTmsg_flag.MSG_OOB"><span class="constructor">MSG_OOB</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTmsg_flag.MSG_DONTROUTE"><span class="constructor">MSG_DONTROUTE</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTmsg_flag.MSG_PEEK"><span class="constructor">MSG_PEEK</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">The flags for <a href="UnixLabels.html#VALrecv"><code class="code"><span class="constructor">UnixLabels</span>.recv</code></a>,  <a href="UnixLabels.html#VALrecvfrom"><code class="code"><span class="constructor">UnixLabels</span>.recvfrom</code></a>,
   <a href="UnixLabels.html#VALsend"><code class="code"><span class="constructor">UnixLabels</span>.send</code></a> and <a href="UnixLabels.html#VALsendto"><code class="code"><span class="constructor">UnixLabels</span>.sendto</code></a>.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>


<pre><span id="VALrecv"><span class="keyword">val</span> recv</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt;<br>       buf:string -&gt; pos:int -&gt; len:int -&gt; mode:<a href="UnixLabels.html#TYPEmsg_flag">msg_flag</a> list -&gt; int</code></pre><div class="info">
Receive data from a connected socket.<br>
</div>
<pre><span id="VALrecvfrom"><span class="keyword">val</span> recvfrom</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt;<br>       buf:string -&gt;<br>       pos:int -&gt;<br>       len:int -&gt; mode:<a href="UnixLabels.html#TYPEmsg_flag">msg_flag</a> list -&gt; int * <a href="UnixLabels.html#TYPEsockaddr">sockaddr</a></code></pre><div class="info">
Receive data from an unconnected socket.<br>
</div>
<pre><span id="VALsend"><span class="keyword">val</span> send</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt;<br>       buf:string -&gt; pos:int -&gt; len:int -&gt; mode:<a href="UnixLabels.html#TYPEmsg_flag">msg_flag</a> list -&gt; int</code></pre><div class="info">
Send data over a connected socket.<br>
</div>
<pre><span id="VALsendto"><span class="keyword">val</span> sendto</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt;<br>       buf:string -&gt;<br>       pos:int -&gt;<br>       len:int -&gt; mode:<a href="UnixLabels.html#TYPEmsg_flag">msg_flag</a> list -&gt; addr:<a href="UnixLabels.html#TYPEsockaddr">sockaddr</a> -&gt; int</code></pre><div class="info">
Send data over an unconnected socket.<br>
</div>
<br>
<span id="6_Socketoptions"><h6>Socket options</h6></span><br>
<pre><code><span id="TYPEsocket_bool_option"><span class="keyword">type</span> <code class="type"></code>socket_bool_option</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_bool_option.SO_DEBUG"><span class="constructor">SO_DEBUG</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Record debugging information</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_bool_option.SO_BROADCAST"><span class="constructor">SO_BROADCAST</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Permit sending of broadcast messages</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_bool_option.SO_REUSEADDR"><span class="constructor">SO_REUSEADDR</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Allow reuse of local addresses for bind</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_bool_option.SO_KEEPALIVE"><span class="constructor">SO_KEEPALIVE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Keep connection active</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_bool_option.SO_DONTROUTE"><span class="constructor">SO_DONTROUTE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Bypass the standard routing algorithms</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_bool_option.SO_OOBINLINE"><span class="constructor">SO_OOBINLINE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Leave out-of-band data in line</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_bool_option.SO_ACCEPTCONN"><span class="constructor">SO_ACCEPTCONN</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Report whether socket listening is enabled</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_bool_option.TCP_NODELAY"><span class="constructor">TCP_NODELAY</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Control the Nagle algorithm for TCP sockets</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_bool_option.IPV6_ONLY"><span class="constructor">IPV6_ONLY</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Forbid binding an IPv6 socket to an IPv4 address</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
The socket options that can be consulted with <a href="UnixLabels.html#VALgetsockopt"><code class="code"><span class="constructor">UnixLabels</span>.getsockopt</code></a>
   and modified with <a href="UnixLabels.html#VALsetsockopt"><code class="code"><span class="constructor">UnixLabels</span>.setsockopt</code></a>.  These options have a boolean
   (<code class="code"><span class="keyword">true</span></code>/<code class="code"><span class="keyword">false</span></code>) value.<br>
</div>

<pre><code><span id="TYPEsocket_int_option"><span class="keyword">type</span> <code class="type"></code>socket_int_option</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_int_option.SO_SNDBUF"><span class="constructor">SO_SNDBUF</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Size of send buffer</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_int_option.SO_RCVBUF"><span class="constructor">SO_RCVBUF</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Size of received buffer</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_int_option.SO_ERROR"><span class="constructor">SO_ERROR</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Deprecated.  Use <a href="Unix.html#VALgetsockopt_error"><code class="code"><span class="constructor">Unix</span>.getsockopt_error</code></a> instead.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_int_option.SO_TYPE"><span class="constructor">SO_TYPE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Report the socket type</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_int_option.SO_RCVLOWAT"><span class="constructor">SO_RCVLOWAT</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Minimum number of bytes to process for input operations</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_int_option.SO_SNDLOWAT"><span class="constructor">SO_SNDLOWAT</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Minimum number of bytes to process for output operations</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
The socket options that can be consulted with <a href="UnixLabels.html#VALgetsockopt_int"><code class="code"><span class="constructor">UnixLabels</span>.getsockopt_int</code></a>
   and modified with <a href="UnixLabels.html#VALsetsockopt_int"><code class="code"><span class="constructor">UnixLabels</span>.setsockopt_int</code></a>.  These options have an
   integer value.<br>
</div>

<pre><code><span id="TYPEsocket_optint_option"><span class="keyword">type</span> <code class="type"></code>socket_optint_option</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_optint_option.SO_LINGER"><span class="constructor">SO_LINGER</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Whether to linger on closed connections
                    that have data present, and for how long
                    (in seconds)</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
The socket options that can be consulted with <a href="Unix.html#VALgetsockopt_optint"><code class="code"><span class="constructor">Unix</span>.getsockopt_optint</code></a>
   and modified with <a href="Unix.html#VALsetsockopt_optint"><code class="code"><span class="constructor">Unix</span>.setsockopt_optint</code></a>.  These options have a
   value of type <code class="code">int option</code>, with <code class="code"><span class="constructor">None</span></code> meaning ``disabled''.<br>
</div>

<pre><code><span id="TYPEsocket_float_option"><span class="keyword">type</span> <code class="type"></code>socket_float_option</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_float_option.SO_RCVTIMEO"><span class="constructor">SO_RCVTIMEO</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Timeout for input operations</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsocket_float_option.SO_SNDTIMEO"><span class="constructor">SO_SNDTIMEO</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Timeout for output operations</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
The socket options that can be consulted with <a href="UnixLabels.html#VALgetsockopt_float"><code class="code"><span class="constructor">UnixLabels</span>.getsockopt_float</code></a>
   and modified with <a href="UnixLabels.html#VALsetsockopt_float"><code class="code"><span class="constructor">UnixLabels</span>.setsockopt_float</code></a>.  These options have a
   floating-point value representing a time in seconds.
   The value 0 means infinite timeout.<br>
</div>

<pre><span id="VALgetsockopt"><span class="keyword">val</span> getsockopt</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEsocket_bool_option">socket_bool_option</a> -&gt; bool</code></pre><div class="info">
Return the current status of a boolean-valued option
   in the given socket.<br>
</div>
<pre><span id="VALsetsockopt"><span class="keyword">val</span> setsockopt</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEsocket_bool_option">socket_bool_option</a> -&gt; bool -&gt; unit</code></pre><div class="info">
Set or clear a boolean-valued option in the given socket.<br>
</div>
<pre><span id="VALgetsockopt_int"><span class="keyword">val</span> getsockopt_int</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEsocket_int_option">socket_int_option</a> -&gt; int</code></pre><div class="info">
Same as <a href="Unix.html#VALgetsockopt"><code class="code"><span class="constructor">Unix</span>.getsockopt</code></a> for an integer-valued socket option.<br>
</div>
<pre><span id="VALsetsockopt_int"><span class="keyword">val</span> setsockopt_int</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEsocket_int_option">socket_int_option</a> -&gt; int -&gt; unit</code></pre><div class="info">
Same as <a href="Unix.html#VALsetsockopt"><code class="code"><span class="constructor">Unix</span>.setsockopt</code></a> for an integer-valued socket option.<br>
</div>
<pre><span id="VALgetsockopt_optint"><span class="keyword">val</span> getsockopt_optint</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEsocket_optint_option">socket_optint_option</a> -&gt; int option</code></pre><div class="info">
Same as <a href="Unix.html#VALgetsockopt"><code class="code"><span class="constructor">Unix</span>.getsockopt</code></a> for a socket option whose value is an <code class="code">int option</code>.<br>
</div>
<pre><span id="VALsetsockopt_optint"><span class="keyword">val</span> setsockopt_optint</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt;<br>       <a href="UnixLabels.html#TYPEsocket_optint_option">socket_optint_option</a> -&gt; int option -&gt; unit</code></pre><div class="info">
Same as <a href="Unix.html#VALsetsockopt"><code class="code"><span class="constructor">Unix</span>.setsockopt</code></a> for a socket option whose value is an <code class="code">int option</code>.<br>
</div>
<pre><span id="VALgetsockopt_float"><span class="keyword">val</span> getsockopt_float</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEsocket_float_option">socket_float_option</a> -&gt; float</code></pre><div class="info">
Same as <a href="Unix.html#VALgetsockopt"><code class="code"><span class="constructor">Unix</span>.getsockopt</code></a> for a socket option whose value is a floating-point number.<br>
</div>
<pre><span id="VALsetsockopt_float"><span class="keyword">val</span> setsockopt_float</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEsocket_float_option">socket_float_option</a> -&gt; float -&gt; unit</code></pre><div class="info">
Same as <a href="Unix.html#VALsetsockopt"><code class="code"><span class="constructor">Unix</span>.setsockopt</code></a> for a socket option whose value is a floating-point number.<br>
</div>
<pre><span id="VALgetsockopt_error"><span class="keyword">val</span> getsockopt_error</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEerror">error</a> option</code></pre><div class="info">
Return the error condition associated with the given socket,
    and clear it.<br>
</div>
<br>
<span id="6_Highlevelnetworkconnectionfunctions"><h6>High-level network connection functions</h6></span><br>
<pre><span id="VALopen_connection"><span class="keyword">val</span> open_connection</span> : <code class="type"><a href="UnixLabels.html#TYPEsockaddr">sockaddr</a> -&gt; <a href="Pervasives.html#TYPEin_channel">in_channel</a> * <a href="Pervasives.html#TYPEout_channel">out_channel</a></code></pre><div class="info">
Connect to a server at the given address.
   Return a pair of buffered channels connected to the server.
   Remember to call <a href="Pervasives.html#VALflush"><code class="code">flush</code></a> on the output channel at the right
   times to ensure correct synchronization.<br>
</div>
<pre><span id="VALshutdown_connection"><span class="keyword">val</span> shutdown_connection</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; unit</code></pre><div class="info">
``Shut down'' a connection established with <a href="UnixLabels.html#VALopen_connection"><code class="code"><span class="constructor">UnixLabels</span>.open_connection</code></a>;
   that is, transmit an end-of-file condition to the server reading
   on the other side of the connection.<br>
</div>
<pre><span id="VALestablish_server"><span class="keyword">val</span> establish_server</span> : <code class="type">(<a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; <a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; unit) -&gt;<br>       addr:<a href="UnixLabels.html#TYPEsockaddr">sockaddr</a> -&gt; unit</code></pre><div class="info">
Establish a server on the given address.
   The function given as first argument is called for each connection
   with two buffered channels connected to the client. A new process
   is created for each connection. The function <a href="UnixLabels.html#VALestablish_server"><code class="code"><span class="constructor">UnixLabels</span>.establish_server</code></a>
   never returns normally.<br>
</div>
<br>
<span id="6_Hostandprotocoldatabases"><h6>Host and protocol databases</h6></span><br>
<pre><span id="TYPEhost_entry"><span class="keyword">type</span> <code class="type"></code>host_entry</span> = <code class="type"><a href="Unix.html#TYPEhost_entry">Unix.host_entry</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELThost_entry.h_name">h_name</span>&nbsp;:<code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELThost_entry.h_aliases">h_aliases</span>&nbsp;:<code class="type">string array</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELThost_entry.h_addrtype">h_addrtype</span>&nbsp;:<code class="type"><a href="UnixLabels.html#TYPEsocket_domain">socket_domain</a></code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELThost_entry.h_addr_list">h_addr_list</span>&nbsp;:<code class="type"><a href="UnixLabels.html#TYPEinet_addr">inet_addr</a> array</code>;</code></td>

</tr></tbody></table>
}

<div class="info">
Structure of entries in the <code class="code">hosts</code> database.<br>
</div>

<pre><span id="TYPEprotocol_entry"><span class="keyword">type</span> <code class="type"></code>protocol_entry</span> = <code class="type"><a href="Unix.html#TYPEprotocol_entry">Unix.protocol_entry</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTprotocol_entry.p_name">p_name</span>&nbsp;:<code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTprotocol_entry.p_aliases">p_aliases</span>&nbsp;:<code class="type">string array</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTprotocol_entry.p_proto">p_proto</span>&nbsp;:<code class="type">int</code>;</code></td>

</tr></tbody></table>
}

<div class="info">
Structure of entries in the <code class="code">protocols</code> database.<br>
</div>

<pre><span id="TYPEservice_entry"><span class="keyword">type</span> <code class="type"></code>service_entry</span> = <code class="type"><a href="Unix.html#TYPEservice_entry">Unix.service_entry</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTservice_entry.s_name">s_name</span>&nbsp;:<code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTservice_entry.s_aliases">s_aliases</span>&nbsp;:<code class="type">string array</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTservice_entry.s_port">s_port</span>&nbsp;:<code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTservice_entry.s_proto">s_proto</span>&nbsp;:<code class="type">string</code>;</code></td>

</tr></tbody></table>
}

<div class="info">
Structure of entries in the <code class="code">services</code> database.<br>
</div>

<pre><span id="VALgethostname"><span class="keyword">val</span> gethostname</span> : <code class="type">unit -&gt; string</code></pre><div class="info">
Return the name of the local host.<br>
</div>
<pre><span id="VALgethostbyname"><span class="keyword">val</span> gethostbyname</span> : <code class="type">string -&gt; <a href="UnixLabels.html#TYPEhost_entry">host_entry</a></code></pre><div class="info">
Find an entry in <code class="code">hosts</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.<br>
</div>
<pre><span id="VALgethostbyaddr"><span class="keyword">val</span> gethostbyaddr</span> : <code class="type"><a href="UnixLabels.html#TYPEinet_addr">inet_addr</a> -&gt; <a href="UnixLabels.html#TYPEhost_entry">host_entry</a></code></pre><div class="info">
Find an entry in <code class="code">hosts</code> with the given address, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.<br>
</div>
<pre><span id="VALgetprotobyname"><span class="keyword">val</span> getprotobyname</span> : <code class="type">string -&gt; <a href="UnixLabels.html#TYPEprotocol_entry">protocol_entry</a></code></pre><div class="info">
Find an entry in <code class="code">protocols</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.<br>
</div>
<pre><span id="VALgetprotobynumber"><span class="keyword">val</span> getprotobynumber</span> : <code class="type">int -&gt; <a href="UnixLabels.html#TYPEprotocol_entry">protocol_entry</a></code></pre><div class="info">
Find an entry in <code class="code">protocols</code> with the given protocol number,
   or raise <code class="code"><span class="constructor">Not_found</span></code>.<br>
</div>
<pre><span id="VALgetservbyname"><span class="keyword">val</span> getservbyname</span> : <code class="type">string -&gt; protocol:string -&gt; <a href="UnixLabels.html#TYPEservice_entry">service_entry</a></code></pre><div class="info">
Find an entry in <code class="code">services</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.<br>
</div>
<pre><span id="VALgetservbyport"><span class="keyword">val</span> getservbyport</span> : <code class="type">int -&gt; protocol:string -&gt; <a href="UnixLabels.html#TYPEservice_entry">service_entry</a></code></pre><div class="info">
Find an entry in <code class="code">services</code> with the given service number,
   or raise <code class="code"><span class="constructor">Not_found</span></code>.<br>
</div>
<pre><code><span id="TYPEaddr_info"><span class="keyword">type</span> <code class="type"></code>addr_info</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTaddr_info.ai_family">ai_family</span>&nbsp;:<code class="type"><a href="UnixLabels.html#TYPEsocket_domain">socket_domain</a></code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Socket domain</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTaddr_info.ai_socktype">ai_socktype</span>&nbsp;:<code class="type"><a href="UnixLabels.html#TYPEsocket_type">socket_type</a></code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Socket type</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTaddr_info.ai_protocol">ai_protocol</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Socket protocol number</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTaddr_info.ai_addr">ai_addr</span>&nbsp;:<code class="type"><a href="UnixLabels.html#TYPEsockaddr">sockaddr</a></code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Address</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTaddr_info.ai_canonname">ai_canonname</span>&nbsp;:<code class="type">string</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Canonical host name</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>
}

<div class="info">
Address information returned by <a href="Unix.html#VALgetaddrinfo"><code class="code"><span class="constructor">Unix</span>.getaddrinfo</code></a>.<br>
</div>

<pre><code><span id="TYPEgetaddrinfo_option"><span class="keyword">type</span> <code class="type"></code>getaddrinfo_option</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgetaddrinfo_option.AI_FAMILY"><span class="constructor">AI_FAMILY</span></span> <span class="keyword">of</span> <code class="type"><a href="UnixLabels.html#TYPEsocket_domain">socket_domain</a></code></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Impose the given socket domain</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgetaddrinfo_option.AI_SOCKTYPE"><span class="constructor">AI_SOCKTYPE</span></span> <span class="keyword">of</span> <code class="type"><a href="UnixLabels.html#TYPEsocket_type">socket_type</a></code></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Impose the given socket type</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgetaddrinfo_option.AI_PROTOCOL"><span class="constructor">AI_PROTOCOL</span></span> <span class="keyword">of</span> <code class="type">int</code></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Impose the given protocol</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgetaddrinfo_option.AI_NUMERICHOST"><span class="constructor">AI_NUMERICHOST</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Do not call name resolver,
                                            expect numeric IP address</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgetaddrinfo_option.AI_CANONNAME"><span class="constructor">AI_CANONNAME</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Fill the <code class="code">ai_canonname</code> field
                                            of the result</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgetaddrinfo_option.AI_PASSIVE"><span class="constructor">AI_PASSIVE</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Set address to ``any'' address
                                            for use with <a href="Unix.html#VALbind"><code class="code"><span class="constructor">Unix</span>.bind</code></a></td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
Options to <a href="Unix.html#VALgetaddrinfo"><code class="code"><span class="constructor">Unix</span>.getaddrinfo</code></a>.<br>
</div>

<pre><span id="VALgetaddrinfo"><span class="keyword">val</span> getaddrinfo</span> : <code class="type">string -&gt;<br>       string -&gt; <a href="UnixLabels.html#TYPEgetaddrinfo_option">getaddrinfo_option</a> list -&gt; <a href="UnixLabels.html#TYPEaddr_info">addr_info</a> list</code></pre><div class="info">
<code class="code">getaddrinfo host service opts</code> returns a list of <a href="Unix.html#TYPEaddr_info"><code class="code"><span class="constructor">Unix</span>.addr_info</code></a>
    records describing socket parameters and addresses suitable for
    communicating with the given host and service.  The empty list is
    returned if the host or service names are unknown, or the constraints
    expressed in <code class="code">opts</code> cannot be satisfied.
<p>

    <code class="code">host</code> is either a host name or the string representation of an IP
    address.  <code class="code">host</code> can be given as the empty string; in this case,
    the ``any'' address or the ``loopback'' address are used,
    depending whether <code class="code">opts</code> contains <code class="code"><span class="constructor">AI_PASSIVE</span></code>.
    <code class="code">service</code> is either a service name or the string representation of
    a port number.  <code class="code">service</code> can be given as the empty string;
    in this case, the port field of the returned addresses is set to 0.
    <code class="code">opts</code> is a possibly empty list of options that allows the caller
    to force a particular socket domain (e.g. IPv6 only or IPv4 only)
    or a particular socket type (e.g. TCP only or UDP only).<br>
</p></div>
<pre><code><span id="TYPEname_info"><span class="keyword">type</span> <code class="type"></code>name_info</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTname_info.ni_hostname">ni_hostname</span>&nbsp;:<code class="type">string</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Name or IP address of host</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTname_info.ni_service">ni_service</span>&nbsp;:<code class="type">string</code>;</code></td>

</tr></tbody></table>
}

<div class="info">
Name of service or port number<br>
</div>

<br>
Host and service information returned by <a href="Unix.html#VALgetnameinfo"><code class="code"><span class="constructor">Unix</span>.getnameinfo</code></a>.<br>
<pre><code><span id="TYPEgetnameinfo_option"><span class="keyword">type</span> <code class="type"></code>getnameinfo_option</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgetnameinfo_option.NI_NOFQDN"><span class="constructor">NI_NOFQDN</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Do not qualify local host names</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgetnameinfo_option.NI_NUMERICHOST"><span class="constructor">NI_NUMERICHOST</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Always return host as IP address</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgetnameinfo_option.NI_NAMEREQD"><span class="constructor">NI_NAMEREQD</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Fail if host name cannot be determined</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgetnameinfo_option.NI_NUMERICSERV"><span class="constructor">NI_NUMERICSERV</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Always return service as port number</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTgetnameinfo_option.NI_DGRAM"><span class="constructor">NI_DGRAM</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Consider the service as UDP-based
                             instead of the default TCP</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
Options to <a href="Unix.html#VALgetnameinfo"><code class="code"><span class="constructor">Unix</span>.getnameinfo</code></a>.<br>
</div>

<pre><span id="VALgetnameinfo"><span class="keyword">val</span> getnameinfo</span> : <code class="type"><a href="UnixLabels.html#TYPEsockaddr">sockaddr</a> -&gt;<br>       <a href="UnixLabels.html#TYPEgetnameinfo_option">getnameinfo_option</a> list -&gt; <a href="UnixLabels.html#TYPEname_info">name_info</a></code></pre><div class="info">
<code class="code">getnameinfo addr opts</code> returns the host name and service name
    corresponding to the socket address <code class="code">addr</code>.  <code class="code">opts</code> is a possibly
    empty list of options that governs how these names are obtained.
    Raise <code class="code"><span class="constructor">Not_found</span></code> if an error occurs.<br>
</div>
<br>
<span id="6_Terminalinterface"><h6>Terminal interface</h6></span><br>
<br>
The following functions implement the POSIX standard terminal
   interface. They provide control over asynchronous communication ports
   and pseudo-terminals. Refer to the <code class="code">termios</code> man page for a
   complete description.<br>
<pre><span id="TYPEterminal_io"><span class="keyword">type</span> <code class="type"></code>terminal_io</span> = <code class="type"><a href="Unix.html#TYPEterminal_io">Unix.terminal_io</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_ignbrk">c_ignbrk</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Ignore the break condition.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_brkint">c_brkint</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Signal interrupt on break condition.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_ignpar">c_ignpar</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Ignore characters with parity errors.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_parmrk">c_parmrk</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Mark parity errors.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_inpck">c_inpck</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Enable parity check on input.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_istrip">c_istrip</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Strip 8th bit on input characters.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_inlcr">c_inlcr</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Map NL to CR on input.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_igncr">c_igncr</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Ignore CR on input.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_icrnl">c_icrnl</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Map CR to NL on input.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_ixon">c_ixon</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Recognize XON/XOFF characters on input.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_ixoff">c_ixoff</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Emit XON/XOFF chars to control input flow.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_opost">c_opost</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Enable output processing.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_obaud">c_obaud</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Output baud rate (0 means close connection).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_ibaud">c_ibaud</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Input baud rate.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_csize">c_csize</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of bits per character (5-8).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_cstopb">c_cstopb</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of stop bits (1-2).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_cread">c_cread</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Reception is enabled.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_parenb">c_parenb</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Enable parity generation and detection.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_parodd">c_parodd</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Specify odd parity instead of even.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_hupcl">c_hupcl</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Hang up on last close.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_clocal">c_clocal</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Ignore modem status lines.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_isig">c_isig</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Generate signal on INTR, QUIT, SUSP.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_icanon">c_icanon</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Enable canonical processing
                                 (line buffering and editing)</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_noflsh">c_noflsh</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Disable flush after INTR, QUIT, SUSP.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_echo">c_echo</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Echo input characters.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_echoe">c_echoe</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Echo ERASE (to erase previous character).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_echok">c_echok</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Echo KILL (to erase the current line).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_echonl">c_echonl</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Echo NL even if c_echo is not set.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_vintr">c_vintr</span>&nbsp;:<code class="type">char</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Interrupt character (usually ctrl-C).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_vquit">c_vquit</span>&nbsp;:<code class="type">char</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Quit character (usually ctrl-\).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_verase">c_verase</span>&nbsp;:<code class="type">char</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Erase character (usually DEL or ctrl-H).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_vkill">c_vkill</span>&nbsp;:<code class="type">char</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Kill line character (usually ctrl-U).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_veof">c_veof</span>&nbsp;:<code class="type">char</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">End-of-file character (usually ctrl-D).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_veol">c_veol</span>&nbsp;:<code class="type">char</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Alternate end-of-line char. (usually none).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_vmin">c_vmin</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Minimum number of characters to read
                                 before the read request is satisfied.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_vtime">c_vtime</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Maximum read wait (in 0.1s units).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_vstart">c_vstart</span>&nbsp;:<code class="type">char</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Start character (usually ctrl-Q).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTterminal_io.c_vstop">c_vstop</span>&nbsp;:<code class="type">char</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Stop character (usually ctrl-S).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>
}


<pre><span id="VALtcgetattr"><span class="keyword">val</span> tcgetattr</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; <a href="UnixLabels.html#TYPEterminal_io">terminal_io</a></code></pre><div class="info">
Return the status of the terminal referred to by the given
   file descriptor.<br>
</div>
<pre><span id="TYPEsetattr_when"><span class="keyword">type</span> <code class="type"></code>setattr_when</span> = <code class="type"><a href="Unix.html#TYPEsetattr_when">Unix.setattr_when</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsetattr_when.TCSANOW"><span class="constructor">TCSANOW</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsetattr_when.TCSADRAIN"><span class="constructor">TCSADRAIN</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsetattr_when.TCSAFLUSH"><span class="constructor">TCSAFLUSH</span></span></code></td>

</tr></tbody></table>


<pre><span id="VALtcsetattr"><span class="keyword">val</span> tcsetattr</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt;<br>       mode:<a href="UnixLabels.html#TYPEsetattr_when">setattr_when</a> -&gt; <a href="UnixLabels.html#TYPEterminal_io">terminal_io</a> -&gt; unit</code></pre><div class="info">
Set the status of the terminal referred to by the given
   file descriptor. The second argument indicates when the
   status change takes place: immediately (<code class="code"><span class="constructor">TCSANOW</span></code>),
   when all pending output has been transmitted (<code class="code"><span class="constructor">TCSADRAIN</span></code>),
   or after flushing all input that has been received but not
   read (<code class="code"><span class="constructor">TCSAFLUSH</span></code>). <code class="code"><span class="constructor">TCSADRAIN</span></code> is recommended when changing
   the output parameters; <code class="code"><span class="constructor">TCSAFLUSH</span></code>, when changing the input
   parameters.<br>
</div>
<pre><span id="VALtcsendbreak"><span class="keyword">val</span> tcsendbreak</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; duration:int -&gt; unit</code></pre><div class="info">
Send a break condition on the given file descriptor.
   The second argument is the duration of the break, in 0.1s units;
   0 means standard duration (0.25s).<br>
</div>
<pre><span id="VALtcdrain"><span class="keyword">val</span> tcdrain</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; unit</code></pre><div class="info">
Waits until all output written on the given file descriptor
   has been transmitted.<br>
</div>
<pre><span id="TYPEflush_queue"><span class="keyword">type</span> <code class="type"></code>flush_queue</span> = <code class="type"><a href="Unix.html#TYPEflush_queue">Unix.flush_queue</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTflush_queue.TCIFLUSH"><span class="constructor">TCIFLUSH</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTflush_queue.TCOFLUSH"><span class="constructor">TCOFLUSH</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTflush_queue.TCIOFLUSH"><span class="constructor">TCIOFLUSH</span></span></code></td>

</tr></tbody></table>


<pre><span id="VALtcflush"><span class="keyword">val</span> tcflush</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; mode:<a href="UnixLabels.html#TYPEflush_queue">flush_queue</a> -&gt; unit</code></pre><div class="info">
Discard data written on the given file descriptor but not yet
   transmitted, or data received but not yet read, depending on the
   second argument: <code class="code"><span class="constructor">TCIFLUSH</span></code> flushes data received but not read,
   <code class="code"><span class="constructor">TCOFLUSH</span></code> flushes data written but not transmitted, and
   <code class="code"><span class="constructor">TCIOFLUSH</span></code> flushes both.<br>
</div>
<pre><span id="TYPEflow_action"><span class="keyword">type</span> <code class="type"></code>flow_action</span> = <code class="type"><a href="Unix.html#TYPEflow_action">Unix.flow_action</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTflow_action.TCOOFF"><span class="constructor">TCOOFF</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTflow_action.TCOON"><span class="constructor">TCOON</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTflow_action.TCIOFF"><span class="constructor">TCIOFF</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTflow_action.TCION"><span class="constructor">TCION</span></span></code></td>

</tr></tbody></table>


<pre><span id="VALtcflow"><span class="keyword">val</span> tcflow</span> : <code class="type"><a href="UnixLabels.html#TYPEfile_descr">file_descr</a> -&gt; mode:<a href="UnixLabels.html#TYPEflow_action">flow_action</a> -&gt; unit</code></pre><div class="info">
Suspend or restart reception or transmission of data on
   the given file descriptor, depending on the second argument:
   <code class="code"><span class="constructor">TCOOFF</span></code> suspends output, <code class="code"><span class="constructor">TCOON</span></code> restarts output,
   <code class="code"><span class="constructor">TCIOFF</span></code> transmits a STOP character to suspend input,
   and <code class="code"><span class="constructor">TCION</span></code> transmits a START character to restart input.<br>
</div>
<pre><span id="VALsetsid"><span class="keyword">val</span> setsid</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
Put the calling process in a new session and detach it from
   its controlling terminal.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>