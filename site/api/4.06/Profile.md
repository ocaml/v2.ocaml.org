<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Profile</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Profile.html">Profile</a></h1>

<pre><span id="MODULEProfile"><span class="keyword">module</span> Profile</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Profile.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Compiler performance recording</p>
</div>
</div>
<hr width="100%">

<pre><span id="TYPEfile"><span class="keyword">type</span> <code class="type"></code>file</span> = <code class="type">string</code> </pre>


<pre><span id="VALreset"><span class="keyword">val</span> reset</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>erase all recorded profile information</p>
</div>
</div>

<pre><span id="VALrecord_call"><span class="keyword">val</span> record_call</span> : <code class="type">?accumulate:bool -&gt; string -&gt; (unit -&gt; 'a) -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">record_call&nbsp;pass&nbsp;f</code> calls <code class="code">f</code> and records its profile information.</p>
</div>
</div>

<pre><span id="VALrecord"><span class="keyword">val</span> record</span> : <code class="type">?accumulate:bool -&gt; string -&gt; ('a -&gt; 'b) -&gt; 'a -&gt; 'b</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">record&nbsp;pass&nbsp;f&nbsp;arg</code> records the profile information of <code class="code">f&nbsp;arg</code></p>
</div>
</div>

<pre><span id="TYPEcolumn"><span class="keyword">type</span> <code class="type"></code>column</span> = <code class="type">[ `Abs_top_heap | `Alloc | `Time | `Top_heap ]</code> </pre>


<pre><span id="VALprint"><span class="keyword">val</span> print</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Profile.html#TYPEcolumn">column</a> list -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Prints the selected recorded profiling information to the formatter.</p>
</div>
</div>
<p>Command line flags</p>

<pre><span id="VALoptions_doc"><span class="keyword">val</span> options_doc</span> : <code class="type">string</code></pre>
<pre><span id="VALall_columns"><span class="keyword">val</span> all_columns</span> : <code class="type"><a href="Profile.html#TYPEcolumn">column</a> list</code></pre><p>A few pass names that are needed in several places, and shared to
    avoid typos.</p>

<pre><span id="VALgenerate"><span class="keyword">val</span> generate</span> : <code class="type">string</code></pre>
<pre><span id="VALtransl"><span class="keyword">val</span> transl</span> : <code class="type">string</code></pre>
<pre><span id="VALtyping"><span class="keyword">val</span> typing</span> : <code class="type">string</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>