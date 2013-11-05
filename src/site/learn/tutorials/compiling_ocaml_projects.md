<head>
<title>Compiling OCaml projects</title>
</head>
<body>
<h1><span>Compiling OCaml projects</span></h1>

<p>This tutorial describes the base compilation commands provided with
OCaml. It is useful to learn these commands to understand OCaml's
compilation model. However, eventually you will want to use a build
tool that automatically calls these commands internally. See <a
href="../dev_tools.html#compilation_tools">Compilation Tools</a> for
more information on the available options.
</p>

<a name="Compilation_basics"></a><h2><span>Compilation basics</span></h2>
<p class="first_para">The core OCaml distribution provides the <code>ocamlc</code> and <code>ocamlopt</code> compilers. Using them directly is fine, but if you are using third party libraries, you should use the <code><a href="http://www.ocaml-programming.de/programming/findlib.html" class="external" title="http://www.ocaml-programming.de/programming/findlib.html">ocamlfind</a></code> front-end, since it saves you from worrying about where libraries have been installed on your particular system. You can even skip to the next section &quot;Automated build systems&quot;, where you will find how to do things even more automatically.</p>
<p>In this section, we will first see how to compile a simple program using only ocamlc or ocamlopt. Then we will see how to use libraries and how to take advantage of the <a href="http://www.ocaml-programming.de/programming/findlib.html" class="external" title="http://www.ocaml-programming.de/programming/findlib.html">findlib</a> system, which provides the <code>ocamlfind</code> command.</p>
<h3><code>ocamlc</code> and <code>ocamlopt</code></h3>
<p class="first_para"><code>ocamlc</code> is the bytecode compiler, and <code>ocamlopt</code> is the native code compiler. If you don't know which one to use, use <code>ocamlopt</code> since it provides standalone executables that are normally faster than bytecode.</p>
<p>Let's assume that your program <code>progprog</code> has two source files, <code>module1.ml</code> and <code>module2.ml</code>. We will compile them to native code, using <code>ocamlopt</code>. For now, we also assume that they do not use any other library than the standard library, which is automatically loaded. You can compile the program in one single step:</p>
<pre>
ocamlopt -o progprog module1.ml module2.ml
</pre>

<p class="first_para">That's it. The compiler produced an executable named <code>progprog</code> or <code>progprog.exe</code>. If you are wondering how to write a program in multiple files, see our <a href="modules.html" class="internal" title="Modules">Modules</a> tutorial. Don't forget that the order of the source files matters, and that <code>module1.ml</code> cannot depend on things that are defined in <code>module2.ml</code>, unless <code>module2.ml</code> comes earlier on the command line.</p>
<p>Let's use libraries other than the standard library. The OCaml distribution is shipped with the standard library, plus several other libraries that you can use as well. There is also a large number of third-party libraries, for a wide range of applications, from networking to 3D graphics. You must understand the following:</p>
<ol><li>The OCaml compilers know where the standard library is and uses it systematically (try: <code>ocamlc -where</code>). You don't have to worry much about it.</li>
<li>The other libraries that ship with the OCaml distribution from Inria (str, unix, bigarray, etc.) are installed in the same directory as the standard library.</li>
<li>Third-party libraries may be installed in various places, and even a given library can be installed in different places from one system to another.</li></ol>
<p class="first_para">If your program uses only the unix library (provides system calls not only for Unix systems), the command line would be:</p>
<pre>
ocamlopt -o progprog unix.cmxa module1.ml module2.ml
</pre>

<p class="first_para"><code>.cmxa</code> is the extension of native code libraries, while <code>.cma</code> is the extension of bytecode libraries. The file <code>unix.cmxa</code> is found because it is always installed at the same place as the standard library, and this directory is in the library search path.</p>
<p>If your program is a video game that uses openGL with SDL, you will need to tell the compiler which library files must be used, and where to find them. It means you will be using lablGL and OCamlSDL, the OCaml interfaces to your local implementation of openGL and SDL. LablGL provides one OCaml library file <code>lablgl.cmxa</code>, while OCamlSDL provides one core library file <code>sdl.cmxa</code>, and 3 optional files <code>sdlloader.cmxa</code>, <code>sdlmixer.cmxa</code> and <code>sdlttf.cmxa</code>. If you want to use those files, you must pass them on the command line. You must also indicate the libraries on which these libraries depend. Here, the bigarray library is needed by OCamlSDL. You must also pass the -I option to <code>ocamlopt</code> for each directory where they should be looked for. Since this information installation-dependent, we will use ocamlfind instead.</p>
<h3>Using the <code>ocamlfind</code> front-end</h3>
<p class="first_para">Using <code>ocamlfind</code> is highly recommended for compiling any program or library that uses third-party OCaml libraries. Library authors themselves should make their library installable with <code>ocamlfind</code> as well. If they don't, you may have to do it yourself, which is not very difficult, but hopefully you won't have to. OK, let's assume that all the libraries you want to use have been installed properly with ocamlfind.</p>
<p>You can see which packages and subpackages are available in your system by typing:</p>
<pre>
ocamlfind list
</pre>

<p class="first_para">This shows the list of package names, with their version ID.</p>
<p>For our example using LablGL and OCamlSDL, we are going to use the following packages: lablGL, sdl, sdl.sdlimage, sdl.sdlmixer, sdl.sdlttf. The bigarray package is needed by the sdl package, but we don't need to worry about that since <code>ocamlfind</code> knows it.</p>
<p>The command for compiling our program will be:</p>
<pre>
ocamlfind ocamlopt -o progprog -linkpkg \
  -package lablGL,sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf \
  module1.ml module2.ml
</pre>

<p class="first_para">And it will work regardless of the location of the libraries, as long as they are known by <code>ocamlfind</code>.</p>
<p>Note that you can compile the files separately. This is mostly useful if you want to recompile only some parts of the programs. Here are the equivalent commands that perform a separate compilation of the source files and link them together in a final step:</p>
<pre>
ocamlfind ocamlopt -c \
  -package lablGL,sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf \
  module1.ml
ocamlfind ocamlopt -c \
  -package lablGL,sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf \
  module2.ml
ocamlfind ocamlopt -o progprog -linkpkg \
  -package lablGL,sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf \
  module1.cmx module2.cmx
</pre>

<p class="first_para">Separate compilation is usually not performed manually but only when using a Makefile that will take care of recompiling only what it necessary. See next section.</p>
<a name="Automated_build_systems"></a><h2><span>Automated build systems</span></h2>

</body>
