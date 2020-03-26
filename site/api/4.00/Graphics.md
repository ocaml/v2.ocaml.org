<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Graphics</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Graphics.html">Graphics</a></h1>
<pre><span class="keyword">module</span> Graphics: <code class="code"><span class="keyword">sig</span></code> <a href="Graphics.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>Machine-independent graphics primitives.<br>
<hr width="100%">
<pre><span id="EXCEPTIONGraphic_failure"><span class="keyword">exception</span> Graphic_failure</span> <span class="keyword">of</span> <code class="type">string</code></pre>
<div class="info">
Raised by the functions below when they encounter an error.<br>
</div>
<br>
<span id="6_Initializations"><h6>Initializations</h6></span><br>
<pre><span id="VALopen_graph"><span class="keyword">val</span> open_graph</span> : <code class="type">string -&gt; unit</code></pre><div class="info">
Show the graphics window or switch the screen to graphic mode.
   The graphics window is cleared and the current point is set
   to (0, 0). The string argument is used to pass optional
   information on the desired graphics mode, the graphics window
   size, and so on. Its interpretation is implementation-dependent.
   If the empty string is given, a sensible default is selected.<br>
</div>
<pre><span id="VALclose_graph"><span class="keyword">val</span> close_graph</span> : <code class="type">unit -&gt; unit</code></pre><div class="info">
Delete the graphics window or switch the screen back to text mode.<br>
</div>
<pre><span id="VALset_window_title"><span class="keyword">val</span> set_window_title</span> : <code class="type">string -&gt; unit</code></pre><div class="info">
Set the title of the graphics window.<br>
</div>
<pre><span id="VALresize_window"><span class="keyword">val</span> resize_window</span> : <code class="type">int -&gt; int -&gt; unit</code></pre><div class="info">
Resize and erase the graphics window.<br>
</div>
<pre><span id="VALclear_graph"><span class="keyword">val</span> clear_graph</span> : <code class="type">unit -&gt; unit</code></pre><div class="info">
Erase the graphics window.<br>
</div>
<pre><span id="VALsize_x"><span class="keyword">val</span> size_x</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
See <a href="Graphics.html#VALsize_y"><code class="code"><span class="constructor">Graphics</span>.size_y</code></a>.<br>
</div>
<pre><span id="VALsize_y"><span class="keyword">val</span> size_y</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
Return the size of the graphics window. Coordinates of the screen
   pixels range over <code class="code">0 .. size_x()-1</code> and <code class="code">0 .. size_y()-1</code>.
   Drawings outside of this rectangle are clipped, without causing
   an error. The origin (0,0) is at the lower left corner.<br>
</div>
<br>
<span id="6_Colors"><h6>Colors</h6></span><br>
<pre><span id="TYPEcolor"><span class="keyword">type</span> <code class="type"></code>color</span> = <code class="type">int</code> </pre>
<div class="info">
A color is specified by its R, G, B components. Each component
   is in the range <code class="code">0..255</code>. The three components are packed in
   an <code class="code">int</code>: <code class="code">0xRRGGBB</code>, where <code class="code"><span class="constructor">RR</span></code> are the two hexadecimal digits for
   the red component, <code class="code"><span class="constructor">GG</span></code> for the green component, <code class="code"><span class="constructor">BB</span></code> for the
   blue component.<br>
</div>

<pre><span id="VALrgb"><span class="keyword">val</span> rgb</span> : <code class="type">int -&gt; int -&gt; int -&gt; <a href="Graphics.html#TYPEcolor">color</a></code></pre><div class="info">
<code class="code">rgb r g b</code> returns the integer encoding the color with red
   component <code class="code">r</code>, green component <code class="code">g</code>, and blue component <code class="code">b</code>.
   <code class="code">r</code>, <code class="code">g</code> and <code class="code">b</code> are in the range <code class="code">0..255</code>.<br>
