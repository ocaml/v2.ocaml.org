<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Format</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Format.html">Format</a></h1>

<pre><span class="keyword">module</span> Format: <code class="code"><span class="keyword">sig</span></code> <a href="Format.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Pretty printing.
<p>

   This module implements a pretty-printing facility to format values
   within 'pretty-printing boxes'. The pretty-printer splits lines
   at specified break hints, and indents lines according to the box
   structure.
</p><p>

   For a gentle introduction to the basics of pretty-printing using
   <code class="code"><span class="constructor">Format</span></code>, read
   <a href="http://caml.inria.fr/resources/doc/guides/format.en.html">
    http://caml.inria.fr/resources/doc/guides/format.en.html</a>.
</p><p>

   You may consider this module as providing an extension to the
   <code class="code">printf</code> facility to provide automatic line splitting. The addition of
   pretty-printing annotations to your regular <code class="code">printf</code> formats gives you
   fancy indentation and line breaks.
   Pretty-printing annotations are described below in the documentation of
   the function <a href="Format.html#VALfprintf"><code class="code"><span class="constructor">Format</span>.fprintf</code></a>.
</p><p>

   You may also use the explicit box management and printing functions
   provided by this module. This style is more basic but more verbose
   than the <code class="code">fprintf</code> concise formats.
</p><p>

   For instance, the sequence
   <code class="code">open_box 0; print_string <span class="string">"x ="</span>; print_space ();
    print_int 1; close_box (); print_newline ()</code>
   that prints <code class="code">x = 1</code> within a pretty-printing box, can be
   abbreviated as <code class="code">printf <span class="string">"@[%s@ %i@]@."</span> <span class="string">"x ="</span> 1</code>, or even shorter
   <code class="code">printf <span class="string">"@[x =@ %i@]@."</span> 1</code>.
</p><p>

   Rule of thumb for casual users of this library:</p><ul>
<li>use simple boxes (as obtained by <code class="code">open_box 0</code>);</li>
<li>use simple break hints (as obtained by <code class="code">print_cut ()</code> that outputs a
   simple break hint, or by <code class="code">print_space ()</code> that outputs a space
   indicating a break hint);</li>
<li>once a box is opened, display its material with basic printing
   functions (e. g. <code class="code">print_int</code> and <code class="code">print_string</code>);</li>
<li>when the material for a box has been printed, call <code class="code">close_box ()</code> to
   close the box;</li>
<li>at the end of your routine, flush the pretty-printer to display all the
   remaining material, e.g. evaluate <code class="code">print_newline ()</code>.</li>
</ul>

   The behaviour of pretty-printing commands is unspecified
   if there is no opened pretty-printing box. Each box opened via
   one of the <code class="code">open_</code> functions below must be closed using <code class="code">close_box</code>
   for proper formatting. Otherwise, some of the material printed in the
   boxes may not be output, or may be formatted incorrectly.
<p>

   In case of interactive use, the system closes all opened boxes and
   flushes all pending text (as with the <code class="code">print_newline</code> function)
   after each phrase. Each phrase is therefore executed in the initial
   state of the pretty-printer.
</p><p>

   Warning: the material output by the following functions is delayed
   in the pretty-printer queue in order to compute the proper line
   splitting. Hence, you should not mix calls to the printing functions
   of the basic I/O system with calls to the functions of this module:
   this could result in some strange output seemingly unrelated with
   the evaluation order of printing commands.<br>
</p></div>
<hr width="100%">
<br>
<h6 id="6_Boxes">Boxes</h6><br>

<pre><span id="VALopen_box"><span class="keyword">val</span> open_box</span> : <code class="type">int -&gt; unit</code></pre><div class="info ">
<code class="code">open_box d</code> opens a new pretty-printing box
   with offset <code class="code">d</code>.
<p>

   This box prints material as much as possible on every line.
</p><p>

   A break hint splits the line if there is no more room on the line to
   print the remainder of the box.
   A break hint also splits the line if the splitting ``moves to the left''
   (i.e. it gives an indentation smaller than the one of the current line).
</p><p>

   This box is the general purpose pretty-printing box.
</p><p>

   If the pretty-printer splits the line in the box, offset <code class="code">d</code> is added to
   the current indentation.<br>
</p></div>

<pre><span id="VALclose_box"><span class="keyword">val</span> close_box</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Closes the most recently opened pretty-printing box.<br>
</div>
<br>
<h6 id="6_Formattingfunctions">Formatting functions</h6><br>

<pre><span id="VALprint_string"><span class="keyword">val</span> print_string</span> : <code class="type">string -&gt; unit</code></pre><div class="info ">
<code class="code">print_string str</code> prints <code class="code">str</code> in the current box.<br>
</div>

<pre><span id="VALprint_as"><span class="keyword">val</span> print_as</span> : <code class="type">int -&gt; string -&gt; unit</code></pre><div class="info ">
<code class="code">print_as len str</code> prints <code class="code">str</code> in the
   current box. The pretty-printer formats <code class="code">str</code> as if
   it were of length <code class="code">len</code>.<br>
</div>

<pre><span id="VALprint_int"><span class="keyword">val</span> print_int</span> : <code class="type">int -&gt; unit</code></pre><div class="info ">
Prints an integer in the current box.<br>
</div>

<pre><span id="VALprint_float"><span class="keyword">val</span> print_float</span> : <code class="type">float -&gt; unit</code></pre><div class="info ">
Prints a floating point number in the current box.<br>
</div>

<pre><span id="VALprint_char"><span class="keyword">val</span> print_char</span> : <code class="type">char -&gt; unit</code></pre><div class="info ">
Prints a character in the current box.<br>
</div>

<pre><span id="VALprint_bool"><span class="keyword">val</span> print_bool</span> : <code class="type">bool -&gt; unit</code></pre><div class="info ">
Prints a boolean in the current box.<br>
</div>
<br>
<h6 id="6_Breakhints">Break hints</h6><br>
<br>
A 'break hint' tells the pretty-printer to output some space or split the
  line whichever way is more appropriate to the current box splitting rules.
<p>

  Break hints are used to separate printing items and are mandatory to let
  the pretty-printer correctly split lines and indent items.
</p><p>

  Simple break hints are:</p><ul>
<li>the 'space': output a space or split the line if appropriate,</li>
<li>the 'cut': split the line if appropriate.</li>
</ul>

  Note: the notions of space and line splitting are abstract for the
  pretty-printing engine, since those notions can be completely defined
  by the programmer.
  However, in the pretty-printer default setting, ``output a space'' simply
  means printing a space character (ASCII code 32) and ``split the line''
  is printing a newline character (ASCII code 10).<br>

