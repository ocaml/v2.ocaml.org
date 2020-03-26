<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Location</a></div><ul><li><a href="#1_Sourcecodelocationsrangesofpositionsusedinparsetree">Source code locations (ranges of positions), used in parsetree</a></li><li><a href="#1_Inputinfo">Input info</a></li><li><a href="#1_Toplevelspecificfunctions">Toplevel-specific functions</a></li><li><a href="#1_Printinglocations">Printing locations</a></li><li><a href="#1_Toplevelspecificlocationhighlighting">Toplevel-specific location highlighting</a></li><li><a href="#1_Reportingerrorsandwarnings">Reporting errors and warnings</a><ul><li><a href="#2_Thetypeofreportsandreportprinters">The type of reports and report printers</a></li><li><a href="#2_Reportprintersusedinthecompiler">Report printers used in the compiler</a></li><li><a href="#2_Printingareport">Printing a report</a></li></ul></li><li><a href="#1_Reportingwarnings">Reporting warnings</a><ul><li><a href="#2_ConvertingaWarningstintoareport">Converting a Warnings.t into a report</a></li><li><a href="#2_Printingwarnings">Printing warnings</a></li></ul></li><li><a href="#1_Reportingalerts">Reporting alerts</a><ul><li><a href="#2_ConvertinganAlerttintoareport">Converting an Alert.t into a report</a></li><li><a href="#2_Printingalerts">Printing alerts</a></li></ul></li><li><a href="#1_Reportingerrors">Reporting errors</a></li><li><a href="#1_Automaticallyreportingerrorsforraisedexceptions">Automatically reporting errors for raised exceptions</a></li></ul></nav></header>

<h1>Module <a href="type_Location.html">Location</a></h1>

<pre><span id="MODULELocation"><span class="keyword">module</span> Location</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Location.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<h2 id="1_Sourcecodelocationsrangesofpositionsusedinparsetree">Source code locations (ranges of positions), used in parsetree</h2>
<p><b>Warning:</b> this module is unstable and part of
  <a href="Compiler_libs.html">compiler-libs</a>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type"><a href="Warnings.html#TYPEloc">Warnings.loc</a></code> = {</pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.loc_start">loc_start</span>&nbsp;: <code class="type">Lexing.position</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.loc_end">loc_end</span>&nbsp;: <code class="type">Lexing.position</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.loc_ghost">loc_ghost</span>&nbsp;: <code class="type">bool</code>;</code></td>

</tr></tbody></table>
<code>}</code>


<p>Note on the use of Lexing.position in this module.
   If <code class="code">pos_fname&nbsp;=&nbsp;<span class="string">""</span></code>, then use <code class="code">!input_name</code> instead.
   If <code class="code">pos_lnum&nbsp;=&nbsp;-1</code>, then <code class="code">pos_bol&nbsp;=&nbsp;0</code>. Use <code class="code">pos_cnum</code> and
     re-parse the file to get the line and character numbers.
   Else all fields are correct.</p>

<pre><span id="VALnone"><span class="keyword">val</span> none</span> : <code class="type"><a href="Location.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>An arbitrary value of type <code class="code">t</code>; describes an empty ghost range.</p>
</div>
</div>

<pre><span id="VALin_file"><span class="keyword">val</span> in_file</span> : <code class="type">string -&gt; <a href="Location.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return an empty ghost range located in a given file.</p>
</div>
</div>

<pre><span id="VALinit"><span class="keyword">val</span> init</span> : <code class="type">Lexing.lexbuf -&gt; string -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Set the file name and line number of the <code class="code">lexbuf</code> to be the start
    of the named file.</p>
</div>
</div>

<pre><span id="VALcurr"><span class="keyword">val</span> curr</span> : <code class="type">Lexing.lexbuf -&gt; <a href="Location.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Get the location of the current token from the <code class="code">lexbuf</code>.</p>
</div>
</div>

