<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Sys</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Sys.html">Sys</a></h1>

<pre><span class="keyword">module</span> Sys: <code class="code"><span class="keyword">sig</span></code> <a href="Sys.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
System interface.
<p>

  Every function in this module raises <code class="code"><span class="constructor">Sys_error</span></code> with an
  informative message when the underlying system call signal
  an error.<br>
</p></div>
<hr width="100%">

<pre><span id="VALargv"><span class="keyword">val</span> argv</span> : <code class="type">string array</code></pre><div class="info ">
The command line arguments given to the process.
   The first element is the command name used to invoke the program.
   The following elements are the command-line arguments
   given to the program.<br>
</div>

<pre><span id="VALexecutable_name"><span class="keyword">val</span> executable_name</span> : <code class="type">string</code></pre><div class="info ">
The name of the file containing the executable currently running.<br>
</div>

<pre><span id="VALfile_exists"><span class="keyword">val</span> file_exists</span> : <code class="type">string -&gt; bool</code></pre><div class="info ">
Test if a file with the given name exists.<br>
</div>

<pre><span id="VALis_directory"><span class="keyword">val</span> is_directory</span> : <code class="type">string -&gt; bool</code></pre><div class="info ">
Returns <code class="code"><span class="keyword">true</span></code> if the given name refers to a directory,
    <code class="code"><span class="keyword">false</span></code> if it refers to another kind of file.
    Raise <code class="code"><span class="constructor">Sys_error</span></code> if no file exists with the given name.<br>
<b>Since</b> 3.10.0<br>
</div>

<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type">string -&gt; unit</code></pre><div class="info ">
Remove the given file name from the file system.<br>
</div>

<pre><span id="VALrename"><span class="keyword">val</span> rename</span> : <code class="type">string -&gt; string -&gt; unit</code></pre><div class="info ">
Rename a file. The first argument is the old name and the
   second is the new name. If there is already another file
   under the new name, <code class="code">rename</code> may replace it, or raise an
   exception, depending on your operating system.<br>
</div>

<pre><span id="VALgetenv"><span class="keyword">val</span> getenv</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
Return the value associated to a variable in the process
   environment. Raise <code class="code"><span class="constructor">Not_found</span></code> if the variable is unbound.<br>
</div>

<pre><span id="VALcommand"><span class="keyword">val</span> command</span> : <code class="type">string -&gt; int</code></pre><div class="info ">
Execute the given shell command and return its exit code.<br>
</div>

<pre><span id="VALtime"><span class="keyword">val</span> time</span> : <code class="type">unit -&gt; float</code></pre><div class="info ">
Return the processor time, in seconds, used by the program
   since the beginning of execution.<br>
</div>

<pre><span id="VALchdir"><span class="keyword">val</span> chdir</span> : <code class="type">string -&gt; unit</code></pre><div class="info ">
Change the current working directory of the process.<br>
</div>

<pre><span id="VALgetcwd"><span class="keyword">val</span> getcwd</span> : <code class="type">unit -&gt; string</code></pre><div class="info ">
Return the current working directory of the process.<br>
</div>

<pre><span id="VALreaddir"><span class="keyword">val</span> readdir</span> : <code class="type">string -&gt; string array</code></pre><div class="info ">
Return the names of all files present in the given directory.
   Names denoting the current directory and the parent directory
   (<code class="code"><span class="string">"."</span></code> and <code class="code"><span class="string">".."</span></code> in Unix) are not returned.  Each string in the
   result is a file name rather than a complete path.  There is no
   guarantee that the name strings in the resulting array will appear
   in any specific order; they are not, in particular, guaranteed to
   appear in alphabetical order.<br>
</div>

<pre><span id="VALinteractive"><span class="keyword">val</span> interactive</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre><div class="info ">
This reference is initially set to <code class="code"><span class="keyword">false</span></code> in standalone
   programs and to <code class="code"><span class="keyword">true</span></code> if the code is being executed under
   the interactive toplevel system <code class="code">ocaml</code>.<br>
</div>

<pre><span id="VALos_type"><span class="keyword">val</span> os_type</span> : <code class="type">string</code></pre><div class="info ">
Operating system currently executing the OCaml program. One of<ul>
<li> <code class="code"><span class="string">"Unix"</span></code> (for all Unix versions, including Linux and Mac OS X),</li>
<li> <code class="code"><span class="string">"Win32"</span></code> (for MS-Windows, OCaml compiled with MSVC++ or Mingw),</li>
<li> <code class="code"><span class="string">"Cygwin"</span></code> (for MS-Windows, OCaml compiled with Cygwin).</li>
</ul>
<br>
</div>

