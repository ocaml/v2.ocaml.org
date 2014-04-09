<!-- ((! set title Null Pointers, Asserts and Warnings !)) ((! set learn !)) -->

*Table of contents*

# 空指针，断言和警告

## 空指针
你的网站上有一个问卷调查，询问读者的名字和年龄。唯一的问题是有一些读者因为某些原因不想给你他们的年龄，他们很顽固，就是拒绝填写那个字段。一个不好的数据库管理员会做什么？

假设年龄用一个`int`来表示，可能有两种方法来解决这个问题。最普通的一个（也是最*错误*的一个）是假定某个特殊的值来表示年龄信息没有收集到。比如说 age = -1 就表示没有年龄数据，否则表示有年龄数据（即使数据是无效的）。这种方法可以用，但是当你开始，比如计算网站访问者的平均年龄的时候就有问题了。你忘记把你假定的特殊值考虑进去，你计算出来访问者的平均年龄是7½，你聘来web设计师删掉了所有长单词，并且所有地方使用基本颜色。

另一种方法是正确的方法，就是把年龄存储在一个 “int or null” 类型的字段中。这是一个用来存储年龄的SQL表：
```SQL
create table users
(
  userid serial,
  name text not null,
  age int             -- may be null
);
```

如果年龄数据没有收集到，年龄在数据库里面就是一个特殊的 SQL `NULL`值，在计算平均数等值的时候 SQL 会自动忽略它。

编程语言也支持空值，虽然有些编程语言会比其他的更容易一些。在 Perl 中，任何标量（即数字或字符串）可以是`undef`（Perl中空值的表示方法）。这是很多经常被缺乏经验的程序员忽略的警告的一个原因，尽管这些警告可能表示严重的错误。在 Java 中，任何对象的引用也可以为空，所以在 Java 中年龄被存储成一个`Integer`并且允许年龄是`null`就容易理解了。在 C 中指针当然也可以为空，但是如果你想要一个简单的整型为空，你得首先把它装箱成一个在堆上用`malloc`分配内存的对象。

OCaml有一个优雅的方法来解决空值的问题，就是一个这样定义的简单的多型变体（在`Pervasives`中）：
```ocaml
type 'a option = None | Some of 'a
```

一个“空指针”写成`None`。我们上面例子（一个可以为空的`int`）中年龄的类型是`int option`（记住：像 `int list`和`int binary_tree`）。

```ocamltop
Some 3
```
option整数的列表是什么样呢？

```ocamltop
[ None; Some 3; Some 6; None ]
```

整数列表的option是什么样呢？

```ocamltop
Some [1; 2; 3]
```
## 断言，警告，致命错误和打印到stderr
Perl的一个优秀特性是丰富的调试程序和处理意外错误的命令集，包括打印堆栈跟踪信息，抛出和捕捉异常及类似的东西。OCaml没有这样丰富的调试命令 - 比 Java 要好，和 C 差不多吧，但是不像 Perl 中那么好。（我们将稍后更详细的说一说异常。）

首先，`assert`接受一个表达式作为参数，并且抛出一个异常。假设你不去捕捉这个异常（捕捉这个异常或许不是明智的，特别对于初学者来说），程序的结果是会停止并且打印出源文件和错误发生的行号。举个例子：
```ocamltop
assert (Sys.os_type = "Win32")
```
（在 Win32 上面跑当然不会抛出异常）。

如果事情不顺利，你也可以调用`assert false`来停止你的程序，但是更好的是用……

`failwith "error message"`来抛出一个`Failure`异常，这里又要假设你不尝试去捕捉它，这个异常将会停止你的程序，给出错误消息。`failwith`在模式匹配中经常使用，像这个实例：
```ocaml
match Sys.os_type with
| "Unix" | "Cygwin" ->   (* code omitted *)
| "Win32" ->             (* code omitted *)
| "MacOS" ->             (* code omitted *)
| _ -> failwith "this system is not supported"
```

注意到在这个例子中有一组额外的模式匹配。一种叫做“range pattern”的用来匹配“Unix”和“Cygwin”其中之一。还有一种特殊的“_”模式来匹配剩下的任意情况。

如果你要调试你的程序，但是就像我一样，你会对调试器产生厌恶，因为不是gdb。然后你或许要通过你的函数打印出警告。这儿有一个例子：

```ocaml
open Graphics
  
let () =
  open_graph " 640x480";
  for i = 12 downto 1 do
    let radius = i * 20 in
    prerr_endline ("radius is " ^ string_of_int radius);
    set_color (if i mod 2 = 0 then red else yellow);
    fill_circle 320 240 radius
  done;
  read_line ()
```

如果你喜欢 C 风格的`printf`，可以尝试用 OCaml 的`Printf`模块代替：
```ocaml
open Graphics
open Printf
  
let () =
  open_graph " 640x480";
  for i = 12 downto 1 do
    let radius = i * 20 in
    eprintf "radius is %d\n" radius;
    set_color (if i mod 2 = 0 then red else yellow);
    fill_circle 320 240 radius
  done;
  read_line ()
```