<pre><span id="VALprint_space"><span class="keyword">val</span> print_space</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<code class="code">print_space ()</code> the 'space' break hint:
  the pretty-printer may split the line at this
  point, otherwise it prints one space.
  It is equivalent to <code class="code">print_break 1 0</code>.<br>
</div>

<pre><span id="VALprint_cut"><span class="keyword">val</span> print_cut</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<code class="code">print_cut ()</code> the 'cut' break hint:
  the pretty-printer may split the line at this
  point, otherwise it prints nothing.
  It is equivalent to <code class="code">print_break 0 0</code>.<br>
</div>

<pre><span id="VALprint_break"><span class="keyword">val</span> print_break</span> : <code class="type">int -&gt; int -&gt; unit</code></pre><div class="info ">
<code class="code">print_break nspaces offset</code> the 'full' break hint:
  the pretty-printer may split the line at this
  point, otherwise it prints <code class="code">nspaces</code> spaces.
<p>

  If the pretty-printer splits the line, <code class="code">offset</code> is added to
  the current indentation.<br>
</p></div>

<pre><span id="VALprint_flush"><span class="keyword">val</span> print_flush</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Flushes the pretty printer: all opened boxes are closed,
  and all pending text is displayed.<br>
</div>

<pre><span id="VALprint_newline"><span class="keyword">val</span> print_newline</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Equivalent to <code class="code">print_flush</code> followed by a new line.<br>
</div>

<pre><span id="VALforce_newline"><span class="keyword">val</span> force_newline</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Forces a new line in the current box.
  Not the normal way of pretty-printing, since the new line does not reset
  the current line count.
  You should prefer using break hints within a vertcal box.<br>
</div>

<pre><span id="VALprint_if_newline"><span class="keyword">val</span> print_if_newline</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Executes the next formatting command if the preceding line
  has just been split. Otherwise, ignore the next formatting
  command.<br>
</div>
<br>
<h6 id="6_Margin">Margin</h6><br>

<pre><span id="VALset_margin"><span class="keyword">val</span> set_margin</span> : <code class="type">int -&gt; unit</code></pre><div class="info ">
<code class="code">set_margin d</code> sets the right margin to <code class="code">d</code> (in characters):
  the pretty-printer splits lines that overflow the right margin according to
  the break hints given.
  Nothing happens if <code class="code">d</code> is smaller than 2.
  If <code class="code">d</code> is too large, the right margin is set to the maximum
  admissible value (which is greater than <code class="code">10^9</code>).<br>
</div>

<pre><span id="VALget_margin"><span class="keyword">val</span> get_margin</span> : <code class="type">unit -&gt; int</code></pre><div class="info ">
Returns the position of the right margin.<br>
</div>
<br>
<h6 id="6_Maximumindentationlimit">Maximum indentation limit</h6><br>

<pre><span id="VALset_max_indent"><span class="keyword">val</span> set_max_indent</span> : <code class="type">int -&gt; unit</code></pre><div class="info ">
<code class="code">set_max_indent d</code> sets the maximum indentation limit of lines to <code class="code">d</code> (in
  characters):
  once this limit is reached, new boxes are rejected to the left,
  if they do not fit on the current line.
  Nothing happens if <code class="code">d</code> is smaller than 2.
  If <code class="code">d</code> is too large, the limit is set to the maximum
  admissible value (which is greater than <code class="code">10 ^ 9</code>).<br>
</div>

<pre><span id="VALget_max_indent"><span class="keyword">val</span> get_max_indent</span> : <code class="type">unit -&gt; int</code></pre><div class="info ">
Return the maximum indentation limit (in characters).<br>
</div>
<br>
<h6 id="6_Formattingdepthmaximumnumberofboxesallowedbeforeellipsis">Formatting depth: maximum number of boxes allowed before ellipsis</h6><br>

<pre><span id="VALset_max_boxes"><span class="keyword">val</span> set_max_boxes</span> : <code class="type">int -&gt; unit</code></pre><div class="info ">
<code class="code">set_max_boxes max</code> sets the maximum number of boxes simultaneously
  opened.
  Material inside boxes nested deeper is printed as an ellipsis (more
  precisely as the text returned by <code class="code">get_ellipsis_text ()</code>).
  Nothing happens if <code class="code">max</code> is smaller than 2.<br>
</div>

<pre><span id="VALget_max_boxes"><span class="keyword">val</span> get_max_boxes</span> : <code class="type">unit -&gt; int</code></pre><div class="info ">
Returns the maximum number of boxes allowed before ellipsis.<br>
</div>

<pre><span id="VALover_max_boxes"><span class="keyword">val</span> over_max_boxes</span> : <code class="type">unit -&gt; bool</code></pre><div class="info ">
Tests if the maximum number of boxes allowed have already been opened.<br>
</div>
<br>
<h6 id="6_Advancedformatting">Advanced formatting</h6><br>

<pre><span id="VALopen_hbox"><span class="keyword">val</span> open_hbox</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<code class="code">open_hbox ()</code> opens a new 'horizontal' pretty-printing box.
<p>

  This box prints material on a single line.
</p><p>

  Break hints in a horizontal box never split the line.
  (Line splitting may still occur inside boxes nested deeper).<br>
</p></div>

<pre><span id="VALopen_vbox"><span class="keyword">val</span> open_vbox</span> : <code class="type">int -&gt; unit</code></pre><div class="info ">
<code class="code">open_vbox d</code> opens a new 'vertical' pretty-printing box
  with offset <code class="code">d</code>.
<p>

  This box prints material on as many lines as break hints in the box.
</p><p>

  Every break hint in a vertical box splits the line.
</p><p>

  If the pretty-printer splits the line in the box, <code class="code">d</code> is added to the
  current indentation.<br>
</p></div>

<pre><span id="VALopen_hvbox"><span class="keyword">val</span> open_hvbox</span> : <code class="type">int -&gt; unit</code></pre><div class="info ">
<code class="code">open_hvbox d</code> opens a new 'horizontal-vertical' pretty-printing box
  with offset <code class="code">d</code>.
<p>

  This box behaves as an horizontal box if it fits on a single line,
  otherwise it behaves as a vertical box.
</p><p>

  If the pretty-printer splits the line in the box, <code class="code">d</code> is added to the
  current indentation.<br>
</p></div>

<pre><span id="VALopen_hovbox"><span class="keyword">val</span> open_hovbox</span> : <code class="type">int -&gt; unit</code></pre><div class="info ">
<code class="code">open_hovbox d</code> opens a new 'horizontal-or-vertical' pretty-printing box
  with offset <code class="code">d</code>.
<p>

  This box prints material as much as possible on every line.
</p><p>

  A break hint splits the line if there is no more room on the line to
  print the remainder of the box.
</p><p>

  If the pretty-printer splits the line in the box, <code class="code">d</code> is added to the
  current indentation.<br>
