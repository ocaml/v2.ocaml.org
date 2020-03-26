<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Tk.html">Tk</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;openTk&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?display:string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;?clas:string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Widget</span>.toplevel&nbsp;<span class="constructor">Widget</span>.widget<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mainLoop&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;closeTk&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;destroy&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;update&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;appname_get&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;appname_set&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;units&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<span class="keywordsign">`</span><span class="constructor">Cm</span>&nbsp;<span class="keyword">of</span>&nbsp;float<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">In</span>&nbsp;<span class="keyword">of</span>&nbsp;float<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Mm</span>&nbsp;<span class="keyword">of</span>&nbsp;float<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Pix</span>&nbsp;<span class="keyword">of</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Pt</span>&nbsp;<span class="keyword">of</span>&nbsp;float&nbsp;]<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pixels&nbsp;:&nbsp;<span class="constructor">Tk</span>.units&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;anchor&nbsp;=&nbsp;[&nbsp;<span class="keywordsign">`</span><span class="constructor">Center</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">E</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">N</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Ne</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Nw</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">S</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Se</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Sw</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">W</span>&nbsp;]<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;fillMode&nbsp;=&nbsp;[&nbsp;<span class="keywordsign">`</span><span class="constructor">Both</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">None</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">X</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Y</span>&nbsp;]<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;side&nbsp;=&nbsp;[&nbsp;<span class="keywordsign">`</span><span class="constructor">Bottom</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Left</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Right</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Top</span>&nbsp;]<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pack&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?after:<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?anchor:<span class="constructor">Tk</span>.anchor&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?before:<span class="keywordsign">'</span>b&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?expand:bool&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?fill:<span class="constructor">Tk</span>.fillMode&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?inside:<span class="keywordsign">'</span>c&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?ipadx:int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?ipady:int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?padx:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;?pady:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;?side:<span class="constructor">Tk</span>.side&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>d&nbsp;<span class="constructor">Widget</span>.widget&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;grid&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?column:int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?columnspan:int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?inside:<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?ipadx:int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?ipady:int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?padx:int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?pady:int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?row:int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?rowspan:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;?sticky:string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;<span class="constructor">Widget</span>.widget&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;borderMode&nbsp;=&nbsp;[&nbsp;<span class="keywordsign">`</span><span class="constructor">Ignore</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Inside</span>&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Outside</span>&nbsp;]<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;place&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;?anchor:<span class="constructor">Tk</span>.anchor&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?bordermode:<span class="constructor">Tk</span>.borderMode&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?height:int&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?inside:<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?relheight:float&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?relwidth:float&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?relx:float&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?rely:float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;?width:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;?x:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;?y:int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;raise_window&nbsp;:&nbsp;?above:<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lower_window&nbsp;:&nbsp;?below:<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;modifier&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<span class="keywordsign">`</span><span class="constructor">Alt</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Button1</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Button2</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Button3</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Button4</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Button5</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Control</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Double</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Lock</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Meta</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Mod1</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Mod2</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Mod3</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Mod4</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Mod5</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Shift</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Triple</span>&nbsp;]<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;event&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<span class="keywordsign">`</span><span class="constructor">ButtonPress</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">ButtonPressDetail</span>&nbsp;<span class="keyword">of</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">ButtonRelease</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">ButtonReleaseDetail</span>&nbsp;<span class="keyword">of</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Circulate</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">ColorMap</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Configure</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Destroy</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Enter</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Expose</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">FocusIn</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">FocusOut</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Gravity</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">KeyPress</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">KeyPressDetail</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">KeyRelease</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">KeyReleaseDetail</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Leave</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Map</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Modified</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Tk</span>.modifier&nbsp;list&nbsp;*&nbsp;<span class="constructor">Tk</span>.event<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Motion</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Property</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Reparent</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Unmap</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Visibility</span>&nbsp;]<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;eventInfo&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_Above&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_ButtonNumber&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_Count&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_Detail&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_Focus&nbsp;:&nbsp;bool;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_Height&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_KeyCode&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_Mode&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_OverrideRedirect&nbsp;:&nbsp;bool;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_Place&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_State&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_Time&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_Width&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_MouseX&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_MouseY&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_Char&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_BorderWidth&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_SendEvent&nbsp;:&nbsp;bool;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_KeySymString&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_KeySymInt&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_RootWindow&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_SubWindow&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_Type&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_Widget&nbsp;:&nbsp;<span class="constructor">Widget</span>.any&nbsp;<span class="constructor">Widget</span>.widget;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_RootX&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;ev_RootY&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;eventField&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<span class="keywordsign">`</span><span class="constructor">Above</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">BorderWidth</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">ButtonNumber</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Char</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Count</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Detail</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Focus</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Height</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">KeyCode</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">KeySymInt</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">KeySymString</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Mode</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">MouseX</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">MouseY</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">OverrideRedirect</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Place</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">RootWindow</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">RootX</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">RootY</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">SendEvent</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">State</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">SubWindow</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Time</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Type</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Widget</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="keywordsign">`</span><span class="constructor">Width</span>&nbsp;]<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;bind&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;events:<span class="constructor">Tk</span>.event&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?extend:bool&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?breakable:bool&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?fields:<span class="constructor">Tk</span>.eventField&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?action:(<span class="constructor">Tk</span>.eventInfo&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;bind_class&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;events:<span class="constructor">Tk</span>.event&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?extend:bool&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?breakable:bool&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?fields:<span class="constructor">Tk</span>.eventField&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?action:(<span class="constructor">Tk</span>.eventInfo&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;?on:<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;bind_tag&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;events:<span class="constructor">Tk</span>.event&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?extend:bool&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?breakable:bool&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?fields:<span class="constructor">Tk</span>.eventField&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;?action:(<span class="constructor">Tk</span>.eventInfo&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;?on:<span class="keywordsign">'</span>a&nbsp;<span class="constructor">Widget</span>.widget&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;break&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>