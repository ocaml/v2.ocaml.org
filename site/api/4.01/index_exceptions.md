<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Index of exceptions</a></div><ul></ul></nav></header>

<h1>Index of exceptions</h1>
<table>
<tbody><tr><td align="left"><br>B</td></tr>
<tr><td><a href="Arg.html#EXCEPTIONBad">Bad</a> [<a href="Arg.html">Arg</a>]</td>
<td><div class="info">
Functions in <code class="code">spec</code> or <code class="code">anon_fun</code> can raise <code class="code"><span class="constructor">Arg</span>.<span class="constructor">Bad</span></code> with an error
    message to reject invalid arguments.
</div>
</td></tr>
<tr><td><a href="Sys.html#EXCEPTIONBreak">Break</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Exception raised on interactive interrupt if <a href="Sys.html#VALcatch_break"><code class="code"><span class="constructor">Sys</span>.catch_break</code></a>
   is on.
</div>
</td></tr>
<tr><td align="left"><br>E</td></tr>
<tr><td><a href="Stack.html#EXCEPTIONEmpty">Empty</a> [<a href="Stack.html">Stack</a>]</td>
<td><div class="info">
Raised when <a href="Stack.html#VALpop"><code class="code"><span class="constructor">Stack</span>.pop</code></a> or <a href="Stack.html#VALtop"><code class="code"><span class="constructor">Stack</span>.top</code></a> is applied to an empty stack.
</div>
</td></tr>
<tr><td><a href="Queue.html#EXCEPTIONEmpty">Empty</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
Raised when <a href="Queue.html#VALtake"><code class="code"><span class="constructor">Queue</span>.take</code></a> or <a href="Queue.html#VALpeek"><code class="code"><span class="constructor">Queue</span>.peek</code></a> is applied to an empty queue.
</div>
</td></tr>
<tr><td><a href="Stream.html#EXCEPTIONError">Error</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
Raised by parsers when the first component of a stream pattern is
   accepted, but one of the following components is rejected.
</div>
</td></tr>
<tr><td><a href="Dynlink.html#EXCEPTIONError">Error</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
Errors in dynamic linking are reported by raising the <code class="code"><span class="constructor">Error</span></code>
    exception with a description of the error.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#EXCEPTIONExit">Exit</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
The <code class="code"><span class="constructor">Exit</span></code> exception is not raised by any library function.
</div>
</td></tr>
<tr><td align="left"><br>F</td></tr>
<tr><td><a href="Stream.html#EXCEPTIONFailure">Failure</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
Raised by parsers when none of the first components of the stream
   patterns is accepted.
</div>
</td></tr>
<tr><td align="left"><br>G</td></tr>
<tr><td><a href="Graphics.html#EXCEPTIONGraphic_failure">Graphic_failure</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Raised by the functions below when they encounter an error.
</div>
</td></tr>
<tr><td align="left"><br>H</td></tr>
<tr><td><a href="Arg.html#EXCEPTIONHelp">Help</a> [<a href="Arg.html">Arg</a>]</td>
<td><div class="info">
Raised by <code class="code"><span class="constructor">Arg</span>.parse_argv</code> when the user asks for help.
</div>
</td></tr>
<tr><td align="left"><br>P</td></tr>
<tr><td><a href="Parsing.html#EXCEPTIONParse_error">Parse_error</a> [<a href="Parsing.html">Parsing</a>]</td>
<td><div class="info">
Raised when a parser encounters a syntax error.
</div>
</td></tr>
<tr><td align="left"><br>S</td></tr>
<tr><td><a href="Scanf.html#EXCEPTIONScan_failure">Scan_failure</a> [<a href="Scanf.html">Scanf</a>]</td>
<td><div class="info">
The exception that formatted input functions raise when the input cannot
    be read according to the given format.
</div>
</td></tr>
<tr><td align="left"><br>U</td></tr>
<tr><td><a href="Lazy.html#EXCEPTIONUndefined">Undefined</a> [<a href="Lazy.html">Lazy</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalLazy.html#EXCEPTIONUndefined">Undefined</a> [<a href="CamlinternalLazy.html">CamlinternalLazy</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#EXCEPTIONUnix_error">Unix_error</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Raised by the system calls below when an error is encountered.
</div>
</td></tr>
<tr><td><a href="Unix.html#EXCEPTIONUnix_error">Unix_error</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Raised by the system calls below when an error is encountered.
</div>
</td></tr>
</tbody></table>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>