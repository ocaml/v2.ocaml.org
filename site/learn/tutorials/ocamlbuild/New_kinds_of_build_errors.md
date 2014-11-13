<!-- ((! set title New kinds of build errors !)) ((! set learn !)) -->

# New kinds of build errors
This page describes build errors that are reported differently when
ocamlbuild is used.

## Circular build instead of unbound symbol
If you use the module name you are defining in its body, ocamlbuild will
report a circular build error instead of an unbound symbol error. For
example consider the following `a.mli` file : `<pre>
type t
val x : A.t
</pre>` If you compile with ocamlopt : `<pre>
> ocamlopt a.mli
File "a.mli", line 3, characters 8-11:
Unbound type constructor A.t
</pre>` If you use ocamlbuild : `<pre>
> ocamlbuild a.cmi
Circular build detected (a.cmi already seen in [ a.cmi ])
Compilation unsuccessful after building 1 target (1 cached) in 00:00:00.
</pre>`

## Module case naming errors
Let `mm.mli` be : `<pre>
type t
</pre>` and `a.mli` be : `<pre>
val x: MM.t
</pre>` If you compile with ocamlopt : `<pre>
> ocamlopt mm.mli
> ocamlopt a.mli 
Wrong file naming: mM.cmi contains the compiled interface for Mm
</pre>` If you use ocamlbuild : `<pre>
> ocamlbuild a.cmi
+ /usr/local/bin/ocamlc.opt -c -o a.cmi a.mli
File "a.mli", line 1, characters 8-12:
Unbound type constructor MM.t
Command exited with code 2.
Compilation unsuccessful after building 2 targets (0 cached) in 00:00:00.
</pre>`

