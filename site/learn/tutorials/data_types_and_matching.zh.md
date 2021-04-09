<!-- ((! set title 数据类型和匹配 !)) ((! set learn !)) -->

*Table of contents*

数据类型和匹配
=============

Linked lists
------------

和Perl一样，OCaml也将对列表的支持直接内建在语言中了。OCaml中一个列表的所有元素的类型必须一致。使用以下格式来写列表：
```ocamltop
[1; 2; 3]
```
（注意是分号，不是逗号）。

`[]` 表示空列表。

一个列表有一个“**头**”（第一个元素）和一个“**尾**”（剩下的元素）。头是一个元素，而尾则是一个列表，所以前面的例子中，表头是整数1，而表尾是*list*`[2; 3]`。

另一种做法是使用**cons**操作符——`头 :: 尾`。所以下面的列表写法是完全一样的：

    [1; 2; 3]
    1 :: [2; 3]
    1 :: 2 :: [3]
    1 :: 2 :: 3 :: []

为什么我要提到cons操作符呢？其实，当我们对列表使用*模式匹配*的时候，它是相当有用的，下面我将详细说明。

### 链表的类型

整数链表的类型是int list，一般来说，foo类型的链表的类型就是foo list。

由此可以看出，链表的所有元素都必须是同一种类型的。但是类型却可以是多态的（如，`'a list`），当你要写操作"lists
of
anything"（任意类型的列表）的泛型函数时，这就相当有用了（注意，`'a list`
并不代表每个单独的元素可以有不同的类型——所以你还是不能用它来构造包含混合类型的列表，也就是说，元素的类型可以任意，但所有元素的类型必须相同）。

length函数是定义在OCaml的List模块中的，它是一个很好的例子。它不论列表包含的整数还是字符串或者对象、
还是什么小怪物，List.length函数都可以对其进行处理。因此，List.length的类型是：

    List.length : 'a list -> int

Structures
----------

C和C++都有作为structure简称的`struct`概念。尽管有点繁琐，Java中类也可以用于类似的效果。

考虑下面简单的C结构：
```C
struct pair_of_ints {
  int a, b;
};
```
Ocaml中最简单的对应形式是一个**组元（tuple）**，比如具有`int * int`类型的`(3, 4)`。和链表不同，组元的元素可以是不同类型，例如`(3, "hello", 'x')`的类型是`int * string * char`。

在Ocaml中实现一个C中的struct还有另外一种稍显复杂的方法，就是使用**记录（record）**。你可以像C的结构一样在记录中为元素命名。你不能在组元中命名元素，而是要记住它们出现的顺序。下面是和之前的C结构等价的一个记录：

type pair_of_ints = { a : int; b : int };;

它定义了记录的类型，然后*构造*一个该类型的对象：

    { a=3; b=5 }

请注意在类型定义中使用":"，在构造对象时使用"="。

下面是在toplevel中输入一些例子的输出：

```ocamltop
type pair_of_ints = { a : int; b : int };;
{a=3; b=5};;
{a=3};;
```

Ocaml要求结构中的所有元素都有确定的值。

## qualified unions 和枚举（enum）
_译注_：不知道这个qualified union有没有专门的术语，要翻译的话实在不好翻。
虽然gcc有这方面的扩展，但是标准C语言并没有qualified unions。下面是一个C中实现qualified union的一般模式：

```C
struct foo {
  int type;
#define TYPE_INT 1
#define TYPE_PAIR_OF_INTS 2
#define TYPE_STRING 3
  union {
    int i;        // If type == TYPE_INT.
    int pair[2];  // If type == TYPE_PAIR_OF_INTS.
    char *str;    // If type == TYPE_STRING.
  } u;
};
```
我觉得我们应该都见过这样的代码了，而且这种代码并不是十分漂亮。首先这并不安全：例如当
一个字符串被存储到这个结构体的时候，程序员有可能错误地引用了`u.i`。并且编译器不能很好地
检查出switch中的所有分支（当然，你可以用枚举来改善这个问题）。还有，程序员有可能会忘记设置
`type`域，从而导致各种各样的问题。再说，这个写法也太累赘了。

下面是OCaml中更加优雅而简洁的版本：

