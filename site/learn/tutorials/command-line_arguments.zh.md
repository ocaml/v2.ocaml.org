<!-- ((! set title 命令行参数 !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

命令行参数
=========

在这篇教程中，我们将学习如何直接使用 OCaml 的 `Sys.argv` 数列来接受命令行参数，
以及如何使用标准库中的 `Arg` 模块来更简单地完成这件事。

Sys.argv
----

与 C 语言和很多其它语言一样一样，传给程序的参数存在一个数组里面。按照惯例，
数组名为 `argv` 。它可以在标准库的 `Sys` 模块中找到，
因此它的全称是 `Sys.argv` 。此数组的长度就是加上程序名本身的命令行参数的个数。
它可以通过 `Array.length` 函数取得。


下面的程序显示 `Sys.argv` 里的参数以及它们各自在数组中的位置：

```ocaml
for i = 0 to Array.length Sys.argv - 1 do
  Printf.printf "[%i] %s\n" i Sys.argv.(i)
done
```

如果你把上面程序存为 `args.ml` ，
并且执行 `ocaml args.ml arg1 arg2 arg3` ，你将看到:

    [0] args.ml
    [1] arg1
    [2] arg2
    [3] arg3

需要注意的是，`ocaml` 其实是开启了一个子进程来运行这个 argv 是 `args.ml arg1 arg2 arg3` 的程序。
你也可以用 `ocamlopt -o args args.ml` 来编译你的程序，
之后运行 `./args arg1 arg2 arg3`，你将得到:

    [0] ./args
    [1] arg1
    [2] arg2
    [3] arg3


使用 Arg 模块
----

Ocaml 的标准库中有一个用来编写命令行界面的模块，所以我们不需要直接使用 `Sys.argv`。
我们应考虑的例子是 OCaml 文档中一个用来附加文件的程序。

首先，我们编写程序的使用说明，以在格式不正确的命令行参数被接收或（用户）提请帮助时显示：

```ocaml
let usage_msg = "append [-verbose] <file1> [<file2>] ... -o <output>"
```

接下来，我们创建一些用于接收命令行传来的信息（命令行参数）的引用。 `Arg` 模块将会在命令行被读入时替我们填上它们：

```ocaml
let verbose = ref false

let input_files = ref []

let output_file = ref ""
```

我们有一个布尔型的引用来表示 `-verbose` 是否被打开，它的默认值是 `false`。
然后我们有一个指向列表的引用，它将保存所有输入文件的名称。
最后，我们有一个字符串引用，由 `-o` 指定的单一输出文件名将被放入其中。

我们需要一个函数来处理匿名输入，也就是说，那些前面没有标志（译注：即这些参数是 positional arguments，非 keyword arguments）的（字符串）。
在这种情况下，这些是我们的输入文件名。
我们的函数只是将文件名添加到前面定义的引用中。

```ocaml
let anon_fun filename =
  input_files := filename :: !input_files
```

最终，我们建立一个命令行标志指定的列表。每个标志都是一个由标志名称、遇到它时要采取的行动和帮助字符串组成的元组。

```ocaml
let speclist =
  [("-verbose", Arg.Set verbose, "Output debug information");
   ("-o", Arg.Set_string output_file, "Set output file name")]
```

在这里有两种可能操作：`Arg.Set` 设置一个布尔引用，而 `Arg.Set_string` 设置一个字符串引用。
我们的 `input_files` 引用自然会被已经定义的 `anon_fun` 函数所更新。

我们现在可以调用 `Arg.parse` ，给它提供我们的指定的操作列表、匿名函数和使用信息。
一旦它（完成，成功）返回，之前定义的引用内将被填入所有需要附加我们文件的信息。

```ocaml
let () =
  Arg.parse speclist anon_fun usage_msg;
  (* Main functionality here *)
```

让我们把我们的程序保存为 `append.ml`，然后用 `ocamlopt -o append append.ml` 编译它，并试着运行：

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

这是完整的程序：

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

`Arg` 模块除了 `Set` 和 `Set_string` 之外还有许多操作，还有一些底层函数用于解析更复杂的命令行。


其它用于解析命令行选项的工具
--------------------

这里是一些与内置的 `Arg` 模块提供的工具不同或是更丰富的库：

* [Cmdliner](https://erratique.ch/software/cmdliner/doc/Cmdliner) 是一个用于命令行处理的现代化接口，
  同时也能自动生成 UNIX man pages。

* [Clap](https://opam.ocaml.org/packages/clap/) 是一个命令式的命令行解析器。

* [Minicli](https://opam.ocaml.org/packages/minicli/) 对格式不正确的命令行有较好的抵抗能力（不接受），与之相比其它的可能会静默接受（不报错）。

* 用于 Ocaml 的 [Getopt](https://opam.ocaml.org/packages/getopt/) 与 
  [GNU getopt](http://www.gnu.org/software/libc/manual/html_node/Getopt.html) 类似。
