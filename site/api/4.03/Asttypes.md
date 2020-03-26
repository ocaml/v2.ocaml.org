<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Asttypes</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Asttypes.html">Asttypes</a></h1>

<pre><span class="keyword">module</span> Asttypes: <code class="code"><span class="keyword">sig</span></code> <a href="Asttypes.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><code><span id="TYPEconstant"><span class="keyword">type</span> <code class="type"></code>constant</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTconstant.Const_int"><span class="constructor">Const_int</span></span> <span class="keyword">of</span> <code class="type">int</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTconstant.Const_char"><span class="constructor">Const_char</span></span> <span class="keyword">of</span> <code class="type">char</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTconstant.Const_string"><span class="constructor">Const_string</span></span> <span class="keyword">of</span> <code class="type">string * string option</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTconstant.Const_float"><span class="constructor">Const_float</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTconstant.Const_int32"><span class="constructor">Const_int32</span></span> <span class="keyword">of</span> <code class="type">int32</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTconstant.Const_int64"><span class="constructor">Const_int64</span></span> <span class="keyword">of</span> <code class="type">int64</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTconstant.Const_nativeint"><span class="constructor">Const_nativeint</span></span> <span class="keyword">of</span> <code class="type">nativeint</code></code></td>

</tr></tbody></table>



<pre><code><span id="TYPErec_flag"><span class="keyword">type</span> <code class="type"></code>rec_flag</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTrec_flag.Nonrecursive"><span class="constructor">Nonrecursive</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTrec_flag.Recursive"><span class="constructor">Recursive</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEdirection_flag"><span class="keyword">type</span> <code class="type"></code>direction_flag</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTdirection_flag.Upto"><span class="constructor">Upto</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTdirection_flag.Downto"><span class="constructor">Downto</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEprivate_flag"><span class="keyword">type</span> <code class="type"></code>private_flag</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTprivate_flag.Private"><span class="constructor">Private</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTprivate_flag.Public"><span class="constructor">Public</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEmutable_flag"><span class="keyword">type</span> <code class="type"></code>mutable_flag</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTmutable_flag.Immutable"><span class="constructor">Immutable</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTmutable_flag.Mutable"><span class="constructor">Mutable</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEvirtual_flag"><span class="keyword">type</span> <code class="type"></code>virtual_flag</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTvirtual_flag.Virtual"><span class="constructor">Virtual</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTvirtual_flag.Concrete"><span class="constructor">Concrete</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEoverride_flag"><span class="keyword">type</span> <code class="type"></code>override_flag</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELToverride_flag.Override"><span class="constructor">Override</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELToverride_flag.Fresh"><span class="constructor">Fresh</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEclosed_flag"><span class="keyword">type</span> <code class="type"></code>closed_flag</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTclosed_flag.Closed"><span class="constructor">Closed</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTclosed_flag.Open"><span class="constructor">Open</span></span></code></td>

</tr></tbody></table>



<pre><span id="TYPElabel"><span class="keyword">type</span> <code class="type"></code>label</span> = <code class="type">string</code> </pre>


<pre><code><span id="TYPEarg_label"><span class="keyword">type</span> <code class="type"></code>arg_label</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTarg_label.Nolabel"><span class="constructor">Nolabel</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTarg_label.Labelled"><span class="constructor">Labelled</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTarg_label.Optional"><span class="constructor">Optional</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr></tbody></table>



<pre><span id="TYPEloc"><span class="keyword">type</span> <code class="type">'a</code> loc</span> = <code class="type">'a <a href="Location.html#TYPEloc">Location.loc</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTloc.txt">txt</span>&nbsp;: <code class="type">'a</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTloc.loc">loc</span>&nbsp;: <code class="type"><a href="Location.html#TYPEt">Location.t</a></code>;</code></td>

</tr></tbody></table>
}



<pre><code><span id="TYPEvariance"><span class="keyword">type</span> <code class="type"></code>variance</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTvariance.Covariant"><span class="constructor">Covariant</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTvariance.Contravariant"><span class="constructor">Contravariant</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTvariance.Invariant"><span class="constructor">Invariant</span></span></code></td>

</tr></tbody></table>


<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>