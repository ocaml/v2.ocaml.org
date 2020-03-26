<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">StringLabels</a></div><ul><li><a href="#1_Iterators">Iterators</a></li></ul></nav></header>

<h1>Module <a href="type_StringLabels.html">StringLabels</a></h1>

<pre><span id="MODULEStringLabels"><span class="keyword">module</span> StringLabels</span>: <code class="code"><span class="keyword">sig</span></code> <a href="StringLabels.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>String operations.
   This module is intended to be used through <a href="StdLabels.html"><code class="code"><span class="constructor">StdLabels</span></code></a> which replaces
   <a href="Array.html"><code class="code"><span class="constructor">Array</span></code></a>, <a href="Bytes.html"><code class="code"><span class="constructor">Bytes</span></code></a>, <a href="List.html"><code class="code"><span class="constructor">List</span></code></a> and <a href="String.html"><code class="code"><span class="constructor">String</span></code></a> with their labeled counterparts</p>

<p>For example:</p>
<pre class="codepre"><code class="code">      <span class="keyword">open</span> <span class="constructor">StdLabels</span>

      <span class="keyword">let</span> to_upper = <span class="constructor">String</span>.map ~f:<span class="constructor">Char</span>.uppercase_ascii
   </code></pre></div>
</div>
<hr width="100%">

<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">string -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Return the length (number of characters) of the given string.</p>
</div>
</div>

<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">string -&gt; int -&gt; char</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.get&nbsp;s&nbsp;n</code> returns the character at index <code class="code">n</code> in string <code class="code">s</code>.
   You can also write <code class="code">s.[n]</code> instead of <code class="code"><span class="constructor">String</span>.get&nbsp;s&nbsp;n</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n</code> not a valid index in <code class="code">s</code>.</p>
</div>
</div>

<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type">bytes -&gt; int -&gt; char -&gt; unit</code></pre><div class="info ">
<div class="info-deprecated">
<span class="warning">Deprecated.</span>This is a deprecated alias of <a href="BytesLabels.html#VALset"><code class="code"><span class="constructor">BytesLabels</span>.set</code></a>.</div>
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.set&nbsp;s&nbsp;n&nbsp;c</code> modifies byte sequence <code class="code">s</code> in place,
   replacing the byte at index <code class="code">n</code> with <code class="code">c</code>.
   You can also write <code class="code">s.[n]&nbsp;&lt;-&nbsp;c</code> instead of <code class="code"><span class="constructor">String</span>.set&nbsp;s&nbsp;n&nbsp;c</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n</code> is not a valid index in <code class="code">s</code>.</p>
</div>
</div>

<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">int -&gt; bytes</code></pre><div class="info ">
<div class="info-deprecated">
<span class="warning">Deprecated.</span>This is a deprecated alias of <a href="BytesLabels.html#VALcreate"><code class="code"><span class="constructor">BytesLabels</span>.create</code></a>.</div>
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.create&nbsp;n</code> returns a fresh byte sequence of length <code class="code">n</code>.
   The sequence is uninitialized and contains arbitrary bytes.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n&nbsp;&lt;&nbsp;0</code> or <code class="code">n&nbsp;&gt;&nbsp;</code><a href="Sys.html#VALmax_string_length"><code class="code"><span class="constructor">Sys</span>.max_string_length</code></a>.</p>
</div>
</div>

<pre><span id="VALmake"><span class="keyword">val</span> make</span> : <code class="type">int -&gt; char -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.make&nbsp;n&nbsp;c</code> returns a fresh string of length <code class="code">n</code>,
   filled with the character <code class="code">c</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n&nbsp;&lt;&nbsp;0</code> or <code class="code">n&nbsp;&gt;&nbsp;</code><a href="Sys.html#VALmax_string_length"><code class="code"><span class="constructor">Sys</span>.max_string_length</code></a>.</p>
</div>
</div>

