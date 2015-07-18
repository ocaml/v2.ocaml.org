<!-- ((! set title C stub functions !)) ((! set learn !)) -->

# C stub functions

```ocaml
(* Ocamlbuild plugin *)
 
open Ocamlbuild_pack
open Ocamlbuild_plugin
open Command
open Ocaml_specific
open Outcome
 
module Config32 = struct
  let bits64 = false
end
 
module Config64 = struct
  let bits64 = true
end
 
open Config64;
 
let ocaml_local_dir =
  try
    Sys.getenv "OCAMLDIR"
  with Not_found ->
    failwith "OCAMLDIR environment variable must be set; usually that's \
              the directory where, for instance, camlinternalMod reside."
 
let local dir = Filename.concat ocaml_local_dir dir
 
type libdep_description = {
  ld_name : string;
  ld_have_lib : string option;
  ld_lib : string;
  ld_dir : string;
  ld_include : string;
  ld_static : bool;
  ld_c_headers : string list
}
 
type ocaml_lib_description = {
  od_path : string;
  od_name : string;
  od_headers : string list
}
 
let system_lib_dir =
  if bits64 then "/usr/lib64" else "/usr/lib"
 
let zlib_description = {
    ld_name = "zlib";
    ld_have_lib = Some "-DHAVE_ZLIB";
    ld_lib = "-lz";
    ld_dir = "-L" ^ system_lib_dir;
    ld_include = "-L/usr/include";
    ld_c_headers = [];
    ld_static = true
  }
 
let clibdep ld =
  (* When one makes a C library that use the zlib with ocamlmklib,
     then issue these flags. *)
  flag ["ocamlmklib"; "c"; "use_"^ld.ld_name]
       (S[A ld.ld_dir; A ld.ld_lib]);
 
  (* When one compiles C code using the zlib *)
  flag ["c"; "compile"; "include_"^ld.ld_name]
       (S[A"-ccopt"; A ld.ld_include;
          begin match ld.ld_have_lib with
          | None -> N
          | Some x -> S[A"-ccopt"; A x]
          end]);
 
  flag ["link"; "ocaml"; "library"; "use_"^ld.ld_name]
       (S[A"-ccopt"; A ld.ld_dir; A"-cclib"; A ld.ld_lib]);
 
  (* If `static' is true then every ocaml link in bytecode will add -custom *)
  if ld.ld_static then flag ["link"; "ocaml"; "byte"] (A"-custom")
 
let cryptokit_lib_description = {
    od_path = "";
    od_name = "cryptokit";
    od_headers = ["arcfour.h"; "d3des.h"; "rijndael-alg-fst.h";
                  "ripemd160.h"; "sha1.h"; "sha256.h"]
  }
 
let float32_lib_description = {
    od_path = "float32/";
    od_name = "float32";
    od_headers = []
 }

(* XXX : fix me *)
let ocamllib old =
  let u = old.od_name in
  (* X is an ocaml library.
     This will declare use_X and include_X *)
  ocaml_lib u;
 
  flag ["link"; "library"; "ocaml"; "byte"; "use_"^u]
       (S[A"-dllpath";A(old.od_path);A"-dllib";A("-l"^u);
          A"-cclib";A("-L"^old.od_path);A"-cclib";A("-l"^u)]);
 
  flag ["link"; "ocaml"; "byte"; "use_"^u]
       (S[A"-dllpath";A(old.od_path);A"-dllib";A("-l"^u);
          A"-cclib";A("-L"^old.od_path);A"-cclib";A("-l"^u)]);
 
  flag ["link"; "library"; "ocaml"; "native"; "use_lib"^u]
       (S[A"-cclib";A("-L"^old.od_path);A"-cclib"; A("-l"^u)]);
 
  (* When ocaml link something that use the libX
     then one need that file to be up to date. *)
  dep ["link"; "ocaml"; "use_lib"^u] [old.od_path^"lib"^u^".a"];
 
  (* As an approximation all our C files use the headers.
     Note: This will import headers in the build directory. *)
  dep  ["compile"; "c"] old.od_headers;

let () =
  dispatch begin function
  | After_options ->
     begin
       Options.hygiene := true;
       Options.sanitize := true;
       Options.ocamlopt := A"ocamlopt.opt";
       Options.ocamlc := A"ocamlc.opt";
       Options.ocamldep := A"ocamldep.opt";
       Options.ocamlyacc := A "menhir";
       Options.include_dirs :=
         ["graph"; "util"; "float32"; "mysubdir1"; "mysubdir2"]
         @ !Options.include_dirs
     end
  | After_rules ->
     begin
       List.iter
         begin fun dir ->
           flag ["ocaml"; "link"]    (S[A"-I"; A dir]);
           flag ["ocaml"; "compile"] (S[A"-I"; A dir]);
           flag ["ocaml"; "doc"]     (S[A"-I"; A dir])
         end
         [(* "+pcre"; *)
          local "mysubdir1";
          local "mysubdir2"];
 
       Log.dprintf 5 "Ready";
         
       ocamllib float32_lib_description;
       flag ["ocaml"; "link"; "byte"; "use_float32"]
            (S[A"-dllpath";A"float32";A"-dllib"; A"-lfloat32"]);*)
     end
  | _ -> ()
  end
```

