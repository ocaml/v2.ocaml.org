<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Location</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Location.html">Location</a></h1>

<pre><span class="keyword">module</span> Location: <code class="code"><span class="keyword">sig</span></code> <a href="Location.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Source code locations (ranges of positions), used in parsetree.<br>
</div>
<hr width="100%">

<pre><code><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.loc_start">loc_start</span>&nbsp;: <code class="type"><a href="Lexing.html#TYPEposition">Lexing.position</a></code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.loc_end">loc_end</span>&nbsp;: <code class="type"><a href="Lexing.html#TYPEposition">Lexing.position</a></code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.loc_ghost">loc_ghost</span>&nbsp;: <code class="type">bool</code>;</code></td>

</tr></tbody></table>
}


<br>
Note on the use of Lexing.position in this module.
   If <code class="code">pos_fname&nbsp;=&nbsp;<span class="string">""</span></code>, then use <code class="code">!input_name</code> instead.
   If <code class="code">pos_lnum&nbsp;=&nbsp;-1</code>, then <code class="code">pos_bol&nbsp;=&nbsp;0</code>. Use <code class="code">pos_cnum</code> and
     re-parse the file to get the line and character numbers.
   Else all fields are correct.<br>

<pre><span id="VALnone"><span class="keyword">val</span> none</span> : <code class="type"><a href="Location.html#TYPEt">t</a></code></pre><div class="info ">
An arbitrary value of type <code class="code">t</code>; describes an empty ghost range.<br>
</div>

<pre><span id="VALin_file"><span class="keyword">val</span> in_file</span> : <code class="type">string -&gt; <a href="Location.html#TYPEt">t</a></code></pre><div class="info ">
Return an empty ghost range located in a given file.<br>
</div>

<pre><span id="VALinit"><span class="keyword">val</span> init</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">Lexing.lexbuf</a> -&gt; string -&gt; unit</code></pre><div class="info ">
Set the file name and line number of the <code class="code">lexbuf</code> to be the start
    of the named file.<br>
</div>

<pre><span id="VALcurr"><span class="keyword">val</span> curr</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">Lexing.lexbuf</a> -&gt; <a href="Location.html#TYPEt">t</a></code></pre><div class="info ">
Get the location of the current token from the <code class="code">lexbuf</code>.<br>
</div>

<pre><span id="VALsymbol_rloc"><span class="keyword">val</span> symbol_rloc</span> : <code class="type">unit -&gt; <a href="Location.html#TYPEt">t</a></code></pre>
<pre><span id="VALsymbol_gloc"><span class="keyword">val</span> symbol_gloc</span> : <code class="type">unit -&gt; <a href="Location.html#TYPEt">t</a></code></pre>
<pre><span id="VALrhs_loc"><span class="keyword">val</span> rhs_loc</span> : <code class="type">int -&gt; <a href="Location.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">rhs_loc&nbsp;n</code> returns the location of the symbol at position <code class="code">n</code>, starting
  at 1, in the current parser rule.<br>
</div>

<pre><span id="VALinput_name"><span class="keyword">val</span> input_name</span> : <code class="type">string <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALinput_lexbuf"><span class="keyword">val</span> input_lexbuf</span> : <code class="type"><a href="Lexing.html#TYPElexbuf">Lexing.lexbuf</a> option <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALget_pos_info"><span class="keyword">val</span> get_pos_info</span> : <code class="type"><a href="Lexing.html#TYPEposition">Lexing.position</a> -&gt; string * int * int</code></pre>
<pre><span id="VALprint_loc"><span class="keyword">val</span> print_loc</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Location.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALprint_error"><span class="keyword">val</span> print_error</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Location.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALprint_error_cur_file"><span class="keyword">val</span> print_error_cur_file</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; unit -&gt; unit</code></pre>
<pre><span id="VALprint_warning"><span class="keyword">val</span> print_warning</span> : <code class="type"><a href="Location.html#TYPEt">t</a> -&gt; <a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Warnings.html#TYPEt">Warnings.t</a> -&gt; unit</code></pre>
<pre><span id="VALformatter_for_warnings"><span class="keyword">val</span> formatter_for_warnings</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="VALprerr_warning"><span class="keyword">val</span> prerr_warning</span> : <code class="type"><a href="Location.html#TYPEt">t</a> -&gt; <a href="Warnings.html#TYPEt">Warnings.t</a> -&gt; unit</code></pre>
<pre><span id="VALecho_eof"><span class="keyword">val</span> echo_eof</span> : <code class="type">unit -&gt; unit</code></pre>
<pre><span id="VALreset"><span class="keyword">val</span> reset</span> : <code class="type">unit -&gt; unit</code></pre>
<pre><span id="VALwarning_printer"><span class="keyword">val</span> warning_printer</span> : <code class="type">(<a href="Location.html#TYPEt">t</a> -&gt; <a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Warnings.html#TYPEt">Warnings.t</a> -&gt; unit) <a href="Pervasives.html#TYPEref">ref</a></code></pre><div class="info ">
Hook for intercepting warnings.<br>
</div>

<pre><span id="VALdefault_warning_printer"><span class="keyword">val</span> default_warning_printer</span> : <code class="type"><a href="Location.html#TYPEt">t</a> -&gt; <a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Warnings.html#TYPEt">Warnings.t</a> -&gt; unit</code></pre><div class="info ">
Original warning printer for use in hooks.<br>
</div>

<pre><span id="VALhighlight_locations"><span class="keyword">val</span> highlight_locations</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Location.html#TYPEt">t</a> list -&gt; bool</code></pre>
<pre><code><span id="TYPEloc"><span class="keyword">type</span> <code class="type">'a</code> loc</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTloc.txt">txt</span>&nbsp;: <code class="type">'a</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTloc.loc">loc</span>&nbsp;: <code class="type"><a href="Location.html#TYPEt">t</a></code>;</code></td>

</tr></tbody></table>
}