<pre><span id="VALinit"><span class="keyword">val</span> init</span> : <code class="type">int -&gt; f:(int -&gt; char) -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">init&nbsp;n&nbsp;f</code> returns a string of length <code class="code">n</code>,
    with character <code class="code">i</code> initialized to the result of <code class="code">f&nbsp;i</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n&nbsp;&lt;&nbsp;0</code> or <code class="code">n&nbsp;&gt;&nbsp;</code><a href="Sys.html#VALmax_string_length"><code class="code"><span class="constructor">Sys</span>.max_string_length</code></a>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.02.0</li>
</ul>
</div>

<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>Return a copy of the given string.</p>
</div>
</div>

<pre><span id="VALsub"><span class="keyword">val</span> sub</span> : <code class="type">string -&gt; pos:int -&gt; len:int -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.sub&nbsp;s&nbsp;start&nbsp;len</code> returns a fresh string of length <code class="code">len</code>,
   containing the substring of <code class="code">s</code> that starts at position <code class="code">start</code> and
   has length <code class="code">len</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">start</code> and <code class="code">len</code> do not
   designate a valid substring of <code class="code">s</code>.</p>
</div>
</div>

<pre><span id="VALfill"><span class="keyword">val</span> fill</span> : <code class="type">bytes -&gt; pos:int -&gt; len:int -&gt; char -&gt; unit</code></pre><div class="info ">
<div class="info-deprecated">
<span class="warning">Deprecated.</span>This is a deprecated alias of <a href="BytesLabels.html#VALfill"><code class="code"><span class="constructor">BytesLabels</span>.fill</code></a>.</div>
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.fill&nbsp;s&nbsp;start&nbsp;len&nbsp;c</code> modifies byte sequence <code class="code">s</code> in place,
   replacing <code class="code">len</code> bytes by <code class="code">c</code>, starting at <code class="code">start</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">start</code> and <code class="code">len</code> do not
   designate a valid substring of <code class="code">s</code>.</p>
</div>
</div>

<pre><span id="VALblit"><span class="keyword">val</span> blit</span> : <code class="type">src:string -&gt; src_pos:int -&gt; dst:bytes -&gt; dst_pos:int -&gt; len:int -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.blit&nbsp;src&nbsp;srcoff&nbsp;dst&nbsp;dstoff&nbsp;len</code> copies <code class="code">len</code> bytes
   from the string <code class="code">src</code>, starting at index <code class="code">srcoff</code>,
   to byte sequence <code class="code">dst</code>, starting at character number <code class="code">dstoff</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">srcoff</code> and <code class="code">len</code> do not
   designate a valid range of <code class="code">src</code>, or if <code class="code">dstoff</code> and <code class="code">len</code>
   do not designate a valid range of <code class="code">dst</code>.</p>
</div>
</div>

<pre><span id="VALconcat"><span class="keyword">val</span> concat</span> : <code class="type">sep:string -&gt; string list -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.concat&nbsp;sep&nbsp;sl</code> concatenates the list of strings <code class="code">sl</code>,
   inserting the separator string <code class="code">sep</code> between each.</p>
</div>
</div>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">f:(char -&gt; unit) -&gt; string -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.iter&nbsp;f&nbsp;s</code> applies function <code class="code">f</code> in turn to all
   the characters of <code class="code">s</code>.  It is equivalent to
   <code class="code">f&nbsp;s.[0];&nbsp;f&nbsp;s.[1];&nbsp;...;&nbsp;f&nbsp;s.[<span class="constructor">String</span>.length&nbsp;s&nbsp;-&nbsp;1];&nbsp;()</code>.</p>
</div>
</div>

<pre><span id="VALiteri"><span class="keyword">val</span> iteri</span> : <code class="type">f:(int -&gt; char -&gt; unit) -&gt; string -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="String.html#VALiter"><code class="code"><span class="constructor">String</span>.iter</code></a>, but the
   function is applied to the index of the element as first argument
   (counting from 0), and the character itself as second argument.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.00.0</li>
</ul>
</div>

<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">f:(char -&gt; char) -&gt; string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.map&nbsp;f&nbsp;s</code> applies function <code class="code">f</code> in turn to all
   the characters of <code class="code">s</code> and stores the results in a new string that
   is returned.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.00.0</li>