```ocamltop
type foo =
  | Nothing
  | Int of int
  | Pair of int * int
  | String of string
```
这是一个类型定义。首先，每个`|`分开的部分叫做`constructor`(_译注_：不要和OOP中的`constructor`
混淆，他们两个没有半丁点关系，只是名字相同而已，很多函数式编程语言都有类似概念。poor 
English vocabulary）。他们可以是任何大写字母开头的单词。如果`constructor`可以被
用来定义值，它后面必须有`of type`的模式，来指定值的类型。`type`必须是小写字母开头。
在上面的例子中，`Nothing`被用来当作一个常数，而其他`constructor`则被用来当作值。

要真正地*创建*一个属于这个类型的值，你要：

```ocaml
Nothing
Int 3
Pair (4, 5)
String "hello"
...
```
这些表达式的类型都是`foo`。

注意到`of`只出现在类型定义中，而不是值的定义。

一个简单的C的枚举类型可以如下定义：

```C
enum sign { positive, zero, negative };
```
而Ocaml的版本是：

```ocaml
type sign = Positive | Zero | Negative
```

###  递归变体
变体是可以递归的，其中一个普遍的用法是定义树状结构。这就是函数式语言拥有强大表达力之处：

```ocamltop
type binary_tree =
  | Leaf of int
  | Tree of binary_tree * binary_tree
```
下面是一些二叉树。试一下把他们画出来：

```ocaml
Leaf 3
Tree (Leaf 3, Leaf 4)
Tree (Tree (Leaf 3, Leaf 4), Leaf 5)
Tree (Tree (Leaf 3, Leaf 4), Tree (Tree (Leaf 3, Leaf 4), Leaf 5))
```

###  参数化变体
前一节的二叉树每个叶节点只能存储整数，那我们如何才能只描述树的形状，往后才决定在
节点里放什么值呢？多态变体可以如下实现：

```ocamltop
type 'a binary_tree =
  | Leaf of 'a
  | Tree of 'a binary_tree * 'a binary_tree
```
这是一个通用的形式。用来存储整型的树是`int binary_tree`。同样我们可以定义`string binary_tree`。
下面一个例子中，类型推导会自动为我们推导出叶节点的类型：

```ocamltop
Leaf "hello";;
Leaf 3.0;;
```
注意到类型名称是由后到前的。与诸如`int list`等类型比较一下。

事实上，`'a list`也写成反序绝非偶然。链表就是参数化变体，只是有如下奇怪的定义：

```ocaml
type 'a list = [] | :: of 'a * 'a list   (* not real OCaml code *)
```
事实上，上面的定义不会编译，但下面的代码就几乎是等价的：

```ocamltop
type 'a equiv_list =
  | Nil
  | Cons of 'a * 'a equiv_list;;
Nil;;
Cons(1, Nil);;
Cons(1, Cons(2, Nil));;
```
记得原来我们说过链表可以写成两种形式，一种是语法糖的 `[1; 2; 3]`，或者更加正式的
`1 :: 2 :: 3 :: []`。如果你看到上面 `'a list` 的定义，你就大概可以理解到了正式定义的含义了。

## 链表，结构，变体 - 总结

```text
OCaml 名字     类型定义的例子                    用法

链表            int list                       [1; 2; 3]
tuple          int * string                   (3, "hello")
record         type pair =                    { a = 3; b = "hello" }
                 { a: int; b: string }
变体            type foo =
                 | Int of int                 Int 3
                 | Pair of int * string
变体            type sign =
                 | Positive                   Positive
    	         | Zero                       Zero
                 | Negative
参数化变体       type 'a my_list =
                 | Empty                      Cons (1, Cons (2, Empty))
                 | Cons of 'a * 'a my_list
```

## 数据类型的模式匹配
函数式语言的一个相当酷的特性就是能够把数据结构分开并对其做模式匹配。这实际上并不是函数式所独有的，
你可以想象到有哪个C的衍生语言也可以这样，但这并不妨碍这个特性还是相当酷。（译注：说是这么说，
但是C系语言有一些原因很难实现这一点）

让我们来看看实际一点的要求：我希望表示一个数学表达式 `n * (x + y)` 然后分解公因式
 `n * x + n * y`。

先让我们来定义一个表达式类型：

```ocamltop
type expr =
  | Plus of expr * expr        (* means a + b *)
  | Minus of expr * expr       (* means a - b *)
  | Times of expr * expr       (* means a * b *)
  | Divide of expr * expr      (* means a / b *)
  | Value of string            (* "x", "y", "n", etc. *)
```

这个表达式 `n * (x + y)` 可以写成：

```ocamltop
Times (Value "n", Plus (Value "x", Value "y"))
```
我们还需要一个函数来把
`Times (Value "n", Plus (Value "x", Value "y"))` 打印成
`n * (x + y)`。下面我将写两个函数，一个会把表达式转变成可读的字符串，而一个将其打印出来
（原因是我可以把字符串写到文件而不局限于标准输出）。

```ocamltop
let rec to_string e =
  match e with
  | Plus (left, right) ->
     "(" ^ to_string left ^ " + " ^ to_string right ^ ")"
  | Minus (left, right) ->
     "(" ^ to_string left ^ " - " ^ to_string right ^ ")"
  | Times (left, right) ->
	 "(" ^ to_string left ^ " * " ^ to_string right ^ ")"
  | Divide (left, right) ->
	 "(" ^ to_string left ^ " / " ^ to_string right ^ ")"
  | Value v -> v ;;
  
let print_expr e =
  print_endline (to_string e);;
```

（提示：`^`操作符会连接两个字符串。）

下面是这个打印函数的使用：
```ocamltop
print_expr (Times (Value "n", Plus (Value "x", Value "y")))
```
模式匹配的通用形式是：

```ocaml
match value with
| pattern    ->  result
| pattern    ->  result
  ...
```
模式可以是很简单，就如`to_string`一般，也可以很复杂和嵌套。下一个例子是把`n * (x + y)`
或者 `(x + y) * n`展开的函数，这里面我们会用到嵌套模式匹配：

```ocamltop
let rec multiply_out e =
  match e with
  | Times (e1, Plus (e2, e3)) ->
     Plus (Times (multiply_out e1, multiply_out e2),
           Times (multiply_out e1, multiply_out e3))
  | Times (Plus (e1, e2), e3) ->
     Plus (Times (multiply_out e1, multiply_out e3),
           Times (multiply_out e2, multiply_out e3))
  | Plus (left, right) ->
     Plus (multiply_out left, multiply_out right)
  | Minus (left, right) ->
     Minus (multiply_out left, multiply_out right)
  | Times (left, right) ->
     Times (multiply_out left, multiply_out right)
  | Divide (left, right) ->
     Divide (multiply_out left, multiply_out right)
  | Value v -> Value v
```
让我们实际操作一下：
```ocamltop
print_expr(multiply_out(Times (Value "n", Plus (Value "x", Value "y"))))
```
`multiply_out`函数是怎么工作的呢？关键在于前两个模式。
第一个模式 `Times (e1, Plus (e2, e3))` 匹配 `e1 * (e2 + e3)`。右手边是把这个表达式
转化成 `(e1 * e2) + (e1 * e3)`。

第二个模式做的事情类似，除了适用的表达式变成了 `(e1 + e2) * e3`。

剩下的模式并不改变表达式的形式，但是他们*确实*递归在子表达式上调用了 `multiply_out`。
这保证了所有的子表达式都把加号提取了出来（如果你只想对最顶层进行操作，你可以把余下的表达式
都应用到`e -> e`这个模式匹配）。

我们能否做上面的反变换（提取公因式）？显然是必须的，就是麻烦了些。下面的版本只可以应用到
最顶层，当然你可以对其扩展，将其应用到表达式的每一层：

```ocamltop
let factorize e =
  match e with
  | Plus (Times (e1, e2), Times (e3, e4)) when e1 = e3 ->
     Times (e1, Plus (e2, e4))
  | Plus (Times (e1, e2), Times (e3, e4)) when e2 = e4 ->
     Times (Plus (e1, e3), e4)
  | e -> e;;

factorize (Plus (Times (Value "n", Value "x"),
                 Times (Value "n", Value "y")))
```
这个`factorize`函数有其他一些特性。你可以加上**guard**到每个模式匹配上。一个guard
是一个跟在`when`后的条件，它的意思是模式匹配只应用于模式确实匹配并且这个条件语句成立时。

```ocaml
match value with
| pattern  [ when condition ] ->  result
| pattern  [ when condition ] ->  result
  ...
```
第二个特性就是`=`用来测试结构相等。它会对每个结构进行递归比较以求每个部分都精确相等。

Ocaml可以在编译时检查你是否遍历了所有的情况。如果我在
`type expr` 的定义处多添加一项 `Product`：

```ocamltop
type expr = Plus of expr * expr      (* means a + b *)
          | Minus of expr * expr     (* means a - b *)
          | Times of expr * expr     (* means a * b *)
          | Divide of expr * expr    (* means a / b *)
          | Product of expr list     (* means a * b * c * ... *)
          | Value of string          (* "x", "y", "n", etc. *)
```
然后再重新编译`to_string`，Ocaml会报错：

```ocamltop
let rec to_string e =
  match e with
  | Plus (left, right) ->
     "(" ^ to_string left ^ " + " ^ to_string right ^ ")"
  | Minus (left, right) ->
     "(" ^ to_string left ^ " - " ^ to_string right ^ ")"
  | Times (left, right) ->
	 "(" ^ to_string left ^ " * " ^ to_string right ^ ")"
  | Divide (left, right) ->
	 "(" ^ to_string left ^ " / " ^ to_string right ^ ")"
  | Value v -> v ;;
```
如你所见，编译器会告诉你`Product`没有被处理。

练习：实现`to_string`中的`Product`部分，使其编译通过没有报错。
