<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Printf</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Printf.html">Printf</a></h1>

<pre><span class="keyword">module</span> Printf: <code class="code"><span class="keyword">sig</span></code> <a href="Printf.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Formatted output functions.<br>
</div>
<hr width="100%">

<pre><span id="VALfprintf"><span class="keyword">val</span> fprintf</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt;<br>       ('a, <a href="Pervasives.html#TYPEout_channel">out_channel</a>, unit) <a href="Pervasives.html#TYPEformat">format</a> -&gt; 'a</code></pre><div class="info ">
<code class="code">fprintf&nbsp;outchan&nbsp;format&nbsp;arg1&nbsp;...&nbsp;argN</code> formats the arguments
   <code class="code">arg1</code> to <code class="code">argN</code> according to the format string <code class="code">format</code>, and
   outputs the resulting string on the channel <code class="code">outchan</code>.
<p>

   The format string is a character string which contains two types of
   objects: plain characters, which are simply copied to the output
   channel, and conversion specifications, each of which causes
   conversion and printing of arguments.
</p><p>

   Conversion specifications have the following form:
</p><p>

   <code class="code">%&nbsp;[flags]&nbsp;[width]&nbsp;[.precision]&nbsp;<span class="keyword">type</span></code>
</p><p>

   In short, a conversion specification consists in the <code class="code">%</code> character,
   followed by optional modifiers and a type which is made of one or
   two characters.
</p><p>

   The types and their meanings are:
</p><p>
</p><ul>
<li><code class="code">d</code>, <code class="code">i</code>: convert an integer argument to signed decimal.</li>
<li><code class="code">u</code>, <code class="code">n</code>, <code class="code">l</code>, <code class="code"><span class="constructor">L</span></code>, or <code class="code"><span class="constructor">N</span></code>: convert an integer argument to
     unsigned decimal.  Warning: <code class="code">n</code>, <code class="code">l</code>, <code class="code"><span class="constructor">L</span></code>, and <code class="code"><span class="constructor">N</span></code> are
     used for <code class="code">scanf</code>, and should not be used for <code class="code">printf</code>.</li>
<li><code class="code">x</code>: convert an integer argument to unsigned hexadecimal,
     using lowercase letters.</li>
<li><code class="code"><span class="constructor">X</span></code>: convert an integer argument to unsigned hexadecimal,
     using uppercase letters.</li>
<li><code class="code">o</code>: convert an integer argument to unsigned octal.</li>
<li><code class="code">s</code>: insert a string argument.</li>
<li><code class="code"><span class="constructor">S</span></code>: convert a string argument to OCaml syntax (double quotes, escapes).</li>
<li><code class="code">c</code>: insert a character argument.</li>
<li><code class="code"><span class="constructor">C</span></code>: convert a character argument to OCaml syntax
     (single quotes, escapes).</li>
<li><code class="code">f</code>: convert a floating-point argument to decimal notation,
     in the style <code class="code">dddd.ddd</code>.</li>
<li><code class="code"><span class="constructor">F</span></code>: convert a floating-point argument to OCaml syntax (<code class="code">dddd.</code>
     or <code class="code">dddd.ddd</code> or <code class="code">d.ddd&nbsp;e+-dd</code>).</li>
<li><code class="code">e</code> or <code class="code"><span class="constructor">E</span></code>: convert a floating-point argument to decimal notation,
     in the style <code class="code">d.ddd&nbsp;e+-dd</code> (mantissa and exponent).</li>
<li><code class="code">g</code> or <code class="code"><span class="constructor">G</span></code>: convert a floating-point argument to decimal notation,
     in style <code class="code">f</code> or <code class="code">e</code>, <code class="code"><span class="constructor">E</span></code> (whichever is more compact).</li>
<li><code class="code">h</code> or <code class="code"><span class="constructor">H</span></code>: convert a floating-point argument to hexadecimal notation,
     in the style <code class="code">0xh.hhhh&nbsp;e+-dd</code> (hexadecimal mantissa, exponent in
     decimal and denotes a power of 2).</li>
<li><code class="code"><span class="constructor">B</span></code>: convert a boolean argument to the string <code class="code"><span class="keyword">true</span></code> or <code class="code"><span class="keyword">false</span></code></li>
<li><code class="code">b</code>: convert a boolean argument (deprecated; do not use in new
     programs).</li>
<li><code class="code">ld</code>, <code class="code">li</code>, <code class="code">lu</code>, <code class="code">lx</code>, <code class="code">lX</code>, <code class="code">lo</code>: convert an <code class="code">int32</code> argument to
     the format specified by the second letter (decimal, hexadecimal, etc).</li>
<li><code class="code">nd</code>, <code class="code">ni</code>, <code class="code">nu</code>, <code class="code">nx</code>, <code class="code">nX</code>, <code class="code">no</code>: convert a <code class="code">nativeint</code> argument to
     the format specified by the second letter.</li>
<li><code class="code"><span class="constructor">Ld</span></code>, <code class="code"><span class="constructor">Li</span></code>, <code class="code"><span class="constructor">Lu</span></code>, <code class="code"><span class="constructor">Lx</span></code>, <code class="code"><span class="constructor">LX</span></code>, <code class="code"><span class="constructor">Lo</span></code>: convert an <code class="code">int64</code> argument to
     the format specified by the second letter.</li>
<li><code class="code">a</code>: user-defined printer. Take two arguments and apply the
     first one to <code class="code">outchan</code> (the current output channel) and to the
     second argument. The first argument must therefore have type
     <code class="code">out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit</code> and the second <code class="code"><span class="keywordsign">'</span>b</code>.
     The output produced by the function is inserted in the output of
     <code class="code">fprintf</code> at the current point.</li>
<li><code class="code">t</code>: same as <code class="code">%a</code>, but take only one argument (with type
     <code class="code">out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit</code>) and apply it to <code class="code">outchan</code>.</li>
<li><code class="code">{&nbsp;fmt&nbsp;%}</code>: convert a format string argument to its type digest.
     The argument must have the same type as the internal format string
     <code class="code">fmt</code>.</li>
<li><code class="code">(&nbsp;fmt&nbsp;%)</code>: format string substitution. Take a format string
     argument and substitute it to the internal format string <code class="code">fmt</code>
     to print following arguments. The argument must have the same
     type as the internal format string <code class="code">fmt</code>.</li>
<li><code class="code">!</code>: take no argument and flush the output.</li>
<li><code class="code">%</code>: take no argument and output one <code class="code">%</code> character.</li>
<li><code class="code">@</code>: take no argument and output one <code class="code">@</code> character.</li>
<li><code class="code">,</code>: take no argument and output nothing: a no-op delimiter for
     conversion specifications.</li>
</ul>

   The optional <code class="code">flags</code> are:<ul>
<li><code class="code">-</code>: left-justify the output (default is right justification).</li>
<li><code class="code">0</code>: for numerical conversions, pad with zeroes instead of spaces.</li>
<li><code class="code">+</code>: for signed numerical conversions, prefix number with a <code class="code">+</code>
     sign if positive.</li>
<li>space: for signed numerical conversions, prefix number with a
     space if positive.</li>
<li><code class="code"><span class="keywordsign">#</span></code>: request an alternate formatting style for the hexadecimal
     and octal integer types (<code class="code">x</code>, <code class="code"><span class="constructor">X</span></code>, <code class="code">o</code>, <code class="code">lx</code>, <code class="code">lX</code>, <code class="code">lo</code>, <code class="code"><span class="constructor">Lx</span></code>,
     <code class="code"><span class="constructor">LX</span></code>, <code class="code"><span class="constructor">Lo</span></code>).</li>
</ul>

   The optional <code class="code">width</code> is an integer indicating the minimal
   width of the result. For instance, <code class="code">%6d</code> prints an integer,
   prefixing it with spaces to fill at least 6 characters.
<p>

   The optional <code class="code">precision</code> is a dot <code class="code">.</code> followed by an integer
   indicating how many digits follow the decimal point in the <code class="code">%f</code>,
   <code class="code">%e</code>, and <code class="code">%<span class="constructor">E</span></code> conversions. For instance, <code class="code">%.4f</code> prints a <code class="code">float</code> with
   4 fractional digits.
</p><p>

   The integer in a <code class="code">width</code> or <code class="code">precision</code> can also be specified as
   <code class="code">*</code>, in which case an extra integer argument is taken to specify
   the corresponding <code class="code">width</code> or <code class="code">precision</code>. This integer argument
   precedes immediately the argument to print.
   For instance, <code class="code">%.*f</code> prints a <code class="code">float</code> with as many fractional
   digits as the value of the argument given before the float.<br>
</p></div>

<pre><span id="VALprintf"><span class="keyword">val</span> printf</span> : <code class="type">('a, <a href="Pervasives.html#TYPEout_channel">out_channel</a>, unit) <a href="Pervasives.html#TYPEformat">format</a> -&gt; 'a</code></pre><div class="info ">
Same as <a href="Printf.html#VALfprintf"><code class="code"><span class="constructor">Printf</span>.fprintf</code></a>, but output on <code class="code">stdout</code>.<br>
</div>

<pre><span id="VALeprintf"><span class="keyword">val</span> eprintf</span> : <code class="type">('a, <a href="Pervasives.html#TYPEout_channel">out_channel</a>, unit) <a href="Pervasives.html#TYPEformat">format</a> -&gt; 'a</code></pre><div class="info ">
Same as <a href="Printf.html#VALfprintf"><code class="code"><span class="constructor">Printf</span>.fprintf</code></a>, but output on <code class="code">stderr</code>.<br>
</div>

<pre><span id="VALsprintf"><span class="keyword">val</span> sprintf</span> : <code class="type">('a, unit, string) <a href="Pervasives.html#TYPEformat">format</a> -&gt; 'a</code></pre><div class="info ">
Same as <a href="Printf.html#VALfprintf"><code class="code"><span class="constructor">Printf</span>.fprintf</code></a>, but instead of printing on an output channel,
   return a string containing the result of formatting the arguments.<br>
</div>

<pre><span id="VALbprintf"><span class="keyword">val</span> bprintf</span> : <code class="type"><a href="Buffer.html#TYPEt">Buffer.t</a> -&gt; ('a, <a href="Buffer.html#TYPEt">Buffer.t</a>, unit) <a href="Pervasives.html#TYPEformat">format</a> -&gt; 'a</code></pre><div class="info ">
Same as <a href="Printf.html#VALfprintf"><code class="code"><span class="constructor">Printf</span>.fprintf</code></a>, but instead of printing on an output channel,
   append the formatted arguments to the given extensible buffer
   (see module <a href="Buffer.html"><code class="code"><span class="constructor">Buffer</span></code></a>).<br>
</div>

<pre><span id="VALifprintf"><span class="keyword">val</span> ifprintf</span> : <code class="type">'b -&gt; ('a, 'b, 'c, unit) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'a</code></pre><div class="info ">
Same as <a href="Printf.html#VALfprintf"><code class="code"><span class="constructor">Printf</span>.fprintf</code></a>, but does not print anything.
    Useful to ignore some material when conditionally printing.<br>
<b>Since</b> 3.10.0<br>
</div>
<br>
Formatted output functions with continuations.<br>

<pre><span id="VALkfprintf"><span class="keyword">val</span> kfprintf</span> : <code class="type">(<a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; 'd) -&gt;<br>       <a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt;<br>       ('a, <a href="Pervasives.html#TYPEout_channel">out_channel</a>, unit, 'd) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'a</code></pre><div class="info ">
Same as <code class="code">fprintf</code>, but instead of returning immediately,
   passes the out channel to its first argument at the end of printing.<br>
<b>Since</b> 3.09.0<br>
</div>

<pre><span id="VALikfprintf"><span class="keyword">val</span> ikfprintf</span> : <code class="type">('b -&gt; 'd) -&gt; 'b -&gt; ('a, 'b, 'c, 'd) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'a</code></pre><div class="info ">
Same as <code class="code">kfprintf</code> above, but does not print anything.
   Useful to ignore some material when conditionally printing.<br>
<b>Since</b> 4.01.0<br>
</div>

<pre><span id="VALksprintf"><span class="keyword">val</span> ksprintf</span> : <code class="type">(string -&gt; 'd) -&gt; ('a, unit, string, 'd) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'a</code></pre><div class="info ">
Same as <code class="code">sprintf</code> above, but instead of returning the string,
   passes it to the first argument.<br>
<b>Since</b> 3.09.0<br>
</div>

<pre><span id="VALkbprintf"><span class="keyword">val</span> kbprintf</span> : <code class="type">(<a href="Buffer.html#TYPEt">Buffer.t</a> -&gt; 'd) -&gt;<br>       <a href="Buffer.html#TYPEt">Buffer.t</a> -&gt; ('a, <a href="Buffer.html#TYPEt">Buffer.t</a>, unit, 'd) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'a</code></pre><div class="info ">
Same as <code class="code">bprintf</code>, but instead of returning immediately,
   passes the buffer to its first argument at the end of printing.<br>
<b>Since</b> 3.10.0<br>
</div>
<br>
Deprecated<br>

<pre><span id="VALkprintf"><span class="keyword">val</span> kprintf</span> : <code class="type">(string -&gt; 'b) -&gt; ('a, unit, string, 'b) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'a</code></pre><div class="info ">
A deprecated synonym for <code class="code">ksprintf</code>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>