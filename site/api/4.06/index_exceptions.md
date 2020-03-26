<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Index of exceptions</a></div><ul></ul></nav></header>

<h1>Index of exceptions</h1>
<table>
<tbody><tr><td align="left"><div>A</div></td></tr>
<tr><td><a href="Location.html#EXCEPTIONAlready_displayed_error">Already_displayed_error</a> [<a href="Location.html">Location</a>]</td>
<td></td></tr>
<tr><td align="left"><div>B</div></td></tr>
<tr><td><a href="Arg.html#EXCEPTIONBad">Bad</a> [<a href="Arg.html">Arg</a>]</td>
<td><div class="info">
<p>Functions in <code class="code">spec</code> or <code class="code">anon_fun</code> can raise <code class="code"><span class="constructor">Arg</span>.<span class="constructor">Bad</span></code> with an error
    message to reject invalid arguments.</p>

</div>
</td></tr>
<tr><td><a href="Sys.html#EXCEPTIONBreak">Break</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
<p>Exception raised on interactive interrupt if <a href="Sys.html#VALcatch_break"><code class="code"><span class="constructor">Sys</span>.catch_break</code></a>
   is on.</p>

</div>
</td></tr>
<tr><td align="left"><div>E</div></td></tr>
<tr><td><a href="Stack.html#EXCEPTIONEmpty">Empty</a> [<a href="Stack.html">Stack</a>]</td>
<td><div class="info">
<p>Raised when <a href="Stack.html#VALpop"><code class="code"><span class="constructor">Stack</span>.pop</code></a> or <a href="Stack.html#VALtop"><code class="code"><span class="constructor">Stack</span>.top</code></a> is applied to an empty stack.</p>

</div>
</td></tr>
<tr><td><a href="Queue.html#EXCEPTIONEmpty">Empty</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
<p>Raised when <a href="Queue.html#VALtake"><code class="code"><span class="constructor">Queue</span>.take</code></a> or <a href="Queue.html#VALpeek"><code class="code"><span class="constructor">Queue</span>.peek</code></a> is applied to an empty queue.</p>

</div>
</td></tr>
<tr><td><a href="Typemod.html#EXCEPTIONError">Error</a> [<a href="Typemod.html">Typemod</a>]</td>
<td></td></tr>
<tr><td><a href="Syntaxerr.html#EXCEPTIONError">Error</a> [<a href="Syntaxerr.html">Syntaxerr</a>]</td>
<td></td></tr>
<tr><td><a href="Stream.html#EXCEPTIONError">Error</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
<p>Raised by parsers when the first component of a stream pattern is
   accepted, but one of the following components is rejected.</p>

</div>
</td></tr>
<tr><td><a href="Pparse.html#EXCEPTIONError">Error</a> [<a href="Pparse.html">Pparse</a>]</td>
<td></td></tr>
<tr><td><a href="Location.html#EXCEPTIONError">Error</a> [<a href="Location.html">Location</a>]</td>
<td></td></tr>
<tr><td><a href="Lexer.html#EXCEPTIONError">Error</a> [<a href="Lexer.html">Lexer</a>]</td>
<td></td></tr>
<tr><td><a href="Dynlink.html#EXCEPTIONError">Error</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
<p>Errors in dynamic linking are reported by raising the <code class="code"><span class="constructor">Error</span></code>
    exception with a description of the error.</p>

</div>
</td></tr>
<tr><td><a href="Attr_helper.html#EXCEPTIONError">Error</a> [<a href="Attr_helper.html">Attr_helper</a>]</td>
<td></td></tr>
<tr><td><a href="Typemod.html#EXCEPTIONError_forward">Error_forward</a> [<a href="Typemod.html">Typemod</a>]</td>
<td></td></tr>
<tr><td><a href="Warnings.html#EXCEPTIONErrors">Errors</a> [<a href="Warnings.html">Warnings</a>]</td>
<td></td></tr>
<tr><td><a href="Syntaxerr.html#EXCEPTIONEscape_error">Escape_error</a> [<a href="Syntaxerr.html">Syntaxerr</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#EXCEPTIONExit">Exit</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<p>The <code class="code"><span class="constructor">Exit</span></code> exception is not raised by any library function.</p>

</div>
</td></tr>
<tr><td align="left"><div>F</div></td></tr>
<tr><td><a href="Stream.html#EXCEPTIONFailure">Failure</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
<p>Raised by parsers when none of the first components of the stream
   patterns is accepted.</p>

</div>
</td></tr>
<tr><td><a href="Misc.html#EXCEPTIONFatal_error">Fatal_error</a> [<a href="Misc.html">Misc</a>]</td>
<td></td></tr>
<tr><td align="left"><div>G</div></td></tr>
<tr><td><a href="Graphics.html#EXCEPTIONGraphic_failure">Graphic_failure</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<p>Raised by the functions below when they encounter an error.</p>

</div>
</td></tr>
<tr><td align="left"><div>H</div></td></tr>
<tr><td><a href="Arg.html#EXCEPTIONHelp">Help</a> [<a href="Arg.html">Arg</a>]</td>
<td><div class="info">
<p>Raised by <code class="code"><span class="constructor">Arg</span>.parse_argv</code> when the user asks for help.</p>

</div>
</td></tr>
<tr><td><a href="Misc.html#EXCEPTIONHookExnWrapper">HookExnWrapper</a> [<a href="Misc.html">Misc</a>]</td>
<td><div class="info">
<p>An exception raised by a hook will be wrapped into a
        <code class="code"><span class="constructor">HookExnWrapper</span></code> constructor by the hook machinery.</p>

</div>
</td></tr>
<tr><td align="left"><div>I</div></td></tr>
<tr><td><a href="Consistbl.html#EXCEPTIONInconsistency">Inconsistency</a> [<a href="Consistbl.html">Consistbl</a>]</td>
<td></td></tr>
<tr><td align="left"><div>N</div></td></tr>
<tr><td><a href="Consistbl.html#EXCEPTIONNot_available">Not_available</a> [<a href="Consistbl.html">Consistbl</a>]</td>
<td></td></tr>
<tr><td align="left"><div>P</div></td></tr>
<tr><td><a href="Parsing.html#EXCEPTIONParse_error">Parse_error</a> [<a href="Parsing.html">Parsing</a>]</td>
<td><div class="info">
<p>Raised when a parser encounters a syntax error.</p>

</div>
</td></tr>
<tr><td align="left"><div>S</div></td></tr>
<tr><td><a href="Scanf.html#EXCEPTIONScan_failure">Scan_failure</a> [<a href="Scanf.html">Scanf</a>]</td>
<td><div class="info">
<p>When the input can not be read according to the format string
    specification, formatted input functions typically raise exception
    <code class="code"><span class="constructor">Scan_failure</span></code>.</p>

</div>
</td></tr>
<tr><td align="left"><div>U</div></td></tr>
<tr><td><a href="Lazy.html#EXCEPTIONUndefined">Undefined</a> [<a href="Lazy.html">Lazy</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalLazy.html#EXCEPTIONUndefined">Undefined</a> [<a href="CamlinternalLazy.html">CamlinternalLazy</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#EXCEPTIONUnix_error">Unix_error</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<p>Raised by the system calls below when an error is encountered.</p>

</div>
</td></tr>
<tr><td><a href="Unix.html#EXCEPTIONUnix_error">Unix_error</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<p>Raised by the system calls below when an error is encountered.</p>

</div>
</td></tr>
</tbody></table>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>