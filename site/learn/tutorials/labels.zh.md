<!-- ((! set title 标签 !)) ((! set learn !)) -->

# 标签

*Table of contents*

## 异常和哈希表
*(英文版未完成)*

## 互递归函数
如果我要让两个函数互相调用对方，虽然这不是很常见的事情（译注：比方说大部分函数式语言的REPL就是
两个函数：`apply`和`eval`的互相调用），但这可以很有用。下面是一个生造的例子（感谢Ryan Tarpine）：
0是偶数，而对于其他大于0的数字，当它前一个数是奇的，那么他是偶的。那么：

```ocamltop
let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)
```
上面的代码不会编译，因为`odd`函数还没有定义。不过这很简单，因为0不是奇的，而大于0的数是奇的，仅当它前一个数是偶的。
因此我们可以定义这个函数：

```ocamltop
let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)
  
let rec odd n =
  match n with
  | 0 -> false
  | x -> even (x-1)
```

但是还有个问题，这就是这段代码还是不会编译。因为要编译`even`，我们需要`odd`，但是`odd`
同样需要`even`，把这两个函数定义放一起也不能解决这个问题。

OCaml也没有C中的前置声明，不过有一个特殊的语法来定义这种多递归函数，如下：

```ocamltop
let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)
and odd n =
  match n with
  | 0 -> false
  | x -> even (x-1)
```
这很难知道有哪些要用到多递归的例子，因为我们从来没有这么需要，我也不能给出很好的例子（译注：
这装的...）。总之就这样，你可以用这个简单的语法来定义多递归的类定义和模块。

## 函数及其参数的别名
记得在第五章我们讲到过部分函数应用。这是一种整洁的方法来偷懒：为函数和参数起别名。

虽然我们还没有讲到面向对象，下面是一个OCamlNet的别名函数调用的例子，你只需要知道
`cgi # output # output_string "string"` 是一个函数调用，跟Java中的
`cgi.output().output_string ("string")` 类似。

```ocaml
let begin_page cgi title =
  let out = cgi # output # output_string in
  out "<html>\n";
  out "<head>\n";
  out ("<title>" ^ text title ^ "</title>\n");
  out ("<style type=\"text/css\">\n");
  out "body { background: white; color: black; }\n";
  out "</style>\n";
  out "</head>\n";
  out "<body>\n";
  out ("<h1>" ^ text title ^ "</h1>\n")
```
`let out = ... ` 是一个对那个方法的部分函数应用（这是部分，因为字符串参数还没有传入）。
`out`因而是一个接收一个字符串的函数。

```ocaml
out "<html>\n";
```
等价于：

```ocaml
cgi # output # output_string "<html>\n";
```
我们这下偷了不少懒。

我们也可以加上参数。 `print_string`也可以定义成部分函数应用：

```ocaml
let print_string = output_string stdout
```
`output_string` 接收两个参数（一个channel一个字符串），但是由于我们只给出一个，因此他是一个
部分函数应用。因此 `print_string` 是一个接收一个字符串的函数。

## 标签化和可选参数
###  标签化参数

Python有一个很好的语法就是允许标签化参数：

```python
def ask_ok(prompt, retries=4, complaint='Yes or no, please!'):
  # function definition omitted
```
下面是调用这个函数的一些方式：

```python
ask_ok ('Do you really want to quit?')
ask_ok ('Overwrite the file?', 2)
ask_ok (prompt='Are you sure?')
ask_ok (complaint='Please answer yes or no!', prompt='Are you sure?')
```
注意到Python中我们允许通过参数的名字传入值，也可以通过一般函数调用的形式，也允许我们
对可选参数带有默认值：

你也可以在Perl中做类似的事（译注：Perl是没有参数列表这种东西的，这个特性可以说是
语言本身的trick，相比Python甚不优雅）：
```perl
sub ask_ok
{
  my %params = @_;
  
  my $prompt = $params{prompt};
  my $retries = exists $params{retries} ? $params{retries} : 4;
  
  # ... etc.
}
  
ask_ok (prompt => "Are you sure?", retries => 2);
```
OCaml也可以有标签化和可选参数。基本语法是：