</div>
<pre><span id="VALset_color"><span class="keyword">val</span> set_color</span> : <code class="type"><a href="Graphics.html#TYPEcolor">color</a> -&gt; unit</code></pre><div class="info">
Set the current drawing color.<br>
</div>
<pre><span id="VALbackground"><span class="keyword">val</span> background</span> : <code class="type"><a href="Graphics.html#TYPEcolor">color</a></code></pre><div class="info">
See <a href="Graphics.html#VALforeground"><code class="code"><span class="constructor">Graphics</span>.foreground</code></a>.<br>
</div>
<pre><span id="VALforeground"><span class="keyword">val</span> foreground</span> : <code class="type"><a href="Graphics.html#TYPEcolor">color</a></code></pre><div class="info">
Default background and foreground colors (usually, either black
   foreground on a white background or white foreground on a
   black background).
   <a href="Graphics.html#VALclear_graph"><code class="code"><span class="constructor">Graphics</span>.clear_graph</code></a> fills the screen with the <code class="code">background</code> color.
   The initial drawing color is <code class="code">foreground</code>.<br>
</div>
<br>
<span id="7_Somepredefinedcolors"><div class="h7">Some predefined colors</div></span><br>
<pre><span id="VALblack"><span class="keyword">val</span> black</span> : <code class="type"><a href="Graphics.html#TYPEcolor">color</a></code></pre><pre><span id="VALwhite"><span class="keyword">val</span> white</span> : <code class="type"><a href="Graphics.html#TYPEcolor">color</a></code></pre><pre><span id="VALred"><span class="keyword">val</span> red</span> : <code class="type"><a href="Graphics.html#TYPEcolor">color</a></code></pre><pre><span id="VALgreen"><span class="keyword">val</span> green</span> : <code class="type"><a href="Graphics.html#TYPEcolor">color</a></code></pre><pre><span id="VALblue"><span class="keyword">val</span> blue</span> : <code class="type"><a href="Graphics.html#TYPEcolor">color</a></code></pre><pre><span id="VALyellow"><span class="keyword">val</span> yellow</span> : <code class="type"><a href="Graphics.html#TYPEcolor">color</a></code></pre><pre><span id="VALcyan"><span class="keyword">val</span> cyan</span> : <code class="type"><a href="Graphics.html#TYPEcolor">color</a></code></pre><pre><span id="VALmagenta"><span class="keyword">val</span> magenta</span> : <code class="type"><a href="Graphics.html#TYPEcolor">color</a></code></pre><br>
<span id="6_Pointandlinedrawing"><h6>Point and line drawing</h6></span><br>
<pre><span id="VALplot"><span class="keyword">val</span> plot</span> : <code class="type">int -&gt; int -&gt; unit</code></pre><div class="info">
Plot the given point with the current drawing color.<br>
</div>
<pre><span id="VALplots"><span class="keyword">val</span> plots</span> : <code class="type">(int * int) array -&gt; unit</code></pre><div class="info">
Plot the given points with the current drawing color.<br>
</div>
<pre><span id="VALpoint_color"><span class="keyword">val</span> point_color</span> : <code class="type">int -&gt; int -&gt; <a href="Graphics.html#TYPEcolor">color</a></code></pre><div class="info">
Return the color of the given point in the backing store
   (see "Double buffering" below).<br>
</div>
<pre><span id="VALmoveto"><span class="keyword">val</span> moveto</span> : <code class="type">int -&gt; int -&gt; unit</code></pre><div class="info">
Position the current point.<br>
</div>
<pre><span id="VALrmoveto"><span class="keyword">val</span> rmoveto</span> : <code class="type">int -&gt; int -&gt; unit</code></pre><div class="info">
<code class="code">rmoveto dx dy</code> translates the current point by the given vector.<br>
</div>
<pre><span id="VALcurrent_x"><span class="keyword">val</span> current_x</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
Return the abscissa of the current point.<br>
</div>
<pre><span id="VALcurrent_y"><span class="keyword">val</span> current_y</span> : <code class="type">unit -&gt; int</code></pre><div class="info">
Return the ordinate of the current point.<br>
</div>
<pre><span id="VALcurrent_point"><span class="keyword">val</span> current_point</span> : <code class="type">unit -&gt; int * int</code></pre><div class="info">
Return the position of the current point.<br>
</div>
<pre><span id="VALlineto"><span class="keyword">val</span> lineto</span> : <code class="type">int -&gt; int -&gt; unit</code></pre><div class="info">
Draw a line with endpoints the current point and the given point,
   and move the current point to the given point.<br>
</div>
<pre><span id="VALrlineto"><span class="keyword">val</span> rlineto</span> : <code class="type">int -&gt; int -&gt; unit</code></pre><div class="info">
Draw a line with endpoints the current point and the
   current point translated of the given vector,
   and move the current point to this point.<br>