<pre><span id="VALunix"><span class="keyword">val</span> unix</span> : <code class="type">bool</code></pre><div class="info ">
True if <code class="code"><span class="constructor">Sys</span>.os_type = <span class="string">"Unix"</span></code>.<br>
<b>Since</b> 4.01.0<br>
</div>

<pre><span id="VALwin32"><span class="keyword">val</span> win32</span> : <code class="type">bool</code></pre><div class="info ">
True if <code class="code"><span class="constructor">Sys</span>.os_type = <span class="string">"Win32"</span></code>.<br>
<b>Since</b> 4.01.0<br>
</div>

<pre><span id="VALcygwin"><span class="keyword">val</span> cygwin</span> : <code class="type">bool</code></pre><div class="info ">
True if <code class="code"><span class="constructor">Sys</span>.os_type = <span class="string">"Cygwin"</span></code>.<br>
<b>Since</b> 4.01.0<br>
</div>

<pre><span id="VALword_size"><span class="keyword">val</span> word_size</span> : <code class="type">int</code></pre><div class="info ">
Size of one word on the machine currently executing the OCaml
   program, in bits: 32 or 64.<br>
</div>

<pre><span id="VALbig_endian"><span class="keyword">val</span> big_endian</span> : <code class="type">bool</code></pre><div class="info ">
Whether the machine currently executing the Caml program is big-endian.<br>
<b>Since</b> 4.00.0<br>
</div>

<pre><span id="VALmax_string_length"><span class="keyword">val</span> max_string_length</span> : <code class="type">int</code></pre><div class="info ">
Maximum length of strings and byte sequences.<br>
</div>

<pre><span id="VALmax_array_length"><span class="keyword">val</span> max_array_length</span> : <code class="type">int</code></pre><div class="info ">
Maximum length of a normal array.  The maximum length of a float
    array is <code class="code">max_array_length/2</code> on 32-bit machines and
    <code class="code">max_array_length</code> on 64-bit machines.<br>
</div>
<br>
<h6 id="6_Signalhandling">Signal handling</h6><br>

<pre><code><span id="TYPEsignal_behavior"><span class="keyword">type</span> <code class="type"></code>signal_behavior</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsignal_behavior.Signal_default"><span class="constructor">Signal_default</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsignal_behavior.Signal_ignore"><span class="constructor">Signal_ignore</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsignal_behavior.Signal_handle"><span class="constructor">Signal_handle</span></span> <span class="keyword">of</span> <code class="type">(int -&gt; unit)</code></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info ">
What to do when receiving a signal:<ul>
<li><code class="code"><span class="constructor">Signal_default</span></code>: take the default behavior
     (usually: abort the program)</li>
<li><code class="code"><span class="constructor">Signal_ignore</span></code>: ignore the signal</li>
<li><code class="code"><span class="constructor">Signal_handle</span> f</code>: call function <code class="code">f</code>, giving it the signal
   number as argument.</li>
</ul>
<br>
</div>


<pre><span id="VALsignal"><span class="keyword">val</span> signal</span> : <code class="type">int -&gt; <a href="Sys.html#TYPEsignal_behavior">signal_behavior</a> -&gt; <a href="Sys.html#TYPEsignal_behavior">signal_behavior</a></code></pre><div class="info ">
Set the behavior of the system on receipt of a given signal.  The
   first argument is the signal number.  Return the behavior
   previously associated with the signal. If the signal number is
   invalid (or not available on your system), an <code class="code"><span class="constructor">Invalid_argument</span></code>
   exception is raised.<br>
</div>

<pre><span id="VALset_signal"><span class="keyword">val</span> set_signal</span> : <code class="type">int -&gt; <a href="Sys.html#TYPEsignal_behavior">signal_behavior</a> -&gt; unit</code></pre><div class="info ">
Same as <a href="Sys.html#VALsignal"><code class="code"><span class="constructor">Sys</span>.signal</code></a> but return value is ignored.<br>
</div>
<br>
<div class="h7" id="7_SignalnumbersforthestandardPOSIXsignals">Signal numbers for the standard POSIX signals.</div><br>

<pre><span id="VALsigabrt"><span class="keyword">val</span> sigabrt</span> : <code class="type">int</code></pre><div class="info ">
Abnormal termination<br>
</div>

<pre><span id="VALsigalrm"><span class="keyword">val</span> sigalrm</span> : <code class="type">int</code></pre><div class="info ">
Timeout<br>
</div>

<pre><span id="VALsigfpe"><span class="keyword">val</span> sigfpe</span> : <code class="type">int</code></pre><div class="info ">
Arithmetic exception<br>
</div>

