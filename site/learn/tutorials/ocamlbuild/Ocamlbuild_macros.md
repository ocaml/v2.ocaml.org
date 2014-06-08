# Ocamlbuild macros
## OCamlbuild with macro preprocessing
To enable the use of the Camlp4 INCLUDE macro facility, one has to
create a plugin that records the dependence of the sources w.r.t. the
included file.

Here is an example where the source file \(source.ml\) and the included
file \(other.ml\) are in the src/ directory.

*myocamlbuild.ml*

` open Ocamlbuild_plugin`<br />` `<br />` let () =`<br />`   dispatch begin function`<br />`   | After_rules ->`<br />`     let includes = ["src/other.ml"] in`<br />`     dep ["ocaml"; "ocamldep"] includes;`<br />`     dep ["ocaml"; "compile"] includes;`<br />` `<br />`     let pp_src = S[A"-pp"; A"camlp4of -Isrc"] in`<br />`     flag ["ocaml"; "ocamldep"] & pp_src;`<br />`     flag ["ocaml"; "compile"] & pp_src;`<br />` `<br />`   | _ -> ()`<br />`   end`

*src/source.ml*

` INCLUDE "other.ml"`

*src/other.ml*

` let f x = x + 1`<br />` `<br />` let () = print_endline "here."`