</div>
<pre><span id="VALcurveto"><span class="keyword">val</span> curveto</span> : <code class="type">int * int -&gt; int * int -&gt; int * int -&gt; unit</code></pre><div class="info">
<code class="code">curveto b c d</code> draws a cubic Bezier curve starting from
   the current point to point <code class="code">d</code>, with control points <code class="code">b</code> and
   <code class="code">c</code>, and moves the current point to <code class="code">d</code>.<br>
</div>
<pre><span id="VALdraw_rect"><span class="keyword">val</span> draw_rect</span> : <code class="type">int -&gt; int -&gt; int -&gt; int -&gt; unit</code></pre><div class="info">
<code class="code">draw_rect x y w h</code> draws the rectangle with lower left corner
   at <code class="code">x,y</code>, width <code class="code">w</code> and height <code class="code">h</code>.
   The current point is unchanged.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">w</code> or <code class="code">h</code> is negative.<br>
</div>
<pre><span id="VALdraw_poly_line"><span class="keyword">val</span> draw_poly_line</span> : <code class="type">(int * int) array -&gt; unit</code></pre><div class="info">
<code class="code">draw_poly_line points</code> draws the line that joins the
   points given by the array argument.
   The array contains the coordinates of the vertices of the
   polygonal line, which need not be closed.
   The current point is unchanged.<br>
</div>
<pre><span id="VALdraw_poly"><span class="keyword">val</span> draw_poly</span> : <code class="type">(int * int) array -&gt; unit</code></pre><div class="info">
<code class="code">draw_poly polygon</code> draws the given polygon.
   The array contains the coordinates of the vertices of the
   polygon.
   The current point is unchanged.<br>
</div>
<pre><span id="VALdraw_segments"><span class="keyword">val</span> draw_segments</span> : <code class="type">(int * int * int * int) array -&gt; unit</code></pre><div class="info">
<code class="code">draw_segments segments</code> draws the segments given in the array
   argument. Each segment is specified as a quadruple
   <code class="code">(x0, y0, x1, y1)</code> where <code class="code">(x0, y0)</code> and <code class="code">(x1, y1)</code> are
   the coordinates of the end points of the segment.
   The current point is unchanged.<br>
</div>
<pre><span id="VALdraw_arc"><span class="keyword">val</span> draw_arc</span> : <code class="type">int -&gt; int -&gt; int -&gt; int -&gt; int -&gt; int -&gt; unit</code></pre><div class="info">
<code class="code">draw_arc x y rx ry a1 a2</code> draws an elliptical arc with center
   <code class="code">x,y</code>, horizontal radius <code class="code">rx</code>, vertical radius <code class="code">ry</code>, from angle
   <code class="code">a1</code> to angle <code class="code">a2</code> (in degrees). The current point is unchanged.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">rx</code> or <code class="code">ry</code> is negative.<br>
</div>
<pre><span id="VALdraw_ellipse"><span class="keyword">val</span> draw_ellipse</span> : <code class="type">int -&gt; int -&gt; int -&gt; int -&gt; unit</code></pre><div class="info">
<code class="code">draw_ellipse x y rx ry</code> draws an ellipse with center
   <code class="code">x,y</code>, horizontal radius <code class="code">rx</code> and vertical radius <code class="code">ry</code>.
   The current point is unchanged.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">rx</code> or <code class="code">ry</code> is negative.<br>
</div>
<pre><span id="VALdraw_circle"><span class="keyword">val</span> draw_circle</span> : <code class="type">int -&gt; int -&gt; int -&gt; unit</code></pre><div class="info">
<code class="code">draw_circle x y r</code> draws a circle with center <code class="code">x,y</code> and
   radius <code class="code">r</code>. The current point is unchanged.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">r</code> is negative.<br>
</div>
<pre><span id="VALset_line_width"><span class="keyword">val</span> set_line_width</span> : <code class="type">int -&gt; unit</code></pre><div class="info">
Set the width of points and lines drawn with the functions above.
   Under X Windows, <code class="code">set_line_width 0</code> selects a width of 1 pixel
   and a faster, but less precise drawing algorithm than the one
   used when <code class="code">set_line_width 1</code> is specified.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the argument is negative.<br>