<pre><span id="VALmknoloc"><span class="keyword">val</span> mknoloc</span> : <code class="type">'a -&gt; 'a <a href="Location.html#TYPEloc">loc</a></code></pre>
<pre><span id="VALmkloc"><span class="keyword">val</span> mkloc</span> : <code class="type">'a -&gt; <a href="Location.html#TYPEt">t</a> -&gt; 'a <a href="Location.html#TYPEloc">loc</a></code></pre>
<pre><span id="VALprint"><span class="keyword">val</span> print</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Location.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALprint_compact"><span class="keyword">val</span> print_compact</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Location.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALprint_filename"><span class="keyword">val</span> print_filename</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; string -&gt; unit</code></pre>
<pre><span id="VALabsolute_path"><span class="keyword">val</span> absolute_path</span> : <code class="type">string -&gt; string</code></pre>
<pre><span id="VALshow_filename"><span class="keyword">val</span> show_filename</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
In -absname mode, return the absolute path for this filename.
        Otherwise, returns the filename unchanged.<br>
</div>

<pre><span id="VALabsname"><span class="keyword">val</span> absname</span> : <code class="type">bool <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><code><span id="TYPEerror"><span class="keyword">type</span> <code class="type"></code>error</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.loc">loc</span>&nbsp;: <code class="type"><a href="Location.html#TYPEt">t</a></code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.msg">msg</span>&nbsp;: <code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.sub">sub</span>&nbsp;: <code class="type"><a href="Location.html#TYPEerror">error</a> list</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.if_highlight">if_highlight</span>&nbsp;: <code class="type">string</code>;</code></td>

</tr></tbody></table>
}



<pre><span id="EXCEPTIONError"><span class="keyword">exception</span> Error</span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEerror">error</a></code></pre>

<pre><span id="VALprint_error_prefix"><span class="keyword">val</span> print_error_prefix</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; unit -&gt; unit</code></pre>
<pre><span id="VALerror"><span class="keyword">val</span> error</span> : <code class="type">?loc:<a href="Location.html#TYPEt">t</a> -&gt;<br>       ?sub:<a href="Location.html#TYPEerror">error</a> list -&gt; ?if_highlight:string -&gt; string -&gt; <a href="Location.html#TYPEerror">error</a></code></pre>
<pre><span id="VALerrorf"><span class="keyword">val</span> errorf</span> : <code class="type">?loc:<a href="Location.html#TYPEt">t</a> -&gt;<br>       ?sub:<a href="Location.html#TYPEerror">error</a> list -&gt;<br>       ?if_highlight:string -&gt;<br>       ('a, <a href="Format.html#TYPEformatter">Format.formatter</a>, unit, <a href="Location.html#TYPEerror">error</a>) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'a</code></pre>
<pre><span id="VALraise_errorf"><span class="keyword">val</span> raise_errorf</span> : <code class="type">?loc:<a href="Location.html#TYPEt">t</a> -&gt;<br>       ?sub:<a href="Location.html#TYPEerror">error</a> list -&gt;<br>       ?if_highlight:string -&gt;<br>       ('a, <a href="Format.html#TYPEformatter">Format.formatter</a>, unit, 'b) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'a</code></pre>
<pre><span id="VALerror_of_printer"><span class="keyword">val</span> error_of_printer</span> : <code class="type"><a href="Location.html#TYPEt">t</a> -&gt; (<a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; 'a -&gt; unit) -&gt; 'a -&gt; <a href="Location.html#TYPEerror">error</a></code></pre>
<pre><span id="VALerror_of_printer_file"><span class="keyword">val</span> error_of_printer_file</span> : <code class="type">(<a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; 'a -&gt; unit) -&gt; 'a -&gt; <a href="Location.html#TYPEerror">error</a></code></pre>
<pre><span id="VALerror_of_exn"><span class="keyword">val</span> error_of_exn</span> : <code class="type">exn -&gt; <a href="Location.html#TYPEerror">error</a> option</code></pre>
<pre><span id="VALregister_error_of_exn"><span class="keyword">val</span> register_error_of_exn</span> : <code class="type">(exn -&gt; <a href="Location.html#TYPEerror">error</a> option) -&gt; unit</code></pre>
<pre><span id="VALreport_error"><span class="keyword">val</span> report_error</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Location.html#TYPEerror">error</a> -&gt; unit</code></pre>
<pre><span id="VALerror_reporter"><span class="keyword">val</span> error_reporter</span> : <code class="type">(<a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Location.html#TYPEerror">error</a> -&gt; unit) <a href="Pervasives.html#TYPEref">ref</a></code></pre><div class="info ">
Hook for intercepting error reports.<br>
</div>

<pre><span id="VALdefault_error_reporter"><span class="keyword">val</span> default_error_reporter</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Location.html#TYPEerror">error</a> -&gt; unit</code></pre><div class="info ">
Original error reporter for use in hooks.<br>
</div>

<pre><span id="VALreport_exception"><span class="keyword">val</span> report_exception</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; exn -&gt; unit</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>