<pre><span id="VALsighup"><span class="keyword">val</span> sighup</span> : <code class="type">int</code></pre><div class="info ">
Hangup on controlling terminal<br>
</div>

<pre><span id="VALsigill"><span class="keyword">val</span> sigill</span> : <code class="type">int</code></pre><div class="info ">
Invalid hardware instruction<br>
</div>

<pre><span id="VALsigint"><span class="keyword">val</span> sigint</span> : <code class="type">int</code></pre><div class="info ">
Interactive interrupt (ctrl-C)<br>
</div>

<pre><span id="VALsigkill"><span class="keyword">val</span> sigkill</span> : <code class="type">int</code></pre><div class="info ">
Termination (cannot be ignored)<br>
</div>

<pre><span id="VALsigpipe"><span class="keyword">val</span> sigpipe</span> : <code class="type">int</code></pre><div class="info ">
Broken pipe<br>
</div>

<pre><span id="VALsigquit"><span class="keyword">val</span> sigquit</span> : <code class="type">int</code></pre><div class="info ">
Interactive termination<br>
</div>

<pre><span id="VALsigsegv"><span class="keyword">val</span> sigsegv</span> : <code class="type">int</code></pre><div class="info ">
Invalid memory reference<br>
</div>

<pre><span id="VALsigterm"><span class="keyword">val</span> sigterm</span> : <code class="type">int</code></pre><div class="info ">
Termination<br>
</div>

<pre><span id="VALsigusr1"><span class="keyword">val</span> sigusr1</span> : <code class="type">int</code></pre><div class="info ">
Application-defined signal 1<br>
</div>

<pre><span id="VALsigusr2"><span class="keyword">val</span> sigusr2</span> : <code class="type">int</code></pre><div class="info ">
Application-defined signal 2<br>
</div>

<pre><span id="VALsigchld"><span class="keyword">val</span> sigchld</span> : <code class="type">int</code></pre><div class="info ">
Child process terminated<br>
</div>

<pre><span id="VALsigcont"><span class="keyword">val</span> sigcont</span> : <code class="type">int</code></pre><div class="info ">
Continue<br>
</div>

<pre><span id="VALsigstop"><span class="keyword">val</span> sigstop</span> : <code class="type">int</code></pre><div class="info ">
Stop<br>
</div>

<pre><span id="VALsigtstp"><span class="keyword">val</span> sigtstp</span> : <code class="type">int</code></pre><div class="info ">
Interactive stop<br>
</div>

<pre><span id="VALsigttin"><span class="keyword">val</span> sigttin</span> : <code class="type">int</code></pre><div class="info ">
Terminal read from background process<br>
</div>

<pre><span id="VALsigttou"><span class="keyword">val</span> sigttou</span> : <code class="type">int</code></pre><div class="info ">
Terminal write from background process<br>
</div>

<pre><span id="VALsigvtalrm"><span class="keyword">val</span> sigvtalrm</span> : <code class="type">int</code></pre><div class="info ">
Timeout in virtual time<br>
</div>

<pre><span id="VALsigprof"><span class="keyword">val</span> sigprof</span> : <code class="type">int</code></pre><div class="info ">
Profiling interrupt<br>
</div>

<pre><span id="EXCEPTIONBreak"><span class="keyword">exception</span> Break</span></pre>
<div class="info ">
Exception raised on interactive interrupt if <a href="Sys.html#VALcatch_break"><code class="code"><span class="constructor">Sys</span>.catch_break</code></a>
   is on.<br>
</div>

<pre><span id="VALcatch_break"><span class="keyword">val</span> catch_break</span> : <code class="type">bool -&gt; unit</code></pre><div class="info ">
<code class="code">catch_break</code> governs whether interactive interrupt (ctrl-C)
   terminates the program or raises the <code class="code"><span class="constructor">Break</span></code> exception.
   Call <code class="code">catch_break <span class="keyword">true</span></code> to enable raising <code class="code"><span class="constructor">Break</span></code>,
   and <code class="code">catch_break <span class="keyword">false</span></code> to let the system
   terminate the program on user interrupt.<br>
</div>

<pre><span id="VALocaml_version"><span class="keyword">val</span> ocaml_version</span> : <code class="type">string</code></pre><div class="info ">
<code class="code">ocaml_version</code> is the version of OCaml.
    It is a string of the form <code class="code"><span class="string">"major.minor[.patchlevel][+additional-info]"</span></code>,
    where <code class="code">major</code>, <code class="code">minor</code>, and <code class="code">patchlevel</code> are integers, and
    <code class="code">additional-info</code> is an arbitrary string. The <code class="code">[.patchlevel]</code> and
    <code class="code">[+additional-info]</code> parts may be absent.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>