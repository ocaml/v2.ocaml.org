<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Tk</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Tk.html">Tk</a></h1>

<pre><span class="keyword">module</span> Tk: <code class="code"><span class="keyword">sig</span></code> <a href="Tk.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Basic functions and types for LablTk<br>
</div>
<hr width="100%">
<br>
<h6 id="6_Initializationandtermination">Initialization and termination</h6><br>

<pre><span id="VALopenTk"><span class="keyword">val</span> openTk</span> : <code class="type">?display:string -&gt; ?clas:string -&gt; unit -&gt; Widget.toplevel Widget.widget</code></pre><div class="info ">
Initialize LablTk and open a toplevel window.
          <code class="code">display</code> is described according to the X11 conventions.
          <code class="code">clas</code> is used for the X11 resource mechanism.<br>
</div>

<pre><span id="VALmainLoop"><span class="keyword">val</span> mainLoop</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Start the main event loop<br>
</div>

<pre><span id="VALcloseTk"><span class="keyword">val</span> closeTk</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Quit the main loop and close all open windows.<br>
</div>

<pre><span id="VALdestroy"><span class="keyword">val</span> destroy</span> : <code class="type">'a Widget.widget -&gt; unit</code></pre><div class="info ">
Destroy an individual widget.<br>
</div>
<br>
<h6 id="6_Applicationwidecommands">Application wide commands</h6><br>

<pre><span id="VALupdate"><span class="keyword">val</span> update</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Synchronize display with internal state.<br>
</div>

<pre><span id="VALappname_get"><span class="keyword">val</span> appname_get</span> : <code class="type">unit -&gt; string</code></pre>
<pre><span id="VALappname_set"><span class="keyword">val</span> appname_set</span> : <code class="type">string -&gt; unit</code></pre><div class="info ">
Get or set the application name.<br>
</div>
<br>
<h6 id="6_Dimensions">Dimensions</h6><br>

<pre><span id="TYPEunits"><span class="keyword">type</span> <code class="type"></code>units</span> = <code class="type">[ `Cm of float | `In of float | `Mm of float | `Pix of int | `Pt of float ]</code> </pre>


<pre><span id="VALpixels"><span class="keyword">val</span> pixels</span> : <code class="type"><a href="Tk.html#TYPEunits">units</a> -&gt; int</code></pre><div class="info ">
Converts various on-screen units to pixels,
          respective to the default display. Available units are
          pixels, centimeters, inches, millimeters and points<br>
</div>
<br>
<h6 id="6_Widgetlayoutcommands">Widget layout commands</h6><br>

<pre><span id="TYPEanchor"><span class="keyword">type</span> <code class="type"></code>anchor</span> = <code class="type">[ `Center | `E | `N | `Ne | `Nw | `S | `Se | `Sw | `W ]</code> </pre>


<pre><span id="TYPEfillMode"><span class="keyword">type</span> <code class="type"></code>fillMode</span> = <code class="type">[ `Both | `None | `X | `Y ]</code> </pre>


<pre><span id="TYPEside"><span class="keyword">type</span> <code class="type"></code>side</span> = <code class="type">[ `Bottom | `Left | `Right | `Top ]</code> </pre>


<pre><span id="VALpack"><span class="keyword">val</span> pack</span> : <code class="type">?after:'a Widget.widget -&gt;<br>       ?anchor:<a href="Tk.html#TYPEanchor">anchor</a> -&gt;<br>       ?before:'b Widget.widget -&gt;<br>       ?expand:bool -&gt;<br>       ?fill:<a href="Tk.html#TYPEfillMode">fillMode</a> -&gt;<br>       ?inside:'c Widget.widget -&gt;<br>       ?ipadx:int -&gt;<br>       ?ipady:int -&gt;<br>       ?padx:int -&gt; ?pady:int -&gt; ?side:<a href="Tk.html#TYPEside">side</a> -&gt; 'd Widget.widget list -&gt; unit</code></pre><div class="info ">
Pack a widget inside its parent,
           using the standard layout engine.<br>
</div>

