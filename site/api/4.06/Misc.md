<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Misc</a></div><ul><li><a href="#1_Hookmachinery">Hook machinery</a></li></ul></nav></header>

<h1>Module <a href="type_Misc.html">Misc</a></h1>

<pre><span id="MODULEMisc"><span class="keyword">module</span> Misc</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Misc.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="VALfatal_error"><span class="keyword">val</span> fatal_error</span> : <code class="type">string -&gt; 'a</code></pre>
<pre><span id="VALfatal_errorf"><span class="keyword">val</span> fatal_errorf</span> : <code class="type">('a, <a href="Format.html#TYPEformatter">Format.formatter</a>, unit, 'b) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'a</code></pre>
<pre><span id="EXCEPTIONFatal_error"><span class="keyword">exception</span> Fatal_error</span></pre>

<pre><span id="VALtry_finally"><span class="keyword">val</span> try_finally</span> : <code class="type">(unit -&gt; 'a) -&gt; (unit -&gt; unit) -&gt; 'a</code></pre>
<pre><span id="VALmap_end"><span class="keyword">val</span> map_end</span> : <code class="type">('a -&gt; 'b) -&gt; 'a list -&gt; 'b list -&gt; 'b list</code></pre>
<pre><span id="VALmap_left_right"><span class="keyword">val</span> map_left_right</span> : <code class="type">('a -&gt; 'b) -&gt; 'a list -&gt; 'b list</code></pre>
<pre><span id="VALfor_all2"><span class="keyword">val</span> for_all2</span> : <code class="type">('a -&gt; 'b -&gt; bool) -&gt; 'a list -&gt; 'b list -&gt; bool</code></pre>
<pre><span id="VALreplicate_list"><span class="keyword">val</span> replicate_list</span> : <code class="type">'a -&gt; int -&gt; 'a list</code></pre>
<pre><span id="VALlist_remove"><span class="keyword">val</span> list_remove</span> : <code class="type">'a -&gt; 'a list -&gt; 'a list</code></pre>
<pre><span id="VALsplit_last"><span class="keyword">val</span> split_last</span> : <code class="type">'a list -&gt; 'a list * 'a</code></pre>
<pre><span id="VALmay"><span class="keyword">val</span> may</span> : <code class="type">('a -&gt; unit) -&gt; 'a option -&gt; unit</code></pre>
<pre><span id="VALmay_map"><span class="keyword">val</span> may_map</span> : <code class="type">('a -&gt; 'b) -&gt; 'a option -&gt; 'b option</code></pre>
<pre><code><span id="TYPEref_and_value"><span class="keyword">type</span> <code class="type"></code>ref_and_value</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTref_and_value.R"><span class="constructor">R</span></span> <span class="keyword">:</span> <code class="type">'a <a href="Pervasives.html#TYPEref">ref</a> * 'a</code> <span class="keyword">-&gt;</span> <code class="type"><a href="Misc.html#TYPEref_and_value">ref_and_value</a></code></code></td>

</tr></tbody></table>



<pre><span id="VALprotect_refs"><span class="keyword">val</span> protect_refs</span> : <code class="type"><a href="Misc.html#TYPEref_and_value">ref_and_value</a> list -&gt; (unit -&gt; 'a) -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">protect_refs&nbsp;l&nbsp;f</code> temporarily sets <code class="code">r</code> to <code class="code">v</code> for each <code class="code"><span class="constructor">R</span>&nbsp;(r,&nbsp;v)</code> in <code class="code">l</code>
    while executing <code class="code">f</code>. The previous contents of the references is restored
    even if <code class="code">f</code> raises an exception.</p>
</div>
</div>

<pre><span id="MODULEStdlib"><span class="keyword">module</span> <a href="Misc.Stdlib.html">Stdlib</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Misc.Stdlib.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="VALfind_in_path"><span class="keyword">val</span> find_in_path</span> : <code class="type">string list -&gt; string -&gt; string</code></pre>
<pre><span id="VALfind_in_path_rel"><span class="keyword">val</span> find_in_path_rel</span> : <code class="type">string list -&gt; string -&gt; string</code></pre>
<pre><span id="VALfind_in_path_uncap"><span class="keyword">val</span> find_in_path_uncap</span> : <code class="type">string list -&gt; string -&gt; string</code></pre>
<pre><span id="VALremove_file"><span class="keyword">val</span> remove_file</span> : <code class="type">string -&gt; unit</code></pre>
<pre><span id="VALexpand_directory"><span class="keyword">val</span> expand_directory</span> : <code class="type">string -&gt; string -&gt; string</code></pre>
<pre><span id="VALcreate_hashtable"><span class="keyword">val</span> create_hashtable</span> : <code class="type">int -&gt; ('a * 'b) list -&gt; ('a, 'b) <a href="Hashtbl.html#TYPEt">Hashtbl.t</a></code></pre>
<pre><span id="VALcopy_file"><span class="keyword">val</span> copy_file</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; <a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; unit</code></pre>
<pre><span id="VALcopy_file_chunk"><span class="keyword">val</span> copy_file_chunk</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; <a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALstring_of_file"><span class="keyword">val</span> string_of_file</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; string</code></pre>
<pre><span id="VALoutput_to_file_via_temporary"><span class="keyword">val</span> output_to_file_via_temporary</span> : <code class="type">?mode:<a href="Pervasives.html#TYPEopen_flag">open_flag</a> list -&gt;<br>       string -&gt; (string -&gt; <a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; 'a) -&gt; 'a</code></pre>
<pre><span id="VALlog2"><span class="keyword">val</span> log2</span> : <code class="type">int -&gt; int</code></pre>
<pre><span id="VALalign"><span class="keyword">val</span> align</span> : <code class="type">int -&gt; int -&gt; int</code></pre>
<pre><span id="VALno_overflow_add"><span class="keyword">val</span> no_overflow_add</span> : <code class="type">int -&gt; int -&gt; bool</code></pre>
<pre><span id="VALno_overflow_sub"><span class="keyword">val</span> no_overflow_sub</span> : <code class="type">int -&gt; int -&gt; bool</code></pre>
<pre><span id="VALno_overflow_mul"><span class="keyword">val</span> no_overflow_mul</span> : <code class="type">int -&gt; int -&gt; bool</code></pre>
<pre><span id="VALno_overflow_lsl"><span class="keyword">val</span> no_overflow_lsl</span> : <code class="type">int -&gt; int -&gt; bool</code></pre>
<pre><span id="MODULEInt_literal_converter"><span class="keyword">module</span> <a href="Misc.Int_literal_converter.html">Int_literal_converter</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Misc.Int_literal_converter.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="VALchop_extensions"><span class="keyword">val</span> chop_extensions</span> : <code class="type">string -&gt; string</code></pre>
<pre><span id="VALsearch_substring"><span class="keyword">val</span> search_substring</span> : <code class="type">string -&gt; string -&gt; int -&gt; int</code></pre>
<pre><span id="VALreplace_substring"><span class="keyword">val</span> replace_substring</span> : <code class="type">before:string -&gt; after:string -&gt; string -&gt; string</code></pre>
<pre><span id="VALrev_split_words"><span class="keyword">val</span> rev_split_words</span> : <code class="type">string -&gt; string list</code></pre>
<pre><span id="VALget_ref"><span class="keyword">val</span> get_ref</span> : <code class="type">'a list <a href="Pervasives.html#TYPEref">ref</a> -&gt; 'a list</code></pre>
<pre><span id="VALfst3"><span class="keyword">val</span> fst3</span> : <code class="type">'a * 'b * 'c -&gt; 'a</code></pre>
<pre><span id="VALsnd3"><span class="keyword">val</span> snd3</span> : <code class="type">'a * 'b * 'c -&gt; 'b</code></pre>
<pre><span id="VALthd3"><span class="keyword">val</span> thd3</span> : <code class="type">'a * 'b * 'c -&gt; 'c</code></pre>
<pre><span id="VALfst4"><span class="keyword">val</span> fst4</span> : <code class="type">'a * 'b * 'c * 'd -&gt; 'a</code></pre>
<pre><span id="VALsnd4"><span class="keyword">val</span> snd4</span> : <code class="type">'a * 'b * 'c * 'd -&gt; 'b</code></pre>
<pre><span id="VALthd4"><span class="keyword">val</span> thd4</span> : <code class="type">'a * 'b * 'c * 'd -&gt; 'c</code></pre>
<pre><span id="VALfor4"><span class="keyword">val</span> for4</span> : <code class="type">'a * 'b * 'c * 'd -&gt; 'd</code></pre>
<pre><span id="MODULELongString"><span class="keyword">module</span> <a href="Misc.LongString.html">LongString</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Misc.LongString.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="VALedit_distance"><span class="keyword">val</span> edit_distance</span> : <code class="type">string -&gt; string -&gt; int -&gt; int option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">edit_distance&nbsp;a&nbsp;b&nbsp;cutoff</code> computes the edit distance between
    strings <code class="code">a</code> and <code class="code">b</code>. To help efficiency, it uses a cutoff: if the
    distance <code class="code">d</code> is smaller than <code class="code">cutoff</code>, it returns <code class="code"><span class="constructor">Some</span>&nbsp;d</code>, else
    <code class="code"><span class="constructor">None</span></code>.</p>

<p>The distance algorithm currently used is Damerau-Levenshtein: it
    computes the number of insertion, deletion, substitution of
    letters, or swapping of adjacent letters to go from one word to the
    other. The particular algorithm may change in the future.</p>
</div>
</div>

<pre><span id="VALspellcheck"><span class="keyword">val</span> spellcheck</span> : <code class="type">string list -&gt; string -&gt; string list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">spellcheck&nbsp;env&nbsp;name</code> takes a list of names <code class="code">env</code> that exist in
    the current environment and an erroneous <code class="code">name</code>, and returns a
    list of suggestions taken from <code class="code">env</code>, that are close enough to
    <code class="code">name</code> that it may be a typo for one of them.</p>
</div>
</div>

<pre><span id="VALdid_you_mean"><span class="keyword">val</span> did_you_mean</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; (unit -&gt; string list) -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">did_you_mean&nbsp;ppf&nbsp;get_choices</code> hints that the user may have meant
    one of the option returned by calling <code class="code">get_choices</code>. It does nothing
    if the returned list is empty.</p>

<p>The <code class="code">unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;...</code> thunking is meant to delay any potentially-slow
    computation (typically computing edit-distance with many things
    from the current environment) to when the hint message is to be
    printed. You should print an understandable error message before
    calling <code class="code">did_you_mean</code>, so that users get a clear notification of
    the failure even if producing the hint is slow.</p>
</div>
</div>

<pre><span id="VALcut_at"><span class="keyword">val</span> cut_at</span> : <code class="type">string -&gt; char -&gt; string * string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">String</span>.cut_at&nbsp;s&nbsp;c</code> returns a pair containing the sub-string before
   the first occurrence of <code class="code">c</code> in <code class="code">s</code>, and the sub-string after the
   first occurrence of <code class="code">c</code> in <code class="code">s</code>.
   <code class="code"><span class="keyword">let</span>&nbsp;(before,&nbsp;after)&nbsp;=&nbsp;<span class="constructor">String</span>.cut_at&nbsp;s&nbsp;c&nbsp;<span class="keyword">in</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;before&nbsp;^&nbsp;<span class="constructor">String</span>.make&nbsp;1&nbsp;c&nbsp;^&nbsp;after</code> is the identity if <code class="code">s</code> contains <code class="code">c</code>.</p>

<p>Raise <code class="code"><span class="constructor">Not_found</span></code> if the character does not appear in the string</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.01</li>
</ul>
</div>

<pre><span id="MODULEStringSet"><span class="keyword">module</span> <a href="Misc.StringSet.html">StringSet</a></span>: <code class="type"><a href="Set.S.html">Set.S</a></code><code class="type">  with type elt = string</code></pre>
<pre><span id="MODULEStringMap"><span class="keyword">module</span> <a href="Misc.StringMap.html">StringMap</a></span>: <code class="type"><a href="Map.S.html">Map.S</a></code><code class="type">  with type key = string</code></pre>
<pre><span id="MODULEColor"><span class="keyword">module</span> <a href="Misc.Color.html">Color</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Misc.Color.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="VALnormalise_eol"><span class="keyword">val</span> normalise_eol</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">normalise_eol&nbsp;s</code> returns a fresh copy of <code class="code">s</code> with any '\r' characters
   removed. Intended for pre-processing text which will subsequently be printed
   on a channel which performs EOL transformations (i.e. Windows)</p>
</div>
</div>

<pre><span id="VALdelete_eol_spaces"><span class="keyword">val</span> delete_eol_spaces</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">delete_eol_spaces&nbsp;s</code> returns a fresh copy of <code class="code">s</code> with any end of
   line spaces removed. Intended to normalize the output of the
   toplevel for tests.</p>
</div>
</div>
<h2 id="1_Hookmachinery">Hook machinery</h2>
<p>Hooks machinery:
   <code class="code">add_hook&nbsp;name&nbsp;f</code> will register a function that will be called on the
    argument of a later call to <code class="code">apply_hooks</code>. Hooks are applied in the
    lexicographical order of their names.</p>

<pre><code><span id="TYPEhook_info"><span class="keyword">type</span> <code class="type"></code>hook_info</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELThook_info.sourcefile">sourcefile</span>&nbsp;: <code class="type">string</code>;</code></td>

</tr></tbody></table>
}



<pre><span id="EXCEPTIONHookExnWrapper"><span class="keyword">exception</span> HookExnWrapper</span> <span class="keyword">of</span> <code>{</code><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTMisc.HookExnWrapper.error">error</span>&nbsp;: <code class="type">exn</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTMisc.HookExnWrapper.hook_name">hook_name</span>&nbsp;: <code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTMisc.HookExnWrapper.hook_info">hook_info</span>&nbsp;: <code class="type"><a href="Misc.html#TYPEhook_info">hook_info</a></code>;</code></td>

</tr></tbody></table>
}
</pre>
<div class="info ">
<div class="info-desc">
<p>An exception raised by a hook will be wrapped into a
        <code class="code"><span class="constructor">HookExnWrapper</span></code> constructor by the hook machinery.</p>
</div>
</div>

<pre><span id="VALraise_direct_hook_exn"><span class="keyword">val</span> raise_direct_hook_exn</span> : <code class="type">exn -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p>A hook can use <code class="code">raise_unwrapped_hook_exn</code> to raise an exception that will
      not be wrapped into a <a href="Misc.html#EXCEPTIONHookExnWrapper"><code class="code"><span class="constructor">Misc</span>.<span class="constructor">HookExnWrapper</span></code></a>.</p>
</div>
</div>

<pre><span id="MODULETYPEHookSig"><span class="keyword">module type</span> <a href="Misc.HookSig.html">HookSig</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="Misc.HookSig.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULEMakeHooks"><span class="keyword">module</span> <a href="Misc.MakeHooks.html">MakeHooks</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">M</span></code><code class="code">&nbsp;:&nbsp;</code><code class="code"><span class="keyword">sig</span></code></div></pre><div class="sig_block">
<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>

</div><pre><code class="code"><span class="keyword">end</span></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Misc.HookSig.html">HookSig</a></code><code class="type">  with type t = M.t</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>