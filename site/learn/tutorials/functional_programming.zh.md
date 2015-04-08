<!-- ((! set title 函数式编程 !)) ((! set learn !)) -->

*Table of contents*

函数式编程
=========

什么是函数式编程
----------------

到现在我们已经讲了很多了，但还没有真正涉及到**函数式编程**。
目前所讲的所有特性 - 丰富的数据类型（rich data types），
模式匹配（pattern matching）， 类型推导（type inference），
嵌套函数（nested functions） -
可以想象它们都可以在一种”超级C“语言中存在。这些特性当然很酷，它们使得代码简洁易读，减少bug，但是它们实际和函数式编程没什么关系。实际上我的
观点是函数式编程语言的妙处*不是*在于函数式编程，而是因为在我们长年习惯于类C语言编程的时候，编程技术已经提高很多了。因此当我们一次又一次地写`struct { int type; union { ... } }`的时候，ML和Haskell程序员却有着很多安全的变量和数据类型的模式匹配。当我们小心翼翼地
`free`所有的`malloc`时候，很多语言在上世纪八十年代就有了超越手工管理的内存垃圾收集器。

好了，现在是时候告诉你们什么是函数式编程了。

基本的但不是很能说明问题的定义是在**函数式语言中**,
**函数（functions）**是一等公民。

听上去不是很有用，让我们来看个例子。

```ocamltop
let double x = x * 2 in
List.map double [ 1; 2; 3 ]
```
在这个例子中，我首先定义了一个嵌套函数`double`，它读入一个参数`x`后返回`x * 2`。然后`map`在给定的列表(`[1; 2; 3]`)的每个元素上调用`double`来生成结果：一个每个数都扩大一倍的新的列表。

`map`被称为**高阶函数（higher-order function）**
(HOF)。高阶函数是指一个把其他函数作为参数之一的函数。

到现在为止还算简单。如果你对C/C++熟悉的，这就象传递一个函数指针作为参数。Java中有匿名类(anonymous
class)就象一个低速的闭包（closure）。如果你知道Perl那么你可能已经知道和使用了Perl中的闭包和Perl的`map`函数，这和我们现在所说的完全相同。事实上Perl很大程度上也是一个函数式语言。

**闭包**是那些带着它们被定义时的环境的函数。特别的，一个闭包可以引用它定义时存在的变量。让我们把上面那个函数变得更通用一些，以便我们可以对任何整数列表乘以一个任意值`n`:

```ocamltop
let multiply n list =
  let f x =
    n * x in
  List.map f list
```

因此:

```ocamltop
multiply 2 [1; 2; 3];;
multiply 5 [1; 2; 3];;
```

关于`multiply`函数有一点值得注意的是嵌套函数`f`.
这是一个闭包。我们注意一下`f`怎样使用变量`n`的值，我们并没有把`n`作为显式的参数传递给它。`f`是从它的环境中找到它的。`n`是传递给函数`multiply`的参数，所以在这个函数中都是有效的。

这可能听上去很简单，但让我们更进一步的仔细观察下那个对map的调用`List.map f list`.

` map` 的定义在`List`模块中，离当前的代码很远。也就是说，我们把`f`
传递到一个”很久很久以前，在一个很遥远很遥远的星系“（译者：星球大战片头）中的一个模块。
代码可以传递`f`给其他模块，或者把它的引用（reference）在某个地方以便之后
再调用它。不管怎样，这个闭包保证`f`总是可以获取它定义时的环境，比如`n`。

这里是一个来自lablgtk的真实的例子。实际上这是一个类方法（我们还没有谈到类和对象，暂时
可以把它看作一个函数定义。）

```ocaml
class html_skel obj = object (self)
  ...
  ...
  method save_to_channel chan =
    let receiver_fn content =
      output_string chan content;
      true in
    save obj receiver_fn
  ...
end
```

首先你要知道的是方法最好调用的`save`函数的第二个参数是一个函数(`receiver_fn`)。它带着从widget获取的文字重复调用`receiver_fn`函数。

现在来看`receiver_fn`的定义。这个函数是一个闭包，因为它含有一个引用,
这个因用指向它的环境中的`chan`。

## 部分函数应用（Partial function applications）和 currying（科里化）

让我们定义一个加法函数用来相加两个整数。

```ocamltop
let plus a b =
  a + b
```

