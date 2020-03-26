<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Lexer</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Lexer.html">Lexer</a></h1>

<pre><span class="keyword">module</span> Lexer: <code class="code"><span class="keyword">sig</span></code> <a href="Lexer.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="VALinit"><span class="keyword">val</span> init</span> : <code class="type">unit -&gt; unit</code></pre>
<pre><span id="VALtoken"><span class="keyword">val</span> token</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">Lexing.lexbuf</a> -&gt; <a href="Parser.html#TYPEtoken">Parser.token</a></code></pre>
<pre><span id="VALskip_sharp_bang"><span class="keyword">val</span> skip_sharp_bang</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">Lexing.lexbuf</a> -&gt; unit</code></pre>
<pre><code><span id="TYPEerror"><span class="keyword">type</span> <code class="type"></code>error</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Illegal_character"><span class="constructor">Illegal_character</span></span> <span class="keyword">of</span> <code class="type">char</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Illegal_escape"><span class="constructor">Illegal_escape</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Unterminated_comment"><span class="constructor">Unterminated_comment</span></span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEt">Location.t</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Unterminated_string"><span class="constructor">Unterminated_string</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Unterminated_string_in_comment"><span class="constructor">Unterminated_string_in_comment</span></span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEt">Location.t</a> * <a href="Location.html#TYPEt">Location.t</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Keyword_as_label"><span class="constructor">Keyword_as_label</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Invalid_literal"><span class="constructor">Invalid_literal</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr></tbody></table>



<pre><span id="EXCEPTIONError"><span class="keyword">exception</span> Error</span> <span class="keyword">of</span> <code class="type"><a href="Lexer.html#TYPEerror">error</a> * <a href="Location.html#TYPEt">Location.t</a></code></pre>

<pre><span id="VALreport_error"><span class="keyword">val</span> report_error</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Lexer.html#TYPEerror">error</a> -&gt; unit</code></pre>
<pre><span id="VALin_comment"><span class="keyword">val</span> in_comment</span> : <code class="type">unit -&gt; bool</code></pre>
<pre><span id="VALin_string"><span class="keyword">val</span> in_string</span> : <code class="type">unit -&gt; bool</code></pre>
<pre><span id="VALprint_warnings"><span class="keyword">val</span> print_warnings</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALhandle_docstrings"><span class="keyword">val</span> handle_docstrings</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALcomments"><span class="keyword">val</span> comments</span> : <code class="type">unit -&gt; (string * <a href="Location.html#TYPEt">Location.t</a>) list</code></pre>
<pre><span id="VALtoken_with_comments"><span class="keyword">val</span> token_with_comments</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">Lexing.lexbuf</a> -&gt; <a href="Parser.html#TYPEtoken">Parser.token</a></code></pre>
<pre><span id="VALset_preprocessor"><span class="keyword">val</span> set_preprocessor</span> : <code class="type">(unit -&gt; unit) -&gt;<br>       ((<a href="Lexing.html#TYPElexbuf">Lexing.lexbuf</a> -&gt; <a href="Parser.html#TYPEtoken">Parser.token</a>) -&gt; <a href="Lexing.html#TYPElexbuf">Lexing.lexbuf</a> -&gt; <a href="Parser.html#TYPEtoken">Parser.token</a>) -&gt; unit</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>