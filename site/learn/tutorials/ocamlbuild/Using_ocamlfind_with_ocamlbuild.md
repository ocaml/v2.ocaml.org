<!-- ((! set title Using ocamlfind with ocamlbuild !)) ((! set learn !)) -->

*Table of contents*

# Using ocamlfind with ocamlbuild

There are many ways to make ocamlbuild use ocamlfind. The first section
gives the simplest one, starting from ocamlfind 3.12. The second section
gives a generic [plugin](Making_plugins.html) which replaces the
"ocamlc", "ocamldep"... commands with ocamlfind equivalents. The third
shows how to call "ocamlfind query" from a
[plugin](Making_plugins.html).

## Simple tag (from 3.12)
Starting with version 3.12, the support of *ocamlfind* is native in
*ocamlbuild*. To activate it, you need to pass the command line option
`-use-ocamlfind`. Then you can add packages in the `_tags` file with the
`package(...)` tag. Syntax extensions are enabled by requiring the
related package and using the `syntax(camlp4o)` tag. Finally ocamlfind
predicates can be activated with the `predicate(...)` tag.

```shell
# Suppose that prog.ml is the main module and
# that your project use num and str libraries.
$ cat _tags
<*.ml> or "prog.byte": package(num), package(str)
$ ocamlbuild -use-ocamlfind prog.byte --
Hello World!
```

To include sub-packages, use the doted notation

```
<*.ml>: package(lwt.unix), package(lwt.syntax), syntax(camlp4o)
"prog.byte": package(lwt.unix)
```

## Generic plugin
Here is presented a rather generic [plugin](Making_plugins.html)
to access packages using ocamlfind.

### Source

The following code should be in a file named `myocamlbuild.ml`, at the
root of your project.

```ocaml
open Ocamlbuild_plugin
(* open Command -- no longer needed for OCaml >= 3.10.2 *)`

(* these functions are not really officially exported *)
let run_and_read = Ocamlbuild_pack.My_unix.run_and_read
let blank_sep_strings = Ocamlbuild_pack.Lexers.blank_sep_strings

let split s ch =
  let x = ref [] in
  let rec go s =
    let pos = String.index s ch in
    x := (String.before s pos)::!x;
    go (String.after s (pos + 1))
  in
  try go s
  with Not_found -> !x

let split_nl s = split s '\n'