The basic syntax is:

```ocamltop
let rec range ~first:a ~last:b =
  if a > b then []
  else a :: range ~first:(a+1) ~last:b
```
（注意到`to`和`end`都是OCaml中的保留字，所以它们不能被用作标签。另外你也不能有
 `~from/~to` 或者`~start/~end`）。

之前`range`函数的类型是：

```ocaml
range : int -> int -> int list
```
而这个新的`range`函数的类型是：

```ocaml
range : first:int -> last:int -> int list
```
（容易让人混淆的是，`~`*不会*在类型中出现，但是你要在所有地方上用到它）。

有了标签化参数，你再也不用按顺序传入参数了：

```ocamltop
range ~first:1 ~last:10;;
range ~last:10 ~first:1;;
```
另外还有一个速写方式来命名参数，使得标签和变量名一样。下面是一个定义在
 `lablgtk/gaux.ml` 里的函数（这是一个lablgtk中用来干奇怪事情的库）：

```ocamltop
let may ~f x =
  match x with
  | None -> ()
  | Some x -> ignore(f x)
```
我们应该花点实现搞清楚这个函数在干些什么，并且手动地弄清楚这个函数的类型。首先，`~f`是
`~f:f`的简写（也就是说标签名和参数名都是`f`），然后这个函数有两个参数，其中第二个`x`是
没有标签的。OCaml允许部分参数标签化的函数。

那么`f`的类型是什么呢？显然的是它是一个函数。

那`x`的类型呢？`match`语句给出了提示，它是 `'a option`。

这告诉我们 `f` 接收一个 `'a` 参数，并且其返回值被忽略，因此它可以是任何类型。所以`f`的
类型是`'a -> 'b`。

`may` 函数返回 `unit`，因为每个`match`的分支都返回`()`。

因此`may`的类型是（你可以在toplevel中验证：

```ocaml
may : f:('a -> 'b) -> 'a option -> unit
```
这个函数是干什么的？运行它可以告诉我们些什么：

```ocamltop
may ~f:print_endline None;;
may ~f:print_endline (Some "hello");;
```
如果未标签化的参数是一个“空指针”，那么它什么也不干，否则，`f`会被调用到它上。为什么
它会有用？我们会知道的。

###  可选参数
可选参数和标签化参数类似。但是我们用`?`而不是`~`。下面是一个例子：

```ocamltop
let rec range ?(step=1) a b =
  if a > b then []
  else a :: range ~step (a+step) b
```
这个又`?`又`~`的语法比较容易让人混淆。我们会在下一节讨论这个内容。下面是你调用这个函数的方式：

```ocamltop
range 1 10;;
range 1 10 ~step:2;;
```
这里， `?(step=1)` 明显就是 `~step` 是一个可选参数，并且它的默认值是1。我们也可以忽略默认值
直接传入可选参数。下面是一个改自lablgtk的例子：

```ocamltop
type window = { mutable title: string;
                mutable width: int;
                mutable height: int }
  
let create_window () =
  { title = "none"; width = 640; height = 480; }
  
let set_title window title =
  window.title <- title
  
let set_width window width =
  window.width <- width
  
let set_height window height =
  window.height <- height
  
let open_window ?title ?width ?height () =
  let window = create_window () in
  may ~f:(set_title window) title;
  may ~f:(set_width window) width;
  may ~f:(set_height window) height;
  window
```
这个例子有点复杂难懂，不过这个模式在lablgtk的源代码中是很常见的。让我们先来看看 `create_window`。
这个函数接收一个`unit`并且返回一个`window`，并且初始化标题和宽高：

```ocamltop
create_window ();;
```
 `set_title`, `set_width` 和 `set_height` 是 `window` 的setter，是非纯的。比如说：

```ocamltop
let w = create_window () in
set_title w "My Application";
w;;
```
这里为止，都是之前提到的指令式的可变record。但是麻烦的地方是 `open_window` 函数。
这个函数接收*4*个参数，但是3个是可选的，一个`unit`是必需的。让我们来看看这个函数的调用：