</p></div>
<br>
<h6 id="6_Ellipsis">Ellipsis</h6><br>

<pre><span id="VALset_ellipsis_text"><span class="keyword">val</span> set_ellipsis_text</span> : <code class="type">string -&gt; unit</code></pre><div class="info ">
Set the text of the ellipsis printed when too many boxes
  are opened (a single dot, <code class="code">.</code>, by default).<br>
</div>

<pre><span id="VALget_ellipsis_text"><span class="keyword">val</span> get_ellipsis_text</span> : <code class="type">unit -&gt; string</code></pre><div class="info ">
Return the text of the ellipsis.<br>
</div>
<br>
<h6 id="tags">Semantics Tags</h6><br>

<pre><span id="TYPEtag"><span class="keyword">type</span> <code class="type"></code>tag</span> = <code class="type">string</code> </pre>

<br>
<i>Semantics tags</i> (or simply <em>tags</em>) are used to decorate printed
  entities for user's defined purposes, e.g. setting font and giving size
  indications for a display device, or marking delimitation of semantics
  entities (e.g. HTML or TeX elements or terminal escape sequences).
<p>

  By default, those tags do not influence line splitting calculation:
  the tag 'markers' are not considered as part of the printing
  material that drives line splitting (in other words, the length of
  those strings is considered as zero for line splitting).
</p><p>

  Thus, tag handling is in some sense transparent to pretty-printing
  and does not interfere with usual indentation. Hence, a single
  pretty printing routine can output both simple 'verbatim'
  material or richer decorated output depending on the treatment of
  tags. By default, tags are not active, hence the output is not
  decorated with tag information. Once <code class="code">set_tags</code> is set to <code class="code"><span class="keyword">true</span></code>,
  the pretty printer engine honours tags and decorates the output
  accordingly.
</p><p>

  When a tag has been opened (or closed), it is both and successively
  'printed' and 'marked'. Printing a tag means calling a
  formatter specific function with the name of the tag as argument:
  that 'tag printing' function can then print any regular material
  to the formatter (so that this material is enqueued as usual in the
  formatter queue for further line splitting computation). Marking a
  tag means to output an arbitrary string (the 'tag marker'),
  directly into the output device of the formatter. Hence, the
  formatter specific 'tag marking' function must return the tag
  marker string associated to its tag argument. Being flushed
  directly into the output device of the formatter, tag marker
  strings are not considered as part of the printing material that
  drives line splitting (in other words, the length of the strings
  corresponding to tag markers is considered as zero for line
  splitting). In addition, advanced users may take advantage of
  the specificity of tag markers to be precisely output when the
  pretty printer has already decided where to splitt the lines, and
  precisely when the queue is flushed into the output device.
</p><p>

  In the spirit of HTML tags, the default tag marking functions
  output tags enclosed in "&lt;" and "&gt;": hence, the opening marker of
  tag <code class="code">t</code> is <code class="code"><span class="string">"&lt;t&gt;"</span></code> and the closing marker <code class="code"><span class="string">"&lt;/t&gt;"</span></code>.
</p><p>

  Default tag printing functions just do nothing.
</p><p>

  Tag marking and tag printing functions are user definable and can
  be set by calling <code class="code">set_formatter_tag_functions</code>.<br>

</p><pre><span id="VALopen_tag"><span class="keyword">val</span> open_tag</span> : <code class="type"><a href="Format.html#TYPEtag">tag</a> -&gt; unit</code></pre><div class="info ">
<code class="code">open_tag t</code> opens the tag named <code class="code">t</code>; the <code class="code">print_open_tag</code>
  function of the formatter is called with <code class="code">t</code> as argument;
  the tag marker <code class="code">mark_open_tag t</code> will be flushed into the output
  device of the formatter.<br>
</div>

<pre><span id="VALclose_tag"><span class="keyword">val</span> close_tag</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<code class="code">close_tag ()</code> closes the most recently opened tag <code class="code">t</code>.
  In addition, the <code class="code">print_close_tag</code> function of the formatter is called
  with <code class="code">t</code> as argument. The marker <code class="code">mark_close_tag t</code> will be flushed
  into the output device of the formatter.<br>
</div>

<pre><span id="VALset_tags"><span class="keyword">val</span> set_tags</span> : <code class="type">bool -&gt; unit</code></pre><div class="info ">
<code class="code">set_tags b</code> turns on or off the treatment of tags (default is off).<br>
</div>

<pre><span id="VALset_print_tags"><span class="keyword">val</span> set_print_tags</span> : <code class="type">bool -&gt; unit</code></pre><div class="info ">
<code class="code">set_print_tags b</code> turns on or off the printing of tags.<br>
</div>

<pre><span id="VALset_mark_tags"><span class="keyword">val</span> set_mark_tags</span> : <code class="type">bool -&gt; unit</code></pre><div class="info ">
<code class="code">set_mark_tags b</code> turns on or off the output of tag markers.<br>
</div>

<pre><span id="VALget_print_tags"><span class="keyword">val</span> get_print_tags</span> : <code class="type">unit -&gt; bool</code></pre><div class="info ">
Return the current status of tags printing.<br>
</div>

<pre><span id="VALget_mark_tags"><span class="keyword">val</span> get_mark_tags</span> : <code class="type">unit -&gt; bool</code></pre><div class="info ">
Return the current status of tags marking.<br>
</div>
<br>
<h6 id="6_Redirectingthestandardformatteroutput">Redirecting the standard formatter output</h6><br>

<pre><span id="VALset_formatter_out_channel"><span class="keyword">val</span> set_formatter_out_channel</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; unit</code></pre><div class="info ">
Redirect the pretty-printer output to the given channel.
  (All the output functions of the standard formatter are set to the
   default output functions printing to the given channel.)<br>
</div>

<pre><span id="VALset_formatter_output_functions"><span class="keyword">val</span> set_formatter_output_functions</span> : <code class="type">(string -&gt; int -&gt; int -&gt; unit) -&gt; (unit -&gt; unit) -&gt; unit</code></pre><div class="info ">
<code class="code">set_formatter_output_functions out flush</code> redirects the
  pretty-printer output functions to the functions <code class="code">out</code> and
  <code class="code">flush</code>.
<p>

  The <code class="code">out</code> function performs all the pretty-printer string output.
  It is called with a string <code class="code">s</code>, a start position <code class="code">p</code>, and a number of
  characters <code class="code">n</code>; it is supposed to output characters <code class="code">p</code> to <code class="code">p + n - 1</code> of
  <code class="code">s</code>.