</div>
<br>
<span id="6_Textdrawing"><h6>Text drawing</h6></span><br>
<pre><span id="VALdraw_char"><span class="keyword">val</span> draw_char</span> : <code class="type">char -&gt; unit</code></pre><div class="info">
See <a href="Graphics.html#VALdraw_string"><code class="code"><span class="constructor">Graphics</span>.draw_string</code></a>.<br>
</div>
<pre><span id="VALdraw_string"><span class="keyword">val</span> draw_string</span> : <code class="type">string -&gt; unit</code></pre><div class="info">
Draw a character or a character string with lower left corner
   at current position. After drawing, the current position is set
   to the lower right corner of the text drawn.<br>
</div>
<pre><span id="VALset_font"><span class="keyword">val</span> set_font</span> : <code class="type">string -&gt; unit</code></pre><div class="info">
Set the font used for drawing text.
   The interpretation of the argument to <code class="code">set_font</code>
   is implementation-dependent.<br>
</div>
<pre><span id="VALset_text_size"><span class="keyword">val</span> set_text_size</span> : <code class="type">int -&gt; unit</code></pre><div class="info">
Set the character size used for drawing text.
   The interpretation of the argument to <code class="code">set_text_size</code>
   is implementation-dependent.<br>
</div>
<pre><span id="VALtext_size"><span class="keyword">val</span> text_size</span> : <code class="type">string -&gt; int * int</code></pre><div class="info">
Return the dimensions of the given text, if it were drawn with
   the current font and size.<br>
</div>
<br>
<span id="6_Filling"><h6>Filling</h6></span><br>
<pre><span id="VALfill_rect"><span class="keyword">val</span> fill_rect</span> : <code class="type">int -&gt; int -&gt; int -&gt; int -&gt; unit</code></pre><div class="info">
<code class="code">fill_rect x y w h</code> fills the rectangle with lower left corner
   at <code class="code">x,y</code>, width <code class="code">w</code> and height <code class="code">h</code>, with the current color.
   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">w</code> or <code class="code">h</code> is negative.<br>
</div>
<pre><span id="VALfill_poly"><span class="keyword">val</span> fill_poly</span> : <code class="type">(int * int) array -&gt; unit</code></pre><div class="info">
Fill the given polygon with the current color. The array
   contains the coordinates of the vertices of the polygon.<br>
</div>
<pre><span id="VALfill_arc"><span class="keyword">val</span> fill_arc</span> : <code class="type">int -&gt; int -&gt; int -&gt; int -&gt; int -&gt; int -&gt; unit</code></pre><div class="info">
Fill an elliptical pie slice with the current color. The
   parameters are the same as for <a href="Graphics.html#VALdraw_arc"><code class="code"><span class="constructor">Graphics</span>.draw_arc</code></a>.<br>
</div>
<pre><span id="VALfill_ellipse"><span class="keyword">val</span> fill_ellipse</span> : <code class="type">int -&gt; int -&gt; int -&gt; int -&gt; unit</code></pre><div class="info">
Fill an ellipse with the current color. The
   parameters are the same as for <a href="Graphics.html#VALdraw_ellipse"><code class="code"><span class="constructor">Graphics</span>.draw_ellipse</code></a>.<br>
</div>
<pre><span id="VALfill_circle"><span class="keyword">val</span> fill_circle</span> : <code class="type">int -&gt; int -&gt; int -&gt; unit</code></pre><div class="info">
Fill a circle with the current color. The
   parameters are the same as for <a href="Graphics.html#VALdraw_circle"><code class="code"><span class="constructor">Graphics</span>.draw_circle</code></a>.<br>
</div>
<br>
<span id="6_Images"><h6>Images</h6></span><br>
<pre><span id="TYPEimage"><span class="keyword">type</span> <code class="type"></code>image</span> </pre>
<div class="info">
The abstract type for images, in internal representation.
   Externally, images are represented as matrices of colors.<br>
</div>

<pre><span id="VALtransp"><span class="keyword">val</span> transp</span> : <code class="type"><a href="Graphics.html#TYPEcolor">color</a></code></pre><div class="info">
In matrices of colors, this color represent a ``transparent''
   point: when drawing the corresponding image, all pixels on the
   screen corresponding to a transparent pixel in the image will
   not be modified, while other points will be set to the color
   of the corresponding point in the image. This allows superimposing
   an image over an existing background.<br>
</div>
<pre><span id="VALmake_image"><span class="keyword">val</span> make_image</span> : <code class="type"><a href="Graphics.html#TYPEcolor">color</a> array array -&gt; <a href="Graphics.html#TYPEimage">image</a></code></pre><div class="info">
Convert the given color matrix to an image.
   Each sub-array represents one horizontal line. All sub-arrays
   must have the same length; otherwise, exception <code class="code"><span class="constructor">Graphic_failure</span></code>
   is raised.<br>