<pre><span id="VALgrid"><span class="keyword">val</span> grid</span> : <code class="type">?column:int -&gt;<br>       ?columnspan:int -&gt;<br>       ?inside:'a Widget.widget -&gt;<br>       ?ipadx:int -&gt;<br>       ?ipady:int -&gt;<br>       ?padx:int -&gt;<br>       ?pady:int -&gt;<br>       ?row:int -&gt; ?rowspan:int -&gt; ?sticky:string -&gt; 'b Widget.widget list -&gt; unit</code></pre><div class="info ">
Pack a widget inside its parent, using the grid layout engine.<br>
</div>

<pre><span id="TYPEborderMode"><span class="keyword">type</span> <code class="type"></code>borderMode</span> = <code class="type">[ `Ignore | `Inside | `Outside ]</code> </pre>


<pre><span id="VALplace"><span class="keyword">val</span> place</span> : <code class="type">?anchor:<a href="Tk.html#TYPEanchor">anchor</a> -&gt;<br>       ?bordermode:<a href="Tk.html#TYPEborderMode">borderMode</a> -&gt;<br>       ?height:int -&gt;<br>       ?inside:'a Widget.widget -&gt;<br>       ?relheight:float -&gt;<br>       ?relwidth:float -&gt;<br>       ?relx:float -&gt;<br>       ?rely:float -&gt; ?width:int -&gt; ?x:int -&gt; ?y:int -&gt; 'b Widget.widget -&gt; unit</code></pre><div class="info ">
Pack a widget inside its parent, at absolute coordinates.<br>
</div>

<pre><span id="VALraise_window"><span class="keyword">val</span> raise_window</span> : <code class="type">?above:'a Widget.widget -&gt; 'b Widget.widget -&gt; unit</code></pre>
<pre><span id="VALlower_window"><span class="keyword">val</span> lower_window</span> : <code class="type">?below:'a Widget.widget -&gt; 'b Widget.widget -&gt; unit</code></pre><div class="info ">
Raise or lower the window associated to a widget.<br>
</div>
<br>
<h6 id="6_Eventhandling">Event handling</h6><br>

<pre><span id="TYPEmodifier"><span class="keyword">type</span> <code class="type"></code>modifier</span> = <code class="type">[ `Alt<br>       | `Button1<br>       | `Button2<br>       | `Button3<br>       | `Button4<br>       | `Button5<br>       | `Control<br>       | `Double<br>       | `Lock<br>       | `Meta<br>       | `Mod1<br>       | `Mod2<br>       | `Mod3<br>       | `Mod4<br>       | `Mod5<br>       | `Shift<br>       | `Triple ]</code> </pre>


