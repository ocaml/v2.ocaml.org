<!-- ((! set title Using ocamlfind with ocamlbuild !)) ((! set learn !)) -->

# Using ocamlfind with ocamlbuild
There are many ways to make ocamlbuild use ocamlfind. The first section
gives the simplest one, starting from ocamlfind 3.12\. The second section
gives a generic [plugin](Making_plugins.html) which replaces the
"ocamlc", "ocamldep"... commands with ocamlfind equivalents. The third
shows how to call "ocamlfind query" from a
[plugin](Making_plugins.html).

## Simple tag \(from 3.12\)
Starting with version 3.12, the support of *ocamlfind* is native in
*ocamlbuild*. To activate it, you need to pass the command line option
`-use-ocamlfind`. Then you can add packages in the `_tags` file with the
`package(...)` tag. Syntax extensions are enabled by requiring the
related package and using the `syntax(camlp4o)` tag. Finally ocamlfind
predicates can be activated with the `predicate(...)` tag.

`# Suppose that prog.ml is the main module and`<br />`# that your project use num and str libraries.`

`$ cat _tags`<br />`<*.ml> or "prog.byte": package(num), package(str)`

`$ ocamlbuild  -use-ocamlfind prog.byte --`<br />`Hello World!`

To include sub-packages, use the doted notation

`<*.ml>: package(lwt.unix), package(lwt.syntax), syntax(camlp4o)`<br />`"prog.byte": package(lwt.unix)`

## Generic plugin
Here is presented a rather generic [plugin](Making_plugins.html)
to access packages using ocamlfind.

### Source
`$ cat myocamlbuild.ml`

`open Ocamlbuild_plugin`<br />`(* open Command -- no longer needed for OCaml >= 3.10.2 *)`

`(* these functions are not really officially exported *)`<br />`let run_and_read = Ocamlbuild_pack.My_unix.run_and_read`<br />`let blank_sep_strings = Ocamlbuild_pack.Lexers.blank_sep_strings`

`let split s ch =`<br />`  let x = ref [] in`<br />`  let rec go s =`<br />`    let pos = String.index s ch in`<br />`    x := (String.before s pos)::!x;`<br />`    go (String.after s (pos + 1))`<br />`  in`<br />`  try`<br />`    go s`<br />`  with Not_found -> !x`<br />`                                                                                                                                                                                                                                             `<br />`let split_nl s = split s '\n'`

`let before_space s =`<br />`  try`<br />`    String.before s (String.index s ' ')`<br />`  with Not_found -> s`

`(* this lists all supported packages *)`<br />`let find_packages () =`<br />`  List.map before_space (split_nl & run_and_read "ocamlfind list")`

`(* this is supposed to list available syntaxes, but I don't know how to do it. *)`<br />`let find_syntaxes () = ["camlp4o"; "camlp4r"]`

`(* ocamlfind command *)`<br />`let ocamlfind x = S[A"ocamlfind"; x]`

`let _ = dispatch begin function`<br />`   | Before_options ->`<br />`       (* by using Before_options one let command line options have an higher priority *)`<br />`       (* on the contrary using After_options will guarantee to have the higher priority *)`

`       (* override default commands by ocamlfind ones *)`<br />`       Options.ocamlc     := ocamlfind & A"ocamlc";`<br />`       Options.ocamlopt   := ocamlfind & A"ocamlopt";`<br />`       Options.ocamldep   := ocamlfind & A"ocamldep";`<br />`       Options.ocamldoc   := ocamlfind & A"ocamldoc";`<br />`       Options.ocamlmktop := ocamlfind & A"ocamlmktop"`

`   | After_rules ->`

`       (* When one link an OCaml library/binary/package, one should use -linkpkg *)`<br />`       flag ["ocaml"; "link"; "program"] & A"-linkpkg";`

`       (* For each ocamlfind package one inject the -package option when`<br />`           * compiling, computing dependencies, generating documentation and`<br />`           * linking. *)`<br />`       List.iter begin fun pkg ->`<br />`         flag ["ocaml"; "compile";  "pkg_"^pkg] & S[A"-package"; A pkg];`<br />`         flag ["ocaml"; "ocamldep"; "pkg_"^pkg] & S[A"-package"; A pkg];`<br />`         flag ["ocaml"; "doc";      "pkg_"^pkg] & S[A"-package"; A pkg];`<br />`         flag ["ocaml"; "link";     "pkg_"^pkg] & S[A"-package"; A pkg];`<br />`         flag ["ocaml"; "infer_interface"; "pkg_"^pkg] & S[A"-package"; A pkg];`<br />`       end (find_packages ());`

