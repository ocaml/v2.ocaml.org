<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Spacetime</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Spacetime.html">Spacetime</a></h1>

<pre><span id="MODULESpacetime"><span class="keyword">module</span> Spacetime</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Spacetime.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Profiling of a program's space behaviour over time.
    Currently only supported on x86-64 platforms running 64-bit code.</p>

<p>To use the functions in this module you must:</p>
<ul>
<li>configure the compiler with "-spacetime";</li>
<li>compile to native code.
    Without these conditions being satisfied the functions in this module
    will have no effect.</li>
</ul>
<p>Instead of manually taking profiling heap snapshots with this module it is
    possible to use an automatic snapshot facility that writes profiling
    information at fixed intervals to a file. To enable this, all that needs to
    be done is to build the relevant program using a compiler configured with
    -spacetime; and set the environment variable OCAML_SPACETIME_INTERVAL to an
    integer number of milliseconds giving the interval between profiling heap
    snapshots. This interval should not be made excessively small relative to
    the running time of the program. A typical interval to start with might be
    1/100 of the running time of the program.  The program must exit "normally"
    (i.e. by calling <code class="code">exit</code>, with whatever exit code, rather than being
    abnormally terminated by a signal) so that the snapshot file is
    correctly completed.</p>

<p>When using the automatic snapshot mode the profiling output is written
    to a file called "spacetime-&lt;pid&gt;" where &lt;pid&gt; is the process ID of the
    program.  (If the program forks and continues executing then multiple
    files may be produced with different pid numbers.)  The profiling output
    is by default written to the current working directory when the program
    starts.  This may be customised by setting the OCAML_SPACETIME_SNAPSHOT_DIR
    environment variable to the name of the desired directory.</p>

<p>If using automatic snapshots the presence of the
    <code class="code">save_event_for_automatic_snapshots</code> function, below, should be noted.</p>

<p>The functions in this module are thread safe.</p>

<p>For functions to decode the information recorded by the profiler,
    see the Spacetime offline library in otherlibs/.</p>
</div>
</div>
<hr width="100%">

<pre><span id="VALenabled"><span class="keyword">val</span> enabled</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">enabled</code> is <code class="code"><span class="keyword">true</span></code> if the compiler is configured with spacetime and <code class="code"><span class="keyword">false</span></code>
    otherwise</p>
</div>
</div>

<pre><span id="MODULESeries"><span class="keyword">module</span> <a href="Spacetime.Series.html">Series</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Spacetime.Series.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULESnapshot"><span class="keyword">module</span> <a href="Spacetime.Snapshot.html">Snapshot</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Spacetime.Snapshot.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="VALsave_event_for_automatic_snapshots"><span class="keyword">val</span> save_event_for_automatic_snapshots</span> : <code class="type">event_name:string -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Like <a href="Spacetime.Series.html#VALsave_event"><code class="code"><span class="constructor">Spacetime</span>.<span class="constructor">Series</span>.save_event</code></a>, but writes to the automatic snapshot file.
    This function is a no-op if OCAML_SPACETIME_INTERVAL was not set.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>