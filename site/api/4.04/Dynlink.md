<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Dynlink</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Dynlink.html">Dynlink</a></h1>

<pre><span class="keyword">module</span> Dynlink: <code class="code"><span class="keyword">sig</span></code> <a href="Dynlink.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Dynamic loading of object files.<br>
</div>
<hr width="100%">

<pre><span id="VALis_native"><span class="keyword">val</span> is_native</span> : <code class="type">bool</code></pre><div class="info ">
<code class="code"><span class="keyword">true</span></code> if the program is native,
    <code class="code"><span class="keyword">false</span></code> if the program is bytecode.<br>
</div>
<br>
<h6 id="6_Dynamicloadingofcompiledfiles">Dynamic loading of compiled files</h6><br>

<pre><span id="VALloadfile"><span class="keyword">val</span> loadfile</span> : <code class="type">string -&gt; unit</code></pre><div class="info ">
In bytecode: load the given bytecode object file (<code class="code">.cmo</code> file) or
    bytecode library file (<code class="code">.cma</code> file), and link it with the running
    program. In native code: load the given OCaml plugin file (usually
    <code class="code">.cmxs</code>), and link it with the running
    program.
    All toplevel expressions in the loaded compilation units
    are evaluated. No facilities are provided to
    access value names defined by the unit. Therefore, the unit
    must register itself its entry points with the main program,
    e.g. by modifying tables of functions.<br>
</div>

<pre><span id="VALloadfile_private"><span class="keyword">val</span> loadfile_private</span> : <code class="type">string -&gt; unit</code></pre><div class="info ">
Same as <code class="code">loadfile</code>, except that the compilation units just loaded
    are hidden (cannot be referenced) from other modules dynamically
    loaded afterwards.<br>
</div>

<pre><span id="VALadapt_filename"><span class="keyword">val</span> adapt_filename</span> : <code class="type">string -&gt; string</code></pre><div class="info ">
In bytecode, the identity function. In native code, replace the last
    extension with <code class="code">.cmxs</code>.<br>
</div>
<br>
<h6 id="6_Accesscontrol">Access control</h6><br>

<pre><span id="VALallow_only"><span class="keyword">val</span> allow_only</span> : <code class="type">string list -&gt; unit</code></pre><div class="info ">
<code class="code">allow_only&nbsp;units</code> restricts the compilation units that
    dynamically-linked units can reference: it forbids all references
    to units other than those named in the list <code class="code">units</code>. References
    to any other compilation unit will cause a <code class="code"><span class="constructor">Unavailable_unit</span></code>
    error during <code class="code">loadfile</code> or <code class="code">loadfile_private</code>.
<p>

    Initially (or after calling <code class="code">default_available_units</code>) all
    compilation units composing the program currently running are
    available for reference from dynamically-linked units.
    <code class="code">allow_only</code> can be used to restrict access to a subset of these
    units, e.g. to the units that compose the API for
    dynamically-linked code, and prevent access to all other units,
    e.g. private, internal modules of the running program. If
    <code class="code">allow_only</code> is called several times, access will be restricted to
    the intersection of the given lists (i.e. a call to <code class="code">allow_only</code>
    can never increase the set of available units).<br>
</p></div>

<pre><span id="VALprohibit"><span class="keyword">val</span> prohibit</span> : <code class="type">string list -&gt; unit</code></pre><div class="info ">
<code class="code">prohibit&nbsp;units</code> prohibits dynamically-linked units from referencing
    the units named in list <code class="code">units</code>.  This can be used to prevent
    access to selected units, e.g. private, internal modules of
    the running program.<br>
</div>

<pre><span id="VALdefault_available_units"><span class="keyword">val</span> default_available_units</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Reset the set of units that can be referenced from dynamically-linked
    code to its default value, that is, all units composing the currently
    running program.<br>
</div>

