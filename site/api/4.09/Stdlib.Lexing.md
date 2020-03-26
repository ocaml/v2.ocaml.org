<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stdlib.Lexing</a></div><ul><li><a href="#1_Positions">Positions</a></li><li><a href="#1_Lexerbuffers">Lexer buffers</a></li><li><a href="#1_Functionsforlexersemanticactions">Functions for lexer semantic actions</a></li><li><a href="#1_Miscellaneousfunctions">Miscellaneous functions</a></li></ul></nav></header>

<h1>Module <a href="type_Stdlib.Lexing.html">Stdlib.Lexing</a></h1>

<pre><span id="MODULELexing"><span class="keyword">module</span> Lexing</span>: <code class="type"><a href="Lexing.html">Lexing</a></code></pre><hr width="100%">
<h2 id="1_Positions">Positions</h2>
<pre><code><span id="TYPEposition"><span class="keyword">type</span> <code class="type"></code>position</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTposition.pos_fname">pos_fname</span>&nbsp;: <code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTposition.pos_lnum">pos_lnum</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTposition.pos_bol">pos_bol</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTposition.pos_cnum">pos_cnum</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr></tbody></table>
}

<div class="info ">
<div class="info-desc">
<p>A value of type <code class="code">position</code> describes a point in a source file.
   <code class="code">pos_fname</code> is the file name; <code class="code">pos_lnum</code> is the line number;
   <code class="code">pos_bol</code> is the offset of the beginning of the line (number
   of characters between the beginning of the lexbuf and the beginning
   of the line); <code class="code">pos_cnum</code> is the offset of the position (number of
   characters between the beginning of the lexbuf and the position).
   The difference between <code class="code">pos_cnum</code> and <code class="code">pos_bol</code> is the character
   offset within the line (i.e. the column number, assuming each
   character is one column wide).</p>

<p>See the documentation of type <code class="code">lexbuf</code> for information about
   how the lexing engine will manage positions.</p>
</div>
</div>


<pre><span id="VALdummy_pos"><span class="keyword">val</span> dummy_pos</span> : <code class="type"><a href="Lexing.html#TYPEposition">position</a></code></pre><div class="info ">
<div class="info-desc">
<p>A value of type <code class="code">position</code>, guaranteed to be different from any
   valid position.</p>
</div>
</div>
<h2 id="1_Lexerbuffers">Lexer buffers</h2>
<pre><code><span id="TYPElexbuf"><span class="keyword">type</span> <code class="type"></code>lexbuf</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlexbuf.refill_buff">refill_buff</span>&nbsp;: <code class="type"><a href="Lexing.html#TYPElexbuf">lexbuf</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTlexbuf.lex_buffer">lex_buffer</span>&nbsp;: <code class="type">bytes</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTlexbuf.lex_buffer_len">lex_buffer_len</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTlexbuf.lex_abs_pos">lex_abs_pos</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTlexbuf.lex_start_pos">lex_start_pos</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTlexbuf.lex_curr_pos">lex_curr_pos</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTlexbuf.lex_last_pos">lex_last_pos</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTlexbuf.lex_last_action">lex_last_action</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTlexbuf.lex_eof_reached">lex_eof_reached</span>&nbsp;: <code class="type">bool</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTlexbuf.lex_mem">lex_mem</span>&nbsp;: <code class="type">int array</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTlexbuf.lex_start_p">lex_start_p</span>&nbsp;: <code class="type"><a href="Lexing.html#TYPEposition">position</a></code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTlexbuf.lex_curr_p">lex_curr_p</span>&nbsp;: <code class="type"><a href="Lexing.html#TYPEposition">position</a></code>;</code></td>

</tr></tbody></table>
}

<div class="info ">
<div class="info-desc">
<p>The type of lexer buffers. A lexer buffer is the argument passed
   to the scanning functions defined by the generated scanners.
   The lexer buffer holds the current state of the scanner, plus
   a function to refill the buffer from the input.</p>

<p>Lexers can optionally maintain the <code class="code">lex_curr_p</code> and <code class="code">lex_start_p</code>
   position fields.  This "position tracking" mode is the default, and
   it corresponds to passing <code class="code">~with_position:<span class="keyword">true</span></code> to functions that
   create lexer buffers. In this mode, the lexing engine and lexer
   actions are co-responsible for properly updating the position
   fields, as described in the next paragraph.  When the mode is
   explicitly disabled (with <code class="code">~with_position:<span class="keyword">false</span></code>), the lexing
   engine will not touch the position fields and the lexer actions
   should be careful not to do it either; the <code class="code">lex_curr_p</code> and
   <code class="code">lex_start_p</code> field will then always hold the <code class="code">dummy_pos</code> invalid
   position.  Not tracking positions avoids allocations and memory
   writes and can significantly improve the performance of the lexer
   in contexts where <code class="code">lex_start_p</code> and <code class="code">lex_curr_p</code> are not needed.</p>

<p>Position tracking mode works as follows.  At each token, the lexing
   engine will copy <code class="code">lex_curr_p</code> to <code class="code">lex_start_p</code>, then change the
   <code class="code">pos_cnum</code> field of <code class="code">lex_curr_p</code> by updating it with the number of
   characters read since the start of the <code class="code">lexbuf</code>.  The other fields
   are left unchanged by the lexing engine.  In order to keep them
   accurate, they must be initialised before the first use of the
   lexbuf, and updated by the relevant lexer actions (i.e. at each end
   of line -- see also <code class="code">new_line</code>).</p>
</div>
</div>


