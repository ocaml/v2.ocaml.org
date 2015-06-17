<!-- ((! set title 基础 !)) ((! set learn !)) -->

*Table of contents*

基础
====

注释
----

OCaml的注释是用`(*`和`*)`括起,如：

```ocaml
(* 这是一个单行的注释. *)

(* 这是一个
 * 多行
 * 的注释.
 *)
```

这和C的注释(`/* ... */`)很相似.
目前还没有象Perl中`# ...`或C99/C++/Java中`// ...`那样的单行注释方式。


OCaml中可以使用嵌套`(* ... *)`块, 因此我们可以很容易地注释掉某一块程序：

```ocaml
(* This code is broken ...

(* Primality test. *)
let is_prime n =
  (* note to self: ask about this on the mailing lists *) XXX;;

*)
```

调用函数
--------

假设你已经写好了一个函数`repeated`，它的参数是一个字符串`s`和一个数`n`，返回值是把`s`重复`n`遍形成的新字符串。

在大多数源于C的语言中，调用这一函数会象下面这样:

```c
repeated ("hello", 3)  /* this is C code */
```

这意味着“调用函数`repeated`，
输入两个参数，第一是字符串”hello“，第二是数字”3“。

OCaml和其他函数式语言一样以另外的方式来调用函数,
初学者的很多错误是因为忽视了这一点。下面是OCaml中的函数调用：

```ocaml
repeated "hello" 3  (* this is OCaml code *)
```

注意：这里**没有**括号, 参数中间**没有**逗号。

容易使人困惑的是`repeated ("hello", 3)`
在OCaml中是**合法的**的。它意味着“调用函数`repeated`，输入一个参数，这一个参数是一个含两个元素的对（‘pair'）”。这当然不符合原意，因为`repeated`函数需要的参数是两个而不是一个，而且第一个参数要求是字符串而不是对（pair）。
这里我们暂时无需知道什么是对（pair），我们只需记住用括号括起参数和用逗号分隔参数是错误的。

我们来看另一个函数`prompt_string`，它输出字符串提示，并返回一个用户输入的字符串。我们想把这个返回的字符串输入`repeated`.下面是C和OCaml的两种版本:

```C
/* C code: */
repeated (prompt_string ("Name please: "), 3)
```

```ocaml
(* OCaml code: *)
repeated (prompt_string "Name please: ") 3
```
请注意括号的不同和逗号的有无。在OCaml的版本，`prompt_string`的返回值由括号括起，作为第一个参数传入。一般情况下，规则是：“括号只括起整个函数调用，不要括起函数调用的参数。”下面是更多的例子：

```ocaml
f 5 (g "hello") 3    (* f has three arguments, g has one argument *)
f (g 3 4)            (* f has one argument, g has two arguments *)
```

<div media:type="text/omd" style="display: none">

```ocaml
let repeated (s: string) (i: int) =
  failwith "implementation not given"
```

</div>

```ocaml
repeated ("hello", 3)     (* OCaml will spot the mistake *)
```

函数定义
--------

大家应该都知道在我们已经学会的语言中怎么定义一个函数（或java中的静态方法），那么OCaml中怎么做呢？

OCaml的语法很简洁。下面是一个函数输入两个浮点数后计算它们的平均值：

```ocaml
let average a b =
  (a +. b) /. 2.0;;
```

把它输入OCaml的“toplevel”（在Unix中，在shell中输入命令`ocaml`）中后你会看到：

```ocaml
let average a b =
  (a +. b) /. 2.0;;
```

如果你仔细看这个函数定义和OCaml的回应，你会发现一些问题：

-   代码中那些运算符后多出的点号是什么？
-   `float -> float -> float`是什么意思？

我将在以后章节回答这些问题，但首先我想来用C（Java的定义和C很类似）来定义同样的函数，希望这会使大家产生更多的问题。下面是C版的`average`:

```C
double average (double a, double b)
{
  return (a + b) / 2;
}
```

现在再看上面短得多的OCaml版。可能大家会问：

-   为什么在OCaml中无需定义`a`和`b`的类型？OCaml怎么知道它们的类型？或者OCaml*是否*知道它们的类型呢?难道OCaml是完全动态类型的语言吗？
-   C中`2`隐式转换成`double`类型, 可OCaml为什么不这样做？
-   OCaml中`return`的方式是怎样?

我们来看答案：

-   OCaml是*强静态类型*的语言。（也就是说没有如perl中的动态类型）。
-   OCaml用*类型推导（type
    inference）*来找出类型，所以大家无需注明类型。如果你用上述OCaml的toplevel，那么OCaml会显示出它认为的函数类型。
