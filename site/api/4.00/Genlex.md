<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Genlex</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Genlex.html">Genlex</a></h1>
<pre><span class="keyword">module</span> Genlex: <code class="code"><span class="keyword">sig</span></code> <a href="Genlex.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>A generic lexical analyzer.
<p>

   This module implements a simple ``standard'' lexical analyzer, presented
   as a function from character streams to token streams. It implements
   roughly the lexical conventions of OCaml, but is parameterized by the
   set of keywords of your language.
</p><p>

   Example: a lexer suitable for a desk calculator is obtained by
   <code class="code">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">let</span>&nbsp;lexer&nbsp;=&nbsp;make_lexer&nbsp;[<span class="string">"+"</span>;<span class="string">"-"</span>;<span class="string">"*"</span>;<span class="string">"/"</span>;<span class="string">"let"</span>;<span class="string">"="</span>;&nbsp;<span class="string">"("</span>;&nbsp;<span class="string">")"</span>]&nbsp;&nbsp;</code>
</p><p>

   The associated parser would be a function from <code class="code">token stream</code>
   to, for instance, <code class="code">int</code>, and would have rules such as:
</p><p>

   <code class="code">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">let</span>&nbsp;parse_expr&nbsp;=&nbsp;<span class="keyword">parser</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&lt;&nbsp;<span class="keywordsign">'</span><span class="constructor">Int</span>&nbsp;n&nbsp;&gt;]&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;n<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;[&lt;&nbsp;<span class="keywordsign">'</span><span class="constructor">Kwd</span>&nbsp;<span class="string">"("</span>;&nbsp;n&nbsp;=&nbsp;parse_expr;&nbsp;<span class="keywordsign">'</span><span class="constructor">Kwd</span>&nbsp;<span class="string">")"</span>&nbsp;&gt;]&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;n<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;[&lt;&nbsp;n1&nbsp;=&nbsp;parse_expr;&nbsp;n2&nbsp;=&nbsp;parse_remainder&nbsp;n1&nbsp;&gt;]&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;n2<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">and</span>&nbsp;parse_remainder&nbsp;n1&nbsp;=&nbsp;<span class="keyword">parser</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&lt;&nbsp;<span class="keywordsign">'</span><span class="constructor">Kwd</span>&nbsp;<span class="string">"+"</span>;&nbsp;n2&nbsp;=&nbsp;parse_expr&nbsp;&gt;]&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;n1+n2<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;...<br>
&nbsp;&nbsp;&nbsp;</code>
</p><p>

   One should notice that the use of the <code class="code"><span class="keyword">parser</span></code> keyword and associated
   notation for streams are only available through camlp4 extensions. This
   means that one has to preprocess its sources <i>e. g.</i> by using the
   <code class="code"><span class="string">"-pp"</span></code> command-line switch of the compilers.<br>
</p><hr width="100%">
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

<div class="info">
The type of tokens. The lexical classes are: <code class="code"><span class="constructor">Int</span></code> and <code class="code"><span class="constructor">Float</span></code>
   for integer and floating-point numbers; <code class="code"><span class="constructor">String</span></code> for
   string literals, enclosed in double quotes; <code class="code"><span class="constructor">Char</span></code> for
   character literals, enclosed in single quotes; <code class="code"><span class="constructor">Ident</span></code> for
   identifiers (either sequences of letters, digits, underscores
   and quotes, or sequences of ``operator characters'' such as
   <code class="code">+</code>, <code class="code">*</code>, etc); and <code class="code"><span class="constructor">Kwd</span></code> for keywords (either identifiers or
   single ``special characters'' such as <code class="code">(</code>, <code class="code">}</code>, etc).<br>
</div>

<pre><span id="VALmake_lexer"><span class="keyword">val</span> make_lexer</span> : <code class="type">string list -&gt; char <a href="Stream.html#TYPEt">Stream.t</a> -&gt; <a href="Genlex.html#TYPEtoken">token</a> <a href="Stream.html#TYPEt">Stream.t</a></code></pre><div class="info">
Construct the lexer function. The first argument is the list of
   keywords. An identifier <code class="code">s</code> is returned as <code class="code"><span class="constructor">Kwd</span> s</code> if <code class="code">s</code>
   belongs to this list, and as <code class="code"><span class="constructor">Ident</span> s</code> otherwise.
   A special character <code class="code">s</code> is returned as <code class="code"><span class="constructor">Kwd</span> s</code> if <code class="code">s</code>
   belongs to this list, and cause a lexical error (exception
   <code class="code"><span class="constructor">Parse_error</span></code>) otherwise. Blanks and newlines are skipped.
   Comments delimited by <code class="code">(*</code> and <code class="code">*)</code> are skipped as well,
   and can be nested.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>