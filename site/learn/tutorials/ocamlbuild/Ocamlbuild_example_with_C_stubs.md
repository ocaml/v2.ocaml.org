<!-- ((! set title Ocamlbuild example with C stubs !)) ((! set learn !)) -->

# Ocamlbuild example with C stubs

This example is a plugin for compiling cryptokit OCaml library (to be
put in a file named `myocamlbuild.ml` at the root of your project).

```ocaml
open Ocamlbuild_plugin
open Command
 
(* Configuration section *)
let have_zlib = "-DHAVE_ZLIB"
let zlib_lib = "-lz"
let zlib_libdir = "-L/usr/lib"
(* let zlib_libdir = "-L/usr/lib64"  (* for x86-64 Linux *) *)
let zlib_include = "-I/usr/include"
 
let static = true
 
(* List of headers *)
let headers =
  ["arcfour.h"; "d3des.h"; "rijndael-alg-fst.h";
   "ripemd160.h"; "sha1.h"; "sha256.h"]
 
let () = 
 dispatch begin function
 | After_rules ->
    (* When one make a C library that use the zlib with ocamlmklib,
       then issue these flags. *)
    flag ["ocamlmklib"; "c"; "use_zlib"]
         (S[A zlib_libdir; A zlib_lib]);
 
    (* When one compile C code using the zlib *)
    flag ["c"; "compile"; "include_zlib"]
         (S[A"-ccopt"; A zlib_include; A"-ccopt"; A have_zlib]);
 
    flag ["link"; "ocaml"; "library"; "use_zlib"]
         (S[A"-ccopt"; A zlib_libdir; A"-cclib"; A zlib_lib]);
 
    (* If `static' is true then every ocaml link in bytecode
       will add -custom *)`
    if static then flag ["link"; "ocaml"; "byte"] (A"-custom");
 
    (* cryptokit is an ocaml library.
       This will declare use_cryptokit and include_cryptokit *)
    ocaml_lib "cryptokit";
 
    flag ["link"; "library"; "ocaml"; "byte"; "use_libcryptokit"]
         (S[A"-dllib"; A"-lcryptokit"; A"-cclib"; A"-lcryptokit"]);
 
    flag ["link"; "library"; "ocaml"; "native"; "use_libcryptokit"]
         (S[A"-cclib"; A"-lcryptokit"]);
 
    (* When ocaml link something that use the libcryptokit,
       then one need that file to be up to date. *)
    dep ["link"; "ocaml"; "use_libcryptokit"] ["libcryptokit.a"];
 
    (* As an approximation all our C files use the headers.
       Note: This will import headers in the build directory. *)
    dep  ["compile"; "c"] headers;
  | _ -> ()
  end
```

```shell
$ cat _tags
<*.c>: include_zlib
"libcryptokit.a": use_zlib
<cryptokit.cm{x,}a>: use_zlib, use_libcryptokit
<{,speed}test.{byte,native}>: use_cryptokit, use_unix, use_nums
$ cat libcryptokit.clib
rijndael-alg-fst.o stubs-aes.o
d3des.o stubs-des.o
arcfour.o stubs-arcfour.o
sha1.o stubs-sha1.o
sha256.o stubs-sha256.o
ripemd160.o stubs-ripemd160.o
stubs-md5.o
stubs-zlib.o
stubs-misc.o
stubs-rng.o`
$ cat cryptokit.mllib
Cryptokit
# This command suffice to produce the test file.
$ ocamlbuild test.native
# [ ... some warnings ... ]
Finished, 26 targets (0 cached) in 00:00:04.
$ ocamlbuild test.native
Finished, 26 targets (26 cached) in 00:00:00.
$ ./test.native
# [ ... some output ... ]
$ cat all.itarget
cryptokit.cma
cryptokit.cmxa
$ cat tests.itarget
test.native
speedtest.native
test.byte
speedtest.byte
$ ocamlbuild tests.otarget
# [ ... some warnings ... ]
Finished, 35 targets (26 cached) in 00:00:01.
```

