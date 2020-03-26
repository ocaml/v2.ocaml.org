<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Str</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Str.html">Str</a></h1>
<pre><span class="keyword">module</span> Str: <code class="code"><span class="keyword">sig</span></code> <a href="Str.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>Regular expressions and high-level string processing<br>
<hr width="100%">
<br>
<span id="6_Regularexpressions"><h6>Regular expressions</h6></span><br>
<pre><span id="TYPEregexp"><span class="keyword">type</span> <code class="type"></code>regexp</span> </pre>
<div class="info">
The type of compiled regular expressions.<br>
</div>

<pre><span id="VALregexp"><span class="keyword">val</span> regexp</span> : <code class="type">string -&gt; <a href="Str.html#TYPEregexp">regexp</a></code></pre><div class="info">
Compile a regular expression. The following constructs are
    recognized:<ul>
<li><code class="code">.     </code> Matches any character except newline.</li>
<li><code class="code">*     </code> (postfix) Matches the preceding expression zero, one or
              several times</li>
<li><code class="code">+     </code> (postfix) Matches the preceding expression one or
              several times</li>
<li><code class="code">?     </code> (postfix) Matches the preceding expression once or
              not at all</li>
<li><code class="code">[..]  </code> Character set. Ranges are denoted with <code class="code">-</code>, as in <code class="code">[a-z]</code>.
              An initial <code class="code">^</code>, as in <code class="code">[^0-9]</code>, complements the set.
              To include a <code class="code">]</code> character in a set, make it the first
              character of the set. To include a <code class="code">-</code> character in a set,
              make it the first or the last character of the set.</li>
<li><code class="code">^     </code> Matches at beginning of line (either at the beginning of
              the matched string, or just after a newline character).</li>
<li><code class="code">$     </code> Matches at end of line (either at the end of the matched
              string, or just before a newline character).</li>
<li><code class="code">\|    </code> (infix) Alternative between two expressions.</li>
<li><code class="code">\(..\)</code> Grouping and naming of the enclosed expression.</li>
<li><code class="code">\1    </code> The text matched by the first <code class="code">\(...\)</code> expression
     (<code class="code">\2</code> for the second expression, and so on up to <code class="code">\9</code>).</li>
<li><code class="code">\b    </code> Matches word boundaries.</li>
<li><code class="code">\     </code> Quotes special characters.  The special characters
              are <code class="code">$^.*+?[]</code>.</li>
</ul>
<br>
</div>
<pre><span id="VALregexp_case_fold"><span class="keyword">val</span> regexp_case_fold</span> : <code class="type">string -&gt; <a href="Str.html#TYPEregexp">regexp</a></code></pre><div class="info">
Same as <code class="code">regexp</code>, but the compiled expression will match text
    in a case-insensitive way: uppercase and lowercase letters will
    be considered equivalent.<br>
</div>
<pre><span id="VALquote"><span class="keyword">val</span> quote</span> : <code class="type">string -&gt; string</code></pre><div class="info">
<code class="code"><span class="constructor">Str</span>.quote s</code> returns a regexp string that matches exactly
   <code class="code">s</code> and nothing else.<br>
</div>
<pre><span id="VALregexp_string"><span class="keyword">val</span> regexp_string</span> : <code class="type">string -&gt; <a href="Str.html#TYPEregexp">regexp</a></code></pre><div class="info">
<code class="code"><span class="constructor">Str</span>.regexp_string s</code> returns a regular expression
   that matches exactly <code class="code">s</code> and nothing else.<br>
</div>
<pre><span id="VALregexp_string_case_fold"><span class="keyword">val</span> regexp_string_case_fold</span> : <code class="type">string -&gt; <a href="Str.html#TYPEregexp">regexp</a></code></pre><div class="info">
<code class="code"><span class="constructor">Str</span>.regexp_string_case_fold</code> is similar to <a href="Str.html#VALregexp_string"><code class="code"><span class="constructor">Str</span>.regexp_string</code></a>,
   but the regexp matches in a case-insensitive way.<br>
</div>
<br>
<span id="6_Stringmatchingandsearching"><h6>String matching and searching</h6></span><br>
<pre><span id="VALstring_match"><span class="keyword">val</span> string_match</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; string -&gt; int -&gt; bool</code></pre><div class="info">
<code class="code">string_match r s start</code> tests whether a substring of <code class="code">s</code> that
   starts at position <code class="code">start</code> matches the regular expression <code class="code">r</code>.
   The first character of a string has position <code class="code">0</code>, as usual.<br>
