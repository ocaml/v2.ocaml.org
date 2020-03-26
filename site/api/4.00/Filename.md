<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Filename</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Filename.html">Filename</a></h1>
<pre><span class="keyword">module</span> Filename: <code class="code"><span class="keyword">sig</span></code> <a href="Filename.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>Operations on file names.<br>
<hr width="100%">
<pre><span id="VALcurrent_dir_name"><span class="keyword">val</span> current_dir_name</span> : <code class="type">string</code></pre><div class="info">
The conventional name for the current directory (e.g. <code class="code">.</code> in Unix).<br>
</div>
<pre><span id="VALparent_dir_name"><span class="keyword">val</span> parent_dir_name</span> : <code class="type">string</code></pre><div class="info">
The conventional name for the parent of the current directory
   (e.g. <code class="code">..</code> in Unix).<br>
</div>
<pre><span id="VALdir_sep"><span class="keyword">val</span> dir_sep</span> : <code class="type">string</code></pre><div class="info">
The directory separator (e.g. <code class="code">/</code> in Unix).<br>
<b>Since</b> 3.11.2<br>
</div>
<pre><span id="VALconcat"><span class="keyword">val</span> concat</span> : <code class="type">string -&gt; string -&gt; string</code></pre><div class="info">
<code class="code">concat dir file</code> returns a file name that designates file
   <code class="code">file</code> in directory <code class="code">dir</code>.<br>
</div>
<pre><span id="VALis_relative"><span class="keyword">val</span> is_relative</span> : <code class="type">string -&gt; bool</code></pre><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if the file name is relative to the current
   directory, <code class="code"><span class="keyword">false</span></code> if it is absolute (i.e. in Unix, starts
   with <code class="code">/</code>).<br>
</div>
<pre><span id="VALis_implicit"><span class="keyword">val</span> is_implicit</span> : <code class="type">string -&gt; bool</code></pre><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if the file name is relative and does not start
   with an explicit reference to the current directory (<code class="code">./</code> or
   <code class="code">../</code> in Unix), <code class="code"><span class="keyword">false</span></code> if it starts with an explicit reference
   to the root directory or the current directory.<br>
</div>
<pre><span id="VALcheck_suffix"><span class="keyword">val</span> check_suffix</span> : <code class="type">string -&gt; string -&gt; bool</code></pre><div class="info">
<code class="code">check_suffix name suff</code> returns <code class="code"><span class="keyword">true</span></code> if the filename <code class="code">name</code>
   ends with the suffix <code class="code">suff</code>.<br>
</div>
<pre><span id="VALchop_suffix"><span class="keyword">val</span> chop_suffix</span> : <code class="type">string -&gt; string -&gt; string</code></pre><div class="info">
<code class="code">chop_suffix name suff</code> removes the suffix <code class="code">suff</code> from
   the filename <code class="code">name</code>. The behavior is undefined if <code class="code">name</code> does not
   end with the suffix <code class="code">suff</code>.<br>
</div>
<pre><span id="VALchop_extension"><span class="keyword">val</span> chop_extension</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Return the given file name without its extension. The extension
   is the shortest suffix starting with a period and not including
   a directory separator, <code class="code">.xyz</code> for instance.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the given name does not contain
   an extension.<br>
</p></div>
<pre><span id="VALbasename"><span class="keyword">val</span> basename</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Split a file name into directory name / base file name.
   If <code class="code">name</code> is a valid file name, then <code class="code">concat (dirname name) (basename name)</code>
   returns a file name which is equivalent to <code class="code">name</code>. Moreover,
   after setting the current directory to <code class="code">dirname name</code> (with <a href="Sys.html#VALchdir"><code class="code"><span class="constructor">Sys</span>.chdir</code></a>),
   references to <code class="code">basename name</code> (which is a relative file name)
   designate the same file as <code class="code">name</code> before the call to <a href="Sys.html#VALchdir"><code class="code"><span class="constructor">Sys</span>.chdir</code></a>.
<p>

   This function conforms to the specification of POSIX.1-2008 for the
   <code class="code">basename</code> utility.<br>
</p></div>
<pre><span id="VALdirname"><span class="keyword">val</span> dirname</span> : <code class="type">string -&gt; string</code></pre><div class="info">
See <a href="Filename.html#VALbasename"><code class="code"><span class="constructor">Filename</span>.basename</code></a>.
   This function conforms to the specification of POSIX.1-2008 for the
   <code class="code">dirname</code> utility.<br>