let before_space s =
  try String.before s (String.index s ' ')
  with Not_found -> s`

(* this lists all supported packages *)
let find_packages () =
  List.map before_space (split_nl & run_and_read "ocamlfind list")

(* this is supposed to list available syntaxes,
   but I don't know how to do it. *)
let find_syntaxes () = ["camlp4o"; "camlp4r"]

(* ocamlfind command *)
let ocamlfind x = S[A"ocamlfind"; x]

let _ = dispatch begin function
  | Before_options ->
     (* by using Before_options one let command line options
        have an higher priority on the contrary using After_options
        will guarantee to have the higher priority *)
     (* override default commands by ocamlfind ones *)
     Options.ocamlc     := ocamlfind & A"ocamlc";
     Options.ocamlopt   := ocamlfind & A"ocamlopt";
     Options.ocamldep   := ocamlfind & A"ocamldep";
     Options.ocamldoc   := ocamlfind & A"ocamldoc";
     Options.ocamlmktop := ocamlfind & A"ocamlmktop"

  | After_rules ->
     (* When one link an OCaml library/binary/package, one should
        use -linkpkg *)
     flag ["ocaml"; "link"; "program"] & A"-linkpkg";

     (* For each ocamlfind package one inject the -package option when
        compiling, computing dependencies, generating documentation and
        linking. *)
     List.iter begin fun pkg ->
         flag ["ocaml"; "compile";  "pkg_"^pkg] & S[A"-package"; A pkg];
         flag ["ocaml"; "ocamldep"; "pkg_"^pkg] & S[A"-package"; A pkg];
         flag ["ocaml"; "doc";      "pkg_"^pkg] & S[A"-package"; A pkg];
         flag ["ocaml"; "link";     "pkg_"^pkg] & S[A"-package"; A pkg];
         flag ["ocaml"; "infer_interface"; "pkg_"^pkg] & S[A"-package"; A pkg];
       end (find_packages ());

     (* Like -package but for extensions syntax. Morover -syntax is
        useless when linking. *)
     List.iter begin fun syntax ->
         flag ["ocaml"; "compile";  "syntax_" ^ syntax]
         & S[A"-syntax"; A syntax];
         flag ["ocaml"; "ocamldep"; "syntax_" ^ syntax]
         & S[A"-syntax"; A syntax];
         flag ["ocaml"; "doc";      "syntax_" ^ syntax]
         & S[A"-syntax"; A syntax];
         flag ["ocaml"; "infer_interface"; "syntax_" ^ syntax]
         & S[A"-syntax"; A syntax];
       end (find_syntaxes ());
       
     (* The default "thread" tag is not compatible with ocamlfind.
         Indeed, the default rules add the "threads.cma" or
         "threads.cmxa" options when using this tag. When using the
         "-linkpkg" option with ocamlfind, this module will then be
         added twice on the command line.
       
        To solve this, one approach is to add the "-thread" option
        when using the "threads" package using the previous plugin.
      *)
     flag ["ocaml"; "pkg_threads"; "compile"] (S[A "-thread"]);
     flag ["ocaml"; "pkg_threads"; "link"] (S[A "-thread"]);
     flag ["ocaml"; "pkg_threads"; "infer_interface"] (S[A "-thread"])
  | _ -> ()
end
```

### Usage
Packages to be used are supplied using the tagging system.

This plugin declares a tag `pkg_<thepackagename>` per package (for
instance `pkg_nums`, `pkg_str`, `pkg_unix`,...).

Tag your source files with them if you want the package to be used a
compile-time, and your .byte or .native files if you want the package to
be used at link-time (usually you'll want both).

Example:

```shell
# Suppose that prog.ml is the main module and
# that your project use nums and str libraries.
$ cat _tags
<*.ml> or "prog.byte": pkg_nums, pkg_str
$ ocamlbuild prog.byte --
Hello World!
```

This plugin also provide a little support for the `-syntax` flag of
ocamlfind. However the list of syntaxes are hard listed in the
`myocamlbuild.ml`.  Generally if you use packages that provide a syntax
extension (like `json-static`), using `camlp4o` will suffice to trigger the
extension.

Example:

```shell
$ wget http://martin.jambon.free.fr/yahoo.ml
$ cat _tags
<yahoo.\*\>`: pkg_json-static, pkg_netclient, syntax_camlp4o
$ ocamlbuild yahoo.byte -- ocaml
...
```

### Summary
- Tag the files that need the "foo" package with `pkg_foo` (sources
 and binaries)
- Don't use the "thread" tag, use `pkg_threads` instead.

## Using ocamlfind only for querying package installation directories
Maybe you do not want to invoke ocamllfind as a wrapper around the
toolchain commands (ocamlc, etc.). In that case, you can still invoke
ocamlfind to locate the directories in which registered packages are
installed. The "ocamlfind query pkgname" command yields the installation
directory of the command. Here is the ocamlbuild equivalent of
`$(ocamlfind query pkgname)`:

```ocaml
let ocamlfind_query pkg =
  let cmd = Printf.sprintf "ocamlfind query %s" (Filename.quote pkg) in
  Ocamlbuild_pack.My_unix.run_and_open cmd (fun ic ->
      Log.dprintf 5 "Getting Ocaml directory from command %s" cmd;
      input_line ic
    )
```
    
You can use it as follows in the After_rules section:

```
ocaml_lib ~extern:true ~dir:(ocamlfind_query "sexplib") "sexplib";
```