</div>
<pre><span id="VALsearch_forward"><span class="keyword">val</span> search_forward</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; string -&gt; int -&gt; int</code></pre><div class="info">
<code class="code">search_forward r s start</code> searches the string <code class="code">s</code> for a substring
   matching the regular expression <code class="code">r</code>. The search starts at position
   <code class="code">start</code> and proceeds towards the end of the string.
   Return the position of the first character of the matched
   substring, or raise <code class="code"><span class="constructor">Not_found</span></code> if no substring matches.<br>
</div>
<pre><span id="VALsearch_backward"><span class="keyword">val</span> search_backward</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; string -&gt; int -&gt; int</code></pre><div class="info">
<code class="code">search_backward r s last</code> searches the string <code class="code">s</code> for a
  substring matching the regular expression <code class="code">r</code>. The search first
  considers substrings that start at position <code class="code">last</code> and proceeds
  towards the beginning of string. Return the position of the first
  character of the matched substring; raise <code class="code"><span class="constructor">Not_found</span></code> if no
  substring matches.<br>
</div>
<pre><span id="VALstring_partial_match"><span class="keyword">val</span> string_partial_match</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; string -&gt; int -&gt; bool</code></pre><div class="info">
Similar to <a href="Str.html#VALstring_match"><code class="code"><span class="constructor">Str</span>.string_match</code></a>, but also returns true if
   the argument string is a prefix of a string that matches.
   This includes the case of a true complete match.<br>
</div>
<pre><span id="VALmatched_string"><span class="keyword">val</span> matched_string</span> : <code class="type">string -&gt; string</code></pre><div class="info">
<code class="code">matched_string s</code> returns the substring of <code class="code">s</code> that was matched
   by the latest <a href="Str.html#VALstring_match"><code class="code"><span class="constructor">Str</span>.string_match</code></a>, <a href="Str.html#VALsearch_forward"><code class="code"><span class="constructor">Str</span>.search_forward</code></a> or
   <a href="Str.html#VALsearch_backward"><code class="code"><span class="constructor">Str</span>.search_backward</code></a>.
   The user must make sure that the parameter <code class="code">s</code> is the same string
   that was passed to the matching or searching function.<br>
</div>
<pre><span id="VALmatch_beginning"><span class="keyword">val</span> match_beginning</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
<code class="code">match_beginning()</code> returns the position of the first character
   of the substring that was matched by <a href="Str.html#VALstring_match"><code class="code"><span class="constructor">Str</span>.string_match</code></a>,
   <a href="Str.html#VALsearch_forward"><code class="code"><span class="constructor">Str</span>.search_forward</code></a> or <a href="Str.html#VALsearch_backward"><code class="code"><span class="constructor">Str</span>.search_backward</code></a>.<br>
</div>
<pre><span id="VALmatch_end"><span class="keyword">val</span> match_end</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
<code class="code">match_end()</code> returns the position of the character following the
   last character of the substring that was matched by <code class="code">string_match</code>,
   <code class="code">search_forward</code> or <code class="code">search_backward</code>.<br>
</div>
<pre><span id="VALmatched_group"><span class="keyword">val</span> matched_group</span> : <code class="type">int -&gt; string -&gt; string</code></pre><div class="info">
<code class="code">matched_group n s</code> returns the substring of <code class="code">s</code> that was matched
   by the <code class="code">n</code>th group <code class="code">\(...\)</code> of the regular expression during
   the latest <a href="Str.html#VALstring_match"><code class="code"><span class="constructor">Str</span>.string_match</code></a>, <a href="Str.html#VALsearch_forward"><code class="code"><span class="constructor">Str</span>.search_forward</code></a> or
   <a href="Str.html#VALsearch_backward"><code class="code"><span class="constructor">Str</span>.search_backward</code></a>.
   The user must make sure that the parameter <code class="code">s</code> is the same string
   that was passed to the matching or searching function.
   <code class="code">matched_group n s</code> raises <code class="code"><span class="constructor">Not_found</span></code> if the <code class="code">n</code>th group
   of the regular expression was not matched.  This can happen
   with groups inside alternatives <code class="code">\|</code>, options <code class="code">?</code>
   or repetitions <code class="code">*</code>.  For instance, the empty string will match
   <code class="code">\(a\)*</code>, but <code class="code">matched_group 1 <span class="string">""</span></code> will raise <code class="code"><span class="constructor">Not_found</span></code>
   because the first group itself was not matched.<br>
</div>
<pre><span id="VALgroup_beginning"><span class="keyword">val</span> group_beginning</span> : <code class="type">int -&gt; int</code></pre><div class="info">
<code class="code">group_beginning n</code> returns the position of the first character
   of the substring that was matched by the <code class="code">n</code>th group of
   the regular expression.<br>
