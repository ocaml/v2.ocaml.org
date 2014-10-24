<!-- ((! set title Ocamlbuild example with C stubs !)) ((! set learn !)) -->

# Ocamlbuild example with C stubs
This example is a plugin for compiling cryptokit OCaml library.

` $ cat myocamlbuild.ml`

` open Ocamlbuild_plugin`<br />` open Command`<br />` `<br />` (* Configuration section *)`<br />` let have_zlib = "-DHAVE_ZLIB"`<br />` let zlib_lib = "-lz"`<br />` let zlib_libdir = "-L/usr/lib"`<br />` (* let zlib_libdir = "-L/usr/lib64"  (* for x86-64 Linux *) *)`<br />` let zlib_include = "-I/usr/include"`<br />` `<br />` let static = true`<br />` `<br />` (* List of headers *)`<br />` let headers =`<br />`   ["arcfour.h"; "d3des.h"; "rijndael-alg-fst.h";`<br />`    "ripemd160.h"; "sha1.h"; "sha256.h"]`<br />` `<br />` ;;`<br />` `<br />` dispatch begin function`<br />` | After_rules ->`<br />` `<br />`     (* When one make a C library that use the zlib with ocamlmklib,`<br />`        then issue these flags. *)`<br />`     flag ["ocamlmklib"; "c"; "use_zlib"]`<br />`          (S[A zlib_libdir; A zlib_lib]);`<br />` `<br />`     (* When one compile C code using the zlib *)`<br />`     flag ["c"; "compile"; "include_zlib"]`<br />`          (S[A"-ccopt"; A zlib_include; A"-ccopt"; A have_zlib]);`<br />` `<br />`     flag ["link"; "ocaml"; "library"; "use_zlib"]`<br />`          (S[A"-ccopt"; A zlib_libdir; A"-cclib"; A zlib_lib]);`<br />` `<br />``     (* If `static' is true then every ocaml link in bytecode will add -custom *)``<br />`     if static then flag ["link"; "ocaml"; "byte"] (A"-custom");`<br />` `<br />`     (* cryptokit is an ocaml library.`<br />`        This will declare use_cryptokit and include_cryptokit *)`<br />`     ocaml_lib "cryptokit";`<br />` `<br />`     flag ["link"; "library"; "ocaml"; "byte"; "use_libcryptokit"]`<br />`          (S[A"-dllib"; A"-lcryptokit"; A"-cclib"; A"-lcryptokit"]);`<br />` `<br />`     flag ["link"; "library"; "ocaml"; "native"; "use_libcryptokit"]`<br />`          (S[A"-cclib"; A"-lcryptokit"]);`<br />` `<br />`     (* When ocaml link something that use the libcryptokit,`<br />`        then one need that file to be up to date. *)`<br />`     dep  ["link"; "ocaml"; "use_libcryptokit"] ["libcryptokit.a"];`<br />` `<br />`     (* As an approximation all our C files use the headers.`<br />`        Note: This will import headers in the build directory. *)`<br />`     dep  ["compile"; "c"] headers;`<br />` | _ -> ()`<br />` end`

` $ cat _tags`

` <*.c>: include_zlib`<br />` "libcryptokit.a": use_zlib`<br />` `<cryptokit.cm{x,}a\>`: use_zlib, use_libcryptokit`<br />` <{,speed}test.{byte,native}>: use_cryptokit, use_unix, use_nums`

` $ cat libcryptokit.clib`

` rijndael-alg-fst.o stubs-aes.o`<br />` d3des.o stubs-des.o`<br />` arcfour.o stubs-arcfour.o`<br />` sha1.o stubs-sha1.o`<br />` sha256.o stubs-sha256.o`<br />` ripemd160.o stubs-ripemd160.o`<br />` stubs-md5.o`<br />` stubs-zlib.o`<br />` stubs-misc.o`<br />` stubs-rng.o`

` $ cat cryptokit.mllib`

` Cryptokit`

` # This command suffice to produce the test file.`<br />` $ ocamlbuild test.native`

` # [ ... some warnings ... ]`<br />` Finished, 26 targets (0 cached) in 00:00:04.`

` $ ocamlbuild test.native`

` Finished, 26 targets (26 cached) in 00:00:00.`

` $ ./test.native`

` # [ ... some output ... ]`<br />` `<br />` $ cat all.itarget`

` cryptokit.cma`<br />` cryptokit.cmxa`

` $ cat tests.itarget`

` test.native`<br />` speedtest.native`<br />` test.byte`<br />` speedtest.byte`

` $ ocamlbuild tests.otarget`

` # [ ... some warnings ... ]`<br />` Finished, 35 targets (26 cached) in 00:00:01.`