<pre><span id="VALfrom_channel"><span class="keyword">val</span> from_channel</span> : <code class="type">?with_positions:bool -&gt; <a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; <a href="Lexing.html#TYPElexbuf">lexbuf</a></code></pre><div class="info ">
<div class="info-desc">
<p>Create a lexer buffer on the given input channel.
   <code class="code"><span class="constructor">Lexing</span>.from_channel&nbsp;inchan</code> returns a lexer buffer which reads
   from the input channel <code class="code">inchan</code>, at the current reading position.</p>
</div>
</div>

<pre><span id="VALfrom_string"><span class="keyword">val</span> from_string</span> : <code class="type">?with_positions:bool -&gt; string -&gt; <a href="Lexing.html#TYPElexbuf">lexbuf</a></code></pre><div class="info ">
<div class="info-desc">
<p>Create a lexer buffer which reads from
   the given string. Reading starts from the first character in
   the string. An end-of-input condition is generated when the
   end of the string is reached.</p>
</div>
</div>

<pre><span id="VALfrom_function"><span class="keyword">val</span> from_function</span> : <code class="type">?with_positions:bool -&gt; (bytes -&gt; int -&gt; int) -&gt; <a href="Lexing.html#TYPElexbuf">lexbuf</a></code></pre><div class="info ">
<div class="info-desc">
<p>Create a lexer buffer with the given function as its reading method.
   When the scanner needs more characters, it will call the given
   function, giving it a byte sequence <code class="code">s</code> and a byte
   count <code class="code">n</code>. The function should put <code class="code">n</code> bytes or fewer in <code class="code">s</code>,
   starting at index 0, and return the number of bytes
   provided. A return value of 0 means end of input.</p>
</div>
</div>

<pre><span id="VALwith_positions"><span class="keyword">val</span> with_positions</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">lexbuf</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Tell whether the lexer buffer keeps track of position fields
    <code class="code">lex_curr_p</code> / <code class="code">lex_start_p</code>, as determined by the corresponding
    optional argument for functions that create lexer buffers
    (whose default value is <code class="code"><span class="keyword">true</span></code>).</p>

<p>When <code class="code">with_positions</code> is <code class="code"><span class="keyword">false</span></code>, lexer actions should not
    modify position fields.  Doing it nevertheless could
    re-enable the <code class="code">with_position</code> mode and degrade performances.</p>
</div>
</div>
<h2 id="1_Functionsforlexersemanticactions">Functions for lexer semantic actions</h2><p>The following functions can be called from the semantic actions
   of lexer definitions (the ML code enclosed in braces that
   computes the value returned by lexing functions). They give
   access to the character string matched by the regular expression
   associated with the semantic action. These functions must be
   applied to the argument <code class="code">lexbuf</code>, which, in the code generated by
   <code class="code">ocamllex</code>, is bound to the lexer buffer passed to the parsing
   function.</p>

<pre><span id="VALlexeme"><span class="keyword">val</span> lexeme</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">lexbuf</a> -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Lexing</span>.lexeme&nbsp;lexbuf</code> returns the string matched by
           the regular expression.</p>
</div>
</div>

<pre><span id="VALlexeme_char"><span class="keyword">val</span> lexeme_char</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">lexbuf</a> -&gt; int -&gt; char</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Lexing</span>.lexeme_char&nbsp;lexbuf&nbsp;i</code> returns character number <code class="code">i</code> in
   the matched string.</p>
</div>
</div>

<pre><span id="VALlexeme_start"><span class="keyword">val</span> lexeme_start</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">lexbuf</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Lexing</span>.lexeme_start&nbsp;lexbuf</code> returns the offset in the
   input stream of the first character of the matched string.
   The first character of the stream has offset 0.</p>
</div>
</div>

<pre><span id="VALlexeme_end"><span class="keyword">val</span> lexeme_end</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">lexbuf</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Lexing</span>.lexeme_end&nbsp;lexbuf</code> returns the offset in the input stream
   of the character following the last character of the matched
   string. The first character of the stream has offset 0.</p>
</div>
</div>

<pre><span id="VALlexeme_start_p"><span class="keyword">val</span> lexeme_start_p</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">lexbuf</a> -&gt; <a href="Lexing.html#TYPEposition">position</a></code></pre><div class="info ">
<div class="info-desc">
<p>Like <code class="code">lexeme_start</code>, but return a complete <code class="code">position</code> instead
    of an offset.  When position tracking is disabled, the function
    returns <code class="code">dummy_pos</code>.</p>
</div>
</div>

<pre><span id="VALlexeme_end_p"><span class="keyword">val</span> lexeme_end_p</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">lexbuf</a> -&gt; <a href="Lexing.html#TYPEposition">position</a></code></pre><div class="info ">
<div class="info-desc">
<p>Like <code class="code">lexeme_end</code>, but return a complete <code class="code">position</code> instead
    of an offset.  When position tracking is disabled, the function
    returns <code class="code">dummy_pos</code>.</p>
</div>
</div>

<pre><span id="VALnew_line"><span class="keyword">val</span> new_line</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">lexbuf</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Update the <code class="code">lex_curr_p</code> field of the lexbuf to reflect the start
    of a new line.  You can call this function in the semantic action
    of the rule that matches the end-of-line character.  The function
    does nothing when position tracking is disabled.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.11.0</li>
</ul>
</div>
<h2 id="1_Miscellaneousfunctions">Miscellaneous functions</h2>
<pre><span id="VALflush_input"><span class="keyword">val</span> flush_input</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">lexbuf</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Discard the contents of the buffer and reset the current
    position to 0.  The next use of the lexbuf will trigger a
    refill.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>