<pre><span id="VALallow_unsafe_modules"><span class="keyword">val</span> allow_unsafe_modules</span> : <code class="type">bool -&gt; unit</code></pre><div class="info ">
Govern whether unsafe object files are allowed to be
    dynamically linked. A compilation unit is 'unsafe' if it contains
    declarations of external functions, which can break type safety.
    By default, dynamic linking of unsafe object files is
    not allowed. In native code, this function does nothing; object files
    with external functions are always allowed to be dynamically linked.<br>
</div>
<br>
<h6 id="6_DeprecatedlowlevelAPIforaccesscontrol">Deprecated, low-level API for access control</h6><br>

<pre><span id="VALadd_interfaces"><span class="keyword">val</span> add_interfaces</span> : <code class="type">string list -&gt; string list -&gt; unit</code></pre><div class="info ">
<code class="code">add_interfaces&nbsp;units&nbsp;path</code> grants dynamically-linked object
    files access to the compilation  units named in list <code class="code">units</code>.
    The interfaces (<code class="code">.cmi</code> files) for these units are searched in
    <code class="code">path</code> (a list of directory names).<br>
</div>

<pre><span id="VALadd_available_units"><span class="keyword">val</span> add_available_units</span> : <code class="type">(string * <a href="Digest.html#TYPEt">Digest.t</a>) list -&gt; unit</code></pre><div class="info ">
Same as <a href="Dynlink.html#VALadd_interfaces"><code class="code"><span class="constructor">Dynlink</span>.add_interfaces</code></a>, but instead of searching <code class="code">.cmi</code> files
    to find the unit interfaces, uses the interface digests given
    for each unit. This way, the <code class="code">.cmi</code> interface files need not be
    available at run-time. The digests can be extracted from <code class="code">.cmi</code>
    files using the <code class="code">extract_crc</code> program installed in the
    OCaml standard library directory.<br>
</div>

<pre><span id="VALclear_available_units"><span class="keyword">val</span> clear_available_units</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Empty the list of compilation units accessible to dynamically-linked
    programs.<br>
</div>
<br>
<h6 id="6_Deprecatedinitialization">Deprecated, initialization</h6><br>

<pre><span id="VALinit"><span class="keyword">val</span> init</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<span class="warning">Deprecated.</span>Initialize the <code class="code"><span class="constructor">Dynlink</span></code> library. This function is called
    automatically when needed.<br>
</div>
<br>
<h6 id="6_Errorreporting">Error reporting</h6><br>

<pre><code><span id="TYPElinking_error"><span class="keyword">type</span> <code class="type"></code>linking_error</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlinking_error.Undefined_global"><span class="constructor">Undefined_global</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlinking_error.Unavailable_primitive"><span class="constructor">Unavailable_primitive</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlinking_error.Uninitialized_global"><span class="constructor">Uninitialized_global</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEerror"><span class="keyword">type</span> <code class="type"></code>error</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Not_a_bytecode_file"><span class="constructor">Not_a_bytecode_file</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Inconsistent_import"><span class="constructor">Inconsistent_import</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Unavailable_unit"><span class="constructor">Unavailable_unit</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Unsafe_file"><span class="constructor">Unsafe_file</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Linking_error"><span class="constructor">Linking_error</span></span> <span class="keyword">of</span> <code class="type">string * <a href="Dynlink.html#TYPElinking_error">linking_error</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Corrupted_interface"><span class="constructor">Corrupted_interface</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.File_not_found"><span class="constructor">File_not_found</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Cannot_open_dll"><span class="constructor">Cannot_open_dll</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Inconsistent_implementation"><span class="constructor">Inconsistent_implementation</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr></tbody></table>



<pre><span id="EXCEPTIONError"><span class="keyword">exception</span> Error</span> <span class="keyword">of</span> <code class="type"><a href="Dynlink.html#TYPEerror">error</a></code></pre>
<div class="info ">
Errors in dynamic linking are reported by raising the <code class="code"><span class="constructor">Error</span></code>
    exception with a description of the error.<br>
</div>

<pre><span id="VALerror_message"><span class="keyword">val</span> error_message</span> : <code class="type"><a href="Dynlink.html#TYPEerror">error</a> -&gt; string</code></pre><div class="info ">
Convert an error description to a printable message.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>