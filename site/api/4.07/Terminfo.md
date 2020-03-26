<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Terminfo</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Terminfo.html">Terminfo</a></h1>

<pre><span id="MODULETerminfo"><span class="keyword">module</span> Terminfo</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Terminfo.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><code><span id="TYPEstatus"><span class="keyword">type</span> <code class="type"></code>status</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstatus.Uninitialised"><span class="constructor">Uninitialised</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstatus.Bad_term"><span class="constructor">Bad_term</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstatus.Good_term"><span class="constructor">Good_term</span></span></code></td>

</tr></tbody></table>



<pre><span id="VALsetup"><span class="keyword">val</span> setup</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; <a href="Terminfo.html#TYPEstatus">status</a></code></pre>
<pre><span id="VALnum_lines"><span class="keyword">val</span> num_lines</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; int</code></pre>
<pre><span id="VALbackup"><span class="keyword">val</span> backup</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALstandout"><span class="keyword">val</span> standout</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; bool -&gt; unit</code></pre>
<pre><span id="VALresume"><span class="keyword">val</span> resume</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; int -&gt; unit</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>