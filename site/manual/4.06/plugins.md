<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="comp.html">Batch compilation (ocamlc)</a></li><li><a href="toplevel.html">The toplevel system or REPL (ocaml)</a></li><li><a href="runtime.html">The runtime system (ocamlrun)</a></li><li><a href="native.html">Native-code compilation (ocamlopt)</a></li><li><a href="lexyacc.html">Lexer and parser generators (ocamllex, ocamlyacc)</a></li><li><a href="depend.html">Dependency generator (ocamldep)</a></li><li><a href="browser.html">The browser/editor (ocamlbrowser)</a></li><li><a href="ocamldoc.html">The documentation generator (ocamldoc)</a></li><li><a href="debugger.html">The debugger (ocamldebug)</a></li><li><a href="profil.html">Profiling (ocamlprof)</a></li><li><a href="manual033.html">The ocamlbuild compilation manager</a></li><li><a href="intfc.html">Interfacing C with OCaml</a></li><li><a href="flambda.html">Optimisation with Flambda</a></li><li><a href="spacetime.html">Memory profiling with Spacetime</a></li><li><a href="afl-fuzz.html">Fuzzing with afl-fuzz</a></li><li class="active"><a href="plugins.html">Compiler plugins</a></li></ul>




<h1 class="chapter" id="c:plugins"><span>Chapter 24</span>&nbsp;&nbsp;Compiler plugins</h1>
<header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.06</a></div><div class="toc_title"><a href="#">Compiler plugins</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#sec542">1&nbsp;&nbsp;Overview</a>
</li><li><a href="#sec543">2&nbsp;&nbsp;Basic example</a>
</li></ul></nav></header>

<h2 class="section" id="sec542">1&nbsp;&nbsp;Overview</h2>
<p>Starting from OCaml 4.03, it is possible to extend the native and bytecode compilers
with plugins using the <span class="c003">-plugin</span> command line option of both tools.
This possibility is also available for <span class="c003">ocamldep</span> for OCaml version ulterior to 4.05.
Beware however that plugins are an advanced feature of which the design
is still in flux and breaking changes may happen in the future. Plugins features
are based on the compiler library API. In complement, new hooks have been added to
the compiler to increase its flexibility.</p><p>In particular, hooks are available in the
<a href="../../api/4.06/Pparse.html"><span class="c003">Pparse</span> module</a>
to transform the parsed abstract syntax tree, providing similar functionality
to extension point based preprocessors.
Other hooks are available to analyze the typed tree in the
<a href="../../api/4.06/Typemod.html"><span class="c003">Typemod</span> module</a>
after the type-checking phase of the compiler. Since the typed tree relies
on numerous invariants that play a vital part in ulterior phases of the
compiler, it is not possible however to transform the typed tree.
Similarly, the intermediary lambda representation can be modified by using the
hooks provided in the
<a href="../../api/4.06/Simplif.html"><span class="c003">Simplif</span> module</a>
.
A plugin can also add new options to a tool through the
<span class="c003">Clflags.add_arguments</span> function (see
<a href="../../api/4.06/Clflags.html"><span class="c003">Clflags</span> module</a>
).</p><p>Plugins are dynamically loaded and need to be compiled in the same mode (i.e.
native or bytecode) that the tool they extend.</p>
<h2 class="section" id="sec543">2&nbsp;&nbsp;Basic example</h2>
<p>As an illustration, we shall build a simple <span class="c003">Hello world</span> plugin that adds
a simple statement <span class="c003">print_endline "Hello from:$sourcefile"</span> to a compiled file.</p><p>The simplest way to implement this feature is to modify the abstract syntax
tree. We will therefore add an hooks to the <span class="c003">Pparse.ImplementationHooks</span>.
Since the proposed modification is very basic, we could implement the hook
directly. However, for the sake of this illustration, we use the <span class="c003">Ast_mapper</span>
structure that provides a better path to build more interesting plugins.</p><p>The first step is to build the AST fragment corresponding to the
evaluation of <span class="c003">print_endline</span>:
</p><pre>  let print_endline name =
    let open Ast_helper in
    let print_endline = Exp.ident
    @@ Location.mknoloc @@Longident.Lident "print_endline" in
    let hello = Exp.constant @@ Const.string @@ "Hello from: " ^ name in
    Str.eval @@ Exp.apply print_endline [Asttypes.Nolabel, hello]
</pre><p>Then, we can construct an ast mapper that adds this fragment to the parsed
ast tree.
</p><pre>let add_hello name (mapper:Ast_mapper.mapper) structure =
  let default = Ast_mapper.default_mapper in
  (print_endline name) :: (default.structure default structure)

let ast_mapper name =
  { Ast_mapper.default_mapper with structure = add_hello name }
</pre><p>Once this AST mapper is constructed, we need to convert it to a hook and adds this
hook to the <span class="c003">Pparse.ImplementationsHooks</span>.
</p><pre>let transform hook_info structure =
        let astm = ast_mapper hook_info.Misc.sourcefile in
        astm.structure astm structure

let () = Pparse.ImplementationHooks.add_hook "Hello world hook" transform
</pre><p>The resulting simplistic plugin can then be compiled with
</p><pre>$ ocamlopt -I +compiler-libs -shared plugin.ml -o plugin.cmxs
</pre><p>Compiling other files with this plugin enabled is then as simple as
</p><pre>$ ocamlopt -plugin plugin.cmxs test.ml -o test
</pre>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>