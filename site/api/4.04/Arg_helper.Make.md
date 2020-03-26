<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Arg_helper.Make</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_Arg_helper.Make.html">Arg_helper.Make</a></h1>

<pre><span class="keyword">module</span> Make: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">S</span></code><code class="code">&nbsp;:&nbsp;</code><code class="code"><span class="keyword">sig</span></code><div class="sig_block">
<pre><span class="keyword">module</span> <a href="Arg_helper.Make.Key.html">Key</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Arg_helper.Make.Key.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span class="keyword">module</span> <a href="Arg_helper.Make.Value.html">Value</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Arg_helper.Make.Value.html">..</a> <code class="code"><span class="keyword">end</span></code></pre></div><code class="code"><span class="keyword">end</span></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="code"><span class="keyword">sig</span></code> <a href="Arg_helper.Make.html">..</a> <code class="code"><span class="keyword">end</span></code></div></pre><table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>S</code></td>
<td align="center" valign="top">:</td>
<td><code class="type">sig
  module Key : sig
    type t

    (** The textual representation of a key must not contain '=' or ','. *)
    val of_string : string -&gt; t

    module <a href="Map.html">Map</a> : <a href="Map.S.html">Map.S</a> with type key = t
  end

  module Value : sig
    type t

    (** The textual representation of a value must not contain ','. *)
    val of_string : string -&gt; t
  end
end</code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<pre><span id="TYPEparsed"><span class="keyword">type</span> <code class="type"></code>parsed</span> </pre>


<pre><span id="VALdefault"><span class="keyword">val</span> default</span> : <code class="type">S.Value.t -&gt; <a href="Arg_helper.Make.html#TYPEparsed">parsed</a></code></pre>
<pre><span id="VALset_base_default"><span class="keyword">val</span> set_base_default</span> : <code class="type">S.Value.t -&gt; <a href="Arg_helper.Make.html#TYPEparsed">parsed</a> -&gt; <a href="Arg_helper.Make.html#TYPEparsed">parsed</a></code></pre>
<pre><span id="VALadd_base_override"><span class="keyword">val</span> add_base_override</span> : <code class="type">S.Key.t -&gt; S.Value.t -&gt; <a href="Arg_helper.Make.html#TYPEparsed">parsed</a> -&gt; <a href="Arg_helper.Make.html#TYPEparsed">parsed</a></code></pre>
<pre><span id="VALreset_base_overrides"><span class="keyword">val</span> reset_base_overrides</span> : <code class="type"><a href="Arg_helper.Make.html#TYPEparsed">parsed</a> -&gt; <a href="Arg_helper.Make.html#TYPEparsed">parsed</a></code></pre>
<pre><span id="VALset_user_default"><span class="keyword">val</span> set_user_default</span> : <code class="type">S.Value.t -&gt; <a href="Arg_helper.Make.html#TYPEparsed">parsed</a> -&gt; <a href="Arg_helper.Make.html#TYPEparsed">parsed</a></code></pre>
<pre><span id="VALadd_user_override"><span class="keyword">val</span> add_user_override</span> : <code class="type">S.Key.t -&gt; S.Value.t -&gt; <a href="Arg_helper.Make.html#TYPEparsed">parsed</a> -&gt; <a href="Arg_helper.Make.html#TYPEparsed">parsed</a></code></pre>
<pre><span id="VALparse"><span class="keyword">val</span> parse</span> : <code class="type">string -&gt; string -&gt; <a href="Arg_helper.Make.html#TYPEparsed">parsed</a> <a href="Pervasives.html#TYPEref">ref</a> -&gt; unit</code></pre>
<pre><code><span id="TYPEparse_result"><span class="keyword">type</span> <code class="type"></code>parse_result</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTparse_result.Ok"><span class="constructor">Ok</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTparse_result.Parse_failed"><span class="constructor">Parse_failed</span></span> <span class="keyword">of</span> <code class="type">exn</code></code></td>

</tr></tbody></table>



<pre><span id="VALparse_no_error"><span class="keyword">val</span> parse_no_error</span> : <code class="type">string -&gt;<br>       <a href="Arg_helper.Make.html#TYPEparsed">parsed</a> <a href="Pervasives.html#TYPEref">ref</a> -&gt; <a href="Arg_helper.Make.html#TYPEparse_result">parse_result</a></code></pre>
<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">key:S.Key.t -&gt; <a href="Arg_helper.Make.html#TYPEparsed">parsed</a> -&gt; S.Value.t</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>