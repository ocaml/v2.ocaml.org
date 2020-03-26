<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stdlib.Genlex</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Stdlib.Genlex.html">Stdlib.Genlex</a></h1>

<pre><span id="MODULEGenlex"><span class="keyword">module</span> Genlex</span>: <code class="type"><a href="Genlex.html">Genlex</a></code></pre><hr width="100%">

<pre><code><span id="TYPEtoken"><span class="keyword">type</span> <code class="type"></code>token</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtoken.Kwd"><span class="constructor">Kwd</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtoken.Ident"><span class="constructor">Ident</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtoken.Int"><span class="constructor">Int</span></span> <span class="keyword">of</span> <code class="type">int</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtoken.Float"><span class="constructor">Float</span></span> <span class="keyword">of</span> <code class="type">float</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtoken.String"><span class="constructor">String</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTtoken.Char"><span class="constructor">Char</span></span> <span class="keyword">of</span> <code class="type">char</code></code></td>

</tr></tbody></table>

<div class="info ">
<div class="info-desc">
<p>The type of tokens. The lexical classes are: <code class="code"><span class="constructor">Int</span></code> and <code class="code"><span class="constructor">Float</span></code>
   for integer and floating-point numbers; <code class="code"><span class="constructor">String</span></code> for
   string literals, enclosed in double quotes; <code class="code"><span class="constructor">Char</span></code> for
   character literals, enclosed in single quotes; <code class="code"><span class="constructor">Ident</span></code> for
   identifiers (either sequences of letters, digits, underscores
   and quotes, or sequences of 'operator characters' such as
   <code class="code">+</code>, <code class="code">*</code>, etc); and <code class="code"><span class="constructor">Kwd</span></code> for keywords (either identifiers or
   single 'special characters' such as <code class="code">(</code>, <code class="code">}</code>, etc).</p>
</div>
</div>


<pre><span id="VALmake_lexer"><span class="keyword">val</span> make_lexer</span> : <code class="type">string list -&gt; char <a href="Stream.html#TYPEt">Stream.t</a> -&gt; <a href="Genlex.html#TYPEtoken">token</a> <a href="Stream.html#TYPEt">Stream.t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Construct the lexer function. The first argument is the list of
   keywords. An identifier <code class="code">s</code> is returned as <code class="code"><span class="constructor">Kwd</span>&nbsp;s</code> if <code class="code">s</code>
   belongs to this list, and as <code class="code"><span class="constructor">Ident</span>&nbsp;s</code> otherwise.
   A special character <code class="code">s</code> is returned as <code class="code"><span class="constructor">Kwd</span>&nbsp;s</code> if <code class="code">s</code>
   belongs to this list, and cause a lexical error (exception
   <a href="Stream.html#EXCEPTIONError"><code class="code"><span class="constructor">Stream</span>.<span class="constructor">Error</span></code></a> with the offending lexeme as its parameter) otherwise.
   Blanks and newlines are skipped. Comments delimited by <code class="code">(*</code> and <code class="code">*)</code>
   are skipped as well, and can be nested. A <a href="Stream.html#EXCEPTIONFailure"><code class="code"><span class="constructor">Stream</span>.<span class="constructor">Failure</span></code></a> exception
   is raised if end of stream is unexpectedly reached.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>