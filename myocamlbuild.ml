(* OASIS_START *)
(* OASIS_STOP *)

let env = BaseEnvLight.load() (* setup.data *)

let has_compiler_libs =
  try
    Scanf.sscanf (BaseEnvLight.var_get "ocaml_version" env)
                 "%i" (fun maj -> maj >= 4)
  with _ -> false

let my_dispatch = function
  | After_rules ->
     if has_compiler_libs then
       (* <src/app/*.ml{,i}>: pkg_compiler-libs.toplevel *)
       let files = ["src/app/code.cmo"; "src/app/code.cmx";
                    "src/app/build.byte"; "src/app/build.native"] in
       List.iter (fun f -> tag_file f ["pkg_compiler-libs.toplevel"]) files
     else (
       ocaml_lib ~extern:true "toplevellib";
       tag_file "src/app/build.byte" ["use_toplevellib"];
     )
  | _ -> ()

let () =
  Ocamlbuild_plugin.dispatch (MyOCamlbuildBase.dispatch_combine
                                [ dispatch_default; my_dispatch])