`       (* Like -package but for extensions syntax. Morover -syntax is useless`<br />`           * when linking. *)`<br />`       List.iter begin fun syntax ->`<br />`         flag ["ocaml"; "compile";  "syntax_"^syntax] & S[A"-syntax"; A syntax];`<br />`         flag ["ocaml"; "ocamldep"; "syntax_"^syntax] & S[A"-syntax"; A syntax];`<br />`         flag ["ocaml"; "doc";      "syntax_"^syntax] & S[A"-syntax"; A syntax];`<br />`         flag ["ocaml"; "infer_interface"; "syntax_"^syntax] & S[A"-syntax"; A syntax];`<br />`       end (find_syntaxes ());`<br />`       `<br />`       (* The default "thread" tag is not compatible with ocamlfind.`<br />`          Indeed, the default rules add the "threads.cma" or "threads.cmxa"`<br />`          options when using this tag. When using the "-linkpkg" option with`<br />`          ocamlfind, this module will then be added twice on the command line.`<br />`       `<br />`          To solve this, one approach is to add the "-thread" option when using`<br />`          the "threads" package using the previous plugin.`<br />`        *)`<br />`       flag ["ocaml"; "pkg_threads"; "compile"] (S[A "-thread"]);`<br />`       flag ["ocaml"; "pkg_threads"; "link"] (S[A "-thread"]);`<br />`       flag ["ocaml"; "pkg_threads"; "infer_interface"] (S[A "-thread"])`<br />`       `<br />`   | _ -> ()`<br />`end`

### Usage
Packages to be used are supplied using the tagging system.

This plugin declares a tag "pkg_<thepackagename\>" per package \(for
instance "pkg_nums", "pkg_str" and "pkg_unix"...\).

Tag your source files with them if you want the package to be used a
compile-time, and your .byte or .native files if you want the package to
be used at link-time \(usually you'll want both\).

Example:

`# Suppose that prog.ml is the main module and`<br />`# that your project use nums and str libraries.`<br />`$ cat _tags`<br />`<*.ml> or "prog.byte": pkg_nums, pkg_str`<br />`$ ocamlbuild prog.byte --`<br />`Hello World!`

This plugin also provide a little support for the -syntax flag of
ocamlfind. However the list of syntaxes are hard listed in the
myocamlbuild.ml. Generally if you use packages that provide a syntax
extension \(like json-static\), using camlp4o will suffice to trigger the
extension.

Example:

`$ wget `[`http://martin.jambon.free.fr/yahoo.ml`](http://martin.jambon.free.fr/yahoo.ml)<br />`$ cat _tags`<br /><yahoo.\*\>`: pkg_json-static, pkg_netclient, syntax_camlp4o`<br />`$ ocamlbuild yahoo.byte -- ocaml`<br />`...`

### Summary
- Tag the files that need the "foo" package with "pkg_foo" \(sources
 and binaries\)
- Don't use the "thread" tag, use "pkg_threads" instead

## Using ocamlfind only for querying package installation directories
Maybe you do not want to invoke ocamllfind as a wrapper around the
toolchain commands \(ocamlc, etc.\). In that case, you can still invoke
ocamlfind to locate the directories in which registered packages are
installed. The "ocamlfind query pkgname" command yields the installation
directory of the command. Here is the ocamlbuild equivalent of
\\$\(ocamlfind query pkgname\) :

`let ocamlfind_query pkg =`<br />`  let cmd = Printf.sprintf "ocamlfind query %s" (Filename.quote pkg) in`<br />`  Ocamlbuild_pack.My_unix.run_and_open cmd (fun ic ->`<br />`    Log.dprintf 5 "Getting Ocaml directory from command %s" cmd;`<br />`    input_line ic)`

You can use it as follows in the After_rules section:

`ocaml_lib ~extern:true ~dir:(ocamlfind_query "sexplib") "sexplib";`

