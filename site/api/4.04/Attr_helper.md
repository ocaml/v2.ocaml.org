<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Attr_helper</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Attr_helper.html">Attr_helper</a></h1>

<pre><span class="keyword">module</span> Attr_helper: <code class="code"><span class="keyword">sig</span></code> <a href="Attr_helper.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Helpers for attributes<br>
</div>
<hr width="100%">

<pre><code><span id="TYPEerror"><span class="keyword">type</span> <code class="type"></code>error</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Multiple_attributes"><span class="constructor">Multiple_attributes</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.No_payload_expected"><span class="constructor">No_payload_expected</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr></tbody></table>



<pre><span id="VALget_no_payload_attribute"><span class="keyword">val</span> get_no_payload_attribute</span> : <code class="type">string list -&gt; <a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; string <a href="Asttypes.html#TYPEloc">Asttypes.loc</a> option</code></pre><div class="info ">
The <code class="code">string&nbsp;list</code> argument of the following functions is a list of
    alternative names for the attribute we are looking for. For instance:
<p>

    </p><pre class="codepre"><code class="code">      [<span class="string">"foo"</span>; <span class="string">"ocaml.foo"</span>]
    </code></pre><br>
</div>

<pre><span id="VALhas_no_payload_attribute"><span class="keyword">val</span> has_no_payload_attribute</span> : <code class="type">string list -&gt; <a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; bool</code></pre>
<pre><span id="EXCEPTIONError"><span class="keyword">exception</span> Error</span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEt">Location.t</a> * <a href="Attr_helper.html#TYPEerror">error</a></code></pre>

<pre><span id="VALreport_error"><span class="keyword">val</span> report_error</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Attr_helper.html#TYPEerror">error</a> -&gt; unit</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>