<b>Raises</b><ul><li><code>Not_found</code> if the <code class="code">n</code>th group of the regular expression
   was not matched.</li>
<li><code>Invalid_argument</code> if there are fewer than <code class="code">n</code> groups in
   the regular expression.</li>
</ul>
</div>
<pre><span id="VALgroup_end"><span class="keyword">val</span> group_end</span> : <code class="type">int -&gt; int</code></pre><div class="info">
<code class="code">group_end n</code> returns
   the position of the character following the last character of
   substring that was matched by the <code class="code">n</code>th group of the regular expression.<br>
<b>Raises</b><ul><li><code>Not_found</code> if the <code class="code">n</code>th group of the regular expression
   was not matched.</li>
<li><code>Invalid_argument</code> if there are fewer than <code class="code">n</code> groups in
   the regular expression.</li>
</ul>
</div>
<br>
<span id="6_Replacement"><h6>Replacement</h6></span><br>
<pre><span id="VALglobal_replace"><span class="keyword">val</span> global_replace</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; string -&gt; string -&gt; string</code></pre><div class="info">
<code class="code">global_replace regexp templ s</code> returns a string identical to <code class="code">s</code>,
   except that all substrings of <code class="code">s</code> that match <code class="code">regexp</code> have been
   replaced by <code class="code">templ</code>. The replacement template <code class="code">templ</code> can contain
   <code class="code">\1</code>, <code class="code">\2</code>, etc; these sequences will be replaced by the text
   matched by the corresponding group in the regular expression.
   <code class="code">\0</code> stands for the text matched by the whole regular expression.<br>
</div>
<pre><span id="VALreplace_first"><span class="keyword">val</span> replace_first</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; string -&gt; string -&gt; string</code></pre><div class="info">
Same as <a href="Str.html#VALglobal_replace"><code class="code"><span class="constructor">Str</span>.global_replace</code></a>, except that only the first substring
   matching the regular expression is replaced.<br>
</div>
<pre><span id="VALglobal_substitute"><span class="keyword">val</span> global_substitute</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; (string -&gt; string) -&gt; string -&gt; string</code></pre><div class="info">
<code class="code">global_substitute regexp subst s</code> returns a string identical
   to <code class="code">s</code>, except that all substrings of <code class="code">s</code> that match <code class="code">regexp</code>
   have been replaced by the result of function <code class="code">subst</code>. The
   function <code class="code">subst</code> is called once for each matching substring,
   and receives <code class="code">s</code> (the whole text) as argument.<br>
</div>
<pre><span id="VALsubstitute_first"><span class="keyword">val</span> substitute_first</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; (string -&gt; string) -&gt; string -&gt; string</code></pre><div class="info">
Same as <a href="Str.html#VALglobal_substitute"><code class="code"><span class="constructor">Str</span>.global_substitute</code></a>, except that only the first substring
   matching the regular expression is replaced.<br>
</div>
<pre><span id="VALreplace_matched"><span class="keyword">val</span> replace_matched</span> : <code class="type">string -&gt; string -&gt; string</code></pre><div class="info">
<code class="code">replace_matched repl s</code> returns the replacement text <code class="code">repl</code>
   in which <code class="code">\1</code>, <code class="code">\2</code>, etc. have been replaced by the text
   matched by the corresponding groups in the most recent matching
   operation.  <code class="code">s</code> must be the same string that was matched during
   this matching operation.<br>
</div>
<br>
<span id="6_Splitting"><h6>Splitting</h6></span><br>
<pre><span id="VALsplit"><span class="keyword">val</span> split</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; string -&gt; string list</code></pre><div class="info">
<code class="code">split r s</code> splits <code class="code">s</code> into substrings, taking as delimiters
   the substrings that match <code class="code">r</code>, and returns the list of substrings.
   For instance, <code class="code">split (regexp <span class="string">"[ \t]+"</span>) s</code> splits <code class="code">s</code> into
   blank-separated words.  An occurrence of the delimiter at the
   beginning and at the end of the string is ignored.<br>
</div>
<pre><span id="VALbounded_split"><span class="keyword">val</span> bounded_split</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; string -&gt; int -&gt; string list</code></pre><div class="info">
Same as <a href="Str.html#VALsplit"><code class="code"><span class="constructor">Str</span>.split</code></a>, but splits into at most <code class="code">n</code> substrings,
   where <code class="code">n</code> is the extra integer parameter.<br>