</p><p>

  The <code class="code">flush</code> function is called whenever the pretty-printer is flushed
  (via conversion <code class="code">%!</code>, or pretty-printing indications <code class="code">@?</code> or <code class="code">@.</code>, or
  using low level functions <code class="code">print_flush</code> or <code class="code">print_newline</code>).<br>
</p></div>

<pre><span id="VALget_formatter_output_functions"><span class="keyword">val</span> get_formatter_output_functions</span> : <code class="type">unit -&gt; (string -&gt; int -&gt; int -&gt; unit) * (unit -&gt; unit)</code></pre><div class="info ">
Return the current output functions of the pretty-printer.<br>
</div>
<br>
<h6 id="meaning">Changing the meaning of standard formatter pretty printing</h6><br>
<br>
The <code class="code"><span class="constructor">Format</span></code> module is versatile enough to let you completely redefine
  the meaning of pretty printing: you may provide your own functions to define
  how to handle indentation, line splitting, and even printing of all the
  characters that have to be printed!<br>

<pre><code><span id="TYPEformatter_out_functions"><span class="keyword">type</span> <code class="type"></code>formatter_out_functions</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTformatter_out_functions.out_string">out_string</span>&nbsp;: <code class="type">string -&gt; int -&gt; int -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTformatter_out_functions.out_flush">out_flush</span>&nbsp;: <code class="type">unit -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTformatter_out_functions.out_newline">out_newline</span>&nbsp;: <code class="type">unit -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTformatter_out_functions.out_spaces">out_spaces</span>&nbsp;: <code class="type">int -&gt; unit</code>;</code></td>

</tr></tbody></table>
}



<pre><span id="VALset_formatter_out_functions"><span class="keyword">val</span> set_formatter_out_functions</span> : <code class="type"><a href="Format.html#TYPEformatter_out_functions">formatter_out_functions</a> -&gt; unit</code></pre><div class="info ">
<code class="code">set_formatter_out_functions f</code>
  Redirect the pretty-printer output to the functions <code class="code">f.out_string</code>
  and <code class="code">f.out_flush</code> as described in
  <code class="code">set_formatter_output_functions</code>. In addition, the pretty-printer function
  that outputs a newline is set to the function <code class="code">f.out_newline</code> and
  the function that outputs indentation spaces is set to the function
  <code class="code">f.out_spaces</code>.
<p>

  This way, you can change the meaning of indentation (which can be
  something else than just printing space characters) and the meaning of new
  lines opening (which can be connected to any other action needed by the
  application at hand). The two functions <code class="code">f.out_spaces</code> and <code class="code">f.out_newline</code>
  are normally connected to <code class="code">f.out_string</code> and <code class="code">f.out_flush</code>: respective
  default values for <code class="code">f.out_space</code> and <code class="code">f.out_newline</code> are
  <code class="code">f.out_string (<span class="constructor">String</span>.make n <span class="string">' '</span>) 0 n</code> and <code class="code">f.out_string <span class="string">"\n"</span> 0 1</code>.<br>
</p></div>

<pre><span id="VALget_formatter_out_functions"><span class="keyword">val</span> get_formatter_out_functions</span> : <code class="type">unit -&gt; <a href="Format.html#TYPEformatter_out_functions">formatter_out_functions</a></code></pre><div class="info ">
Return the current output functions of the pretty-printer,
  including line splitting and indentation functions. Useful to record the
  current setting and restore it afterwards.<br>
</div>
<br>
<h6 id="tagsmeaning">Changing the meaning of printing semantics tags</h6><br>

<pre><code><span id="TYPEformatter_tag_functions"><span class="keyword">type</span> <code class="type"></code>formatter_tag_functions</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTformatter_tag_functions.mark_open_tag">mark_open_tag</span>&nbsp;: <code class="type"><a href="Format.html#TYPEtag">tag</a> -&gt; string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTformatter_tag_functions.mark_close_tag">mark_close_tag</span>&nbsp;: <code class="type"><a href="Format.html#TYPEtag">tag</a> -&gt; string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTformatter_tag_functions.print_open_tag">print_open_tag</span>&nbsp;: <code class="type"><a href="Format.html#TYPEtag">tag</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTformatter_tag_functions.print_close_tag">print_close_tag</span>&nbsp;: <code class="type"><a href="Format.html#TYPEtag">tag</a> -&gt; unit</code>;</code></td>

</tr></tbody></table>
}

<div class="info ">
The tag handling functions specific to a formatter:
  <code class="code">mark</code> versions are the 'tag marking' functions that associate a string
  marker to a tag in order for the pretty-printing engine to flush
  those markers as 0 length tokens in the output device of the formatter.
  <code class="code">print</code> versions are the 'tag printing' functions that can perform
  regular printing when a tag is closed or opened.<br>
</div>


<pre><span id="VALset_formatter_tag_functions"><span class="keyword">val</span> set_formatter_tag_functions</span> : <code class="type"><a href="Format.html#TYPEformatter_tag_functions">formatter_tag_functions</a> -&gt; unit</code></pre><div class="info ">
<code class="code">set_formatter_tag_functions tag_funs</code> changes the meaning of
  opening and closing tags to use the functions in <code class="code">tag_funs</code>.
<p>

  When opening a tag name <code class="code">t</code>, the string <code class="code">t</code> is passed to the
  opening tag marking function (the <code class="code">mark_open_tag</code> field of the
  record <code class="code">tag_funs</code>), that must return the opening tag marker for
  that name. When the next call to <code class="code">close_tag ()</code> happens, the tag
  name <code class="code">t</code> is sent back to the closing tag marking function (the
  <code class="code">mark_close_tag</code> field of record <code class="code">tag_funs</code>), that must return a
  closing tag marker for that name.
</p><p>

  The <code class="code">print_</code> field of the record contains the functions that are
  called at tag opening and tag closing time, to output regular
  material in the pretty-printer queue.<br>
</p></div>

<pre><span id="VALget_formatter_tag_functions"><span class="keyword">val</span> get_formatter_tag_functions</span> : <code class="type">unit -&gt; <a href="Format.html#TYPEformatter_tag_functions">formatter_tag_functions</a></code></pre><div class="info ">
Return the current tag functions of the pretty-printer.<br>
</div>
<br>
<h6 id="6_Multipleformattedoutput">Multiple formatted output</h6><br>

<pre><span id="TYPEformatter"><span class="keyword">type</span> <code class="type"></code>formatter</span> </pre>
<div class="info ">
Abstract data corresponding to a pretty-printer (also called a
  formatter) and all its machinery.
