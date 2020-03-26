<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="language.html">The OCaml language</a></li><li class="active"><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec237"><span>Chapter 8</span>&nbsp;&nbsp;Language extensions</h1>
<p> <a id="c:extensions"></a>
</p><p>This chapter describes language extensions and convenience features
that are implemented in OCaml, but not described in the
OCaml reference manual.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.08</a></div><div class="toc_title"><a href="#">Language extensions</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual023.html#start-section">1&nbsp;&nbsp;Recursive definitions of values</a>
</li><li><a href="manual024.html#start-section">2&nbsp;&nbsp;Recursive modules</a>
</li><li><a href="manual025.html#start-section">3&nbsp;&nbsp;Private types</a>
</li><li><a href="manual026.html#start-section">4&nbsp;&nbsp;Local opens for patterns</a>
</li><li><a href="manual027.html#start-section">5&nbsp;&nbsp;Locally abstract types</a>
</li><li><a href="manual028.html#start-section">6&nbsp;&nbsp;First-class modules</a>
</li><li><a href="manual029.html#start-section">7&nbsp;&nbsp;Recovering the type of a module</a>
</li><li><a href="manual030.html#start-section">8&nbsp;&nbsp;Substituting inside a signature</a>
</li><li><a href="manual031.html#start-section">9&nbsp;&nbsp;Type-level module aliases</a>
</li><li><a href="manual032.html#start-section">10&nbsp;&nbsp;Overriding in open statements</a>
</li><li><a href="manual033.html#start-section">11&nbsp;&nbsp;Generalized algebraic datatypes</a>
</li><li><a href="manual034.html#start-section">12&nbsp;&nbsp;Syntax for Bigarray access</a>
</li><li><a href="manual035.html#start-section">13&nbsp;&nbsp;Attributes</a>
</li><li><a href="manual036.html#start-section">14&nbsp;&nbsp;Extension nodes</a>
</li><li><a href="manual037.html#start-section">15&nbsp;&nbsp;Extensible variant types</a>
</li><li><a href="manual038.html#start-section">16&nbsp;&nbsp;Generative functors</a>
</li><li><a href="manual039.html#start-section">17&nbsp;&nbsp;Extension-only syntax</a>
</li><li><a href="manual040.html#start-section">18&nbsp;&nbsp;Inline records</a>
</li><li><a href="manual041.html#start-section">19&nbsp;&nbsp;Documentation comments</a>
</li><li><a href="manual042.html#start-section">20&nbsp;&nbsp;Extended indexing operators  </a>
</li><li><a href="manual043.html#start-section">21&nbsp;&nbsp;Empty variant types </a>
</li><li><a href="manual044.html#start-section">22&nbsp;&nbsp;Alerts  </a>
</li><li><a href="manual045.html#start-section">23&nbsp;&nbsp;Generalized open statements</a>
</li><li><a href="manual046.html#start-section">24&nbsp;&nbsp;Binding operators </a>
</li></ul></nav></header><a id="start-section"></a><section id="section">




<h2 class="section" id="sec254">9&nbsp;&nbsp;Type-level module aliases</h2>
<p>
<a id="hevea_manual.kwd224"></a>
<a id="s:module-alias"></a></p><p>(Introduced in OCaml 4.02)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>The above specification, inside a signature, only matches a module
definition equal to <a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>. Conversely, a type-level module
alias can be matched by itself, or by any supertype of the type of the
module it references.</p><p>There are several restrictions on <a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>:
</p><ol class="enumerate" type="1"><li class="li-enumerate">
it should be of the form <span class="c009">M</span><sub>0</sub>.<span class="c009">M</span><sub>1</sub>...<span class="c009">M</span><sub><span class="c009">n</span></sub> (<em>i.e.</em> without
functor applications);
</li><li class="li-enumerate">inside the body of a functor, <span class="c009">M</span><sub>0</sub> should not be one of the
functor parameters;
</li><li class="li-enumerate">inside a recursive module definition, <span class="c009">M</span><sub>0</sub> should not be one of
the recursively defined modules.
</li></ol><p>Such specifications are also inferred. Namely, when <span class="c010">P</span> is a path
satisfying the above constraints,


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> module N = P
</div>
</pre>


</div><p>