<pre><span id="VALsymbol_rloc"><span class="keyword">val</span> symbol_rloc</span> : <code class="type">unit -&gt; <a href="Location.html#TYPEt">t</a></code></pre>
<pre><span id="VALsymbol_gloc"><span class="keyword">val</span> symbol_gloc</span> : <code class="type">unit -&gt; <a href="Location.html#TYPEt">t</a></code></pre>
<pre><span id="VALrhs_loc"><span class="keyword">val</span> rhs_loc</span> : <code class="type">int -&gt; <a href="Location.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">rhs_loc&nbsp;n</code> returns the location of the symbol at position <code class="code">n</code>, starting
  at 1, in the current parser rule.</p>
</div>
</div>

<pre><span id="VALrhs_interval"><span class="keyword">val</span> rhs_interval</span> : <code class="type">int -&gt; int -&gt; <a href="Location.html#TYPEt">t</a></code></pre>
<pre><span id="VALget_pos_info"><span class="keyword">val</span> get_pos_info</span> : <code class="type">Lexing.position -&gt; string * int * int</code></pre><div class="info ">
<div class="info-desc">
<p>file, line, char</p>
</div>
</div>

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
<code>}</code>



<pre><span id="VALmknoloc"><span class="keyword">val</span> mknoloc</span> : <code class="type">'a -&gt; 'a <a href="Location.html#TYPEloc">loc</a></code></pre>
<pre><span id="VALmkloc"><span class="keyword">val</span> mkloc</span> : <code class="type">'a -&gt; <a href="Location.html#TYPEt">t</a> -&gt; 'a <a href="Location.html#TYPEloc">loc</a></code></pre><h2 id="1_Inputinfo">Input info</h2>
<pre><span id="VALinput_name"><span class="keyword">val</span> input_name</span> : <code class="type">string ref</code></pre>
<pre><span id="VALinput_lexbuf"><span class="keyword">val</span> input_lexbuf</span> : <code class="type">Lexing.lexbuf option ref</code></pre>
<pre><span id="VALinput_phrase_buffer"><span class="keyword">val</span> input_phrase_buffer</span> : <code class="type">Buffer.t option ref</code></pre><h2 id="1_Toplevelspecificfunctions">Toplevel-specific functions</h2>
<pre><span id="VALecho_eof"><span class="keyword">val</span> echo_eof</span> : <code class="type">unit -&gt; unit</code></pre>
<pre><span id="VALreset"><span class="keyword">val</span> reset</span> : <code class="type">unit -&gt; unit</code></pre><h2 id="1_Printinglocations">Printing locations</h2>
<pre><span id="VALrewrite_absolute_path"><span class="keyword">val</span> rewrite_absolute_path</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>rewrite absolute path to honor the BUILD_PATH_PREFIX_MAP
        variable (https://reproducible-builds.org/specs/build-path-prefix-map/)
        if it is set.</p>
</div>
</div>

<pre><span id="VALabsolute_path"><span class="keyword">val</span> absolute_path</span> : <code class="type">string -&gt; string</code></pre>
<pre><span id="VALshow_filename"><span class="keyword">val</span> show_filename</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>In -absname mode, return the absolute path for this filename.
        Otherwise, returns the filename unchanged.</p>
</div>
</div>

<pre><span id="VALprint_filename"><span class="keyword">val</span> print_filename</span> : <code class="type">Format.formatter -&gt; string -&gt; unit</code></pre>
<pre><span id="VALprint_loc"><span class="keyword">val</span> print_loc</span> : <code class="type">Format.formatter -&gt; <a href="Location.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALprint_locs"><span class="keyword">val</span> print_locs</span> : <code class="type">Format.formatter -&gt; <a href="Location.html#TYPEt">t</a> list -&gt; unit</code></pre><h2 id="1_Toplevelspecificlocationhighlighting">Toplevel-specific location highlighting</h2>
<pre><span id="VALhighlight_terminfo"><span class="keyword">val</span> highlight_terminfo</span> : <code class="type">Lexing.lexbuf -&gt; Format.formatter -&gt; <a href="Location.html#TYPEt">t</a> list -&gt; unit</code></pre><h2 id="1_Reportingerrorsandwarnings">Reporting errors and warnings</h2><h3 id="2_Thetypeofreportsandreportprinters">The type of reports and report printers</h3>
<pre><span id="TYPEmsg"><span class="keyword">type</span> <code class="type"></code>msg</span> = <code class="type">(Format.formatter -&gt; unit) <a href="Location.html#TYPEloc">loc</a></code> </pre>


<pre><span id="VALmsg"><span class="keyword">val</span> msg</span> : <code class="type">?loc:<a href="Location.html#TYPEt">t</a> -&gt;<br>       ('a, Format.formatter, unit, <a href="Location.html#TYPEmsg">msg</a>) format4 -&gt; 'a</code></pre>
<pre><code><span id="TYPEreport_kind"><span class="keyword">type</span> <code class="type"></code>report_kind</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport_kind.Report_error"><span class="constructor">Report_error</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport_kind.Report_warning"><span class="constructor">Report_warning</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport_kind.Report_warning_as_error"><span class="constructor">Report_warning_as_error</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport_kind.Report_alert"><span class="constructor">Report_alert</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport_kind.Report_alert_as_error"><span class="constructor">Report_alert_as_error</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEreport"><span class="keyword">type</span> <code class="type"></code>report</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport.kind">kind</span>&nbsp;: <code class="type"><a href="Location.html#TYPEreport_kind">report_kind</a></code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport.main">main</span>&nbsp;: <code class="type"><a href="Location.html#TYPEmsg">msg</a></code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport.sub">sub</span>&nbsp;: <code class="type"><a href="Location.html#TYPEmsg">msg</a> list</code>;</code></td>

</tr></tbody></table>
<code>}</code>



<pre><code><span id="TYPEreport_printer"><span class="keyword">type</span> <code class="type"></code>report_printer</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport_printer.pp">pp</span>&nbsp;: <code class="type"><a href="Location.html#TYPEreport_printer">report_printer</a> -&gt; Format.formatter -&gt; <a href="Location.html#TYPEreport">report</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport_printer.pp_report_kind">pp_report_kind</span>&nbsp;: <code class="type"><a href="Location.html#TYPEreport_printer">report_printer</a> -&gt;<br>       <a href="Location.html#TYPEreport">report</a> -&gt; Format.formatter -&gt; <a href="Location.html#TYPEreport_kind">report_kind</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport_printer.pp_main_loc">pp_main_loc</span>&nbsp;: <code class="type"><a href="Location.html#TYPEreport_printer">report_printer</a> -&gt;<br>       <a href="Location.html#TYPEreport">report</a> -&gt; Format.formatter -&gt; <a href="Location.html#TYPEt">t</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport_printer.pp_main_txt">pp_main_txt</span>&nbsp;: <code class="type"><a href="Location.html#TYPEreport_printer">report_printer</a> -&gt;<br>       <a href="Location.html#TYPEreport">report</a> -&gt;<br>       Format.formatter -&gt; (Format.formatter -&gt; unit) -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport_printer.pp_submsgs">pp_submsgs</span>&nbsp;: <code class="type"><a href="Location.html#TYPEreport_printer">report_printer</a> -&gt;<br>       <a href="Location.html#TYPEreport">report</a> -&gt; Format.formatter -&gt; <a href="Location.html#TYPEmsg">msg</a> list -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport_printer.pp_submsg">pp_submsg</span>&nbsp;: <code class="type"><a href="Location.html#TYPEreport_printer">report_printer</a> -&gt;<br>       <a href="Location.html#TYPEreport">report</a> -&gt; Format.formatter -&gt; <a href="Location.html#TYPEmsg">msg</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport_printer.pp_submsg_loc">pp_submsg_loc</span>&nbsp;: <code class="type"><a href="Location.html#TYPEreport_printer">report_printer</a> -&gt;<br>       <a href="Location.html#TYPEreport">report</a> -&gt; Format.formatter -&gt; <a href="Location.html#TYPEt">t</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTreport_printer.pp_submsg_txt">pp_submsg_txt</span>&nbsp;: <code class="type"><a href="Location.html#TYPEreport_printer">report_printer</a> -&gt;<br>       <a href="Location.html#TYPEreport">report</a> -&gt;<br>       Format.formatter -&gt; (Format.formatter -&gt; unit) -&gt; unit</code>;</code></td>

</tr></tbody></table>
<code>}</code>

