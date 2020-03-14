<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual034.html">The core library</a></li><li><a href="manual035.html">The standard library</a></li><li class="active"><a href="manual036.html">The unix library: Unix system calls</a></li><li><a href="manual037.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="manual038.html">The str library: regular expressions and string processing</a></li><li><a href="manual039.html">The threads library</a></li><li><a href="manual040.html">The graphics library</a></li><li><a href="manual041.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="manual042.html">The LablTk library: Tcl/Tk GUI interface</a></li><li><a href="manual043.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The unix library: Unix system calls</a></div></nav></header>




<h1 class="chapter"><a name="htoc300"><span>Chapter 22</span></a>&nbsp;&nbsp;The unix library: Unix system calls</h1><p>The <tt>unix</tt> library makes many Unix
system calls and system-related library functions available to
OCaml programs. This chapter describes briefly the functions
provided. Refer to sections 2&nbsp;and&nbsp;3 of the Unix manual for more
details on the behavior of these functions.</p><p>Not all functions are provided by all Unix variants. If some functions
are not available, they will raise <tt>Invalid_arg</tt> when called.</p><p>Programs that use the <tt>unix</tt> library must be linked as follows:
</p><pre>        ocamlc <i>other options</i> unix.cma <i>other files</i>
        ocamlopt <i>other options</i> unix.cmxa <i>other files</i>
</pre><p>
For interactive use of the <tt>unix</tt> library, do:
</p><pre>        ocamlmktop -o mytop unix.cma
        ./mytop
</pre><p>
or (if dynamic linking of C libraries is supported on your platform),
start <tt>ocaml</tt> and type <tt>#load "unix.cma";;</tt>.</p><blockquote class="quote"><font color="purple">Windows:</font>&nbsp;&nbsp;
A fairly complete emulation of the Unix system calls is provided in
the Windows version of OCaml. The end of this chapter gives
more information on the functions that are not supported under Windows.
</blockquote><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.00/Unix.html">Module <tt>Unix</tt>: Unix system calls</a>
</li><li class="li-links"><a href="../../api/4.00/UnixLabels.html">Module <tt>UnixLabels</tt>: Labeled
Unix system calls</a>
</li></ul><blockquote class="quote"><font color="purple">Windows:</font>&nbsp;&nbsp;
The Cygwin port of OCaml fully implements all functions from
the Unix module. The native Win32 ports implement a subset of them.
Below is a list of the functions that are not implemented, or only
partially implemented, by the Win32 ports. Functions not mentioned are
fully implemented and behave as described previously in this chapter.<div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Functions</b></td><td align="center" nowrap=""><b>Comment</b></td></tr>
<tr><td valign="top" align="left" nowrap="">
<tt>fork</tt></td><td valign="top" align="left">not implemented, use <tt>create_process</tt> or threads</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>wait</tt></td><td valign="top" align="left">not implemented, use <tt>waitpid</tt></td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>waitpid</tt></td><td valign="top" align="left">can only wait for a given PID, not any child process</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>getppid</tt></td><td valign="top" align="left">not implemented (meaningless under Windows)</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>nice</tt></td><td valign="top" align="left">not implemented</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>truncate</tt>, <tt>ftruncate</tt></td><td valign="top" align="left">not implemented</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>link</tt>, <tt>symlink</tt>, <tt>readlink</tt></td><td valign="top" align="left">not implemented (no links under
Windows)</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>access</tt></td><td valign="top" align="left">execute permission <tt>X_OK</tt> cannot be tested,
it just tests for read permission instead</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>fchmod</tt></td><td valign="top" align="left">not implemented</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>chown</tt>, <tt>fchown</tt></td><td valign="top" align="left">not implemented (make no sense on a DOS
file system)</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>umask</tt></td><td valign="top" align="left">not implemented</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>mkfifo</tt></td><td valign="top" align="left">not implemented</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>kill</tt>, <tt>pause</tt></td><td valign="top" align="left">not implemented (no inter-process signals in Windows)</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>alarm</tt></td><td valign="top" align="left">not implemented</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>times</tt></td><td valign="top" align="left">partially implemented, will not report timings for child
processes</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>getitimer</tt>, <tt>setitimer</tt></td><td valign="top" align="left">not implemented</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>getuid</tt>, <tt>getgid</tt></td><td valign="top" align="left">always return 1</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>getgid</tt>, <tt>getegid</tt>, <tt>getgroups</tt></td><td valign="top" align="left">not implemented</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>setuid</tt>, <tt>setgid</tt></td><td valign="top" align="left">not implemented</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>getpwnam</tt>, <tt>getpwuid</tt></td><td valign="top" align="left">always raise <tt>Not_found</tt></td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>getgrnam</tt>, <tt>getgrgid</tt></td><td valign="top" align="left">always raise <tt>Not_found</tt></td></tr>
<tr><td valign="top" align="left" nowrap="">type <tt>socket_domain</tt></td><td valign="top" align="left">the domains <tt>PF_UNIX</tt> and <tt>PF_INET6</tt>
are not supported; <tt>PF_INET</tt> is fully supported</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>establish_server</tt></td><td valign="top" align="left">not implemented; use threads</td></tr>
<tr><td valign="top" align="left" nowrap="">terminal functions (<tt>tc*</tt>)</td><td valign="top" align="left">not implemented</td></tr>
</tbody></table></div></blockquote><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>