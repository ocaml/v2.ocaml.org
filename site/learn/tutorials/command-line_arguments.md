<!-- ((! set title Command-line arguments !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Command-line arguments

In this tutorial we learn how to read command line arguments directly, using
OCaml's `Sys.argv` array, and then how to do so more easily using the standard
library's `Arg` module.

## Sys.argv

Like in C and many other languages, the arguments that are passed to a given
program on the command line are stored in an array. Following tradition, this
array is named `argv`. It is found in the `Sys` module of the standard library,
therefore its full name is `Sys.argv`. The number of arguments including the
name of the program itself is simply the length of the array. It is obtained
using the `Array.length` function.

The following program displays the arguments with their position in `Sys.argv`:

```ocaml
for i = 0 to Array.length Sys.argv - 1 do
  Printf.printf "[%i] %s\n" i Sys.argv.(i)
done
```

If you save the program above as `args.ml`, and run `ocaml args.ml arg1 arg2
arg3`, here is what you get:

```
[0] args.ml
[1] arg1
[2] arg2
[3] arg3
```

Note that `ocaml` launched a subprocess that actually runs the program where
argv is `args.ml arg1 arg2 arg3`. You can also compile your program using
`ocamlopt -o args args.ml`, and then running `./args arg1 arg2 arg3` and you
will get:

```
[0] ./args
[1] arg1
[2] arg2
[3] arg3
```

## Using the Arg module


## Other tools for parsing command-line options

There are libraries with facilities different from or more extensive than the
built-in `Arg` module:

* [Cmdliner](https://erratique.ch/software/cmdliner/doc/Cmdliner) is a modern
  interface for command line processing, which also generates UNIX man pages
  automatically.

* [Getopt](https://opam.ocaml.org/packages/getopt/) for OCaml is similar to
  [GNU getopt](http://www.gnu.org/software/libc/manual/html_node/Getopt.html).
