<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.Printers.Make</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_CamlinternalMenhirLib.Printers.Make.html">CamlinternalMenhirLib.Printers.Make</a></h1>

<pre><span id="MODULEMake"><span class="keyword">module</span> Make</span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">I</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.EVERYTHING.html">CamlinternalMenhirLib.IncrementalEngine.EVERYTHING</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">User</span></code><code class="code">&nbsp;:&nbsp;</code><code class="code"><span class="keyword">sig</span></code></div></div></pre><div class="sig_block">
<pre><span id="VALprint"><span class="keyword">val</span> print</span> : <code class="type">string -&gt; unit</code></pre>
<pre><span id="VALprint_symbol"><span class="keyword">val</span> print_symbol</span> : <code class="type">I.xsymbol -&gt; unit</code></pre>
<pre><span id="VALprint_element"><span class="keyword">val</span> print_element</span> : <code class="type">(I.element -&gt; unit) option</code></pre></div><pre><code class="code"><span class="keyword">end</span></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.Printers.Make.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>I</code></td>
<td align="center" valign="top">:</td>
<td><code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.EVERYTHING.html">CamlinternalMenhirLib.IncrementalEngine.EVERYTHING</a></code>
</td></tr><tr>
<td align="center" valign="top" width="15%">
<code>User</code></td>
<td align="center" valign="top">:</td>
<td><code class="type">sig

    (* [print s] is supposed to send the string [s] to some output channel. *)

    val print: string -&gt; unit

    (* [print_symbol s] is supposed to print a representation of the symbol [s]. *)

    val print_symbol: I.xsymbol -&gt; unit

    (* [print_element e] is supposed to print a representation of the element [e].
       This function is optional; if it is not provided, [print_element_as_symbol]
       (defined below) is used instead. *)

    val print_element: (I.element -&gt; unit) option

  end</code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<pre><span id="VALprint_symbols"><span class="keyword">val</span> print_symbols</span> : <code class="type">I.xsymbol list -&gt; unit</code></pre>
<pre><span id="VALprint_element_as_symbol"><span class="keyword">val</span> print_element_as_symbol</span> : <code class="type">I.element -&gt; unit</code></pre>
<pre><span id="VALprint_stack"><span class="keyword">val</span> print_stack</span> : <code class="type">'a I.env -&gt; unit</code></pre>
<pre><span id="VALprint_item"><span class="keyword">val</span> print_item</span> : <code class="type">I.item -&gt; unit</code></pre>
<pre><span id="VALprint_production"><span class="keyword">val</span> print_production</span> : <code class="type">I.production -&gt; unit</code></pre>
<pre><span id="VALprint_current_state"><span class="keyword">val</span> print_current_state</span> : <code class="type">'a I.env -&gt; unit</code></pre>
<pre><span id="VALprint_env"><span class="keyword">val</span> print_env</span> : <code class="type">'a I.env -&gt; unit</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>