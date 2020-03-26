<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Strongly_connected_components.Make</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_Strongly_connected_components.Make.html">Strongly_connected_components.Make</a></h1>

<pre><span id="MODULEMake"><span class="keyword">module</span> Make</span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">Id</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Identifiable.S.html">Identifiable.S</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Strongly_connected_components.S.html">S</a></code><code class="type">  with module Id := Id</code></div></pre><table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>Id</code></td>
<td align="center" valign="top">:</td>
<td><code class="type"><a href="Identifiable.S.html">Identifiable.S</a></code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<pre><span id="MODULEId"><span class="keyword">module</span> <a href="Strongly_connected_components.S.Id.html">Id</a></span>: <code class="type"><a href="Identifiable.S.html">Identifiable.S</a></code><code class="type"> </code></pre>
<pre><span id="TYPEdirected_graph"><span class="keyword">type</span> <code class="type"></code>directed_graph</span> = <code class="type">Id.Set.t Id.Map.t</code> </pre>
<div class="info ">
<div class="info-desc">
<p>If (a -&gt; set) belongs to the map, it means that there are edges
      from <code class="code">a</code> to every element of <code class="code">set</code>.  It is assumed that no edge
      points to a vertex not represented in the map.</p>
</div>
</div>


<pre><code><span id="TYPEcomponent"><span class="keyword">type</span> <code class="type"></code>component</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcomponent.Has_loop"><span class="constructor">Has_loop</span></span> <span class="keyword">of</span> <code class="type">Id.t list</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcomponent.No_loop"><span class="constructor">No_loop</span></span> <span class="keyword">of</span> <code class="type">Id.t</code></code></td>

</tr></tbody></table>



<pre><span id="VALconnected_components_sorted_from_roots_to_leaf"><span class="keyword">val</span> connected_components_sorted_from_roots_to_leaf</span> : <code class="type"><a href="Strongly_connected_components.S.html#TYPEdirected_graph">directed_graph</a> -&gt;<br>       <a href="Strongly_connected_components.S.html#TYPEcomponent">component</a> array</code></pre>
<pre><span id="VALcomponent_graph"><span class="keyword">val</span> component_graph</span> : <code class="type"><a href="Strongly_connected_components.S.html#TYPEdirected_graph">directed_graph</a> -&gt;<br>       (<a href="Strongly_connected_components.S.html#TYPEcomponent">component</a> * int list) array</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>