<div class="info ">
<div class="info-desc">
<p>A printer for <code class="code">report</code>s, defined using open-recursion.
    The goal is to make it easy to define new printers by re-using code from
    existing ones.</p>
</div>
</div>

<h3 id="2_Reportprintersusedinthecompiler">Report printers used in the compiler</h3>
<pre><span id="VALbatch_mode_printer"><span class="keyword">val</span> batch_mode_printer</span> : <code class="type"><a href="Location.html#TYPEreport_printer">report_printer</a></code></pre>
<pre><span id="VALterminfo_toplevel_printer"><span class="keyword">val</span> terminfo_toplevel_printer</span> : <code class="type">Lexing.lexbuf -&gt; <a href="Location.html#TYPEreport_printer">report_printer</a></code></pre>
<pre><span id="VALbest_toplevel_printer"><span class="keyword">val</span> best_toplevel_printer</span> : <code class="type">unit -&gt; <a href="Location.html#TYPEreport_printer">report_printer</a></code></pre><div class="info ">
<div class="info-desc">
<p>Detects the terminal capabilities and selects an adequate printer</p>
</div>
</div>
<h3 id="2_Printingareport">Printing a <code class="code">report</code></h3>
<pre><span id="VALprint_report"><span class="keyword">val</span> print_report</span> : <code class="type">Format.formatter -&gt; <a href="Location.html#TYPEreport">report</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Display an error or warning report.</p>
</div>
</div>