<p>

  Defining new pretty-printers permits unrelated output of material in
  parallel on several output channels.
  All the parameters of a pretty-printer are local to a formatter:
  margin, maximum indentation limit, maximum number of boxes
  simultaneously opened, ellipsis, and so on, are specific to
  each pretty-printer and may be fixed independently.
  Given a <code class="code"><span class="constructor">Pervasives</span>.out_channel</code> output channel <code class="code">oc</code>, a new formatter
  writing to that channel is simply obtained by calling
  <code class="code">formatter_of_out_channel oc</code>.
  Alternatively, the <code class="code">make_formatter</code> function allocates a new
  formatter with explicit output and flushing functions
  (convenient to output material to strings for instance).<br>
</p></div>


<pre><span id="VALformatter_of_out_channel"><span class="keyword">val</span> formatter_of_out_channel</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; <a href="Format.html#TYPEformatter">formatter</a></code></pre><div class="info ">
<code class="code">formatter_of_out_channel oc</code> returns a new formatter that
  writes to the corresponding channel <code class="code">oc</code>.<br>
</div>

<pre><span id="VALstd_formatter"><span class="keyword">val</span> std_formatter</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a></code></pre><div class="info ">
The standard formatter used by the formatting functions
  above. It is defined as <code class="code">formatter_of_out_channel stdout</code>.<br>
</div>

<pre><span id="VALerr_formatter"><span class="keyword">val</span> err_formatter</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a></code></pre><div class="info ">
A formatter to use with formatting functions below for
  output to standard error. It is defined as
  <code class="code">formatter_of_out_channel stderr</code>.<br>
</div>

<pre><span id="VALformatter_of_buffer"><span class="keyword">val</span> formatter_of_buffer</span> : <code class="type"><a href="Buffer.html#TYPEt">Buffer.t</a> -&gt; <a href="Format.html#TYPEformatter">formatter</a></code></pre><div class="info ">
<code class="code">formatter_of_buffer b</code> returns a new formatter writing to
  buffer <code class="code">b</code>. As usual, the formatter has to be flushed at
  the end of pretty printing, using <code class="code">pp_print_flush</code> or
  <code class="code">pp_print_newline</code>, to display all the pending material.<br>
</div>

<pre><span id="VALstdbuf"><span class="keyword">val</span> stdbuf</span> : <code class="type"><a href="Buffer.html#TYPEt">Buffer.t</a></code></pre><div class="info ">
The string buffer in which <code class="code">str_formatter</code> writes.<br>
</div>

<pre><span id="VALstr_formatter"><span class="keyword">val</span> str_formatter</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a></code></pre><div class="info ">
A formatter to use with formatting functions below for
  output to the <code class="code">stdbuf</code> string buffer.
  <code class="code">str_formatter</code> is defined as <code class="code">formatter_of_buffer stdbuf</code>.<br>
</div>

<pre><span id="VALflush_str_formatter"><span class="keyword">val</span> flush_str_formatter</span> : <code class="type">unit -&gt; string</code></pre><div class="info ">
Returns the material printed with <code class="code">str_formatter</code>, flushes
  the formatter and resets the corresponding buffer.<br>
</div>

<pre><span id="VALmake_formatter"><span class="keyword">val</span> make_formatter</span> : <code class="type">(string -&gt; int -&gt; int -&gt; unit) -&gt; (unit -&gt; unit) -&gt; <a href="Format.html#TYPEformatter">formatter</a></code></pre><div class="info ">
<code class="code">make_formatter out flush</code> returns a new formatter that writes according
  to the output function <code class="code">out</code>, and the flushing function <code class="code">flush</code>. For
  instance, a formatter to the <code class="code"><span class="constructor">Pervasives</span>.out_channel</code> <code class="code">oc</code> is returned by
  <code class="code">make_formatter (<span class="constructor">Pervasives</span>.output oc) (<span class="keyword">fun</span> () <span class="keywordsign">-&gt;</span> <span class="constructor">Pervasives</span>.flush oc)</code>.<br>
</div>
<br>
<h6 id="6_Basicfunctionstousewithformatters">Basic functions to use with formatters</h6><br>