```ocamltop
open_window ~title:"My Application" ();;
open_window ~title:"Clock" ~width:128 ~height:128 ();;
```
它竟然工作了！这里的原因是`may`函数，而且这些可选参数没有默认值。

当一个可选参数没有默认值的时候，它的类型是 `'a option`。
 `'a` 会被类型推导，所以这里`?title`是`string option`。

到这里`may`发挥作用了，它接受一个函数和一个参数，当参数不是`None`的时候，它会作为参数调用
那个函数，因此：

```ocaml
may ~f:(set_title window) title;
```
如果`title`没有传入，那么它就是`None`，所以`may`不会做任何事，但是假如我们：

```ocaml
open_window ~title:"My Application" ()
```

那么 `title` = `Some "My Application"`，而 `may` 会调用
`set_title window "My Application"`。

在你看下一节之前，你最好先完全弄懂这一节在说什么。

###  "Warning: This optional argument cannot be erased"
我们已经接触到了标签和可选函数，但是就算是这么短的解释也会带来很多问题。第一个可能是
为什么 `open_window` 会需要一个多余的`unit`参数？让我们来试试去掉这个参数来定义：

```ocamltop
let open_window ?title ?width ?height =
  let window = create_window () in
  may ~f:(set_title window) title;
  may ~f:(set_width window) width;
  may ~f:(set_height window) height;
  window
```
虽然OCaml编译了这个函数，但是它对`?height`产生了一个臭名昭著的警告：
 "This optional argument cannot be erased"。我们来看看调用这个函数 `open_window` 会发生什么：

```ocamltop
open_window;;
open_window ~title:"My Application";;
```
这段代码再也不工作了。实际上`open_window`根本没被调用，却打印了莫名其妙的信息，为什么呢？

回忆起 currying 和 uncurrying 和部分函数应用,比如说我们定义了`plus`函数：

```ocamltop
let plus x y =
  x + y
```
我们可以部分应用这个函数 `plus 2`，这是一个把某个数字+2的函数：

```ocamltop
let f = plus 2;;
f 5;;
f 100;;
```
在`plus`的例子，OCaml编译器可以容易地知道`plus 2`没有足够的参数，它需要另一个参数才能被执行。
所以`plus 2`无疑是一个函数（译注：从语言的角度上，科里化的函数定义是一连串的嵌套lambda表达式）。

但是随着可选参数的加入，事情就不那么清楚了。 `open_window;;` 到底是指函数本身呢，还是
准备要调用，还是说需要什么参数呢？

OCaml很小心地处理了它，并没有调用这个函数，而是把它作为函数来返回。

让我们回到原来`unit`在最后的 `open_window`的定义：

```ocamltop
let open_window ?title ?width ?height () =
  let window = create_window () in
  may ~f:(set_title window) title;
  may ~f:(set_width window) width;
  may ~f:(set_height window) height;
  window
```
如果你想传入可选参数，你必须在`unit`前传入，因而你可以：

```ocamltop
open_window ();;
```
这里你肯定是想要用缺省设置调用这个函数，而：

```ocamltop
open_window;;
```
你则是

###  更多`~`简写
让我们重写一遍`range`函数，这次我们要尽可能地用简写：

```ocamltop
let rec range ~first ~last =
  if first > last then []
  else first :: range ~first:(first+1) ~last
```
记得 `~foo` 的意思是 `~foo:foo`。这适用于函数定义和函数调用，因此这里 `~last` 是
`~last:last`的简写。

###  函数调用中的 `?foo`
可选参数还有另一个很奇葩的地方。如果我们在某个函数中调用 `open_window` 来打开应用程序：

```ocamltop
let open_application ?width ?height () =
  open_window ~title:"My Application" ~width ~height
```
 `~width` 是 `~width:width` 的意思。但
`width` 的类型是 `'a option` 而 `open_window ~width:` 需要一个 `int`。

OCaml为此提供了语法糖。在函数调用中写 `?width` 是 `~width:(unwrap width)` 的意思，
这里 `unwrap` 可以理解成是一个函数，用来去掉 `width` 的 `option` 包装（当然这只是说法上的，
实际上你不可能写出这个函数）。所以这个函数的正确定义是：