</ul>
</div>

<pre><span id="VALmapi"><span class="keyword">val</span> mapi</span> : <code class="type">f:(int -&gt; char -&gt; char) -&gt; string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.mapi&nbsp;f&nbsp;s</code> calls <code class="code">f</code> with each character of <code class="code">s</code> and its
    index (in increasing index order) and stores the results in a new
    string that is returned.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.02.0</li>
</ul>
</div>

<pre><span id="VALtrim"><span class="keyword">val</span> trim</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>Return a copy of the argument, without leading and trailing
   whitespace.  The characters regarded as whitespace are: <code class="code"><span class="string">'&nbsp;'</span></code>,
   <code class="code"><span class="string">'\012'</span></code>, <code class="code"><span class="string">'\n'</span></code>, <code class="code"><span class="string">'\r'</span></code>, and <code class="code"><span class="string">'\t'</span></code>.  If there is no leading nor
   trailing whitespace character in the argument, return the original
   string itself, not a copy.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.00.0</li>
</ul>
</div>

<pre><span id="VALescaped"><span class="keyword">val</span> escaped</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>Return a copy of the argument, with special characters
   represented by escape sequences, following the lexical
   conventions of OCaml.  If there is no special
   character in the argument, return the original string itself,
   not a copy. Its inverse function is Scanf.unescaped.</p>
</div>
</div>

<pre><span id="VALindex"><span class="keyword">val</span> index</span> : <code class="type">string -&gt; char -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.index&nbsp;s&nbsp;c</code> returns the index of the first
   occurrence of character <code class="code">c</code> in string <code class="code">s</code>.</p>

<p>Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code>.</p>
</div>
</div>

<pre><span id="VALindex_opt"><span class="keyword">val</span> index_opt</span> : <code class="type">string -&gt; char -&gt; int option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.index_opt&nbsp;s&nbsp;c</code> returns the index of the first
    occurrence of character <code class="code">c</code> in string <code class="code">s</code>, or
    <code class="code"><span class="constructor">None</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALrindex"><span class="keyword">val</span> rindex</span> : <code class="type">string -&gt; char -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.rindex&nbsp;s&nbsp;c</code> returns the index of the last
   occurrence of character <code class="code">c</code> in string <code class="code">s</code>.</p>

<p>Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code>.</p>
</div>
</div>

<pre><span id="VALrindex_opt"><span class="keyword">val</span> rindex_opt</span> : <code class="type">string -&gt; char -&gt; int option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.rindex_opt&nbsp;s&nbsp;c</code> returns the index of the last occurrence
    of character <code class="code">c</code> in string <code class="code">s</code>, or <code class="code"><span class="constructor">None</span></code> if <code class="code">c</code> does not occur in
    <code class="code">s</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALindex_from"><span class="keyword">val</span> index_from</span> : <code class="type">string -&gt; int -&gt; char -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.index_from&nbsp;s&nbsp;i&nbsp;c</code> returns the index of the
   first occurrence of character <code class="code">c</code> in string <code class="code">s</code> after position <code class="code">i</code>.
   <code class="code"><span class="constructor">String</span>.index&nbsp;s&nbsp;c</code> is equivalent to <code class="code"><span class="constructor">String</span>.index_from&nbsp;s&nbsp;0&nbsp;c</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">i</code> is not a valid position in <code class="code">s</code>.
   Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code> after position <code class="code">i</code>.</p>
</div>
</div>

<pre><span id="VALindex_from_opt"><span class="keyword">val</span> index_from_opt</span> : <code class="type">string -&gt; int -&gt; char -&gt; int option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.index_from_opt&nbsp;s&nbsp;i&nbsp;c</code> returns the index of the
    first occurrence of character <code class="code">c</code> in string <code class="code">s</code> after position <code class="code">i</code>
    or <code class="code"><span class="constructor">None</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code> after position <code class="code">i</code>.</p>

