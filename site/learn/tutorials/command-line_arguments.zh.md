<!-- ((! set title 命令行参数 !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

命令行参数
=========

这是一个给初次编写OCaml程序且想知道命令行意义的人看的简略指南。

argv
----

与C语言一样, 传给程序的参数存在一个数组里面。按照惯例,
数组名为`argv`.它可以在标准库的`Sys`模块中找到,
因此它的全称是`Sys.argv`.包括程序名的参数,它们的个数就是此数组的长度.
它可以通过`Array.length`函数取得。

简单示例
--------

下面的程序显示Sys.argv里的参数以及它们各自在数组中的位置:

```ocaml
open Printf
  
let () =
  for i = 0 to Array.length Sys.argv - 1 do
    printf "[%i] %s\n" i Sys.argv.(i)
  done
```

如果你把上面程序存为`args.ml`,
并且运行`ocaml args.ml arg1 arg2 arg3`,你将得到:

    [0] args.ml
    [1] arg1
    [2] arg2
    [3] arg3

`ocaml` 其实是开启了一个子进程来运行这个argv是
`args.ml arg1 arg2 arg3`的程序. 你也可以用
`ocamlopt -o args args.ml`来编译你的程序，之后运行`./args arg1 arg2 arg3`,你将得到:

    [0] ./args
    [1] arg1
    [2] arg2
    [3] arg3

解析命令行选项的工具
--------------------

有一些库可以用来帮你处理命令行参数, 而不必你自己来扫描`Sys.argv` 数组:

- `Arg` 是标准库的一个模块。
- `OCaml版的Getopt` ，与[GNU
  getopt](http://www.gnu.org/software/libc/manual/html_node/Getopt.html)类似。
- [Pa_arg](http://www-personal.umich.edu/~ebreck/code/pa_arg/)库提供了一个方便的语法来定义和识别选项。
