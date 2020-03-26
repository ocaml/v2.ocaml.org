<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">String</a></div><ul></ul></nav></header>

<h1>Module <a href="type_String.html">String</a></h1>
<pre><span class="keyword">module</span> String: <code class="code"><span class="keyword">sig</span></code> <a href="String.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>String operations.
<p>

  Given a string <code class="code">s</code> of length <code class="code">l</code>, we call character number in <code class="code">s</code>
  the index of a character in <code class="code">s</code>.  Indexes start at <code class="code">0</code>, and we will
  call a character number valid in <code class="code">s</code> if it falls within the range
  <code class="code">[0...l-1]</code>. A position is the point between two characters or at
  the beginning or end of the string.  We call a position valid
  in <code class="code">s</code> if it falls within the range <code class="code">[0...l]</code>. Note that character
  number <code class="code">n</code> is between positions <code class="code">n</code> and <code class="code">n+1</code>.
</p><p>

  Two parameters <code class="code">start</code> and <code class="code">len</code> are said to designate a valid
  substring of <code class="code">s</code> if <code class="code">len &gt;= 0</code> and <code class="code">start</code> and <code class="code">start+len</code> are
  valid positions in <code class="code">s</code>.
</p><p>

  OCaml strings can be modified in place, for instance via the
  <a href="String.html#VALset"><code class="code"><span class="constructor">String</span>.set</code></a> and <a href="String.html#VALblit"><code class="code"><span class="constructor">String</span>.blit</code></a> functions described below.  This
  possibility should be used rarely and with much care, however, since
  both the OCaml compiler and most OCaml libraries share strings as if
  they were immutable, rather than copying them.  In particular,
  string literals are shared: a single copy of the string is created
  at program loading time and returned by all evaluations of the
  string literal.  Consider for example:
</p><p>

  <code class="code">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">#</span>&nbsp;<span class="keyword">let</span>&nbsp;f&nbsp;()&nbsp;=&nbsp;<span class="string">"foo"</span>;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;f&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;=&nbsp;&lt;<span class="keyword">fun</span>&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">#</span>&nbsp;(f&nbsp;()).[0]&nbsp;&lt;-&nbsp;<span class="string">'b'</span>;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;:&nbsp;unit&nbsp;=&nbsp;()<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">#</span>&nbsp;f&nbsp;();;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;:&nbsp;string&nbsp;=&nbsp;<span class="string">"boo"</span><br>
&nbsp;&nbsp;</code>
</p><p>

  Likewise, many functions from the standard library can return string
  literals or one of their string arguments.  Therefore, the returned strings
  must not be modified directly.  If mutation is absolutely necessary,
  it should be performed on a fresh copy of the string, as produced by
  <a href="String.html#VALcopy"><code class="code"><span class="constructor">String</span>.copy</code></a>.<br>
</p><hr width="100%">
<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">string -&gt; int</code></pre><div class="info">
Return the length (number of characters) of the given string.<br>
</div>
<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">string -&gt; int -&gt; char</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.get s n</code> returns character number <code class="code">n</code> in string <code class="code">s</code>.
   You can also write <code class="code">s.[n]</code> instead of <code class="code"><span class="constructor">String</span>.get s n</code>.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n</code> not a valid character number in <code class="code">s</code>.<br>
</p></div>
<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type">string -&gt; int -&gt; char -&gt; unit</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.set s n c</code> modifies string <code class="code">s</code> in place,
   replacing the character number <code class="code">n</code> by <code class="code">c</code>.
   You can also write <code class="code">s.[n] &lt;- c</code> instead of <code class="code"><span class="constructor">String</span>.set s n c</code>.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n</code> is not a valid character number in <code class="code">s</code>.<br>
</p></div>
<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">int -&gt; string</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.create n</code> returns a fresh string of length <code class="code">n</code>.
   The string initially contains arbitrary characters.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n &lt; 0</code> or <code class="code">n &gt; </code><a href="Sys.html#VALmax_string_length"><code class="code"><span class="constructor">Sys</span>.max_string_length</code></a>.<br>
</p></div>
<pre><span id="VALmake"><span class="keyword">val</span> make</span> : <code class="type">int -&gt; char -&gt; string</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.make n c</code> returns a fresh string of length <code class="code">n</code>,
   filled with the character <code class="code">c</code>.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n &lt; 0</code> or <code class="code">n &gt; </code><a href="Sys.html#VALmax_string_length"><code class="code"><span class="constructor">Sys</span>.max_string_length</code></a>.<br>