<p><code class="code"><span class="constructor">String</span>.index_opt&nbsp;s&nbsp;c</code> is equivalent to <code class="code"><span class="constructor">String</span>.index_from_opt&nbsp;s&nbsp;0&nbsp;c</code>.
    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">i</code> is not a valid position in <code class="code">s</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALrindex_from"><span class="keyword">val</span> rindex_from</span> : <code class="type">string -&gt; int -&gt; char -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.rindex_from&nbsp;s&nbsp;i&nbsp;c</code> returns the index of the
   last occurrence of character <code class="code">c</code> in string <code class="code">s</code> before position <code class="code">i+1</code>.
   <code class="code"><span class="constructor">String</span>.rindex&nbsp;s&nbsp;c</code> is equivalent to
   <code class="code"><span class="constructor">String</span>.rindex_from&nbsp;s&nbsp;(<span class="constructor">String</span>.length&nbsp;s&nbsp;-&nbsp;1)&nbsp;c</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">i+1</code> is not a valid position in <code class="code">s</code>.
   Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code> before position <code class="code">i+1</code>.</p>
</div>
</div>

<pre><span id="VALrindex_from_opt"><span class="keyword">val</span> rindex_from_opt</span> : <code class="type">string -&gt; int -&gt; char -&gt; int option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.rindex_from_opt&nbsp;s&nbsp;i&nbsp;c</code> returns the index of the
   last occurrence of character <code class="code">c</code> in string <code class="code">s</code> before position <code class="code">i+1</code>
   or <code class="code"><span class="constructor">None</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code> before position <code class="code">i+1</code>.</p>

<p><code class="code"><span class="constructor">String</span>.rindex_opt&nbsp;s&nbsp;c</code> is equivalent to
   <code class="code"><span class="constructor">String</span>.rindex_from_opt&nbsp;s&nbsp;(<span class="constructor">String</span>.length&nbsp;s&nbsp;-&nbsp;1)&nbsp;c</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">i+1</code> is not a valid position in <code class="code">s</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALcontains"><span class="keyword">val</span> contains</span> : <code class="type">string -&gt; char -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.contains&nbsp;s&nbsp;c</code> tests if character <code class="code">c</code>
   appears in the string <code class="code">s</code>.</p>
</div>
</div>

<pre><span id="VALcontains_from"><span class="keyword">val</span> contains_from</span> : <code class="type">string -&gt; int -&gt; char -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.contains_from&nbsp;s&nbsp;start&nbsp;c</code> tests if character <code class="code">c</code>
   appears in <code class="code">s</code> after position <code class="code">start</code>.
   <code class="code"><span class="constructor">String</span>.contains&nbsp;s&nbsp;c</code> is equivalent to
   <code class="code"><span class="constructor">String</span>.contains_from&nbsp;s&nbsp;0&nbsp;c</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">start</code> is not a valid position in <code class="code">s</code>.</p>
</div>
</div>

<pre><span id="VALrcontains_from"><span class="keyword">val</span> rcontains_from</span> : <code class="type">string -&gt; int -&gt; char -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.rcontains_from&nbsp;s&nbsp;stop&nbsp;c</code> tests if character <code class="code">c</code>
   appears in <code class="code">s</code> before position <code class="code">stop+1</code>.</p>

<p>Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">stop&nbsp;&lt;&nbsp;0</code> or <code class="code">stop+1</code> is not a valid
   position in <code class="code">s</code>.</p>
</div>
</div>

<pre><span id="VALuppercase"><span class="keyword">val</span> uppercase</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-deprecated">
<span class="warning">Deprecated.</span>Functions operating on Latin-1 character set are deprecated.</div>
<div class="info-desc">
<p>Return a copy of the argument, with all lowercase letters
   translated to uppercase, including accented letters of the ISO
   Latin-1 (8859-1) character set.</p>
</div>
</div>

<pre><span id="VALlowercase"><span class="keyword">val</span> lowercase</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-deprecated">
<span class="warning">Deprecated.</span>Functions operating on Latin-1 character set are deprecated.</div>
<div class="info-desc">
<p>Return a copy of the argument, with all uppercase letters
   translated to lowercase, including accented letters of the ISO
   Latin-1 (8859-1) character set.</p>
