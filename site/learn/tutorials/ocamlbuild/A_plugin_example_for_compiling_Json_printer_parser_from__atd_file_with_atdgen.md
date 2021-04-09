<!-- ((! set title An atdgen plugin example !)) ((! set learn !)) -->

# A plugin example for compiling Json printer/parser from .atd file with atdgen

```ocaml
open Ocamlbuild_plugin
open Command

let () =
  Options.use_ocamlfind := true;
  Options.make_links:= false

let atdgen_rules () = 
 let tag_atdgen env patterns =
   List.iter (fun p ->
       tag_file (env p) (Tags.elements (Tags.of_list ["package(atdgen)"]))
     ) patterns in
 rule "atdgen: .atd -> _t.ml*"
    ~prods:["%_t.ml";"%_t.mli"]
    ~dep:"%.atd"
    (begin fun env build ->
      let atdgen = "atdgen" in
      tag_atdgen env ["%_t.ml";"%_t.mli"];
      Cmd (S [A atdgen; A "-t"; P (env "%.atd")]);
     end) ;
  rule "atdgen: .atd -> _j.ml*"
    ~prods:["%_j.ml";"%_j.mli";]
    ~dep:"%.atd"
    (begin fun env build ->
      let atdgen = "atdgen" in
      tag_atdgen env ["%_j.ml"; "%_j.mli"];
      Cmd (S [A atdgen; A "-j"; A "-j-std"; P (env "%.atd")]);
     end) ;
  rule "atdgen: .atd -> _v.ml*"
    ~prods:["%_v.ml";"%_v.mli";]
    ~dep:"%.atd"
    (begin fun env build ->
      let atdgen = "atdgen" in
      tag_atdgen env ["%_v.ml";"%_v.mli";];
      Cmd (S [A atdgen; A "-v"; P (env "%.atd")]);
     end) ;
  ()

let () =
  dispatch begin function
  | After_rules -> atdgen_rules ()
  | _ -> ()
  end
```

and add tag `package(atdgen)` into the `_tags` file:

```
<{files that use Yojson or Atd library}.{ml,mli,byte,native}>:package(atdgen)
```
