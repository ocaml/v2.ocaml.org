<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Build_path_prefix_map</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Build_path_prefix_map.html">Build_path_prefix_map</a></h1>

<pre><span id="MODULEBuild_path_prefix_map"><span class="keyword">module</span> Build_path_prefix_map</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Build_path_prefix_map.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEpath"><span class="keyword">type</span> <code class="type"></code>path</span> = <code class="type">string</code> </pre>


<pre><span id="TYPEpath_prefix"><span class="keyword">type</span> <code class="type"></code>path_prefix</span> = <code class="type">string</code> </pre>


<pre><span id="TYPEerror_message"><span class="keyword">type</span> <code class="type"></code>error_message</span> = <code class="type">string</code> </pre>


<pre><span id="VALencode_prefix"><span class="keyword">val</span> encode_prefix</span> : <code class="type"><a href="Build_path_prefix_map.html#TYPEpath_prefix">path_prefix</a> -&gt; string</code></pre>
<pre><span id="VALdecode_prefix"><span class="keyword">val</span> decode_prefix</span> : <code class="type">string -&gt;<br>       (<a href="Build_path_prefix_map.html#TYPEpath_prefix">path_prefix</a>, <a href="Build_path_prefix_map.html#TYPEerror_message">error_message</a>)<br>       <a href="Pervasives.html#TYPEresult">result</a></code></pre>
<pre><code><span id="TYPEpair"><span class="keyword">type</span> <code class="type"></code>pair</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTpair.target">target</span>&nbsp;: <code class="type"><a href="Build_path_prefix_map.html#TYPEpath_prefix">path_prefix</a></code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTpair.source">source</span>&nbsp;: <code class="type"><a href="Build_path_prefix_map.html#TYPEpath_prefix">path_prefix</a></code>;</code></td>

</tr></tbody></table>
}



<pre><span id="VALencode_pair"><span class="keyword">val</span> encode_pair</span> : <code class="type"><a href="Build_path_prefix_map.html#TYPEpair">pair</a> -&gt; string</code></pre>
<pre><span id="VALdecode_pair"><span class="keyword">val</span> decode_pair</span> : <code class="type">string -&gt;<br>       (<a href="Build_path_prefix_map.html#TYPEpair">pair</a>, <a href="Build_path_prefix_map.html#TYPEerror_message">error_message</a>)<br>       <a href="Pervasives.html#TYPEresult">result</a></code></pre>
<pre><span id="TYPEmap"><span class="keyword">type</span> <code class="type"></code>map</span> = <code class="type"><a href="Build_path_prefix_map.html#TYPEpair">pair</a> option list</code> </pre>


<pre><span id="VALencode_map"><span class="keyword">val</span> encode_map</span> : <code class="type"><a href="Build_path_prefix_map.html#TYPEmap">map</a> -&gt; string</code></pre>
<pre><span id="VALdecode_map"><span class="keyword">val</span> decode_map</span> : <code class="type">string -&gt;<br>       (<a href="Build_path_prefix_map.html#TYPEmap">map</a>, <a href="Build_path_prefix_map.html#TYPEerror_message">error_message</a>)<br>       <a href="Pervasives.html#TYPEresult">result</a></code></pre>
<pre><span id="VALrewrite_opt"><span class="keyword">val</span> rewrite_opt</span> : <code class="type"><a href="Build_path_prefix_map.html#TYPEmap">map</a> -&gt;<br>       <a href="Build_path_prefix_map.html#TYPEpath">path</a> -&gt; <a href="Build_path_prefix_map.html#TYPEpath">path</a> option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">rewrite_opt&nbsp;map&nbsp;path</code> tries to find a source in <code class="code">map</code>
    that is a prefix of the input <code class="code">path</code>. If it succeeds,
    it replaces this prefix with the corresponding target.
    If it fails, it just returns <code class="code"><span class="constructor">None</span></code>.</p>
</div>
</div>

<pre><span id="VALrewrite"><span class="keyword">val</span> rewrite</span> : <code class="type"><a href="Build_path_prefix_map.html#TYPEmap">map</a> -&gt;<br>       <a href="Build_path_prefix_map.html#TYPEpath">path</a> -&gt; <a href="Build_path_prefix_map.html#TYPEpath">path</a></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>