<pre><span id="VALpp_open_hbox"><span class="keyword">val</span> pp_open_hbox</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit</code></pre>
<pre><span id="VALpp_open_vbox"><span class="keyword">val</span> pp_open_vbox</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALpp_open_hvbox"><span class="keyword">val</span> pp_open_hvbox</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALpp_open_hovbox"><span class="keyword">val</span> pp_open_hovbox</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALpp_open_box"><span class="keyword">val</span> pp_open_box</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALpp_close_box"><span class="keyword">val</span> pp_close_box</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit</code></pre>
<pre><span id="VALpp_open_tag"><span class="keyword">val</span> pp_open_tag</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; string -&gt; unit</code></pre>
<pre><span id="VALpp_close_tag"><span class="keyword">val</span> pp_close_tag</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit</code></pre>
<pre><span id="VALpp_print_string"><span class="keyword">val</span> pp_print_string</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; string -&gt; unit</code></pre>
<pre><span id="VALpp_print_as"><span class="keyword">val</span> pp_print_as</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; int -&gt; string -&gt; unit</code></pre>
<pre><span id="VALpp_print_int"><span class="keyword">val</span> pp_print_int</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALpp_print_float"><span class="keyword">val</span> pp_print_float</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; float -&gt; unit</code></pre>
<pre><span id="VALpp_print_char"><span class="keyword">val</span> pp_print_char</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; char -&gt; unit</code></pre>
<pre><span id="VALpp_print_bool"><span class="keyword">val</span> pp_print_bool</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; bool -&gt; unit</code></pre>
<pre><span id="VALpp_print_break"><span class="keyword">val</span> pp_print_break</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; int -&gt; int -&gt; unit</code></pre>
<pre><span id="VALpp_print_cut"><span class="keyword">val</span> pp_print_cut</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit</code></pre>
<pre><span id="VALpp_print_space"><span class="keyword">val</span> pp_print_space</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit</code></pre>
<pre><span id="VALpp_force_newline"><span class="keyword">val</span> pp_force_newline</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit</code></pre>
<pre><span id="VALpp_print_flush"><span class="keyword">val</span> pp_print_flush</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit</code></pre>
<pre><span id="VALpp_print_newline"><span class="keyword">val</span> pp_print_newline</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit</code></pre>
<pre><span id="VALpp_print_if_newline"><span class="keyword">val</span> pp_print_if_newline</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit</code></pre>
<pre><span id="VALpp_set_tags"><span class="keyword">val</span> pp_set_tags</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; bool -&gt; unit</code></pre>
<pre><span id="VALpp_set_print_tags"><span class="keyword">val</span> pp_set_print_tags</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; bool -&gt; unit</code></pre>
<pre><span id="VALpp_set_mark_tags"><span class="keyword">val</span> pp_set_mark_tags</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; bool -&gt; unit</code></pre>
<pre><span id="VALpp_get_print_tags"><span class="keyword">val</span> pp_get_print_tags</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; bool</code></pre>
<pre><span id="VALpp_get_mark_tags"><span class="keyword">val</span> pp_get_mark_tags</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; bool</code></pre>
<pre><span id="VALpp_set_margin"><span class="keyword">val</span> pp_set_margin</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALpp_get_margin"><span class="keyword">val</span> pp_get_margin</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; int</code></pre>
<pre><span id="VALpp_set_max_indent"><span class="keyword">val</span> pp_set_max_indent</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALpp_get_max_indent"><span class="keyword">val</span> pp_get_max_indent</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; int</code></pre>
<pre><span id="VALpp_set_max_boxes"><span class="keyword">val</span> pp_set_max_boxes</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; int -&gt; unit</code></pre>
<pre><span id="VALpp_get_max_boxes"><span class="keyword">val</span> pp_get_max_boxes</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; int</code></pre>
<pre><span id="VALpp_over_max_boxes"><span class="keyword">val</span> pp_over_max_boxes</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; bool</code></pre>
<pre><span id="VALpp_set_ellipsis_text"><span class="keyword">val</span> pp_set_ellipsis_text</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; string -&gt; unit</code></pre>
<pre><span id="VALpp_get_ellipsis_text"><span class="keyword">val</span> pp_get_ellipsis_text</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; string</code></pre>
<pre><span id="VALpp_set_formatter_out_channel"><span class="keyword">val</span> pp_set_formatter_out_channel</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; <a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; unit</code></pre>
<pre><span id="VALpp_set_formatter_output_functions"><span class="keyword">val</span> pp_set_formatter_output_functions</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; (string -&gt; int -&gt; int -&gt; unit) -&gt; (unit -&gt; unit) -&gt; unit</code></pre>
<pre><span id="VALpp_get_formatter_output_functions"><span class="keyword">val</span> pp_get_formatter_output_functions</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; (string -&gt; int -&gt; int -&gt; unit) * (unit -&gt; unit)</code></pre>
<pre><span id="VALpp_set_formatter_tag_functions"><span class="keyword">val</span> pp_set_formatter_tag_functions</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; <a href="Format.html#TYPEformatter_tag_functions">formatter_tag_functions</a> -&gt; unit</code></pre>
<pre><span id="VALpp_get_formatter_tag_functions"><span class="keyword">val</span> pp_get_formatter_tag_functions</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; <a href="Format.html#TYPEformatter_tag_functions">formatter_tag_functions</a></code></pre>
<pre><span id="VALpp_set_formatter_out_functions"><span class="keyword">val</span> pp_set_formatter_out_functions</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; <a href="Format.html#TYPEformatter_out_functions">formatter_out_functions</a> -&gt; unit</code></pre>
<pre><span id="VALpp_get_formatter_out_functions"><span class="keyword">val</span> pp_get_formatter_out_functions</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; <a href="Format.html#TYPEformatter_out_functions">formatter_out_functions</a></code></pre><div class="info ">
These functions are the basic ones: usual functions
   operating on the standard formatter are defined via partial
   evaluation of these primitives. For instance,
   <code class="code">print_string</code> is equal to <code class="code">pp_print_string std_formatter</code>.<br>
</div>
<br>
<h6 id="6_Convenienceformattingfunctions">Convenience formatting functions.</h6><br>