</div>
<pre><span id="VALdump_image"><span class="keyword">val</span> dump_image</span> : <code class="type"><a href="Graphics.html#TYPEimage">image</a> -&gt; <a href="Graphics.html#TYPEcolor">color</a> array array</code></pre><div class="info">
Convert an image to a color matrix.<br>
</div>
<pre><span id="VALdraw_image"><span class="keyword">val</span> draw_image</span> : <code class="type"><a href="Graphics.html#TYPEimage">image</a> -&gt; int -&gt; int -&gt; unit</code></pre><div class="info">
Draw the given image with lower left corner at the given point.<br>
</div>
<pre><span id="VALget_image"><span class="keyword">val</span> get_image</span> : <code class="type">int -&gt; int -&gt; int -&gt; int -&gt; <a href="Graphics.html#TYPEimage">image</a></code></pre><div class="info">
Capture the contents of a rectangle on the screen as an image.
   The parameters are the same as for <a href="Graphics.html#VALfill_rect"><code class="code"><span class="constructor">Graphics</span>.fill_rect</code></a>.<br>
</div>
<pre><span id="VALcreate_image"><span class="keyword">val</span> create_image</span> : <code class="type">int -&gt; int -&gt; <a href="Graphics.html#TYPEimage">image</a></code></pre><div class="info">
<code class="code">create_image w h</code> returns a new image <code class="code">w</code> pixels wide and <code class="code">h</code>
   pixels tall, to be used in conjunction with <code class="code">blit_image</code>.
   The initial image contents are random, except that no point
   is transparent.<br>
</div>
<pre><span id="VALblit_image"><span class="keyword">val</span> blit_image</span> : <code class="type"><a href="Graphics.html#TYPEimage">image</a> -&gt; int -&gt; int -&gt; unit</code></pre><div class="info">
<code class="code">blit_image img x y</code> copies screen pixels into the image <code class="code">img</code>,
   modifying <code class="code">img</code> in-place. The pixels copied are those inside the
   rectangle with lower left corner at <code class="code">x,y</code>, and width and height
   equal to those of the image. Pixels that were transparent in
   <code class="code">img</code> are left unchanged.<br>
</div>
<br>
<span id="6_Mouseandkeyboardevents"><h6>Mouse and keyboard events</h6></span><br>
<pre><code><span id="TYPEstatus"><span class="keyword">type</span> <code class="type"></code>status</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstatus.mouse_x">mouse_x</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">X coordinate of the mouse</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstatus.mouse_y">mouse_y</span>&nbsp;:<code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Y coordinate of the mouse</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstatus.button">button</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">true if a mouse button is pressed</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstatus.keypressed">keypressed</span>&nbsp;:<code class="type">bool</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">true if a key has been pressed</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstatus.key">key</span>&nbsp;:<code class="type">char</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">the character for the key pressed</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>
}

<div class="info">
To report events.<br>
</div>

<pre><code><span id="TYPEevent"><span class="keyword">type</span> <code class="type"></code>event</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTevent.Button_down"><span class="constructor">Button_down</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">A mouse button is pressed</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTevent.Button_up"><span class="constructor">Button_up</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">A mouse button is released</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTevent.Key_pressed"><span class="constructor">Key_pressed</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">A key is pressed</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTevent.Mouse_motion"><span class="constructor">Mouse_motion</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">The mouse is moved</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTevent.Poll"><span class="constructor">Poll</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Don't wait; return immediately</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info">
To specify events to wait for.<br>
</div>

<pre><span id="VALwait_next_event"><span class="keyword">val</span> wait_next_event</span> : <code class="type"><a href="Graphics.html#TYPEevent">event</a> list -&gt; <a href="Graphics.html#TYPEstatus">status</a></code></pre><div class="info">
Wait until one of the events specified in the given event list
   occurs, and return the status of the mouse and keyboard at
   that time. If <code class="code"><span class="constructor">Poll</span></code> is given in the event list, return immediately
   with the current status. If the mouse cursor is outside of the
   graphics window, the <code class="code">mouse_x</code> and <code class="code">mouse_y</code> fields of the event are
   outside the range <code class="code">0..size_x()-1, 0..size_y()-1</code>. Keypresses
   are queued, and dequeued one by one when the <code class="code"><span class="constructor">Key_pressed</span></code>
   event is specified.<br>