```ocamltop
let open_application ?width ?height () =
  open_window ~title:"My Application" ?width ?height
```

###  什么时候该用和不该用 `~` 和 `?`
标签和可选参数的语法想让难理解，你可能会想问什么时候用 `~foo`，什么时候用 `?foo`，
什么时候用 `foo`。实践上，这可以算是一种黑艺术。

`?foo` 只在参数声明的时候用：

```ocaml
let f ?arg1 ... =
```
或者当你想要去掉`option`包装的时候：

```ocamltop
let open_application ?width ?height () =
  open_window ~title:"My Application" ?width ?height
```
`?foo` 的声明创建了一个叫 `foo` 的变量，所以当你需要 `?foo`的值时，你用 `foo`。

标签也一样， `~foo` 出现在函数的声明:

```ocaml
let f ~foo:foo ... =
```
`~foo:foo` 的声明创建了一个叫 `foo` 的变量，所以当你需要它的值是你直接用 `foo`。

但是事情因为两个原因而变得复杂起来：1. `~foo` 简写(等价于 `~foo:foo`)和，2.你在函数
调用中使用到了这个简写。

下面是lablgtk中的一些晦涩的代码：

```ocaml
let html ?border_width ?width ?height ?packing ?show () =  (* line 1 *)
  let w = create () in
  load_empty w;
  Container.set w ?border_width ?width ?height;            (* line 4 *)
  pack_return (new html w) ~packing ~show                  (* line 5 *)
```
第一行是函数定义，注意到定义了5个可选参数，第六个参数 `unit`是必需的。每个可选参数都定义
了一个变量，比如 `border_width` 的类型是 `'a option`。

第四行我们以 `?foo` 的形式向函数调用传入了可选传入。 `Container.set` 有下面这个类型：

```ocaml
module Container = struct
  let set ?border_width ?(width = -2) ?(height = -2) w =
    (* ... *)
```
第五行用的是 `~` 简写，展开如下：

```ocaml
pack_return (new html w) ~packing:packing ~show:show
```
 `pack_return` 传入了以 `~packing` 和 `~show` 传入了标签化参数，他们的类型都是
`'a option`。也就是说`pack_return` 手动去掉了 `option` 的包装。

###  附录
如果你觉得标签和可选参数很复杂，没错，他们就这么复杂。不过幸运的是，这是比较新的特性，
除了lablgtk以外基本不太可能看到它们的用法。

## 多态变体
试一下编译下面的代码：

```C
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

enum lock { open, close };

main ()
{
  int fd, n;
  char buffer[256];

  fd = open ("/etc/motd", O_RDONLY);                     // line 12
  while ((n = read (fd, buffer, sizeof buffer)) > 0)
    write (1, buffer, n);
  close (fd);                                            // line 15
}
```
当我编译这段代码的时候我有如下的错误：

