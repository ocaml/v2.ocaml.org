<!-- ((! set title Modules !)) ((! set learn !)) -->

*Table of contents*

# 模块

## 基本用法
在OCaml中，每一段代码都被包成一个模块。一个模块可以选择性地作为另外一个模块的子模块，很像文件系统中的目录-但是我们不经常这样做。

当你写一个程序使用两个文件`amodule.ml`和`bmodule.ml`，它们中的每一个都自动定义一个模块，名字叫`Amodule`和`Bmodule`，模块的内容就是你写到文件中的东西。

这里是文件`amodule.ml`里面的代码：

```ocaml
let hello () = print_endline "Hello"
```

还有`bmodule.ml`里面的：

```ocaml
Amodule.hello ()
```

通常文件一个一个编译，让我们来编译：

```shell
ocamlopt -c amodule.ml
ocamlopt -c bmodule.ml
ocamlopt -o hello amodule.cmx bmodule.cmx
```

现在我们有一个很好的可执行文件用来打印 “Hello”。如你所见，如果你要访问一个给定模块的任何东西，你要用模块的名字（通常是大写字母开头）后面跟一个点号，然后是你要用的东西。可能是一个值，一个类型构造器，或者是给定模块能提供的任何东西。

程序库，从标准库开始，提供模块的集合。比如，`List.iter`指定`List`模块中的`iter`函数。
好了，如果你正在重度使用一个给定的模块，你可以使这个模块的内容直接可以访问。要实现这个，我们要使用`open`指令。在我们的例子中，`bmodule.ml`可以写成这样：

```ocaml
open Amodule;;
hello ();;
```

注意，人们倾向于避免使用丑陋的“;;”，所以这样写更加普遍：

```ocaml
open Amodule
let () =
  hello ()
```

不管怎样，用不用`open`是个人品味的问题。一些模块提供在很多其他模块中使用的名字。`List`模块就是这样的例子。通常我们不用`open List`。像`Printf`的其他模块，提供通常不受冲突的名字，比如`printf`。为了避免到处写`Printf.printf`，在文件开头放一句`open Printf`是有道理的。

有一个简短的例子描述我们刚刚提到的（在toplevel中）。
```ocamltop
open Printf
let my_data = [ "a"; "beautiful"; "day" ]
let () = List.iter (fun s -> printf "%s\n" s) my_data
```
## 接口和签名
一个模块可以给使用它的剩余程序提供若干东西（函数，类型，子模块，……）。如果没有什么特别指定，在模块中定义的一切可以从外部访问。这样在小的个人程序中是一般可以的，但是在很多情况下，一个模块只提供它想要给出来的会更好，不要有任何内部使用的辅助的函数和类型。

要实现这个我们得定义模块接口，接口就像罩在模块实现上的面具。就像模块从 .ml 文件得到，相应的模块接口或者叫签名从 .mli 文件得到。它包含了一个带有类型的值的列表，以及更多东西。让我们重写`amodule.ml`文件。

```ocamltop
let message = "Hello"
let hello () = print_endline message
```
事实上，`Amodule`有下面的接口：
```ocaml
val message : string
val hello : unit -> unit
```

假设直接访问`message`和其他模块没有关系，我们要定义一个严格的接口来隐藏它。这是我们的`amodule.mli`文件。

