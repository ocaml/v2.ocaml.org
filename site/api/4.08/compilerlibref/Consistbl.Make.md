<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Consistbl.Make</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_Consistbl.Make.html">Consistbl.Make</a></h1>

<pre><span id="MODULEMake"><span class="keyword">module</span> Make</span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">Module_name</span></code><code class="code">&nbsp;:&nbsp;</code><code class="code"><span class="keyword">sig</span></code></div></pre><div class="sig_block">
<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>


<pre><span id="MODULESet"><span class="keyword">module</span> <a href="Consistbl.Make.Set.html">Set</a></span>: <code class="type">Set.S</code><code class="type">  with type elt = t</code></pre>
<pre><span id="MODULEMap"><span class="keyword">module</span> <a href="Consistbl.Make.Map.html">Map</a></span>: <code class="type">Map.S</code><code class="type">  with type key = t</code></pre>
<pre><span id="MODULETbl"><span class="keyword">module</span> <a href="Consistbl.Make.Tbl.html">Tbl</a></span>: <code class="type">Hashtbl.S</code><code class="type">  with type key = t</code></pre>
<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Consistbl.Make.html#TYPEt">t</a> -&gt; <a href="Consistbl.Make.html#TYPEt">t</a> -&gt; int</code></pre></div><pre><code class="code"><span class="keyword">end</span></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="code"><span class="keyword">sig</span></code> <a href="Consistbl.Make.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>Module_name</code></td>
<td align="center" valign="top">:</td>
<td><code class="type">sig
  type t
  module Set : Set.S with type elt = t
  module Map : Map.S with type key = t
  module Tbl : Hashtbl.S with type key = t
  val compare : t -&gt; t -&gt; int
end</code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">unit -&gt; <a href="Consistbl.Make.html#TYPEt">t</a></code></pre>
<pre><span id="VALclear"><span class="keyword">val</span> clear</span> : <code class="type"><a href="Consistbl.Make.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALcheck"><span class="keyword">val</span> check</span> : <code class="type"><a href="Consistbl.Make.html#TYPEt">t</a> -&gt; Module_name.t -&gt; Digest.t -&gt; <a href="Misc.html#TYPEfilepath">Misc.filepath</a> -&gt; unit</code></pre>
<pre><span id="VALcheck_noadd"><span class="keyword">val</span> check_noadd</span> : <code class="type"><a href="Consistbl.Make.html#TYPEt">t</a> -&gt; Module_name.t -&gt; Digest.t -&gt; <a href="Misc.html#TYPEfilepath">Misc.filepath</a> -&gt; unit</code></pre>
<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type"><a href="Consistbl.Make.html#TYPEt">t</a> -&gt; Module_name.t -&gt; Digest.t -&gt; <a href="Misc.html#TYPEfilepath">Misc.filepath</a> -&gt; unit</code></pre>
<pre><span id="VALsource"><span class="keyword">val</span> source</span> : <code class="type"><a href="Consistbl.Make.html#TYPEt">t</a> -&gt; Module_name.t -&gt; <a href="Misc.html#TYPEfilepath">Misc.filepath</a></code></pre>
<pre><span id="VALextract"><span class="keyword">val</span> extract</span> : <code class="type">Module_name.t list -&gt;<br>       <a href="Consistbl.Make.html#TYPEt">t</a> -&gt; (Module_name.t * Digest.t option) list</code></pre>
<pre><span id="VALextract_map"><span class="keyword">val</span> extract_map</span> : <code class="type">Module_name.Set.t -&gt;<br>       <a href="Consistbl.Make.html#TYPEt">t</a> -&gt; Digest.t option Module_name.Map.t</code></pre>
<pre><span id="VALfilter"><span class="keyword">val</span> filter</span> : <code class="type">(Module_name.t -&gt; bool) -&gt; <a href="Consistbl.Make.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="EXCEPTIONInconsistency"><span class="keyword">exception</span> Inconsistency</span> <span class="keyword">of</span> <code class="type">Module_name.t * <a href="Misc.html#TYPEfilepath">Misc.filepath</a> * <a href="Misc.html#TYPEfilepath">Misc.filepath</a></code></pre>

<pre><span id="EXCEPTIONNot_available"><span class="keyword">exception</span> Not_available</span> <span class="keyword">of</span> <code class="type">Module_name.t</code></pre>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>