<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Misc.Color</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Misc.Color.html">Misc.Color</a></h1>

<pre><span id="MODULEColor"><span class="keyword">module</span> Color</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Misc.Color.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><code><span id="TYPEcolor"><span class="keyword">type</span> <code class="type"></code>color</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcolor.Black"><span class="constructor">Black</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcolor.Red"><span class="constructor">Red</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcolor.Green"><span class="constructor">Green</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcolor.Yellow"><span class="constructor">Yellow</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcolor.Blue"><span class="constructor">Blue</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcolor.Magenta"><span class="constructor">Magenta</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcolor.Cyan"><span class="constructor">Cyan</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcolor.White"><span class="constructor">White</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEstyle"><span class="keyword">type</span> <code class="type"></code>style</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstyle.FG"><span class="constructor">FG</span></span> <span class="keyword">of</span> <code class="type"><a href="Misc.Color.html#TYPEcolor">color</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstyle.BG"><span class="constructor">BG</span></span> <span class="keyword">of</span> <code class="type"><a href="Misc.Color.html#TYPEcolor">color</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstyle.Bold"><span class="constructor">Bold</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstyle.Reset"><span class="constructor">Reset</span></span></code></td>

</tr></tbody></table>



<pre><span id="VALansi_of_style_l"><span class="keyword">val</span> ansi_of_style_l</span> : <code class="type"><a href="Misc.Color.html#TYPEstyle">style</a> list -&gt; string</code></pre>
<pre><code><span id="TYPEstyles"><span class="keyword">type</span> <code class="type"></code>styles</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstyles.error">error</span>&nbsp;: <code class="type"><a href="Misc.Color.html#TYPEstyle">style</a> list</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstyles.warning">warning</span>&nbsp;: <code class="type"><a href="Misc.Color.html#TYPEstyle">style</a> list</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstyles.loc">loc</span>&nbsp;: <code class="type"><a href="Misc.Color.html#TYPEstyle">style</a> list</code>;</code></td>

</tr></tbody></table>
}



<pre><span id="VALdefault_styles"><span class="keyword">val</span> default_styles</span> : <code class="type"><a href="Misc.Color.html#TYPEstyles">styles</a></code></pre>
<pre><span id="VALget_styles"><span class="keyword">val</span> get_styles</span> : <code class="type">unit -&gt; <a href="Misc.Color.html#TYPEstyles">styles</a></code></pre>
<pre><span id="VALset_styles"><span class="keyword">val</span> set_styles</span> : <code class="type"><a href="Misc.Color.html#TYPEstyles">styles</a> -&gt; unit</code></pre>
<pre><code><span id="TYPEsetting"><span class="keyword">type</span> <code class="type"></code>setting</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsetting.Auto"><span class="constructor">Auto</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsetting.Always"><span class="constructor">Always</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsetting.Never"><span class="constructor">Never</span></span></code></td>

</tr></tbody></table>



<pre><span id="VALsetup"><span class="keyword">val</span> setup</span> : <code class="type"><a href="Misc.Color.html#TYPEsetting">setting</a> option -&gt; unit</code></pre>
<pre><span id="VALset_color_tag_handling"><span class="keyword">val</span> set_color_tag_handling</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; unit</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>