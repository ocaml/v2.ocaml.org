<!-- ((! set title Ocamlbuild and module packs !)) ((! set learn !)) -->

# Ocamlbuild and module packs
The -pack option of ocamlc and ocamlopt allows you to build a module
which contains several other modules built separately. Ocamlbuild can
handle such modules.

# Basics
Let's pack the modules `Bli`, `Blo` and `Blu` together in a module `Bla`.

Write a file called `bla.mlpack`: `Bli Blo Blu`. Now ocamlbuild can compile
`bla.cmo`: `ocamlbuild bla.cmo` If you have a main file such as `main.ml`
which uses the module `Bla` (or `Bla.Bli`, `Bla.Blo` or `Bla.Blu`), you can
compile it normally, using: `ocamlbuild main.byte`.

# Native code

This time we want to compile using ocamlopt. This requires the files
`bli.cmx`, `blo.cmx` and `blu.cmx` to be compiled using the `-for-pack Bla`
option. This option is not added automatically by Ocamlbuild, so we
have to add a tag rule in the `_tags` file:
`<bl{i,o,u}.cmx>: for-pack(Bla)` Now you can compile normally, using:
`ocamlbuild main.native`.

# Packing from other directories
## No dependencies between the directories

If the files `bli.ml`, `blo.ml` and `blu.ml` are in some other directories,
just modify your `bla.mlpack` file: `otherdir1/Bli otherdir2/Blo
otherdir3/Blu`.  The `bla.mlpack` file should stay where you want the `Bla`
module to be created; you don't have to put it in the `otherdir`
directory.

Then, you can compile using: `ocamlbuild bla.cmo`.  Notice that you don't
have to include the `otherdir` directories using `-I`. This allows you to
compile your main file using: `ocamlbuild main.byte` without polluting the
namespace with modules `Bli`, `Blo` and `Blu` (which will be reached using
`Bla.Bli`, `Bla.Blo` and `Bla.Blu`).

## Solving dependencies

The previous approach doesn't work if the files `bli.ml`, `blo.ml` and
`blu.ml` depend on each other and are in different directories. Let's
assume that `blo.ml` depends on `bli.ml`. If they are in the same direcory,
there is no problem because `Blo` sees the whole content of its directory.
But if `otherdir1` and `otherdir2` are different, then you get an error
because `Bli` is unbound in `Blo`.

One solution would be to use the `-I` option: `ocamlbuild -Is
otherdir1,otherdir2,otherdir3 main.byte`. But this solution pollutes
the namespace of `main.ml` with `Bli`, `Blo` and `Blu`. If for some
reason you have another module `Bli` in your main directory, this
approach will lead to a name clash.

Another solution is to write a plugin for Ocamlbuild. In our example,
it is sufficient to say that the files in the directory `otherdir2` should
see the content of both `otherdir1` and `otherdir2`. To do this we use the
API function `Pathname.define_context`.  Write the following
`myocamlbuild.ml` in your main directory:

```ocaml
open Ocamlbuild_plugin
 
let () =
  dispatch begin function
  | After_rules ->
     Pathname.define_context "otherdir2" ["otherdir1"; "otherdir2"]
  | _ -> ()
  end
```

Now you should be able to compile, using:
`ocamlbuild main.byte`