</p></div>
<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Return a copy of the given string.<br>
</div>
<pre><span id="VALsub"><span class="keyword">val</span> sub</span> : <code class="type">string -&gt; int -&gt; int -&gt; string</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.sub s start len</code> returns a fresh string of length <code class="code">len</code>,
   containing the substring of <code class="code">s</code> that starts at position <code class="code">start</code> and
   has length <code class="code">len</code>.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">start</code> and <code class="code">len</code> do not
   designate a valid substring of <code class="code">s</code>.<br>
</p></div>
<pre><span id="VALfill"><span class="keyword">val</span> fill</span> : <code class="type">string -&gt; int -&gt; int -&gt; char -&gt; unit</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.fill s start len c</code> modifies string <code class="code">s</code> in place,
   replacing <code class="code">len</code> characters by <code class="code">c</code>, starting at <code class="code">start</code>.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">start</code> and <code class="code">len</code> do not
   designate a valid substring of <code class="code">s</code>.<br>
</p></div>
<pre><span id="VALblit"><span class="keyword">val</span> blit</span> : <code class="type">string -&gt; int -&gt; string -&gt; int -&gt; int -&gt; unit</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.blit src srcoff dst dstoff len</code> copies <code class="code">len</code> characters
   from string <code class="code">src</code>, starting at character number <code class="code">srcoff</code>, to
   string <code class="code">dst</code>, starting at character number <code class="code">dstoff</code>. It works
   correctly even if <code class="code">src</code> and <code class="code">dst</code> are the same string,
   and the source and destination intervals overlap.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">srcoff</code> and <code class="code">len</code> do not
   designate a valid substring of <code class="code">src</code>, or if <code class="code">dstoff</code> and <code class="code">len</code>
   do not designate a valid substring of <code class="code">dst</code>.<br>
</p></div>
<pre><span id="VALconcat"><span class="keyword">val</span> concat</span> : <code class="type">string -&gt; string list -&gt; string</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.concat sep sl</code> concatenates the list of strings <code class="code">sl</code>,
   inserting the separator string <code class="code">sep</code> between each.<br>
</div>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">(char -&gt; unit) -&gt; string -&gt; unit</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.iter f s</code> applies function <code class="code">f</code> in turn to all
   the characters of <code class="code">s</code>.  It is equivalent to
   <code class="code">f s.[0]; f s.[1]; ...; f s.[<span class="constructor">String</span>.length s - 1]; ()</code>.<br>
</div>
<pre><span id="VALiteri"><span class="keyword">val</span> iteri</span> : <code class="type">(int -&gt; char -&gt; unit) -&gt; string -&gt; unit</code></pre><div class="info">
Same as <a href="String.html#VALiter"><code class="code"><span class="constructor">String</span>.iter</code></a>, but the
   function is applied to the index of the element as first argument
   (counting from 0), and the character itself as second argument.<br>
<b>Since</b> 4.00.0<br>
</div>
<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">(char -&gt; char) -&gt; string -&gt; string</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.map f s</code> applies function <code class="code">f</code> in turn to all
   the characters of <code class="code">s</code> and stores the results in a new string that
   is returned.<br>
<b>Since</b> 4.00.0<br>
</div>
<pre><span id="VALtrim"><span class="keyword">val</span> trim</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Return a copy of the argument, without leading and trailing
   whitespace.  The characters regarded as whitespace are: <code class="code"><span class="string">' '</span></code>,
   <code class="code"><span class="string">'\012'</span></code>, <code class="code"><span class="string">'\n'</span></code>, <code class="code"><span class="string">'\r'</span></code>, and <code class="code"><span class="string">'\t'</span></code>.  If there is no leading nor
   trailing whitespace character in the argument, return the original
   string itself, not a copy.<br>
<b>Since</b> 4.00.0<br>
</div>
<pre><span id="VALescaped"><span class="keyword">val</span> escaped</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Return a copy of the argument, with special characters
   represented by escape sequences, following the lexical
   conventions of OCaml.  If there is no special
   character in the argument, return the original string itself,
   not a copy. Its inverse function is Scanf.unescaped.<br>
