<!-- ((! set title Command-line arguments !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Command-line arguments
This is a short tutorial for those who are writing their first OCaml
program and are wondering how to read arguments that are passed on the
command line.

## argv
Like in the C programming language, the arguments that are passed to a
given program are stored in an array. Following the tradition, this
array is named `argv`. It is found in the `Sys` module of the standard
library, therefore its full name is `Sys.argv`. The number of arguments
including the name of the program itself is simply the length of the
array. It is obtained using the `Array.length` function.

## Simple example
The following program displays the arguments with their position in
`Sys.argv`:

```ocaml
let () =
  for i = 0 to Array.length Sys.argv - 1 do
    Printf.printf "[%i] %s\n" i Sys.argv.(i)
  done
```
If you save the program above as `args.ml`, and run
`ocaml args.ml arg1 arg2 arg3`, here is what you get:

    [0] args.ml
    [1] arg1
    [2] arg2
    [3] arg3

Note that `ocaml` launched a subprocess that actually runs the program
where argv is `args.ml arg1 arg2 arg3`. You can also compile your
program using `ocamlopt -o args args.ml`, and then run
`./args arg1 arg2 arg3` and you will get:

    [0] ./args
    [1] arg1
    [2] arg2
    [3] arg3

## Tools for parsing command-line options
There are libraries that let you process command-line arguments
without having to scan the `Sys.argv` array yourself:

* `Arg` is a module of the standard library.
* [Getopt](https://opam.ocaml.org/packages/getopt/)
  for OCaml is similar to [GNU
  getopt](http://www.gnu.org/software/libc/manual/html_node/Getopt.html).

<div class="bottom-navigation">
<a href = "introduction_to_gtk.html" class="previous">« Introduction to Gtk</a><a href="file_manipulation.html" class="next">File Manipulation »</a>
</div>