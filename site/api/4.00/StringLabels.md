<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">StringLabels</a></div><ul></ul></nav></header>

<h1>Module <a href="type_StringLabels.html">StringLabels</a></h1>
<pre><span class="keyword">module</span> StringLabels: <code class="code"><span class="keyword">sig</span></code> <a href="StringLabels.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>String operations.<br>
<hr width="100%">
<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">string -&gt; int</code></pre><div class="info">
Return the length (number of characters) of the given string.<br>
</div>
<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">string -&gt; int -&gt; char</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.get s n</code> returns character number <code class="code">n</code> in string <code class="code">s</code>.
   The first character is character number 0.
   The last character is character number <code class="code"><span class="constructor">String</span>.length s - 1</code>.
   You can also write <code class="code">s.[n]</code> instead of <code class="code"><span class="constructor">String</span>.get s n</code>.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span> <span class="string">"index out of bounds"</span></code>
   if <code class="code">n</code> is outside the range 0 to <code class="code">(<span class="constructor">String</span>.length s - 1)</code>.<br>
</p></div>
<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type">string -&gt; int -&gt; char -&gt; unit</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.set s n c</code> modifies string <code class="code">s</code> in place,
   replacing the character number <code class="code">n</code> by <code class="code">c</code>.
   You can also write <code class="code">s.[n] &lt;- c</code> instead of <code class="code"><span class="constructor">String</span>.set s n c</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span> <span class="string">"index out of bounds"</span></code>
   if <code class="code">n</code> is outside the range 0 to <code class="code">(<span class="constructor">String</span>.length s - 1)</code>.<br>
</div>
<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">int -&gt; string</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.create n</code> returns a fresh string of length <code class="code">n</code>.
   The string initially contains arbitrary characters.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n &lt; 0</code> or <code class="code">n &gt; <span class="constructor">Sys</span>.max_string_length</code>.<br>
</div>
<pre><span id="VALmake"><span class="keyword">val</span> make</span> : <code class="type">int -&gt; char -&gt; string</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.make n c</code> returns a fresh string of length <code class="code">n</code>,
   filled with the character <code class="code">c</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n &lt; 0</code> or <code class="code">n &gt; </code><a href="Sys.html#VALmax_string_length"><code class="code"><span class="constructor">Sys</span>.max_string_length</code></a>.<br>
</div>
<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Return a copy of the given string.<br>
</div>
<pre><span id="VALsub"><span class="keyword">val</span> sub</span> : <code class="type">string -&gt; pos:int -&gt; len:int -&gt; string</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.sub s start len</code> returns a fresh string of length <code class="code">len</code>,
   containing the characters number <code class="code">start</code> to <code class="code">start + len - 1</code>
   of string <code class="code">s</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">start</code> and <code class="code">len</code> do not
   designate a valid substring of <code class="code">s</code>; that is, if <code class="code">start &lt; 0</code>,
   or <code class="code">len &lt; 0</code>, or <code class="code">start + len &gt; </code><a href="StringLabels.html#VALlength"><code class="code"><span class="constructor">StringLabels</span>.length</code></a><code class="code"> s</code>.<br>
</div>
<pre><span id="VALfill"><span class="keyword">val</span> fill</span> : <code class="type">string -&gt; pos:int -&gt; len:int -&gt; char -&gt; unit</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.fill s start len c</code> modifies string <code class="code">s</code> in place,
   replacing the characters number <code class="code">start</code> to <code class="code">start + len - 1</code>
   by <code class="code">c</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">start</code> and <code class="code">len</code> do not
   designate a valid substring of <code class="code">s</code>.<br>
</div>
<pre><span id="VALblit"><span class="keyword">val</span> blit</span> : <code class="type">src:string -&gt; src_pos:int -&gt; dst:string -&gt; dst_pos:int -&gt; len:int -&gt; unit</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.blit src srcoff dst dstoff len</code> copies <code class="code">len</code> characters
   from string <code class="code">src</code>, starting at character number <code class="code">srcoff</code>, to
   string <code class="code">dst</code>, starting at character number <code class="code">dstoff</code>. It works
   correctly even if <code class="code">src</code> and <code class="code">dst</code> are the same string,
   and the source and destination chunks overlap.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">srcoff</code> and <code class="code">len</code> do not
   designate a valid substring of <code class="code">src</code>, or if <code class="code">dstoff</code> and <code class="code">len</code>
   do not designate a valid substring of <code class="code">dst</code>.<br>
</div>
<pre><span id="VALconcat"><span class="keyword">val</span> concat</span> : <code class="type">sep:string -&gt; string list -&gt; string</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.concat sep sl</code> concatenates the list of strings <code class="code">sl</code>,
   inserting the separator string <code class="code">sep</code> between each.<br>
</div>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">f:(char -&gt; unit) -&gt; string -&gt; unit</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.iter f s</code> applies function <code class="code">f</code> in turn to all
   the characters of <code class="code">s</code>.  It is equivalent to
   <code class="code">f s.[0]; f s.[1]; ...; f s.[<span class="constructor">String</span>.length s - 1]; ()</code>.<br>
