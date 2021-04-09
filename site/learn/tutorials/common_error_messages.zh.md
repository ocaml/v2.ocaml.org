<!-- ((! set title 常见的错误信息 !)) ((! set learn !)) -->

*Table of contents*

# 常见的错误信息
这一章给大家一个关于OCaml编译器的一些错误或者警告信息的简要解释。详尽解释在本教程的
相应章节可以找到。

## 类型错误
###  This expression has type ... but is here used with type ...
当一个对象的类型与上下文要求的不匹配，你就会看到这个信息：

```ocamltop
1 + 2.5;;
```

"This expression has type *X* but is here used with type *Y*" 的意思是
如果一个表达式的内容是隔离的 (2.5)，那么它的类型可以推导成 *X* (float)。但是上下文
告诉我们 (1 + ...) 应该是类型 *Y*
(int) 的，因而与 *X* 不匹配。

下面的信息更加糟糕：
```text
This expression has type my_type but is here used with type my_type
```
这个错误往往发生在一些toplevel中的类型定义上。在OCaml，重新定义一个已经存在的类型
是完全合法的。看看下面这个会话：

```ocamltop
type my_type = A | B;;
let a = A;;
type my_type = A | B;;
let b = B;;
a = b;;
```
对于编译器来说第二个定义是完全独立于第一个的。所以我们是定义了两个相同名称的类型。
由于`a`在早前就定义了，因此它是属于第一个类型。但`b`是属于第二个。在这个例子中，可以
重新定义`a`使得它是属于第二个类型的。这个错误是不应该在实际编程中碰到的，除非你在
同一个模块用同一个名字定义不同类型，这显然是自找麻烦。

###  警告: This optional argument cannot be erased
带可选参数的函数至少有一个未标签的参数。下面这个例子是有警告的：

```ocamltop
let f ?(x = 0) ?(y = 0) = print_int (x + y)
```
这个警告只要在最后加上`unit`就可以解决：

```ocamltop
let f ?(x = 0) ?(y = 0) () = print_int (x + y);;
```
更多关于标签化参数请参见 [标签](labels.zh.html "标签") 一章。

###  The type of this expression... contains type variables that cannot be generalized
当某些情况下，编译器在到了编译单元（文件）结尾时，也无法得知类型的整个定义，并且也无法
是多态时，这个警告会产生：

```ocamltop
let x = ref None
```
这会引起下面的编译信息：

```text
The type of this expression, '_a option ref,
contains type variables that cannot be generalized
```
解决方案：直接告诉编译器你的变量类型：

```ocamltop
let x : string option ref = ref None
```
或者：

```ocamltop
let x = ref (None : string option)
```
`'_a`的数据类型在toplevel有可能会暂时被允许。它代表这是某个类型，但它
不是所有类型，它不是多态的（译注：也就是说它不是真的多态的，只是toplevel中的一个占位表示而已）。
在toplevel，我们的例子有下面的结果：

```ocamltop
let x = ref None
```
编译器告诉我们`x`的类型还不完全知道，但是随着`x`的使用，编译器可以推导出它的类型：

```ocamltop
x := Some 0
```
现在 `x` 的类型是已知的：

```ocamltop
x;;
```
更多细节在 [OCaml
FAQ](http://caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html#variables_de_types_faibles "http://caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html#variables_de_types_faibles")。

## 模式匹配警告和错误
###  This pattern is unused
这个警告其实是一个错误，因为这种代码没理由存在。这当程序员粗心地引入一个匹配所有的模式
是会产生，如下：

```ocamltop
let test_member x tup =
  match tup with
  | (y, _) | (_, y) when y = x -> true
  | _ -> false;;
```
显然，这里程序员完全曲解了OCaml的模式匹配。记住以下几点：

* 模式匹配的遍历是线性的，由上至下，从左到右。回溯是*根本不存在*的。
* 一个guard 不是模式的一部分。它只是一个条件语句，并且最多使用一次。它只是让你跳到下一个模式的一个手段。
* 小写的名字只是名字，它们会匹配任何东西的。

在我们的例子中，显然只有第一个模式才被匹配，这导致下面的结果：

```ocamltop
test_member 1 (1, 0);;
test_member 1 (0, 1);;
```
###  This pattern-matching is not exhaustive
OCaml's pattern matching can check whether a set of patterns is
exhaustive or not, based on the *type* only. So in the following
example, the compiler doesn't know what range of ints the "mod" operator
would return:

```ocamltop
let is_even x =
  match x mod 2 with
  | 0 -> true
  | 1 | -1 -> false
```
A short solution without pattern matching would be:

```ocamltop
let is_even x = x mod 2 = 0
```
In general, that kind of simplification is not possible and the best
solution is to add a catch-all case which should never be reached:

```ocamltop
let is_even x =
  match x mod 2 with
  | 0 -> true
  | 1 | -1 -> false
  | _ -> assert false
```
## Problems recompiling valid programs
###  x.cmi is not a compiled interface
When recompiling some old program or compiling a program from an
external source that was not cleaned properly, it is possible to get
this error message:

```text
some_module.cmi is not a compiled interface
```
It means that some_module.cmi is not valid according to the *current
version* of the OCaml compiler. Most of the time, removing the old
compiled files (*.cmi, *.cmo, *.cmx, ...) and recompiling is
sufficient to solve this problem.
	
###  Warning: Illegal backslash escape in string
Recent versions of OCaml warn you against unprotected backslashes in
strings since they should be doubled. Such a message may be displayed
when compiling an older program, and can be turned off with the `-w x`
option.

```ocamltop
"\e\n" (* bad practice *);;
"\\e\n" (* good practice *);;
```