<pre><span id="VALreport_printer"><span class="keyword">val</span> report_printer</span> : <code class="type">(unit -&gt; <a href="Location.html#TYPEreport_printer">report_printer</a>) ref</code></pre><div class="info ">
<div class="info-desc">
<p>Hook for redefining the printer of reports.</p>

<p>The hook is a <code class="code">unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;report_printer</code> and not simply a <code class="code">report_printer</code>:
    this is useful so that it can detect the type of the output (a file, a
    terminal, ...) and select a printer accordingly.</p>
</div>
</div>

<pre><span id="VALdefault_report_printer"><span class="keyword">val</span> default_report_printer</span> : <code class="type">unit -&gt; <a href="Location.html#TYPEreport_printer">report_printer</a></code></pre><div class="info ">
<div class="info-desc">
<p>Original report printer for use in hooks.</p>
</div>
</div>
<h2 id="1_Reportingwarnings">Reporting warnings</h2><h3 id="2_ConvertingaWarningstintoareport">Converting a <code class="code"><span class="constructor">Warnings</span>.t</code> into a <code class="code">report</code></h3>
<pre><span id="VALreport_warning"><span class="keyword">val</span> report_warning</span> : <code class="type"><a href="Location.html#TYPEt">t</a> -&gt; <a href="Warnings.html#TYPEt">Warnings.t</a> -&gt; <a href="Location.html#TYPEreport">report</a> option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">report_warning&nbsp;loc&nbsp;w</code> produces a report for the given warning <code class="code">w</code>, or
   <code class="code"><span class="constructor">None</span></code> if the warning is not to be printed.</p>
</div>
</div>

<pre><span id="VALwarning_reporter"><span class="keyword">val</span> warning_reporter</span> : <code class="type">(<a href="Location.html#TYPEt">t</a> -&gt; <a href="Warnings.html#TYPEt">Warnings.t</a> -&gt; <a href="Location.html#TYPEreport">report</a> option) ref</code></pre><div class="info ">
<div class="info-desc">
<p>Hook for intercepting warnings.</p>
</div>
</div>

<pre><span id="VALdefault_warning_reporter"><span class="keyword">val</span> default_warning_reporter</span> : <code class="type"><a href="Location.html#TYPEt">t</a> -&gt; <a href="Warnings.html#TYPEt">Warnings.t</a> -&gt; <a href="Location.html#TYPEreport">report</a> option</code></pre><div class="info ">
<div class="info-desc">
<p>Original warning reporter for use in hooks.</p>
</div>
</div>
<h3 id="2_Printingwarnings">Printing warnings</h3>
<pre><span id="VALformatter_for_warnings"><span class="keyword">val</span> formatter_for_warnings</span> : <code class="type">Format.formatter ref</code></pre>
<pre><span id="VALprint_warning"><span class="keyword">val</span> print_warning</span> : <code class="type"><a href="Location.html#TYPEt">t</a> -&gt; Format.formatter -&gt; <a href="Warnings.html#TYPEt">Warnings.t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Prints a warning. This is simply the composition of <code class="code">report_warning</code> and
   <code class="code">print_report</code>.</p>
