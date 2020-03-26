<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">GraphicsX11</a></div><ul></ul></nav></header>

<h1>Module <a href="type_GraphicsX11.html">GraphicsX11</a></h1>

<pre><span class="keyword">module</span> GraphicsX11: <code class="code"><span class="keyword">sig</span></code> <a href="GraphicsX11.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Additional graphics primitives for the X Windows system.<br>
</div>
<hr width="100%">

<pre><span id="TYPEwindow_id"><span class="keyword">type</span> <code class="type"></code>window_id</span> = <code class="type">string</code> </pre>


<pre><span id="VALwindow_id"><span class="keyword">val</span> window_id</span> : <code class="type">unit -&gt; <a href="GraphicsX11.html#TYPEwindow_id">window_id</a></code></pre><div class="info ">
Return the unique identifier of the OCaml graphics window.
   The returned string is an unsigned 32 bits integer
   in decimal form.<br>
</div>

<pre><span id="VALopen_subwindow"><span class="keyword">val</span> open_subwindow</span> : <code class="type">x:int -&gt; y:int -&gt; width:int -&gt; height:int -&gt; <a href="GraphicsX11.html#TYPEwindow_id">window_id</a></code></pre><div class="info ">
Create a sub-window of the current OCaml graphics window
   and return its identifier.<br>
</div>

<pre><span id="VALclose_subwindow"><span class="keyword">val</span> close_subwindow</span> : <code class="type"><a href="GraphicsX11.html#TYPEwindow_id">window_id</a> -&gt; unit</code></pre><div class="info ">
Close the sub-window having the given identifier.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>