</div>
<pre><span id="VALindex"><span class="keyword">val</span> index</span> : <code class="type">string -&gt; char -&gt; int</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.index s c</code> returns the character number of the first
   occurrence of character <code class="code">c</code> in string <code class="code">s</code>.
<p>

   Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code>.<br>
</p></div>
<pre><span id="VALrindex"><span class="keyword">val</span> rindex</span> : <code class="type">string -&gt; char -&gt; int</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.rindex s c</code> returns the character number of the last
   occurrence of character <code class="code">c</code> in string <code class="code">s</code>.
<p>

   Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code>.<br>
</p></div>
<pre><span id="VALindex_from"><span class="keyword">val</span> index_from</span> : <code class="type">string -&gt; int -&gt; char -&gt; int</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.index_from s i c</code> returns the character number of the
   first occurrence of character <code class="code">c</code> in string <code class="code">s</code> after position <code class="code">i</code>.
   <code class="code"><span class="constructor">String</span>.index s c</code> is equivalent to <code class="code"><span class="constructor">String</span>.index_from s 0 c</code>.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">i</code> is not a valid position in <code class="code">s</code>.
   Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code> after position <code class="code">i</code>.<br>
</p></div>
<pre><span id="VALrindex_from"><span class="keyword">val</span> rindex_from</span> : <code class="type">string -&gt; int -&gt; char -&gt; int</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.rindex_from s i c</code> returns the character number of the
   last occurrence of character <code class="code">c</code> in string <code class="code">s</code> before position <code class="code">i+1</code>.
   <code class="code"><span class="constructor">String</span>.rindex s c</code> is equivalent to
   <code class="code"><span class="constructor">String</span>.rindex_from s (<span class="constructor">String</span>.length s - 1) c</code>.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">i+1</code> is not a valid position in <code class="code">s</code>.
   Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code> before position <code class="code">i+1</code>.<br>
</p></div>
<pre><span id="VALcontains"><span class="keyword">val</span> contains</span> : <code class="type">string -&gt; char -&gt; bool</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.contains s c</code> tests if character <code class="code">c</code>
   appears in the string <code class="code">s</code>.<br>
</div>
<pre><span id="VALcontains_from"><span class="keyword">val</span> contains_from</span> : <code class="type">string -&gt; int -&gt; char -&gt; bool</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.contains_from s start c</code> tests if character <code class="code">c</code>
   appears in <code class="code">s</code> after position <code class="code">start</code>.
   <code class="code"><span class="constructor">String</span>.contains s c</code> is equivalent to
   <code class="code"><span class="constructor">String</span>.contains_from s 0 c</code>.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">start</code> is not a valid position in <code class="code">s</code>.<br>
</p></div>
<pre><span id="VALrcontains_from"><span class="keyword">val</span> rcontains_from</span> : <code class="type">string -&gt; int -&gt; char -&gt; bool</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.rcontains_from s stop c</code> tests if character <code class="code">c</code>
   appears in <code class="code">s</code> before position <code class="code">stop+1</code>.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">stop &lt; 0</code> or <code class="code">stop+1</code> is not a valid
   position in <code class="code">s</code>.<br>
</p></div>
<pre><span id="VALuppercase"><span class="keyword">val</span> uppercase</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Return a copy of the argument, with all lowercase letters
   translated to uppercase, including accented letters of the ISO
   Latin-1 (8859-1) character set.<br>
</div>
<pre><span id="VALlowercase"><span class="keyword">val</span> lowercase</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Return a copy of the argument, with all uppercase letters
   translated to lowercase, including accented letters of the ISO
   Latin-1 (8859-1) character set.<br>
</div>
<pre><span id="VALcapitalize"><span class="keyword">val</span> capitalize</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Return a copy of the argument, with the first character set to uppercase.<br>
</div>
<pre><span id="VALuncapitalize"><span class="keyword">val</span> uncapitalize</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Return a copy of the argument, with the first character set to lowercase.<br>
</div>
<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">string</code> </pre>
<div class="info">
An alias for the type of strings.<br>
</div>

<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="String.html#TYPEt">t</a> -&gt; <a href="String.html#TYPEt">t</a> -&gt; int</code></pre><div class="info">
The comparison function for strings, with the same specification as
    <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.  Along with the type <code class="code">t</code>, this function <code class="code">compare</code>
    allows the module <code class="code"><span class="constructor">String</span></code> to be passed as argument to the functors
    <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a> and <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>