<pre><span id="VALpp_print_list"><span class="keyword">val</span> pp_print_list</span> : <code class="type">?pp_sep:(<a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit) -&gt;<br>       (<a href="Format.html#TYPEformatter">formatter</a> -&gt; 'a -&gt; unit) -&gt; <a href="Format.html#TYPEformatter">formatter</a> -&gt; 'a list -&gt; unit</code></pre><div class="info ">
<code class="code">pp_print_list ?pp_sep pp_v ppf l</code> prints items of list <code class="code">l</code>,
  using <code class="code">pp_v</code> to print each item, and calling <code class="code">pp_sep</code>
  between items (<code class="code">pp_sep</code> defaults to <a href="Format.html#VALpp_print_cut"><code class="code"><span class="constructor">Format</span>.pp_print_cut</code></a>).
  Does nothing on empty lists.<br>
<b>Since</b> 4.02.0<br>
</div>

<pre><span id="VALpp_print_text"><span class="keyword">val</span> pp_print_text</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; string -&gt; unit</code></pre><div class="info ">
<code class="code">pp_print_text ppf s</code> prints <code class="code">s</code> with spaces and newlines
  respectively printed with <a href="Format.html#VALpp_print_space"><code class="code"><span class="constructor">Format</span>.pp_print_space</code></a> and
  <a href="Format.html#VALpp_force_newline"><code class="code"><span class="constructor">Format</span>.pp_force_newline</code></a>.<br>
<b>Since</b> 4.02.0<br>
</div>
<br>
<h6 id="6_printflikefunctionsforprettyprinting"><code class="code">printf</code> like functions for pretty-printing.</h6><br>

<pre><span id="VALfprintf"><span class="keyword">val</span> fprintf</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; ('a, <a href="Format.html#TYPEformatter">formatter</a>, unit) <a href="Pervasives.html#TYPEformat">format</a> -&gt; 'a</code></pre><br>
<code class="code">fprintf ff fmt arg1 ... argN</code> formats the arguments <code class="code">arg1</code> to <code class="code">argN</code>
  according to the format string <code class="code">fmt</code>, and outputs the resulting string on
  the formatter <code class="code">ff</code>.
<p>

  The format <code class="code">fmt</code> is a character string which contains three types of
  objects: plain characters and conversion specifications as specified in
  the <code class="code"><span class="constructor">Printf</span></code> module, and pretty-printing indications specific to the
  <code class="code"><span class="constructor">Format</span></code> module.
</p><p>

  The pretty-printing indication characters are introduced by
  a <code class="code">@</code> character, and their meanings are:</p><ul>
<li><code class="code">@[</code>: open a pretty-printing box. The type and offset of the
    box may be optionally specified with the following syntax:
    the <code class="code">&lt;</code> character, followed by an optional box type indication,
    then an optional integer offset, and the closing <code class="code">&gt;</code> character.
    Box type is one of <code class="code">h</code>, <code class="code">v</code>, <code class="code">hv</code>, <code class="code">b</code>, or <code class="code">hov</code>.
    '<code class="code">h</code>' stands for an 'horizontal' box,
    '<code class="code">v</code>' stands for a 'vertical' box,
    '<code class="code">hv</code>' stands for an 'horizontal-vertical' box,
    '<code class="code">b</code>' stands for an 'horizontal-or-vertical' box demonstrating indentation,
    '<code class="code">hov</code>' stands a simple 'horizontal-or-vertical' box.
    For instance, <code class="code">@[&lt;hov 2&gt;</code> opens an 'horizontal-or-vertical'
    box with indentation 2 as obtained with <code class="code">open_hovbox 2</code>.
    For more details about boxes, see the various box opening
    functions <code class="code">open_*box</code>.</li>
<li><code class="code">@]</code>: close the most recently opened pretty-printing box.</li>
<li><code class="code">@,</code>: output a 'cut' break hint, as with <code class="code">print_cut ()</code>.</li>
<li><code class="code">@ </code>: output a 'space' break hint, as with <code class="code">print_space ()</code>.</li>
<li><code class="code">@;</code>: output a 'full' break hint as with <code class="code">print_break</code>. The
    <code class="code">nspaces</code> and <code class="code">offset</code> parameters of the break hint may be
    optionally specified with the following syntax:
    the <code class="code">&lt;</code> character, followed by an integer <code class="code">nspaces</code> value,
    then an integer <code class="code">offset</code>, and a closing <code class="code">&gt;</code> character.
    If no parameters are provided, the good break defaults to a
    'space' break hint.</li>
<li><code class="code">@.</code>: flush the pretty printer and split the line, as with
    <code class="code">print_newline ()</code>.</li>
<li><code class="code">@&lt;n&gt;</code>: print the following item as if it were of length <code class="code">n</code>.
    Hence, <code class="code">printf <span class="string">"@&lt;0&gt;%s"</span> arg</code> prints <code class="code">arg</code> as a zero length string.
    If <code class="code">@&lt;n&gt;</code> is not followed by a conversion specification,
    then the following character of the format is printed as if
    it were of length <code class="code">n</code>.</li>
<li><code class="code">@{</code>: open a tag. The name of the tag may be optionally
    specified with the following syntax:
    the <code class="code">&lt;</code> character, followed by an optional string
    specification, and the closing <code class="code">&gt;</code> character. The string
    specification is any character string that does not contain the
    closing character <code class="code"><span class="string">'&gt;'</span></code>. If omitted, the tag name defaults to the
    empty string.
    For more details about tags, see the functions <code class="code">open_tag</code> and
    <code class="code">close_tag</code>.</li>
<li><code class="code">@}</code>: close the most recently opened tag.</li>
<li><code class="code">@?</code>: flush the pretty printer as with <code class="code">print_flush ()</code>.
    This is equivalent to the conversion <code class="code">%!</code>.</li>
<li><code class="code">@\n</code>: force a newline, as with <code class="code">force_newline ()</code>, not the normal way
    of pretty-printing, you should prefer using break hints inside a vertical
    box.</li>
</ul>

  Note: If you need to prevent the interpretation of a <code class="code">@</code> character as a
  pretty-printing indication, you must escape it with a <code class="code">%</code> character.
  Old quotation mode <code class="code">@@</code> is deprecated since it is not compatible with
  formatted input interpretation of character <code class="code"><span class="string">'@'</span></code>.
<p>

  Example: <code class="code">printf <span class="string">"@[%s@ %d@]@."</span> <span class="string">"x ="</span> 1</code> is equivalent to
  <code class="code">open_box (); print_string <span class="string">"x ="</span>; print_space ();
   print_int 1; close_box (); print_newline ()</code>.
  It prints <code class="code">x = 1</code> within a pretty-printing 'horizontal-or-vertical' box.<br>

</p><pre><span id="VALprintf"><span class="keyword">val</span> printf</span> : <code class="type">('a, <a href="Format.html#TYPEformatter">formatter</a>, unit) <a href="Pervasives.html#TYPEformat">format</a> -&gt; 'a</code></pre><div class="info ">
Same as <code class="code">fprintf</code> above, but output on <code class="code">std_formatter</code>.<br>
</div>

<pre><span id="VALeprintf"><span class="keyword">val</span> eprintf</span> : <code class="type">('a, <a href="Format.html#TYPEformatter">formatter</a>, unit) <a href="Pervasives.html#TYPEformat">format</a> -&gt; 'a</code></pre><div class="info ">
Same as <code class="code">fprintf</code> above, but output on <code class="code">err_formatter</code>.<br>
</div>

<pre><span id="VALsprintf"><span class="keyword">val</span> sprintf</span> : <code class="type">('a, unit, string) <a href="Pervasives.html#TYPEformat">format</a> -&gt; 'a</code></pre><div class="info ">
Same as <code class="code">printf</code> above, but instead of printing on a formatter,
  returns a string containing the result of formatting the arguments.
  Note that the pretty-printer queue is flushed at the end of <em>each
  call</em> to <code class="code">sprintf</code>.
<p>

  In case of multiple and related calls to <code class="code">sprintf</code> to output
  material on a single string, you should consider using <code class="code">fprintf</code>
  with the predefined formatter <code class="code">str_formatter</code> and call
  <code class="code">flush_str_formatter ()</code> to get the final result.
</p><p>

  Alternatively, you can use <code class="code"><span class="constructor">Format</span>.fprintf</code> with a formatter writing to a
  buffer of your own: flushing the formatter and the buffer at the end of
  pretty-printing returns the desired string.<br>
</p></div>

<pre><span id="VALasprintf"><span class="keyword">val</span> asprintf</span> : <code class="type">('a, <a href="Format.html#TYPEformatter">formatter</a>, unit, string) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'a</code></pre><div class="info ">
Same as <code class="code">printf</code> above, but instead of printing on a formatter,
  returns a string containing the result of formatting the arguments.
  The type of <code class="code">asprintf</code> is general enough to interact nicely with <code class="code">%a</code>
  conversions.<br>
<b>Since</b> 4.01.0<br>
</div>

<pre><span id="VALifprintf"><span class="keyword">val</span> ifprintf</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; ('a, <a href="Format.html#TYPEformatter">formatter</a>, unit) <a href="Pervasives.html#TYPEformat">format</a> -&gt; 'a</code></pre><div class="info ">
Same as <code class="code">fprintf</code> above, but does not print anything.
  Useful to ignore some material when conditionally printing.<br>
<b>Since</b> 3.10.0<br>
</div>
<br>
Formatted output functions with continuations.<br>

<pre><span id="VALkfprintf"><span class="keyword">val</span> kfprintf</span> : <code class="type">(<a href="Format.html#TYPEformatter">formatter</a> -&gt; 'a) -&gt;<br>       <a href="Format.html#TYPEformatter">formatter</a> -&gt; ('b, <a href="Format.html#TYPEformatter">formatter</a>, unit, 'a) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'b</code></pre><div class="info ">
Same as <code class="code">fprintf</code> above, but instead of returning immediately,
  passes the formatter to its first argument at the end of printing.<br>
</div>

<pre><span id="VALikfprintf"><span class="keyword">val</span> ikfprintf</span> : <code class="type">(<a href="Format.html#TYPEformatter">formatter</a> -&gt; 'a) -&gt;<br>       <a href="Format.html#TYPEformatter">formatter</a> -&gt; ('b, <a href="Format.html#TYPEformatter">formatter</a>, unit, 'a) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'b</code></pre><div class="info ">
Same as <code class="code">kfprintf</code> above, but does not print anything.
  Useful to ignore some material when conditionally printing.<br>
<b>Since</b> 3.12.0<br>
</div>

<pre><span id="VALksprintf"><span class="keyword">val</span> ksprintf</span> : <code class="type">(string -&gt; 'a) -&gt; ('b, unit, string, 'a) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'b</code></pre><div class="info ">
Same as <code class="code">sprintf</code> above, but instead of returning the string,
  passes it to the first argument.<br>
</div>

<pre><span id="VALkasprintf"><span class="keyword">val</span> kasprintf</span> : <code class="type">(string -&gt; 'a) -&gt; ('b, <a href="Format.html#TYPEformatter">formatter</a>, unit, 'a) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'b</code></pre><div class="info ">
Same as <code class="code">asprintf</code> above, but instead of returning the string,
  passes it to the first argument.<br>
<b>Since</b> 4.03<br>
</div>
<br>
<h6 id="6_Deprecated">Deprecated</h6><br>

<pre><span id="VALbprintf"><span class="keyword">val</span> bprintf</span> : <code class="type"><a href="Buffer.html#TYPEt">Buffer.t</a> -&gt; ('a, <a href="Format.html#TYPEformatter">formatter</a>, unit) <a href="Pervasives.html#TYPEformat">format</a> -&gt; 'a</code></pre><div class="info ">
<span class="warning">Deprecated.</span>This function is error prone. Do not use it.
<p>

  If you need to print to some buffer <code class="code">b</code>, you must first define a
  formatter writing to <code class="code">b</code>, using <code class="code"><span class="keyword">let</span> to_b = formatter_of_buffer b</code>; then
  use regular calls to <code class="code"><span class="constructor">Format</span>.fprintf</code> on formatter <code class="code">to_b</code>.<br>
</p></div>

<pre><span id="VALkprintf"><span class="keyword">val</span> kprintf</span> : <code class="type">(string -&gt; 'a) -&gt; ('b, unit, string, 'a) <a href="Pervasives.html#TYPEformat4">format4</a> -&gt; 'b</code></pre><div class="info ">
<span class="warning">Deprecated.</span>An alias for <code class="code">ksprintf</code>.<br>
</div>

<pre><span id="VALset_all_formatter_output_functions"><span class="keyword">val</span> set_all_formatter_output_functions</span> : <code class="type">out:(string -&gt; int -&gt; int -&gt; unit) -&gt;<br>       flush:(unit -&gt; unit) -&gt;<br>       newline:(unit -&gt; unit) -&gt; spaces:(int -&gt; unit) -&gt; unit</code></pre><div class="info ">
<span class="warning">Deprecated.</span>Subsumed by <code class="code">set_formatter_out_functions</code>.<br>
</div>

<pre><span id="VALget_all_formatter_output_functions"><span class="keyword">val</span> get_all_formatter_output_functions</span> : <code class="type">unit -&gt;<br>       (string -&gt; int -&gt; int -&gt; unit) * (unit -&gt; unit) * (unit -&gt; unit) *<br>       (int -&gt; unit)</code></pre><div class="info ">
<span class="warning">Deprecated.</span>Subsumed by <code class="code">get_formatter_out_functions</code>.<br>
</div>

<pre><span id="VALpp_set_all_formatter_output_functions"><span class="keyword">val</span> pp_set_all_formatter_output_functions</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt;<br>       out:(string -&gt; int -&gt; int -&gt; unit) -&gt;<br>       flush:(unit -&gt; unit) -&gt;<br>       newline:(unit -&gt; unit) -&gt; spaces:(int -&gt; unit) -&gt; unit</code></pre><div class="info ">
<span class="warning">Deprecated.</span>Subsumed by <code class="code">pp_set_formatter_out_functions</code>.<br>
</div>

<pre><span id="VALpp_get_all_formatter_output_functions"><span class="keyword">val</span> pp_get_all_formatter_output_functions</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt;<br>       unit -&gt;<br>       (string -&gt; int -&gt; int -&gt; unit) * (unit -&gt; unit) * (unit -&gt; unit) *<br>       (int -&gt; unit)</code></pre><div class="info ">
<span class="warning">Deprecated.</span>Subsumed by <code class="code">pp_get_formatter_out_functions</code>.<br>
</div>
<br>
Tabulation boxes are deprecated.<br>

<pre><span id="VALpp_open_tbox"><span class="keyword">val</span> pp_open_tbox</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit</code></pre><div class="info ">
<span class="warning">Deprecated.</span>since 4.03.0<br>
</div>

<pre><span id="VALpp_close_tbox"><span class="keyword">val</span> pp_close_tbox</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit</code></pre><div class="info ">
<span class="warning">Deprecated.</span>since 4.03.0<br>
</div>

<pre><span id="VALpp_print_tbreak"><span class="keyword">val</span> pp_print_tbreak</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; int -&gt; int -&gt; unit</code></pre><div class="info ">
<span class="warning">Deprecated.</span>since 4.03.0<br>
</div>

<pre><span id="VALpp_set_tab"><span class="keyword">val</span> pp_set_tab</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit</code></pre><div class="info ">
<span class="warning">Deprecated.</span>since 4.03.0<br>
</div>

<pre><span id="VALpp_print_tab"><span class="keyword">val</span> pp_print_tab</span> : <code class="type"><a href="Format.html#TYPEformatter">formatter</a> -&gt; unit -&gt; unit</code></pre><div class="info ">
<span class="warning">Deprecated.</span>since 4.03.0<br>
</div>

<pre><span id="VALopen_tbox"><span class="keyword">val</span> open_tbox</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<span class="warning">Deprecated.</span>since 4.03.0<br>
</div>

<pre><span id="VALclose_tbox"><span class="keyword">val</span> close_tbox</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<span class="warning">Deprecated.</span>since 4.03.0<br>
</div>

<pre><span id="VALprint_tbreak"><span class="keyword">val</span> print_tbreak</span> : <code class="type">int -&gt; int -&gt; unit</code></pre><div class="info ">
<span class="warning">Deprecated.</span>since 4.03.0<br>
</div>

<pre><span id="VALset_tab"><span class="keyword">val</span> set_tab</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<span class="warning">Deprecated.</span>since 4.03.0<br>
</div>

<pre><span id="VALprint_tab"><span class="keyword">val</span> print_tab</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<span class="warning">Deprecated.</span>since 4.03.0<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>