<!-- ((! set title Tags !)) ((! set learn !)) -->

# Tags
## Tagging files
To tag files, use the "_tags" file. See the [user
manual](http://gallium.inria.fr/~pouillar/ocamlbuild/ocamlbuild-user-guide.html)
for more details. You can also use the "tag_file" function in a
[plugin](Making_plugins.html) or use the "-tag" option.

Note that some tags, such as "link", are not applied to files but are
instead part of certain commands. See the [solver
mechanism](Solver_mechanism.html) for more details.

## Tag documentation
If you need more information about a specific tag, use the
"-documentation" option of <Ocamlbuild\>. For example, for the "thread"
tag: \\$ ocamlbuild -documentation | grep thread flag {. byte, link,
ocaml, program, thread .} "threads.cma -thread" flag {. link, native,
ocaml, program, thread .} "threads.cmxa -thread" flag {. doc, ocaml,
thread .} "-I +threads" flag {. compile, ocaml, thread .} "-thread" For
example, the last flag says that files with tags "compile", "ocaml" and
"thread" should be compiled using the "-thread" option. The first flag
says that files with tags "byte", "ocaml" and "thread", used in commands
that have tags "link" and "program", should use the threads library and
the "-thread" option.

You can also know the tags of a file using the "-show-tag" option of
<Ocamlbuild\>: \\$ ocamlbuild -show-tags test.byte Tags for "test.byte":
{. byte, extension:byte, <file:test.byte\>, ocaml, program, quiet .}
Finished, 0 targets \(0 cached\) in 00:00:00\. \\$ ocamlbuild -show-tags
test.ml Tags for "test.ml": {. extension:ml, <file:test.ml\>, ocaml,
quiet .} Finished, 0 targets \(0 cached\) in 00:00:00.

Unfortunately, to get the full semantics of a tag, you need to know in
which commands \(more precisely, which "holes"\) it appears. Some tags are
always part of some commands: the "link" tag is always part of the
linking commands. Some commands use the tags of their sources and / or
the tags of their production. The only precise documentation is the
<Ocamlbuild\> source code.

## List of tags
This list is far from exhaustive. Feel free to extend it!

To get an intuition on the use of the tag, descriptions start with:

- *This produced file...*: rules usually add this tag to their command
 if one of their production has it.
- *This source file...*: rules usually add this tag to their command
 if one of their dependency has it.
- *This command...*: rules usually add this tag to their command
 regardless of the tags of its dependencies and productions.
- *This file...*, *This directory...*: other uses.

### A
#### annot
This source file should be compiled with the -annot flag to produce a
.annot file.

### B
#### byte
This produced file is compiled and linked using the bytecode compiler.

#### bin_annot
This source file should be compiled with the -bin-annot flag to produce
a .cmt[i] file \(since 4.01\).

### C
#### compile
This command is a compilation operation.

### D
#### debug
This produced file should be compiled in debug mode. For OCaml this
means using the "-g" option.

#### dtypes
Dump detailed type information for this file. For OCaml this means
using the "-dtypes" option.

From 3.11, deprecated, use annot instead.

### I
#### include
This directory should be included, as if the "-I" option were used.

#### infer_interface
This command infers an interface to generate a .inferred.mli from a .ml
file. An example of use can be found in the [Ocamlfind
plugin](Using_ocamlfind_with_ocamlbuild.html).

### L
#### link
This command is a link operation.

#### library
This file is a library. By default, \*.cma and \*.cmxa have this tag.

### N
#### native
This produced file is compiled and linked using ocamlopt.

#### not_hygienic
This file is not hygienic but won't be scanned by the sanity check.

### O
#### ocaml
This source file is an OCaml source file, or this produced file is
produced using an OCaml tool, or this command is an OCaml-related
command.

### P
#### precious
This file is precious and won't be deleted by the sanity check.

#### program
This file is a program. By default, \*.byte and \*.native have this
tags.

### T
#### thread
This source file uses the Thread module. It is compiled and linked using
the "-thread" option, and linked to the threads library.

### U
#### use_bigarray, use_dbm, use_dynlink, use_graphics, use_nums, use_str, use_toplevel, use_unix
This produced file should be linked with the specified library. This can
replace the "-lib" command line option.