</div>
</div>

<pre><span id="VALprerr_warning"><span class="keyword">val</span> prerr_warning</span> : <code class="type"><a href="Location.html#TYPEt">t</a> -&gt; <a href="Warnings.html#TYPEt">Warnings.t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <code class="code">print_warning</code>, but uses <code class="code">!formatter_for_warnings</code> as output
   formatter.</p>
</div>
</div>
<h2 id="1_Reportingalerts">Reporting alerts</h2><h3 id="2_ConvertinganAlerttintoareport">Converting an <code class="code"><span class="constructor">Alert</span>.t</code> into a <code class="code">report</code></h3>
<pre><span id="VALreport_alert"><span class="keyword">val</span> report_alert</span> : <code class="type"><a href="Location.html#TYPEt">t</a> -&gt; <a href="Warnings.html#TYPEalert">Warnings.alert</a> -&gt; <a href="Location.html#TYPEreport">report</a> option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">report_alert&nbsp;loc&nbsp;w</code> produces a report for the given alert <code class="code">w</code>, or
   <code class="code"><span class="constructor">None</span></code> if the alert is not to be printed.</p>
</div>
</div>

<pre><span id="VALalert_reporter"><span class="keyword">val</span> alert_reporter</span> : <code class="type">(<a href="Location.html#TYPEt">t</a> -&gt; <a href="Warnings.html#TYPEalert">Warnings.alert</a> -&gt; <a href="Location.html#TYPEreport">report</a> option) ref</code></pre><div class="info ">
<div class="info-desc">
<p>Hook for intercepting alerts.</p>
</div>
</div>

<pre><span id="VALdefault_alert_reporter"><span class="keyword">val</span> default_alert_reporter</span> : <code class="type"><a href="Location.html#TYPEt">t</a> -&gt; <a href="Warnings.html#TYPEalert">Warnings.alert</a> -&gt; <a href="Location.html#TYPEreport">report</a> option</code></pre><div class="info ">
<div class="info-desc">
<p>Original alert reporter for use in hooks.</p>
</div>
</div>
<h3 id="2_Printingalerts">Printing alerts</h3>
<pre><span id="VALprint_alert"><span class="keyword">val</span> print_alert</span> : <code class="type"><a href="Location.html#TYPEt">t</a> -&gt; Format.formatter -&gt; <a href="Warnings.html#TYPEalert">Warnings.alert</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Prints an alert. This is simply the composition of <code class="code">report_alert</code> and
   <code class="code">print_report</code>.</p>
</div>
</div>

<pre><span id="VALprerr_alert"><span class="keyword">val</span> prerr_alert</span> : <code class="type"><a href="Location.html#TYPEt">t</a> -&gt; <a href="Warnings.html#TYPEalert">Warnings.alert</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <code class="code">print_alert</code>, but uses <code class="code">!formatter_for_warnings</code> as output
   formatter.</p>
</div>
</div>

<pre><span id="VALdeprecated"><span class="keyword">val</span> deprecated</span> : <code class="type">?def:<a href="Location.html#TYPEt">t</a> -&gt; ?use:<a href="Location.html#TYPEt">t</a> -&gt; <a href="Location.html#TYPEt">t</a> -&gt; string -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Prints a deprecation alert.</p>
</div>
</div>