</div>
</div>

<pre><span id="VALcapitalize"><span class="keyword">val</span> capitalize</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-deprecated">
<span class="warning">Deprecated.</span>Functions operating on Latin-1 character set are deprecated.</div>
<div class="info-desc">
<p>Return a copy of the argument, with the first character set to uppercase,
   using the ISO Latin-1 (8859-1) character set..</p>
</div>
</div>

<pre><span id="VALuncapitalize"><span class="keyword">val</span> uncapitalize</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-deprecated">
<span class="warning">Deprecated.</span>Functions operating on Latin-1 character set are deprecated.</div>
<div class="info-desc">
<p>Return a copy of the argument, with the first character set to lowercase,
   using the ISO Latin-1 (8859-1) character set..</p>
</div>
</div>

<pre><span id="VALuppercase_ascii"><span class="keyword">val</span> uppercase_ascii</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>Return a copy of the argument, with all lowercase letters
   translated to uppercase, using the US-ASCII character set.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>

<pre><span id="VALlowercase_ascii"><span class="keyword">val</span> lowercase_ascii</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>Return a copy of the argument, with all uppercase letters
   translated to lowercase, using the US-ASCII character set.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>

<pre><span id="VALcapitalize_ascii"><span class="keyword">val</span> capitalize_ascii</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>Return a copy of the argument, with the first character set to uppercase,
   using the US-ASCII character set.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>

<pre><span id="VALuncapitalize_ascii"><span class="keyword">val</span> uncapitalize_ascii</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>Return a copy of the argument, with the first character set to lowercase,
   using the US-ASCII character set.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">string</code> </pre>
<div class="info ">
<div class="info-desc">
<p>An alias for the type of strings.</p>
</div>
</div>


<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="StringLabels.html#TYPEt">t</a> -&gt; <a href="StringLabels.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>The comparison function for strings, with the same specification as
    <a href="Stdlib.html#VALcompare"><code class="code">compare</code></a>.  Along with the type <code class="code">t</code>, this function <code class="code">compare</code>
    allows the module <code class="code"><span class="constructor">String</span></code> to be passed as argument to the functors
    <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a> and <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.</p>
</div>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type"><a href="StringLabels.html#TYPEt">t</a> -&gt; <a href="StringLabels.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>The equal function for strings.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>

<pre><span id="VALsplit_on_char"><span class="keyword">val</span> split_on_char</span> : <code class="type">sep:char -&gt; string -&gt; string list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.split_on_char&nbsp;sep&nbsp;s</code> returns the list of all (possibly empty)
    substrings of <code class="code">s</code> that are delimited by the <code class="code">sep</code> character.</p>

<p>The function's output is specified by the following invariants:</p>

<ul>
<li>The list is not empty.</li>
<li>Concatenating its elements using <code class="code">sep</code> as a separator returns a
      string equal to the input (<code class="code"><span class="constructor">String</span>.concat&nbsp;(<span class="constructor">String</span>.make&nbsp;1&nbsp;sep)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">String</span>.split_on_char&nbsp;sep&nbsp;s)&nbsp;=&nbsp;s</code>).</li>
<li>No string in the result contains the <code class="code">sep</code> character.</li>
</ul>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05.0</li>
</ul>
</div>
<h2 id="1_Iterators">Iterators</h2>
<pre><span id="VALto_seq"><span class="keyword">val</span> to_seq</span> : <code class="type"><a href="StringLabels.html#TYPEt">t</a> -&gt; char <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Iterate on the string, in increasing index order. Modifications of the
    string during iteration will be reflected in the iterator.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALto_seqi"><span class="keyword">val</span> to_seqi</span> : <code class="type"><a href="StringLabels.html#TYPEt">t</a> -&gt; (int * char) <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Iterate on the string, in increasing order, yielding indices along chars</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<pre><span id="VALof_seq"><span class="keyword">val</span> of_seq</span> : <code class="type">char <a href="Seq.html#TYPEt">Seq.t</a> -&gt; <a href="StringLabels.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Create a string from the generator</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.07</li>
</ul>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>