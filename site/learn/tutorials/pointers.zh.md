<!-- ((! set OCaml中的指针 !)) ((! set learn !)) -->

*Table of contents*

# OCaml中的指针

## 指针在OCaml
OCaml有指针，而实际上他们无处不在。它们大部分隐式地使用，也有些时候显式使用会更方便些。
C中繁琐的指针操作在OCaml中消失了，更准确地说，指针完全被编译器自动处理了，因此OCaml程序员
可以忽略掉指针的存在而专注于程序本身，而不会带来额外的问题。

在一些极其罕有的情况，显式的指针是必需的（比如说用OCaml把指令式语言的算法翻译一遍），
OCaml提供的引用已经相当成熟，并且还是一等公民（可以被创建、保存、传入、返回）。

###  显式指针是`ref`类型
你总可以显式地管理指针，但这往往是浪费时间和精力。

让我们以链表为例，这里的C和Pascal中的数据类型用到了指针:

```C
/* Cells and lists type in C */
struct cell {
  int hd;
  struct cell *tl;
};

typedef struct cell cell, *list;
```
```Pascal
{Cells and lists type in Pascal}
type
 list = ^cell;
 cell = record
  hd: integer;
  tl: cell;
 end;
```
我们可以把这段代码翻译成OCaml，定义一个类型，而不用指针：

```ocamltop
  type list = Nil | Cons of int * list
```
链表是一个递归结构，分别有两个子类，一个是空链表`Nil`，另一个被表示成一个pair `Cons`。

自动内存管理在这里发挥了作用：你只要通过 `Cons (x, l)` 就可以把 `x` 加在链表 `l`前。
在C中，你必须手动处理这所有的一切：

```C
/* 空链表 */
#define nil NULL

/* 链表的构造器 */
list cons (element x, list l)
{
  list result;
  result = (list) malloc (sizeof (cell));
  result -> hd = x;
  result -> tl = l;
  return (result);
}
```
Pascal也类似：

```Pascal
{创建一个链节}
function cons (x: integer; l: list): list;
  var p: list;
  begin
    new(p);
    p^.hd := x;
    p^.tl := l;
    cons := p
  end;
```
我们可以看见C程序中，链节的域必须是可变的，否则不可能对其初始化。而OCaml则把内存
分配和初始化放到了一个操作中：构造器构造。这样，就可以合理定义不可变数据结构（一般认为是纯
函数式数据结构）。如果必须对数据进行修改，OCaml的record可以定义可变域。这里，一个
元素可变的链表可以如下定义：

```ocamltop
type list = Nil | Cons of cell
and cell = { mutable hd : int; tl : list }
```
如果链节引用本身也要被修改，那么`tl`也可以定义成可变：

```ocamltop
type list = Nil | Cons of cell
and cell = {mutable hd : int; mutable tl : list};;
```
这里赋值的意义依然不大：你还是要通过`Cons {hd = 1; tl = l}` 来把 `1` 加到 `l`前。
OCaml中，除非逼不得已，否则不会使用赋值操作。

###  指针于可变域或向量
通常情况下，指针式用来修改数据结构的。在OCaml程序中，这意味着在record中使用向量或者可变域。
对指针的这种用法，Pascal的指令：`x^.label := val` (`x`是一个有`field`域的record)
对应于OCaml的 `x.label <- val` (`x`是一个有`field`可变域的record)。Pascal的 `^`
消失了，因为解引用已经由编译器处理好。

**结论:** 你能在OCaml中如C，Pascal使用指针，但这不是OCaml的风格，否则这和你在典型的
编程语言与指针纠缠没有区别。下面是个更完整的例子。

## OCaml中定义指针
一个一般的pointer类型可以用来定义一个指针，而一个指针的值不是null就是某个内存地址：

```ocamltop
type 'a pointer = Null | Pointer of 'a ref
```
显式的解引用和指针赋值很容易就可以定义。我们定义一个前缀操作符 `!^`来解引用，和一个中缀操作符 `^:=` 来赋值。

```ocamltop
let ( !^ ) = function
  | Null -> invalid_arg "Attempt to dereference the null pointer"
  | Pointer r -> !r;;

let ( ^:= ) p v =
  match p with
  | Null -> invalid_arg "Attempt to assign the null pointer"
  | Pointer r -> r := v;;
```
现在我们定义一个指针的分配和初始化：

```ocamltop
let new_pointer x = Pointer (ref x);;
```
现在我们可以定义一个指向整数的指针：

```ocamltop
let p = new_pointer 0;;
p ^:= 1;;
!^p;;
```
## 整数链表
现在我们可以如一般的指令式语言用指针定义链表：

```ocamltop
(* The list type ``à la Pascal'' *)
type ilist = cell pointer
and cell = {mutable hd : int; mutable tl : ilist}
```
然后我们定义链节的分配，链表的构造器和解构器：

```ocamltop
let new_cell () = {hd = 0; tl = Null};;

let cons x l =
  let c = new_cell () in
  c.hd <- x;
  c.tl <- l;
  (new_pointer c : ilist);;

let hd (l : ilist) = !^l.hd;;
let tl (l : ilist) = !^l.tl;;
```
现在我们可以编写经典的给予指针的算法，连同他们的问题，和null引起的错误。比方说，链表
连接会修改第一个链表参数，然后把第二个链表连接到第一个链表的最后：

```ocamltop
(* Physical append *)
let append (l1 : ilist) (l2 : ilist) =
  let temp = ref l1 in
  while tl !temp <> Null do
    temp := tl !temp
  done;
  !^ !temp.tl <- l2;;

(* An example: *)
let l1 = cons 1 (cons 2 Null);;

let l2 = cons 3 Null;;

append l1 l2;;
```

 `l1` 和 `l2` 连接到了一起：

```ocamltop
l1;;
```
但这个操作引入了一个很糟糕的副作用：`l1`现在不止包括原来的元素，还包括了`l2`的。所以
从原来意义上的`l1`已经不存在了，可以认为`append`*消费*了第一个参数。换句话说，一个函数
调用的结果隐式地依赖于函数调用的历史。这个奇怪的行为引入了很多指针操作上的困难。比方说
这个例子中，一切事情似乎工作正常：
```ocamltop
  append l1 l1;;
```
然后看看 `l1` 成了什么值?:

```ocamltop
  l1;;
```
## 多态链表
为了超过Pascal的类型系统，，我们可以用指针定义多态链表，下面是一个简单的实现：

```ocamltop
type 'a lists = 'a cell pointer
and 'a cell = {mutable hd : 'a pointer; mutable tl : 'a lists};;

let new_cell () = {hd = Null; tl = Null};;
let cons x l =
  let c = new_cell () in
  c.hd <- new_pointer x;
  c.tl <- l;
  (new_pointer c : 'a lists);;
let hd (l : 'a lists) = !^l.hd;;
let tl (l : 'a lists) = !^l.tl;;

let append (l1 : 'a lists) (l2 : 'a lists) =
  let temp = ref l1 in
  while tl !temp <> Null do
    temp := tl !temp
  done;
  !^ !temp.tl <- l2;;
```