-   OCaml不做任何的隐式转换。如果你需要浮点数，你必须写`2.0`,因为`2`是一个整数。OCaml*从不*执行任何自动类型转换。
-   由于type inference的副作用，OCaml不允许任何形式的重载（包括操作符重载）。它用不同的运算符来表示“两个整数相加”（用`+`）和“两个浮点数相加”（用`+.`）。注意后者有一个点号。其他算术运算符也是这样。
-   OCaml返回函数的最后的表达式值，因此我们没有必要如C中一样写`return`。

更多的细节将稍后详述。

基本类型
--------

OCaml中的基本类型是:

    OCaml 类型      范围

    int            在32位处理器上是31位有符号整数(约+/- 10亿），
                   在64位处理器上是63位有符号整数。
    float          IEEE双精度浮点数，相当于C中的double。
    bool           布尔变量，值为true或false
    char           8位字符
    string         字符串
    unit           写作()

OCaml内部使用`int`中的一位来自动管理内存（垃圾收集）。因此基本
`int`类型是31位而非32位（如果你用64位平台，那就是63位）。在实际应用中，大多数情况下这不是问题。例如在循环计数中，OCaml中只能数到10亿而不是20亿。这并不成为问题，因为如果你要很大的计数你应该使用大数模块(`Nat`和`Big_int`模块）。但如果你的应用一定需要处理32位类型（比如你要写一些加密程序或者网络协议栈），OCaml提供`nativeint`类型。

OCaml基本类型中没有提供无符号整数类型。但是你可以使用`nativeint`来达到同样效果。另外就我所知，OCaml没有单精度浮点数。

OCaml提供`char`类型来表示字符。但可惜的是`char`类型不支持Unicode或者UTF-8。这是一个需要改进的很严重的缺点。但是当前我们可以使用
[comprehensive Unicode
libraries](http://camomile.sourceforge.net/ "http://camomile.sourceforge.net/")来处理。

字符串并非只是字符的链表，它们有自己更高效的内部表示方式。

`unit`类型有点象C中的`void`类型，我们会稍后详述。

隐式转换和显式转换的比较
------------------------

在源于C的语言中，int类型在某些情况下会自动提升成浮点类型。例如你写`1 + 2.5`那么第一个参数（整数类型）会提升成浮点数，计算结果也是一个浮点数。这等价于你写了`((double) 1) + 2.5`，在这里自动执行了隐式转换。

OCaml从不执行隐式转换。在OCaml中，`1 + 2.5`犯了类型错误。操作符`+`要求两个整数作为参数，而我们这里给出了一个整数一个浮点数，因此它会报错如下：

```ocamltop
1 + 2.5;;
```

(这段错误信息是“法式英语”。意思是这里你给了浮点数但我需要整数。（“中式英语”也许可以写成“This
is float type but need int type”：））

要使两个浮点数相加，你需要用操作符`+.` （注意加号后面的点号。）

OCaml不会自动把int提升到float，因此下面这个表达式也是错误的：

```ocamltop
1 +. 2.5;;
```

这里OCaml会指出第一个参数类型是错误的。

如果我们确实需要让一个整数与一个浮点数相加该怎么办呢？（假设它们存储于变量`i`和`f`)。在OCaml中我们需要显式转换：

```ocaml
float_of_int i +. f;;
```

`float_of_int`函数输入整数为参数返回一个浮点数。与它相似，我们有一系列这样的函数：
`int_of_float`, `char_of_int`, `int_of_char`, `string_of_int`
等等，它们的作用大都象字面意思一样。

因为从`int`转换到`float`是个特别常用的操作，`float_of_int`函数有个简短的别名。上面的例子可以简单地写作：

```ocaml
float i +. f;;
```
（注意和C不一样的是，类型和函数同名在OCaml中是完全合法的。）

### 隐式转换和显式转换哪个更好？

你也许会认为显式转换减少代码美观，增加录入时间。这有一定道理，但至少有三个理由支持显式转换。首先，显
式转换帮助OCaml来实现类型推导（详后），类型推导节省的时间足以抵消多输入字符增加的时间。其次，如果你有C编程调试的经验，你应该有体会（1）隐
式转换会造成难以发现的错误，（2）找出哪里发生了隐式转换经常占用了很大一部分调试时间。第三,有些转换（特别是整型和浮点型的互换）其实是很占资源的
操作。把它们隐藏起来并没有好处。

普通函数和递归函数
------------------

和源于C的语言不同的是，OCaml中的函数一般不是递归的，除非你用`let rec`代替`let`来定义递归函数。下面是一个递归函数的例子：

```ocaml
let rec range a b =
  if a > b then []
  else a :: range (a+1) b
```

注意这里`range`调用它自身。

`let`和`let rec`的唯一区别是函数名的定义域。如果以上函数是用
`let`定义的,那么调用`range`会试图寻找一个已经存在的（以前定义）的叫
`range`的函数,而不是现在正在被定义的函数。
`let`允许你使用变量本身进行重新定义。例如：

```ocaml
let positive_sum a b = 
  let a = max a 0
  and b = max b 0 in
  a + b
```
这里`let`中的`a`和`b`重新定义了所绑定的值，因此`a + b`所看到的值是`let`所绑定的新值而不是函数的传参。在某些情况，程序员往往更倾向于这种风格，而不是`let a_pos = max a 0`，因为这样做可以使得只有最新的绑定可见。

译注：与其他函数式编程语言类似，OCaml的“变量”是不可变的，所以与其说是变量，更应该理解成是一种绑定关系。而ML衍生的语言是可以重新绑定的，而原来的值依然存在，只不过是被新绑定隐藏掉了，并不是一般面向过程语言中的变量赋值。另外，有些函数式语言使不能重新绑定（或者定义）的，如Erlang。

用`let`或`let rec`定义的函数并没有性能上的差别，所以如果你愿意你可以一直用`let rec`来定义如C中那样的函数。

函数的类型
----------

类型推导的存在使得我们几乎不需要显式的写出函数的类型。但OCaml经常显示出它认为的函数类型，因此了解有关语法还是需要的。对于一个函数`f`，其参数类型为`arg1`，`arg2`，...
`argn`，其返回值类型为 `rettype`，编译器会显示

```ocaml
f : arg1 -> arg2 -> ... -> argn -> rettype
```
箭头符号用在这里会显得很奇怪，但是当我们以后介绍了所谓"currying（科里化，维基有详述）"后，你就会明白为什么用它。现在我只是给出几个示例。

我们定义的`repeated`函数需要一个字符串和一个整数为参数，返回一个字符串。

```ocaml
repeated : string -> int -> string
```
我们定义的`average`函数输入两个浮点数并返回一个浮点数：

```ocaml
average : float -> float -> float
```
OCaml标准的类型转换函数`int_of_char`：

```ocaml
int_of_char : char -> int
```
如果一个函数没有返回值（如C或java中的`void`），那我们写成它返回`unit`类型。比如：OCaml中的等价于`fputc`的函数：

```ocaml
output_char : out_channel -> char -> unit
```

### 多态函数

现在我们来看一个比较奇怪的问题。如果一个函数的参数可以是任何类型怎么办？下面就是一个奇怪的函数，它接受任何参数但总是返回3。

```ocamltop
let give_me_a_three x = 3;;
```
那么这样的函数的类型是什么呢？OCaml使用一个特殊的占位符来表示“任意类型”，这就是一个单引号后加一个字母。
上述函数的类型可以写作：

```ocaml
give_me_a_three : 'a -> int
```
这里`'a`表示任意类型。我们可以如`give_me_a_three "foo"`这样也可以象`give_me_a_three 2.0`这样来调用这个函数。它们都是OCaml合法的表达式。

这里我们还看不出多态函数的用处，而其实它们很有用也很普遍，我们将稍后详述。（提示：多态性有些象C＋＋中的templates或者Java1.5中的generics）

类型推导
--------

本教程的主题是函数语言有很多非常酷的特性，OCaml作为函数式语言具有其所有的特性，因此它是程序员的很实用的语言。但是奇怪的是，大多数特性却与函数式编程无关。事实上在还没有介绍函数式编程为什么叫函数式之前，我已经涉及了第一个酷特性，那就是类型推导。

简单地说：你不需要声明函数和变量的类型，因为OCaml自己会知道。

而且OCaml会一直检查所有的类型匹配（甚至在不同的文件之间）。

但OCaml同时也是一个实用的语言。所以它的类型系统存在后门使你在一些特殊场合可以避开这些检查。只有资深专家才有可能需要避开类型检查。

我们再次来看`average`函数，我们在OCaml的toplevel中输入它，

```ocaml
let average a b =
  (a +. b) /. 2.0;;
```

神奇吧？OCaml自己判断出了这个函数需要两个浮点数参数和返回一个浮点数。

它是如何做到的呢？首先它看`a`和`b`在哪里使用，这里是在表达式
`(a +. b)`中。这里`+.`本身是一个需要两个浮点数参数的函数，所以通过简单推导，`a`和`b`两个都是浮点数。

其次，函数`/.`返回浮点类型，所以`average`函数同样返回浮点类型。因此，结论就是`average`的类型如下：

```ocaml
average : float -> float -> float
```
类型推导不仅适用于短程序，也适用于大规模的程序。它是一个主要的节省时间的特性，因为它消除了一系列在其他语言中常见的造成segfault，`NullPointerException`和`ClassCastException`的错误（或者是如Perl中，一些很重要但是经常被忽略的运行时警告）。
