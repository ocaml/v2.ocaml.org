<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Unix.html">Unix</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;error&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">E2BIG</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EACCES</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EAGAIN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EBADF</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EBUSY</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ECHILD</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EDEADLK</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EDOM</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EEXIST</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EFAULT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EFBIG</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EINTR</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EINVAL</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EIO</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EISDIR</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EMFILE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EMLINK</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENAMETOOLONG</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENFILE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENODEV</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENOENT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENOEXEC</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENOLCK</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENOMEM</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENOSPC</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENOSYS</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENOTDIR</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENOTEMPTY</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENOTTY</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENXIO</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EPERM</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EPIPE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ERANGE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EROFS</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ESPIPE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ESRCH</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EXDEV</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EWOULDBLOCK</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EINPROGRESS</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EALREADY</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENOTSOCK</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EDESTADDRREQ</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EMSGSIZE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EPROTOTYPE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENOPROTOOPT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EPROTONOSUPPORT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ESOCKTNOSUPPORT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EOPNOTSUPP</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EPFNOSUPPORT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EAFNOSUPPORT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EADDRINUSE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EADDRNOTAVAIL</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENETDOWN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENETUNREACH</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENETRESET</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ECONNABORTED</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ECONNRESET</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENOBUFS</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EISCONN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ENOTCONN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ESHUTDOWN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ETOOMANYREFS</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ETIMEDOUT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ECONNREFUSED</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EHOSTDOWN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EHOSTUNREACH</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ELOOP</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EOVERFLOW</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EUNKNOWNERR</span>&nbsp;<span class="keyword">of</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Unix_error</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Unix</span>.error&nbsp;*&nbsp;string&nbsp;*&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;error_message&nbsp;:&nbsp;<span class="constructor">Unix</span>.error&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;handle_unix_error&nbsp;:&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;environment&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getenv&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;putenv&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;process_status&nbsp;=&nbsp;<span class="constructor">WEXITED</span>&nbsp;<span class="keyword">of</span>&nbsp;int&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">WSIGNALED</span>&nbsp;<span class="keyword">of</span>&nbsp;int&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">WSTOPPED</span>&nbsp;<span class="keyword">of</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;wait_flag&nbsp;=&nbsp;<span class="constructor">WNOHANG</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">WUNTRACED</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;execv&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;execve&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;execvp&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;execvpe&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fork&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;wait&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;*&nbsp;<span class="constructor">Unix</span>.process_status
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;waitpid&nbsp;:&nbsp;<span class="constructor">Unix</span>.wait_flag&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;*&nbsp;<span class="constructor">Unix</span>.process_status
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;system&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.process_status
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getpid&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getppid&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;nice&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;file_descr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stdin&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stdout&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stderr&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;open_flag&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">O_RDONLY</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">O_WRONLY</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">O_RDWR</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">O_NONBLOCK</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">O_APPEND</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">O_CREAT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">O_TRUNC</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">O_EXCL</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">O_NOCTTY</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">O_DSYNC</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">O_SYNC</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">O_RSYNC</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">O_SHARE_DELETE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">O_CLOEXEC</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;file_perm&nbsp;=&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;openfile&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.open_flag&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_perm&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_descr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;close&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;read&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;write&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;single_write&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;write_substring&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;single_write_substring&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;in_channel_of_descr&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.in_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;out_channel_of_descr&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.out_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;descr_of_in_channel&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_descr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;descr_of_out_channel&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_descr
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;seek_command&nbsp;=&nbsp;<span class="constructor">SEEK_SET</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SEEK_CUR</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SEEK_END</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lseek&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.seek_command&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;truncate&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ftruncate&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;file_kind&nbsp;=&nbsp;<span class="constructor">S_REG</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">S_DIR</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">S_CHR</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">S_BLK</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">S_LNK</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">S_FIFO</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">S_SOCK</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;stats&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;st_dev&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;st_ino&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;st_kind&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_kind;
&nbsp;&nbsp;&nbsp;&nbsp;st_perm&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_perm;
&nbsp;&nbsp;&nbsp;&nbsp;st_nlink&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;st_uid&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;st_gid&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;st_rdev&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;st_size&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;st_atime&nbsp;:&nbsp;float;
&nbsp;&nbsp;&nbsp;&nbsp;st_mtime&nbsp;:&nbsp;float;
&nbsp;&nbsp;&nbsp;&nbsp;st_ctime&nbsp;:&nbsp;float;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stat&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.stats
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lstat&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.stats
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fstat&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.stats
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;isatty&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">LargeFile</span>&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lseek&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.seek_command&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;truncate&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ftruncate&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;stats&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st_dev&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st_ino&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st_kind&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_kind;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st_perm&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_perm;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st_nlink&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st_uid&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st_gid&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st_rdev&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st_size&nbsp;:&nbsp;int64;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st_atime&nbsp;:&nbsp;float;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st_mtime&nbsp;:&nbsp;float;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st_ctime&nbsp;:&nbsp;float;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;stat&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.<span class="constructor">LargeFile</span>.stats
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lstat&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.<span class="constructor">LargeFile</span>.stats
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fstat&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.<span class="constructor">LargeFile</span>.stats
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;unlink&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rename&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;link&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;access_permission&nbsp;=&nbsp;<span class="constructor">R_OK</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">W_OK</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">X_OK</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">F_OK</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;chmod&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_perm&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fchmod&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_perm&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;chown&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fchown&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;umask&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;access&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.access_permission&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dup&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_descr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dup2&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_nonblock&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;clear_nonblock&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_close_on_exec&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;clear_close_on_exec&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mkdir&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_perm&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rmdir&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;chdir&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getcwd&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;chroot&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;dir_handle
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;opendir&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.dir_handle
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;readdir&nbsp;:&nbsp;<span class="constructor">Unix</span>.dir_handle&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rewinddir&nbsp;:&nbsp;<span class="constructor">Unix</span>.dir_handle&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;closedir&nbsp;:&nbsp;<span class="constructor">Unix</span>.dir_handle&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pipe&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;*&nbsp;<span class="constructor">Unix</span>.file_descr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mkfifo&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_perm&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;create_process&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;create_process_env&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_process_in&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.in_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_process_out&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.out_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_process&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;*&nbsp;<span class="constructor">Pervasives</span>.out_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_process_full&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;*&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;*&nbsp;<span class="constructor">Pervasives</span>.in_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;close_process_in&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.process_status
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;close_process_out&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.process_status
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;close_process&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;*&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.process_status
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;close_process_full&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;*&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;*&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.process_status
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symlink&nbsp;:&nbsp;?to_dir:bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;has_symlink&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;readlink&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;select&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;list&nbsp;*&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;list&nbsp;*&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;list
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;lock_command&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">F_ULOCK</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">F_LOCK</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">F_TLOCK</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">F_TEST</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">F_RLOCK</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">F_TRLOCK</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lockf&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.lock_command&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;kill&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;sigprocmask_command&nbsp;=&nbsp;<span class="constructor">SIG_SETMASK</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SIG_BLOCK</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SIG_UNBLOCK</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigprocmask&nbsp;:&nbsp;<span class="constructor">Unix</span>.sigprocmask_command&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;list
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigpending&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;list
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigsuspend&nbsp;:&nbsp;int&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pause&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;process_times&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;tms_utime&nbsp;:&nbsp;float;
&nbsp;&nbsp;&nbsp;&nbsp;tms_stime&nbsp;:&nbsp;float;
&nbsp;&nbsp;&nbsp;&nbsp;tms_cutime&nbsp;:&nbsp;float;
&nbsp;&nbsp;&nbsp;&nbsp;tms_cstime&nbsp;:&nbsp;float;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;tm&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;tm_sec&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;tm_min&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;tm_hour&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;tm_mday&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;tm_mon&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;tm_year&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;tm_wday&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;tm_yday&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;tm_isdst&nbsp;:&nbsp;bool;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;time&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;gettimeofday&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;gmtime&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.tm
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;localtime&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.tm
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mktime&nbsp;:&nbsp;<span class="constructor">Unix</span>.tm&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;*&nbsp;<span class="constructor">Unix</span>.tm
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;alarm&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sleep&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sleepf&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;times&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.process_times
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;utimes&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;interval_timer&nbsp;=&nbsp;<span class="constructor">ITIMER_REAL</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ITIMER_VIRTUAL</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ITIMER_PROF</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;interval_timer_status&nbsp;=&nbsp;{&nbsp;it_interval&nbsp;:&nbsp;float;&nbsp;it_value&nbsp;:&nbsp;float;&nbsp;}
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getitimer&nbsp;:&nbsp;<span class="constructor">Unix</span>.interval_timer&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.interval_timer_status
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;setitimer&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.interval_timer&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.interval_timer_status&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.interval_timer_status
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getuid&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;geteuid&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;setuid&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getgid&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getegid&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;setgid&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getgroups&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;array
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;setgroups&nbsp;:&nbsp;int&nbsp;array&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;initgroups&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;passwd_entry&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;pw_name&nbsp;:&nbsp;string;
&nbsp;&nbsp;&nbsp;&nbsp;pw_passwd&nbsp;:&nbsp;string;
&nbsp;&nbsp;&nbsp;&nbsp;pw_uid&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;pw_gid&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;pw_gecos&nbsp;:&nbsp;string;
&nbsp;&nbsp;&nbsp;&nbsp;pw_dir&nbsp;:&nbsp;string;
&nbsp;&nbsp;&nbsp;&nbsp;pw_shell&nbsp;:&nbsp;string;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;group_entry&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;gr_name&nbsp;:&nbsp;string;
&nbsp;&nbsp;&nbsp;&nbsp;gr_passwd&nbsp;:&nbsp;string;
&nbsp;&nbsp;&nbsp;&nbsp;gr_gid&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;gr_mem&nbsp;:&nbsp;string&nbsp;array;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getlogin&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getpwnam&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.passwd_entry
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getgrnam&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.group_entry
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getpwuid&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.passwd_entry
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getgrgid&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.group_entry
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;inet_addr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inet_addr_of_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.inet_addr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;string_of_inet_addr&nbsp;:&nbsp;<span class="constructor">Unix</span>.inet_addr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inet_addr_any&nbsp;:&nbsp;<span class="constructor">Unix</span>.inet_addr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inet_addr_loopback&nbsp;:&nbsp;<span class="constructor">Unix</span>.inet_addr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inet6_addr_any&nbsp;:&nbsp;<span class="constructor">Unix</span>.inet_addr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inet6_addr_loopback&nbsp;:&nbsp;<span class="constructor">Unix</span>.inet_addr
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;socket_domain&nbsp;=&nbsp;<span class="constructor">PF_UNIX</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">PF_INET</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">PF_INET6</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;socket_type&nbsp;=&nbsp;<span class="constructor">SOCK_STREAM</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SOCK_DGRAM</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SOCK_RAW</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SOCK_SEQPACKET</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;sockaddr&nbsp;=&nbsp;<span class="constructor">ADDR_UNIX</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ADDR_INET</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Unix</span>.inet_addr&nbsp;*&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;socket&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.socket_domain&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.socket_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_descr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;domain_of_sockaddr&nbsp;:&nbsp;<span class="constructor">Unix</span>.sockaddr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.socket_domain
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;socketpair&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.socket_domain&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.socket_type&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;*&nbsp;<span class="constructor">Unix</span>.file_descr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;accept&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;*&nbsp;<span class="constructor">Unix</span>.sockaddr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;bind&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.sockaddr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;connect&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.sockaddr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;listen&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;shutdown_command&nbsp;=&nbsp;<span class="constructor">SHUTDOWN_RECEIVE</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SHUTDOWN_SEND</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SHUTDOWN_ALL</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;shutdown&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.shutdown_command&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getsockname&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.sockaddr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getpeername&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.sockaddr
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;msg_flag&nbsp;=&nbsp;<span class="constructor">MSG_OOB</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">MSG_DONTROUTE</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">MSG_PEEK</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;recv&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.msg_flag&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;recvfrom&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.msg_flag&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;*&nbsp;<span class="constructor">Unix</span>.sockaddr
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;send&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.msg_flag&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;send_substring&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.msg_flag&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sendto&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.msg_flag&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.sockaddr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sendto_substring&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.msg_flag&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.sockaddr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;socket_bool_option&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">SO_DEBUG</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SO_BROADCAST</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SO_REUSEADDR</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SO_KEEPALIVE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SO_DONTROUTE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SO_OOBINLINE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SO_ACCEPTCONN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">TCP_NODELAY</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">IPV6_ONLY</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;socket_int_option&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">SO_SNDBUF</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SO_RCVBUF</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SO_ERROR</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SO_TYPE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SO_RCVLOWAT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SO_SNDLOWAT</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;socket_optint_option&nbsp;=&nbsp;<span class="constructor">SO_LINGER</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;socket_float_option&nbsp;=&nbsp;<span class="constructor">SO_RCVTIMEO</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SO_SNDTIMEO</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getsockopt&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.socket_bool_option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;setsockopt&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.socket_bool_option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getsockopt_int&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.socket_int_option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;setsockopt_int&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.socket_int_option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getsockopt_optint&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.socket_optint_option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;option
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;setsockopt_optint&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.socket_optint_option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getsockopt_float&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.socket_float_option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;setsockopt_float&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.socket_float_option&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getsockopt_error&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.error&nbsp;option
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;open_connection&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.sockaddr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;*&nbsp;<span class="constructor">Pervasives</span>.out_channel
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;shutdown_connection&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;establish_server&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.sockaddr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;host_entry&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;h_name&nbsp;:&nbsp;string;
&nbsp;&nbsp;&nbsp;&nbsp;h_aliases&nbsp;:&nbsp;string&nbsp;array;
&nbsp;&nbsp;&nbsp;&nbsp;h_addrtype&nbsp;:&nbsp;<span class="constructor">Unix</span>.socket_domain;
&nbsp;&nbsp;&nbsp;&nbsp;h_addr_list&nbsp;:&nbsp;<span class="constructor">Unix</span>.inet_addr&nbsp;array;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;protocol_entry&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;p_name&nbsp;:&nbsp;string;
&nbsp;&nbsp;&nbsp;&nbsp;p_aliases&nbsp;:&nbsp;string&nbsp;array;
&nbsp;&nbsp;&nbsp;&nbsp;p_proto&nbsp;:&nbsp;int;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;service_entry&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;s_name&nbsp;:&nbsp;string;
&nbsp;&nbsp;&nbsp;&nbsp;s_aliases&nbsp;:&nbsp;string&nbsp;array;
&nbsp;&nbsp;&nbsp;&nbsp;s_port&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;s_proto&nbsp;:&nbsp;string;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;gethostname&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;gethostbyname&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.host_entry
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;gethostbyaddr&nbsp;:&nbsp;<span class="constructor">Unix</span>.inet_addr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.host_entry
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getprotobyname&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.protocol_entry
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getprotobynumber&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.protocol_entry
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getservbyname&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.service_entry
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getservbyport&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.service_entry
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;addr_info&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;ai_family&nbsp;:&nbsp;<span class="constructor">Unix</span>.socket_domain;
&nbsp;&nbsp;&nbsp;&nbsp;ai_socktype&nbsp;:&nbsp;<span class="constructor">Unix</span>.socket_type;
&nbsp;&nbsp;&nbsp;&nbsp;ai_protocol&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;ai_addr&nbsp;:&nbsp;<span class="constructor">Unix</span>.sockaddr;
&nbsp;&nbsp;&nbsp;&nbsp;ai_canonname&nbsp;:&nbsp;string;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;getaddrinfo_option&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">AI_FAMILY</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Unix</span>.socket_domain
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AI_SOCKTYPE</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Unix</span>.socket_type
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AI_PROTOCOL</span>&nbsp;<span class="keyword">of</span>&nbsp;int
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AI_NUMERICHOST</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AI_CANONNAME</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AI_PASSIVE</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getaddrinfo&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.getaddrinfo_option&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.addr_info&nbsp;list
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;name_info&nbsp;=&nbsp;{&nbsp;ni_hostname&nbsp;:&nbsp;string;&nbsp;ni_service&nbsp;:&nbsp;string;&nbsp;}
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;getnameinfo_option&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">NI_NOFQDN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">NI_NUMERICHOST</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">NI_NAMEREQD</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">NI_NUMERICSERV</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">NI_DGRAM</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;getnameinfo&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.sockaddr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.getnameinfo_option&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.name_info
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;terminal_io&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_ignbrk&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_brkint&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_ignpar&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_parmrk&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_inpck&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_istrip&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_inlcr&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_igncr&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_icrnl&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_ixon&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_ixoff&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_opost&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_obaud&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_ibaud&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_csize&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_cstopb&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_cread&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_parenb&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_parodd&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_hupcl&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_clocal&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_isig&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_icanon&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_noflsh&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_echo&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_echoe&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_echok&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_echonl&nbsp;:&nbsp;bool;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_vintr&nbsp;:&nbsp;char;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_vquit&nbsp;:&nbsp;char;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_verase&nbsp;:&nbsp;char;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_vkill&nbsp;:&nbsp;char;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_veof&nbsp;:&nbsp;char;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_veol&nbsp;:&nbsp;char;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_vmin&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_vtime&nbsp;:&nbsp;int;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_vstart&nbsp;:&nbsp;char;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;c_vstop&nbsp;:&nbsp;char;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;tcgetattr&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.terminal_io
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;setattr_when&nbsp;=&nbsp;<span class="constructor">TCSANOW</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">TCSADRAIN</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">TCSAFLUSH</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;tcsetattr&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.setattr_when&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.terminal_io&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;tcsendbreak&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;tcdrain&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;flush_queue&nbsp;=&nbsp;<span class="constructor">TCIFLUSH</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">TCOFLUSH</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">TCIOFLUSH</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;tcflush&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.flush_queue&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;flow_action&nbsp;=&nbsp;<span class="constructor">TCOOFF</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">TCOON</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">TCIOFF</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">TCION</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;tcflow&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Unix</span>.flow_action&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;setsid&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>