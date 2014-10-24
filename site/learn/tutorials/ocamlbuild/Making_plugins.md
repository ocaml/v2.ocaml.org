# Making plugins
## Getting started
An OCamlbuild plugin is a single Ocaml file, named "myocamlbuild.ml",
which must be in the root directory of your project. Before building any
target, this file will be compiled, linked to and executed by
OCamlbuild. This means that your plugin will have access to some parts
of OCamlbuild, namely the [plugin
API](http://gallium.inria.fr/~pouillar/ocamlbuild/html/Signatures.PLUGIN.html).

### Hello, world!
Before actually using the API, let's show that the plugin is indeed
executed by OCamlbuild. Write a simple myocamlbuild.ml such as:

```
print_string "Hello, world!\n"
```

Now execute OCamlbuild. You should
get something like this:

```
$ ocamlbuild 00:00:00 1 \(0 \) myocamlbuild
\-------- /H ello, world!
```

This shows that your plugin has been compiled,
and then executed. Now if you run OCamlbuild again, you get:

```
$ ocamlbuild Hello, world!
```

Indeed, OCamlbuild will only compile your
plugin when needed.

### The dispatch function
The "dispatch" function is the most important function of the
[API](http://gallium.inria.fr/~pouillar/ocamlbuild/html/Signatures.PLUGIN.html).
It allows you to control *when* your code will be executed. In practice,
it takes a function as an argument and executes it with a different
parameter at the beginning and at the end of the following stages:

- hygiene \(checking that the source tree is clean\),
- options \(parsing the command line options\),
- rules \(adding the default rules to the system\).

For demonstration purposes, try the following plugin, which prints the
value of the "-ocamlc" option before, and after the "options" stage:

```
open Ocamlbuild_plugin;; (* open the main API module *)

dispatch begin function
  | Before_options ->
      Printf.printf "Before options, the -ocamlc option is set to %s.\n"
	(Command.string_of_command_spec !Options.ocamlc)
  | After_options ->
      Printf.printf "After options, The -ocamlc option is set to %s.\n"
	(Command.string_of_command_spec !Options.ocamlc)
  | _ -> ()
end
```

Now if you run Ocamlbuild, you can see when the option is applied:

```
$ ocamlbuild -ocamlc bla
Before options, the -ocamlc option is set to <virtual OCAMLC>.
After options, The -ocamlc option is set to bla.
```

Usually, you will want your code to be executed after the "rules" stage
\(i.e., using the After_rules hook\). But for some needs, you will use
other hooks, for instance:

- Before_options: to change the default value of some options
- After_options: to enforce the value of some options
- Before_hygiene: to tag or untag some files as precious or non
 hygienic

## Basic operations
To start slowly, let's see how to write a plugin which does what you can
do *without* a plugin. This will allow us to better understand how
plugins are plugged into OCamlbuild.

### Change options
You can use a plugin to set the value of an OCamlbuild option such as
"-no-hygiene" or "-ocamlc". This way you won't have to write the option
everytime on the command line.

To set an option, simply set the option reference. All these references
are defined in the
[Options](http://gallium.inria.fr/~pouillar/ocamlbuild/html/Signatures.OPTIONS.html)
module of the API.

Remember that if you change the reference Before_options, the value set
in your plugin can still be overriden by the command line. If you want
to force the value of an option you have to do it After_options. See
the example in the previous section.

### Manage tags
Your plugin can replace your _tags file\(s\). Indeed, a plugin can read
or change the tags of a file. This is usually done After_rules.

#### List the tags of a file
To list the tags of a file, use the API function tags_of_pathname. For
example, a useful debugging function might be:

```
let print_info f =
  Format.fprintf Format.std_formatter
    "@[<hv 2>Tags for file %s:@ %a@]@." f
    Tags.print (tags_of_pathname f)
```

#### Tag a file
To add tags to a file, use the API function tag_file. For example, to
tag the file "bla.ml" with the tag "use_unix":

```
tag_file "bla.ml" ["use\_unix"]
```

#### Untag a file
To remove tags from a file, use the same API tag_file with a minus
before the tag's name. For example, to remove the tag "use_unix" from
the file "bla.ml":

```
tag_file "bla.ml" ["-use\_unix"]
```

#### Example
If you dispatch the following code after the rules \(After_rules\):

```
print_info "bla.ml";
tag_file "bla.ml" ["test"];
print_info "bla.ml";
tag_file "bla.ml" ["-test"; "-ocaml"];
print_info "bla.ml";
```

You will get the following result:

```
Tags for file bla.ml:
  extension:ml, file:bla.ml, ocaml, quiet, traverse, use_graph, use_nums,
  use_str, use_unix
Tags for file bla.ml:
  extension:ml, file:bla.ml, ocaml, quiet, test, traverse, use_graph,
  use_nums, use_str, use_unix
Tags for file bla.ml:
  extension:ml, file:bla.ml, quiet, traverse, use_graph, use_nums, use_str,
  use_unix
```

### Declare libraries
If you don't like to use the "-lib" option, you can write a plugin which
will use your libraries automatically.

#### Standard libraries
Libraries such as unix, num, str or bigarray are already declared in
OCamlbuild, so all you have to do is tag your files using "use_unix",
"use_num" and so on using the tag_file API.

#### Other libraries
See [Using an external library](Using_an_external_library.html) if
your libraries are installed, or [Using internal
libraries](Using_internal_libraries.html) otherwise. You might
also prefer [Using ocamlfind with
ocamlbuild](Using_ocamlfind_with_ocamlbuild.html).

## Advanced operations
These operations cannot be done without a plugin. Because one cannot
imagine everything you'll want to do, you might not find exactly what
you need here. Be sure to read the [API
documentation](http://gallium.inria.fr/~pouillar/ocamlbuild/html/Signatures.PLUGIN.html),
to experiment with stuff and, why not, to read the OCamlbuild source.

### Add or modify rules
Before reading this section, be sure you understand the [solver
mechanism](Solver_mechanism.html).

#### Rules
Once you know how rules are handled by OCamlbuild, all you have to
know is that adding a rule is done using the "rule" function of the
[API](http://gallium.inria.fr/~pouillar/ocamlbuild/html/Signatures.PLUGIN.html).

Usually, all you have to do is call the "rule" function with these
arguments:

- The name of the rule. It should be unique. This is the name that
 appears when using the "-documentation" or "-verbose" options.
- \\~dep: the dependency \(use \\~deps if there are more than 1\)
- \\~prod: the production \(use \\~prods if there are more than 1\)
- The action of the rule, i.e. a function which returns the command to
 use to produce the productions. This command may have holes \(see the
 T constructor of type
 [Command.spec](http://gallium.inria.fr/~pouillar/ocamlbuild/html/Signatures.COMMAND.html)\).

##### File names
The \\~deps and \\~prod parameters don't have to be exact path names. For
example, with \\~dep="%.ml" and \\~prod="%.byte", you can produce
"bla.byte" from "bla.ml", or "foo.byte" from "foo.ml", or... If you need
more than one % you can use %\(name\) where name is any identifier. For
example, the file "why.not.ml" matches the pattern "%\(bla\).%\(foo\).ml"
with %\(bla\)=why and %\(foo\)=not.

The action of the rules takes two arguments. The first one is usually
called "env" and is used to replace your % in a string. For example,
with the previous example, env "%\(foo\).%\(bla\).plop" returns
"not.why.plop".

##### Commands
Your action returns a command \(see module
[Command](http://gallium.inria.fr/~pouillar/ocamlbuild/html/Signatures.COMMAND.html)\)
which should build the productions of the rule.

There are some pre-defined commands in the
[Ocamlbuild_plugin](http://gallium.inria.fr/~pouillar/ocamlbuild/html/Signatures.PLUGIN.html)
module, such as usual Unix commands \(cp, mv, ...\).

Commands may come with tag holes that will be filled depending on the
tags. For instance:

```
let ml = env "%.ml" in Cmd\(S[ocamlc; A "-c";
T(tags\_of\_pathname ml++"ocaml"++"compile"++"byte"); A ml]\)
```

Usually, the executed command will be \(if env "%.ml" = "bla.ml"\):

```
ocamlc -c bla.ml
```

But say the file "bla.ml" is tagged with "thread". There is a
flag rule which says that the tags "ocaml", "compile" and "thread"
together should produce the "-thread" option. In this case, the executed
command becomes:

```
ocamlc -c -thread bla.ml
```

##### Dynamic dependencies
The second argument of the action is usually called "build" and is used
to build new dependencies that you couldn't write in the \\~deps
parameter. It takes a conjunction of alternative targets. For instance,
build \[["a"; "b"]; \["c"]] will try to build two targets: "a" and "c", or
"b" and "c".

The value returned by "build" tells you which files have been built. For
instance, build \[["a"; "b"]; \["c"]] may return \[Good "a"; Bad exn]. This
means that "a" have been built, but that "c" couldn't be built. You
should raise the "exn" exception if you can't do without "c".

The
[Outcome](http://gallium.inria.fr/~pouillar/ocamlbuild/html/Signatures.OUTCOME.html)
module has some handy functions to help you with the return values of
"build".

##### Examples

-   [A plugin example for compiling
    LaTeX](A_plugin_example_for_compiling_LaTeX.html)
-   [Using alphaCaml with
    ocamlbuild](Using_alphaCaml_with_ocamlbuild.html)

#### Tags and flags

You can also use the "dep" and "flag" functions. The "dep" function
allows you to automatically build some dependencies when a file is
tagged with some given tags, and the "flag" function allows you to
associate command options with tags (to fill the holes of a command).
For instance, here is how to declare that tags "ocaml", "compile" and
"thread" should become "-thread":

```
flag ["ocaml"; "compile"; "thread"] (A "-thread")
```

Examples:

-   [A plugin for camlp4 syntax extension (pa
    openin)](A_plugin_for_camlp4_syntax_extension__pa_openin_.html)

### Link external modules with your plugin

There is no direct support to link external modules with your plugin.
For now the only way to achieve this is to invoke ocamlbuild as follows
(the example uses the Str module) :

```
ocamlbuild -ocamlc 'ocamlc str.cma' -ocamlopt 'ocamlopt str.cmxa'
```
