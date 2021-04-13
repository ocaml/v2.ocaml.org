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

The OCaml standard library has a module for writing command line interfaces, so
we do not have to use `Sys.argv` directly. We shall consider the example from
the OCaml documentation, a program for appending files.

First, we set up the usage message to be printed in the case of a malformed
command line, or when help is requested:

```ocaml
let usage_msg = "append [-verbose] <file1> [<file2>] ... -o <output>"
```

Now, we create some references to hold the information gathered from the
command line. The `Arg` module will fill these in for us as the command line is
read.

```ocaml
let verbose = ref false

let input_files = ref []

let output_file = ref ""
```

We have a boolean reference for the `-verbose` flag with a default value of
`false`. Then we have a reference to a list which will hold the names of all
the input files. Finally, we have a string reference into which the single
output file name specified by `-o` will be placed.

We will need a function to handle the anonymous inputs, that is to say the ones
with no flag before them. In this case these are our input file names. Our
function simply adds the file name to the reference defined earlier.

```ocaml
let anon_fun filename =
  input_files := filename :: !input_files
```

Finally we build the list of command line flag specifcations. Each is a tuple
of the flag name, the action to be taken when it is encountered, and the help
string.

```ocaml
let speclist =
  [("-verbose", Arg.Set verbose, "Output debug information");
   ("-o", Arg.Set_string output_file, "Set output file name")]
```

We have two kinds of action here: the `Arg.Set` action which sets a boolean
reference, and the `Arg.Set_string` action which sets a string reference. Our
`input_files` reference will of course be updated by the `anon_fun` function
already defined.

We can now call `Arg.parse`, giving it our specification list, anonymous
function, and usage message. Once it returns, the references will be filled
with all the information required to append our files.

```ocaml
let () =
  Arg.parse speclist anon_fun usage_msg;
  (* Main functionality here *)
```

Let's save our program as `append.ml` and compile it with `ocamlopt -o append
append.ml` and try it out:

```shell
$./append -verbose one.txt two.txt -o three.txt

$./append one.txt two.txt

$./append -quiet
./append: unknown option '-quiet'.
append [-verbose] <file1> [<file2>] ... -o <output>
  -verbose Output debug information
  -o Set output file name
  -help  Display this list of options
  --help  Display this list of options

$./append -help
append [-verbose] <file1> [<file2>] ... -o <output>
  -verbose Output debug information
  -o Set output file name
  -help  Display this list of options
  --help  Display this list of options
```

Here is the whole program:

```ocaml
let usage_msg = "append [-verbose] <file1> [<file2>] ... -o <output>"

let verbose = ref false

let input_files = ref []

let output_file = ref ""

let anon_fun filename =
  input_files := filename :: !input_files

let speclist =
  [("-verbose", Arg.Set verbose, "Output debug information");
   ("-o", Arg.Set_string output_file, "Set output file name")]

let () =
  Arg.parse speclist anon_fun usage_msg;
  (* Main functionality here *)
```

The `Arg` module has many more actions than just `Set` and `Set_string`, and
some lower-level function for parsing more complicated command lines.

## Other tools for parsing command-line options

There are libraries with facilities different from or more extensive than the
built-in `Arg` module:

* [Cmdliner](https://erratique.ch/software/cmdliner/doc/Cmdliner) is a modern
  interface for command line processing, which also generates UNIX man pages
  automatically.

* [Getopt](https://opam.ocaml.org/packages/getopt/) for OCaml is similar to
  [GNU getopt](http://www.gnu.org/software/libc/manual/html_node/Getopt.html).
