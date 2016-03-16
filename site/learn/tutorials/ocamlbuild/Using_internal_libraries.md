<!-- ((! set title Using internal libraries !)) ((! set learn !)) -->

# Using internal libraries
Using internal libraries is almost the same thing that [Using an
external library](Using_an_external_library.html).

```
+-+- A/
| +- a.mllib
| +- a1.ml
| +- ...
| +- aN.ml
|
+-+- B/
| +- b.mllib
| +- b1.ml
| +- ...
| +- bN.ml
|
+-+- Main/
  +- main.ml (depending on a.cma and b.cma)
```

The simplest thing to do is to let ocamlbuild build things without using
libraries:

```shell
ocamlbuild -Is A,B Main/main.byte
```

But here your mllib's are not used.

If you want to use them as libraries you need a small `myocamlbuild.ml`
like:

```ocaml
open Ocamlbuild_plugin

let () =
  dispatch begin function
  | After_rules ->
     ocaml_lib "A/a";
     ocaml_lib "B/b"
  | _ -> ()
  end
```

And to tag your files:

```shell
$ cat _tags
# tells that main uses a and b libs
<Main/main.{byte,native}>: use_a, use_b
# this will avoid the need of command line options to ocamlbuild
"A" or "B": include
```

Finally just run:

```shell
$ ocamlbuild Main/main.byte
```

