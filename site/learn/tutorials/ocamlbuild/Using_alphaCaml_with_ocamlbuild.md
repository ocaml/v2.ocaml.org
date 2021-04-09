<!-- ((! set title Using alphaCaml with ocamlbuild !)) ((! set learn !)) -->

# Using alphaCaml with ocamlbuild

Here is a plugin to use alphaCaml (must be written in a file
named `myocamlbuild.ml` at the root of your project):

```ocaml
open Ocamlbuild_plugin
open Command
 
let alphaCaml = A"alphaCaml"
 
let () =
  dispatch begin function
  | After_rules ->
     rule "alphaCaml: mla -> ml & mli"
          ~prods:["%.ml"; "%.mli"]
          ~dep:"%.mla"
          begin fun env _build ->
            Cmd(S[alphaCaml; P(env "%.mla")])
          end
  | _ -> ()
  end
```
  
Then one can either use ocamlfind (see [Using ocamlfind with
ocamlbuild](Using_ocamlfind_with_ocamlbuild.html)), or let
<ocamlbuild> link everything itself.

The second method can be achieved this way.

```shell
# This link should be created by your ./configure script
# The pointed directory contains the compiled files (.cmo, .cmi).
$ ln -s /path/to/your/alphaCaml/directory/ alphaLib
$ cat _tags
"alphaLib": include, precious
```

