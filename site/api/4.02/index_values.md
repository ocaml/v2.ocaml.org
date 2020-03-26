<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Index of values</a></div><ul></ul></nav></header>

<h1>Index of values</h1>
<table>
<tbody><tr><td align="left"><br></td></tr>
<tr><td><a href="Pervasives.html#VAL( * )">( * )</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Integer multiplication.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL( ** )">( ** )</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Exponentiation.
</div>
</td></tr>
<tr><td><a href="Num.html#VAL( **/ )">( **/ )</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Same as <a href="Num.html#VALpower_num"><code class="code"><span class="constructor">Num</span>.power_num</code></a>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL( *. )">( *. )</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Floating-point multiplication
</div>
</td></tr>
<tr><td><a href="Num.html#VAL( */ )">( */ )</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Same as <a href="Num.html#VALmult_num"><code class="code"><span class="constructor">Num</span>.mult_num</code></a>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(!)">(!)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">!r</code> returns the current contents of reference <code class="code">r</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(!=)">(!=)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Negation of <a href="Pervasives.html#VAL(==)"><code class="code">(==)</code></a>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(&amp;&amp;)">(&amp;&amp;)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
The boolean 'and'.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(&amp;)">(&amp;)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(+)">(+)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Integer addition.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(+.)">(+.)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Floating-point addition
</div>
</td></tr>
<tr><td><a href="Num.html#VAL(+/)">(+/)</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Same as <a href="Num.html#VALadd_num"><code class="code"><span class="constructor">Num</span>.add_num</code></a>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(-)">(-)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Integer subtraction.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(-.)">(-.)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Floating-point subtraction
</div>
</td></tr>
<tr><td><a href="Num.html#VAL(-/)">(-/)</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Same as <a href="Num.html#VALsub_num"><code class="code"><span class="constructor">Num</span>.sub_num</code></a>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(/)">(/)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Integer division.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(/.)">(/.)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Floating-point division.
</div>
</td></tr>
<tr><td><a href="Num.html#VAL(//)">(//)</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Same as <a href="Num.html#VALdiv_num"><code class="code"><span class="constructor">Num</span>.div_num</code></a>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(:=)">(:=)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">r := a</code> stores the value of <code class="code">a</code> in reference <code class="code">r</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(<)">(&lt;)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
See <a href="Pervasives.html#VAL(>=)"><code class="code">(&gt;=)</code></a>.
</div>
</td></tr>
<tr><td><a href="Num.html#VAL(</)">(&lt;/)</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VAL(<=)">(&lt;=)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
See <a href="Pervasives.html#VAL(>=)"><code class="code">(&gt;=)</code></a>.
</div>
</td></tr>
<tr><td><a href="Num.html#VAL(<=/)">(&lt;=/)</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VAL(<>)">(&lt;&gt;)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Negation of <a href="Pervasives.html#VAL(=)"><code class="code">(=)</code></a>.
</div>
</td></tr>
<tr><td><a href="Num.html#VAL(<>/)">(&lt;&gt;/)</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VAL(=)">(=)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">e1 = e2</code> tests for structural equality of <code class="code">e1</code> and <code class="code">e2</code>.
</div>
</td></tr>
<tr><td><a href="Num.html#VAL(=/)">(=/)</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VAL(==)">(==)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">e1 == e2</code> tests for physical equality of <code class="code">e1</code> and <code class="code">e2</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(>)">(&gt;)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
See <a href="Pervasives.html#VAL(>=)"><code class="code">(&gt;=)</code></a>.
</div>
</td></tr>
<tr><td><a href="Num.html#VAL(>/)">(&gt;/)</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VAL(>=)">(&gt;=)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Structural ordering functions.
</div>
</td></tr>
<tr><td><a href="Num.html#VAL(>=/)">(&gt;=/)</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VAL(@)">(@)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
List concatenation.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(@@)">(@@)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Application operator: <code class="code">g @@ f @@ x</code> is exactly equivalent to
 <code class="code">g (f (x))</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(^)">(^)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
String concatenation.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(^^)">(^^)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">f1 ^^ f2</code> catenates format strings <code class="code">f1</code> and <code class="code">f2</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(asr)">(asr)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">n <span class="keyword">asr</span> m</code> shifts <code class="code">n</code> to the right by <code class="code">m</code> bits.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(land)">(land)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Bitwise logical and.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(lor)">(lor)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Bitwise logical or.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(lsl)">(lsl)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">n <span class="keyword">lsl</span> m</code> shifts <code class="code">n</code> to the left by <code class="code">m</code> bits.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(lsr)">(lsr)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">n <span class="keyword">lsr</span> m</code> shifts <code class="code">n</code> to the right by <code class="code">m</code> bits.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(lxor)">(lxor)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Bitwise logical exclusive or.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(mod)">(mod)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Integer remainder.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(or)">(or)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(|>)">(|&gt;)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Reverse-application operator: <code class="code">x |&gt; f |&gt; g</code> is exactly equivalent
 to <code class="code">g (f (x))</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(||)">(||)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
The boolean 'or'.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(~+)">(~+)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Unary addition.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(~+.)">(~+.)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Unary addition.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(~-)">(~-)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Unary negation.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL(~-.)">(~-.)</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Unary negation.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL__FILE__">__FILE__</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">__FILE__</code> returns the name of the file currently being
    parsed by the compiler.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL__LINE_OF__">__LINE_OF__</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">__LINE__ expr</code> returns a pair <code class="code">(line, expr)</code>, where <code class="code">line</code> is the
    line number at which the expression <code class="code">expr</code> appears in the file
    currently being parsed by the compiler.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL__LINE__">__LINE__</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">__LINE__</code> returns the line number at which this expression
    appears in the file currently being parsed by the compiler.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL__LOC_OF__">__LOC_OF__</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">__LOC_OF__ expr</code> returns a pair <code class="code">(loc, expr)</code> where <code class="code">loc</code> is the
    location of <code class="code">expr</code> in the file currently being parsed by the
    compiler, with the standard error format of OCaml: "File %S, line
    %d, characters %d-%d"
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL__LOC__">__LOC__</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">__LOC__</code> returns the location at which this expression appears in
    the file currently being parsed by the compiler, with the standard
    error format of OCaml: "File %S, line %d, characters %d-%d"
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL__MODULE__">__MODULE__</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">__MODULE__</code> returns the module name of the file being
    parsed by the compiler.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL__POS_OF__">__POS_OF__</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">__POS_OF__ expr</code> returns a pair <code class="code">(expr,loc)</code>, where <code class="code">loc</code> is a
    tuple <code class="code">(file,lnum,cnum,enum)</code> corresponding to the location at
    which the expression <code class="code">expr</code> appears in the file currently being
    parsed by the compiler.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VAL__POS__">__POS__</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">__POS__</code> returns a tuple <code class="code">(file,lnum,cnum,enum)</code>, corresponding
    to the location at which this expression appears in the file
    currently being parsed by the compiler.
</div>
</td></tr>
<tr><td align="left"><br>A</td></tr>
<tr><td><a href="Pervasives.html#VALabs">abs</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the absolute value of the argument.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALabs">abs</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Return the absolute value of its argument.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALabs">abs</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Return the absolute value of its argument.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALabs">abs</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Return the absolute value of its argument.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALabs_big_int">abs_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Absolute value.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALabs_float">abs_float</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">abs_float f</code> returns the absolute value of <code class="code">f</code>.
</div>
</td></tr>
<tr><td><a href="Num.html#VALabs_num">abs_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Absolute value.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALabstract_tag">abstract_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALaccept">accept</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Accept connections on the given socket.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALaccept">accept</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Accept connections on the given socket.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALaccept">accept</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALaccess">access</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Check that the process has the given permissions over the named
   file.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALaccess">access</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Check that the process has the given permissions over the named
   file.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALacos">acos</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Arc cosine.
</div>
</td></tr>
<tr><td><a href="Dynlink.html#VALadapt_filename">adapt_filename</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
In bytecode, the identity function.
</div>
</td></tr>
<tr><td><a href="Weak.S.html#VALadd">add</a> [<a href="Weak.S.html">Weak.S</a>]</td>
<td><div class="info">
<code class="code">add t x</code> adds <code class="code">x</code> to <code class="code">t</code>.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALadd">add</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">add x s</code> returns a set containing all elements of <code class="code">s</code>,
       plus <code class="code">x</code>.
</div>
</td></tr>
<tr><td><a href="Queue.html#VALadd">add</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
<code class="code">add x q</code> adds the element <code class="code">x</code> at the end of the queue <code class="code">q</code>.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALadd">add</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Addition.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALadd">add</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALadd">add</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALadd">add</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALadd">add</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALadd">add</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALadd">add</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">add x y m</code> returns a map containing the same bindings as
       <code class="code">m</code>, plus a binding of <code class="code">x</code> to <code class="code">y</code>.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALadd">add</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Addition.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALadd">add</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Addition.
</div>
</td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALadd">add</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALadd">add</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALadd">add</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Hashtbl</span>.add tbl x y</code> adds a binding of <code class="code">x</code> to <code class="code">y</code> in table <code class="code">tbl</code>.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALadd">add</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Addition
</div>
</td></tr>
<tr><td><a href="Dynlink.html#VALadd_available_units">add_available_units</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
Same as <a href="Dynlink.html#VALadd_interfaces"><code class="code"><span class="constructor">Dynlink</span>.add_interfaces</code></a>, but instead of searching <code class="code">.cmi</code> files
    to find the unit interfaces, uses the interface digests given
    for each unit.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALadd_big_int">add_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Addition.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALadd_buffer">add_buffer</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
<code class="code">add_buffer b1 b2</code> appends the current contents of buffer <code class="code">b2</code>
   at the end of buffer <code class="code">b1</code>.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALadd_bytes">add_bytes</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
<code class="code">add_string b s</code> appends the string <code class="code">s</code> at the end of the buffer <code class="code">b</code>.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALadd_channel">add_channel</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
<code class="code">add_channel b ic n</code> reads exactly <code class="code">n</code> character from the
   input channel <code class="code">ic</code> and stores them at the end of buffer <code class="code">b</code>.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALadd_char">add_char</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
<code class="code">add_char b c</code> appends the character <code class="code">c</code> at the end of the buffer <code class="code">b</code>.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALadd_in_char_set">add_in_char_set</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALadd_initializer">add_initializer</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Big_int.html#VALadd_int_big_int">add_int_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Addition of a small integer to a big integer.
</div>
</td></tr>
<tr><td><a href="Dynlink.html#VALadd_interfaces">add_interfaces</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
<code class="code">add_interfaces units path</code> grants dynamically-linked object
    files access to the compilation  units named in list <code class="code">units</code>.
</div>
</td></tr>
<tr><td><a href="Num.html#VALadd_num">add_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Addition
</div>
</td></tr>
<tr><td><a href="Obj.html#VALadd_offset">add_offset</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Buffer.html#VALadd_string">add_string</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
<code class="code">add_string b s</code> appends the string <code class="code">s</code> at the end of the buffer <code class="code">b</code>.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALadd_subbytes">add_subbytes</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
<code class="code">add_substring b s ofs len</code> takes <code class="code">len</code> characters from offset
   <code class="code">ofs</code> in byte sequence <code class="code">s</code> and appends them at the end of the buffer <code class="code">b</code>.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALadd_substitute">add_substitute</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
<code class="code">add_substitute b f s</code> appends the string pattern <code class="code">s</code> at the end
   of the buffer <code class="code">b</code> with substitution.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALadd_substring">add_substring</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
<code class="code">add_substring b s ofs len</code> takes <code class="code">len</code> characters from offset
   <code class="code">ofs</code> in string <code class="code">s</code> and appends them at the end of the buffer <code class="code">b</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALalarm">alarm</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Schedule a <code class="code"><span class="constructor">SIGALRM</span></code> signal after the given number of seconds.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALalarm">alarm</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Schedule a <code class="code"><span class="constructor">SIGALRM</span></code> signal after the given number of seconds.
</div>
</td></tr>
<tr><td><a href="Arg.html#VALalign">align</a> [<a href="Arg.html">Arg</a>]</td>
<td><div class="info">
Align the documentation strings by inserting spaces at the first
    space, according to the length of the keyword.
</div>
</td></tr>
<tr><td><a href="Gc.html#VALallocated_bytes">allocated_bytes</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
Return the total number of bytes allocated since the program was
   started.
</div>
</td></tr>
<tr><td><a href="Dynlink.html#VALallow_only">allow_only</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
<code class="code">allow_only units</code> restricts the compilation units that
    dynamically-linked units can reference: it forbids all references
    to units other than those named in the list <code class="code">units</code>.
</div>
</td></tr>
<tr><td><a href="Dynlink.html#VALallow_unsafe_modules">allow_unsafe_modules</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
Govern whether unsafe object files are allowed to be
    dynamically linked.
</div>
</td></tr>
<tr><td><a href="Event.html#VALalways">always</a> [<a href="Event.html">Event</a>]</td>
<td><div class="info">
<code class="code">always v</code> returns an event that is always ready for
   synchronization.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALand_big_int">and_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Bitwise logical 'and'.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALappend">append</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Catenate two lists.
</div>
</td></tr>
<tr><td><a href="List.html#VALappend">append</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Catenate two lists.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALappend">append</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.append v1 v2</code> returns a fresh array containing the
   concatenation of the arrays <code class="code">v1</code> and <code class="code">v2</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALappend">append</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.append v1 v2</code> returns a fresh array containing the
   concatenation of the arrays <code class="code">v1</code> and <code class="code">v2</code>.
</div>
</td></tr>
<tr><td><a href="Num.html#VALapprox_num_exp">approx_num_exp</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Approximate a number by a decimal.
</div>
</td></tr>
<tr><td><a href="Num.html#VALapprox_num_fix">approx_num_fix</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
See <a href="Num.html#VALapprox_num_exp"><code class="code"><span class="constructor">Num</span>.approx_num_exp</code></a>.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALarg">arg</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Argument.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALargv">argv</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
The command line arguments given to the process.
</div>
</td></tr>
<tr><td><a href="Arith_status.html#VALarith_status">arith_status</a> [<a href="Arith_status.html">Arith_status</a>]</td>
<td><div class="info">
Print the current status of the arithmetic flags.
</div>
</td></tr>
<tr><td><a href="Sort.html#VALarray">array</a> [<a href="Sort.html">Sort</a>]</td>
<td><div class="info">
Sort an array in increasing order according to an
   ordering predicate.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALarray1_of_genarray">array1_of_genarray</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
Return the one-dimensional big array corresponding to the given
   generic big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALarray2_of_genarray">array2_of_genarray</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
Return the two-dimensional big array corresponding to the given
   generic big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALarray3_of_genarray">array3_of_genarray</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
Return the three-dimensional big array corresponding to the given
   generic big array.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALasin">asin</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Arc sine.
</div>
</td></tr>
<tr><td><a href="Format.html#VALasprintf">asprintf</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Same as <code class="code">printf</code> above, but instead of printing on a formatter,
   returns a string containing the result of formatting the arguments.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALassoc">assoc</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code">assoc a l</code> returns the value associated with key <code class="code">a</code> in the list of
   pairs <code class="code">l</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALassoc">assoc</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code">assoc a l</code> returns the value associated with key <code class="code">a</code> in the list of
   pairs <code class="code">l</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALassq">assq</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Same as <a href="ListLabels.html#VALassoc"><code class="code"><span class="constructor">ListLabels</span>.assoc</code></a>, but uses physical equality instead of
   structural equality to compare keys.
</div>
</td></tr>
<tr><td><a href="List.html#VALassq">assq</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALassoc"><code class="code"><span class="constructor">List</span>.assoc</code></a>, but uses physical equality instead of structural
   equality to compare keys.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALat_exit">at_exit</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Register the given function to be called at program
   termination time.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALatan">atan</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Arc tangent.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALatan2">atan2</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">atan2 y x</code> returns the arc tangent of <code class="code">y /. x</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALauto_synchronize">auto_synchronize</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
By default, drawing takes place both on the window displayed
   on screen, and in a memory area (the 'backing store').
</div>
</td></tr>
<tr><td align="left"><br>B</td></tr>
<tr><td><a href="Graphics.html#VALbackground">background</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
See <a href="Graphics.html#VALforeground"><code class="code"><span class="constructor">Graphics</span>.foreground</code></a>.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALbacktrace_slots">backtrace_slots</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
Returns the slots of a raw backtrace, or <code class="code"><span class="constructor">None</span></code> if none of them
    contain useful information.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALbacktrace_status">backtrace_status</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Printexc</span>.backtrace_status()</code> returns <code class="code"><span class="keyword">true</span></code> if exception
    backtraces are currently recorded, <code class="code"><span class="keyword">false</span></code> if not.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALbasename">basename</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
Split a file name into directory name / base file name.
</div>
</td></tr>
<tr><td><a href="Scanf.Scanning.html#VALbeginning_of_input">beginning_of_input</a> [<a href="Scanf.Scanning.html">Scanf.Scanning</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Scanning</span>.beginning_of_input ic</code> tests the beginning of input condition of
    the given formatted input channel.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALbig_endian">big_endian</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Whether the machine currently executing the Caml program is big-endian.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALbig_int_of_int">big_int_of_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Convert a small integer to a big integer.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALbig_int_of_int32">big_int_of_int32</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Convert a 32-bit integer to a big integer.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALbig_int_of_int64">big_int_of_int64</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Convert a 64-bit integer to a big integer.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALbig_int_of_nativeint">big_int_of_nativeint</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Convert a native integer to a big integer.
</div>
</td></tr>
<tr><td><a href="Num.html#VALbig_int_of_num">big_int_of_num</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Big_int.html#VALbig_int_of_string">big_int_of_string</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Convert a string to a big integer, in decimal.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALbind">bind</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Bind a socket to an address.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALbind">bind</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Bind a socket to an address.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALbindings">bindings</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALbindings">bindings</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
Return the list of all bindings of the given map.
</div>
</td></tr>
<tr><td><a href="Random.State.html#VALbits">bits</a> [<a href="Random.State.html">Random.State</a>]</td>
<td></td></tr>
<tr><td><a href="Random.html#VALbits">bits</a> [<a href="Random.html">Random</a>]</td>
<td><div class="info">
Return 30 random bits in a nonnegative integer.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALbits_of_float">bits_of_float</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Return the internal representation of the given float according
   to the IEEE 754 floating-point 'double format' bit layout.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALbits_of_float">bits_of_float</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Return the internal representation of the given float according
   to the IEEE 754 floating-point 'single format' bit layout.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALblack">black</a> [<a href="Graphics.html">Graphics</a>]</td>
<td></td></tr>
<tr><td><a href="Weak.html#VALblit">blit</a> [<a href="Weak.html">Weak</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Weak</span>.blit ar1 off1 ar2 off2 len</code> copies <code class="code">len</code> weak pointers
   from <code class="code">ar1</code> (starting at <code class="code">off1</code>) to <code class="code">ar2</code> (starting at <code class="code">off2</code>).
</div>
</td></tr>
<tr><td><a href="String.html#VALblit">blit</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
Same as <a href="Bytes.html#VALblit_string"><code class="code"><span class="constructor">Bytes</span>.blit_string</code></a>.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALblit">blit</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.blit src srcoff dst dstoff len</code> copies <code class="code">len</code> bytes
   from the string <code class="code">src</code>, starting at index <code class="code">srcoff</code>,
   to byte sequence <code class="code">dst</code>, starting at character number <code class="code">dstoff</code>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALblit">blit</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">blit src srcoff dst dstoff len</code> copies <code class="code">len</code> bytes from sequence
    <code class="code">src</code>, starting at index <code class="code">srcoff</code>, to sequence <code class="code">dst</code>, starting at
    index <code class="code">dstoff</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALblit">blit</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">blit src srcoff dst dstoff len</code> copies <code class="code">len</code> bytes from sequence
    <code class="code">src</code>, starting at index <code class="code">srcoff</code>, to sequence <code class="code">dst</code>, starting at
    index <code class="code">dstoff</code>.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALblit">blit</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Buffer</span>.blit src srcoff dst dstoff len</code> copies <code class="code">len</code> characters from
   the current contents of the buffer <code class="code">src</code>, starting at offset <code class="code">srcoff</code>
   to <code class="code">dst</code>, starting at character <code class="code">dstoff</code>.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALblit">blit</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Copy the first big array to the second big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALblit">blit</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Copy the first big array to the second big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array1.html#VALblit">blit</a> [<a href="Bigarray.Array1.html">Bigarray.Array1</a>]</td>
<td><div class="info">
Copy the first big array to the second big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALblit">blit</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
Copy all elements of a big array in another big array.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALblit">blit</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.blit v1 o1 v2 o2 len</code> copies <code class="code">len</code> elements
   from array <code class="code">v1</code>, starting at element number <code class="code">o1</code>, to array <code class="code">v2</code>,
   starting at element number <code class="code">o2</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALblit">blit</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.blit v1 o1 v2 o2 len</code> copies <code class="code">len</code> elements
   from array <code class="code">v1</code>, starting at element number <code class="code">o1</code>, to array <code class="code">v2</code>,
   starting at element number <code class="code">o2</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALblit_image">blit_image</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">blit_image img x y</code> copies screen pixels into the image <code class="code">img</code>,
   modifying <code class="code">img</code> in-place.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALblit_string">blit_string</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">blit src srcoff dst dstoff len</code> copies <code class="code">len</code> bytes from string
    <code class="code">src</code>, starting at index <code class="code">srcoff</code>, to byte sequence <code class="code">dst</code>,
    starting at index <code class="code">dstoff</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALblue">blue</a> [<a href="Graphics.html">Graphics</a>]</td>
<td></td></tr>
<tr><td><a href="Random.State.html#VALbool">bool</a> [<a href="Random.State.html">Random.State</a>]</td>
<td><div class="info">
These functions are the same as the basic functions, except that they
      use (and update) the given PRNG state instead of the default one.
</div>
</td></tr>
<tr><td><a href="Random.html#VALbool">bool</a> [<a href="Random.html">Random</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Random</span>.bool ()</code> returns <code class="code"><span class="keyword">true</span></code> or <code class="code"><span class="keyword">false</span></code> with probability 0.5 each.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALbool_of_string">bool_of_string</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Convert the given string to a boolean.
</div>
</td></tr>
<tr><td><a href="Str.html#VALbounded_full_split">bounded_full_split</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
Same as <a href="Str.html#VALbounded_split_delim"><code class="code"><span class="constructor">Str</span>.bounded_split_delim</code></a>, but returns
   the delimiters as well as the substrings contained between
   delimiters.
</div>
</td></tr>
<tr><td><a href="Str.html#VALbounded_split">bounded_split</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
Same as <a href="Str.html#VALsplit"><code class="code"><span class="constructor">Str</span>.split</code></a>, but splits into at most <code class="code">n</code> substrings,
   where <code class="code">n</code> is the extra integer parameter.
</div>
</td></tr>
<tr><td><a href="Str.html#VALbounded_split_delim">bounded_split_delim</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
Same as <a href="Str.html#VALbounded_split"><code class="code"><span class="constructor">Str</span>.bounded_split</code></a>, but occurrences of the
   delimiter at the beginning and at the end of the string are
   recognized and returned as empty strings in the result.
</div>
</td></tr>
<tr><td><a href="Printf.html#VALbprintf">bprintf</a> [<a href="Printf.html">Printf</a>]</td>
<td><div class="info">
Same as <a href="Printf.html#VALfprintf"><code class="code"><span class="constructor">Printf</span>.fprintf</code></a>, but instead of printing on an output channel,
   append the formatted arguments to the given extensible buffer
   (see module <a href="Buffer.html"><code class="code"><span class="constructor">Buffer</span></code></a>).
</div>
</td></tr>
<tr><td><a href="Format.html#VALbprintf">bprintf</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Condition.html#VALbroadcast">broadcast</a> [<a href="Condition.html">Condition</a>]</td>
<td><div class="info">
<code class="code">broadcast c</code> restarts all processes waiting on the
   condition variable <code class="code">c</code>.
</div>
</td></tr>
<tr><td><a href="Scanf.html#VALbscanf">bscanf</a> [<a href="Scanf.html">Scanf</a>]</td>
<td><div class="info">
<code class="code">bscanf ic fmt r1 ... rN f</code> reads arguments for the function <code class="code">f</code>, from the
    formatted input channel <code class="code">ic</code>, according to the format string <code class="code">fmt</code>, and
    applies <code class="code">f</code> to these values.
</div>
</td></tr>
<tr><td><a href="Scanf.html#VALbscanf_format">bscanf_format</a> [<a href="Scanf.html">Scanf</a>]</td>
<td><div class="info">
<code class="code">bscanf_format ic fmt f</code> reads a format string token from the formatted
    input channel <code class="code">ic</code>, according to the given format string <code class="code">fmt</code>, and
    applies <code class="code">f</code> to the resulting format string value.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALbufput_acc">bufput_acc</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="Graphics.html#VALbutton_down">button_down</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if the mouse button is pressed, <code class="code"><span class="keyword">false</span></code> otherwise.
</div>
</td></tr>
<tr><td><a href="Digest.html#VALbytes">bytes</a> [<a href="Digest.html">Digest</a>]</td>
<td><div class="info">
Return the digest of the given byte sequence.
</div>
</td></tr>
<tr><td align="left"><br>C</td></tr>
<tr><td><a href="Bigarray.html#VALc_layout">c_layout</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td></td></tr>
<tr><td><a href="String.html#VALcapitalize">capitalize</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
Return a copy of the argument, with the first character set to uppercase.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALcapitalize">capitalize</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
Return a copy of the argument, with the first character set to uppercase.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALcapitalize">capitalize</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
Return a copy of the argument, with the first byte set to
    uppercase.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALcapitalize">capitalize</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Return a copy of the argument, with the first byte set to
    uppercase.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALcardinal">cardinal</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
Return the number of elements of a set.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALcardinal">cardinal</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALcardinal">cardinal</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALcardinal">cardinal</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
Return the number of bindings of a map.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALcat">cat</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">cat s1 s2</code> concatenates <code class="code">s1</code> and <code class="code">s2</code> and returns the result
     as new byte sequence.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALcatch">catch</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Printexc</span>.catch fn x</code> is similar to <a href="Printexc.html#VALprint"><code class="code"><span class="constructor">Printexc</span>.print</code></a>, but
   aborts the program with exit code 2 after printing the
   uncaught exception.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALcatch_break">catch_break</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
<code class="code">catch_break</code> governs whether interactive interrupt (ctrl-C)
   terminates the program or raises the <code class="code"><span class="constructor">Break</span></code> exception.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALceil">ceil</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Round above to an integer value.
</div>
</td></tr>
<tr><td><a href="Num.html#VALceiling_num">ceiling_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
<code class="code">ceiling_num n</code> returns the smallest integer bigger or equal to <code class="code">n</code>.
</div>
</td></tr>
<tr><td><a href="Digest.html#VALchannel">channel</a> [<a href="Digest.html">Digest</a>]</td>
<td><div class="info">
If <code class="code">len</code> is nonnegative, <code class="code"><span class="constructor">Digest</span>.channel ic len</code> reads <code class="code">len</code>
   characters from channel <code class="code">ic</code> and returns their digest, or raises
   <code class="code"><span class="constructor">End_of_file</span></code> if end-of-file is reached before <code class="code">len</code> characters
   are read.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALchar">char</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
As shown by the types of the values above,
   big arrays of kind <code class="code">float32_elt</code> and <code class="code">float64_elt</code> are
   accessed using the OCaml type <code class="code">float</code>.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALchar_of_iconv">char_of_iconv</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALchar_of_int">char_of_int</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the character with the given ASCII code.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALchdir">chdir</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Change the process working directory.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALchdir">chdir</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Change the process working directory.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALchdir">chdir</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Change the current working directory of the process.
</div>
</td></tr>
<tr><td><a href="Weak.html#VALcheck">check</a> [<a href="Weak.html">Weak</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Weak</span>.check ar n</code> returns <code class="code"><span class="keyword">true</span></code> if the <code class="code">n</code>th cell of <code class="code">ar</code> is
   full, <code class="code"><span class="keyword">false</span></code> if it is empty.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALcheck_suffix">check_suffix</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
<code class="code">check_suffix name suff</code> returns <code class="code"><span class="keyword">true</span></code> if the filename <code class="code">name</code>
   ends with the suffix <code class="code">suff</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALchmod">chmod</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Change the permissions of the named file.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALchmod">chmod</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Change the permissions of the named file.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALchoose">choose</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
Return one element of the given set, or raise <code class="code"><span class="constructor">Not_found</span></code> if
       the set is empty.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALchoose">choose</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALchoose">choose</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALchoose">choose</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
Return one binding of the given map, or raise <code class="code"><span class="constructor">Not_found</span></code> if
       the map is empty.
</div>
</td></tr>
<tr><td><a href="Event.html#VALchoose">choose</a> [<a href="Event.html">Event</a>]</td>
<td><div class="info">
<code class="code">choose evl</code> returns the event that is the alternative of
   all the events in the list <code class="code">evl</code>.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALchop_extension">chop_extension</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
Return the given file name without its extension.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALchop_suffix">chop_suffix</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
<code class="code">chop_suffix name suff</code> removes the suffix <code class="code">suff</code> from
   the filename <code class="code">name</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALchown">chown</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Change the owner uid and owner gid of the named file.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALchown">chown</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Change the owner uid and owner gid of the named file.
</div>
</td></tr>
<tr><td><a href="Char.html#VALchr">chr</a> [<a href="Char.html">Char</a>]</td>
<td><div class="info">
Return the character with the given ASCII code.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALchroot">chroot</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Change the process root directory.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALchroot">chroot</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Change the process root directory.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALclassify_float">classify_float</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the class of the given floating-point number:
   normal, subnormal, zero, infinite, or not a number.
</div>
</td></tr>
<tr><td><a href="Weak.S.html#VALclear">clear</a> [<a href="Weak.S.html">Weak.S</a>]</td>
<td><div class="info">
Remove all elements from the table.
</div>
</td></tr>
<tr><td><a href="Stack.html#VALclear">clear</a> [<a href="Stack.html">Stack</a>]</td>
<td><div class="info">
Discard all elements from a stack.
</div>
</td></tr>
<tr><td><a href="Queue.html#VALclear">clear</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
Discard all elements from a queue.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALclear">clear</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALclear">clear</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALclear">clear</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALclear">clear</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALclear">clear</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALclear">clear</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
Empty a hash table.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALclear">clear</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
Empty the buffer.
</div>
</td></tr>
<tr><td><a href="Dynlink.html#VALclear_available_units">clear_available_units</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
Empty the list of compilation units accessible to dynamically-linked
    programs.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALclear_close_on_exec">clear_close_on_exec</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Clear the ``close-on-exec'' flag on the given descriptor.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALclear_close_on_exec">clear_close_on_exec</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Clear the ``close-on-exec'' flag on the given descriptor.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALclear_graph">clear_graph</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Erase the graphics window.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALclear_nonblock">clear_nonblock</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Clear the ``non-blocking'' flag on the given descriptor.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALclear_nonblock">clear_nonblock</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Clear the ``non-blocking'' flag on the given descriptor.
</div>
</td></tr>
<tr><td><a href="Parsing.html#VALclear_parser">clear_parser</a> [<a href="Parsing.html">Parsing</a>]</td>
<td><div class="info">
Empty the parser stack.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALclose">close</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Close a file descriptor.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALclose">close</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Close a file descriptor.
</div>
</td></tr>
<tr><td><a href="Format.html#VALclose_box">close_box</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Closes the most recently opened pretty-printing box.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALclose_graph">close_graph</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Delete the graphics window or switch the screen back to text mode.
</div>
</td></tr>
<tr><td><a href="Scanf.Scanning.html#VALclose_in">close_in</a> [<a href="Scanf.Scanning.html">Scanf.Scanning</a>]</td>
<td><div class="info">
Closes the <code class="code"><span class="constructor">Pervasives</span>.in_channel</code> associated with the given
  <code class="code"><span class="constructor">Scanning</span>.in_channel</code> formatted input channel.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALclose_in">close_in</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Close the given channel.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALclose_in_noerr">close_in_noerr</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Same as <code class="code">close_in</code>, but ignore all errors.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALclose_out">close_out</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Close the given channel, flushing all buffered write operations.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALclose_out_noerr">close_out_noerr</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Same as <code class="code">close_out</code>, but ignore all errors.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALclose_process">close_process</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Close channels opened by <a href="UnixLabels.html#VALopen_process"><code class="code"><span class="constructor">UnixLabels</span>.open_process</code></a>,
   wait for the associated command to terminate,
   and return its termination status.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALclose_process">close_process</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Close channels opened by <a href="Unix.html#VALopen_process"><code class="code"><span class="constructor">Unix</span>.open_process</code></a>,
   wait for the associated command to terminate,
   and return its termination status.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALclose_process_full">close_process_full</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Close channels opened by <a href="UnixLabels.html#VALopen_process_full"><code class="code"><span class="constructor">UnixLabels</span>.open_process_full</code></a>,
   wait for the associated command to terminate,
   and return its termination status.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALclose_process_full">close_process_full</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Close channels opened by <a href="Unix.html#VALopen_process_full"><code class="code"><span class="constructor">Unix</span>.open_process_full</code></a>,
   wait for the associated command to terminate,
   and return its termination status.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALclose_process_in">close_process_in</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Close channels opened by <a href="UnixLabels.html#VALopen_process_in"><code class="code"><span class="constructor">UnixLabels</span>.open_process_in</code></a>,
   wait for the associated command to terminate,
   and return its termination status.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALclose_process_in">close_process_in</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Close channels opened by <a href="Unix.html#VALopen_process_in"><code class="code"><span class="constructor">Unix</span>.open_process_in</code></a>,
   wait for the associated command to terminate,
   and return its termination status.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALclose_process_out">close_process_out</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Close channels opened by <a href="UnixLabels.html#VALopen_process_out"><code class="code"><span class="constructor">UnixLabels</span>.open_process_out</code></a>,
   wait for the associated command to terminate,
   and return its termination status.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALclose_process_out">close_process_out</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Close channels opened by <a href="Unix.html#VALopen_process_out"><code class="code"><span class="constructor">Unix</span>.open_process_out</code></a>,
   wait for the associated command to terminate,
   and return its termination status.
</div>
</td></tr>
<tr><td><a href="GraphicsX11.html#VALclose_subwindow">close_subwindow</a> [<a href="GraphicsX11.html">GraphicsX11</a>]</td>
<td><div class="info">
Close the sub-window having the given identifier.
</div>
</td></tr>
<tr><td><a href="Format.html#VALclose_tag">close_tag</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">close_tag ()</code> closes the most recently opened tag <code class="code">t</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALclose_tbox">close_tbox</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Closes the most recently opened tabulation box.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALclosedir">closedir</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Close a directory descriptor.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALclosedir">closedir</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Close a directory descriptor.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALclosure_tag">closure_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Char.html#VALcode">code</a> [<a href="Char.html">Char</a>]</td>
<td><div class="info">
Return the ASCII code of the argument.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALcombine">combine</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Transform a pair of lists into a list of pairs:
   <code class="code">combine [a1; ...; an] [b1; ...; bn]</code> is
   <code class="code">[(a1,b1); ...; (an,bn)]</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALcombine">combine</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Transform a pair of lists into a list of pairs:
   <code class="code">combine [a1; ...; an] [b1; ...; bn]</code> is
   <code class="code">[(a1,b1); ...; (an,bn)]</code>.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALcommand">command</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Execute the given shell command and return its exit code.
</div>
</td></tr>
<tr><td><a href="Gc.html#VALcompact">compact</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
Perform a full major collection and compact the heap.
</div>
</td></tr>
<tr><td><a href="String.html#VALcompare">compare</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
The comparison function for strings, with the same specification as
    <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALcompare">compare</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
The comparison function for strings, with the same specification as
    <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALcompare">compare</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
Total ordering between sets.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALcompare">compare</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">compare x y</code> returns <code class="code">0</code> if <code class="code">x</code> is equal to <code class="code">y</code>,
   a negative integer if <code class="code">x</code> is less than <code class="code">y</code>, and a positive integer
   if <code class="code">x</code> is greater than <code class="code">y</code>.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALcompare">compare</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
The comparison function for native integers, with the same specification as
    <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.
</div>
</td></tr>
<tr><td><a href="Set.OrderedType.html#VALcompare">compare</a> [<a href="Set.OrderedType.html">Set.OrderedType</a>]</td>
<td><div class="info">
A total ordering function over the set elements.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALcompare">compare</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALcompare">compare</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.OrderedType.html#VALcompare">compare</a> [<a href="Map.OrderedType.html">Map.OrderedType</a>]</td>
<td><div class="info">
A total ordering function over the keys.
</div>
</td></tr>
<tr><td><a href="Map.S.html#VALcompare">compare</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
Total ordering between maps.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALcompare">compare</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
The comparison function for 64-bit integers, with the same specification as
    <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALcompare">compare</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
The comparison function for 32-bit integers, with the same specification as
    <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.
</div>
</td></tr>
<tr><td><a href="Digest.html#VALcompare">compare</a> [<a href="Digest.html">Digest</a>]</td>
<td><div class="info">
The comparison function for 16-character digest, with the same
    specification as <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a> and the implementation
    shared with <a href="String.html#VALcompare"><code class="code"><span class="constructor">String</span>.compare</code></a>.
</div>
</td></tr>
<tr><td><a href="Char.html#VALcompare">compare</a> [<a href="Char.html">Char</a>]</td>
<td><div class="info">
The comparison function for characters, with the same specification as
    <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALcompare">compare</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
The comparison function for byte sequences, with the same
    specification as <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALcompare">compare</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
The comparison function for byte sequences, with the same
    specification as <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALcompare_big_int">compare_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
<code class="code">compare_big_int a b</code> returns <code class="code">0</code> if <code class="code">a</code> and <code class="code">b</code> are equal,
           <code class="code">1</code> if <code class="code">a</code> is greater than <code class="code">b</code>, and <code class="code">-1</code> if <code class="code">a</code> is smaller
           than <code class="code">b</code>.
</div>
</td></tr>
<tr><td><a href="Num.html#VALcompare_num">compare_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Return <code class="code">-1</code>, <code class="code">0</code> or <code class="code">1</code> if the first argument is less than,
   equal to, or greater than the second argument.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALcomplex32">complex32</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALcomplex64">complex64</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.
</div>
</td></tr>
<tr><td><a href="String.html#VALconcat">concat</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.concat sep sl</code> concatenates the list of strings <code class="code">sl</code>,
    inserting the separator string <code class="code">sep</code> between each.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALconcat">concat</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.concat sep sl</code> concatenates the list of strings <code class="code">sl</code>,
   inserting the separator string <code class="code">sep</code> between each.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALconcat">concat</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Concatenate a list of lists.
</div>
</td></tr>
<tr><td><a href="List.html#VALconcat">concat</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Concatenate a list of lists.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALconcat">concat</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
<code class="code">concat dir file</code> returns a file name that designates file
   <code class="code">file</code> in directory <code class="code">dir</code>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALconcat">concat</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">concat sep sl</code> concatenates the list of byte sequences <code class="code">sl</code>,
    inserting the separator byte sequence <code class="code">sep</code> between each, and
    returns the result as a new byte sequence.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALconcat">concat</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">concat sep sl</code> concatenates the list of byte sequences <code class="code">sl</code>,
    inserting the separator byte sequence <code class="code">sep</code> between each, and
    returns the result as a new byte sequence.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALconcat">concat</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
Same as <code class="code"><span class="constructor">Array</span>.append</code>, but concatenates a list of arrays.
</div>
</td></tr>
<tr><td><a href="Array.html#VALconcat">concat</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
Same as <code class="code"><span class="constructor">Array</span>.append</code>, but concatenates a list of arrays.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormatBasics.html#VALconcat_fmt">concat_fmt</a> [<a href="CamlinternalFormatBasics.html">CamlinternalFormatBasics</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalFormatBasics.html#VALconcat_fmtty">concat_fmtty</a> [<a href="CamlinternalFormatBasics.html">CamlinternalFormatBasics</a>]</td>
<td></td></tr>
<tr><td><a href="Complex.html#VALconj">conj</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Conjugate: given the complex <code class="code">x + i.y</code>, returns <code class="code">x - i.y</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALconnect">connect</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Connect a socket to an address.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALconnect">connect</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Connect a socket to an address.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALconnect">connect</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="String.html#VALcontains">contains</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.contains s c</code> tests if character <code class="code">c</code>
   appears in the string <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALcontains">contains</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.contains s c</code> tests if character <code class="code">c</code>
   appears in the string <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALcontains">contains</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">contains s c</code> tests if byte <code class="code">c</code> appears in <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALcontains">contains</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">contains s c</code> tests if byte <code class="code">c</code> appears in <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="String.html#VALcontains_from">contains_from</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.contains_from s start c</code> tests if character <code class="code">c</code>
   appears in <code class="code">s</code> after position <code class="code">start</code>.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALcontains_from">contains_from</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.contains_from s start c</code> tests if character <code class="code">c</code>
   appears in <code class="code">s</code> after position <code class="code">start</code>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALcontains_from">contains_from</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">contains_from s start c</code> tests if byte <code class="code">c</code> appears in <code class="code">s</code> after
    position <code class="code">start</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALcontains_from">contains_from</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">contains_from s start c</code> tests if byte <code class="code">c</code> appears in <code class="code">s</code> after
    position <code class="code">start</code>.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALcontents">contents</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
Return a copy of the current contents of the buffer.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALconvert_raw_backtrace_slot">convert_raw_backtrace_slot</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
Extracts the user-friendly <code class="code">backtrace_slot</code> from a low-level
    <code class="code">raw_backtrace_slot</code>.
</div>
</td></tr>
<tr><td><a href="String.html#VALcopy">copy</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<span class="deprecated">Return a copy of the given string.
</span></div>
</td></tr>
<tr><td><a href="StringLabels.html#VALcopy">copy</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
Return a copy of the given string.
</div>
</td></tr>
<tr><td><a href="Stack.html#VALcopy">copy</a> [<a href="Stack.html">Stack</a>]</td>
<td><div class="info">
Return a copy of the given stack.
</div>
</td></tr>
<tr><td><a href="Random.State.html#VALcopy">copy</a> [<a href="Random.State.html">Random.State</a>]</td>
<td><div class="info">
Return a copy of the given state.
</div>
</td></tr>
<tr><td><a href="Queue.html#VALcopy">copy</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
Return a copy of the given queue.
</div>
</td></tr>
<tr><td><a href="Oo.html#VALcopy">copy</a> [<a href="Oo.html">Oo</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Oo</span>.copy o</code> returns a copy of object <code class="code">o</code>, that is a fresh
   object with the same methods and instance variables as <code class="code">o</code>.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALcopy">copy</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALcopy">copy</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALcopy">copy</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALcopy">copy</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALcopy">copy</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALcopy">copy</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
Return a copy of the given hashtable.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALcopy">copy</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="BytesLabels.html#VALcopy">copy</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
Return a new byte sequence that contains the same bytes as the
    argument.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALcopy">copy</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Return a new byte sequence that contains the same bytes as the
    argument.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALcopy">copy</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.copy a</code> returns a copy of <code class="code">a</code>, that is, a fresh array
   containing the same elements as <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALcopy">copy</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.copy a</code> returns a copy of <code class="code">a</code>, that is, a fresh array
   containing the same elements as <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALcopysign">copysign</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">copysign x y</code> returns a float whose absolute value is that of <code class="code">x</code>
  and whose sign is that of <code class="code">y</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALcos">cos</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Cosine.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALcosh">cosh</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Hyperbolic cosine.
</div>
</td></tr>
<tr><td><a href="Weak.S.html#VALcount">count</a> [<a href="Weak.S.html">Weak.S</a>]</td>
<td><div class="info">
Count the number of elements in the table.
</div>
</td></tr>
<tr><td><a href="Stream.html#VALcount">count</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
Return the current count of the stream elements, i.e.
</div>
</td></tr>
<tr><td><a href="Gc.html#VALcounters">counters</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
Return <code class="code">(minor_words, promoted_words, major_words)</code>.
</div>
</td></tr>
<tr><td><a href="Weak.S.html#VALcreate">create</a> [<a href="Weak.S.html">Weak.S</a>]</td>
<td><div class="info">
<code class="code">create n</code> creates a new empty weak hash table, of initial
        size <code class="code">n</code>.
</div>
</td></tr>
<tr><td><a href="Weak.html#VALcreate">create</a> [<a href="Weak.html">Weak</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Weak</span>.create n</code> returns a new weak array of length <code class="code">n</code>.
</div>
</td></tr>
<tr><td><a href="Thread.html#VALcreate">create</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Thread</span>.create funct arg</code> creates a new thread of control,
   in which the function application <code class="code">funct arg</code>
   is executed concurrently with the other threads of the program.
</div>
</td></tr>
<tr><td><a href="String.html#VALcreate">create</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<span class="deprecated"><code class="code"><span class="constructor">String</span>.create n</code> returns a fresh byte sequence of length <code class="code">n</code>.
</span></div>
</td></tr>
<tr><td><a href="StringLabels.html#VALcreate">create</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<span class="deprecated"><code class="code"><span class="constructor">String</span>.create n</code> returns a fresh byte sequence of length <code class="code">n</code>.
</span></div>
</td></tr>
<tr><td><a href="Stack.html#VALcreate">create</a> [<a href="Stack.html">Stack</a>]</td>
<td><div class="info">
Return a new stack, initially empty.
</div>
</td></tr>
<tr><td><a href="Queue.html#VALcreate">create</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
Return a new queue, initially empty.
</div>
</td></tr>
<tr><td><a href="Mutex.html#VALcreate">create</a> [<a href="Mutex.html">Mutex</a>]</td>
<td><div class="info">
Return a new mutex.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALcreate">create</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALcreate">create</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALcreate">create</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALcreate">create</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALcreate">create</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALcreate">create</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Hashtbl</span>.create n</code> creates a new, empty hash table, with
   initial size <code class="code">n</code>.
</div>
</td></tr>
<tr><td><a href="Condition.html#VALcreate">create</a> [<a href="Condition.html">Condition</a>]</td>
<td><div class="info">
Return a new condition variable.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALcreate">create</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">create n</code> returns a new byte sequence of length <code class="code">n</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALcreate">create</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">create n</code> returns a new byte sequence of length <code class="code">n</code>.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALcreate">create</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
<code class="code">create n</code> returns a fresh buffer, initially empty.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALcreate">create</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array3</span>.create kind layout dim1 dim2 dim3</code> returns a new bigarray of
     three dimension, whose size is <code class="code">dim1</code> in the first dimension,
     <code class="code">dim2</code> in the second dimension, and <code class="code">dim3</code> in the third.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALcreate">create</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array2</span>.create kind layout dim1 dim2</code> returns a new bigarray of
     two dimension, whose size is <code class="code">dim1</code> in the first dimension
     and <code class="code">dim2</code> in the second dimension.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array1.html#VALcreate">create</a> [<a href="Bigarray.Array1.html">Bigarray.Array1</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array1</span>.create kind layout dim</code> returns a new bigarray of
     one dimension, whose size is <code class="code">dim</code>.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALcreate">create</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Genarray</span>.create kind layout dimensions</code> returns a new big array
     whose element kind is determined by the parameter <code class="code">kind</code> (one of
     <code class="code">float32</code>, <code class="code">float64</code>, <code class="code">int8_signed</code>, etc) and whose layout is
     determined by the parameter <code class="code">layout</code> (one of <code class="code">c_layout</code> or
     <code class="code">fortran_layout</code>).
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALcreate">create</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Array.html#VALcreate">create</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Gc.html#VALcreate_alarm">create_alarm</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
<code class="code">create_alarm f</code> will arrange for <code class="code">f</code> to be called at the end of each
   major GC cycle, starting with the current cycle or the next one.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALcreate_char_set">create_char_set</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="Graphics.html#VALcreate_image">create_image</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">create_image w h</code> returns a new image <code class="code">w</code> pixels wide and <code class="code">h</code>
   pixels tall, to be used in conjunction with <code class="code">blit_image</code>.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALcreate_matrix">create_matrix</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Array.html#VALcreate_matrix">create_matrix</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALcreate_object">create_object</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALcreate_object_and_run_initializers">create_object_and_run_initializers</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALcreate_object_opt">create_object_opt</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALcreate_process">create_process</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">create_process prog args new_stdin new_stdout new_stderr</code>
   forks a new process that executes the program
   in file <code class="code">prog</code>, with arguments <code class="code">args</code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALcreate_process">create_process</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">create_process prog args new_stdin new_stdout new_stderr</code>
   forks a new process that executes the program
   in file <code class="code">prog</code>, with arguments <code class="code">args</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALcreate_process_env">create_process_env</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">create_process_env prog args env new_stdin new_stdout new_stderr</code>
   works as <a href="UnixLabels.html#VALcreate_process"><code class="code"><span class="constructor">UnixLabels</span>.create_process</code></a>, except that the extra argument
   <code class="code">env</code> specifies the environment passed to the program.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALcreate_process_env">create_process_env</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">create_process_env prog args env new_stdin new_stdout new_stderr</code>
   works as <a href="Unix.html#VALcreate_process"><code class="code"><span class="constructor">Unix</span>.create_process</code></a>, except that the extra argument
   <code class="code">env</code> specifies the environment passed to the program.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALcreate_table">create_table</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Arg.html#VALcurrent">current</a> [<a href="Arg.html">Arg</a>]</td>
<td><div class="info">
Position (in <a href="Sys.html#VALargv"><code class="code"><span class="constructor">Sys</span>.argv</code></a>) of the argument being processed.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALcurrent_dir_name">current_dir_name</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
The conventional name for the current directory (e.g.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALcurrent_point">current_point</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Return the position of the current point.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALcurrent_x">current_x</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Return the abscissa of the current point.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALcurrent_y">current_y</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Return the ordinate of the current point.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALcurveto">curveto</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">curveto b c d</code> draws a cubic Bezier curve starting from
   the current point to point <code class="code">d</code>, with control points <code class="code">b</code> and
   <code class="code">c</code>, and moves the current point to <code class="code">d</code>.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALcustom_tag">custom_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Graphics.html#VALcyan">cyan</a> [<a href="Graphics.html">Graphics</a>]</td>
<td></td></tr>
<tr><td><a href="Sys.html#VALcygwin">cygwin</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
True if <code class="code"><span class="constructor">Sys</span>.os_type = <span class="string">"Cygwin"</span></code>.
</div>
</td></tr>
<tr><td align="left"><br>D</td></tr>
<tr><td><a href="Marshal.html#VALdata_size">data_size</a> [<a href="Marshal.html">Marshal</a>]</td>
<td><div class="info">
See <a href="Marshal.html#VALheader_size"><code class="code"><span class="constructor">Marshal</span>.header_size</code></a>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALdecr">decr</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Decrement the integer contained in the given reference.
</div>
</td></tr>
<tr><td><a href="Num.html#VALdecr_num">decr_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
<code class="code">decr r</code> is <code class="code">r:=!r-1</code>, where <code class="code">r</code> is a reference to a number.
</div>
</td></tr>
<tr><td><a href="Dynlink.html#VALdefault_available_units">default_available_units</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
Reset the set of units that can be referenced from dynamically-linked
    code to its default value, that is, all units composing the currently
    running program.
</div>
</td></tr>
<tr><td><a href="Thread.html#VALdelay">delay</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
<code class="code">delay d</code> suspends the execution of the calling thread for
   <code class="code">d</code> seconds.
</div>
</td></tr>
<tr><td><a href="Gc.html#VALdelete_alarm">delete_alarm</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
<code class="code">delete_alarm a</code> will stop the calls to the function associated
   to <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALdescr_of_in_channel">descr_of_in_channel</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the descriptor corresponding to an input channel.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALdescr_of_in_channel">descr_of_in_channel</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the descriptor corresponding to an input channel.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALdescr_of_out_channel">descr_of_out_channel</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the descriptor corresponding to an output channel.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALdescr_of_out_channel">descr_of_out_channel</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the descriptor corresponding to an output channel.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALdiff">diff</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
Set difference.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALdiff">diff</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="Bigarray.Array1.html#VALdim">dim</a> [<a href="Bigarray.Array1.html">Bigarray.Array1</a>]</td>
<td><div class="info">
Return the size (dimension) of the given one-dimensional
     big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALdim1">dim1</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Return the first dimension of the given three-dimensional big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALdim1">dim1</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Return the first dimension of the given two-dimensional big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALdim2">dim2</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Return the second dimension of the given three-dimensional big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALdim2">dim2</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Return the second dimension of the given two-dimensional big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALdim3">dim3</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Return the third dimension of the given three-dimensional big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALdims">dims</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Genarray</span>.dims a</code> returns all dimensions of the big array <code class="code">a</code>,
     as an array of integers of length <code class="code"><span class="constructor">Genarray</span>.num_dims a</code>.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALdir_sep">dir_sep</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
The directory separator (e.g.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALdirname">dirname</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
See <a href="Filename.html#VALbasename"><code class="code"><span class="constructor">Filename</span>.basename</code></a>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALdisplay_mode">display_mode</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Set display mode on or off.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALdiv">div</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Integer division.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALdiv">div</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Integer division.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALdiv">div</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Integer division.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALdiv">div</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Division
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALdiv_big_int">div_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Euclidean quotient of two big integers.
</div>
</td></tr>
<tr><td><a href="Num.html#VALdiv_num">div_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Division
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALdomain_of_sockaddr">domain_of_sockaddr</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the socket domain adequate for the given socket address.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALdomain_of_sockaddr">domain_of_sockaddr</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the socket domain adequate for the given socket address.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALdouble_array_tag">double_array_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Obj.html#VALdouble_field">double_field</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Obj.html#VALdouble_tag">double_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Graphics.html#VALdraw_arc">draw_arc</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">draw_arc x y rx ry a1 a2</code> draws an elliptical arc with center
   <code class="code">x,y</code>, horizontal radius <code class="code">rx</code>, vertical radius <code class="code">ry</code>, from angle
   <code class="code">a1</code> to angle <code class="code">a2</code> (in degrees).
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALdraw_char">draw_char</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
See <a href="Graphics.html#VALdraw_string"><code class="code"><span class="constructor">Graphics</span>.draw_string</code></a>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALdraw_circle">draw_circle</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">draw_circle x y r</code> draws a circle with center <code class="code">x,y</code> and
   radius <code class="code">r</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALdraw_ellipse">draw_ellipse</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">draw_ellipse x y rx ry</code> draws an ellipse with center
   <code class="code">x,y</code>, horizontal radius <code class="code">rx</code> and vertical radius <code class="code">ry</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALdraw_image">draw_image</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Draw the given image with lower left corner at the given point.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALdraw_poly">draw_poly</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">draw_poly polygon</code> draws the given polygon.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALdraw_poly_line">draw_poly_line</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">draw_poly_line points</code> draws the line that joins the
   points given by the array argument.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALdraw_rect">draw_rect</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">draw_rect x y w h</code> draws the rectangle with lower left corner
   at <code class="code">x,y</code>, width <code class="code">w</code> and height <code class="code">h</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALdraw_segments">draw_segments</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">draw_segments segments</code> draws the segments given in the array
   argument.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALdraw_string">draw_string</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Draw a character or a character string with lower left corner
   at current position.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALdummy_class">dummy_class</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Lexing.html#VALdummy_pos">dummy_pos</a> [<a href="Lexing.html">Lexing</a>]</td>
<td><div class="info">
A value of type <code class="code">position</code>, guaranteed to be different from any
   valid position.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALdummy_table">dummy_table</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Graphics.html#VALdump_image">dump_image</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Convert an image to a color matrix.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALdup">dup</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return a new file descriptor referencing the same file as
   the given descriptor.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALdup">dup</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return a new file descriptor referencing the same file as
   the given descriptor.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALdup">dup</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALdup2">dup2</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">dup2 fd1 fd2</code> duplicates <code class="code">fd1</code> to <code class="code">fd2</code>, closing <code class="code">fd2</code> if already
   opened.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALdup2">dup2</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">dup2 fd1 fd2</code> duplicates <code class="code">fd1</code> to <code class="code">fd2</code>, closing <code class="code">fd2</code> if already
   opened.
</div>
</td></tr>
<tr><td align="left"><br>E</td></tr>
<tr><td><a href="Set.S.html#VALelements">elements</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
Return the list of all elements of the given set.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALelements">elements</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="Stream.html#VALempty">empty</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
Return <code class="code">()</code> if the stream is empty, else raise <code class="code"><span class="constructor">Stream</span>.<span class="constructor">Failure</span></code>.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALempty">empty</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
The empty set.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALempty">empty</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALempty">empty</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALempty">empty</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
The empty map.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALempty">empty</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
A byte sequence of size 0.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALempty">empty</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
A byte sequence of size 0.
</div>
</td></tr>
<tr><td><a href="Scanf.Scanning.html#VALend_of_input">end_of_input</a> [<a href="Scanf.Scanning.html">Scanf.Scanning</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Scanning</span>.end_of_input ic</code> tests the end-of-input condition of the given
    formatted input channel.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALenvironment">environment</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the process environment, as an array of strings
    with the format ``variable=value''.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALenvironment">environment</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the process environment, as an array of strings
    with the format ``variable=value''.
</div>
</td></tr>
<tr><td><a href="Printf.html#VALeprintf">eprintf</a> [<a href="Printf.html">Printf</a>]</td>
<td><div class="info">
Same as <a href="Printf.html#VALfprintf"><code class="code"><span class="constructor">Printf</span>.fprintf</code></a>, but output on <code class="code">stderr</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALeprintf">eprintf</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Same as <code class="code">fprintf</code> above, but output on <code class="code">err_formatter</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALepsilon_float">epsilon_float</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
The difference between <code class="code">1.0</code> and the smallest exactly representable
    floating-point number greater than <code class="code">1.0</code>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALeq_big_int">eq_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td></td></tr>
<tr><td><a href="Num.html#VALeq_num">eq_num</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Set.S.html#VALequal">equal</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">equal s1 s2</code> tests whether the sets <code class="code">s1</code> and <code class="code">s2</code> are
       equal, that is, contain equal elements.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALequal">equal</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALequal">equal</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALequal">equal</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">equal cmp m1 m2</code> tests whether the maps <code class="code">m1</code> and <code class="code">m2</code> are
       equal, that is, contain equal keys and associate them with
       equal data.
</div>
</td></tr>
<tr><td><a href="Hashtbl.SeededHashedType.html#VALequal">equal</a> [<a href="Hashtbl.SeededHashedType.html">Hashtbl.SeededHashedType</a>]</td>
<td><div class="info">
The equality predicate used to compare keys.
</div>
</td></tr>
<tr><td><a href="Hashtbl.HashedType.html#VALequal">equal</a> [<a href="Hashtbl.HashedType.html">Hashtbl.HashedType</a>]</td>
<td><div class="info">
The equality predicate used to compare keys.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormatBasics.html#VALerase_rel">erase_rel</a> [<a href="CamlinternalFormatBasics.html">CamlinternalFormatBasics</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALerr_formatter">err_formatter</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
A formatter to use with formatting functions below for
   output to standard error.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALerror_message">error_message</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return a string describing the given error code.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALerror_message">error_message</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return a string describing the given error code.
</div>
</td></tr>
<tr><td><a href="Dynlink.html#VALerror_message">error_message</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
Convert an error description to a printable message.
</div>
</td></tr>
<tr><td><a href="String.html#VALescaped">escaped</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
Return a copy of the argument, with special characters
   represented by escape sequences, following the lexical
   conventions of OCaml.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALescaped">escaped</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
Return a copy of the argument, with special characters
   represented by escape sequences, following the lexical
   conventions of OCaml.
</div>
</td></tr>
<tr><td><a href="Char.html#VALescaped">escaped</a> [<a href="Char.html">Char</a>]</td>
<td><div class="info">
Return a string representing the given character,
   with special characters escaped following the lexical conventions
   of OCaml.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALescaped">escaped</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
Return a copy of the argument, with special characters represented
    by escape sequences, following the lexical conventions of OCaml.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALescaped">escaped</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Return a copy of the argument, with special characters represented
    by escape sequences, following the lexical conventions of OCaml.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALestablish_server">establish_server</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Establish a server on the given address.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALestablish_server">establish_server</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Establish a server on the given address.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALexecutable_name">executable_name</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
The name of the file containing the executable currently running.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALexecv">execv</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">execv prog args</code> execute the program in file <code class="code">prog</code>, with
   the arguments <code class="code">args</code>, and the current process environment.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALexecv">execv</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">execv prog args</code> execute the program in file <code class="code">prog</code>, with
   the arguments <code class="code">args</code>, and the current process environment.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALexecv">execv</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALexecve">execve</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="UnixLabels.html#VALexecv"><code class="code"><span class="constructor">UnixLabels</span>.execv</code></a>, except that the third argument provides the
   environment to the program executed.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALexecve">execve</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALexecv"><code class="code"><span class="constructor">Unix</span>.execv</code></a>, except that the third argument provides the
   environment to the program executed.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALexecve">execve</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALexecvp">execvp</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="UnixLabels.html#VALexecv"><code class="code"><span class="constructor">UnixLabels</span>.execv</code></a>, except that
   the program is searched in the path.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALexecvp">execvp</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALexecv"><code class="code"><span class="constructor">Unix</span>.execv</code></a>, except that
   the program is searched in the path.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALexecvp">execvp</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALexecvpe">execvpe</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="UnixLabels.html#VALexecve"><code class="code"><span class="constructor">UnixLabels</span>.execve</code></a>, except that
   the program is searched in the path.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALexecvpe">execvpe</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALexecve"><code class="code"><span class="constructor">Unix</span>.execve</code></a>, except that
   the program is searched in the path.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALexists">exists</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">exists p s</code> checks if at least one element of
       the set satisfies the predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALexists">exists</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALexists">exists</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALexists">exists</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">exists p m</code> checks if at least one binding of the map
        satisfy the predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALexists">exists</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code">exists p [a1; ...; an]</code> checks if at least one element of
   the list satisfies the predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALexists">exists</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code">exists p [a1; ...; an]</code> checks if at least one element of
   the list satisfies the predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALexists2">exists2</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Same as <a href="ListLabels.html#VALexists"><code class="code"><span class="constructor">ListLabels</span>.exists</code></a>, but for a two-argument predicate.
</div>
</td></tr>
<tr><td><a href="List.html#VALexists2">exists2</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALexists"><code class="code"><span class="constructor">List</span>.exists</code></a>, but for a two-argument predicate.
</div>
</td></tr>
<tr><td><a href="Thread.html#VALexit">exit</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
Terminate prematurely the currently executing thread.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALexit">exit</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Terminate the process, returning the given status code
   to the operating system: usually 0 to indicate no errors,
   and a small positive integer to indicate failure.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALexn_slot_id">exn_slot_id</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Printexc</span>.exn_slot_id</code> returns an integer which uniquely identifies
    the constructor used to create the exception value <code class="code">exn</code>
    (in the current runtime).
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALexn_slot_name">exn_slot_name</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Printexc</span>.exn_slot_id exn</code> returns the internal name of the constructor
    used to create the exception value <code class="code">exn</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALexp">exp</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Exponential.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALexp">exp</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Exponentiation.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALexpm1">expm1</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">expm1 x</code> computes <code class="code">exp x -. 1.0</code>, giving numerically-accurate results
    even if <code class="code">x</code> is close to <code class="code">0.0</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALextend">extend</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">extend s left right</code> returns a new byte sequence that contains
    the bytes of <code class="code">s</code>, with <code class="code">left</code> uninitialized bytes prepended and
    <code class="code">right</code> uninitialized bytes appended to it.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALextension_id">extension_id</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Obj.html#VALextension_name">extension_name</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Obj.html#VALextension_slot">extension_slot</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Big_int.html#VALextract_big_int">extract_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
<code class="code">extract_big_int bi ofs n</code> returns a nonnegative number
            corresponding to bits <code class="code">ofs</code> to <code class="code">ofs + n - 1</code> of the
            binary representation of <code class="code">bi</code>.
</div>
</td></tr>
<tr><td align="left"><br>F</td></tr>
<tr><td><a href="Pervasives.html#VALfailwith">failwith</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Raise exception <code class="code"><span class="constructor">Failure</span></code> with the given string.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALfast_sort">fast_sort</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALsort"><code class="code"><span class="constructor">List</span>.sort</code></a> or <a href="List.html#VALstable_sort"><code class="code"><span class="constructor">List</span>.stable_sort</code></a>, whichever is faster
    on typical input.
</div>
</td></tr>
<tr><td><a href="List.html#VALfast_sort">fast_sort</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALsort"><code class="code"><span class="constructor">List</span>.sort</code></a> or <a href="List.html#VALstable_sort"><code class="code"><span class="constructor">List</span>.stable_sort</code></a>, whichever is faster
    on typical input.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALfast_sort">fast_sort</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
Same as <a href="Array.html#VALsort"><code class="code"><span class="constructor">Array</span>.sort</code></a> or <a href="Array.html#VALstable_sort"><code class="code"><span class="constructor">Array</span>.stable_sort</code></a>, whichever is faster
    on typical input.
</div>
</td></tr>
<tr><td><a href="Array.html#VALfast_sort">fast_sort</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
Same as <a href="Array.html#VALsort"><code class="code"><span class="constructor">Array</span>.sort</code></a> or <a href="Array.html#VALstable_sort"><code class="code"><span class="constructor">Array</span>.stable_sort</code></a>, whichever is faster
    on typical input.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALfchmod">fchmod</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Change the permissions of an opened file.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALfchmod">fchmod</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Change the permissions of an opened file.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALfchown">fchown</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Change the owner uid and owner gid of an opened file.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALfchown">fchown</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Change the owner uid and owner gid of an opened file.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALfield">field</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Digest.html#VALfile">file</a> [<a href="Digest.html">Digest</a>]</td>
<td><div class="info">
Return the digest of the file whose name is given.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALfile_exists">file_exists</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Test if a file with the given name exists.
</div>
</td></tr>
<tr><td><a href="Weak.html#VALfill">fill</a> [<a href="Weak.html">Weak</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Weak</span>.fill ar ofs len el</code> sets to <code class="code">el</code> all pointers of <code class="code">ar</code> from
   <code class="code">ofs</code> to <code class="code">ofs + len - 1</code>.
</div>
</td></tr>
<tr><td><a href="String.html#VALfill">fill</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<span class="deprecated"><code class="code"><span class="constructor">String</span>.fill s start len c</code> modifies byte sequence <code class="code">s</code> in place,
   replacing <code class="code">len</code> bytes with <code class="code">c</code>, starting at <code class="code">start</code>.
</span></div>
</td></tr>
<tr><td><a href="StringLabels.html#VALfill">fill</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<span class="deprecated"><code class="code"><span class="constructor">String</span>.fill s start len c</code> modifies byte sequence <code class="code">s</code> in place,
   replacing <code class="code">len</code> bytes by <code class="code">c</code>, starting at <code class="code">start</code>.
</span></div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALfill">fill</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">fill s start len c</code> modifies <code class="code">s</code> in place, replacing <code class="code">len</code>
    characters with <code class="code">c</code>, starting at <code class="code">start</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALfill">fill</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">fill s start len c</code> modifies <code class="code">s</code> in place, replacing <code class="code">len</code>
    characters with <code class="code">c</code>, starting at <code class="code">start</code>.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALfill">fill</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Fill the given big array with the given value.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALfill">fill</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Fill the given big array with the given value.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array1.html#VALfill">fill</a> [<a href="Bigarray.Array1.html">Bigarray.Array1</a>]</td>
<td><div class="info">
Fill the given big array with the given value.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALfill">fill</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
Set all elements of a big array to a given value.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALfill">fill</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.fill a ofs len x</code> modifies the array <code class="code">a</code> in place,
   storing <code class="code">x</code> in elements number <code class="code">ofs</code> to <code class="code">ofs + len - 1</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALfill">fill</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.fill a ofs len x</code> modifies the array <code class="code">a</code> in place,
   storing <code class="code">x</code> in elements number <code class="code">ofs</code> to <code class="code">ofs + len - 1</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALfill_arc">fill_arc</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Fill an elliptical pie slice with the current color.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALfill_circle">fill_circle</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Fill a circle with the current color.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALfill_ellipse">fill_ellipse</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Fill an ellipse with the current color.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALfill_poly">fill_poly</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Fill the given polygon with the current color.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALfill_rect">fill_rect</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">fill_rect x y w h</code> fills the rectangle with lower left corner
   at <code class="code">x,y</code>, width <code class="code">w</code> and height <code class="code">h</code>, with the current color.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALfilter">filter</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">filter p s</code> returns the set of all elements in <code class="code">s</code>
       that satisfy predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALfilter">filter</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALfilter">filter</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALfilter">filter</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">filter p m</code> returns the map with all the bindings in <code class="code">m</code>
        that satisfy predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALfilter">filter</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code">filter p l</code> returns all the elements of the list <code class="code">l</code>
   that satisfy the predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALfilter">filter</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code">filter p l</code> returns all the elements of the list <code class="code">l</code>
   that satisfy the predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALfinal_tag">final_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Gc.html#VALfinalise">finalise</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
<code class="code">finalise f v</code> registers <code class="code">f</code> as a finalisation function for <code class="code">v</code>.
</div>
</td></tr>
<tr><td><a href="Gc.html#VALfinalise_release">finalise_release</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
A finalisation function may call <code class="code">finalise_release</code> to tell the
    GC that it can launch the next finalisation function without waiting
    for the current one to return.
</div>
</td></tr>
<tr><td><a href="Weak.S.html#VALfind">find</a> [<a href="Weak.S.html">Weak.S</a>]</td>
<td><div class="info">
<code class="code">find t x</code> returns an instance of <code class="code">x</code> found in <code class="code">t</code>.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALfind">find</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">find x s</code> returns the element of <code class="code">s</code> equal to <code class="code">x</code> (according
        to <code class="code"><span class="constructor">Ord</span>.compare</code>), or raise <code class="code"><span class="constructor">Not_found</span></code> if no such element
        exists.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALfind">find</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALfind">find</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALfind">find</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALfind">find</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALfind">find</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALfind">find</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">find x m</code> returns the current binding of <code class="code">x</code> in <code class="code">m</code>,
       or raises <code class="code"><span class="constructor">Not_found</span></code> if no such binding exists.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALfind">find</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code">find p l</code> returns the first element of the list <code class="code">l</code>
   that satisfies the predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALfind">find</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code">find p l</code> returns the first element of the list <code class="code">l</code>
   that satisfies the predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALfind">find</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALfind">find</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALfind">find</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Hashtbl</span>.find tbl x</code> returns the current binding of <code class="code">x</code> in <code class="code">tbl</code>,
   or raises <code class="code"><span class="constructor">Not_found</span></code> if no such binding exists.
</div>
</td></tr>
<tr><td><a href="Weak.S.html#VALfind_all">find_all</a> [<a href="Weak.S.html">Weak.S</a>]</td>
<td><div class="info">
<code class="code">find_all t x</code> returns a list of all the instances of <code class="code">x</code>
        found in <code class="code">t</code>.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALfind_all">find_all</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALfind_all">find_all</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALfind_all">find_all</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="ListLabels.html#VALfind_all">find_all</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code">find_all</code> is another name for <a href="ListLabels.html#VALfilter"><code class="code"><span class="constructor">ListLabels</span>.filter</code></a>.
</div>
</td></tr>
<tr><td><a href="List.html#VALfind_all">find_all</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code">find_all</code> is another name for <a href="List.html#VALfilter"><code class="code"><span class="constructor">List</span>.filter</code></a>.
</div>
</td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALfind_all">find_all</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALfind_all">find_all</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALfind_all">find_all</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Hashtbl</span>.find_all tbl x</code> returns the list of all data
   associated with <code class="code">x</code> in <code class="code">tbl</code>.
</div>
</td></tr>
<tr><td><a href="Str.html#VALfirst_chars">first_chars</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">first_chars s n</code> returns the first <code class="code">n</code> characters of <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALflatten">flatten</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Same as <code class="code">concat</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALflatten">flatten</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Same as <code class="code">concat</code>.
</div>
</td></tr>
<tr><td><a href="Random.State.html#VALfloat">float</a> [<a href="Random.State.html">Random.State</a>]</td>
<td></td></tr>
<tr><td><a href="Random.html#VALfloat">float</a> [<a href="Random.html">Random</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Random</span>.float bound</code> returns a random floating-point number
   between 0 and <code class="code">bound</code> (inclusive).
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALfloat">float</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Same as <a href="Pervasives.html#VALfloat_of_int"><code class="code">float_of_int</code></a>.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALfloat32">float32</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALfloat64">float64</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALfloat_of_big_int">float_of_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Returns a floating-point number approximating the
           given big integer.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALfloat_of_bits">float_of_bits</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Return the floating-point number whose internal representation,
   according to the IEEE 754 floating-point 'double format' bit layout,
   is the given <code class="code">int64</code>.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALfloat_of_bits">float_of_bits</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Return the floating-point number whose internal representation,
   according to the IEEE 754 floating-point 'single format' bit layout,
   is the given <code class="code">int32</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALfloat_of_int">float_of_int</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Convert an integer to floating-point.
</div>
</td></tr>
<tr><td><a href="Num.html#VALfloat_of_num">float_of_num</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALfloat_of_string">float_of_string</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Convert the given string to a float.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALfloor">floor</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Round below to an integer value.
</div>
</td></tr>
<tr><td><a href="Num.html#VALfloor_num">floor_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
<code class="code">floor_num n</code> returns the largest integer smaller or equal to <code class="code">n</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALflush">flush</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Flush the buffer associated with the given output channel,
   performing all pending writes on that channel.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALflush_all">flush_all</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Flush all open output channels; ignore errors.
</div>
</td></tr>
<tr><td><a href="Lexing.html#VALflush_input">flush_input</a> [<a href="Lexing.html">Lexing</a>]</td>
<td><div class="info">
Discard the contents of the buffer and reset the current
    position to 0.
</div>
</td></tr>
<tr><td><a href="Format.html#VALflush_str_formatter">flush_str_formatter</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Returns the material printed with <code class="code">str_formatter</code>, flushes
   the formatter and resets the corresponding buffer.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALfmt_ebb_of_string">fmt_ebb_of_string</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="Weak.S.html#VALfold">fold</a> [<a href="Weak.S.html">Weak.S</a>]</td>
<td><div class="info">
<code class="code">fold f t init</code> computes <code class="code">(f d1 (... (f dN init)))</code> where
        <code class="code">d1 ... dN</code> are the elements of <code class="code">t</code> in some unspecified order.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALfold">fold</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">fold f s a</code> computes <code class="code">(f xN ... (f x2 (f x1 a))...)</code>,
       where <code class="code">x1 ... xN</code> are the elements of <code class="code">s</code>, in increasing order.
</div>
</td></tr>
<tr><td><a href="Queue.html#VALfold">fold</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
<code class="code">fold f accu q</code> is equivalent to <code class="code"><span class="constructor">List</span>.fold_left f accu l</code>,
   where <code class="code">l</code> is the list of <code class="code">q</code>'s elements.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALfold">fold</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALfold">fold</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALfold">fold</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALfold">fold</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALfold">fold</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALfold">fold</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">fold f m a</code> computes <code class="code">(f kN dN ... (f k1 d1 a)...)</code>,
       where <code class="code">k1 ... kN</code> are the keys of all bindings in <code class="code">m</code>
       (in increasing order), and <code class="code">d1 ... dN</code> are the associated data.
</div>
</td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALfold">fold</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALfold">fold</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALfold">fold</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Hashtbl</span>.fold f tbl init</code> computes
   <code class="code">(f kN dN ... (f k1 d1 init)...)</code>,
   where <code class="code">k1 ... kN</code> are the keys of all bindings in <code class="code">tbl</code>,
   and <code class="code">d1 ... dN</code> are the associated values.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALfold_left">fold_left</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.fold_left f a [b1; ...; bn]</code> is
   <code class="code">f (... (f (f a b1) b2) ...) bn</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALfold_left">fold_left</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.fold_left f a [b1; ...; bn]</code> is
   <code class="code">f (... (f (f a b1) b2) ...) bn</code>.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALfold_left">fold_left</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.fold_left f x a</code> computes
   <code class="code">f (... (f (f x a.(0)) a.(1)) ...) a.(n-1)</code>,
   where <code class="code">n</code> is the length of the array <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALfold_left">fold_left</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.fold_left f x a</code> computes
   <code class="code">f (... (f (f x a.(0)) a.(1)) ...) a.(n-1)</code>,
   where <code class="code">n</code> is the length of the array <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALfold_left2">fold_left2</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.fold_left2 f a [b1; ...; bn] [c1; ...; cn]</code> is
   <code class="code">f (... (f (f a b1 c1) b2 c2) ...) bn cn</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALfold_left2">fold_left2</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.fold_left2 f a [b1; ...; bn] [c1; ...; cn]</code> is
   <code class="code">f (... (f (f a b1 c1) b2 c2) ...) bn cn</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALfold_right">fold_right</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.fold_right f [a1; ...; an] b</code> is
   <code class="code">f a1 (f a2 (... (f an b) ...))</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALfold_right">fold_right</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.fold_right f [a1; ...; an] b</code> is
   <code class="code">f a1 (f a2 (... (f an b) ...))</code>.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALfold_right">fold_right</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.fold_right f a x</code> computes
   <code class="code">f a.(0) (f a.(1) ( ... (f a.(n-1) x) ...))</code>,
   where <code class="code">n</code> is the length of the array <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALfold_right">fold_right</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.fold_right f a x</code> computes
   <code class="code">f a.(0) (f a.(1) ( ... (f a.(n-1) x) ...))</code>,
   where <code class="code">n</code> is the length of the array <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALfold_right2">fold_right2</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.fold_right2 f [a1; ...; an] [b1; ...; bn] c</code> is
   <code class="code">f a1 b1 (f a2 b2 (... (f an bn c) ...))</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALfold_right2">fold_right2</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.fold_right2 f [a1; ...; an] [b1; ...; bn] c</code> is
   <code class="code">f a1 b1 (f a2 b2 (... (f an bn c) ...))</code>.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALfor_all">for_all</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">for_all p s</code> checks if all elements of the set
       satisfy the predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALfor_all">for_all</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALfor_all">for_all</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALfor_all">for_all</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">for_all p m</code> checks if all the bindings of the map
        satisfy the predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALfor_all">for_all</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code">for_all p [a1; ...; an]</code> checks if all elements of the list
   satisfy the predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALfor_all">for_all</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code">for_all p [a1; ...; an]</code> checks if all elements of the list
   satisfy the predicate <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALfor_all2">for_all2</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Same as <a href="ListLabels.html#VALfor_all"><code class="code"><span class="constructor">ListLabels</span>.for_all</code></a>, but for a two-argument predicate.
</div>
</td></tr>
<tr><td><a href="List.html#VALfor_all2">for_all2</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALfor_all"><code class="code"><span class="constructor">List</span>.for_all</code></a>, but for a two-argument predicate.
</div>
</td></tr>
<tr><td><a href="Lazy.html#VALforce">force</a> [<a href="Lazy.html">Lazy</a>]</td>
<td><div class="info">
<code class="code">force x</code> forces the suspension <code class="code">x</code> and returns its result.
</div>
</td></tr>
<tr><td><a href="CamlinternalLazy.html#VALforce">force</a> [<a href="CamlinternalLazy.html">CamlinternalLazy</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalLazy.html#VALforce_lazy_block">force_lazy_block</a> [<a href="CamlinternalLazy.html">CamlinternalLazy</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALforce_newline">force_newline</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Forces a newline in the current box.
</div>
</td></tr>
<tr><td><a href="Lazy.html#VALforce_val">force_val</a> [<a href="Lazy.html">Lazy</a>]</td>
<td><div class="info">
<code class="code">force_val x</code> forces the suspension <code class="code">x</code> and returns its
    result.
</div>
</td></tr>
<tr><td><a href="CamlinternalLazy.html#VALforce_val">force_val</a> [<a href="CamlinternalLazy.html">CamlinternalLazy</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalLazy.html#VALforce_val_lazy_block">force_val_lazy_block</a> [<a href="CamlinternalLazy.html">CamlinternalLazy</a>]</td>
<td></td></tr>
<tr><td><a href="Graphics.html#VALforeground">foreground</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Default background and foreground colors (usually, either black
   foreground on a white background or white foreground on a
   black background).
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALfork">fork</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Fork a new process.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALfork">fork</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Fork a new process.
</div>
</td></tr>
<tr><td><a href="Printexc.Slot.html#VALformat">format</a> [<a href="Printexc.Slot.html">Printexc.Slot</a>]</td>
<td><div class="info">
<code class="code">format pos slot</code> returns the string representation of <code class="code">slot</code> as
      <code class="code">raw_backtrace_to_string</code> would format it, assuming it is the
      <code class="code">pos</code>-th element of the backtrace: the <code class="code">0</code>-th element is
      pretty-printed differently than the others.
</div>
</td></tr>
<tr><td><a href="Scanf.html#VALformat_from_string">format_from_string</a> [<a href="Scanf.html">Scanf</a>]</td>
<td><div class="info">
<code class="code">format_from_string s fmt</code> converts a string argument to a format string,
    according to the given format string <code class="code">fmt</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALformat_of_string">format_of_string</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">format_of_string s</code> returns a format string read from the string
    literal <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALformat_of_string_fmtty">format_of_string_fmtty</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalFormat.html#VALformat_of_string_format">format_of_string_format</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALformatter_of_buffer">formatter_of_buffer</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">formatter_of_buffer b</code> returns a new formatter writing to
   buffer <code class="code">b</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALformatter_of_out_channel">formatter_of_out_channel</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">formatter_of_out_channel oc</code> returns a new formatter that
   writes to the corresponding channel <code class="code">oc</code>.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALfortran_layout">fortran_layout</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td></td></tr>
<tr><td><a href="Obj.html#VALforward_tag">forward_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Printf.html#VALfprintf">fprintf</a> [<a href="Printf.html">Printf</a>]</td>
<td><div class="info">
<code class="code">fprintf outchan format arg1 ... argN</code> formats the arguments
   <code class="code">arg1</code> to <code class="code">argN</code> according to the format string <code class="code">format</code>, and
   outputs the resulting string on the channel <code class="code">outchan</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALfprintf">fprintf</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalFormat.html#VALfreeze_char_set">freeze_char_set</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALfrexp">frexp</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">frexp f</code> returns the pair of the significant
   and the exponent of <code class="code">f</code>.
</div>
</td></tr>
<tr><td><a href="Stream.html#VALfrom">from</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Stream</span>.from f</code> returns a stream built from the function <code class="code">f</code>.
</div>
</td></tr>
<tr><td><a href="Marshal.html#VALfrom_bytes">from_bytes</a> [<a href="Marshal.html">Marshal</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Marshal</span>.from_bytes buff ofs</code> unmarshals a structured value
   like <a href="Marshal.html#VALfrom_channel"><code class="code"><span class="constructor">Marshal</span>.from_channel</code></a> does, except that the byte
   representation is not read from a channel, but taken from
   the byte sequence <code class="code">buff</code>, starting at position <code class="code">ofs</code>.
</div>
</td></tr>
<tr><td><a href="Scanf.Scanning.html#VALfrom_channel">from_channel</a> [<a href="Scanf.Scanning.html">Scanf.Scanning</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Scanning</span>.from_channel ic</code> returns a formatted input channel which reads
    from the regular input channel <code class="code">ic</code> argument, starting at the current
    reading position.
</div>
</td></tr>
<tr><td><a href="Marshal.html#VALfrom_channel">from_channel</a> [<a href="Marshal.html">Marshal</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Marshal</span>.from_channel chan</code> reads from channel <code class="code">chan</code> the
   byte representation of a structured value, as produced by
   one of the <code class="code"><span class="constructor">Marshal</span>.to_*</code> functions, and reconstructs and
   returns the corresponding value.
</div>
</td></tr>
<tr><td><a href="Lexing.html#VALfrom_channel">from_channel</a> [<a href="Lexing.html">Lexing</a>]</td>
<td><div class="info">
Create a lexer buffer on the given input channel.
</div>
</td></tr>
<tr><td><a href="Scanf.Scanning.html#VALfrom_file">from_file</a> [<a href="Scanf.Scanning.html">Scanf.Scanning</a>]</td>
<td><div class="info">
An alias for <code class="code">open_in</code> above.
</div>
</td></tr>
<tr><td><a href="Scanf.Scanning.html#VALfrom_file_bin">from_file_bin</a> [<a href="Scanf.Scanning.html">Scanf.Scanning</a>]</td>
<td><div class="info">
An alias for <code class="code">open_in_bin</code> above.
</div>
</td></tr>
<tr><td><a href="Lazy.html#VALfrom_fun">from_fun</a> [<a href="Lazy.html">Lazy</a>]</td>
<td><div class="info">
<code class="code">from_fun f</code> is the same as <code class="code"><span class="keyword">lazy</span> (f ())</code> but slightly more efficient.
</div>
</td></tr>
<tr><td><a href="Scanf.Scanning.html#VALfrom_function">from_function</a> [<a href="Scanf.Scanning.html">Scanf.Scanning</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Scanning</span>.from_function f</code> returns a formatted input channel with the
    given function as its reading method.
</div>
</td></tr>
<tr><td><a href="Lexing.html#VALfrom_function">from_function</a> [<a href="Lexing.html">Lexing</a>]</td>
<td><div class="info">
Create a lexer buffer with the given function as its reading method.
</div>
</td></tr>
<tr><td><a href="Digest.html#VALfrom_hex">from_hex</a> [<a href="Digest.html">Digest</a>]</td>
<td><div class="info">
Convert a hexadecimal representation back into the corresponding digest.
</div>
</td></tr>
<tr><td><a href="Scanf.Scanning.html#VALfrom_string">from_string</a> [<a href="Scanf.Scanning.html">Scanf.Scanning</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Scanning</span>.from_string s</code> returns a formatted input channel which reads
    from the given string.
</div>
</td></tr>
<tr><td><a href="Marshal.html#VALfrom_string">from_string</a> [<a href="Marshal.html">Marshal</a>]</td>
<td><div class="info">
Same as <code class="code">from_bytes</code> but take a string as argument instead of a
    byte sequence.
</div>
</td></tr>
<tr><td><a href="Lexing.html#VALfrom_string">from_string</a> [<a href="Lexing.html">Lexing</a>]</td>
<td><div class="info">
Create a lexer buffer which reads from
   the given string.
</div>
</td></tr>
<tr><td><a href="Lazy.html#VALfrom_val">from_val</a> [<a href="Lazy.html">Lazy</a>]</td>
<td><div class="info">
<code class="code">from_val v</code> returns an already-forced suspension of <code class="code">v</code>.
</div>
</td></tr>
<tr><td><a href="Scanf.html#VALfscanf">fscanf</a> [<a href="Scanf.html">Scanf</a>]</td>
<td><div class="info">
Same as <a href="Scanf.html#VALbscanf"><code class="code"><span class="constructor">Scanf</span>.bscanf</code></a>, but reads from the given regular input channel.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALfst">fst</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the first component of a pair.
</div>
</td></tr>
<tr><td><a href="UnixLabels.LargeFile.html#VALfstat">fstat</a> [<a href="UnixLabels.LargeFile.html">UnixLabels.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALfstat">fstat</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the information for the file associated with the given
   descriptor.
</div>
</td></tr>
<tr><td><a href="Unix.LargeFile.html#VALfstat">fstat</a> [<a href="Unix.LargeFile.html">Unix.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="Unix.html#VALfstat">fstat</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the information for the file associated with the given
   descriptor.
</div>
</td></tr>
<tr><td><a href="UnixLabels.LargeFile.html#VALftruncate">ftruncate</a> [<a href="UnixLabels.LargeFile.html">UnixLabels.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALftruncate">ftruncate</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Truncates the file corresponding to the given descriptor
   to the given size.
</div>
</td></tr>
<tr><td><a href="Unix.LargeFile.html#VALftruncate">ftruncate</a> [<a href="Unix.LargeFile.html">Unix.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="Unix.html#VALftruncate">ftruncate</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Truncates the file corresponding to the given descriptor
   to the given size.
</div>
</td></tr>
<tr><td><a href="Random.html#VALfull_init">full_init</a> [<a href="Random.html">Random</a>]</td>
<td><div class="info">
Same as <a href="Random.html#VALinit"><code class="code"><span class="constructor">Random</span>.init</code></a> but takes more data as seed.
</div>
</td></tr>
<tr><td><a href="Gc.html#VALfull_major">full_major</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
Do a minor collection, finish the current major collection cycle,
   and perform a complete new cycle.
</div>
</td></tr>
<tr><td><a href="Str.html#VALfull_split">full_split</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
Same as <a href="Str.html#VALsplit_delim"><code class="code"><span class="constructor">Str</span>.split_delim</code></a>, but returns
   the delimiters as well as the substrings contained between
   delimiters.
</div>
</td></tr>
<tr><td align="left"><br>G</td></tr>
<tr><td><a href="Big_int.html#VALgcd_big_int">gcd_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Greatest common divisor of two big integers.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALge_big_int">ge_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td></td></tr>
<tr><td><a href="Num.html#VALge_num">ge_num</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Bigarray.html#VALgenarray_of_array1">genarray_of_array1</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
Return the generic big array corresponding to the given one-dimensional
   big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALgenarray_of_array2">genarray_of_array2</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
Return the generic big array corresponding to the given two-dimensional
   big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALgenarray_of_array3">genarray_of_array3</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
Return the generic big array corresponding to the given three-dimensional
   big array.
</div>
</td></tr>
<tr><td><a href="Weak.html#VALget">get</a> [<a href="Weak.html">Weak</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Weak</span>.get ar n</code> returns None if the <code class="code">n</code>th cell of <code class="code">ar</code> is
   empty, <code class="code"><span class="constructor">Some</span> x</code> (where <code class="code">x</code> is the value) if it is full.
</div>
</td></tr>
<tr><td><a href="String.html#VALget">get</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.get s n</code> returns the character at index <code class="code">n</code> in string <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALget">get</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.get s n</code> returns the character at index <code class="code">n</code> in string <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="Gc.html#VALget">get</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
Return the current values of the GC parameters in a <code class="code">control</code> record.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALget">get</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">get s n</code> returns the byte at index <code class="code">n</code> in argument <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALget">get</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">get s n</code> returns the byte at index <code class="code">n</code> in argument <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALget">get</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array3</span>.get a x y z</code>, also written <code class="code">a.{x,y,z}</code>,
     returns the element of <code class="code">a</code> at coordinates (<code class="code">x</code>, <code class="code">y</code>, <code class="code">z</code>).
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALget">get</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array2</span>.get a x y</code>, also written <code class="code">a.{x,y}</code>,
     returns the element of <code class="code">a</code> at coordinates (<code class="code">x</code>, <code class="code">y</code>).
</div>
</td></tr>
<tr><td><a href="Bigarray.Array1.html#VALget">get</a> [<a href="Bigarray.Array1.html">Bigarray.Array1</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array1</span>.get a x</code>, or alternatively <code class="code">a.{x}</code>,
     returns the element of <code class="code">a</code> at index <code class="code">x</code>.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALget">get</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
Read an element of a generic big array.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALget">get</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.get a n</code> returns the element number <code class="code">n</code> of array <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALget">get</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.get a n</code> returns the element number <code class="code">n</code> of array <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALget_all_formatter_output_functions">get_all_formatter_output_functions</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Arith_status.html#VALget_approx_printing">get_approx_printing</a> [<a href="Arith_status.html">Arith_status</a>]</td>
<td><div class="info">
See <a href="Arith_status.html#VALset_approx_printing"><code class="code"><span class="constructor">Arith_status</span>.set_approx_printing</code></a>.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALget_backtrace">get_backtrace</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Printexc</span>.get_backtrace ()</code> returns a string containing the
    same exception backtrace that <code class="code"><span class="constructor">Printexc</span>.print_backtrace</code> would
    print.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALget_callstack">get_callstack</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Printexc</span>.get_callstack n</code> returns a description of the top of the
    call stack on the current program point (for the current thread),
    with at most <code class="code">n</code> entries.
</div>
</td></tr>
<tr><td><a href="Weak.html#VALget_copy">get_copy</a> [<a href="Weak.html">Weak</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Weak</span>.get_copy ar n</code> returns None if the <code class="code">n</code>th cell of <code class="code">ar</code> is
   empty, <code class="code"><span class="constructor">Some</span> x</code> (where <code class="code">x</code> is a (shallow) copy of the value) if
   it is full.
</div>
</td></tr>
<tr><td><a href="Format.html#VALget_ellipsis_text">get_ellipsis_text</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Return the text of the ellipsis.
</div>
</td></tr>
<tr><td><a href="Arith_status.html#VALget_error_when_null_denominator">get_error_when_null_denominator</a> [<a href="Arith_status.html">Arith_status</a>]</td>
<td><div class="info">
See <a href="Arith_status.html#VALset_error_when_null_denominator"><code class="code"><span class="constructor">Arith_status</span>.set_error_when_null_denominator</code></a>.
</div>
</td></tr>
<tr><td><a href="Arith_status.html#VALget_floating_precision">get_floating_precision</a> [<a href="Arith_status.html">Arith_status</a>]</td>
<td><div class="info">
See <a href="Arith_status.html#VALset_floating_precision"><code class="code"><span class="constructor">Arith_status</span>.set_floating_precision</code></a>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALget_formatter_out_functions">get_formatter_out_functions</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Return the current output functions of the pretty-printer,
   including line breaking and indentation functions.
</div>
</td></tr>
<tr><td><a href="Format.html#VALget_formatter_output_functions">get_formatter_output_functions</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Return the current output functions of the pretty-printer.
</div>
</td></tr>
<tr><td><a href="Format.html#VALget_formatter_tag_functions">get_formatter_tag_functions</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Return the current tag functions of the pretty-printer.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALget_image">get_image</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Capture the contents of a rectangle on the screen as an image.
</div>
</td></tr>
<tr><td><a href="Format.html#VALget_margin">get_margin</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Returns the position of the right margin.
</div>
</td></tr>
<tr><td><a href="Format.html#VALget_mark_tags">get_mark_tags</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Return the current status of tags printing and tags marking.
</div>
</td></tr>
<tr><td><a href="Format.html#VALget_max_boxes">get_max_boxes</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Returns the maximum number of boxes allowed before ellipsis.
</div>
</td></tr>
<tr><td><a href="Format.html#VALget_max_indent">get_max_indent</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Return the value of the maximum indentation limit (in characters).
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALget_method">get_method</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALget_method_label">get_method_label</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALget_method_labels">get_method_labels</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Arith_status.html#VALget_normalize_ratio">get_normalize_ratio</a> [<a href="Arith_status.html">Arith_status</a>]</td>
<td><div class="info">
See <a href="Arith_status.html#VALset_normalize_ratio"><code class="code"><span class="constructor">Arith_status</span>.set_normalize_ratio</code></a>.
</div>
</td></tr>
<tr><td><a href="Arith_status.html#VALget_normalize_ratio_when_printing">get_normalize_ratio_when_printing</a> [<a href="Arith_status.html">Arith_status</a>]</td>
<td><div class="info">
See <a href="Arith_status.html#VALset_normalize_ratio_when_printing"><code class="code"><span class="constructor">Arith_status</span>.set_normalize_ratio_when_printing</code></a>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALget_print_tags">get_print_tags</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALget_public_method">get_public_method</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Printexc.html#VALget_raw_backtrace">get_raw_backtrace</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Printexc</span>.get_raw_backtrace ()</code> returns the same exception
    backtrace that <code class="code"><span class="constructor">Printexc</span>.print_backtrace</code> would print, but in
    a raw format.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALget_raw_backtrace_slot">get_raw_backtrace_slot</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code">get_slot bckt pos</code> returns the slot in position <code class="code">pos</code> in the
    backtrace <code class="code">bckt</code>.
</div>
</td></tr>
<tr><td><a href="Random.html#VALget_state">get_state</a> [<a href="Random.html">Random</a>]</td>
<td><div class="info">
Return the current state of the generator used by the basic functions.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALget_temp_dir_name">get_temp_dir_name</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
The name of the temporary directory:
    Under Unix, the value of the <code class="code"><span class="constructor">TMPDIR</span></code> environment variable, or "/tmp"
    if the variable is not set.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALget_variable">get_variable</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALget_variables">get_variables</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALgetaddrinfo">getaddrinfo</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">getaddrinfo host service opts</code> returns a list of <a href="Unix.html#TYPEaddr_info"><code class="code"><span class="constructor">Unix</span>.addr_info</code></a>
    records describing socket parameters and addresses suitable for
    communicating with the given host and service.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetaddrinfo">getaddrinfo</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">getaddrinfo host service opts</code> returns a list of <a href="Unix.html#TYPEaddr_info"><code class="code"><span class="constructor">Unix</span>.addr_info</code></a>
    records describing socket parameters and addresses suitable for
    communicating with the given host and service.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetcwd">getcwd</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the name of the current working directory.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetcwd">getcwd</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the name of the current working directory.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALgetcwd">getcwd</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Return the current working directory of the process.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetegid">getegid</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the effective group id under which the process runs.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetegid">getegid</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the effective group id under which the process runs.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetenv">getenv</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the value associated to a variable in the process
   environment.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetenv">getenv</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the value associated to a variable in the process
   environment.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALgetenv">getenv</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Return the value associated to a variable in the process
   environment.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgeteuid">geteuid</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the effective user id under which the process runs.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgeteuid">geteuid</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the effective user id under which the process runs.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetgid">getgid</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the group id of the user executing the process.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetgid">getgid</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the group id of the user executing the process.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetgrgid">getgrgid</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Find an entry in <code class="code">group</code> with the given group id, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetgrgid">getgrgid</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Find an entry in <code class="code">group</code> with the given group id, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetgrnam">getgrnam</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Find an entry in <code class="code">group</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetgrnam">getgrnam</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Find an entry in <code class="code">group</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetgroups">getgroups</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the list of groups to which the user executing the process
   belongs.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetgroups">getgroups</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the list of groups to which the user executing the process
   belongs.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgethostbyaddr">gethostbyaddr</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Find an entry in <code class="code">hosts</code> with the given address, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgethostbyaddr">gethostbyaddr</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Find an entry in <code class="code">hosts</code> with the given address, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgethostbyname">gethostbyname</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Find an entry in <code class="code">hosts</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgethostbyname">gethostbyname</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Find an entry in <code class="code">hosts</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgethostname">gethostname</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the name of the local host.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgethostname">gethostname</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the name of the local host.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetitimer">getitimer</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the current status of the given interval timer.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetitimer">getitimer</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the current status of the given interval timer.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetlogin">getlogin</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the login name of the user executing the process.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetlogin">getlogin</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the login name of the user executing the process.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetnameinfo">getnameinfo</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">getnameinfo addr opts</code> returns the host name and service name
    corresponding to the socket address <code class="code">addr</code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetnameinfo">getnameinfo</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">getnameinfo addr opts</code> returns the host name and service name
    corresponding to the socket address <code class="code">addr</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetpeername">getpeername</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the address of the host connected to the given socket.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetpeername">getpeername</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the address of the host connected to the given socket.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetpid">getpid</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the pid of the process.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetpid">getpid</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the pid of the process.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetppid">getppid</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the pid of the parent process.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetppid">getppid</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the pid of the parent process.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetprotobyname">getprotobyname</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Find an entry in <code class="code">protocols</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetprotobyname">getprotobyname</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Find an entry in <code class="code">protocols</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetprotobynumber">getprotobynumber</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Find an entry in <code class="code">protocols</code> with the given protocol number,
   or raise <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetprotobynumber">getprotobynumber</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Find an entry in <code class="code">protocols</code> with the given protocol number,
   or raise <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetpwnam">getpwnam</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Find an entry in <code class="code">passwd</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetpwnam">getpwnam</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Find an entry in <code class="code">passwd</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetpwuid">getpwuid</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Find an entry in <code class="code">passwd</code> with the given user id, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetpwuid">getpwuid</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Find an entry in <code class="code">passwd</code> with the given user id, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetservbyname">getservbyname</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Find an entry in <code class="code">services</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetservbyname">getservbyname</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Find an entry in <code class="code">services</code> with the given name, or raise
   <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetservbyport">getservbyport</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Find an entry in <code class="code">services</code> with the given service number,
   or raise <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetservbyport">getservbyport</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Find an entry in <code class="code">services</code> with the given service number,
   or raise <code class="code"><span class="constructor">Not_found</span></code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetsockname">getsockname</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the address of the given socket.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetsockname">getsockname</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the address of the given socket.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetsockopt">getsockopt</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the current status of a boolean-valued option
   in the given socket.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetsockopt">getsockopt</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the current status of a boolean-valued option
   in the given socket.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetsockopt_error">getsockopt_error</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the error condition associated with the given socket,
    and clear it.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetsockopt_error">getsockopt_error</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the error condition associated with the given socket,
    and clear it.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetsockopt_float">getsockopt_float</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALgetsockopt"><code class="code"><span class="constructor">Unix</span>.getsockopt</code></a> for a socket option whose value is a
    floating-point number.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetsockopt_float">getsockopt_float</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALgetsockopt"><code class="code"><span class="constructor">Unix</span>.getsockopt</code></a> for a socket option whose value is a
   floating-point number.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetsockopt_int">getsockopt_int</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALgetsockopt"><code class="code"><span class="constructor">Unix</span>.getsockopt</code></a> for an integer-valued socket option.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetsockopt_int">getsockopt_int</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALgetsockopt"><code class="code"><span class="constructor">Unix</span>.getsockopt</code></a> for an integer-valued socket option.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetsockopt_optint">getsockopt_optint</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALgetsockopt"><code class="code"><span class="constructor">Unix</span>.getsockopt</code></a> for a socket option whose value is
    an <code class="code">int option</code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetsockopt_optint">getsockopt_optint</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALgetsockopt"><code class="code"><span class="constructor">Unix</span>.getsockopt</code></a> for a socket option whose value is an
   <code class="code">int option</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgettimeofday">gettimeofday</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="UnixLabels.html#VALtime"><code class="code"><span class="constructor">UnixLabels</span>.time</code></a>, but with resolution better than 1 second.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgettimeofday">gettimeofday</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALtime"><code class="code"><span class="constructor">Unix</span>.time</code></a>, but with resolution better than 1 second.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgetuid">getuid</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the user id of the user executing the process.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgetuid">getuid</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the user id of the user executing the process.
</div>
</td></tr>
<tr><td><a href="Str.html#VALglobal_replace">global_replace</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">global_replace regexp templ s</code> returns a string identical to <code class="code">s</code>,
   except that all substrings of <code class="code">s</code> that match <code class="code">regexp</code> have been
   replaced by <code class="code">templ</code>.
</div>
</td></tr>
<tr><td><a href="Str.html#VALglobal_substitute">global_substitute</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">global_substitute regexp subst s</code> returns a string identical
   to <code class="code">s</code>, except that all substrings of <code class="code">s</code> that match <code class="code">regexp</code>
   have been replaced by the result of function <code class="code">subst</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALgmtime">gmtime</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Convert a time in seconds, as returned by <a href="UnixLabels.html#VALtime"><code class="code"><span class="constructor">UnixLabels</span>.time</code></a>, into a date
   and a time.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALgmtime">gmtime</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Convert a time in seconds, as returned by <a href="Unix.html#VALtime"><code class="code"><span class="constructor">Unix</span>.time</code></a>, into a date and
   a time.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALgreen">green</a> [<a href="Graphics.html">Graphics</a>]</td>
<td></td></tr>
<tr><td><a href="Str.html#VALgroup_beginning">group_beginning</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">group_beginning n</code> returns the position of the first character
   of the substring that was matched by the <code class="code">n</code>th group of
   the regular expression that was matched by the last call to a
   matching or searching function (see <a href="Str.html#VALmatched_string"><code class="code"><span class="constructor">Str</span>.matched_string</code></a> for details).
</div>
</td></tr>
<tr><td><a href="Str.html#VALgroup_end">group_end</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">group_end n</code> returns
   the position of the character following the last character of
   substring that was matched by the <code class="code">n</code>th group of the regular
   expression that was matched by the last call to a matching or
   searching function (see <a href="Str.html#VALmatched_string"><code class="code"><span class="constructor">Str</span>.matched_string</code></a> for details).
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALgt_big_int">gt_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Usual boolean comparisons between two big integers.
</div>
</td></tr>
<tr><td><a href="Num.html#VALgt_num">gt_num</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Event.html#VALguard">guard</a> [<a href="Event.html">Event</a>]</td>
<td><div class="info">
<code class="code">guard fn</code> returns the event that, when synchronized, computes
   <code class="code">fn()</code> and behaves as the resulting event.
</div>
</td></tr>
<tr><td align="left"><br>H</td></tr>
<tr><td><a href="UnixLabels.html#VALhandle_unix_error">handle_unix_error</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">handle_unix_error f x</code> applies <code class="code">f</code> to <code class="code">x</code> and returns the result.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALhandle_unix_error">handle_unix_error</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">handle_unix_error f x</code> applies <code class="code">f</code> to <code class="code">x</code> and returns the result.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALhash">hash</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.SeededHashedType.html#VALhash">hash</a> [<a href="Hashtbl.SeededHashedType.html">Hashtbl.SeededHashedType</a>]</td>
<td><div class="info">
A seeded hashing function on keys.
</div>
</td></tr>
<tr><td><a href="Hashtbl.HashedType.html#VALhash">hash</a> [<a href="Hashtbl.HashedType.html">Hashtbl.HashedType</a>]</td>
<td><div class="info">
A hashing function on keys.
</div>
</td></tr>
<tr><td><a href="Hashtbl.html#VALhash">hash</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Hashtbl</span>.hash x</code> associates a nonnegative integer to any value of
   any type.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALhash_param">hash_param</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALhash_param">hash_param</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Hashtbl</span>.hash_param meaningful total x</code> computes a hash value for <code class="code">x</code>,
   with the same properties as for <code class="code">hash</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALhd">hd</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Return the first element of the given list.
</div>
</td></tr>
<tr><td><a href="List.html#VALhd">hd</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Return the first element of the given list.
</div>
</td></tr>
<tr><td><a href="Marshal.html#VALheader_size">header_size</a> [<a href="Marshal.html">Marshal</a>]</td>
<td><div class="info">
The bytes representing a marshaled value are composed of
   a fixed-size header and a variable-sized data part,
   whose size can be determined from the header.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALhypot">hypot</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">hypot x y</code> returns <code class="code">sqrt(x *. x + y *. y)</code>, that is, the length
  of the hypotenuse of a right-angled triangle with sides of length
  <code class="code">x</code> and <code class="code">y</code>, or, equivalently, the distance of the point <code class="code">(x,y)</code>
  to origin.
</div>
</td></tr>
<tr><td align="left"><br>I</td></tr>
<tr><td><a href="Complex.html#VALi">i</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
The complex number <code class="code">i</code>.
</div>
</td></tr>
<tr><td><a href="Thread.html#VALid">id</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
Return the identifier of the given thread.
</div>
</td></tr>
<tr><td><a href="Oo.html#VALid">id</a> [<a href="Oo.html">Oo</a>]</td>
<td><div class="info">
Return an integer identifying this object, unique for
    the current execution of the program.
</div>
</td></tr>
<tr><td><a href="Printf.html#VALifprintf">ifprintf</a> [<a href="Printf.html">Printf</a>]</td>
<td><div class="info">
Same as <a href="Printf.html#VALfprintf"><code class="code"><span class="constructor">Printf</span>.fprintf</code></a>, but does not print anything.
</div>
</td></tr>
<tr><td><a href="Format.html#VALifprintf">ifprintf</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Same as <code class="code">fprintf</code> above, but does not print anything.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALignore">ignore</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Discard the value of its argument and return <code class="code">()</code>.
</div>
</td></tr>
<tr><td><a href="Printf.html#VALikfprintf">ikfprintf</a> [<a href="Printf.html">Printf</a>]</td>
<td><div class="info">
Same as <code class="code">kfprintf</code> above, but does not print anything.
</div>
</td></tr>
<tr><td><a href="Format.html#VALikfprintf">ikfprintf</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Same as <code class="code">kfprintf</code> above, but does not print anything.
</div>
</td></tr>
<tr><td><a href="Pervasives.LargeFile.html#VALin_channel_length">in_channel_length</a> [<a href="Pervasives.LargeFile.html">Pervasives.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALin_channel_length">in_channel_length</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the size (number of characters) of the regular file
    on which the given channel is opened.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALin_channel_of_descr">in_channel_of_descr</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Create an input channel reading from the given descriptor.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALin_channel_of_descr">in_channel_of_descr</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Create an input channel reading from the given descriptor.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALincr">incr</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Increment the integer contained in the given reference.
</div>
</td></tr>
<tr><td><a href="Num.html#VALincr_num">incr_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
<code class="code">incr r</code> is <code class="code">r:=!r+1</code>, where <code class="code">r</code> is a reference to a number.
</div>
</td></tr>
<tr><td><a href="String.html#VALindex">index</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.index s c</code> returns the index of the first
   occurrence of character <code class="code">c</code> in string <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALindex">index</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.index s c</code> returns the index of the first
   occurrence of character <code class="code">c</code> in string <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALindex">index</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">index s c</code> returns the index of the first occurrence of byte <code class="code">c</code>
    in <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALindex">index</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">index s c</code> returns the index of the first occurrence of byte <code class="code">c</code>
    in <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="String.html#VALindex_from">index_from</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.index_from s i c</code> returns the index of the
   first occurrence of character <code class="code">c</code> in string <code class="code">s</code> after position <code class="code">i</code>.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALindex_from">index_from</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.index_from s i c</code> returns the index of the
   first occurrence of character <code class="code">c</code> in string <code class="code">s</code> after position <code class="code">i</code>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALindex_from">index_from</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">index_from s i c</code> returns the index of the first occurrence of
    byte <code class="code">c</code> in <code class="code">s</code> after position <code class="code">i</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALindex_from">index_from</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">index_from s i c</code> returns the index of the first occurrence of
    byte <code class="code">c</code> in <code class="code">s</code> after position <code class="code">i</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALinet6_addr_any">inet6_addr_any</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
A special IPv6 address, for use only with <code class="code">bind</code>, representing
   all the Internet addresses that the host machine possesses.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALinet6_addr_any">inet6_addr_any</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
A special IPv6 address, for use only with <code class="code">bind</code>, representing
   all the Internet addresses that the host machine possesses.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALinet6_addr_loopback">inet6_addr_loopback</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
A special IPv6 address representing the host machine (<code class="code">::1</code>).
</div>
</td></tr>
<tr><td><a href="Unix.html#VALinet6_addr_loopback">inet6_addr_loopback</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
A special IPv6 address representing the host machine (<code class="code">::1</code>).
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALinet_addr_any">inet_addr_any</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
A special IPv4 address, for use only with <code class="code">bind</code>, representing
   all the Internet addresses that the host machine possesses.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALinet_addr_any">inet_addr_any</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
A special IPv4 address, for use only with <code class="code">bind</code>, representing
   all the Internet addresses that the host machine possesses.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALinet_addr_loopback">inet_addr_loopback</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
A special IPv4 address representing the host machine (<code class="code">127.0.0.1</code>).
</div>
</td></tr>
<tr><td><a href="Unix.html#VALinet_addr_loopback">inet_addr_loopback</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
A special IPv4 address representing the host machine (<code class="code">127.0.0.1</code>).
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALinet_addr_of_string">inet_addr_of_string</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Conversion from the printable representation of an Internet
    address to its internal representation.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALinet_addr_of_string">inet_addr_of_string</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Conversion from the printable representation of an Internet
    address to its internal representation.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALinfinity">infinity</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Positive infinity.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALinfix_tag">infix_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALinherits">inherits</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="String.html#VALinit">init</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.init n f</code> returns a string of length <code class="code">n</code>, with character
    <code class="code">i</code> initialized to the result of <code class="code">f i</code> (called in increasing
    index order).
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALinit">init</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code">init n f</code> returns a string of length <code class="code">n</code>,
    with character <code class="code">i</code> initialized to the result of <code class="code">f i</code>.
</div>
</td></tr>
<tr><td><a href="Random.html#VALinit">init</a> [<a href="Random.html">Random</a>]</td>
<td><div class="info">
Initialize the generator, using the argument as a seed.
</div>
</td></tr>
<tr><td><a href="Dynlink.html#VALinit">init</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALinit">init</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">init n f</code> returns a fresh byte sequence of length <code class="code">n</code>,
    with character <code class="code">i</code> initialized to the result of <code class="code">f i</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALinit">init</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Bytes</span>.init n f</code> returns a fresh byte sequence of length <code class="code">n</code>, with
    character <code class="code">i</code> initialized to the result of <code class="code">f i</code> (in increasing
    index order).
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALinit">init</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.init n f</code> returns a fresh array of length <code class="code">n</code>,
   with element number <code class="code">i</code> initialized to the result of <code class="code">f i</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALinit">init</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.init n f</code> returns a fresh array of length <code class="code">n</code>,
   with element number <code class="code">i</code> initialized to the result of <code class="code">f i</code>.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALinit_class">init_class</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalMod.html#VALinit_mod">init_mod</a> [<a href="CamlinternalMod.html">CamlinternalMod</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALinitgroups">initgroups</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">initgroups user group</code> initializes the group access list by
      reading the group database /etc/group and using all groups of
      which <code class="code">user</code> is a member.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALinitgroups">initgroups</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">initgroups user group</code> initializes the group access list by
      reading the group database /etc/group and using all groups of
      which <code class="code">user</code> is a member.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALinput">input</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">input ic buf pos len</code> reads up to <code class="code">len</code> characters from
   the given channel <code class="code">ic</code>, storing them in byte sequence <code class="code">buf</code>, starting at
   character number <code class="code">pos</code>.
</div>
</td></tr>
<tr><td><a href="Digest.html#VALinput">input</a> [<a href="Digest.html">Digest</a>]</td>
<td><div class="info">
Read a digest from the given input channel.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALinput_binary_int">input_binary_int</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Read an integer encoded in binary format (4 bytes, big-endian)
   from the given input channel.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALinput_byte">input_byte</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Same as <a href="Pervasives.html#VALinput_char"><code class="code">input_char</code></a>, but return the 8-bit integer representing
   the character.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALinput_char">input_char</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Read one character from the given input channel.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALinput_line">input_line</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Read characters from the given input channel, until a
   newline character is encountered.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALinput_value">input_value</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Read the representation of a structured value, as produced
   by <a href="Pervasives.html#VALoutput_value"><code class="code">output_value</code></a>, and return the corresponding value.
</div>
</td></tr>
<tr><td><a href="Random.State.html#VALint">int</a> [<a href="Random.State.html">Random.State</a>]</td>
<td></td></tr>
<tr><td><a href="Random.html#VALint">int</a> [<a href="Random.html">Random</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Random</span>.int bound</code> returns a random integer between 0 (inclusive)
     and <code class="code">bound</code> (exclusive).
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALint">int</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALint16_signed">int16_signed</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALint16_unsigned">int16_unsigned</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.
</div>
</td></tr>
<tr><td><a href="Random.State.html#VALint32">int32</a> [<a href="Random.State.html">Random.State</a>]</td>
<td></td></tr>
<tr><td><a href="Random.html#VALint32">int32</a> [<a href="Random.html">Random</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Random</span>.int32 bound</code> returns a random integer between 0 (inclusive)
     and <code class="code">bound</code> (exclusive).
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALint32">int32</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALint32_of_big_int">int32_of_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Convert a big integer to a 32-bit integer.
</div>
</td></tr>
<tr><td><a href="Random.State.html#VALint64">int64</a> [<a href="Random.State.html">Random.State</a>]</td>
<td></td></tr>
<tr><td><a href="Random.html#VALint64">int64</a> [<a href="Random.html">Random</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Random</span>.int64 bound</code> returns a random integer between 0 (inclusive)
     and <code class="code">bound</code> (exclusive).
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALint64">int64</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALint64_of_big_int">int64_of_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Convert a big integer to a 64-bit integer.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALint8_signed">int8_signed</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALint8_unsigned">int8_unsigned</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALint_of_big_int">int_of_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Convert a big integer to a small integer (type <code class="code">int</code>).
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALint_of_char">int_of_char</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the ASCII code of the argument.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALint_of_float">int_of_float</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Truncate the given floating-point number to an integer.
</div>
</td></tr>
<tr><td><a href="Num.html#VALint_of_num">int_of_num</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALint_of_string">int_of_string</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Convert the given string to an integer.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALint_tag">int_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Num.html#VALinteger_num">integer_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
<code class="code">integer_num n</code> returns the integer closest to <code class="code">n</code>.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALinter">inter</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
Set intersection.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALinter">inter</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="Sys.html#VALinteractive">interactive</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
This reference is initially set to <code class="code"><span class="keyword">false</span></code> in standalone
   programs and to <code class="code"><span class="keyword">true</span></code> if the code is being executed under
   the interactive toplevel system <code class="code">ocaml</code>.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALinv">inv</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Multiplicative inverse (<code class="code">1/z</code>).
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALinvalid_arg">invalid_arg</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Raise exception <code class="code"><span class="constructor">Invalid_argument</span></code> with the given string.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALis_block">is_block</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Sys.html#VALis_directory">is_directory</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Returns <code class="code"><span class="keyword">true</span></code> if the given name refers to a directory,
    <code class="code"><span class="keyword">false</span></code> if it refers to another kind of file.
</div>
</td></tr>
<tr><td><a href="Stack.html#VALis_empty">is_empty</a> [<a href="Stack.html">Stack</a>]</td>
<td><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if the given stack is empty, <code class="code"><span class="keyword">false</span></code> otherwise.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALis_empty">is_empty</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
Test whether a set is empty or not.
</div>
</td></tr>
<tr><td><a href="Queue.html#VALis_empty">is_empty</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if the given queue is empty, <code class="code"><span class="keyword">false</span></code> otherwise.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALis_empty">is_empty</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALis_empty">is_empty</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALis_empty">is_empty</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
Test whether a map is empty or not.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALis_implicit">is_implicit</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if the file name is relative and does not start
   with an explicit reference to the current directory (<code class="code">./</code> or
   <code class="code">../</code> in Unix), <code class="code"><span class="keyword">false</span></code> if it starts with an explicit reference
   to the root directory or the current directory.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALis_in_char_set">is_in_char_set</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="Obj.html#VALis_int">is_int</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Big_int.html#VALis_int_big_int">is_int_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Test whether the given big integer is small enough to
           be representable as a small integer (type <code class="code">int</code>)
           without loss of precision.
</div>
</td></tr>
<tr><td><a href="Num.html#VALis_integer_num">is_integer_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Test if a number is an integer
</div>
</td></tr>
<tr><td><a href="Dynlink.html#VALis_native">is_native</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
<code class="code"><span class="keyword">true</span></code> if the program is native,
    <code class="code"><span class="keyword">false</span></code> if the program is bytecode.
</div>
</td></tr>
<tr><td><a href="Printexc.Slot.html#VALis_raise">is_raise</a> [<a href="Printexc.Slot.html">Printexc.Slot</a>]</td>
<td><div class="info">
<code class="code">is_raise slot</code> is <code class="code"><span class="keyword">true</span></code> when <code class="code">slot</code> refers to a raising
      point in the code, and <code class="code"><span class="keyword">false</span></code> when it comes from a simple
      function call.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALis_relative">is_relative</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if the file name is relative to the current
   directory, <code class="code"><span class="keyword">false</span></code> if it is absolute (i.e.
</div>
</td></tr>
<tr><td><a href="Lazy.html#VALis_val">is_val</a> [<a href="Lazy.html">Lazy</a>]</td>
<td><div class="info">
<code class="code">is_val x</code> returns <code class="code"><span class="keyword">true</span></code> if <code class="code">x</code> has already been forced and
    did not raise an exception.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALisatty">isatty</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if the given file descriptor refers to a terminal or
   console window, <code class="code"><span class="keyword">false</span></code> otherwise.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALisatty">isatty</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if the given file descriptor refers to a terminal or
   console window, <code class="code"><span class="keyword">false</span></code> otherwise.
</div>
</td></tr>
<tr><td><a href="Weak.S.html#VALiter">iter</a> [<a href="Weak.S.html">Weak.S</a>]</td>
<td><div class="info">
<code class="code">iter f t</code> calls <code class="code">f</code> on each element of <code class="code">t</code>, in some unspecified
        order.
</div>
</td></tr>
<tr><td><a href="String.html#VALiter">iter</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.iter f s</code> applies function <code class="code">f</code> in turn to all
   the characters of <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="Stream.html#VALiter">iter</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Stream</span>.iter f s</code> scans the whole stream s, applying function <code class="code">f</code>
   in turn to each stream element encountered.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALiter">iter</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.iter f s</code> applies function <code class="code">f</code> in turn to all
   the characters of <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="Stack.html#VALiter">iter</a> [<a href="Stack.html">Stack</a>]</td>
<td><div class="info">
<code class="code">iter f s</code> applies <code class="code">f</code> in turn to all elements of <code class="code">s</code>,
   from the element at the top of the stack to the element at the
   bottom of the stack.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALiter">iter</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">iter f s</code> applies <code class="code">f</code> in turn to all elements of <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="Queue.html#VALiter">iter</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
<code class="code">iter f q</code> applies <code class="code">f</code> in turn to all elements of <code class="code">q</code>,
   from the least recently entered to the most recently entered.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALiter">iter</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALiter">iter</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALiter">iter</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALiter">iter</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALiter">iter</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALiter">iter</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">iter f m</code> applies <code class="code">f</code> to all bindings in map <code class="code">m</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALiter">iter</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.iter f [a1; ...; an]</code> applies function <code class="code">f</code> in turn to
   <code class="code">a1; ...; an</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALiter">iter</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.iter f [a1; ...; an]</code> applies function <code class="code">f</code> in turn to
   <code class="code">a1; ...; an</code>.
</div>
</td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALiter">iter</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALiter">iter</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALiter">iter</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Hashtbl</span>.iter f tbl</code> applies <code class="code">f</code> to all bindings in table <code class="code">tbl</code>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALiter">iter</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">iter f s</code> applies function <code class="code">f</code> in turn to all the bytes of <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALiter">iter</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">iter f s</code> applies function <code class="code">f</code> in turn to all the bytes of <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALiter">iter</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.iter f a</code> applies function <code class="code">f</code> in turn to all
   the elements of <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALiter">iter</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.iter f a</code> applies function <code class="code">f</code> in turn to all
   the elements of <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALiter2">iter2</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.iter2 f [a1; ...; an] [b1; ...; bn]</code> calls in turn
   <code class="code">f a1 b1; ...; f an bn</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALiter2">iter2</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.iter2 f [a1; ...; an] [b1; ...; bn]</code> calls in turn
   <code class="code">f a1 b1; ...; f an bn</code>.
</div>
</td></tr>
<tr><td><a href="String.html#VALiteri">iteri</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
Same as <a href="String.html#VALiter"><code class="code"><span class="constructor">String</span>.iter</code></a>, but the
   function is applied to the index of the element as first argument
   (counting from 0), and the character itself as second argument.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALiteri">iteri</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
Same as <a href="String.html#VALiter"><code class="code"><span class="constructor">String</span>.iter</code></a>, but the
   function is applied to the index of the element as first argument
   (counting from 0), and the character itself as second argument.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALiteri">iteri</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALiter"><code class="code"><span class="constructor">List</span>.iter</code></a>, but the function is applied to the index of
   the element as first argument (counting from 0), and the element
   itself as second argument.
</div>
</td></tr>
<tr><td><a href="List.html#VALiteri">iteri</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALiter"><code class="code"><span class="constructor">List</span>.iter</code></a>, but the function is applied to the index of
   the element as first argument (counting from 0), and the element
   itself as second argument.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALiteri">iteri</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
Same as <a href="Bytes.html#VALiter"><code class="code"><span class="constructor">Bytes</span>.iter</code></a>, but the function is applied to the index of
    the byte as first argument and the byte itself as second
    argument.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALiteri">iteri</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Same as <a href="Bytes.html#VALiter"><code class="code"><span class="constructor">Bytes</span>.iter</code></a>, but the function is applied to the index of
    the byte as first argument and the byte itself as second
    argument.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALiteri">iteri</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
Same as <a href="ArrayLabels.html#VALiter"><code class="code"><span class="constructor">ArrayLabels</span>.iter</code></a>, but the
   function is applied to the index of the element as first argument,
   and the element itself as second argument.
</div>
</td></tr>
<tr><td><a href="Array.html#VALiteri">iteri</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
Same as <a href="Array.html#VALiter"><code class="code"><span class="constructor">Array</span>.iter</code></a>, but the
   function is applied to the index of the element as first argument,
   and the element itself as second argument.
</div>
</td></tr>
<tr><td align="left"><br>J</td></tr>
<tr><td><a href="Thread.html#VALjoin">join</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
<code class="code">join th</code> suspends the execution of the calling thread
   until the thread <code class="code">th</code> has terminated.
</div>
</td></tr>
<tr><td><a href="Stream.html#VALjunk">junk</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
Remove the first element of the stream, possibly unfreezing
   it before.
</div>
</td></tr>
<tr><td align="left"><br>K</td></tr>
<tr><td><a href="Printf.html#VALkbprintf">kbprintf</a> [<a href="Printf.html">Printf</a>]</td>
<td><div class="info">
Same as <code class="code">bprintf</code>, but instead of returning immediately,
   passes the buffer to its first argument at the end of printing.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALkey_pressed">key_pressed</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if a keypress is available; that is, if <code class="code">read_key</code>
   would not block.
</div>
</td></tr>
<tr><td><a href="Printf.html#VALkfprintf">kfprintf</a> [<a href="Printf.html">Printf</a>]</td>
<td><div class="info">
Same as <code class="code">fprintf</code>, but instead of returning immediately,
   passes the out channel to its first argument at the end of printing.
</div>
</td></tr>
<tr><td><a href="Format.html#VALkfprintf">kfprintf</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Same as <code class="code">fprintf</code> above, but instead of returning immediately,
   passes the formatter to its first argument at the end of printing.
</div>
</td></tr>
<tr><td><a href="Scanf.html#VALkfscanf">kfscanf</a> [<a href="Scanf.html">Scanf</a>]</td>
<td><div class="info">
Same as <a href="Scanf.html#VALkscanf"><code class="code"><span class="constructor">Scanf</span>.kscanf</code></a>, but reads from the given regular input channel.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALkill">kill</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">kill pid <span class="keyword">sig</span></code> sends signal number <code class="code"><span class="keyword">sig</span></code> to the process
   with id <code class="code">pid</code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALkill">kill</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">kill pid <span class="keyword">sig</span></code> sends signal number <code class="code"><span class="keyword">sig</span></code> to the process
   with id <code class="code">pid</code>.
</div>
</td></tr>
<tr><td><a href="Thread.html#VALkill">kill</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
Terminate prematurely the thread whose handle is given.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALkind">kind</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Return the kind of the given big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALkind">kind</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Return the kind of the given big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array1.html#VALkind">kind</a> [<a href="Bigarray.Array1.html">Bigarray.Array1</a>]</td>
<td><div class="info">
Return the kind of the given big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALkind">kind</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
Return the kind of the given big array.
</div>
</td></tr>
<tr><td><a href="Printf.html#VALkprintf">kprintf</a> [<a href="Printf.html">Printf</a>]</td>
<td><div class="info">
A deprecated synonym for <code class="code">ksprintf</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALkprintf">kprintf</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Scanf.html#VALkscanf">kscanf</a> [<a href="Scanf.html">Scanf</a>]</td>
<td><div class="info">
Same as <a href="Scanf.html#VALbscanf"><code class="code"><span class="constructor">Scanf</span>.bscanf</code></a>, but takes an additional function argument
    <code class="code">ef</code> that is called in case of error: if the scanning process or
    some conversion fails, the scanning function aborts and calls the
    error handling function <code class="code">ef</code> with the formatted input channel and the
    exception that aborted the scanning process as arguments.
</div>
</td></tr>
<tr><td><a href="Printf.html#VALksprintf">ksprintf</a> [<a href="Printf.html">Printf</a>]</td>
<td><div class="info">
Same as <code class="code">sprintf</code> above, but instead of returning the string,
   passes it to the first argument.
</div>
</td></tr>
<tr><td><a href="Format.html#VALksprintf">ksprintf</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Same as <code class="code">sprintf</code> above, but instead of returning the string,
   passes it to the first argument.
</div>
</td></tr>
<tr><td><a href="Scanf.html#VALksscanf">ksscanf</a> [<a href="Scanf.html">Scanf</a>]</td>
<td><div class="info">
Same as <a href="Scanf.html#VALkscanf"><code class="code"><span class="constructor">Scanf</span>.kscanf</code></a> but reads from the given string.
</div>
</td></tr>
<tr><td align="left"><br>L</td></tr>
<tr><td><a href="Str.html#VALlast_chars">last_chars</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">last_chars s n</code> returns the last <code class="code">n</code> characters of <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALlayout">layout</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Return the layout of the given big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALlayout">layout</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Return the layout of the given big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array1.html#VALlayout">layout</a> [<a href="Bigarray.Array1.html">Bigarray.Array1</a>]</td>
<td><div class="info">
Return the layout of the given big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALlayout">layout</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
Return the layout of the given big array.
</div>
</td></tr>
<tr><td><a href="Lazy.html#VALlazy_from_fun">lazy_from_fun</a> [<a href="Lazy.html">Lazy</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Lazy.html#VALlazy_from_val">lazy_from_val</a> [<a href="Lazy.html">Lazy</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Lazy.html#VALlazy_is_val">lazy_is_val</a> [<a href="Lazy.html">Lazy</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Obj.html#VALlazy_tag">lazy_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALldexp">ldexp</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">ldexp x n</code> returns <code class="code">x *. 2 ** n</code>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALle_big_int">le_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td></td></tr>
<tr><td><a href="Num.html#VALle_num">le_num</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Weak.html#VALlength">length</a> [<a href="Weak.html">Weak</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Weak</span>.length ar</code> returns the length (number of elements) of
   <code class="code">ar</code>.
</div>
</td></tr>
<tr><td><a href="String.html#VALlength">length</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
Return the length (number of characters) of the given string.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALlength">length</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
Return the length (number of characters) of the given string.
</div>
</td></tr>
<tr><td><a href="Stack.html#VALlength">length</a> [<a href="Stack.html">Stack</a>]</td>
<td><div class="info">
Return the number of elements in a stack.
</div>
</td></tr>
<tr><td><a href="Queue.html#VALlength">length</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
Return the number of elements in a queue.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALlength">length</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALlength">length</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALlength">length</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="ListLabels.html#VALlength">length</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Return the length (number of elements) of the given list.
</div>
</td></tr>
<tr><td><a href="List.html#VALlength">length</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Return the length (number of elements) of the given list.
</div>
</td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALlength">length</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALlength">length</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALlength">length</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Hashtbl</span>.length tbl</code> returns the number of bindings in <code class="code">tbl</code>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALlength">length</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
Return the length (number of bytes) of the argument.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALlength">length</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Return the length (number of bytes) of the argument.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALlength">length</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
Return the number of characters currently contained in the buffer.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALlength">length</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
Return the length (number of elements) of the given array.
</div>
</td></tr>
<tr><td><a href="Array.html#VALlength">length</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
Return the length (number of elements) of the given array.
</div>
</td></tr>
<tr><td><a href="Lexing.html#VALlexeme">lexeme</a> [<a href="Lexing.html">Lexing</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Lexing</span>.lexeme lexbuf</code> returns the string matched by
           the regular expression.
</div>
</td></tr>
<tr><td><a href="Lexing.html#VALlexeme_char">lexeme_char</a> [<a href="Lexing.html">Lexing</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Lexing</span>.lexeme_char lexbuf i</code> returns character number <code class="code">i</code> in
   the matched string.
</div>
</td></tr>
<tr><td><a href="Lexing.html#VALlexeme_end">lexeme_end</a> [<a href="Lexing.html">Lexing</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Lexing</span>.lexeme_end lexbuf</code> returns the offset in the input stream
   of the character following the last character of the matched
   string.
</div>
</td></tr>
<tr><td><a href="Lexing.html#VALlexeme_end_p">lexeme_end_p</a> [<a href="Lexing.html">Lexing</a>]</td>
<td><div class="info">
Like <code class="code">lexeme_end</code>, but return a complete <code class="code">position</code> instead
    of an offset.
</div>
</td></tr>
<tr><td><a href="Lexing.html#VALlexeme_start">lexeme_start</a> [<a href="Lexing.html">Lexing</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Lexing</span>.lexeme_start lexbuf</code> returns the offset in the
   input stream of the first character of the matched string.
</div>
</td></tr>
<tr><td><a href="Lexing.html#VALlexeme_start_p">lexeme_start_p</a> [<a href="Lexing.html">Lexing</a>]</td>
<td><div class="info">
Like <code class="code">lexeme_start</code>, but return a complete <code class="code">position</code> instead
    of an offset.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALlineto">lineto</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Draw a line with endpoints the current point and the given point,
   and move the current point to the given point.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALlink">link</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">link source dest</code> creates a hard link named <code class="code">dest</code> to the file
   named <code class="code">source</code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALlink">link</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">link source dest</code> creates a hard link named <code class="code">dest</code> to the file
   named <code class="code">source</code>.
</div>
</td></tr>
<tr><td><a href="Sort.html#VALlist">list</a> [<a href="Sort.html">Sort</a>]</td>
<td><div class="info">
Sort a list in increasing order according to an ordering predicate.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALlisten">listen</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Set up a socket for receiving connection requests.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALlisten">listen</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Set up a socket for receiving connection requests.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALlnot">lnot</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Bitwise logical negation.
</div>
</td></tr>
<tr><td><a href="Dynlink.html#VALloadfile">loadfile</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
In bytecode: load the given bytecode object file (<code class="code">.cmo</code> file) or
    bytecode library file (<code class="code">.cma</code> file), and link it with the running
    program.
</div>
</td></tr>
<tr><td><a href="Dynlink.html#VALloadfile_private">loadfile_private</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
Same as <code class="code">loadfile</code>, except that the compilation units just loaded
    are hidden (cannot be referenced) from other modules dynamically
    loaded afterwards.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALlocaltime">localtime</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Convert a time in seconds, as returned by <a href="UnixLabels.html#VALtime"><code class="code"><span class="constructor">UnixLabels</span>.time</code></a>, into a date
   and a time.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALlocaltime">localtime</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Convert a time in seconds, as returned by <a href="Unix.html#VALtime"><code class="code"><span class="constructor">Unix</span>.time</code></a>, into a date and
   a time.
</div>
</td></tr>
<tr><td><a href="Printexc.Slot.html#VALlocation">location</a> [<a href="Printexc.Slot.html">Printexc.Slot</a>]</td>
<td><div class="info">
<code class="code">location slot</code> returns the location information of the slot,
      if available, and <code class="code"><span class="constructor">None</span></code> otherwise.
</div>
</td></tr>
<tr><td><a href="Mutex.html#VALlock">lock</a> [<a href="Mutex.html">Mutex</a>]</td>
<td><div class="info">
Lock the given mutex.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALlockf">lockf</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">lockf fd cmd size</code> puts a lock on a region of the file opened
   as <code class="code">fd</code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALlockf">lockf</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">lockf fd cmd size</code> puts a lock on a region of the file opened
   as <code class="code">fd</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALlog">log</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Natural logarithm.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALlog">log</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Natural logarithm (in base <code class="code">e</code>).
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALlog10">log10</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Base 10 logarithm.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALlog1p">log1p</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">log1p x</code> computes <code class="code">log(1.0 +. x)</code> (natural logarithm),
    giving numerically-accurate results even if <code class="code">x</code> is close to <code class="code">0.0</code>.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALlogand">logand</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Bitwise logical and.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALlogand">logand</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Bitwise logical and.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALlogand">logand</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Bitwise logical and.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALlognot">lognot</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Bitwise logical negation
</div>
</td></tr>
<tr><td><a href="Int64.html#VALlognot">lognot</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Bitwise logical negation
</div>
</td></tr>
<tr><td><a href="Int32.html#VALlognot">lognot</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Bitwise logical negation
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALlogor">logor</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Bitwise logical or.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALlogor">logor</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Bitwise logical or.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALlogor">logor</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Bitwise logical or.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALlogxor">logxor</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Bitwise logical exclusive or.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALlogxor">logxor</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Bitwise logical exclusive or.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALlogxor">logxor</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Bitwise logical exclusive or.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALlookup_tables">lookup_tables</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Graphics.html#VALloop_at_exit">loop_at_exit</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Loop before exiting the program, the list given as argument is the
    list of handlers and the events on which these handlers are called.
</div>
</td></tr>
<tr><td><a href="String.html#VALlowercase">lowercase</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
Return a copy of the argument, with all uppercase letters
   translated to lowercase, including accented letters of the ISO
   Latin-1 (8859-1) character set.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALlowercase">lowercase</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
Return a copy of the argument, with all uppercase letters
   translated to lowercase, including accented letters of the ISO
   Latin-1 (8859-1) character set.
</div>
</td></tr>
<tr><td><a href="Char.html#VALlowercase">lowercase</a> [<a href="Char.html">Char</a>]</td>
<td><div class="info">
Convert the given character to its equivalent lowercase character.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALlowercase">lowercase</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
Return a copy of the argument, with all uppercase letters
    translated to lowercase, including accented letters of the ISO
    Latin-1 (8859-1) character set.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALlowercase">lowercase</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Return a copy of the argument, with all uppercase letters
    translated to lowercase, including accented letters of the ISO
    Latin-1 (8859-1) character set.
</div>
</td></tr>
<tr><td><a href="UnixLabels.LargeFile.html#VALlseek">lseek</a> [<a href="UnixLabels.LargeFile.html">UnixLabels.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALlseek">lseek</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Set the current position for a file descriptor, and return the resulting
    offset (from the beginning of the file).
</div>
</td></tr>
<tr><td><a href="Unix.LargeFile.html#VALlseek">lseek</a> [<a href="Unix.LargeFile.html">Unix.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="Unix.html#VALlseek">lseek</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Set the current position for a file descriptor, and return the resulting
    offset (from the beginning of the file).
</div>
</td></tr>
<tr><td><a href="UnixLabels.LargeFile.html#VALlstat">lstat</a> [<a href="UnixLabels.LargeFile.html">UnixLabels.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALlstat">lstat</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="UnixLabels.html#VALstat"><code class="code"><span class="constructor">UnixLabels</span>.stat</code></a>, but in case the file is a symbolic link,
   return the information for the link itself.
</div>
</td></tr>
<tr><td><a href="Unix.LargeFile.html#VALlstat">lstat</a> [<a href="Unix.LargeFile.html">Unix.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="Unix.html#VALlstat">lstat</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALstat"><code class="code"><span class="constructor">Unix</span>.stat</code></a>, but in case the file is a symbolic link,
   return the information for the link itself.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALlt_big_int">lt_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td></td></tr>
<tr><td><a href="Num.html#VALlt_num">lt_num</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td align="left"><br>M</td></tr>
<tr><td><a href="Graphics.html#VALmagenta">magenta</a> [<a href="Graphics.html">Graphics</a>]</td>
<td></td></tr>
<tr><td><a href="Obj.html#VALmagic">magic</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Gc.html#VALmajor">major</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
Do a minor collection and finish the current major collection cycle.
</div>
</td></tr>
<tr><td><a href="Gc.html#VALmajor_slice">major_slice</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
Do a minor collection and a slice of major collection.
</div>
</td></tr>
<tr><td><a href="String.html#VALmake">make</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.make n c</code> returns a fresh string of length <code class="code">n</code>,
   filled with the character <code class="code">c</code>.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALmake">make</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.make n c</code> returns a fresh string of length <code class="code">n</code>,
   filled with the character <code class="code">c</code>.
</div>
</td></tr>
<tr><td><a href="Random.State.html#VALmake">make</a> [<a href="Random.State.html">Random.State</a>]</td>
<td><div class="info">
Create a new state and initialize it with the given seed.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALmake">make</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">make n c</code> returns a new byte sequence of length <code class="code">n</code>, filled with
    the byte <code class="code">c</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALmake">make</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">make n c</code> returns a new byte sequence of length <code class="code">n</code>, filled with
    the byte <code class="code">c</code>.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALmake">make</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.make n x</code> returns a fresh array of length <code class="code">n</code>,
   initialized with <code class="code">x</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALmake">make</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.make n x</code> returns a fresh array of length <code class="code">n</code>,
   initialized with <code class="code">x</code>.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALmake_class">make_class</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALmake_class_store">make_class_store</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Array.html#VALmake_float">make_float</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.make_float n</code> returns a fresh float array of length <code class="code">n</code>,
    with uninitialized data.
</div>
</td></tr>
<tr><td><a href="Format.html#VALmake_formatter">make_formatter</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">make_formatter out flush</code> returns a new formatter that writes according
  to the output function <code class="code">out</code>, and the flushing function <code class="code">flush</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALmake_image">make_image</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Convert the given color matrix to an image.
</div>
</td></tr>
<tr><td><a href="Genlex.html#VALmake_lexer">make_lexer</a> [<a href="Genlex.html">Genlex</a>]</td>
<td><div class="info">
Construct the lexer function.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALmake_matrix">make_matrix</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.make_matrix dimx dimy e</code> returns a two-dimensional array
   (an array of arrays) with first dimension <code class="code">dimx</code> and
   second dimension <code class="code">dimy</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALmake_matrix">make_matrix</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.make_matrix dimx dimy e</code> returns a two-dimensional array
   (an array of arrays) with first dimension <code class="code">dimx</code> and
   second dimension <code class="code">dimy</code>.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALmake_printf">make_printf</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="Random.State.html#VALmake_self_init">make_self_init</a> [<a href="Random.State.html">Random.State</a>]</td>
<td><div class="info">
Create a new state and initialize it with a system-dependent
      low-entropy seed.
</div>
</td></tr>
<tr><td><a href="String.html#VALmap">map</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.map f s</code> applies function <code class="code">f</code> in turn to all the
    characters of <code class="code">s</code> (in increasing index order) and stores the
    results in a new string that is returned.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALmap">map</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.map f s</code> applies function <code class="code">f</code> in turn to all
   the characters of <code class="code">s</code> and stores the results in a new string that
   is returned.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALmap">map</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALmap">map</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">map f m</code> returns a map with same domain as <code class="code">m</code>, where the
       associated value <code class="code">a</code> of all bindings of <code class="code">m</code> has been
       replaced by the result of the application of <code class="code">f</code> to <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALmap">map</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.map f [a1; ...; an]</code> applies function <code class="code">f</code> to <code class="code">a1, ..., an</code>,
   and builds the list <code class="code">[f a1; ...; f an]</code>
   with the results returned by <code class="code">f</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALmap">map</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.map f [a1; ...; an]</code> applies function <code class="code">f</code> to <code class="code">a1, ..., an</code>,
   and builds the list <code class="code">[f a1; ...; f an]</code>
   with the results returned by <code class="code">f</code>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALmap">map</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">map f s</code> applies function <code class="code">f</code> in turn to all the bytes of <code class="code">s</code> and
    stores the resulting bytes in a new sequence that is returned as
    the result.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALmap">map</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">map f s</code> applies function <code class="code">f</code> in turn to all the bytes of <code class="code">s</code>
    (in increasing index order) and stores the resulting bytes in
    a new sequence that is returned as the result.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALmap">map</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.map f a</code> applies function <code class="code">f</code> to all the elements of <code class="code">a</code>,
   and builds an array with the results returned by <code class="code">f</code>:
   <code class="code">[| f a.(0); f a.(1); ...; f a.(<span class="constructor">Array</span>.length a - 1) |]</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALmap">map</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.map f a</code> applies function <code class="code">f</code> to all the elements of <code class="code">a</code>,
   and builds an array with the results returned by <code class="code">f</code>:
   <code class="code">[| f a.(0); f a.(1); ...; f a.(<span class="constructor">Array</span>.length a - 1) |]</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALmap2">map2</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.map2 f [a1; ...; an] [b1; ...; bn]</code> is
   <code class="code">[f a1 b1; ...; f an bn]</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALmap2">map2</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.map2 f [a1; ...; an] [b1; ...; bn]</code> is
   <code class="code">[f a1 b1; ...; f an bn]</code>.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALmap_file">map_file</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Memory mapping of a file as a three-dimensional big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALmap_file">map_file</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Memory mapping of a file as a two-dimensional big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array1.html#VALmap_file">map_file</a> [<a href="Bigarray.Array1.html">Bigarray.Array1</a>]</td>
<td><div class="info">
Memory mapping of a file as a one-dimensional big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALmap_file">map_file</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
Memory mapping of a file as a big array.
</div>
</td></tr>
<tr><td><a href="String.html#VALmapi">mapi</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.mapi f s</code> calls <code class="code">f</code> with each character of <code class="code">s</code> and its
    index (in increasing index order) and stores the results in a new
    string that is returned.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALmapi">mapi</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.mapi f s</code> calls <code class="code">f</code> with each character of <code class="code">s</code> and its
    index (in increasing index order) and stores the results in a new
    string that is returned.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALmapi">mapi</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALmapi">mapi</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
Same as <a href="Map.S.html#VALmap"><code class="code"><span class="constructor">Map</span>.<span class="constructor">S</span>.map</code></a>, but the function receives as arguments both the
       key and the associated value for each binding of the map.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALmapi">mapi</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALmap"><code class="code"><span class="constructor">List</span>.map</code></a>, but the function is applied to the index of
   the element as first argument (counting from 0), and the element
   itself as second argument.
</div>
</td></tr>
<tr><td><a href="List.html#VALmapi">mapi</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALmap"><code class="code"><span class="constructor">List</span>.map</code></a>, but the function is applied to the index of
   the element as first argument (counting from 0), and the element
   itself as second argument.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALmapi">mapi</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">mapi f s</code> calls <code class="code">f</code> with each character of <code class="code">s</code> and its
    index (in increasing index order) and stores the resulting bytes
    in a new sequence that is returned as the result.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALmapi">mapi</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">mapi f s</code> calls <code class="code">f</code> with each character of <code class="code">s</code> and its
    index (in increasing index order) and stores the resulting bytes
    in a new sequence that is returned as the result.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALmapi">mapi</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
Same as <a href="ArrayLabels.html#VALmap"><code class="code"><span class="constructor">ArrayLabels</span>.map</code></a>, but the
   function is applied to the index of the element as first argument,
   and the element itself as second argument.
</div>
</td></tr>
<tr><td><a href="Array.html#VALmapi">mapi</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
Same as <a href="Array.html#VALmap"><code class="code"><span class="constructor">Array</span>.map</code></a>, but the
   function is applied to the index of the element as first argument,
   and the element itself as second argument.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALmarshal">marshal</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Str.html#VALmatch_beginning">match_beginning</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">match_beginning()</code> returns the position of the first character
   of the substring that was matched by the last call to a matching
   or searching function (see <a href="Str.html#VALmatched_string"><code class="code"><span class="constructor">Str</span>.matched_string</code></a> for details).
</div>
</td></tr>
<tr><td><a href="Str.html#VALmatch_end">match_end</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">match_end()</code> returns the position of the character following the
   last character of the substring that was matched by the last call
   to a matching or searching function (see <a href="Str.html#VALmatched_string"><code class="code"><span class="constructor">Str</span>.matched_string</code></a> for
   details).
</div>
</td></tr>
<tr><td><a href="Str.html#VALmatched_group">matched_group</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">matched_group n s</code> returns the substring of <code class="code">s</code> that was matched
   by the <code class="code">n</code>th group <code class="code">\(...\)</code> of the regular expression that was
   matched by the last call to a matching or searching function (see
   <a href="Str.html#VALmatched_string"><code class="code"><span class="constructor">Str</span>.matched_string</code></a> for details).
</div>
</td></tr>
<tr><td><a href="Str.html#VALmatched_string">matched_string</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">matched_string s</code> returns the substring of <code class="code">s</code> that was matched
   by the last call to one of the following matching or searching
   functions: <a href="Str.html#VALstring_match"><code class="code"><span class="constructor">Str</span>.string_match</code></a>, <a href="Str.html#VALsearch_forward"><code class="code"><span class="constructor">Str</span>.search_forward</code></a>, <a href="Str.html#VALsearch_backward"><code class="code"><span class="constructor">Str</span>.search_backward</code></a>, <a href="Str.html#VALstring_partial_match"><code class="code"><span class="constructor">Str</span>.string_partial_match</code></a>, <a href="Str.html#VALglobal_substitute"><code class="code"><span class="constructor">Str</span>.global_substitute</code></a>, <a href="Str.html#VALsubstitute_first"><code class="code"><span class="constructor">Str</span>.substitute_first</code></a>
   provided that none of the following functions was called inbetween: <a href="Str.html#VALglobal_replace"><code class="code"><span class="constructor">Str</span>.global_replace</code></a>, <a href="Str.html#VALreplace_first"><code class="code"><span class="constructor">Str</span>.replace_first</code></a>, <a href="Str.html#VALsplit"><code class="code"><span class="constructor">Str</span>.split</code></a>, <a href="Str.html#VALbounded_split"><code class="code"><span class="constructor">Str</span>.bounded_split</code></a>, <a href="Str.html#VALsplit_delim"><code class="code"><span class="constructor">Str</span>.split_delim</code></a>, <a href="Str.html#VALbounded_split_delim"><code class="code"><span class="constructor">Str</span>.bounded_split_delim</code></a>, <a href="Str.html#VALfull_split"><code class="code"><span class="constructor">Str</span>.full_split</code></a>, <a href="Str.html#VALbounded_full_split"><code class="code"><span class="constructor">Str</span>.bounded_full_split</code></a>
   Note: in the case of <code class="code">global_substitute</code> and <code class="code">substitute_first</code>,
   a call to <code class="code">matched_string</code> is only valid within the <code class="code">subst</code> argument,
   not after <code class="code">global_substitute</code> or <code class="code">substitute_first</code> returns.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALmax">max</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the greater of the two arguments.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALmax_array_length">max_array_length</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Maximum length of a normal array.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALmax_big_int">max_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Return the greater of its two arguments.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALmax_binding">max_binding</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALmax_binding">max_binding</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
Same as <a href="Map.S.html#VALmin_binding"><code class="code"><span class="constructor">Map</span>.<span class="constructor">S</span>.min_binding</code></a>, but returns the largest binding
        of the given map.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALmax_elt">max_elt</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
Same as <a href="Set.S.html#VALmin_elt"><code class="code"><span class="constructor">Set</span>.<span class="constructor">S</span>.min_elt</code></a>, but returns the largest element of the
       given set.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALmax_elt">max_elt</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALmax_float">max_float</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
The largest positive finite value of type <code class="code">float</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALmax_int">max_int</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
The greatest representable integer.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALmax_int">max_int</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
The greatest representable native integer,
   either 2<sup class="superscript">31</sup> - 1 on a 32-bit platform,
   or 2<sup class="superscript">63</sup> - 1 on a 64-bit platform.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALmax_int">max_int</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
The greatest representable 64-bit integer, 2<sup class="superscript">63</sup> - 1.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALmax_int">max_int</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
The greatest representable 32-bit integer, 2<sup class="superscript">31</sup> - 1.
</div>
</td></tr>
<tr><td><a href="Num.html#VALmax_num">max_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Return the greater of the two arguments.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALmax_string_length">max_string_length</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Maximum length of strings and byte sequences.
</div>
</td></tr>
<tr><td><a href="Weak.S.html#VALmem">mem</a> [<a href="Weak.S.html">Weak.S</a>]</td>
<td><div class="info">
<code class="code">mem t x</code> returns <code class="code"><span class="keyword">true</span></code> if there is at least one instance
        of <code class="code">x</code> in <code class="code">t</code>, false otherwise.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALmem">mem</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">mem x s</code> tests whether <code class="code">x</code> belongs to the set <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALmem">mem</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALmem">mem</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALmem">mem</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALmem">mem</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALmem">mem</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALmem">mem</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">mem x m</code> returns <code class="code"><span class="keyword">true</span></code> if <code class="code">m</code> contains a binding for <code class="code">x</code>,
       and <code class="code"><span class="keyword">false</span></code> otherwise.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALmem">mem</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code">mem a l</code> is true if and only if <code class="code">a</code> is equal
   to an element of <code class="code">l</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALmem">mem</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code">mem a l</code> is true if and only if <code class="code">a</code> is equal
   to an element of <code class="code">l</code>.
</div>
</td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALmem">mem</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALmem">mem</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALmem">mem</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Hashtbl</span>.mem tbl x</code> checks if <code class="code">x</code> is bound in <code class="code">tbl</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALmem_assoc">mem_assoc</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Same as <a href="ListLabels.html#VALassoc"><code class="code"><span class="constructor">ListLabels</span>.assoc</code></a>, but simply return true if a binding exists,
   and false if no bindings exist for the given key.
</div>
</td></tr>
<tr><td><a href="List.html#VALmem_assoc">mem_assoc</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALassoc"><code class="code"><span class="constructor">List</span>.assoc</code></a>, but simply return true if a binding exists,
   and false if no bindings exist for the given key.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALmem_assq">mem_assq</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Same as <a href="ListLabels.html#VALmem_assoc"><code class="code"><span class="constructor">ListLabels</span>.mem_assoc</code></a>, but uses physical equality instead of
   structural equality to compare keys.
</div>
</td></tr>
<tr><td><a href="List.html#VALmem_assq">mem_assq</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALmem_assoc"><code class="code"><span class="constructor">List</span>.mem_assoc</code></a>, but uses physical equality instead of
   structural equality to compare keys.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALmemq">memq</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Same as <a href="ListLabels.html#VALmem"><code class="code"><span class="constructor">ListLabels</span>.mem</code></a>, but uses physical equality instead of structural
   equality to compare list elements.
</div>
</td></tr>
<tr><td><a href="List.html#VALmemq">memq</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALmem"><code class="code"><span class="constructor">List</span>.mem</code></a>, but uses physical equality instead of structural
   equality to compare list elements.
</div>
</td></tr>
<tr><td><a href="Weak.S.html#VALmerge">merge</a> [<a href="Weak.S.html">Weak.S</a>]</td>
<td><div class="info">
<code class="code">merge t x</code> returns an instance of <code class="code">x</code> found in <code class="code">t</code> if any,
        or else adds <code class="code">x</code> to <code class="code">t</code> and return <code class="code">x</code>.
</div>
</td></tr>
<tr><td><a href="Sort.html#VALmerge">merge</a> [<a href="Sort.html">Sort</a>]</td>
<td><div class="info">
Merge two lists according to the given predicate.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALmerge">merge</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALmerge">merge</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">merge f m1 m2</code> computes a map whose keys is a subset of keys of <code class="code">m1</code>
        and of <code class="code">m2</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALmerge">merge</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Merge two lists:
    Assuming that <code class="code">l1</code> and <code class="code">l2</code> are sorted according to the
    comparison function <code class="code">cmp</code>, <code class="code">merge cmp l1 l2</code> will return a
    sorted list containting all the elements of <code class="code">l1</code> and <code class="code">l2</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALmerge">merge</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Merge two lists:
    Assuming that <code class="code">l1</code> and <code class="code">l2</code> are sorted according to the
    comparison function <code class="code">cmp</code>, <code class="code">merge cmp l1 l2</code> will return a
    sorted list containting all the elements of <code class="code">l1</code> and <code class="code">l2</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALmin">min</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the smaller of the two arguments.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALmin_big_int">min_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Return the smaller of its two arguments.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALmin_binding">min_binding</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALmin_binding">min_binding</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
Return the smallest binding of the given map
       (with respect to the <code class="code"><span class="constructor">Ord</span>.compare</code> ordering), or raise
       <code class="code"><span class="constructor">Not_found</span></code> if the map is empty.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALmin_elt">min_elt</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
Return the smallest element of the given set
       (with respect to the <code class="code"><span class="constructor">Ord</span>.compare</code> ordering), or raise
       <code class="code"><span class="constructor">Not_found</span></code> if the set is empty.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALmin_elt">min_elt</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALmin_float">min_float</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
The smallest positive, non-zero, non-denormalized value of type <code class="code">float</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALmin_int">min_int</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
The smallest representable integer.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALmin_int">min_int</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
The greatest representable native integer,
   either -2<sup class="superscript">31</sup> on a 32-bit platform,
   or -2<sup class="superscript">63</sup> on a 64-bit platform.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALmin_int">min_int</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
The smallest representable 64-bit integer, -2<sup class="superscript">63</sup>.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALmin_int">min_int</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
The smallest representable 32-bit integer, -2<sup class="superscript">31</sup>.
</div>
</td></tr>
<tr><td><a href="Num.html#VALmin_num">min_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Return the smaller of the two arguments.
</div>
</td></tr>
<tr><td><a href="Gc.html#VALminor">minor</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
Trigger a minor collection.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALminus_big_int">minus_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Unary negation.
</div>
</td></tr>
<tr><td><a href="Num.html#VALminus_num">minus_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Unary negation.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALminus_one">minus_one</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
The native integer -1.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALminus_one">minus_one</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
The 64-bit integer -1.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALminus_one">minus_one</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
The 32-bit integer -1.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALmkdir">mkdir</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Create a directory with the given permissions.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALmkdir">mkdir</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Create a directory with the given permissions (see <a href="Unix.html#VALumask"><code class="code"><span class="constructor">Unix</span>.umask</code></a>).
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALmkfifo">mkfifo</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Create a named pipe with the given permissions.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALmkfifo">mkfifo</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Create a named pipe with the given permissions (see <a href="Unix.html#VALumask"><code class="code"><span class="constructor">Unix</span>.umask</code></a>).
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALmktime">mktime</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Convert a date and time, specified by the <code class="code">tm</code> argument, into
   a time in seconds, as returned by <a href="UnixLabels.html#VALtime"><code class="code"><span class="constructor">UnixLabels</span>.time</code></a>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALmktime">mktime</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Convert a date and time, specified by the <code class="code">tm</code> argument, into
   a time in seconds, as returned by <a href="Unix.html#VALtime"><code class="code"><span class="constructor">Unix</span>.time</code></a>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALmod_big_int">mod_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Euclidean modulus of two big integers.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALmod_float">mod_float</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">mod_float a b</code> returns the remainder of <code class="code">a</code> with respect to
   <code class="code">b</code>.
</div>
</td></tr>
<tr><td><a href="Num.html#VALmod_num">mod_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Euclidean division: remainder.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALmodf">modf</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">modf f</code> returns the pair of the fractional and integral
   part of <code class="code">f</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALmouse_pos">mouse_pos</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Return the position of the mouse cursor, relative to the
   graphics window.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALmoveto">moveto</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Position the current point.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALmul">mul</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Multiplication.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALmul">mul</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Multiplication.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALmul">mul</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Multiplication.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALmul">mul</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Multiplication
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALmult_big_int">mult_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Multiplication of two big integers.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALmult_int_big_int">mult_int_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Multiplication of a big integer by a small integer
</div>
</td></tr>
<tr><td><a href="Num.html#VALmult_num">mult_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Multiplication
</div>
</td></tr>
<tr><td align="left"><br>N</td></tr>
<tr><td><a href="Scanf.Scanning.html#VALname_of_input">name_of_input</a> [<a href="Scanf.Scanning.html">Scanf.Scanning</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Scanning</span>.name_of_input ic</code> returns the name of the character source
    for the formatted input channel <code class="code">ic</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALnan">nan</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
A special floating-point value denoting the result of an
   undefined operation such as <code class="code">0.0 /. 0.0</code>.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALnarrow">narrow</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Num.html#VALnat_of_num">nat_of_num</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Random.State.html#VALnativeint">nativeint</a> [<a href="Random.State.html">Random.State</a>]</td>
<td></td></tr>
<tr><td><a href="Random.html#VALnativeint">nativeint</a> [<a href="Random.html">Random</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Random</span>.nativeint bound</code> returns a random integer between 0 (inclusive)
     and <code class="code">bound</code> (exclusive).
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALnativeint">nativeint</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALnativeint_of_big_int">nativeint_of_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Convert a big integer to a native integer.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALneg">neg</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Unary negation.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALneg">neg</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Unary negation.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALneg">neg</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Unary negation.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALneg">neg</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Unary negation.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALneg_infinity">neg_infinity</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Negative infinity.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALnew_block">new_block</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Event.html#VALnew_channel">new_channel</a> [<a href="Event.html">Event</a>]</td>
<td><div class="info">
Return a new channel.
</div>
</td></tr>
<tr><td><a href="Lexing.html#VALnew_line">new_line</a> [<a href="Lexing.html">Lexing</a>]</td>
<td><div class="info">
Update the <code class="code">lex_curr_p</code> field of the lexbuf to reflect the start
    of a new line.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALnew_method">new_method</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALnew_methods_variables">new_methods_variables</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALnew_variable">new_variable</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Stream.html#VALnext">next</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
Return the first element of the stream and remove it from the
   stream.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALnice">nice</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Change the process priority.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALnice">nice</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Change the process priority.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALno_scan_tag">no_scan_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Complex.html#VALnorm">norm</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Norm: given <code class="code">x + i.y</code>, returns <code class="code">sqrt(x^2 + y^2)</code>.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALnorm2">norm2</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Norm squared: given <code class="code">x + i.y</code>, returns <code class="code">x^2 + y^2</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALnot">not</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
The boolean negation.
</div>
</td></tr>
<tr><td><a href="Stream.html#VALnpeek">npeek</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
<code class="code">npeek n</code> returns the list of the <code class="code">n</code> first elements of
   the stream, or all its remaining elements if less than <code class="code">n</code>
   elements are available.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALnth">nth</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Return the <code class="code">n</code>-th element of the given list.
</div>
</td></tr>
<tr><td><a href="List.html#VALnth">nth</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Return the <code class="code">n</code>-th element of the given list.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALnth">nth</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
get the n-th character of the buffer.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALnth_dim">nth_dim</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Genarray</span>.nth_dim a n</code> returns the <code class="code">n</code>-th dimension of the
     big array <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALnum_digits_big_int">num_digits_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Return the number of machine words used to store the
           given big integer.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALnum_dims">num_dims</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
Return the number of dimensions of the given big array.
</div>
</td></tr>
<tr><td><a href="Num.html#VALnum_of_big_int">num_of_big_int</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Num.html#VALnum_of_int">num_of_int</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Num.html#VALnum_of_nat">num_of_nat</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Num.html#VALnum_of_ratio">num_of_ratio</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Num.html#VALnum_of_string">num_of_string</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Convert a string to a number.
</div>
</td></tr>
<tr><td align="left"><br>O</td></tr>
<tr><td><a href="Obj.html#VALobj">obj</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Obj.html#VALobject_tag">object_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Sys.html#VALocaml_version">ocaml_version</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
<code class="code">ocaml_version</code> is the version of OCaml.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALof_array">of_array</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Build a three-dimensional big array initialized from the
     given array of arrays of arrays.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALof_array">of_array</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Build a two-dimensional big array initialized from the
     given array of arrays.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array1.html#VALof_array">of_array</a> [<a href="Bigarray.Array1.html">Bigarray.Array1</a>]</td>
<td><div class="info">
Build a one-dimensional big array initialized from the
     given array.
</div>
</td></tr>
<tr><td><a href="Stream.html#VALof_bytes">of_bytes</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
Return the stream of the characters of the bytes parameter.
</div>
</td></tr>
<tr><td><a href="Stream.html#VALof_channel">of_channel</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
Return the stream of the characters read from the input channel.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALof_float">of_float</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Convert the given floating-point number to a native integer,
   discarding the fractional part (truncate towards 0).
</div>
</td></tr>
<tr><td><a href="Int64.html#VALof_float">of_float</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Convert the given floating-point number to a 64-bit integer,
   discarding the fractional part (truncate towards 0).
</div>
</td></tr>
<tr><td><a href="Int32.html#VALof_float">of_float</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Convert the given floating-point number to a 32-bit integer,
   discarding the fractional part (truncate towards 0).
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALof_int">of_int</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Convert the given integer (type <code class="code">int</code>) to a native integer
   (type <code class="code">nativeint</code>).
</div>
</td></tr>
<tr><td><a href="Int64.html#VALof_int">of_int</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Convert the given integer (type <code class="code">int</code>) to a 64-bit integer
    (type <code class="code">int64</code>).
</div>
</td></tr>
<tr><td><a href="Int32.html#VALof_int">of_int</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Convert the given integer (type <code class="code">int</code>) to a 32-bit integer
    (type <code class="code">int32</code>).
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALof_int32">of_int32</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Convert the given 32-bit integer (type <code class="code">int32</code>)
   to a native integer.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALof_int32">of_int32</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Convert the given 32-bit integer (type <code class="code">int32</code>)
   to a 64-bit integer (type <code class="code">int64</code>).
</div>
</td></tr>
<tr><td><a href="Stream.html#VALof_list">of_list</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
Return the stream holding the elements of the list in the same
   order.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALof_list">of_list</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">of_list l</code> creates a set from a list of elements.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALof_list">of_list</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="ArrayLabels.html#VALof_list">of_list</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.of_list l</code> returns a fresh array containing the elements
   of <code class="code">l</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALof_list">of_list</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.of_list l</code> returns a fresh array containing the elements
   of <code class="code">l</code>.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALof_nativeint">of_nativeint</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Convert the given native integer (type <code class="code">nativeint</code>)
   to a 64-bit integer (type <code class="code">int64</code>).
</div>
</td></tr>
<tr><td><a href="Stream.html#VALof_string">of_string</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
Return the stream of the characters of the string parameter.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALof_string">of_string</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Convert the given string to a native integer.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALof_string">of_string</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Convert the given string to a 64-bit integer.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALof_string">of_string</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Convert the given string to a 32-bit integer.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALof_string">of_string</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
Return a new byte sequence that contains the same bytes as the
    given string.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALof_string">of_string</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Return a new byte sequence that contains the same bytes as the
    given string.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALone">one</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
The native integer 1.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALone">one</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
The 64-bit integer 1.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALone">one</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
The 32-bit integer 1.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALone">one</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
The complex number <code class="code">1</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALopen_box">open_box</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">open_box d</code> opens a new pretty-printing box
   with offset <code class="code">d</code>.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALopen_box_of_string">open_box_of_string</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALopen_connection">open_connection</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Connect to a server at the given address.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALopen_connection">open_connection</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Connect to a server at the given address.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALopen_connection">open_connection</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="Graphics.html#VALopen_graph">open_graph</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Show the graphics window or switch the screen to graphic mode.
</div>
</td></tr>
<tr><td><a href="Format.html#VALopen_hbox">open_hbox</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">open_hbox ()</code> opens a new pretty-printing box.
</div>
</td></tr>
<tr><td><a href="Format.html#VALopen_hovbox">open_hovbox</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">open_hovbox d</code> opens a new pretty-printing box
   with offset <code class="code">d</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALopen_hvbox">open_hvbox</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">open_hvbox d</code> opens a new pretty-printing box
   with offset <code class="code">d</code>.
</div>
</td></tr>
<tr><td><a href="Scanf.Scanning.html#VALopen_in">open_in</a> [<a href="Scanf.Scanning.html">Scanf.Scanning</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Scanning</span>.open_in fname</code> returns a formatted input channel for bufferized
    reading in text mode from file <code class="code">fname</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALopen_in">open_in</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Open the named file for reading, and return a new input channel
   on that file, positionned at the beginning of the file.
</div>
</td></tr>
<tr><td><a href="Scanf.Scanning.html#VALopen_in_bin">open_in_bin</a> [<a href="Scanf.Scanning.html">Scanf.Scanning</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Scanning</span>.open_in_bin fname</code> returns a formatted input channel for
    bufferized reading in binary mode from file <code class="code">fname</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALopen_in_bin">open_in_bin</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Same as <a href="Pervasives.html#VALopen_in"><code class="code">open_in</code></a>, but the file is opened in binary mode,
   so that no translation takes place during reads.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALopen_in_gen">open_in_gen</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">open_in_gen mode perm filename</code> opens the named file for reading,
   as described above.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALopen_out">open_out</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Open the named file for writing, and return a new output channel
   on that file, positionned at the beginning of the file.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALopen_out_bin">open_out_bin</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Same as <a href="Pervasives.html#VALopen_out"><code class="code">open_out</code></a>, but the file is opened in binary mode,
   so that no translation takes place during writes.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALopen_out_gen">open_out_gen</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">open_out_gen mode perm filename</code> opens the named file for writing,
   as described above.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALopen_process">open_process</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="UnixLabels.html#VALopen_process_out"><code class="code"><span class="constructor">UnixLabels</span>.open_process_out</code></a>, but redirects both the standard
   input and standard output of the command to pipes connected to the two
   returned channels.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALopen_process">open_process</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALopen_process_out"><code class="code"><span class="constructor">Unix</span>.open_process_out</code></a>, but redirects both the standard input
   and standard output of the command to pipes connected to the two
   returned channels.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALopen_process">open_process</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALopen_process_full">open_process_full</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Similar to <a href="UnixLabels.html#VALopen_process"><code class="code"><span class="constructor">UnixLabels</span>.open_process</code></a>, but the second argument specifies
   the environment passed to the command.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALopen_process_full">open_process_full</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Similar to <a href="Unix.html#VALopen_process"><code class="code"><span class="constructor">Unix</span>.open_process</code></a>, but the second argument specifies
   the environment passed to the command.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALopen_process_in">open_process_in</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
High-level pipe and process management.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALopen_process_in">open_process_in</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
High-level pipe and process management.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALopen_process_in">open_process_in</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALopen_process_out">open_process_out</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="UnixLabels.html#VALopen_process_in"><code class="code"><span class="constructor">UnixLabels</span>.open_process_in</code></a>, but redirect the standard input of
   the command to a pipe.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALopen_process_out">open_process_out</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALopen_process_in"><code class="code"><span class="constructor">Unix</span>.open_process_in</code></a>, but redirect the standard input of
   the command to a pipe.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALopen_process_out">open_process_out</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="GraphicsX11.html#VALopen_subwindow">open_subwindow</a> [<a href="GraphicsX11.html">GraphicsX11</a>]</td>
<td><div class="info">
Create a sub-window of the current OCaml graphics window
   and return its identifier.
</div>
</td></tr>
<tr><td><a href="Format.html#VALopen_tag">open_tag</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">open_tag t</code> opens the tag named <code class="code">t</code>; the <code class="code">print_open_tag</code>
   function of the formatter is called with <code class="code">t</code> as argument;
   the tag marker <code class="code">mark_open_tag t</code> will be flushed into the output
   device of the formatter.
</div>
</td></tr>
<tr><td><a href="Format.html#VALopen_tbox">open_tbox</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Opens a tabulation box.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALopen_temp_file">open_temp_file</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
Same as <a href="Filename.html#VALtemp_file"><code class="code"><span class="constructor">Filename</span>.temp_file</code></a>, but returns both the name of a fresh
   temporary file, and an output channel opened (atomically) on
   this file.
</div>
</td></tr>
<tr><td><a href="Format.html#VALopen_vbox">open_vbox</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">open_vbox d</code> opens a new pretty-printing box
   with offset <code class="code">d</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALopendir">opendir</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Open a descriptor on a directory
</div>
</td></tr>
<tr><td><a href="Unix.html#VALopendir">opendir</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Open a descriptor on a directory
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALopenfile">openfile</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Open the named file with the given flags.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALopenfile">openfile</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Open the named file with the given flags.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALor_big_int">or_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Bitwise logical 'or'.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALos_type">os_type</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Operating system currently executing the OCaml program.
</div>
</td></tr>
<tr><td><a href="Pervasives.LargeFile.html#VALout_channel_length">out_channel_length</a> [<a href="Pervasives.LargeFile.html">Pervasives.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALout_channel_length">out_channel_length</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the size (number of characters) of the regular file
   on which the given channel is opened.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALout_channel_of_descr">out_channel_of_descr</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Create an output channel writing on the given descriptor.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALout_channel_of_descr">out_channel_of_descr</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Create an output channel writing on the given descriptor.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALout_of_heap_tag">out_of_heap_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALoutput">output</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">output oc buf pos len</code> writes <code class="code">len</code> characters from byte sequence <code class="code">buf</code>,
   starting at offset <code class="code">pos</code>, to the given output channel <code class="code">oc</code>.
</div>
</td></tr>
<tr><td><a href="Digest.html#VALoutput">output</a> [<a href="Digest.html">Digest</a>]</td>
<td><div class="info">
Write a digest on the given output channel.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALoutput_acc">output_acc</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALoutput_binary_int">output_binary_int</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Write one integer in binary format (4 bytes, big-endian)
   on the given output channel.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALoutput_buffer">output_buffer</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
<code class="code">output_buffer oc b</code> writes the current contents of buffer <code class="code">b</code>
   on the output channel <code class="code">oc</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALoutput_byte">output_byte</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Write one 8-bit integer (as the single character with that code)
   on the given output channel.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALoutput_bytes">output_bytes</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Write the byte sequence on the given output channel.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALoutput_char">output_char</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Write the character on the given output channel.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALoutput_string">output_string</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Write the string on the given output channel.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALoutput_substring">output_substring</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Same as <code class="code">output</code> but take a string as argument instead of
   a byte sequence.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALoutput_value">output_value</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Write the representation of a structured value of any type
   to a channel.
</div>
</td></tr>
<tr><td><a href="Format.html#VALover_max_boxes">over_max_boxes</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Tests if the maximum number of boxes allowed have already been opened.
</div>
</td></tr>
<tr><td align="left"><br>P</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALparam_format_of_ignored_format">param_format_of_ignored_format</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALparams">params</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Filename.html#VALparent_dir_name">parent_dir_name</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
The conventional name for the parent of the current directory
   (e.g.
</div>
</td></tr>
<tr><td><a href="Arg.html#VALparse">parse</a> [<a href="Arg.html">Arg</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Arg</span>.parse speclist anon_fun usage_msg</code> parses the command line.
</div>
</td></tr>
<tr><td><a href="Arg.html#VALparse_argv">parse_argv</a> [<a href="Arg.html">Arg</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Arg</span>.parse_argv ~current args speclist anon_fun usage_msg</code> parses
  the array <code class="code">args</code> as if it were the command line.
</div>
</td></tr>
<tr><td><a href="Arg.html#VALparse_argv_dynamic">parse_argv_dynamic</a> [<a href="Arg.html">Arg</a>]</td>
<td><div class="info">
Same as <a href="Arg.html#VALparse_argv"><code class="code"><span class="constructor">Arg</span>.parse_argv</code></a>, except that the <code class="code">speclist</code> argument is a
    reference and may be updated during the parsing.
</div>
</td></tr>
<tr><td><a href="Arg.html#VALparse_dynamic">parse_dynamic</a> [<a href="Arg.html">Arg</a>]</td>
<td><div class="info">
Same as <a href="Arg.html#VALparse"><code class="code"><span class="constructor">Arg</span>.parse</code></a>, except that the <code class="code">speclist</code> argument is a reference
    and may be updated during the parsing.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALpartition">partition</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">partition p s</code> returns a pair of sets <code class="code">(s1, s2)</code>, where
       <code class="code">s1</code> is the set of all the elements of <code class="code">s</code> that satisfy the
       predicate <code class="code">p</code>, and <code class="code">s2</code> is the set of all the elements of
       <code class="code">s</code> that do not satisfy <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALpartition">partition</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALpartition">partition</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALpartition">partition</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">partition p m</code> returns a pair of maps <code class="code">(m1, m2)</code>, where
        <code class="code">m1</code> contains all the bindings of <code class="code">s</code> that satisfy the
        predicate <code class="code">p</code>, and <code class="code">m2</code> is the map with all the bindings of
        <code class="code">s</code> that do not satisfy <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALpartition">partition</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code">partition p l</code> returns a pair of lists <code class="code">(l1, l2)</code>, where
   <code class="code">l1</code> is the list of all the elements of <code class="code">l</code> that
   satisfy the predicate <code class="code">p</code>, and <code class="code">l2</code> is the list of all the
   elements of <code class="code">l</code> that do not satisfy <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALpartition">partition</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code">partition p l</code> returns a pair of lists <code class="code">(l1, l2)</code>, where
   <code class="code">l1</code> is the list of all the elements of <code class="code">l</code> that
   satisfy the predicate <code class="code">p</code>, and <code class="code">l2</code> is the list of all the
   elements of <code class="code">l</code> that do not satisfy <code class="code">p</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALpause">pause</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Wait until a non-ignored, non-blocked signal is delivered.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALpause">pause</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Wait until a non-ignored, non-blocked signal is delivered.
</div>
</td></tr>
<tr><td><a href="Stream.html#VALpeek">peek</a> [<a href="Stream.html">Stream</a>]</td>
<td><div class="info">
Return <code class="code"><span class="constructor">Some</span></code> of "the first element" of the stream, or <code class="code"><span class="constructor">None</span></code> if
   the stream is empty.
</div>
</td></tr>
<tr><td><a href="Queue.html#VALpeek">peek</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
<code class="code">peek q</code> returns the first element in queue <code class="code">q</code>, without removing
   it from the queue, or raises <code class="code"><span class="constructor">Empty</span></code> if the queue is empty.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALpipe">pipe</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Create a pipe.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALpipe">pipe</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Create a pipe.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALpipe">pipe</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="Graphics.html#VALplot">plot</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Plot the given point with the current drawing color.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALplots">plots</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Plot the given points with the current drawing color.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALpoint_color">point_color</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Return the color of the given point in the backing store
   (see "Double buffering" below).
</div>
</td></tr>
<tr><td><a href="Complex.html#VALpolar">polar</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
<code class="code">polar norm arg</code> returns the complex having norm <code class="code">norm</code>
    and argument <code class="code">arg</code>.
</div>
</td></tr>
<tr><td><a href="Event.html#VALpoll">poll</a> [<a href="Event.html">Event</a>]</td>
<td><div class="info">
Non-blocking version of <a href="Event.html#VALsync"><code class="code"><span class="constructor">Event</span>.sync</code></a>: offer all the communication
   possibilities specified in the event to the outside world,
   and if one can take place immediately, perform it and return
   <code class="code"><span class="constructor">Some</span> r</code> where <code class="code">r</code> is the result value of that communication.
</div>
</td></tr>
<tr><td><a href="Stack.html#VALpop">pop</a> [<a href="Stack.html">Stack</a>]</td>
<td><div class="info">
<code class="code">pop s</code> removes and returns the topmost element in stack <code class="code">s</code>,
   or raises <code class="code"><span class="constructor">Empty</span></code> if the stack is empty.
</div>
</td></tr>
<tr><td><a href="Queue.html#VALpop">pop</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
<code class="code">pop</code> is a synonym for <code class="code">take</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.LargeFile.html#VALpos_in">pos_in</a> [<a href="Pervasives.LargeFile.html">Pervasives.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALpos_in">pos_in</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the current reading position for the given channel.
</div>
</td></tr>
<tr><td><a href="Pervasives.LargeFile.html#VALpos_out">pos_out</a> [<a href="Pervasives.LargeFile.html">Pervasives.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALpos_out">pos_out</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the current writing position for the given channel.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALpow">pow</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Power function.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALpower_big_int_positive_big_int">power_big_int_positive_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Exponentiation functions.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALpower_big_int_positive_int">power_big_int_positive_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td></td></tr>
<tr><td><a href="Big_int.html#VALpower_int_positive_big_int">power_int_positive_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td></td></tr>
<tr><td><a href="Big_int.html#VALpower_int_positive_int">power_int_positive_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td></td></tr>
<tr><td><a href="Num.html#VALpower_num">power_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Exponentiation
</div>
</td></tr>
<tr><td><a href="Format.html#VALpp_close_box">pp_close_box</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_close_tag">pp_close_tag</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_close_tbox">pp_close_tbox</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_force_newline">pp_force_newline</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_get_all_formatter_output_functions">pp_get_all_formatter_output_functions</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Format.html#VALpp_get_ellipsis_text">pp_get_ellipsis_text</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_get_formatter_out_functions">pp_get_formatter_out_functions</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
These functions are the basic ones: usual functions
   operating on the standard formatter are defined via partial
   evaluation of these primitives.
</div>
</td></tr>
<tr><td><a href="Format.html#VALpp_get_formatter_output_functions">pp_get_formatter_output_functions</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_get_formatter_tag_functions">pp_get_formatter_tag_functions</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_get_margin">pp_get_margin</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_get_mark_tags">pp_get_mark_tags</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_get_max_boxes">pp_get_max_boxes</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_get_max_indent">pp_get_max_indent</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_get_print_tags">pp_get_print_tags</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_open_box">pp_open_box</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_open_hbox">pp_open_hbox</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_open_hovbox">pp_open_hovbox</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_open_hvbox">pp_open_hvbox</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_open_tag">pp_open_tag</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_open_tbox">pp_open_tbox</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_open_vbox">pp_open_vbox</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_over_max_boxes">pp_over_max_boxes</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_as">pp_print_as</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_bool">pp_print_bool</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_break">pp_print_break</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_char">pp_print_char</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_cut">pp_print_cut</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_float">pp_print_float</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_flush">pp_print_flush</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_if_newline">pp_print_if_newline</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_int">pp_print_int</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_list">pp_print_list</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">pp_print_list ?pp_sep pp_v ppf l</code> prints the list <code class="code">l</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALpp_print_newline">pp_print_newline</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_space">pp_print_space</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_string">pp_print_string</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_tab">pp_print_tab</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_tbreak">pp_print_tbreak</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_print_text">pp_print_text</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">pp_print_text ppf s</code> prints <code class="code">s</code> with spaces and newlines
    respectively printed with <a href="Format.html#VALpp_print_space"><code class="code"><span class="constructor">Format</span>.pp_print_space</code></a> and
    <a href="Format.html#VALpp_force_newline"><code class="code"><span class="constructor">Format</span>.pp_force_newline</code></a>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALpp_set_all_formatter_output_functions">pp_set_all_formatter_output_functions</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Format.html#VALpp_set_ellipsis_text">pp_set_ellipsis_text</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_set_formatter_out_channel">pp_set_formatter_out_channel</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_set_formatter_out_functions">pp_set_formatter_out_functions</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_set_formatter_output_functions">pp_set_formatter_output_functions</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_set_formatter_tag_functions">pp_set_formatter_tag_functions</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_set_margin">pp_set_margin</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_set_mark_tags">pp_set_mark_tags</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_set_max_boxes">pp_set_max_boxes</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_set_max_indent">pp_set_max_indent</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_set_print_tags">pp_set_print_tags</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_set_tab">pp_set_tab</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALpp_set_tags">pp_set_tags</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALpred">pred</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">pred x</code> is <code class="code">x - 1</code>.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALpred">pred</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Predecessor.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALpred">pred</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Predecessor.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALpred">pred</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Predecessor.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALpred_big_int">pred_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Predecessor (subtract 1).
</div>
</td></tr>
<tr><td><a href="Num.html#VALpred_num">pred_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
<code class="code">pred n</code> is <code class="code">n-1</code>
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprerr_bytes">prerr_bytes</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print a byte sequence on standard error.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprerr_char">prerr_char</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print a character on standard error.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprerr_endline">prerr_endline</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print a string, followed by a newline character on standard
   error and flush standard error.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprerr_float">prerr_float</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print a floating-point number, in decimal, on standard error.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprerr_int">prerr_int</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print an integer, in decimal, on standard error.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprerr_newline">prerr_newline</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print a newline character on standard error, and flush
   standard error.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprerr_string">prerr_string</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print a string on standard error.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALprint">print</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Printexc</span>.print fn x</code> applies <code class="code">fn</code> to <code class="code">x</code> and returns the result.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_as">print_as</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">print_as len str</code> prints <code class="code">str</code> in the
   current box.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALprint_backtrace">print_backtrace</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Printexc</span>.print_backtrace oc</code> prints an exception backtrace
    on the output channel <code class="code">oc</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_bool">print_bool</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Prints a boolean in the current box.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_break">print_break</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Inserts a break hint in a pretty-printing box.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprint_bytes">print_bytes</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print a byte sequence on standard output.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprint_char">print_char</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print a character on standard output.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_char">print_char</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Prints a character in the current box.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_cut">print_cut</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">print_cut ()</code> is used to mark a good break position.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprint_endline">print_endline</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print a string, followed by a newline character, on
   standard output and flush standard output.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprint_float">print_float</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print a floating-point number, in decimal, on standard output.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_float">print_float</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Prints a floating point number in the current box.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_flush">print_flush</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Flushes the pretty printer: all opened boxes are closed,
   and all pending text is displayed.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_if_newline">print_if_newline</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Executes the next formatting command if the preceding line
   has just been split.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprint_int">print_int</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print an integer, in decimal, on standard output.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_int">print_int</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Prints an integer in the current box.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprint_newline">print_newline</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print a newline character on standard output, and flush
   standard output.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_newline">print_newline</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Equivalent to <code class="code">print_flush</code> followed by a new line.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALprint_raw_backtrace">print_raw_backtrace</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
Print a raw backtrace in the same format
    <code class="code"><span class="constructor">Printexc</span>.print_backtrace</code> uses.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_space">print_space</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">print_space ()</code> is used to separate items (typically to print
   a space between two words).
</div>
</td></tr>
<tr><td><a href="Gc.html#VALprint_stat">print_stat</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
Print the current values of the memory management counters (in
   human-readable form) into the channel argument.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALprint_string">print_string</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Print a string on standard output.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_string">print_string</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">print_string str</code> prints <code class="code">str</code> in the current box.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_tab">print_tab</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">print_tab ()</code> is equivalent to <code class="code">print_tbreak 0 0</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprint_tbreak">print_tbreak</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Break hint in a tabulation box.
</div>
</td></tr>
<tr><td><a href="Printf.html#VALprintf">printf</a> [<a href="Printf.html">Printf</a>]</td>
<td><div class="info">
Same as <a href="Printf.html#VALfprintf"><code class="code"><span class="constructor">Printf</span>.fprintf</code></a>, but output on <code class="code">stdout</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALprintf">printf</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Same as <code class="code">fprintf</code> above, but output on <code class="code">std_formatter</code>.
</div>
</td></tr>
<tr><td><a href="Dynlink.html#VALprohibit">prohibit</a> [<a href="Dynlink.html">Dynlink</a>]</td>
<td><div class="info">
<code class="code">prohibit units</code> prohibits dynamically-linked units from referencing
    the units named in list <code class="code">units</code>.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALpublic_method_label">public_method_label</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Stack.html#VALpush">push</a> [<a href="Stack.html">Stack</a>]</td>
<td><div class="info">
<code class="code">push x s</code> adds the element <code class="code">x</code> at the top of stack <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="Queue.html#VALpush">push</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
<code class="code">push</code> is a synonym for <code class="code">add</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALputenv">putenv</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Unix</span>.putenv name value</code> sets the value associated to a
   variable in the process environment.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALputenv">putenv</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Unix</span>.putenv name value</code> sets the value associated to a
   variable in the process environment.
</div>
</td></tr>
<tr><td align="left"><br>Q</td></tr>
<tr><td><a href="Gc.html#VALquick_stat">quick_stat</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
Same as <code class="code">stat</code> except that <code class="code">live_words</code>, <code class="code">live_blocks</code>, <code class="code">free_words</code>,
    <code class="code">free_blocks</code>, <code class="code">largest_free</code>, and <code class="code">fragments</code> are set to 0.
</div>
</td></tr>
<tr><td><a href="Num.html#VALquo_num">quo_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Euclidean division: quotient.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALquomod_big_int">quomod_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Euclidean division of two big integers.
</div>
</td></tr>
<tr><td><a href="Str.html#VALquote">quote</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Str</span>.quote s</code> returns a regexp string that matches exactly
   <code class="code">s</code> and nothing else.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALquote">quote</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
Return a quoted version of a file name, suitable for use as
    one argument in a command line, escaping all meta-characters.
</div>
</td></tr>
<tr><td align="left"><br>R</td></tr>
<tr><td><a href="Pervasives.html#VALraise">raise</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Raise the given exception value
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALraise_notrace">raise_notrace</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
A faster version <code class="code">raise</code> which does not record the backtrace.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALrandomize">randomize</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALrandomize">randomize</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
After a call to <code class="code"><span class="constructor">Hashtbl</span>.randomize()</code>, hash tables are created in
    randomized mode by default: <a href="Hashtbl.html#VALcreate"><code class="code"><span class="constructor">Hashtbl</span>.create</code></a> returns randomized
    hash tables, unless the <code class="code">~random:<span class="keyword">false</span></code> optional parameter is given.
</div>
</td></tr>
<tr><td><a href="Num.html#VALratio_of_num">ratio_of_num</a> [<a href="Num.html">Num</a>]</td>
<td></td></tr>
<tr><td><a href="Printexc.html#VALraw_backtrace_length">raw_backtrace_length</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code">raw_backtrace_length bckt</code> returns the number of slots in the
    backtrace <code class="code">bckt</code>.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALraw_backtrace_to_string">raw_backtrace_to_string</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
Return a string from a raw backtrace, in the same format
    <code class="code"><span class="constructor">Printexc</span>.get_backtrace</code> uses.
</div>
</td></tr>
<tr><td><a href="String.html#VALrcontains_from">rcontains_from</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.rcontains_from s stop c</code> tests if character <code class="code">c</code>
   appears in <code class="code">s</code> before position <code class="code">stop+1</code>.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALrcontains_from">rcontains_from</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.rcontains_from s stop c</code> tests if character <code class="code">c</code>
   appears in <code class="code">s</code> before position <code class="code">stop+1</code>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALrcontains_from">rcontains_from</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">rcontains_from s stop c</code> tests if byte <code class="code">c</code> appears in <code class="code">s</code> before
    position <code class="code">stop+1</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALrcontains_from">rcontains_from</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">rcontains_from s stop c</code> tests if byte <code class="code">c</code> appears in <code class="code">s</code> before
    position <code class="code">stop+1</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALread">read</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">read fd buff ofs len</code> reads <code class="code">len</code> bytes from descriptor <code class="code">fd</code>,
    storing them in byte sequence <code class="code">buff</code>, starting at position <code class="code">ofs</code> in
    <code class="code">buff</code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALread">read</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">read fd buff ofs len</code> reads <code class="code">len</code> bytes from descriptor <code class="code">fd</code>,
    storing them in byte sequence <code class="code">buff</code>, starting at position <code class="code">ofs</code> in
    <code class="code">buff</code>.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALread">read</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALread_float">read_float</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Flush standard output, then read one line from standard input
   and convert it to a floating-point number.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALread_int">read_int</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Flush standard output, then read one line from standard input
   and convert it to an integer.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALread_key">read_key</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Wait for a key to be pressed, and return the corresponding
   character.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALread_line">read_line</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Flush standard output, then read characters from standard input
   until a newline character is encountered.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALreaddir">readdir</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the next entry in a directory.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALreaddir">readdir</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the next entry in a directory.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALreaddir">readdir</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Return the names of all files present in the given directory.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALreadlink">readlink</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Read the contents of a link.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALreadlink">readlink</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Read the contents of a link.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALreally_input">really_input</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">really_input ic buf pos len</code> reads <code class="code">len</code> characters from channel <code class="code">ic</code>,
   storing them in byte sequence <code class="code">buf</code>, starting at character number <code class="code">pos</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALreally_input_string">really_input_string</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">really_input_string ic len</code> reads <code class="code">len</code> characters from channel <code class="code">ic</code>
   and returns them in a new string.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALrecast">recast</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="Event.html#VALreceive">receive</a> [<a href="Event.html">Event</a>]</td>
<td><div class="info">
<code class="code">receive ch</code> returns the event consisting in receiving a value
   from the channel <code class="code">ch</code>.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALrecord_backtrace">record_backtrace</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Printexc</span>.record_backtrace b</code> turns recording of exception backtraces
    on (if <code class="code">b = <span class="keyword">true</span></code>) or off (if <code class="code">b = <span class="keyword">false</span></code>).
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALrecv">recv</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Receive data from a connected socket.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALrecv">recv</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Receive data from a connected socket.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALrecv">recv</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALrecvfrom">recvfrom</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Receive data from an unconnected socket.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALrecvfrom">recvfrom</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Receive data from an unconnected socket.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALrecvfrom">recvfrom</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="Graphics.html#VALred">red</a> [<a href="Graphics.html">Graphics</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALref">ref</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return a fresh reference containing the given value.
</div>
</td></tr>
<tr><td><a href="Str.html#VALregexp">regexp</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
Compile a regular expression.
</div>
</td></tr>
<tr><td><a href="Str.html#VALregexp_case_fold">regexp_case_fold</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
Same as <code class="code">regexp</code>, but the compiled expression will match text
    in a case-insensitive way: uppercase and lowercase letters will
    be considered equivalent.
</div>
</td></tr>
<tr><td><a href="Str.html#VALregexp_string">regexp_string</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Str</span>.regexp_string s</code> returns a regular expression
   that matches exactly <code class="code">s</code> and nothing else.
</div>
</td></tr>
<tr><td><a href="Str.html#VALregexp_string_case_fold">regexp_string_case_fold</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Str</span>.regexp_string_case_fold</code> is similar to <a href="Str.html#VALregexp_string"><code class="code"><span class="constructor">Str</span>.regexp_string</code></a>,
   but the regexp matches in a case-insensitive way.
</div>
</td></tr>
<tr><td><a href="Callback.html#VALregister">register</a> [<a href="Callback.html">Callback</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Callback</span>.register n v</code> registers the value <code class="code">v</code> under
   the name <code class="code">n</code>.
</div>
</td></tr>
<tr><td><a href="Callback.html#VALregister_exception">register_exception</a> [<a href="Callback.html">Callback</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Callback</span>.register_exception n exn</code> registers the
   exception contained in the exception value <code class="code">exn</code>
   under the name <code class="code">n</code>.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALregister_printer">register_printer</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Printexc</span>.register_printer fn</code> registers <code class="code">fn</code> as an exception
    printer.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALrem">rem</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Integer remainder.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALrem">rem</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Integer remainder.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALrem">rem</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Integer remainder.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALremember_mode">remember_mode</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Set remember mode on or off.
</div>
</td></tr>
<tr><td><a href="Weak.S.html#VALremove">remove</a> [<a href="Weak.S.html">Weak.S</a>]</td>
<td><div class="info">
<code class="code">remove t x</code> removes from <code class="code">t</code> one instance of <code class="code">x</code>.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALremove">remove</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Remove the given file name from the file system.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALremove">remove</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">remove x s</code> returns a set containing all elements of <code class="code">s</code>,
       except <code class="code">x</code>.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALremove">remove</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALremove">remove</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALremove">remove</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALremove">remove</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALremove">remove</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALremove">remove</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">remove x m</code> returns a map containing the same bindings as
       <code class="code">m</code>, except for <code class="code">x</code> which is unbound in the returned map.
</div>
</td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALremove">remove</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALremove">remove</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALremove">remove</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Hashtbl</span>.remove tbl x</code> removes the current binding of <code class="code">x</code> in <code class="code">tbl</code>,
   restoring the previous binding if it exists.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALremove_assoc">remove_assoc</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code">remove_assoc a l</code> returns the list of
   pairs <code class="code">l</code> without the first pair with key <code class="code">a</code>, if any.
</div>
</td></tr>
<tr><td><a href="List.html#VALremove_assoc">remove_assoc</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code">remove_assoc a l</code> returns the list of
   pairs <code class="code">l</code> without the first pair with key <code class="code">a</code>, if any.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALremove_assq">remove_assq</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Same as <a href="ListLabels.html#VALremove_assoc"><code class="code"><span class="constructor">ListLabels</span>.remove_assoc</code></a>, but uses physical equality instead
   of structural equality to compare keys.
</div>
</td></tr>
<tr><td><a href="List.html#VALremove_assq">remove_assq</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALremove_assoc"><code class="code"><span class="constructor">List</span>.remove_assoc</code></a>, but uses physical equality instead
   of structural equality to compare keys.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALrename">rename</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">rename old <span class="keyword">new</span></code> changes the name of a file from <code class="code">old</code> to <code class="code"><span class="keyword">new</span></code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALrename">rename</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">rename old <span class="keyword">new</span></code> changes the name of a file from <code class="code">old</code> to <code class="code"><span class="keyword">new</span></code>.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALrename">rename</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Rename a file.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALreplace">replace</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALreplace">replace</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALreplace">replace</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALreplace">replace</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALreplace">replace</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALreplace">replace</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Hashtbl</span>.replace tbl x y</code> replaces the current binding of <code class="code">x</code>
   in <code class="code">tbl</code> by a binding of <code class="code">x</code> to <code class="code">y</code>.
</div>
</td></tr>
<tr><td><a href="Str.html#VALreplace_first">replace_first</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
Same as <a href="Str.html#VALglobal_replace"><code class="code"><span class="constructor">Str</span>.global_replace</code></a>, except that only the first substring
   matching the regular expression is replaced.
</div>
</td></tr>
<tr><td><a href="Str.html#VALreplace_matched">replace_matched</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">replace_matched repl s</code> returns the replacement text <code class="code">repl</code>
   in which <code class="code">\1</code>, <code class="code">\2</code>, etc.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALrepr">repr</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALreset">reset</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALreset">reset</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALreset">reset</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALreset">reset</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALreset">reset</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALreset">reset</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
Empty a hash table and shrink the size of the bucket table
    to its initial size.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALreset">reset</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
Empty the buffer and deallocate the internal byte sequence holding the
   buffer contents, replacing it with the initial internal byte sequence
   of length <code class="code">n</code> that was allocated by <a href="Buffer.html#VALcreate"><code class="code"><span class="constructor">Buffer</span>.create</code></a> <code class="code">n</code>.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALreshape">reshape</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
<code class="code">reshape b [|d1;...;dN|]</code> converts the big array <code class="code">b</code> to a
   <code class="code"><span class="constructor">N</span></code>-dimensional array of dimensions <code class="code">d1</code>...
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALreshape_1">reshape_1</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
Specialized version of <a href="Bigarray.html#VALreshape"><code class="code"><span class="constructor">Bigarray</span>.reshape</code></a> for reshaping to
   one-dimensional arrays.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALreshape_2">reshape_2</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
Specialized version of <a href="Bigarray.html#VALreshape"><code class="code"><span class="constructor">Bigarray</span>.reshape</code></a> for reshaping to
   two-dimensional arrays.
</div>
</td></tr>
<tr><td><a href="Bigarray.html#VALreshape_3">reshape_3</a> [<a href="Bigarray.html">Bigarray</a>]</td>
<td><div class="info">
Specialized version of <a href="Bigarray.html#VALreshape"><code class="code"><span class="constructor">Bigarray</span>.reshape</code></a> for reshaping to
   three-dimensional arrays.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALresize_window">resize_window</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Resize and erase the graphics window.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALrev">rev</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
List reversal.
</div>
</td></tr>
<tr><td><a href="List.html#VALrev">rev</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
List reversal.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALrev_append">rev_append</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.rev_append l1 l2</code> reverses <code class="code">l1</code> and concatenates it to <code class="code">l2</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALrev_append">rev_append</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.rev_append l1 l2</code> reverses <code class="code">l1</code> and concatenates it to <code class="code">l2</code>.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALrev_char_set">rev_char_set</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="ListLabels.html#VALrev_map">rev_map</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.rev_map f l</code> gives the same result as
   <a href="ListLabels.html#VALrev"><code class="code"><span class="constructor">ListLabels</span>.rev</code></a><code class="code"> (</code><a href="ListLabels.html#VALmap"><code class="code"><span class="constructor">ListLabels</span>.map</code></a><code class="code"> f l)</code>, but is tail-recursive and
   more efficient.
</div>
</td></tr>
<tr><td><a href="List.html#VALrev_map">rev_map</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.rev_map f l</code> gives the same result as
   <a href="List.html#VALrev"><code class="code"><span class="constructor">List</span>.rev</code></a><code class="code"> (</code><a href="List.html#VALmap"><code class="code"><span class="constructor">List</span>.map</code></a><code class="code"> f l)</code>, but is tail-recursive and
   more efficient.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALrev_map2">rev_map2</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.rev_map2 f l1 l2</code> gives the same result as
   <a href="ListLabels.html#VALrev"><code class="code"><span class="constructor">ListLabels</span>.rev</code></a><code class="code"> (</code><a href="ListLabels.html#VALmap2"><code class="code"><span class="constructor">ListLabels</span>.map2</code></a><code class="code"> f l1 l2)</code>, but is tail-recursive and
   more efficient.
</div>
</td></tr>
<tr><td><a href="List.html#VALrev_map2">rev_map2</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">List</span>.rev_map2 f l1 l2</code> gives the same result as
   <a href="List.html#VALrev"><code class="code"><span class="constructor">List</span>.rev</code></a><code class="code"> (</code><a href="List.html#VALmap2"><code class="code"><span class="constructor">List</span>.map2</code></a><code class="code"> f l1 l2)</code>, but is tail-recursive and
   more efficient.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALrewinddir">rewinddir</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Reposition the descriptor to the beginning of the directory
</div>
</td></tr>
<tr><td><a href="Unix.html#VALrewinddir">rewinddir</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Reposition the descriptor to the beginning of the directory
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALrgb">rgb</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">rgb r g b</code> returns the integer encoding the color with red
   component <code class="code">r</code>, green component <code class="code">g</code>, and blue component <code class="code">b</code>.
</div>
</td></tr>
<tr><td><a href="Parsing.html#VALrhs_end">rhs_end</a> [<a href="Parsing.html">Parsing</a>]</td>
<td><div class="info">
See <a href="Parsing.html#VALrhs_start"><code class="code"><span class="constructor">Parsing</span>.rhs_start</code></a>.
</div>
</td></tr>
<tr><td><a href="Parsing.html#VALrhs_end_pos">rhs_end_pos</a> [<a href="Parsing.html">Parsing</a>]</td>
<td><div class="info">
Same as <code class="code">rhs_end</code>, but return a <code class="code">position</code> instead of an offset.
</div>
</td></tr>
<tr><td><a href="Parsing.html#VALrhs_start">rhs_start</a> [<a href="Parsing.html">Parsing</a>]</td>
<td><div class="info">
Same as <a href="Parsing.html#VALsymbol_start"><code class="code"><span class="constructor">Parsing</span>.symbol_start</code></a> and <a href="Parsing.html#VALsymbol_end"><code class="code"><span class="constructor">Parsing</span>.symbol_end</code></a>, but
   return the offset of the string matching the <code class="code">n</code>th item on the
   right-hand side of the rule, where <code class="code">n</code> is the integer parameter
   to <code class="code">rhs_start</code> and <code class="code">rhs_end</code>.
</div>
</td></tr>
<tr><td><a href="Parsing.html#VALrhs_start_pos">rhs_start_pos</a> [<a href="Parsing.html">Parsing</a>]</td>
<td><div class="info">
Same as <code class="code">rhs_start</code>, but return a <code class="code">position</code> instead of an offset.
</div>
</td></tr>
<tr><td><a href="String.html#VALrindex">rindex</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.rindex s c</code> returns the index of the last
   occurrence of character <code class="code">c</code> in string <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALrindex">rindex</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.rindex s c</code> returns the index of the last
   occurrence of character <code class="code">c</code> in string <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALrindex">rindex</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">rindex s c</code> returns the index of the last occurrence of byte <code class="code">c</code>
    in <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALrindex">rindex</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">rindex s c</code> returns the index of the last occurrence of byte <code class="code">c</code>
    in <code class="code">s</code>.
</div>
</td></tr>
<tr><td><a href="String.html#VALrindex_from">rindex_from</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.rindex_from s i c</code> returns the index of the
   last occurrence of character <code class="code">c</code> in string <code class="code">s</code> before position <code class="code">i+1</code>.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALrindex_from">rindex_from</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.rindex_from s i c</code> returns the index of the
   last occurrence of character <code class="code">c</code> in string <code class="code">s</code> before position <code class="code">i+1</code>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALrindex_from">rindex_from</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">rindex_from s i c</code> returns the index of the last occurrence of
    byte <code class="code">c</code> in <code class="code">s</code> before position <code class="code">i+1</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALrindex_from">rindex_from</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">rindex_from s i c</code> returns the index of the last occurrence of
    byte <code class="code">c</code> in <code class="code">s</code> before position <code class="code">i+1</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALrlineto">rlineto</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Draw a line with endpoints the current point and the
   current point translated of the given vector,
   and move the current point to this point.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALrmdir">rmdir</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Remove an empty directory.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALrmdir">rmdir</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Remove an empty directory.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALrmoveto">rmoveto</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">rmoveto dx dy</code> translates the current point by the given vector.
</div>
</td></tr>
<tr><td><a href="Num.html#VALround_num">round_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
<code class="code">round_num n</code> returns the integer closest to <code class="code">n</code>.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALrun_initializers">run_initializers</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALrun_initializers_opt">run_initializers_opt</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td align="left"><br>S</td></tr>
<tr><td><a href="Scanf.html#VALscanf">scanf</a> [<a href="Scanf.html">Scanf</a>]</td>
<td><div class="info">
Same as <a href="Scanf.html#VALbscanf"><code class="code"><span class="constructor">Scanf</span>.bscanf</code></a>, but reads from the predefined formatted input
    channel <a href="Scanf.Scanning.html#VALstdin"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.stdin</code></a> that is connected to <code class="code"><span class="constructor">Pervasives</span>.stdin</code>.
</div>
</td></tr>
<tr><td><a href="Str.html#VALsearch_backward">search_backward</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">search_backward r s last</code> searches the string <code class="code">s</code> for a
  substring matching the regular expression <code class="code">r</code>.
</div>
</td></tr>
<tr><td><a href="Str.html#VALsearch_forward">search_forward</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">search_forward r s start</code> searches the string <code class="code">s</code> for a substring
   matching the regular expression <code class="code">r</code>.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALseeded_hash">seeded_hash</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALseeded_hash">seeded_hash</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
A variant of <a href="Hashtbl.html#VALhash"><code class="code"><span class="constructor">Hashtbl</span>.hash</code></a> that is further parameterized by
   an integer seed.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALseeded_hash_param">seeded_hash_param</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALseeded_hash_param">seeded_hash_param</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
A variant of <a href="Hashtbl.html#VALhash_param"><code class="code"><span class="constructor">Hashtbl</span>.hash_param</code></a> that is further parameterized by
   an integer seed.
</div>
</td></tr>
<tr><td><a href="Pervasives.LargeFile.html#VALseek_in">seek_in</a> [<a href="Pervasives.LargeFile.html">Pervasives.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALseek_in">seek_in</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">seek_in chan pos</code> sets the current reading position to <code class="code">pos</code>
   for channel <code class="code">chan</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.LargeFile.html#VALseek_out">seek_out</a> [<a href="Pervasives.LargeFile.html">Pervasives.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALseek_out">seek_out</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">seek_out chan pos</code> sets the current writing position to <code class="code">pos</code>
   for channel <code class="code">chan</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALselect">select</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Wait until some input/output operations become possible on
   some channels.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALselect">select</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Wait until some input/output operations become possible on
   some channels.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALselect">select</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="Thread.html#VALselect">select</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
Suspend the execution of the calling thead until input/output
   becomes possible on the given Unix file descriptors.
</div>
</td></tr>
<tr><td><a href="Event.html#VALselect">select</a> [<a href="Event.html">Event</a>]</td>
<td><div class="info">
'Synchronize' on an alternative of events.
</div>
</td></tr>
<tr><td><a href="Thread.html#VALself">self</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
Return the thread currently executing.
</div>
</td></tr>
<tr><td><a href="Random.html#VALself_init">self_init</a> [<a href="Random.html">Random</a>]</td>
<td><div class="info">
Initialize the generator with a random seed chosen
   in a system-dependent way.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsend">send</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Send data over a connected socket.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsend">send</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Send data over a connected socket.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALsend">send</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="Event.html#VALsend">send</a> [<a href="Event.html">Event</a>]</td>
<td><div class="info">
<code class="code">send ch v</code> returns the event consisting in sending the value <code class="code">v</code>
   over the channel <code class="code">ch</code>.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALsend">send</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALsend_substring">send_substring</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <code class="code">send</code>, but take the data from a string instead of a byte
    sequence.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsend_substring">send_substring</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <code class="code">send</code>, but take the data from a string instead of a byte
    sequence.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALsend_substring">send_substring</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALsendcache">sendcache</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALsendself">sendself</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALsendto">sendto</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Send data over an unconnected socket.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsendto">sendto</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Send data over an unconnected socket.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALsendto">sendto</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALsendto_substring">sendto_substring</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <code class="code">sendto</code>, but take the data from a string instead of a
    byte sequence.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsendto_substring">sendto_substring</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <code class="code">sendto</code>, but take the data from a string instead of a
    byte sequence.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALsendto_substring">sendto_substring</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="Weak.html#VALset">set</a> [<a href="Weak.html">Weak</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Weak</span>.set ar n (<span class="constructor">Some</span> el)</code> sets the <code class="code">n</code>th cell of <code class="code">ar</code> to be a
   (full) pointer to <code class="code">el</code>; <code class="code"><span class="constructor">Weak</span>.set ar n <span class="constructor">None</span></code> sets the <code class="code">n</code>th
   cell of <code class="code">ar</code> to empty.
</div>
</td></tr>
<tr><td><a href="String.html#VALset">set</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<span class="deprecated"><code class="code"><span class="constructor">String</span>.set s n c</code> modifies byte sequence <code class="code">s</code> in place,
   replacing the byte at index <code class="code">n</code> with <code class="code">c</code>.
</span></div>
</td></tr>
<tr><td><a href="StringLabels.html#VALset">set</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<span class="deprecated"><code class="code"><span class="constructor">String</span>.set s n c</code> modifies byte sequence <code class="code">s</code> in place,
   replacing the byte at index <code class="code">n</code> with <code class="code">c</code>.
</span></div>
</td></tr>
<tr><td><a href="Gc.html#VALset">set</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
<code class="code">set r</code> changes the GC parameters according to the <code class="code">control</code> record <code class="code">r</code>.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALset">set</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">set s n c</code> modifies <code class="code">s</code> in place, replacing the byte at index <code class="code">n</code>
    with <code class="code">c</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALset">set</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">set s n c</code> modifies <code class="code">s</code> in place, replacing the byte at index <code class="code">n</code>
    with <code class="code">c</code>.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALset">set</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array3</span>.set a x y v</code>, or alternatively <code class="code">a.{x,y,z} &lt;- v</code>,
     stores the value <code class="code">v</code> at coordinates (<code class="code">x</code>, <code class="code">y</code>, <code class="code">z</code>) in <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALset">set</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array2</span>.set a x y v</code>, or alternatively <code class="code">a.{x,y} &lt;- v</code>,
     stores the value <code class="code">v</code> at coordinates (<code class="code">x</code>, <code class="code">y</code>) in <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array1.html#VALset">set</a> [<a href="Bigarray.Array1.html">Bigarray.Array1</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array1</span>.set a x v</code>, also written <code class="code">a.{x} &lt;- v</code>,
     stores the value <code class="code">v</code> at index <code class="code">x</code> in <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALset">set</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
Assign an element of a generic big array.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALset">set</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.set a n x</code> modifies array <code class="code">a</code> in place, replacing
   element number <code class="code">n</code> with <code class="code">x</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALset">set</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.set a n x</code> modifies array <code class="code">a</code> in place, replacing
   element number <code class="code">n</code> with <code class="code">x</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALset_all_formatter_output_functions">set_all_formatter_output_functions</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<span class="deprecated"></span></div>
</td></tr>
<tr><td><a href="Arith_status.html#VALset_approx_printing">set_approx_printing</a> [<a href="Arith_status.html">Arith_status</a>]</td>
<td><div class="info">
Get or set the flag <code class="code">approx_printing</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALset_binary_mode_in">set_binary_mode_in</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">set_binary_mode_in ic <span class="keyword">true</span></code> sets the channel <code class="code">ic</code> to binary
   mode: no translations take place during input.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALset_binary_mode_out">set_binary_mode_out</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">set_binary_mode_out oc <span class="keyword">true</span></code> sets the channel <code class="code">oc</code> to binary
   mode: no translations take place during output.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALset_close_on_exec">set_close_on_exec</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Set the ``close-on-exec'' flag on the given descriptor.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALset_close_on_exec">set_close_on_exec</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Set the ``close-on-exec'' flag on the given descriptor.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALset_color">set_color</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Set the current drawing color.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALset_double_field">set_double_field</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALset_ellipsis_text">set_ellipsis_text</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Set the text of the ellipsis printed when too many boxes
   are opened (a single dot, <code class="code">.</code>, by default).
</div>
</td></tr>
<tr><td><a href="Arith_status.html#VALset_error_when_null_denominator">set_error_when_null_denominator</a> [<a href="Arith_status.html">Arith_status</a>]</td>
<td><div class="info">
Get or set the flag <code class="code">null_denominator</code>.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALset_field">set_field</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Arith_status.html#VALset_floating_precision">set_floating_precision</a> [<a href="Arith_status.html">Arith_status</a>]</td>
<td><div class="info">
Get or set the parameter <code class="code">floating_precision</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALset_font">set_font</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Set the font used for drawing text.
</div>
</td></tr>
<tr><td><a href="Format.html#VALset_formatter_out_channel">set_formatter_out_channel</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Redirect the pretty-printer output to the given channel.
</div>
</td></tr>
<tr><td><a href="Format.html#VALset_formatter_out_functions">set_formatter_out_functions</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">set_formatter_out_functions f</code>
   Redirect the pretty-printer output to the functions <code class="code">f.out_string</code>
   and <code class="code">f.out_flush</code> as described in
   <code class="code">set_formatter_output_functions</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALset_formatter_output_functions">set_formatter_output_functions</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">set_formatter_output_functions out flush</code> redirects the
   pretty-printer output functions to the functions <code class="code">out</code> and
   <code class="code">flush</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALset_formatter_tag_functions">set_formatter_tag_functions</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">set_formatter_tag_functions tag_funs</code> changes the meaning of
   opening and closing tags to use the functions in <code class="code">tag_funs</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALset_line_width">set_line_width</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Set the width of points and lines drawn with the functions above.
</div>
</td></tr>
<tr><td><a href="Format.html#VALset_margin">set_margin</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">set_margin d</code> sets the value of the right margin
   to <code class="code">d</code> (in characters): this value is used to detect line
   overflows that leads to split lines.
</div>
</td></tr>
<tr><td><a href="Format.html#VALset_mark_tags">set_mark_tags</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">set_print_tags b</code> turns on or off the printing of tags, while
    <code class="code">set_mark_tags b</code> turns on or off the output of tag markers.
</div>
</td></tr>
<tr><td><a href="Format.html#VALset_max_boxes">set_max_boxes</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">set_max_boxes max</code> sets the maximum number of boxes simultaneously
   opened.
</div>
</td></tr>
<tr><td><a href="Format.html#VALset_max_indent">set_max_indent</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">set_max_indent d</code> sets the value of the maximum
   indentation limit to <code class="code">d</code> (in characters):
   once this limit is reached, boxes are rejected to the left,
   if they do not fit on the current line.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALset_method">set_method</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALset_methods">set_methods</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALset_nonblock">set_nonblock</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Set the ``non-blocking'' flag on the given descriptor.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALset_nonblock">set_nonblock</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Set the ``non-blocking'' flag on the given descriptor.
</div>
</td></tr>
<tr><td><a href="Arith_status.html#VALset_normalize_ratio">set_normalize_ratio</a> [<a href="Arith_status.html">Arith_status</a>]</td>
<td><div class="info">
Get or set the flag <code class="code">normalize_ratio</code>.
</div>
</td></tr>
<tr><td><a href="Arith_status.html#VALset_normalize_ratio_when_printing">set_normalize_ratio_when_printing</a> [<a href="Arith_status.html">Arith_status</a>]</td>
<td><div class="info">
Get or set the flag <code class="code">normalize_ratio_when_printing</code>.
</div>
</td></tr>
<tr><td><a href="Format.html#VALset_print_tags">set_print_tags</a> [<a href="Format.html">Format</a>]</td>
<td></td></tr>
<tr><td><a href="Sys.html#VALset_signal">set_signal</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Same as <a href="Sys.html#VALsignal"><code class="code"><span class="constructor">Sys</span>.signal</code></a> but return value is ignored.
</div>
</td></tr>
<tr><td><a href="Random.html#VALset_state">set_state</a> [<a href="Random.html">Random</a>]</td>
<td><div class="info">
Set the state of the generator used by the basic functions.
</div>
</td></tr>
<tr><td><a href="Format.html#VALset_tab">set_tab</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Sets a tabulation mark at the current insertion point.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALset_tag">set_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALset_tags">set_tags</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
<code class="code">set_tags b</code> turns on or off the treatment of tags (default is off).
</div>
</td></tr>
<tr><td><a href="Filename.html#VALset_temp_dir_name">set_temp_dir_name</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
Change the temporary directory returned by <a href="Filename.html#VALget_temp_dir_name"><code class="code"><span class="constructor">Filename</span>.get_temp_dir_name</code></a>
    and used by <a href="Filename.html#VALtemp_file"><code class="code"><span class="constructor">Filename</span>.temp_file</code></a> and <a href="Filename.html#VALopen_temp_file"><code class="code"><span class="constructor">Filename</span>.open_temp_file</code></a>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALset_text_size">set_text_size</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Set the character size used for drawing text.
</div>
</td></tr>
<tr><td><a href="Parsing.html#VALset_trace">set_trace</a> [<a href="Parsing.html">Parsing</a>]</td>
<td><div class="info">
Control debugging support for <code class="code">ocamlyacc</code>-generated parsers.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALset_uncaught_exception_handler">set_uncaught_exception_handler</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Printexc</span>.set_uncaught_exception_handler fn</code> registers <code class="code">fn</code> as the handler
    for uncaught exceptions.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALset_window_title">set_window_title</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Set the title of the graphics window.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsetgid">setgid</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Set the real group id and effective group id for the process.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsetgid">setgid</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Set the real group id and effective group id for the process.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsetgroups">setgroups</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">setgroups groups</code> sets the supplementary group IDs for the
      calling process.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsetgroups">setgroups</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">setgroups groups</code> sets the supplementary group IDs for the
      calling process.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsetitimer">setitimer</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">setitimer t s</code> sets the interval timer <code class="code">t</code> and returns
   its previous status.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsetitimer">setitimer</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">setitimer t s</code> sets the interval timer <code class="code">t</code> and returns
   its previous status.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsetsid">setsid</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Put the calling process in a new session and detach it from
   its controlling terminal.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsetsid">setsid</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Put the calling process in a new session and detach it from
   its controlling terminal.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsetsockopt">setsockopt</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Set or clear a boolean-valued option in the given socket.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsetsockopt">setsockopt</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Set or clear a boolean-valued option in the given socket.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsetsockopt_float">setsockopt_float</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALsetsockopt"><code class="code"><span class="constructor">Unix</span>.setsockopt</code></a> for a socket option whose value is a
    floating-point number.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsetsockopt_float">setsockopt_float</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALsetsockopt"><code class="code"><span class="constructor">Unix</span>.setsockopt</code></a> for a socket option whose value is a
   floating-point number.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsetsockopt_int">setsockopt_int</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALsetsockopt"><code class="code"><span class="constructor">Unix</span>.setsockopt</code></a> for an integer-valued socket option.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsetsockopt_int">setsockopt_int</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALsetsockopt"><code class="code"><span class="constructor">Unix</span>.setsockopt</code></a> for an integer-valued socket option.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsetsockopt_optint">setsockopt_optint</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALsetsockopt"><code class="code"><span class="constructor">Unix</span>.setsockopt</code></a> for a socket option whose value is
    an <code class="code">int option</code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsetsockopt_optint">setsockopt_optint</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALsetsockopt"><code class="code"><span class="constructor">Unix</span>.setsockopt</code></a> for a socket option whose value is an
   <code class="code">int option</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsetuid">setuid</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Set the real user id and effective user id for the process.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsetuid">setuid</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Set the real user id and effective user id for the process.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALshift_left">shift_left</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Nativeint</span>.shift_left x y</code> shifts <code class="code">x</code> to the left by <code class="code">y</code> bits.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALshift_left">shift_left</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Int64</span>.shift_left x y</code> shifts <code class="code">x</code> to the left by <code class="code">y</code> bits.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALshift_left">shift_left</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Int32</span>.shift_left x y</code> shifts <code class="code">x</code> to the left by <code class="code">y</code> bits.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALshift_left_big_int">shift_left_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
<code class="code">shift_left_big_int b n</code> returns <code class="code">b</code> shifted left by <code class="code">n</code> bits.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALshift_right">shift_right</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Nativeint</span>.shift_right x y</code> shifts <code class="code">x</code> to the right by <code class="code">y</code> bits.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALshift_right">shift_right</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Int64</span>.shift_right x y</code> shifts <code class="code">x</code> to the right by <code class="code">y</code> bits.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALshift_right">shift_right</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Int32</span>.shift_right x y</code> shifts <code class="code">x</code> to the right by <code class="code">y</code> bits.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALshift_right_big_int">shift_right_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
<code class="code">shift_right_big_int b n</code> returns <code class="code">b</code> shifted right by <code class="code">n</code> bits.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALshift_right_logical">shift_right_logical</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Nativeint</span>.shift_right_logical x y</code> shifts <code class="code">x</code> to the right
   by <code class="code">y</code> bits.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALshift_right_logical">shift_right_logical</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Int64</span>.shift_right_logical x y</code> shifts <code class="code">x</code> to the right by <code class="code">y</code> bits.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALshift_right_logical">shift_right_logical</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Int32</span>.shift_right_logical x y</code> shifts <code class="code">x</code> to the right by <code class="code">y</code> bits.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALshift_right_towards_zero_big_int">shift_right_towards_zero_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
<code class="code">shift_right_towards_zero_big_int b n</code> returns <code class="code">b</code> shifted
            right by <code class="code">n</code> bits.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALshutdown">shutdown</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Shutdown a socket connection.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALshutdown">shutdown</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Shutdown a socket connection.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALshutdown_connection">shutdown_connection</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
``Shut down'' a connection established with <a href="UnixLabels.html#VALopen_connection"><code class="code"><span class="constructor">UnixLabels</span>.open_connection</code></a>;
   that is, transmit an end-of-file condition to the server reading
   on the other side of the connection.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALshutdown_connection">shutdown_connection</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
``Shut down'' a connection established with <a href="Unix.html#VALopen_connection"><code class="code"><span class="constructor">Unix</span>.open_connection</code></a>;
   that is, transmit an end-of-file condition to the server reading
   on the other side of the connection.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigabrt">sigabrt</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Abnormal termination
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigalrm">sigalrm</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Timeout
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigchld">sigchld</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Child process terminated
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigcont">sigcont</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Continue
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigfpe">sigfpe</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Arithmetic exception
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsighup">sighup</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Hangup on controlling terminal
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigill">sigill</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Invalid hardware instruction
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigint">sigint</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Interactive interrupt (ctrl-C)
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigkill">sigkill</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Termination (cannot be ignored)
</div>
</td></tr>
<tr><td><a href="Thread.html#VALsigmask">sigmask</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
<code class="code">sigmask cmd sigs</code> changes the set of blocked signals for the
   calling thread.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALsign_big_int">sign_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Return <code class="code">0</code> if the given big integer is zero,
           <code class="code">1</code> if it is positive, and <code class="code">-1</code> if it is negative.
</div>
</td></tr>
<tr><td><a href="Num.html#VALsign_num">sign_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Return <code class="code">-1</code>, <code class="code">0</code> or <code class="code">1</code> according to the sign of the argument.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsignal">signal</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Set the behavior of the system on receipt of a given signal.
</div>
</td></tr>
<tr><td><a href="Condition.html#VALsignal">signal</a> [<a href="Condition.html">Condition</a>]</td>
<td><div class="info">
<code class="code">signal c</code> restarts one of the processes waiting on the
   condition variable <code class="code">c</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsigpending">sigpending</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the set of blocked signals that are currently pending.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsigpending">sigpending</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the set of blocked signals that are currently pending.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigpipe">sigpipe</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Broken pipe
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsigprocmask">sigprocmask</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">sigprocmask cmd sigs</code> changes the set of blocked signals.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsigprocmask">sigprocmask</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">sigprocmask cmd sigs</code> changes the set of blocked signals.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigprof">sigprof</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Profiling interrupt
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigquit">sigquit</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Interactive termination
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigsegv">sigsegv</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Invalid memory reference
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigstop">sigstop</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Stop
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsigsuspend">sigsuspend</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">sigsuspend sigs</code> atomically sets the blocked signals to <code class="code">sigs</code>
   and waits for a non-ignored, non-blocked signal to be delivered.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsigsuspend">sigsuspend</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">sigsuspend sigs</code> atomically sets the blocked signals to <code class="code">sigs</code>
   and waits for a non-ignored, non-blocked signal to be delivered.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigterm">sigterm</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Termination
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigtstp">sigtstp</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Interactive stop
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigttin">sigttin</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Terminal read from background process
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigttou">sigttou</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Terminal write from background process
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigusr1">sigusr1</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Application-defined signal 1
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigusr2">sigusr2</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Application-defined signal 2
</div>
</td></tr>
<tr><td><a href="Sys.html#VALsigvtalrm">sigvtalrm</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Timeout in virtual time
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALsin">sin</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Sine.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsingle_write">single_write</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <code class="code">write</code>, but attempts to write only once.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsingle_write">single_write</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <code class="code">write</code>, but attempts to write only once.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsingle_write_substring">single_write_substring</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <code class="code">single_write</code>, but take the data from a string instead of
    a byte sequence.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsingle_write_substring">single_write_substring</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <code class="code">single_write</code>, but take the data from a string instead of
    a byte sequence.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALsingleton">singleton</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">singleton x</code> returns the one-element set containing only <code class="code">x</code>.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALsingleton">singleton</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALsingleton">singleton</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALsingleton">singleton</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">singleton x y</code> returns the one-element map that contains a binding <code class="code">y</code>
        for <code class="code">x</code>.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALsinh">sinh</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Hyperbolic sine.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALsize">size</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Nativeint.html#VALsize">size</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
The size in bits of a native integer.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALsize_x">size_x</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
See <a href="Graphics.html#VALsize_y"><code class="code"><span class="constructor">Graphics</span>.size_y</code></a>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALsize_y">size_y</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Return the size of the graphics window.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsleep">sleep</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Stop execution for the given number of seconds.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsleep">sleep</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Stop execution for the given number of seconds.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALsleep">sleep</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="Bigarray.Array2.html#VALslice_left">slice_left</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Extract a row (one-dimensional slice) of the given two-dimensional
     big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALslice_left">slice_left</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
Extract a sub-array of lower dimension from the given big array
     by fixing one or several of the first (left-most) coordinates.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALslice_left_1">slice_left_1</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Extract a one-dimensional slice of the given three-dimensional
     big array by fixing the first two coordinates.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALslice_left_2">slice_left_2</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Extract a  two-dimensional slice of the given three-dimensional
     big array by fixing the first coordinate.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALslice_right">slice_right</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Extract a column (one-dimensional slice) of the given
     two-dimensional big array.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALslice_right">slice_right</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
Extract a sub-array of lower dimension from the given big array
     by fixing one or several of the last (right-most) coordinates.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALslice_right_1">slice_right_1</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Extract a one-dimensional slice of the given three-dimensional
     big array by fixing the last two coordinates.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALslice_right_2">slice_right_2</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Extract a two-dimensional slice of the given
     three-dimensional big array by fixing the last coordinate.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALsnd">snd</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the second component of a pair.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsocket">socket</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Create a new socket in the given domain, and with the
   given kind.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsocket">socket</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Create a new socket in the given domain, and with the
   given kind.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALsocket">socket</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALsocketpair">socketpair</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Create a pair of unnamed sockets, connected together.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsocketpair">socketpair</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Create a pair of unnamed sockets, connected together.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALsort">sort</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Sort a list in increasing order according to a comparison
   function.
</div>
</td></tr>
<tr><td><a href="List.html#VALsort">sort</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Sort a list in increasing order according to a comparison
   function.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALsort">sort</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
Sort an array in increasing order according to a comparison
   function.
</div>
</td></tr>
<tr><td><a href="Array.html#VALsort">sort</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
Sort an array in increasing order according to a comparison
   function.
</div>
</td></tr>
<tr><td><a href="List.html#VALsort_uniq">sort_uniq</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALsort"><code class="code"><span class="constructor">List</span>.sort</code></a>, but also remove duplicates.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALsound">sound</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
<code class="code">sound freq dur</code> plays a sound at frequency <code class="code">freq</code> (in hertz)
   for a duration <code class="code">dur</code> (in milliseconds).
</div>
</td></tr>
<tr><td><a href="Str.html#VALsplit">split</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">split r s</code> splits <code class="code">s</code> into substrings, taking as delimiters
   the substrings that match <code class="code">r</code>, and returns the list of substrings.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALsplit">split</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">split x s</code> returns a triple <code class="code">(l, present, r)</code>, where
          <code class="code">l</code> is the set of elements of <code class="code">s</code> that are
          strictly less than <code class="code">x</code>;
          <code class="code">r</code> is the set of elements of <code class="code">s</code> that are
          strictly greater than <code class="code">x</code>;
          <code class="code">present</code> is <code class="code"><span class="keyword">false</span></code> if <code class="code">s</code> contains no element equal to <code class="code">x</code>,
          or <code class="code"><span class="keyword">true</span></code> if <code class="code">s</code> contains an element equal to <code class="code">x</code>.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALsplit">split</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Map.S.html#VALsplit">split</a> [<a href="MoreLabels.Map.S.html">MoreLabels.Map.S</a>]</td>
<td></td></tr>
<tr><td><a href="Map.S.html#VALsplit">split</a> [<a href="Map.S.html">Map.S</a>]</td>
<td><div class="info">
<code class="code">split x m</code> returns a triple <code class="code">(l, data, r)</code>, where
          <code class="code">l</code> is the map with all the bindings of <code class="code">m</code> whose key
        is strictly less than <code class="code">x</code>;
          <code class="code">r</code> is the map with all the bindings of <code class="code">m</code> whose key
        is strictly greater than <code class="code">x</code>;
          <code class="code">data</code> is <code class="code"><span class="constructor">None</span></code> if <code class="code">m</code> contains no binding for <code class="code">x</code>,
          or <code class="code"><span class="constructor">Some</span> v</code> if <code class="code">m</code> binds <code class="code">v</code> to <code class="code">x</code>.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALsplit">split</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Transform a list of pairs into a pair of lists:
   <code class="code">split [(a1,b1); ...; (an,bn)]</code> is <code class="code">([a1; ...; an], [b1; ...; bn])</code>.
</div>
</td></tr>
<tr><td><a href="List.html#VALsplit">split</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Transform a list of pairs into a pair of lists:
   <code class="code">split [(a1,b1); ...; (an,bn)]</code> is <code class="code">([a1; ...; an], [b1; ...; bn])</code>.
</div>
</td></tr>
<tr><td><a href="Str.html#VALsplit_delim">split_delim</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
Same as <a href="Str.html#VALsplit"><code class="code"><span class="constructor">Str</span>.split</code></a> but occurrences of the
   delimiter at the beginning and at the end of the string are
   recognized and returned as empty strings in the result.
</div>
</td></tr>
<tr><td><a href="Printf.html#VALsprintf">sprintf</a> [<a href="Printf.html">Printf</a>]</td>
<td><div class="info">
Same as <a href="Printf.html#VALfprintf"><code class="code"><span class="constructor">Printf</span>.fprintf</code></a>, but instead of printing on an output channel,
   return a string containing the result of formatting the arguments.
</div>
</td></tr>
<tr><td><a href="Format.html#VALsprintf">sprintf</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
Same as <code class="code">printf</code> above, but instead of printing on a formatter,
   returns a string containing the result of formatting the arguments.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALsqrt">sqrt</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Square root.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALsqrt">sqrt</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Square root.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALsqrt_big_int">sqrt_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
<code class="code">sqrt_big_int a</code> returns the integer square root of <code class="code">a</code>,
           that is, the largest big integer <code class="code">r</code> such that <code class="code">r * r &lt;= a</code>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALsquare_big_int">square_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Return the square of the given big integer
</div>
</td></tr>
<tr><td><a href="Num.html#VALsquare_num">square_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Squaring
</div>
</td></tr>
<tr><td><a href="Scanf.html#VALsscanf">sscanf</a> [<a href="Scanf.html">Scanf</a>]</td>
<td><div class="info">
Same as <a href="Scanf.html#VALbscanf"><code class="code"><span class="constructor">Scanf</span>.bscanf</code></a>, but reads from the given string.
</div>
</td></tr>
<tr><td><a href="Scanf.html#VALsscanf_format">sscanf_format</a> [<a href="Scanf.html">Scanf</a>]</td>
<td><div class="info">
Same as <a href="Scanf.html#VALbscanf_format"><code class="code"><span class="constructor">Scanf</span>.bscanf_format</code></a>, but reads from the given string.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALstable_sort">stable_sort</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Same as <a href="ListLabels.html#VALsort"><code class="code"><span class="constructor">ListLabels</span>.sort</code></a>, but the sorting algorithm is guaranteed to
   be stable (i.e.
</div>
</td></tr>
<tr><td><a href="List.html#VALstable_sort">stable_sort</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Same as <a href="List.html#VALsort"><code class="code"><span class="constructor">List</span>.sort</code></a>, but the sorting algorithm is guaranteed to
   be stable (i.e.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALstable_sort">stable_sort</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
Same as <a href="ArrayLabels.html#VALsort"><code class="code"><span class="constructor">ArrayLabels</span>.sort</code></a>, but the sorting algorithm is stable (i.e.
</div>
</td></tr>
<tr><td><a href="Array.html#VALstable_sort">stable_sort</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
Same as <a href="Array.html#VALsort"><code class="code"><span class="constructor">Array</span>.sort</code></a>, but the sorting algorithm is stable (i.e.
</div>
</td></tr>
<tr><td><a href="UnixLabels.LargeFile.html#VALstat">stat</a> [<a href="UnixLabels.LargeFile.html">UnixLabels.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALstat">stat</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the information for the named file.
</div>
</td></tr>
<tr><td><a href="Unix.LargeFile.html#VALstat">stat</a> [<a href="Unix.LargeFile.html">Unix.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="Unix.html#VALstat">stat</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the information for the named file.
</div>
</td></tr>
<tr><td><a href="Gc.html#VALstat">stat</a> [<a href="Gc.html">Gc</a>]</td>
<td><div class="info">
Return the current values of the memory management counters in a
   <code class="code">stat</code> record.
</div>
</td></tr>
<tr><td><a href="Weak.S.html#VALstats">stats</a> [<a href="Weak.S.html">Weak.S</a>]</td>
<td><div class="info">
Return statistics on the table.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Hashtbl.SeededS.html#VALstats">stats</a> [<a href="MoreLabels.Hashtbl.SeededS.html">MoreLabels.Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.S.html#VALstats">stats</a> [<a href="MoreLabels.Hashtbl.S.html">MoreLabels.Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="MoreLabels.Hashtbl.html#VALstats">stats</a> [<a href="MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.SeededS.html#VALstats">stats</a> [<a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.S.html#VALstats">stats</a> [<a href="Hashtbl.S.html">Hashtbl.S</a>]</td>
<td></td></tr>
<tr><td><a href="Hashtbl.html#VALstats">stats</a> [<a href="Hashtbl.html">Hashtbl</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Hashtbl</span>.stats tbl</code> returns statistics about the table <code class="code">tbl</code>:
   number of buckets, size of the biggest bucket, distribution of
   buckets by size.
</div>
</td></tr>
<tr><td><a href="CamlinternalOO.html#VALstats">stats</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Format.html#VALstd_formatter">std_formatter</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
The standard formatter used by the formatting functions
   above.
</div>
</td></tr>
<tr><td><a href="Format.html#VALstdbuf">stdbuf</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
The string buffer in which <code class="code">str_formatter</code> writes.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALstderr">stderr</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
File descriptor for standard error.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALstderr">stderr</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
File descriptor for standard error.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALstderr">stderr</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
The standard error output for the process.
</div>
</td></tr>
<tr><td><a href="Scanf.Scanning.html#VALstdib">stdib</a> [<a href="Scanf.Scanning.html">Scanf.Scanning</a>]</td>
<td><div class="info">
A deprecated alias for <code class="code"><span class="constructor">Scanning</span>.stdin</code>, the scanning buffer reading from
    <code class="code"><span class="constructor">Pervasives</span>.stdin</code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALstdin">stdin</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
File descriptor for standard input.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALstdin">stdin</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
File descriptor for standard input.
</div>
</td></tr>
<tr><td><a href="Scanf.Scanning.html#VALstdin">stdin</a> [<a href="Scanf.Scanning.html">Scanf.Scanning</a>]</td>
<td><div class="info">
The standard input notion for the <code class="code"><span class="constructor">Scanf</span></code> module.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALstdin">stdin</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
The standard input for the process.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALstdout">stdout</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
File descriptor for standard output.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALstdout">stdout</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
File descriptor for standard output.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALstdout">stdout</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
The standard output for the process.
</div>
</td></tr>
<tr><td><a href="Format.html#VALstr_formatter">str_formatter</a> [<a href="Format.html">Format</a>]</td>
<td><div class="info">
A formatter to use with formatting functions below for
   output to the <code class="code">stdbuf</code> string buffer.
</div>
</td></tr>
<tr><td><a href="Digest.html#VALstring">string</a> [<a href="Digest.html">Digest</a>]</td>
<td><div class="info">
Return the digest of the given string.
</div>
</td></tr>
<tr><td><a href="Str.html#VALstring_after">string_after</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">string_after s n</code> returns the substring of all characters of <code class="code">s</code>
   that follow position <code class="code">n</code> (including the character at
   position <code class="code">n</code>).
</div>
</td></tr>
<tr><td><a href="Str.html#VALstring_before">string_before</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">string_before s n</code> returns the substring of all characters of <code class="code">s</code>
   that precede position <code class="code">n</code> (excluding the character at
   position <code class="code">n</code>).
</div>
</td></tr>
<tr><td><a href="Str.html#VALstring_match">string_match</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
<code class="code">string_match r s start</code> tests whether a substring of <code class="code">s</code> that
   starts at position <code class="code">start</code> matches the regular expression <code class="code">r</code>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALstring_of_big_int">string_of_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Return the string representation of the given big integer,
           in decimal (base 10).
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALstring_of_bool">string_of_bool</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the string representation of a boolean.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALstring_of_float">string_of_float</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the string representation of a floating-point number.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALstring_of_fmt">string_of_fmt</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalFormat.html#VALstring_of_fmtty">string_of_fmtty</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="Pervasives.html#VALstring_of_format">string_of_format</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Converts a format string into a string.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALstring_of_formatting_gen">string_of_formatting_gen</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalFormat.html#VALstring_of_formatting_lit">string_of_formatting_lit</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALstring_of_inet_addr">string_of_inet_addr</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the printable representation of the given Internet address.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALstring_of_inet_addr">string_of_inet_addr</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the printable representation of the given Internet address.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALstring_of_int">string_of_int</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Return the string representation of an integer, in decimal.
</div>
</td></tr>
<tr><td><a href="Num.html#VALstring_of_num">string_of_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Convert a number to a string, using fractional notation.
</div>
</td></tr>
<tr><td><a href="Str.html#VALstring_partial_match">string_partial_match</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
Similar to <a href="Str.html#VALstring_match"><code class="code"><span class="constructor">Str</span>.string_match</code></a>, but also returns true if
   the argument string is a prefix of a string that matches.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALstring_tag">string_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalFormat.html#VALstrput_acc">strput_acc</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="String.html#VALsub">sub</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.sub s start len</code> returns a fresh string of length <code class="code">len</code>,
   containing the substring of <code class="code">s</code> that starts at position <code class="code">start</code> and
   has length <code class="code">len</code>.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALsub">sub</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">String</span>.sub s start len</code> returns a fresh string of length <code class="code">len</code>,
   containing the substring of <code class="code">s</code> that starts at position <code class="code">start</code> and
   has length <code class="code">len</code>.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALsub">sub</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Subtraction.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALsub">sub</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Subtraction.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALsub">sub</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Subtraction.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALsub">sub</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
Subtraction
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALsub">sub</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
<code class="code">sub s start len</code> returns a new byte sequence of length <code class="code">len</code>,
    containing the subsequence of <code class="code">s</code> that starts at position <code class="code">start</code>
    and has length <code class="code">len</code>.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALsub">sub</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
<code class="code">sub s start len</code> returns a new byte sequence of length <code class="code">len</code>,
    containing the subsequence of <code class="code">s</code> that starts at position <code class="code">start</code>
    and has length <code class="code">len</code>.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALsub">sub</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Buffer</span>.sub b off len</code> returns (a copy of) the bytes from the
    current contents of the buffer <code class="code">b</code> starting at offset <code class="code">off</code> of
    length <code class="code">len</code> bytes.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array1.html#VALsub">sub</a> [<a href="Bigarray.Array1.html">Bigarray.Array1</a>]</td>
<td><div class="info">
Extract a sub-array of the given one-dimensional big array.
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALsub">sub</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.sub a start len</code> returns a fresh array of length <code class="code">len</code>,
   containing the elements number <code class="code">start</code> to <code class="code">start + len - 1</code>
   of array <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALsub">sub</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.sub a start len</code> returns a fresh array of length <code class="code">len</code>,
   containing the elements number <code class="code">start</code> to <code class="code">start + len - 1</code>
   of array <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALsub_big_int">sub_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Subtraction.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALsub_left">sub_left</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Extract a three-dimensional sub-array of the given
     three-dimensional big array by restricting the first dimension.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALsub_left">sub_left</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Extract a two-dimensional sub-array of the given two-dimensional
     big array by restricting the first dimension.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALsub_left">sub_left</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
Extract a sub-array of the given big array by restricting the
     first (left-most) dimension.
</div>
</td></tr>
<tr><td><a href="Num.html#VALsub_num">sub_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
Subtraction
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALsub_right">sub_right</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Extract a three-dimensional sub-array of the given
     three-dimensional big array by restricting the second dimension.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALsub_right">sub_right</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Extract a two-dimensional sub-array of the given two-dimensional
     big array by restricting the second dimension.
</div>
</td></tr>
<tr><td><a href="Bigarray.Genarray.html#VALsub_right">sub_right</a> [<a href="Bigarray.Genarray.html">Bigarray.Genarray</a>]</td>
<td><div class="info">
Extract a sub-array of the given big array by restricting the
     last (right-most) dimension.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALsub_string">sub_string</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
Same as <code class="code">sub</code> but return a string instead of a byte sequence.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALsub_string">sub_string</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Same as <code class="code">sub</code> but return a string instead of a byte sequence.
</div>
</td></tr>
<tr><td><a href="Digest.html#VALsubbytes">subbytes</a> [<a href="Digest.html">Digest</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Digest</span>.subbytes s ofs len</code> returns the digest of the subsequence
   of <code class="code">s</code> starting at index <code class="code">ofs</code> and containing <code class="code">len</code> bytes.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALsubset">subset</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
<code class="code">subset s1 s2</code> tests whether the set <code class="code">s1</code> is a subset of
       the set <code class="code">s2</code>.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALsubset">subset</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="Str.html#VALsubstitute_first">substitute_first</a> [<a href="Str.html">Str</a>]</td>
<td><div class="info">
Same as <a href="Str.html#VALglobal_substitute"><code class="code"><span class="constructor">Str</span>.global_substitute</code></a>, except that only the first substring
   matching the regular expression is replaced.
</div>
</td></tr>
<tr><td><a href="Digest.html#VALsubstring">substring</a> [<a href="Digest.html">Digest</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Digest</span>.substring s ofs len</code> returns the digest of the substring
   of <code class="code">s</code> starting at index <code class="code">ofs</code> and containing <code class="code">len</code> characters.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALsucc">succ</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
<code class="code">succ x</code> is <code class="code">x + 1</code>.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALsucc">succ</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Successor.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALsucc">succ</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Successor.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALsucc">succ</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Successor.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALsucc_big_int">succ_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Successor (add 1).
</div>
</td></tr>
<tr><td><a href="Num.html#VALsucc_num">succ_num</a> [<a href="Num.html">Num</a>]</td>
<td><div class="info">
<code class="code">succ n</code> is <code class="code">n+1</code>
</div>
</td></tr>
<tr><td><a href="Parsing.html#VALsymbol_end">symbol_end</a> [<a href="Parsing.html">Parsing</a>]</td>
<td><div class="info">
See <a href="Parsing.html#VALsymbol_start"><code class="code"><span class="constructor">Parsing</span>.symbol_start</code></a>.
</div>
</td></tr>
<tr><td><a href="Parsing.html#VALsymbol_end_pos">symbol_end_pos</a> [<a href="Parsing.html">Parsing</a>]</td>
<td><div class="info">
Same as <code class="code">symbol_end</code>, but return a <code class="code">position</code> instead of an offset.
</div>
</td></tr>
<tr><td><a href="Parsing.html#VALsymbol_start">symbol_start</a> [<a href="Parsing.html">Parsing</a>]</td>
<td><div class="info">
<code class="code">symbol_start</code> and <a href="Parsing.html#VALsymbol_end"><code class="code"><span class="constructor">Parsing</span>.symbol_end</code></a> are to be called in the
   action part of a grammar rule only.
</div>
</td></tr>
<tr><td><a href="Parsing.html#VALsymbol_start_pos">symbol_start_pos</a> [<a href="Parsing.html">Parsing</a>]</td>
<td><div class="info">
Same as <code class="code">symbol_start</code>, but return a <code class="code">position</code> instead of an offset.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsymlink">symlink</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">symlink source dest</code> creates the file <code class="code">dest</code> as a symbolic link
   to the file <code class="code">source</code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsymlink">symlink</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">symlink source dest</code> creates the file <code class="code">dest</code> as a symbolic link
   to the file <code class="code">source</code>.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALsymm">symm</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="Event.html#VALsync">sync</a> [<a href="Event.html">Event</a>]</td>
<td><div class="info">
'Synchronize' on an event: offer all the communication
   possibilities specified in the event to the outside world,
   and block until one of the communications succeed.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALsynchronize">synchronize</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Synchronize the backing store and the on-screen window, by
   copying the contents of the backing store onto the graphics
   window.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALsystem">system</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Execute the given command, wait until it terminates, and return
   its termination status.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALsystem">system</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Execute the given command, wait until it terminates, and return
   its termination status.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALsystem">system</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td align="left"><br>T</td></tr>
<tr><td><a href="Obj.html#VALtag">tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Queue.html#VALtake">take</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
<code class="code">take q</code> removes and returns the first element in queue <code class="code">q</code>,
   or raises <code class="code"><span class="constructor">Empty</span></code> if the queue is empty.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALtan">tan</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Tangent.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALtanh">tanh</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Hyperbolic tangent.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALtcdrain">tcdrain</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Waits until all output written on the given file descriptor
   has been transmitted.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALtcdrain">tcdrain</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Waits until all output written on the given file descriptor
   has been transmitted.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALtcflow">tcflow</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Suspend or restart reception or transmission of data on
   the given file descriptor, depending on the second argument:
   <code class="code"><span class="constructor">TCOOFF</span></code> suspends output, <code class="code"><span class="constructor">TCOON</span></code> restarts output,
   <code class="code"><span class="constructor">TCIOFF</span></code> transmits a STOP character to suspend input,
   and <code class="code"><span class="constructor">TCION</span></code> transmits a START character to restart input.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALtcflow">tcflow</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Suspend or restart reception or transmission of data on
   the given file descriptor, depending on the second argument:
   <code class="code"><span class="constructor">TCOOFF</span></code> suspends output, <code class="code"><span class="constructor">TCOON</span></code> restarts output,
   <code class="code"><span class="constructor">TCIOFF</span></code> transmits a STOP character to suspend input,
   and <code class="code"><span class="constructor">TCION</span></code> transmits a START character to restart input.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALtcflush">tcflush</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Discard data written on the given file descriptor but not yet
   transmitted, or data received but not yet read, depending on the
   second argument: <code class="code"><span class="constructor">TCIFLUSH</span></code> flushes data received but not read,
   <code class="code"><span class="constructor">TCOFLUSH</span></code> flushes data written but not transmitted, and
   <code class="code"><span class="constructor">TCIOFLUSH</span></code> flushes both.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALtcflush">tcflush</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Discard data written on the given file descriptor but not yet
   transmitted, or data received but not yet read, depending on the
   second argument: <code class="code"><span class="constructor">TCIFLUSH</span></code> flushes data received but not read,
   <code class="code"><span class="constructor">TCOFLUSH</span></code> flushes data written but not transmitted, and
   <code class="code"><span class="constructor">TCIOFLUSH</span></code> flushes both.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALtcgetattr">tcgetattr</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the status of the terminal referred to by the given
   file descriptor.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALtcgetattr">tcgetattr</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the status of the terminal referred to by the given
   file descriptor.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALtcsendbreak">tcsendbreak</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Send a break condition on the given file descriptor.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALtcsendbreak">tcsendbreak</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Send a break condition on the given file descriptor.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALtcsetattr">tcsetattr</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Set the status of the terminal referred to by the given
   file descriptor.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALtcsetattr">tcsetattr</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Set the status of the terminal referred to by the given
   file descriptor.
</div>
</td></tr>
<tr><td><a href="Filename.html#VALtemp_dir_name">temp_dir_name</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
<span class="deprecated">The name of the initial temporary directory:
    Under Unix, the value of the <code class="code"><span class="constructor">TMPDIR</span></code> environment variable, or "/tmp"
    if the variable is not set.
</span></div>
</td></tr>
<tr><td><a href="Filename.html#VALtemp_file">temp_file</a> [<a href="Filename.html">Filename</a>]</td>
<td><div class="info">
<code class="code">temp_file prefix suffix</code> returns the name of a
   fresh temporary file in the temporary directory.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALtext_size">text_size</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Return the dimensions of the given text, if it were drawn with
   the current font and size.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALtime">time</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the current time since 00:00:00 GMT, Jan.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALtime">time</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the current time since 00:00:00 GMT, Jan.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALtime">time</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Return the processor time, in seconds, used by the program
   since the beginning of execution.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALtimed_read">timed_read</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td><div class="info">
See <a href="ThreadUnix.html#VALtimed_write"><code class="code"><span class="constructor">ThreadUnix</span>.timed_write</code></a>.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALtimed_write">timed_write</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td><div class="info">
Behave as <a href="ThreadUnix.html#VALread"><code class="code"><span class="constructor">ThreadUnix</span>.read</code></a> and <a href="ThreadUnix.html#VALwrite"><code class="code"><span class="constructor">ThreadUnix</span>.write</code></a>, except that
   <code class="code"><span class="constructor">Unix_error</span>(<span class="constructor">ETIMEDOUT</span>,_,_)</code> is raised if no data is
   available for reading or ready for writing after <code class="code">d</code> seconds.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALtimed_write_substring">timed_write_substring</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td><div class="info">
See <a href="ThreadUnix.html#VALtimed_write"><code class="code"><span class="constructor">ThreadUnix</span>.timed_write</code></a>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALtimes">times</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Return the execution times of the process.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALtimes">times</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Return the execution times of the process.
</div>
</td></tr>
<tr><td><a href="ListLabels.html#VALtl">tl</a> [<a href="ListLabels.html">ListLabels</a>]</td>
<td><div class="info">
Return the given list without its first element.
</div>
</td></tr>
<tr><td><a href="List.html#VALtl">tl</a> [<a href="List.html">List</a>]</td>
<td><div class="info">
Return the given list without its first element.
</div>
</td></tr>
<tr><td><a href="Marshal.html#VALto_buffer">to_buffer</a> [<a href="Marshal.html">Marshal</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Marshal</span>.to_buffer buff ofs len v flags</code> marshals the value <code class="code">v</code>,
   storing its byte representation in the sequence <code class="code">buff</code>,
   starting at index <code class="code">ofs</code>, and writing at most
   <code class="code">len</code> bytes.
</div>
</td></tr>
<tr><td><a href="Marshal.html#VALto_bytes">to_bytes</a> [<a href="Marshal.html">Marshal</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Marshal</span>.to_bytes v flags</code> returns a byte sequence containing
   the representation of <code class="code">v</code>.
</div>
</td></tr>
<tr><td><a href="Buffer.html#VALto_bytes">to_bytes</a> [<a href="Buffer.html">Buffer</a>]</td>
<td><div class="info">
Return a copy of the current contents of the buffer.
</div>
</td></tr>
<tr><td><a href="Marshal.html#VALto_channel">to_channel</a> [<a href="Marshal.html">Marshal</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Marshal</span>.to_channel chan v flags</code> writes the representation
   of <code class="code">v</code> on channel <code class="code">chan</code>.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALto_float">to_float</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Convert the given native integer to a floating-point number.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALto_float">to_float</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Convert the given 64-bit integer to a floating-point number.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALto_float">to_float</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Convert the given 32-bit integer to a floating-point number.
</div>
</td></tr>
<tr><td><a href="Digest.html#VALto_hex">to_hex</a> [<a href="Digest.html">Digest</a>]</td>
<td><div class="info">
Return the printable hexadecimal representation of the given digest.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALto_int">to_int</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Convert the given native integer (type <code class="code">nativeint</code>) to an
   integer (type <code class="code">int</code>).
</div>
</td></tr>
<tr><td><a href="Int64.html#VALto_int">to_int</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Convert the given 64-bit integer (type <code class="code">int64</code>) to an
   integer (type <code class="code">int</code>).
</div>
</td></tr>
<tr><td><a href="Int32.html#VALto_int">to_int</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Convert the given 32-bit integer (type <code class="code">int32</code>) to an
   integer (type <code class="code">int</code>).
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALto_int32">to_int32</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Convert the given native integer to a
   32-bit integer (type <code class="code">int32</code>).
</div>
</td></tr>
<tr><td><a href="Int64.html#VALto_int32">to_int32</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Convert the given 64-bit integer (type <code class="code">int64</code>) to a
   32-bit integer (type <code class="code">int32</code>).
</div>
</td></tr>
<tr><td><a href="ArrayLabels.html#VALto_list">to_list</a> [<a href="ArrayLabels.html">ArrayLabels</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.to_list a</code> returns the list of all the elements of <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Array.html#VALto_list">to_list</a> [<a href="Array.html">Array</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Array</span>.to_list a</code> returns the list of all the elements of <code class="code">a</code>.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALto_nativeint">to_nativeint</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Convert the given 64-bit integer (type <code class="code">int64</code>) to a
   native integer.
</div>
</td></tr>
<tr><td><a href="Printexc.html#VALto_string">to_string</a> [<a href="Printexc.html">Printexc</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Printexc</span>.to_string e</code> returns a string representation of
   the exception <code class="code">e</code>.
</div>
</td></tr>
<tr><td><a href="Nativeint.html#VALto_string">to_string</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
Return the string representation of its argument, in decimal.
</div>
</td></tr>
<tr><td><a href="Marshal.html#VALto_string">to_string</a> [<a href="Marshal.html">Marshal</a>]</td>
<td><div class="info">
Same as <code class="code">to_bytes</code> but return the result as a string instead of
    a byte sequence.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALto_string">to_string</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
Return the string representation of its argument, in decimal.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALto_string">to_string</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
Return the string representation of its argument, in signed decimal.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALto_string">to_string</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
Return a new string that contains the same bytes as the given byte
    sequence.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALto_string">to_string</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Return a new string that contains the same bytes as the given byte
    sequence.
</div>
</td></tr>
<tr><td><a href="Stack.html#VALtop">top</a> [<a href="Stack.html">Stack</a>]</td>
<td><div class="info">
<code class="code">top s</code> returns the topmost element in stack <code class="code">s</code>,
   or raises <code class="code"><span class="constructor">Empty</span></code> if the stack is empty.
</div>
</td></tr>
<tr><td><a href="Queue.html#VALtop">top</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
<code class="code">top</code> is a synonym for <code class="code">peek</code>.
</div>
</td></tr>
<tr><td><a href="Marshal.html#VALtotal_size">total_size</a> [<a href="Marshal.html">Marshal</a>]</td>
<td><div class="info">
See <a href="Marshal.html#VALheader_size"><code class="code"><span class="constructor">Marshal</span>.header_size</code></a>.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALtrans">trans</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td><a href="Queue.html#VALtransfer">transfer</a> [<a href="Queue.html">Queue</a>]</td>
<td><div class="info">
<code class="code">transfer q1 q2</code> adds all of <code class="code">q1</code>'s elements at the end of
   the queue <code class="code">q2</code>, then clears <code class="code">q1</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALtransp">transp</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
In matrices of colors, this color represent a 'transparent'
   point: when drawing the corresponding image, all pixels on the
   screen corresponding to a transparent pixel in the image will
   not be modified, while other points will be set to the color
   of the corresponding point in the image.
</div>
</td></tr>
<tr><td><a href="String.html#VALtrim">trim</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
Return a copy of the argument, without leading and trailing
   whitespace.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALtrim">trim</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
Return a copy of the argument, without leading and trailing
   whitespace.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALtrim">trim</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
Return a copy of the argument, without leading and trailing
    whitespace.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALtrim">trim</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Return a copy of the argument, without leading and trailing
    whitespace.
</div>
</td></tr>
<tr><td><a href="UnixLabels.LargeFile.html#VALtruncate">truncate</a> [<a href="UnixLabels.LargeFile.html">UnixLabels.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALtruncate">truncate</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Truncates the named file to the given size.
</div>
</td></tr>
<tr><td><a href="Unix.LargeFile.html#VALtruncate">truncate</a> [<a href="Unix.LargeFile.html">Unix.LargeFile</a>]</td>
<td></td></tr>
<tr><td><a href="Unix.html#VALtruncate">truncate</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Truncates the named file to the given size.
</div>
</td></tr>
<tr><td><a href="Pervasives.html#VALtruncate">truncate</a> [<a href="Pervasives.html">Pervasives</a>]</td>
<td><div class="info">
Same as <a href="Pervasives.html#VALint_of_float"><code class="code">int_of_float</code></a>.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALtruncate">truncate</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Mutex.html#VALtry_lock">try_lock</a> [<a href="Mutex.html">Mutex</a>]</td>
<td><div class="info">
Same as <a href="Mutex.html#VALlock"><code class="code"><span class="constructor">Mutex</span>.lock</code></a>, but does not suspend the calling thread if
   the mutex is already locked: just return <code class="code"><span class="keyword">false</span></code> immediately
   in that case.
</div>
</td></tr>
<tr><td><a href="CamlinternalFormat.html#VALtype_format">type_format</a> [<a href="CamlinternalFormat.html">CamlinternalFormat</a>]</td>
<td></td></tr>
<tr><td align="left"><br>U</td></tr>
<tr><td><a href="UnixLabels.html#VALumask">umask</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Set the process's file mode creation mask, and return the previous
    mask.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALumask">umask</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Set the process's file mode creation mask, and return the previous
    mask.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALunaligned_tag">unaligned_tag</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="String.html#VALuncapitalize">uncapitalize</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
Return a copy of the argument, with the first character set to lowercase.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALuncapitalize">uncapitalize</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
Return a copy of the argument, with the first character set to lowercase.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALuncapitalize">uncapitalize</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
Return a copy of the argument, with the first byte set to
    lowercase.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALuncapitalize">uncapitalize</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Return a copy of the argument, with the first byte set to
    lowercase.
</div>
</td></tr>
<tr><td><a href="Scanf.html#VALunescaped">unescaped</a> [<a href="Scanf.html">Scanf</a>]</td>
<td><div class="info">
Return a copy of the argument with escape sequences, following the
    lexical conventions of OCaml, replaced by their corresponding
    special characters.
</div>
</td></tr>
<tr><td><a href="Set.S.html#VALunion">union</a> [<a href="Set.S.html">Set.S</a>]</td>
<td><div class="info">
Set union.
</div>
</td></tr>
<tr><td><a href="MoreLabels.Set.S.html#VALunion">union</a> [<a href="MoreLabels.Set.S.html">MoreLabels.Set.S</a>]</td>
<td></td></tr>
<tr><td><a href="Big_int.html#VALunit_big_int">unit_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
The big integer <code class="code">1</code>.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALunix">unix</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
True if <code class="code"><span class="constructor">Sys</span>.os_type = <span class="string">"Unix"</span></code>.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALunlink">unlink</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Removes the named file
</div>
</td></tr>
<tr><td><a href="Unix.html#VALunlink">unlink</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Removes the named file
</div>
</td></tr>
<tr><td><a href="Mutex.html#VALunlock">unlock</a> [<a href="Mutex.html">Mutex</a>]</td>
<td><div class="info">
Unlock the given mutex.
</div>
</td></tr>
<tr><td><a href="Obj.html#VALunmarshal">unmarshal</a> [<a href="Obj.html">Obj</a>]</td>
<td></td></tr>
<tr><td><a href="Bigarray.Array3.html#VALunsafe_get">unsafe_get</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Like <a href="Bigarray.Array3.html#VALget"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array3</span>.get</code></a>, but bounds checking is not always
      performed.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALunsafe_get">unsafe_get</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Like <a href="Bigarray.Array2.html#VALget"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array2</span>.get</code></a>, but bounds checking is not always
      performed.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array1.html#VALunsafe_get">unsafe_get</a> [<a href="Bigarray.Array1.html">Bigarray.Array1</a>]</td>
<td><div class="info">
Like <a href="Bigarray.Array1.html#VALget"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array1</span>.get</code></a>, but bounds checking is not always performed.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALunsafe_of_string">unsafe_of_string</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Unsafely convert a shared string to a byte sequence that should
    not be mutated.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array3.html#VALunsafe_set">unsafe_set</a> [<a href="Bigarray.Array3.html">Bigarray.Array3</a>]</td>
<td><div class="info">
Like <a href="Bigarray.Array3.html#VALset"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array3</span>.set</code></a>, but bounds checking is not always
      performed.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array2.html#VALunsafe_set">unsafe_set</a> [<a href="Bigarray.Array2.html">Bigarray.Array2</a>]</td>
<td><div class="info">
Like <a href="Bigarray.Array2.html#VALset"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array2</span>.set</code></a>, but bounds checking is not always
      performed.
</div>
</td></tr>
<tr><td><a href="Bigarray.Array1.html#VALunsafe_set">unsafe_set</a> [<a href="Bigarray.Array1.html">Bigarray.Array1</a>]</td>
<td><div class="info">
Like <a href="Bigarray.Array1.html#VALset"><code class="code"><span class="constructor">Bigarray</span>.<span class="constructor">Array1</span>.set</code></a>, but bounds checking is not always performed.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALunsafe_to_string">unsafe_to_string</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Unsafely convert a byte sequence into a string.
</div>
</td></tr>
<tr><td><a href="CamlinternalMod.html#VALupdate_mod">update_mod</a> [<a href="CamlinternalMod.html">CamlinternalMod</a>]</td>
<td></td></tr>
<tr><td><a href="String.html#VALuppercase">uppercase</a> [<a href="String.html">String</a>]</td>
<td><div class="info">
Return a copy of the argument, with all lowercase letters
   translated to uppercase, including accented letters of the ISO
   Latin-1 (8859-1) character set.
</div>
</td></tr>
<tr><td><a href="StringLabels.html#VALuppercase">uppercase</a> [<a href="StringLabels.html">StringLabels</a>]</td>
<td><div class="info">
Return a copy of the argument, with all lowercase letters
   translated to uppercase, including accented letters of the ISO
   Latin-1 (8859-1) character set.
</div>
</td></tr>
<tr><td><a href="Char.html#VALuppercase">uppercase</a> [<a href="Char.html">Char</a>]</td>
<td><div class="info">
Convert the given character to its equivalent uppercase character.
</div>
</td></tr>
<tr><td><a href="BytesLabels.html#VALuppercase">uppercase</a> [<a href="BytesLabels.html">BytesLabels</a>]</td>
<td><div class="info">
Return a copy of the argument, with all lowercase letters
    translated to uppercase, including accented letters of the ISO
    Latin-1 (8859-1) character set.
</div>
</td></tr>
<tr><td><a href="Bytes.html#VALuppercase">uppercase</a> [<a href="Bytes.html">Bytes</a>]</td>
<td><div class="info">
Return a copy of the argument, with all lowercase letters
    translated to uppercase, including accented letters of the ISO
    Latin-1 (8859-1) character set.
</div>
</td></tr>
<tr><td><a href="Arg.html#VALusage">usage</a> [<a href="Arg.html">Arg</a>]</td>
<td><div class="info">
<code class="code"><span class="constructor">Arg</span>.usage speclist usage_msg</code> prints to standard error
    an error message that includes the list of valid options.
</div>
</td></tr>
<tr><td><a href="Arg.html#VALusage_string">usage_string</a> [<a href="Arg.html">Arg</a>]</td>
<td><div class="info">
Returns the message that would have been printed by <a href="Arg.html#VALusage"><code class="code"><span class="constructor">Arg</span>.usage</code></a>,
    if provided with the same parameters.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALutimes">utimes</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Set the last access time (second arg) and last modification time
   (third arg) for a file.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALutimes">utimes</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Set the last access time (second arg) and last modification time
   (third arg) for a file.
</div>
</td></tr>
<tr><td align="left"><br>W</td></tr>
<tr><td><a href="UnixLabels.html#VALwait">wait</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Wait until one of the children processes die, and return its pid
   and termination status.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALwait">wait</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Wait until one of the children processes die, and return its pid
   and termination status.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALwait">wait</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="Condition.html#VALwait">wait</a> [<a href="Condition.html">Condition</a>]</td>
<td><div class="info">
<code class="code">wait c m</code> atomically unlocks the mutex <code class="code">m</code> and suspends the
   calling process on the condition variable <code class="code">c</code>.
</div>
</td></tr>
<tr><td><a href="Graphics.html#VALwait_next_event">wait_next_event</a> [<a href="Graphics.html">Graphics</a>]</td>
<td><div class="info">
Wait until one of the events specified in the given event list
   occurs, and return the status of the mouse and keyboard at
   that time.
</div>
</td></tr>
<tr><td><a href="Thread.html#VALwait_pid">wait_pid</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
<code class="code">wait_pid p</code> suspends the execution of the calling thread
   until the process specified by the process identifier <code class="code">p</code>
   terminates.
</div>
</td></tr>
<tr><td><a href="Thread.html#VALwait_read">wait_read</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
See <a href="Thread.html#VALwait_write"><code class="code"><span class="constructor">Thread</span>.wait_write</code></a>.
</div>
</td></tr>
<tr><td><a href="Thread.html#VALwait_signal">wait_signal</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
<code class="code">wait_signal sigs</code> suspends the execution of the calling thread
   until the process receives one of the signals specified in the
   list <code class="code">sigs</code>.
</div>
</td></tr>
<tr><td><a href="Thread.html#VALwait_timed_read">wait_timed_read</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
See <a href="Thread.html#VALwait_timed_read"><code class="code"><span class="constructor">Thread</span>.wait_timed_read</code></a>.
</div>
</td></tr>
<tr><td><a href="Thread.html#VALwait_timed_write">wait_timed_write</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
Suspend the execution of the calling thread until at least
   one character is available for reading (<code class="code">wait_read</code>) or
   one character can be written without blocking (<code class="code">wait_write</code>)
   on the given Unix file descriptor.
</div>
</td></tr>
<tr><td><a href="Thread.html#VALwait_write">wait_write</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
This function does nothing in this implementation.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALwaitpid">waitpid</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <a href="UnixLabels.html#VALwait"><code class="code"><span class="constructor">UnixLabels</span>.wait</code></a>, but waits for the child process whose pid
   is given.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALwaitpid">waitpid</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <a href="Unix.html#VALwait"><code class="code"><span class="constructor">Unix</span>.wait</code></a>, but waits for the child process whose pid is given.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALwaitpid">waitpid</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="Graphics.html#VALwhite">white</a> [<a href="Graphics.html">Graphics</a>]</td>
<td></td></tr>
<tr><td><a href="CamlinternalOO.html#VALwiden">widen</a> [<a href="CamlinternalOO.html">CamlinternalOO</a>]</td>
<td></td></tr>
<tr><td><a href="Sys.html#VALwin32">win32</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
True if <code class="code"><span class="constructor">Sys</span>.os_type = <span class="string">"Win32"</span></code>.
</div>
</td></tr>
<tr><td><a href="GraphicsX11.html#VALwindow_id">window_id</a> [<a href="GraphicsX11.html">GraphicsX11</a>]</td>
<td><div class="info">
Return the unique identifier of the OCaml graphics window.
</div>
</td></tr>
<tr><td><a href="Sys.html#VALword_size">word_size</a> [<a href="Sys.html">Sys</a>]</td>
<td><div class="info">
Size of one word on the machine currently executing the OCaml
   program, in bits: 32 or 64.
</div>
</td></tr>
<tr><td><a href="Event.html#VALwrap">wrap</a> [<a href="Event.html">Event</a>]</td>
<td><div class="info">
<code class="code">wrap ev fn</code> returns the event that performs the same communications
   as <code class="code">ev</code>, then applies the post-processing function <code class="code">fn</code>
   on the return value.
</div>
</td></tr>
<tr><td><a href="Event.html#VALwrap_abort">wrap_abort</a> [<a href="Event.html">Event</a>]</td>
<td><div class="info">
<code class="code">wrap_abort ev fn</code> returns the event that performs
   the same communications as <code class="code">ev</code>, but if it is not selected
   the function <code class="code">fn</code> is called after the synchronization.
</div>
</td></tr>
<tr><td><a href="UnixLabels.html#VALwrite">write</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
<code class="code">write fd buff ofs len</code> writes <code class="code">len</code> bytes to descriptor <code class="code">fd</code>,
    taking them from byte sequence <code class="code">buff</code>, starting at position <code class="code">ofs</code>
    in <code class="code">buff</code>.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALwrite">write</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
<code class="code">write fd buff ofs len</code> writes <code class="code">len</code> bytes to descriptor <code class="code">fd</code>,
    taking them from byte sequence <code class="code">buff</code>, starting at position <code class="code">ofs</code>
    in <code class="code">buff</code>.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALwrite">write</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td><a href="UnixLabels.html#VALwrite_substring">write_substring</a> [<a href="UnixLabels.html">UnixLabels</a>]</td>
<td><div class="info">
Same as <code class="code">write</code>, but take the data from a string instead of a byte
    sequence.
</div>
</td></tr>
<tr><td><a href="Unix.html#VALwrite_substring">write_substring</a> [<a href="Unix.html">Unix</a>]</td>
<td><div class="info">
Same as <code class="code">write</code>, but take the data from a string instead of a byte
    sequence.
</div>
</td></tr>
<tr><td><a href="ThreadUnix.html#VALwrite_substring">write_substring</a> [<a href="ThreadUnix.html">ThreadUnix</a>]</td>
<td></td></tr>
<tr><td align="left"><br>X</td></tr>
<tr><td><a href="Big_int.html#VALxor_big_int">xor_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
Bitwise logical 'exclusive or'.
</div>
</td></tr>
<tr><td align="left"><br>Y</td></tr>
<tr><td><a href="Graphics.html#VALyellow">yellow</a> [<a href="Graphics.html">Graphics</a>]</td>
<td></td></tr>
<tr><td><a href="Thread.html#VALyield">yield</a> [<a href="Thread.html">Thread</a>]</td>
<td><div class="info">
Re-schedule the calling thread without suspending it.
</div>
</td></tr>
<tr><td align="left"><br>Z</td></tr>
<tr><td><a href="Nativeint.html#VALzero">zero</a> [<a href="Nativeint.html">Nativeint</a>]</td>
<td><div class="info">
The native integer 0.
</div>
</td></tr>
<tr><td><a href="Int64.html#VALzero">zero</a> [<a href="Int64.html">Int64</a>]</td>
<td><div class="info">
The 64-bit integer 0.
</div>
</td></tr>
<tr><td><a href="Int32.html#VALzero">zero</a> [<a href="Int32.html">Int32</a>]</td>
<td><div class="info">
The 32-bit integer 0.
</div>
</td></tr>
<tr><td><a href="Complex.html#VALzero">zero</a> [<a href="Complex.html">Complex</a>]</td>
<td><div class="info">
The complex number <code class="code">0</code>.
</div>
</td></tr>
<tr><td><a href="Big_int.html#VALzero_big_int">zero_big_int</a> [<a href="Big_int.html">Big_int</a>]</td>
<td><div class="info">
The big integer <code class="code">0</code>.
</div>
</td></tr>
</tbody></table>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>