这里是给前面上课时睡着的朋友的几个问题。

1.  什么是`plus`?
2.  什么是`plus 2 3`?
3.  什么是`plus 2`?

问题一很简单。`plus`是一个函数。它有两个整数型参数并返回一个整数。我们这样来表示这个函数的类型：

```ocaml
plus : int -> int -> int
```

问题二就更简单了。`plus 2 3`是一个数，整数`5`。我们这样来表示它的类型：

```ocaml
5 : int
```

但是问题三呢？看上去`plus 2`是一个错误。但是实际上却不是的。如果我们在OCaml的
toplevel中输入上述代码，toplevel会显示：

```ocamltop
plus 2
```

这不是一个错误。它告诉我们`plus 2`事实上也是一个函数。它以一个整数为参数并返回一个整数。这是一个什么样的函数呢？让我们给这种神秘的函数起名为`f`,然后尝试把它作用在几个整数上来看它到底做什么。

```ocamltop
let f = plus 2;;
f 10;;
f 15;;
f 99;;
```

在工程上这已经足够[proof by
example](https://web.archive.org/web/20080223145218/http://www.princeton.edu/~sacm/humor/proof.html "http://www.princeton.edu/~sacm/humor/proof.html")让我们声明`plus 2`是一个给整数加2的函数。

回到原始的定义，让我们把第一个参数(`a`)换成2:

```ocaml
let plus 2 b =       (* 这不是真正的OCaml代码！ *)
  2 + b
```

这样我希望你或多或少的开始理解为什么`plus 2`是给整数加2的函数了吧。

现在来看这些表达式的类别，我们可以领悟到在函数类型中用奇怪的箭头符号-\>的原因了。

```ocaml
    plus : int -> int -> int
  plus 2 : int -> int
plus 2 3 : int
```

这个过程叫做**currying（科里化）** (或者应该叫 **uncurrying（去科里化）**,
我一直搞不清这两个定义).这个名字来源与Haskell Curry的与lambda
calculus有关的重要发现。为了避免进入OCaml背后的数学世界而使这个教程变得过于繁琐，我将不会再进一步地说明这个主题。如果感兴趣，你可以从[用
Google](http://www.google.com/search?q=currying "http://www.google.com/search?q=currying")
（译注：国内的小伙伴们可能要自行百度了）来获得更多关于currying的信息。

还记得开始时候我们的`double`和`multiply`函数吗？ `multiply`是这样定义的:

```ocamltop
let multiply n list =
  let f x =
    n * x in
  List.map f list
```

现在我们可以象这样来更简单地定义`double`, `triple`函数：

```ocamltop
let double = multiply 2;;
let triple = multiply 3;;
```

它们确实是函数, 不信你看:

```ocamltop
double [1; 2; 3];;
triple [1; 2; 3];;
```

你也可以不用中间函数`f`，而象这样来直接用部分应用（partial
application）：

```ocamltop
let multiply n = List.map (( * ) n);;
let double = multiply 2;;
let triple = multiply 3;;
double [1; 2; 3];;
triple [1; 2; 3];;
```

在上面的例子中，`((*) n)`是一个`(*)` (乘)函数的部分应用。
注意这里额外的空格，它使得OCaml不会认为`(*`是注释的开始。

你可以把中序操作符放在括号中而形成一个函数。这里是一个和以前`plus`函数等价的一个定义：

```ocamltop
let plus = ( + );;
plus 2 3;;
```

这里是更多的一些有趣的curring：

```ocamltop
List.map (plus 2) [1; 2; 3];;
let list_of_functions = List.map plus [1; 2; 3];;
```

## 函数式编程的优点

函数式编程，像其他任何优秀的编程技术一样，是你的工具箱中解决某些问题的利器。它使得callback函
数变得非常方便，可以用于从GUI编程到事件驱动循环等多种场合。它也很适合编写通用算法。`List.map`
就是一个把函数应用到链表中每个元素的通用算法。类似的，你也可以定义树的通用算法。另外，某些类型的
数值运算可以用函数式编程更加迅速地解决（比方说求导）。

## 纯函数式和非纯函数式编程

一个**纯函数**是没有**副作用**的。副作用的意思是这个函数保留了某些隐藏的状态。`strlen`就是
一个C的纯函数的例子。如果你调用`strlen`到相同的字符串，它总会返回相同的结果。`strlen`的输出
只依赖于输入而没有任何其他。很多C的函数是非纯的。比方说`malloc`，显然它不会对相同的输入返回相同的结果。
`malloc`内部有一个很大的数据结构记录状态。

ML-derived languages like OCaml are "mostly pure". They allow
side-effects through things like references and arrays, but by and large
most of the code you'll write will be pure functional because they
encourage this thinking. Haskell, another functional language, is pure
functional. OCaml is therefore more practical because writing impure
functions is sometimes useful.

There are various theoretical advantages of having pure functions. One
advantage is that if a function is pure, then if it is called several
times with the same arguments, the compiler only needs to actually call
the function once. A good example in C is:

```C
for (i = 0; i < strlen (s); ++i)
  {
    // Do something which doesn't affect s.
  }
```

If naively compiled, this loop is O(n^2^) because `strlen (s)` is called
each time and `strlen` needs to iterate over the whole of `s`. If the
compiler is smart enough to work out that `strlen` is pure functional
*and* that `s` is not updated in the loop, then it can remove the
redundant extra calls to `strlen` and make the loop O(n). Do compilers
really do this? In the case of `strlen` yes, in other cases, probably
not.

Concentrating on writing small pure functions allows you to construct
reusable code using a bottom-up approach, testing each small function as
you go along. The current fashion is for carefully planning your
programs using a top-down approach, but in the author's opinion this
often results in projects failing.

## Strictness vs laziness

C-derived and ML-derived languages are strict. Haskell and Miranda are
non-strict, or lazy, languages. OCaml is strict by default but allows a
lazy style of programming where it is needed.

In a strict language, arguments to functions are always evaluated first,
and the results are then passed to the function. For example in a strict
language, this call is always going to result in a divide-by-zero error:

```ocamltop
let give_me_a_three _ = 3;;
give_me_a_three (1/0);;
```

If you've programmed in any conventional language, this is just how
things work, and you'd be surprised that things could work any other
way.

In a lazy language, something stranger happens. Arguments to functions
are only evaluated if the function actually uses them. Remember that the
`give_me_a_three` function throws away its argument and always returns a
3? Well in a lazy language, the above call would *not* fail because
`give_me_a_three` never looks at its first argument, so the first
argument is never evaluated, so the division by zero doesn't happen.

Lazy languages also let you do really odd things like defining an
infinitely long list. Provided you don't actually try to iterate over
the whole list this works (say, instead, that you just try to fetch the
first 10 elements).

OCaml is a strict language, but has a `Lazy` module that lets you write
lazy expressions. Here's an example. First we create a lazy expression
for `1/0`:

```ocamltop
let lazy_expr = lazy (1/0)
```

Notice the type of this lazy expression is `int lazy_t`.

Because `give_me_a_three` takes `'a` (any type) we can pass this lazy
expression into the function:

```ocamltop
give_me_a_three lazy_expr
```

To evaluate a lazy expression, you must use the `Lazy.force` function:

```ocamltop
Lazy.force lazy_expr
```

## Boxed vs. unboxed types

One term which you'll hear a lot when discussing functional languages is
"boxed". I was very confused when I first heard this term, but in fact
the distinction between boxed and unboxed types is quite simple if
you've used C, C++ or Java before (in Perl, everything is boxed).

The way to think of a boxed object is to think of an object which has
been allocated on the heap using `malloc` in C (or equivalently `new` in
C++), and/or is referred to through a pointer. Take a look at this
example C program:

```C
#include <stdio.h>

void
printit (int *ptr)
{
  printf ("the number is %d\n", *ptr);
}

void
main ()
{
  int a = 3;
  int *p = &a;

  printit (p);
}
```

The variable `a` is allocated on the stack, and is quite definitely
unboxed.

The function `printit` takes a boxed integer and prints it.

The diagram below shows an array of unboxed (top) vs. boxed (below)
integers:

![Boxed Array](/img/boxedarray.png "")

No prizes for guessing that the array of unboxed integers is much faster
than the array of boxed integers. In addition, because there are fewer
separate allocations, garbage collection is much faster and simpler on
the array of unboxed objects.

In C or C++ you should have no problems constructing either of the two
types of arrays above. In Java, you have two types, `int` which is
unboxed and `Integer` which is boxed, and hence considerably less
efficient. In OCaml, the basic types are all unboxed.