</div>
<pre><span id="VALtemp_file"><span class="keyword">val</span> temp_file</span> : <code class="type">?temp_dir:string -&gt; string -&gt; string -&gt; string</code></pre><div class="info">
<code class="code">temp_file prefix suffix</code> returns the name of a
   fresh temporary file in the temporary directory.
   The base name of the temporary file is formed by concatenating
   <code class="code">prefix</code>, then a suitably chosen integer number, then <code class="code">suffix</code>.
   The optional argument <code class="code">temp_dir</code> indicates the temporary directory
   to use, defaulting to the current result of <a href="Filename.html#VALget_temp_dir_name"><code class="code"><span class="constructor">Filename</span>.get_temp_dir_name</code></a>.
   The temporary file is created empty, with permissions <code class="code">0o600</code>
   (readable and writable only by the file owner).  The file is
   guaranteed to be different from any other file that existed when
   <code class="code">temp_file</code> was called.
   Raise <code class="code"><span class="constructor">Sys_error</span></code> if the file could not be created.<br>
<b>Before 3.11.2 </b> no ?temp_dir optional argument<br>
</div>
<pre><span id="VALopen_temp_file"><span class="keyword">val</span> open_temp_file</span> : <code class="type">?mode:<a href="Pervasives.html#TYPEopen_flag">open_flag</a> list -&gt;<br>       ?temp_dir:string -&gt; string -&gt; string -&gt; string * <a href="Pervasives.html#TYPEout_channel">out_channel</a></code></pre><div class="info">
Same as <a href="Filename.html#VALtemp_file"><code class="code"><span class="constructor">Filename</span>.temp_file</code></a>, but returns both the name of a fresh
   temporary file, and an output channel opened (atomically) on
   this file.  This function is more secure than <code class="code">temp_file</code>: there
   is no risk that the temporary file will be modified (e.g. replaced
   by a symbolic link) before the program opens it.  The optional argument
   <code class="code">mode</code> is a list of additional flags to control the opening of the file.
   It can contain one or several of <code class="code"><span class="constructor">Open_append</span></code>, <code class="code"><span class="constructor">Open_binary</span></code>,
   and <code class="code"><span class="constructor">Open_text</span></code>.  The default is <code class="code">[<span class="constructor">Open_text</span>]</code> (open in text mode).
   Raise <code class="code"><span class="constructor">Sys_error</span></code> if the file could not be opened.<br>
<b>Before 3.11.2 </b> no ?temp_dir optional argument<br>
</div>
<pre><span id="VALget_temp_dir_name"><span class="keyword">val</span> get_temp_dir_name</span> : <code class="type">unit -&gt; string</code></pre><div class="info">
The name of the temporary directory:
    Under Unix, the value of the <code class="code"><span class="constructor">TMPDIR</span></code> environment variable, or "/tmp"
    if the variable is not set.
    Under Windows, the value of the <code class="code"><span class="constructor">TEMP</span></code> environment variable, or "."
    if the variable is not set.
    The temporary directory can be changed with <a href="Filename.html#VALset_temp_dir_name"><code class="code"><span class="constructor">Filename</span>.set_temp_dir_name</code></a>.<br>
<b>Since</b> 4.00.0<br>
</div>
<pre><span id="VALset_temp_dir_name"><span class="keyword">val</span> set_temp_dir_name</span> : <code class="type">string -&gt; unit</code></pre><div class="info">
Change the temporary directory returned by <a href="Filename.html#VALget_temp_dir_name"><code class="code"><span class="constructor">Filename</span>.get_temp_dir_name</code></a>
    and used by <a href="Filename.html#VALtemp_file"><code class="code"><span class="constructor">Filename</span>.temp_file</code></a> and <a href="Filename.html#VALopen_temp_file"><code class="code"><span class="constructor">Filename</span>.open_temp_file</code></a>.<br>
<b>Since</b> 4.00.0<br>
</div>
<pre><span id="VALtemp_dir_name"><span class="keyword">val</span> temp_dir_name</span> : <code class="type">string</code></pre><div class="info">
<span class="warning">Deprecated.</span>The name of the initial temporary directory:
    Under Unix, the value of the <code class="code"><span class="constructor">TMPDIR</span></code> environment variable, or "/tmp"
    if the variable is not set.
    Under Windows, the value of the <code class="code"><span class="constructor">TEMP</span></code> environment variable, or "."
    if the variable is not set.
    This function is deprecated; <a href="Filename.html#VALget_temp_dir_name"><code class="code"><span class="constructor">Filename</span>.get_temp_dir_name</code></a> should be
    used instead.<br>
<b>Since</b> 3.09.1<br>
</div>
<pre><span id="VALquote"><span class="keyword">val</span> quote</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Return a quoted version of a file name, suitable for use as
    one argument in a command line, escaping all meta-characters.
    Warning: under Windows, the output is only suitable for use
    with programs that follow the standard Windows quoting
    conventions.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>