</div>
<pre><span id="VALiteri"><span class="keyword">val</span> iteri</span> : <code class="type">f:(int -&gt; char -&gt; unit) -&gt; string -&gt; unit</code></pre><div class="info">
Same as <a href="String.html#VALiter"><code class="code"><span class="constructor">String</span>.iter</code></a>, but the
   function is applied to the index of the element as first argument
   (counting from 0), and the character itself as second argument.<br>
<b>Since</b> 4.00.0<br>
</div>
<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">f:(char -&gt; char) -&gt; string -&gt; string</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.map f s</code> applies function <code class="code">f</code> in turn to all
   the characters of <code class="code">s</code> and stores the results in a new string that
   is returned.<br>
<b>Since</b> 4.00.0<br>
</div>
<pre><span id="VALtrim"><span class="keyword">val</span> trim</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Return a copy of the argument, without leading and trailing whitespace.
   The characters regarded as whitespace are: <code class="code"><span class="string">' '</span></code>, <code class="code"><span class="string">'\012'</span></code>, <code class="code"><span class="string">'\n'</span></code>,
   <code class="code"><span class="string">'\r'</span></code>, and <code class="code"><span class="string">'\t'</span></code>.  If there is no whitespace character in the argument,
   return the original string itself, not a copy.<br>
<b>Since</b> 4.00.0<br>
</div>
<pre><span id="VALescaped"><span class="keyword">val</span> escaped</span> : <code class="type">string -&gt; string</code></pre><div class="info">
Return a copy of the argument, with special characters
   represented by escape sequences, following the lexical
   conventions of OCaml.  If there is no special
   character in the argument, return the original string itself,
   not a copy.<br>
</div>
<pre><span id="VALindex"><span class="keyword">val</span> index</span> : <code class="type">string -&gt; char -&gt; int</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.index s c</code> returns the position of the leftmost
   occurrence of character <code class="code">c</code> in string <code class="code">s</code>.
   Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code>.<br>
</div>
<pre><span id="VALrindex"><span class="keyword">val</span> rindex</span> : <code class="type">string -&gt; char -&gt; int</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.rindex s c</code> returns the position of the rightmost
   occurrence of character <code class="code">c</code> in string <code class="code">s</code>.
   Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code>.<br>
</div>
<pre><span id="VALindex_from"><span class="keyword">val</span> index_from</span> : <code class="type">string -&gt; int -&gt; char -&gt; int</code></pre><div class="info">
Same as <a href="StringLabels.html#VALindex"><code class="code"><span class="constructor">StringLabels</span>.index</code></a>, but start
   searching at the character position given as second argument.
   <code class="code"><span class="constructor">String</span>.index s c</code> is equivalent to <code class="code"><span class="constructor">String</span>.index_from s 0 c</code>.<br>
</div>
<pre><span id="VALrindex_from"><span class="keyword">val</span> rindex_from</span> : <code class="type">string -&gt; int -&gt; char -&gt; int</code></pre><div class="info">
Same as <a href="StringLabels.html#VALrindex"><code class="code"><span class="constructor">StringLabels</span>.rindex</code></a>, but start
   searching at the character position given as second argument.
   <code class="code"><span class="constructor">String</span>.rindex s c</code> is equivalent to
   <code class="code"><span class="constructor">String</span>.rindex_from s (<span class="constructor">String</span>.length s - 1) c</code>.<br>
</div>
<pre><span id="VALcontains"><span class="keyword">val</span> contains</span> : <code class="type">string -&gt; char -&gt; bool</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.contains s c</code> tests if character <code class="code">c</code>
   appears in the string <code class="code">s</code>.<br>
</div>
<pre><span id="VALcontains_from"><span class="keyword">val</span> contains_from</span> : <code class="type">string -&gt; int -&gt; char -&gt; bool</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.contains_from s start c</code> tests if character <code class="code">c</code>
   appears in the substring of <code class="code">s</code> starting from <code class="code">start</code> to the end
   of <code class="code">s</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">start</code> is not a valid index of <code class="code">s</code>.<br>
</div>
<pre><span id="VALrcontains_from"><span class="keyword">val</span> rcontains_from</span> : <code class="type">string -&gt; int -&gt; char -&gt; bool</code></pre><div class="info">
<code class="code"><span class="constructor">String</span>.rcontains_from s stop c</code> tests if character <code class="code">c</code>
   appears in the substring of <code class="code">s</code> starting from the beginning
   of <code class="code">s</code> to index <code class="code">stop</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">stop</code> is not a valid index of <code class="code">s</code>.<br>
</div>
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

<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="StringLabels.html#TYPEt">t</a> -&gt; <a href="StringLabels.html#TYPEt">t</a> -&gt; int</code></pre><div class="info">
The comparison function for strings, with the same specification as
    <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.  Along with the type <code class="code">t</code>, this function <code class="code">compare</code>
    allows the module <code class="code"><span class="constructor">String</span></code> to be passed as argument to the functors
    <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a> and <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>