has type
</p><pre>module N = P
</pre><p>Type-level module aliases are used when checking module path
equalities. That is, in a context where module name <span class="c010">N</span> is known to be
an alias for <span class="c010">P</span>, not only these two module paths check as equal, but
<span class="c010">F</span>&nbsp;(<span class="c010">N</span>) and <span class="c010">F</span>&nbsp;(<span class="c010">P</span>) are also recognized as equal. In the default
compilation mode, this is the only difference with the previous
approach of module aliases having just the same module type as the
module they reference.</p><p>When the compiler flag <span class="c004">-no-alias-deps</span> is enabled, type-level
module aliases are also exploited to avoid introducing dependencies
between compilation units. Namely, a module alias referring to a
module inside another compilation unit does not introduce a link-time
dependency on that compilation unit, as long as it is not
dereferenced; it still introduces a compile-time dependency if the
interface needs to be read, <em>i.e.</em> if the module is a submodule
of the compilation unit, or if some type components are referred to.
Additionally, accessing a module alias introduces a link-time
dependency on the compilation unit containing the module referenced by
the alias, rather than the compilation unit containing the alias.
Note that these differences in link-time behavior may be incompatible
with the previous behavior, as some compilation units might not be
extracted from libraries, and their side-effects ignored.</p><p>These weakened dependencies make possible to use module aliases in
place of the <span class="c004">-pack</span> mechanism. Suppose that you have a library
<span class="c004">Mylib</span> composed of modules <span class="c004">A</span> and <span class="c004">B</span>. Using <span class="c004">-pack</span>, one
would issue the command line
</p><pre>ocamlc -pack a.cmo b.cmo -o mylib.cmo
</pre><p>and as a result obtain a <span class="c004">Mylib</span> compilation unit, containing
physically <span class="c004">A</span> and <span class="c004">B</span> as submodules, and with no dependencies on
their respective compilation units.
Here is a concrete example of a possible alternative approach:
</p><ol class="enumerate" type="1"><li class="li-enumerate">
Rename the files containing <span class="c004">A</span> and <span class="c004">B</span> to <span class="c004">Mylib__A</span> and
<span class="c004">Mylib__B</span>.
</li><li class="li-enumerate">Create a packing interface <span class="c004">Mylib.ml</span>, containing the
following lines.
<pre>module A = Mylib__A
module B = Mylib__B
</pre></li><li class="li-enumerate">Compile <span class="c004">Mylib.ml</span> using <span class="c004">-no-alias-deps</span>, and the other
files using <span class="c004">-no-alias-deps</span> and <span class="c002"><span class="c003">-open</span> <span class="c003">Mylib</span></span> (the last one is
equivalent to adding the line <span class="c002"><span class="c003">open!</span> <span class="c003">Mylib</span></span> at the top of each
file).
<pre>ocamlc -c -no-alias-deps Mylib.ml
ocamlc -c -no-alias-deps -open Mylib Mylib__*.mli Mylib__*.ml
</pre></li><li class="li-enumerate">Finally, create a library containing all the compilation units,
and export all the compiled interfaces.
<pre>ocamlc -a Mylib*.cmo -o Mylib.cma
</pre></li></ol><p>
This approach lets you access <span class="c004">A</span> and <span class="c004">B</span> directly inside the
library, and as <span class="c004">Mylib.A</span> and <span class="c004">Mylib.B</span> from outside.
It also has the advantage that <span class="c004">Mylib</span> is no longer monolithic: if
you use <span class="c004">Mylib.A</span>, only <span class="c004">Mylib__A</span> will be linked in, not
<span class="c004">Mylib__B</span>.
</p><p>Note the use of double underscores in <span class="c004">Mylib__A</span> and
<span class="c004">Mylib__B</span>. These were chosen on purpose; the compiler uses the
following heuristic when printing paths: given a path <span class="c004">Lib__fooBar</span>,
if <span class="c004">Lib.FooBar</span> exists and is an alias for <span class="c004">Lib__fooBar</span>, then the
compiler will always display <span class="c004">Lib.FooBar</span> instead of
<span class="c004">Lib__fooBar</span>. This way the long <span class="c004">Mylib__</span> names stay hidden and
all the user sees is the nicer dot names. This is how the OCaml
standard library is compiled.</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>