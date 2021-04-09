<!-- ((! set title Using an external library !)) ((! set learn !)) -->

# Using an external library
Imagine you want to use *lablgl* and *lablglut* in your OCaml project. These
libraries are not currently directly known by ocamlbuild so you have to
declare them. To do so you have to write a plugin in a file
`myocamlbuild.ml` at the root of your project:

```ocaml
open Ocamlbuild_plugin
open Command
 
let () =
  dispatch begin function
  | After_rules ->
     ocaml_lib ~extern:true ~dir:"+lablGL" "lablgl";
     ocaml_lib ~extern:true ~dir:"+lablGL" "lablglut";
  | _ -> ()
  end
```
  
The `ocaml_lib` declarations are the important part of this plugin. You
can reach some documentation about this function in the
[API](http://gallium.inria.fr/~pouillar/ocamlbuild/html/Signatures.PLUGIN.html)
documentation. This declaration inform ocamlbuild and produce tags to
use the library, they are named `use_<library_name>`.

Note that the order of `ocaml_lib` calls determine the order in which
they are linked by the C compiler. In the above example, if tag
`use_lablgl` and `use_lablglut` are both used, ocamlc and ocamlopt are
linked first with `-llalblgl`, then with `-llalblglut`.

Then you have to specify programs which use these libraries, you can do
so using the `_tags` file.

```shell
$ cat _tags
# Tag things that are linked with external libraries
<main.{byte,native}>: use_lablgl, use_lablglut
# Tag also sources that use these libraries.
# This will add -I +lablGL.
# You can specify something more precise than **/*.ml
<**/*.ml>: use_lablgl
$ ocamlbuild main.byte main.native
```

That's it!

Note: that's also the case when [Using internal
libraries](Using_internal_libraries.html).