</div>
<br>
<span id="6_Mouseandkeyboardpolling"><h6>Mouse and keyboard polling</h6></span><br>
<pre><span id="VALmouse_pos"><span class="keyword">val</span> mouse_pos</span> : <code class="type">unit -&gt; int * int</code></pre><div class="info">
Return the position of the mouse cursor, relative to the
   graphics window. If the mouse cursor is outside of the graphics
   window, <code class="code">mouse_pos()</code> returns a point outside of the range
   <code class="code">0..size_x()-1, 0..size_y()-1</code>.<br>
</div>
<pre><span id="VALbutton_down"><span class="keyword">val</span> button_down</span> : <code class="type">unit -&gt; bool</code></pre><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if the mouse button is pressed, <code class="code"><span class="keyword">false</span></code> otherwise.<br>
</div>
<pre><span id="VALread_key"><span class="keyword">val</span> read_key</span> : <code class="type">unit -&gt; char</code></pre><div class="info">
Wait for a key to be pressed, and return the corresponding
   character. Keypresses are queued.<br>
</div>
<pre><span id="VALkey_pressed"><span class="keyword">val</span> key_pressed</span> : <code class="type">unit -&gt; bool</code></pre><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if a keypress is available; that is, if <code class="code">read_key</code>
   would not block.<br>
</div>
<br>
<span id="6_Sound"><h6>Sound</h6></span><br>
<pre><span id="VALsound"><span class="keyword">val</span> sound</span> : <code class="type">int -&gt; int -&gt; unit</code></pre><div class="info">
<code class="code">sound freq dur</code> plays a sound at frequency <code class="code">freq</code> (in hertz)
   for a duration <code class="code">dur</code> (in milliseconds).<br>
</div>
<br>
<span id="6_Doublebuffering"><h6>Double buffering</h6></span><br>
<pre><span id="VALauto_synchronize"><span class="keyword">val</span> auto_synchronize</span> : <code class="type">bool -&gt; unit</code></pre><div class="info">
By default, drawing takes place both on the window displayed
   on screen, and in a memory area (the ``backing store'').
   The backing store image is used to re-paint the on-screen
   window when necessary.
<p>

   To avoid flicker during animations, it is possible to turn
   off on-screen drawing, perform a number of drawing operations
   in the backing store only, then refresh the on-screen window
   explicitly.
</p><p>

   <code class="code">auto_synchronize <span class="keyword">false</span></code> turns on-screen drawing off.  All
   subsequent drawing commands are performed on the backing store
   only.
</p><p>

   <code class="code">auto_synchronize <span class="keyword">true</span></code> refreshes the on-screen window from
   the backing store (as per <code class="code">synchronize</code>), then turns on-screen
   drawing back on.  All subsequent drawing commands are performed
   both on screen and in the backing store.
</p><p>

   The default drawing mode corresponds to <code class="code">auto_synchronize <span class="keyword">true</span></code>.<br>
</p></div>
<pre><span id="VALsynchronize"><span class="keyword">val</span> synchronize</span> : <code class="type">unit -&gt; unit</code></pre><div class="info">
Synchronize the backing store and the on-screen window, by
   copying the contents of the backing store onto the graphics
   window.<br>
</div>
<pre><span id="VALdisplay_mode"><span class="keyword">val</span> display_mode</span> : <code class="type">bool -&gt; unit</code></pre><div class="info">
Set display mode on or off. When turned on, drawings are done
   in the graphics window; when turned off, drawings do not affect
   the graphics window.  This occurs independently of
   drawing into the backing store (see the function <a href="Graphics.html#VALremember_mode"><code class="code"><span class="constructor">Graphics</span>.remember_mode</code></a>
   below). Default display mode is on.<br>
</div>
<pre><span id="VALremember_mode"><span class="keyword">val</span> remember_mode</span> : <code class="type">bool -&gt; unit</code></pre><div class="info">
Set remember mode on or off. When turned on, drawings are done
   in the backing store; when turned off, the backing store is
   unaffected by drawings.  This occurs independently of drawing
   onto the graphics window (see the function <a href="Graphics.html#VALdisplay_mode"><code class="code"><span class="constructor">Graphics</span>.display_mode</code></a> above).
   Default remember mode is on.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>