</div>
<pre><span id="VALsplit_delim"><span class="keyword">val</span> split_delim</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; string -&gt; string list</code></pre><div class="info">
Same as <a href="Str.html#VALsplit"><code class="code"><span class="constructor">Str</span>.split</code></a> but occurrences of the
   delimiter at the beginning and at the end of the string are
   recognized and returned as empty strings in the result.
   For instance, <code class="code">split_delim (regexp <span class="string">" "</span>) <span class="string">" abc "</span></code>
   returns <code class="code">[<span class="string">""</span>; <span class="string">"abc"</span>; <span class="string">""</span>]</code>, while <code class="code">split</code> with the same
   arguments returns <code class="code">[<span class="string">"abc"</span>]</code>.<br>
</div>
<pre><span id="VALbounded_split_delim"><span class="keyword">val</span> bounded_split_delim</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; string -&gt; int -&gt; string list</code></pre><div class="info">
Same as <a href="Str.html#VALbounded_split"><code class="code"><span class="constructor">Str</span>.bounded_split</code></a>, but occurrences of the
   delimiter at the beginning and at the end of the string are
   recognized and returned as empty strings in the result.<br>
</div>
<pre><code><span id="TYPEsplit_result"><span class="keyword">type</span> <code class="type"></code>split_result</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsplit_result.Text"><span class="constructor">Text</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsplit_result.Delim"><span class="constructor">Delim</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr></tbody></table>


<pre><span id="VALfull_split"><span class="keyword">val</span> full_split</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; string -&gt; <a href="Str.html#TYPEsplit_result">split_result</a> list</code></pre><div class="info">
Same as <a href="Str.html#VALsplit_delim"><code class="code"><span class="constructor">Str</span>.split_delim</code></a>, but returns
   the delimiters as well as the substrings contained between
   delimiters.  The former are tagged <code class="code"><span class="constructor">Delim</span></code> in the result list;
   the latter are tagged <code class="code"><span class="constructor">Text</span></code>.  For instance,
   <code class="code">full_split (regexp <span class="string">"[{}]"</span>) <span class="string">"{ab}"</span></code> returns
   <code class="code">[<span class="constructor">Delim</span> <span class="string">"{"</span>; <span class="constructor">Text</span> <span class="string">"ab"</span>; <span class="constructor">Delim</span> <span class="string">"}"</span>]</code>.<br>
</div>
<pre><span id="VALbounded_full_split"><span class="keyword">val</span> bounded_full_split</span> : <code class="type"><a href="Str.html#TYPEregexp">regexp</a> -&gt; string -&gt; int -&gt; <a href="Str.html#TYPEsplit_result">split_result</a> list</code></pre><div class="info">
Same as <a href="Str.html#VALbounded_split_delim"><code class="code"><span class="constructor">Str</span>.bounded_split_delim</code></a>, but returns
   the delimiters as well as the substrings contained between
   delimiters.  The former are tagged <code class="code"><span class="constructor">Delim</span></code> in the result list;
   the latter are tagged <code class="code"><span class="constructor">Text</span></code>.<br>
</div>
<br>
<span id="6_Extractingsubstrings"><h6>Extracting substrings</h6></span><br>
<pre><span id="VALstring_before"><span class="keyword">val</span> string_before</span> : <code class="type">string -&gt; int -&gt; string</code></pre><div class="info">
<code class="code">string_before s n</code> returns the substring of all characters of <code class="code">s</code>
   that precede position <code class="code">n</code> (excluding the character at
   position <code class="code">n</code>).<br>
</div>
<pre><span id="VALstring_after"><span class="keyword">val</span> string_after</span> : <code class="type">string -&gt; int -&gt; string</code></pre><div class="info">
<code class="code">string_after s n</code> returns the substring of all characters of <code class="code">s</code>
   that follow position <code class="code">n</code> (including the character at
   position <code class="code">n</code>).<br>
</div>
<pre><span id="VALfirst_chars"><span class="keyword">val</span> first_chars</span> : <code class="type">string -&gt; int -&gt; string</code></pre><div class="info">
<code class="code">first_chars s n</code> returns the first <code class="code">n</code> characters of <code class="code">s</code>.
   This is the same function as <a href="Str.html#VALstring_before"><code class="code"><span class="constructor">Str</span>.string_before</code></a>.<br>
</div>
<pre><span id="VALlast_chars"><span class="keyword">val</span> last_chars</span> : <code class="type">string -&gt; int -&gt; string</code></pre><div class="info">
<code class="code">last_chars s n</code> returns the last <code class="code">n</code> characters of <code class="code">s</code>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>