```text
test.c: In function `main':
test.c:12: error: called object is not a function
test.c:15: error: called object is not a function
```

译注：我的gcc 4.7.2报错不太一样：
```
test2.c:5:13: error: ‘open’ redeclared as different kind of symbol
In file included from test2.c:2:0:
/usr/include/fcntl.h:119:12: note: previous declaration of ‘open’ was here
test2.c:5:19: error: ‘close’ redeclared as different kind of symbol
In file included from test2.c:3:0:
/usr/include/unistd.h:350:12: note: previous declaration of ‘close’ was here
test2.c: In function ‘main’:
test2.c:12:16: error: called object ‘0’ is not a function
test2.c:15:13: error: called object ‘1’ is not a function
```
实际上原著的报错不太合理，因为`lock`在尝试重新定义已经声明的符号。这有可能是比较老的编译器的行为。

这里展示了C的enum的一个问题，在这里，一个enum语句用到了三个符号，分别是
`lock`, `open` 和 `close`.。下面是另一个例子：

```C
enum lock { open, close };
enum door { open, close };
```
报错为：

```text
test.c:2: error: conflicting types for `open'
test.c:1: error: previous declaration of `open'
test.c:2: error: conflicting types for `close'
test.c:1: error: previous declaration of `close'
```
第一个enum定义了 `open` 是一个
`enum lock`，你不能用它来定义其它东西。

C/C++程序员对这很清楚，因此他们不会写这样的代码。但是OCaml也有类似的问题，但是它
用另一个方式来解决。

下面是OCaml的代码，而且是可以编译的：

```ocamltop
type lock = Open | Close
type door = Open | Close
```
在这两个代码之后，`Open`是什么类型呢？这很容易在toplevel中找到答案：

```ocamltop
type lock = Open | Close;;
type door = Open | Close;;
Open;;
```
OCaml会用最新的 `Open`，也就是`door`。这也不是什么很大的问题，因为如果你在`lock`的
上下文处用了`Open`，你的代码不可能通过类型推导的。

目前为止，这和C比较类似。现在我要告诉你OCaml提供了一种方式来绕开`Open`只有一种类型的限制。
也就是说，当我用到 `Open` 的时候，OCaml应该自己去搞清楚我需要的是
`lock` 版本的还是 `door` 版本的。

实现的语法有点不一样:

```ocamltop
type lock = [ `Open | `Close ];;
type door = [ `Open | `Close ];;
```
注意到这个语法不同的地方：

1. 变体的名字有一个 `` ` `` （反引号）
1. 你要用方括号括住子类型。

那么问题自然就变成了：`` `Open`` 究竟是什么类型？

```ocamltop
`Open;;
```
`` [> `Open] `` 可以读作
`` [ `Open | 和一些我们不知道的可能性 ] ``.
大于号的意思是这个可能性比所列出的要多（译注：这段话太模糊了，Java码农可以试一下类比PECS。C#码农
可以类比covariance 和 contravariance ，泛型声明的+-号。在这个特定的例子，这可以理解为“至少包含`` `Open ``
constructor的某个类型”。本质上，这些设计都是为了克服语言类型系统
本身的限制。现在流行语言的类型系统往往都是sound但不是complete的，因此虽然它返回的结果总是正确的，
但却会对一些我们觉得是正确的类型关系上报错，虽然有些关系在人类语义上是成立的，但是类型分析未必可以理解。
举个例子，比方说`Generic<Base> var = new Generic<Derived>();`就会报错。
而一些比较简单的语言的选择是放弃这种经典的静态类型系统而采用动态类型，如Python。深入理解请参考计算机语言，编译器，自动机相关书籍）。

 `` `Open `` 本身并没有什么特别的。 *任何* 带反引号的单词都可以用作类型，包括一些我们之前没有提到过的：

```ocamltop
`Foo;;
`Foo 42;;
```
让我们来编写一个打印 `lock` 状态的函数：

```ocamltop
let print_lock st =
  match st with
  | `Open -> print_endline "The lock is open"
  | `Close -> print_endline "The lock is closed"
```
注意看这个函数的类型，类型推导知道`st`参数的类型是 `` [< `Close | `Open] ``。
这个小于号是指这个类型是一个 __关闭的类__。 也就是说这个函数只会应用到 `` `Close`` 或者 `` `Open``
上而不能是其他。
```ocamltop
print_lock `Open;;
```

译者补充例子：请先参照我上面的注加深一下对类型系统的理解。这里的小于号是由于`match`语句
必须匹配所有情况这个特点推导出的。聪明的读者应该已经可以举一反三，知道如何把这个
小于号变成大于号：
```ocamltop
let print_lock2 st =
  match st with
  | `Open -> "open"
  | `Close -> "close"
  | _ -> "abc";;
print_lock2 `A;;
```


注意到`print_lock`对于 `door` 和`lock` 一样工作！我们已经一定程度上地放弃了类型推导，
只用来猜测我们的意图，而不是趋使我们写类型正确的代码。

这只是一个简介。由于类型安全会被降低，因此你最好还是别用。但是你有机会在一些高级的OCaml代码中
看到这个用法，因为一个高手往往不希望被彻底束缚。