<pre><span id="TYPEevent"><span class="keyword">type</span> <code class="type"></code>event</span> = <code class="type">[ `ButtonPress<br>       | `ButtonPressDetail of int<br>       | `ButtonRelease<br>       | `ButtonReleaseDetail of int<br>       | `Circulate<br>       | `ColorMap<br>       | `Configure<br>       | `Destroy<br>       | `Enter<br>       | `Expose<br>       | `FocusIn<br>       | `FocusOut<br>       | `Gravity<br>       | `KeyPress<br>       | `KeyPressDetail of string<br>       | `KeyRelease<br>       | `KeyReleaseDetail of string<br>       | `Leave<br>       | `Map<br>       | `Modified of <a href="Tk.html#TYPEmodifier">modifier</a> list * <a href="Tk.html#TYPEevent">event</a><br>       | `Motion<br>       | `Property<br>       | `Reparent<br>       | `Unmap<br>       | `Visibility ]</code> </pre>

<br>
An event can be either a basic X event, or modified by a
   key or mouse modifier.<br>

<pre><code><span id="TYPEeventInfo"><span class="keyword">type</span> <code class="type"></code>eventInfo</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_Above">ev_Above</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_ButtonNumber">ev_ButtonNumber</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_Count">ev_Count</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_Detail">ev_Detail</span>&nbsp;: <code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_Focus">ev_Focus</span>&nbsp;: <code class="type">bool</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_Height">ev_Height</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_KeyCode">ev_KeyCode</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_Mode">ev_Mode</span>&nbsp;: <code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_OverrideRedirect">ev_OverrideRedirect</span>&nbsp;: <code class="type">bool</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_Place">ev_Place</span>&nbsp;: <code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_State">ev_State</span>&nbsp;: <code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_Time">ev_Time</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_Width">ev_Width</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_MouseX">ev_MouseX</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_MouseY">ev_MouseY</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_Char">ev_Char</span>&nbsp;: <code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_BorderWidth">ev_BorderWidth</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_SendEvent">ev_SendEvent</span>&nbsp;: <code class="type">bool</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_KeySymString">ev_KeySymString</span>&nbsp;: <code class="type">string</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_KeySymInt">ev_KeySymInt</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_RootWindow">ev_RootWindow</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_SubWindow">ev_SubWindow</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_Type">ev_Type</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_Widget">ev_Widget</span>&nbsp;: <code class="type">Widget.any Widget.widget</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_RootX">ev_RootX</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTeventInfo.ev_RootY">ev_RootY</span>&nbsp;: <code class="type">int</code>;</code></td>

</tr></tbody></table>
}


<br>
Event related information accessible in callbacks.<br>

<pre><span id="TYPEeventField"><span class="keyword">type</span> <code class="type"></code>eventField</span> = <code class="type">[ `Above<br>       | `BorderWidth<br>       | `ButtonNumber<br>       | `Char<br>       | `Count<br>       | `Detail<br>       | `Focus<br>       | `Height<br>       | `KeyCode<br>       | `KeySymInt<br>       | `KeySymString<br>       | `Mode<br>       | `MouseX<br>       | `MouseY<br>       | `OverrideRedirect<br>       | `Place<br>       | `RootWindow<br>       | `RootX<br>       | `RootY<br>       | `SendEvent<br>       | `State<br>       | `SubWindow<br>       | `Time<br>       | `Type<br>       | `Widget<br>       | `Width ]</code> </pre>

<br>
In order to access the above event information, one has to pass
   a list of required event fields to the <code class="code">bind</code> function.<br>

<pre><span id="VALbind"><span class="keyword">val</span> bind</span> : <code class="type">events:<a href="Tk.html#TYPEevent">event</a> list -&gt;<br>       ?extend:bool -&gt;<br>       ?breakable:bool -&gt;<br>       ?fields:<a href="Tk.html#TYPEeventField">eventField</a> list -&gt;<br>       ?action:(<a href="Tk.html#TYPEeventInfo">eventInfo</a> -&gt; unit) -&gt; 'a Widget.widget -&gt; unit</code></pre><div class="info ">
Bind a succession of <code class="code">events</code> on a widget to an <code class="code">action</code>.
           If <code class="code">extend</code> is true then then binding is added after existing
           ones, otherwise it replaces them.
           <code class="code">breakable</code> should be true when <code class="code">break</code> is to be called inside
           the action.
           <code class="code">action</code> is called with the <code class="code">fields</code> required set in
           an <code class="code">eventInfo</code> structure. Other fields should not be accessed.
           If <code class="code">action</code> is omitted then existing bindings are removed.<br>
</div>

<pre><span id="VALbind_class"><span class="keyword">val</span> bind_class</span> : <code class="type">events:<a href="Tk.html#TYPEevent">event</a> list -&gt;<br>       ?extend:bool -&gt;<br>       ?breakable:bool -&gt;<br>       ?fields:<a href="Tk.html#TYPEeventField">eventField</a> list -&gt;<br>       ?action:(<a href="Tk.html#TYPEeventInfo">eventInfo</a> -&gt; unit) -&gt; ?on:'a Widget.widget -&gt; string -&gt; unit</code></pre><div class="info ">
Same thing for all widgets of a given class. If a widget
           is given with label <code class="code">~on:</code>, the binding will be removed as
           soon as it is destroyed.<br>
</div>

<pre><span id="VALbind_tag"><span class="keyword">val</span> bind_tag</span> : <code class="type">events:<a href="Tk.html#TYPEevent">event</a> list -&gt;<br>       ?extend:bool -&gt;<br>       ?breakable:bool -&gt;<br>       ?fields:<a href="Tk.html#TYPEeventField">eventField</a> list -&gt;<br>       ?action:(<a href="Tk.html#TYPEeventInfo">eventInfo</a> -&gt; unit) -&gt; ?on:'a Widget.widget -&gt; string -&gt; unit</code></pre><div class="info ">
Same thing for all widgets having a given tag<br>
</div>

<pre><span id="VALbreak"><span class="keyword">val</span> break</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Used inside a bound action, do not call other actions
           after this one. This is only possible if this action
           was bound with <code class="code">~breakable:<span class="keyword">true</span></code>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>