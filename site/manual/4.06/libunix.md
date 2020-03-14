<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="core.html">The core library</a></li><li><a href="stdlib.html">The standard library</a></li><li><a href="parsing.html">The compiler front-end</a></li><li class="active"><a href="libunix.html">The unix library: Unix system calls</a></li><li><a href="libnum.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="libstr.html">The str library: regular expressions and string processing</a></li><li><a href="libthreads.html">The threads library</a></li><li><a href="libgraph.html">The graphics library</a></li><li><a href="libdynlink.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="libbigarray.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.06</a></div><div class="toc_title"><a href="#">The unix library: Unix system calls</a></div></nav></header>




<h1 class="chapter" id="sec554"><span>Chapter 28</span>&nbsp;&nbsp;The unix library: Unix system calls</h1>
<p>The <span class="c003">unix</span> library makes many Unix
system calls and system-related library functions available to
OCaml programs. This chapter describes briefly the functions
provided. Refer to sections 2&nbsp;and&nbsp;3 of the Unix manual for more
details on the behavior of these functions.</p><p>Not all functions are provided by all Unix variants. If some functions
are not available, they will raise <span class="c003">Invalid_arg</span> when called.</p><p>Programs that use the <span class="c003">unix</span> library must be linked as follows:
</p><pre>        ocamlc <span class="c009">other options</span> unix.cma <span class="c009">other files</span>
        ocamlopt <span class="c009">other options</span> unix.cmxa <span class="c009">other files</span>
</pre><p>
For interactive use of the <span class="c003">unix</span> library, do:
</p><pre>        ocamlmktop -o mytop unix.cma
        ./mytop
</pre><p>
or (if dynamic linking of C libraries is supported on your platform),
start <span class="c003">ocaml</span> and type <span class="c003">#load "unix.cma";;</span>.</p><blockquote class="quote"><span class="c007">Windows:</span>&nbsp;&nbsp;
A fairly complete emulation of the Unix system calls is provided in
the Windows version of OCaml. The end of this chapter gives
more information on the functions that are not supported under Windows.
</blockquote><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.06/Unix.html">Module <span class="c003">Unix</span>: Unix system calls</a>
</li><li class="li-links"><a href="../../api/4.06/UnixLabels.html">Module <span class="c003">UnixLabels</span>: Labeled
Unix system calls</a>
</li></ul><blockquote class="quote"><span class="c007">Windows:</span>&nbsp;&nbsp;
The Cygwin port of OCaml fully implements all functions from
the Unix module. The native Win32 ports implement a subset of them.
Below is a list of the functions that are not implemented, or only
partially implemented, by the Win32 ports. Functions not mentioned are
fully implemented and behave as described previously in this chapter.<div class="center"><table class="c000 cellpadding1" border="1"><tbody><tr><td class="c014"><span class="c013">Functions</span></td><td class="c014"><span class="c013">Comment</span> </td></tr>
<tr><td class="c022">
<span class="c003">fork</span></td><td class="c021">not implemented, use <span class="c003">create_process</span> or threads </td></tr>
<tr><td class="c022"><span class="c003">wait</span></td><td class="c021">not implemented, use <span class="c003">waitpid</span> </td></tr>
<tr><td class="c022"><span class="c003">waitpid</span></td><td class="c021">can only wait for a given PID, not any child process </td></tr>
<tr><td class="c022"><span class="c003">getppid</span></td><td class="c021">not implemented (meaningless under Windows) </td></tr>
<tr><td class="c022"><span class="c003">nice</span></td><td class="c021">not implemented </td></tr>
<tr><td class="c022"><span class="c003">truncate</span>, <span class="c003">ftruncate</span></td><td class="c021">not implemented </td></tr>
<tr><td class="c022"><span class="c003">link</span></td><td class="c021">implemented (since 3.02) </td></tr>
<tr><td class="c022"><span class="c003">symlink</span>, <span class="c003">readlink</span></td><td class="c021">implemented (since 4.03.0) </td></tr>
<tr><td class="c022"><span class="c003">access</span></td><td class="c021">execute permission <span class="c003">X_OK</span> cannot be tested,
it just tests for read permission instead </td></tr>
<tr><td class="c022"><span class="c003">fchmod</span></td><td class="c021">not implemented </td></tr>
<tr><td class="c022"><span class="c003">chown</span>, <span class="c003">fchown</span></td><td class="c021">not implemented (make no sense on a DOS
file system) </td></tr>
<tr><td class="c022"><span class="c003">umask</span></td><td class="c021">not implemented </td></tr>
<tr><td class="c022"><span class="c003">mkfifo</span></td><td class="c021">not implemented </td></tr>
<tr><td class="c022"><span class="c003">kill</span></td><td class="c021">partially implemented (since 4.00.0): only the <span class="c003">sigkill</span> signal
is implemented </td></tr>
<tr><td class="c022"><span class="c003">pause</span></td><td class="c021">not implemented (no inter-process signals in Windows) </td></tr>
<tr><td class="c022"><span class="c003">alarm</span></td><td class="c021">not implemented </td></tr>
<tr><td class="c022"><span class="c003">times</span></td><td class="c021">partially implemented, will not report timings for child
processes </td></tr>
<tr><td class="c022"><span class="c003">getitimer</span>, <span class="c003">setitimer</span></td><td class="c021">not implemented </td></tr>
<tr><td class="c022"><span class="c003">getuid</span>, <span class="c003">geteuid</span>, <span class="c003">getgid</span>, <span class="c003">getegid</span></td><td class="c021">always return 1 </td></tr>
<tr><td class="c022"><span class="c003">getgroups</span></td><td class="c021">always returns <span class="c003">[|1|]</span> (since 2.00) </td></tr>
<tr><td class="c022"><span class="c003">setuid</span>, <span class="c003">setgid</span>, <span class="c003">setgroups</span></td><td class="c021">not implemented </td></tr>
<tr><td class="c022"><span class="c003">getpwnam</span>, <span class="c003">getpwuid</span></td><td class="c021">always raise <span class="c003">Not_found</span> </td></tr>
<tr><td class="c022"><span class="c003">getgrnam</span>, <span class="c003">getgrgid</span></td><td class="c021">always raise <span class="c003">Not_found</span> </td></tr>
<tr><td class="c022">type <span class="c003">socket_domain</span></td><td class="c021"><span class="c003">PF_INET</span> is fully supported;
<span class="c003">PF_INET6</span> is fully supported (since 4.01.0); <span class="c003">PF_UNIX</span> is not supported  </td></tr>
<tr><td class="c022"><span class="c003">establish_server</span></td><td class="c021">not implemented; use threads </td></tr>
<tr><td class="c022">terminal functions (<span class="c003">tc*</span>)</td><td class="c021">not implemented </td></tr>
</tbody></table></div></blockquote>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>