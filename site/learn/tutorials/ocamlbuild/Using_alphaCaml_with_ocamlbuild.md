# Using alphaCaml with ocamlbuild
Here is a plugin to use alphaCaml:

`$ cat myocamlbuild.ml`<br />`open Ocamlbuild_plugin;;`<br />`open Command;;`

`let alphaCaml = A"alphaCaml";;`

`dispatch begin function`<br />`  | After_rules ->`<br />`      rule "alphaCaml: mla -> ml & mli"`<br />`        ~prods:["%.ml"; "%.mli"]`<br />`        ~dep:"%.mla"`<br />`      begin fun env _build ->`<br />`        Cmd(S[alphaCaml; P(env "%.mla")])`<br />`      end`<br />`  | _ -> ()`<br />`end`

Then one can either use ocamlfind \(see [Using ocamlfind with
ocamlbuild](Using_ocamlfind_with_ocamlbuild.html)\), or let
<ocamlbuild\> link everything itself.

The second method can be achieved this way.

`# This link should be created by your ./configure script`<br />`# The pointed directory contains the compiled files (.cmo, .cmi).`<br />`$ ln -s /path/to/your/alphaCaml/directory/ alphaLib`

`$ cat _tags`<br />`"alphaLib": include, precious`

