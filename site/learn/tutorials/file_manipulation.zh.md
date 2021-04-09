<!-- ((! set title 文件操作 !)) ((! set learn !)) -->

*Table of contents*

文件操作
=======

这是一篇讲解只用OCaml标准库中提供的操作来实现基本文件操作的指南。

请看官方模块文档:[Pervasives](/releases/{{! get LATEST_OCAML_VERSION_MAIN !}}/htmlman/libref/Pervasives.html),
[Printf](/releases/{{! get LATEST_OCAML_VERSION_MAIN !}}/htmlman/libref/Printf.html).

标准库不提供可以直接读取文件成字符串或保存字符串到文件中的函数。这样的函数可以在第三方类如[Extlib](http://ocaml-lib.sourceforge.net/ "http://ocaml-lib.sourceforge.net/")找到.
请见 [Std.input_file与
Std.output_file](http://ocaml-lib.sourceforge.net/doc/Std.html "http://ocaml-lib.sourceforge.net/doc/Std.html").

缓冲通道
--------

The normal way of opening a file in OCaml returns a **channel**. There
are two kinds of channels:

-   channels that write to a file: type `out_channel`
-   channels that read from a file: type `in_channel`

### 写

For writing into a file, you would do this:

1.  Open the file to obtain an `out_channel`
2.  Write stuff to the channel
3.  If you want to force writing to the physical device, you must flush
    the channel, otherwise writing will not take place immediately.
4.  When you are done, you can close the channel. This flushes the
    channel automatically.

Commonly used functions: `open_out`, `open_out_bin`, `flush`,
`close_out`, `close_out_noerr`

Standard `out_channel`s: `stdout`, `stderr`

### 读

For reading data from a file you would do this:

1.  Open the file to obtain an `in_channel`
2.  Read characters from the channel. Reading consumes the channel, so
    if you read a character, the channel will point to the next
    character in the file.
3.  When there are no more characters to read, the `End_of_file`
    exception is raised. Often, this is where you want to close the
    channel.

Commonly used functions: `open_in`, `open_in_bin`, `close_in`,
`close_in_noerr`

Standard `in_channel`: `stdin`

### 查找

Whenever you write or read something to or from a channel, the current
position changes to the next character after what you just wrote or
read. Occasionally, you may want to skip to a particular position in the
file, or restart reading from the beginning. This is possible for
channels that point to regular files, use `seek_in` or `seek_out`.

### 注意事项

-   Don't forget to flush your `out_channel`s if you want to actually
    write something. This is particularly important if you are writing
    to non-files such as the standard output (`stdout`) or a socket.
-   Don't forget to close any unused channel, because operating systems
    have a limit on the number of files that can be opened
    simultaneously. You must catch any exception that would occur during
    the file manipulation, close the corresponding channel, and re-raise
    the exception.
-   The `Unix` module provides access to non-buffered file descriptors
    among other things. It provides standard file descriptors that have
    the same name as the corresponding standard channels: `stdin`,
    `stdout` and `stderr`. Therefore if you do `open Unix`, you may get
    type errors. If you want to be sure that you are using the `stdout`
    channel and not the `stdout` file descriptor, you can prepend it
    with the module name where it comes from: `Pervasives.stdout`. *Note
    that most things that don't seem to belong to any module actually
    belong to the `Pervasives` module, which is automatically opened.*
-   `open_out` and `open_out_bin` truncate the given file if it already
    exists! Use `open_out_gen` if you want an alternate behavior.

### 示例

```ocaml
open Printf
  
let file = "example.dat"
let message = "Hello!"
  
let () =
  (* 向文件写信息 *)
  let oc = open_out file in    (* 新建或修改文件,返回通道 *)
  fprintf oc "%s\n" message;   (* 写一些东西 *)
  close_out oc;                (* 写入并关闭通道 *)
  
  (* 读取文件并显示第一行 *)
  let ic = open_in file in
  try 
    let line = input_line ic in  (* 从输入通道读入一行并丢弃'\n'字符 *)
    print_endline line;          (* 输出结果到标准输出端 *)
    flush stdout;                (* 现在写入默认设备 *)
    close_in ic                  (* 关闭输入通道 *) 
  
  with e ->                      (* 一些不可预见的异常发生 *)
    close_in_noerr ic;           (* 紧急关闭 *)
    raise e                      (* 以出错的形式退出: 文件已关闭,但通道没有写入东西 *)
  
  (* 正常退出: 所有的通道都已写入且关闭 *)
```