```ocaml
val hello : unit -> unit
(** 显示一句问候消息。 *)
```
(注意，使用[ocamldoc](http://caml.inria.fr/pub/docs/manual-ocaml/ocamldoc.html)支持的格式来写 .mli 文件的文档是个好习惯。)

.mli 文件必须在对应的 .ml 文件之前编译。它们用`ocamlc`来编译，就算 .ml 文件用`ocamlopt`来编译成原生码。

```shell
ocamlc -c amodule.mli
ocamlopt -c amodule.ml
...
```
## 抽象类型
类型定义是怎么样的呢？我们看到像函数这样的值可以采用把它们的名字和类型放到 .mli 文件的方式来导出。

```ocaml
val hello : unit -> unit
```
但是模块经常定义新的类型。让我们来定义一个简单的record类型，用来表达一个日期。

```ocaml
type date = { day : int;  month : int;  year : int }
```

当要写 .mli 文件的时候有四种选择，而不是两种:
1. 类型在签名中完全忽略
2. 类型定义复制拷贝到签名
3. 类型做成抽象的：只给出名字
4. record的域做成只读的：`type date = private { ... }`

在第3种情况中，应该是下面代码这样：

```ocaml
type date
```

现在，这个模块的用户能操作`date`类型的对象，但是他们不能直接访问record的域，他们必须使用模块提供的函数。假设这个模块提供三个函数，一个用来创建一个日期，一个用来计算两个日期之间的间隔，还有一个用年的形式返回一个日期。

```ocaml
type date
val create : ?days:int -> ?months:int -> ?years:int -> unit -> date
val sub : date -> date -> date
val years : date -> float
```

只有`create`和`sub`才能用来创建`date`record。因此，这个模块的用户不可能创建不规范的record。实际上，我们的实现使用record，但是我们可以修改它，并且确保不破坏任何依赖这个模块的代码！这在一个库中很重要，同一个库之后的版本能够暴露同样的接口，同时可以内部改变实现，包括数据结构。

## 子模块

###  模块实现

我们看到`example.ml`文件自动实现`Example`模块。模块签名是自动得到的并且是最广泛的，或者可以写一个`example.mli`文件来约束它。

这就是说，一个给定的模块也可以在一个文件中显式地定义，这样就作为当前模块的一个子模块。让我们来看看`example.ml`文件：

```ocaml
module Hello = struct
  let message = "Hello"
  let hello () = print_endline message
end
let goodbye () = print_endline "Goodbye"
let hello_goodbye () =
  Hello.hello ();
  goodbye ()
```

从另一个文件中可以看出，很明显我们有两个层次的模块。我们可以这样写：

```ocaml
let () =
  Example.Hello.hello ();
  Example.goodbye ()
```

###  子模块接口

我们可以约束一个给定子模块的接口，这叫做模块类型。我们在`example.ml`文件中做一下：

```ocaml
module Hello : sig
 val hello : unit -> unit
end = 
struct
  let message = "Hello"
  let hello () = print_endline message
end
  
(* 在这里 Hello.message 不再能被访问。 *)
let goodbye () = print_endline "Goodbye"
let hello_goodbye () =
  Hello.hello ();
  goodbye ()
```

上面`Hello`模块的定义和一对`hello.mli`/`hello.ml`文件是等价的。把所有东西写在一个代码块里面是不优雅的，所以一般我们选择单独定义模块签名。

```ocaml
module type Hello_type = sig
 val hello : unit -> unit
end
  
module Hello : Hello_type = struct
  ...
end
```

`Hello_type`是一个命名的模块类型，并且可以重用，用来定义其他的模块接口。

虽然子模块在一些情况下可能有用，但是它们和函子一起用的时候效果比较明显。这个下一部分讲。

## 函子
函子可能是OCaml中最复杂的特性之一，但是你想成为一个成功的OCaml程序员不需要大量地使用函子。实际上，你可能从来不用自己定义一个函子，不过你确实会在标准库中遇到它们。函子是使用 Set 和 Map 模块的唯一途径，不过使用它们并不困难。

###  什么是函子，为什么需要它们？
函子是用另一个模块来参数化的模块，就像函数是用其他的值，也就是参数，来参数化的值一样。

基本上，函子允许用一个值来参数化一个类型，这个在OCaml中直接做是不可能地。比如说，我们可以定义一个函子接受一个整数 n，返回一个数组操作的集合，这些操作只能用在长度为 n 的数组上。如果程序员犯错误，把一个常规的数组传给这些操作中的一个，这样会造成编译错误。如果我们不是使用这个函子，而是标准数组类型，编译器就不能识别出错误，我们将在未来不确定时刻得到运行时错误，这样会更加糟糕。

###  怎么使用现存的函子？
标准库定义了`Set`模块，它提供了一个`Make`函子。这个函子接受一个参数，这个参数是一个提供两样东西的模块：用`t`来给出的元素类型，和用`compare`给出的比较函数。这个函子的重点是即使程序员犯错误也确保同样的比较函数总是被使用。

举个例子，如果我们要使用整型的集合，我们将会这样做：
```ocamltop
module Int_set = Set.Make (struct
                             type t = int
                             let compare = compare
                           end)
```

对于字符串的集合甚至更简单，因为标准库提供一个`String`模块，有一个类型`t`和一个函数`compare`。如果你仔细地看下来的话，到现在你肯定会猜怎么去创建一个用来操作字符串集合的模块。

```ocamltop
module String_set = Set.Make (String)
```
(圆括号是必须的)

###  怎么定义函子？
带有一个参数的函子可以这样来定义：

```ocaml
module F (X : X_type) = struct
  ...
end
```

`X`是作为参数被传递的模块，`X_type`是它的签名，这个是强制的。

返回模块的签名是可以被约束的，使用这样的语法：

```ocaml
module F (X : X_type) : Y_type =
struct
  ...
end
```

或者在`.mli`文件中指定：

```ocaml
module F (X : X_type) : Y_type
```

一般来说，函子的语法理解起来比较困难。最好的方法可能是去看标准库中的源代码`set.ml`和`map.ml`。

Final remark: functors are made to help programmers write correct
programs, not to improve performance. There is even a runtime penalty,
unless you use a defunctorizer such as ocamldefun, which requires access
to the source code of the functor.
结束语：函子是用来帮助程序员写出正确的程序的，而不是用来提高性能的，甚至会有运行时的损耗，除非使用像 ocamldefun 这样的解函器，ocamldefun 需要访问函子的源代码。

## 模块实际操作

###  显示模块接口
在`ocaml`的 toplevel 中，下面的技巧可以让一个现存的模块的内容可视化，比如`List`：

```ocamltop
module M = List;;
```

不然，对于大多数的库有在线的文档，或者你可以使用 labltk（Ocaml的Tk图形用户界面） 做的`ocamlbrowser`。

###  模块包含
如果我们觉得在标准的`List`模块中缺少一个函数，但是如果里面有我们确实需要它。在文件`extensions.ml`中，我们可以用`include`指令来实现这个效果。

```ocamltop
module List = struct
  include List
  let rec optmap f = function
    | [] -> []
    | hd :: tl ->
       match f hd with
       | None -> optmap f tl
       | Some x -> x :: optmap f tl
end
```

它创建了`Extensions.List`模块，这个模块有标准的`List`模块的所有东西，加上一个新的`optmap`函数。从另一个文件看，要覆盖默认的`List`模块我们所要做的只是在 .ml 文件的开头`open Extensions`

```ocaml
open Extensions
...
List.optmap ...
```