<pre><span id="VALalert"><span class="keyword">val</span> alert</span> : <code class="type">?def:<a href="Location.html#TYPEt">t</a> -&gt;<br>       ?use:<a href="Location.html#TYPEt">t</a> -&gt; kind:string -&gt; <a href="Location.html#TYPEt">t</a> -&gt; string -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Prints an arbitrary alert.</p>
</div>
</div>
<h2 id="1_Reportingerrors">Reporting errors</h2>
<pre><span id="TYPEerror"><span class="keyword">type</span> <code class="type"></code>error</span> = <code class="type"><a href="Location.html#TYPEreport">report</a></code> </pre>
<div class="info ">
<div class="info-desc">
<p>An <code class="code">error</code> is a <code class="code">report</code> which <code class="code">report_kind</code> must be <code class="code"><span class="constructor">Report_error</span></code>.</p>
</div>
</div>


<pre><span id="VALerror"><span class="keyword">val</span> error</span> : <code class="type">?loc:<a href="Location.html#TYPEt">t</a> -&gt; ?sub:<a href="Location.html#TYPEmsg">msg</a> list -&gt; string -&gt; <a href="Location.html#TYPEerror">error</a></code></pre>
<pre><span id="VALerrorf"><span class="keyword">val</span> errorf</span> : <code class="type">?loc:<a href="Location.html#TYPEt">t</a> -&gt;<br>       ?sub:<a href="Location.html#TYPEmsg">msg</a> list -&gt;<br>       ('a, Format.formatter, unit, <a href="Location.html#TYPEerror">error</a>) format4 -&gt; 'a</code></pre>
<pre><span id="VALerror_of_printer"><span class="keyword">val</span> error_of_printer</span> : <code class="type">?loc:<a href="Location.html#TYPEt">t</a> -&gt;<br>       ?sub:<a href="Location.html#TYPEmsg">msg</a> list -&gt;<br>       (Format.formatter -&gt; 'a -&gt; unit) -&gt; 'a -&gt; <a href="Location.html#TYPEerror">error</a></code></pre>
<pre><span id="VALerror_of_printer_file"><span class="keyword">val</span> error_of_printer_file</span> : <code class="type">(Format.formatter -&gt; 'a -&gt; unit) -&gt; 'a -&gt; <a href="Location.html#TYPEerror">error</a></code></pre><h2 id="1_Automaticallyreportingerrorsforraisedexceptions">Automatically reporting errors for raised exceptions</h2>
<pre><span id="VALregister_error_of_exn"><span class="keyword">val</span> register_error_of_exn</span> : <code class="type">(exn -&gt; <a href="Location.html#TYPEerror">error</a> option) -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Each compiler module which defines a custom type of exception
    which can surface as a user-visible error should register
    a "printer" for this exception using <code class="code">register_error_of_exn</code>.
    The result of the printer is an <code class="code">error</code> value containing
    a location, a message, and optionally sub-messages (each of them
    being located as well).</p>
</div>
</div>

<pre><span id="VALerror_of_exn"><span class="keyword">val</span> error_of_exn</span> : <code class="type">exn -&gt; [ `Already_displayed | `Ok of <a href="Location.html#TYPEerror">error</a> ] option</code></pre>
<pre><span id="EXCEPTIONError"><span class="keyword">exception</span> Error</span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEerror">error</a></code></pre>
<div class="info ">
<div class="info-desc">
<p>Raising <code class="code"><span class="constructor">Error</span>&nbsp;e</code> signals an error <code class="code">e</code>; the exception will be caught and the
   error will be printed.</p>
</div>
</div>

<pre><span id="EXCEPTIONAlready_displayed_error"><span class="keyword">exception</span> Already_displayed_error</span></pre>
<div class="info ">
<div class="info-desc">
<p>Raising <code class="code"><span class="constructor">Already_displayed_error</span></code> signals an error which has already been
   printed. The exception will be caught, but nothing will be printed</p>
</div>
</div>

<pre><span id="VALraise_errorf"><span class="keyword">val</span> raise_errorf</span> : <code class="type">?loc:<a href="Location.html#TYPEt">t</a> -&gt;<br>       ?sub:<a href="Location.html#TYPEmsg">msg</a> list -&gt;<br>       ('a, Format.formatter, unit, 'b) format4 -&gt; 'a</code></pre>
<pre><span id="VALreport_exception"><span class="keyword">val</span> report_exception</span> : <code class="type">Format.formatter -&gt; exn -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Reraise the exception if it is unknown.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>