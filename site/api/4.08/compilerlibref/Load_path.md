<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Load_path</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Load_path.html">Load_path</a></h1>

<pre><span id="MODULELoad_path"><span class="keyword">module</span> Load_path</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Load_path.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Management of include directories.</p>

<p>This module offers a high level interface to locating files in the
    load path, which is constructed from <code class="code">-<span class="constructor">I</span></code> command line flags and a few
    other parameters.</p>

<p>It makes the assumption that the contents of include directories
    doesn't change during the execution of the compiler.</p>
</div>
</div>
<hr width="100%">

<pre><span id="VALadd_dir"><span class="keyword">val</span> add_dir</span> : <code class="type">string -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Add a directory to the load path</p>
</div>
</div>

<pre><span id="VALremove_dir"><span class="keyword">val</span> remove_dir</span> : <code class="type">string -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Remove a directory from the load path</p>
</div>
</div>

<pre><span id="VALreset"><span class="keyword">val</span> reset</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Remove all directories</p>
</div>
</div>

<pre><span id="VALinit"><span class="keyword">val</span> init</span> : <code class="type">string list -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">init&nbsp;l</code> is the same as <code class="code">reset&nbsp;();&nbsp;<span class="constructor">List</span>.iter&nbsp;add_dir&nbsp;(<span class="constructor">List</span>.rev&nbsp;l)</code></p>
</div>
</div>

<pre><span id="VALget_paths"><span class="keyword">val</span> get_paths</span> : <code class="type">unit -&gt; string list</code></pre><div class="info ">
<div class="info-desc">
<p>Return the list of directories passed to <code class="code">add_dir</code> so far, in
    reverse order.</p>
</div>
</div>

<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>Locate a file in the load path. Raise <code class="code"><span class="constructor">Not_found</span></code> if the file
    cannot be found. This function is optimized for the case where the
    filename is a basename, i.e. doesn't contain a directory
    separator.</p>
</div>
</div>

<pre><span id="VALfind_uncap"><span class="keyword">val</span> find_uncap</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <code class="code">find</code>, but search also for uncapitalized name, i.e.  if
    name is Foo.ml, allow /path/Foo.ml and /path/foo.ml to match.</p>
</div>
</div>

<pre><span id="MODULEDir"><span class="keyword">module</span> <a href="Load_path.Dir.html">Dir</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Load_path.Dir.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type"><a href="Load_path.Dir.html#TYPEt">Dir.t</a> -&gt; unit</code></pre>
<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">unit -&gt; <a href="Load_path.Dir.html#TYPEt">Dir.t</a> list</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <code class="code">get_paths&nbsp;()</code>, except that it returns a <code class="code"><span class="constructor">Dir</span>.t&nbsp;list</code>.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>