<!-- ((! set title If语句，循环和递归 !)) ((! set learn !)) -->

*Table of contents*

# If语句，循环和递归

## if语句 (实际上是if表达式)
OCaml有两种if语句：

```ocaml
if boolean-condition then expression
  
if boolean-condition then expression else other-expression
```
不同于传统的语言，if语句是表达式。它们更类似于C类语言中的三元操作符`?:`
而不是你所熟悉的if语句。

下面是if语句的简单例子：

```ocamltop
let max a b =
  if a > b then a else b
```
如果你把上面的定义打入OCaml的toplevel，你会发现OCaml会把这个函数定义成多态的：

```ocaml
max : 'a -> 'a -> 'a
```
而确实OCaml也允许你把max应用到不同的类型：
```ocamltop
max 3 5;;
max 3.5 13.0;;
max "a" "b";;
```
这是因为`>`是多态的。它可以比较所有类型，包括对象（按位比较）。

[`Pervasives` 模块已经为你定义了`max`。]

让我们来仔细看看if语句。下面是`range`函数，你应该结合递归函数，链表，
if语句的知识来看看它到底在干些什么：

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a+1) b
```
让我们来验证一下一些典型的调用。当`a > b`时，如`range 11 10`，应该返回`[]`，
而确实如此。

那`range 10 10`呢？因为`10 > 10`为假，因此`else`部分被求值，也就是 `10 :: (range 11 10)`
（我加了括号让求值顺序更加清晰）。由于我们已经知道`range 11 10` = `[]`，因此，
结果就是`[ 10 ]`。

让我们再来看看 `range 9 10`：

```ocaml
range 9 10
→ 9 :: (range 10 10)
→ 9 :: [ 10 ]
→ [9; 10]
```
`range 1 10` 的结果显然就是
`[ 1; 2; 3; 4; 5; 6; 7; 8; 9; 10 ]`。

我们看到的是简单的递归结果。函数式编程可以说比起循环更倾向于递归，
不过请允许我跳过一下，在这一章的最后才再讨论递归多一些。

让我们回到if语句。下面这个函数干的什么事情?

```ocamltop
let f x y =
  x + if y > 0 then y else 0
```
提示：在if语句的周围加上括号。它就像一个[二极管](https://en.wikipedia.org/wiki/Diode#Current.E2.80.93voltage_characteristic).
一样截断`y`。

`Pervasives`中的`abs`函数如下定义：

```ocamltop
let abs x =
  if x >= 0 then x else -x
```
在 `Pervasives` 中的 `string_of_float` 函数也有一些复杂嵌套的if表达式：

```ocaml
let string_of_float f =
  let s = format_float "%.12g" f in
  let l = string_length s in
  let rec loop i =
    if i >= l then s ^ "."
    else if s.[i] = '.' || s.[i] = 'e' then s
    else loop (i+1) in
  loop 0
```
让我们来验证一下这个函数。如果 `f` = 12.34, 那么 `s` = "12.34" 并且 `l` = 5. 让后我们以`i` = 0 调用 `loop`。

`i` 小于 `l`, 而且 `s.[i]` (`s`的第i个字母) 不是小数点或者 `'e'`. 所以
`loop (i+1)` 被调用，也就是 `loop 1`。

然后继续调用 `loop 2`。

当 `i` = 2时， `s.[i]` 是一个小数点（原来的字符串是`s` = "12.34"）。
所以马上返回`s`，这个函数`string_of_float` 返回了 "12.34"。

那这个`loop`干了什么？实际上它检查`format_float`返回的字符串是否包含一个小数点或者`'e'`。
如果我们调用`string_of_float 12.0`， `format_float`会返回"12"，但是 `string_of_float` 必须返回 "12." 或者 "12.0"
（因为OCaml中的浮点数必须包含小数点来与整数区分）。因此要做这个检查。

这里递归的奇怪用法几乎是可以肯定是比较迅速的。虽然OCaml支持for循环，但是我们将看见
for循环的限制使得它不能在这里派上用场。下面是个更直接的实现方式，但它
的效率几乎是上面的1/2：

```ocaml
let string_of_float f =
  let s = format_float "%.12g" f in
  if String.contains s '.' || String.contains s 'e'
  then s
  else s ^ "."
```

## 用 begin ... end
下面是 lablgtk 中的一段代码:

```ocaml
if GtkBase.Object.is_a obj cls then
  fun _ -> f obj
else begin
  eprintf "Glade-warning: %s expects a %s argument.\n" name cls;
  raise Not_found
end
```
`begin` 和 `end` 是表示开闭括号的 **语法糖**。在上面的例子，它们的作用是把`else`语句
里的两个式子组合到一起。如果作者写成如下的形式：

```ocaml
if GtkBase.Object.is_a obj cls then
  fun _ -> f obj
else
  eprintf "Glade-warning: %s expects a %s argument.\n" name cls;
  raise Not_found
```
如果给上面的表达式加上括号：

```ocaml
(if GtkBase.Object.is_a obj cls then
   fun _ -> f obj
 else
   eprintf "Glade-warning: %s expects a %s argument.\n" name cls
);
raise Not_found
```
完全就不是你想表达的那个意思。所以用 `begin` 和 `end` 来组合
 `then` 或者 `else` 中的多个语句是必需的。你也可以用括号 `( ... )` 来表示这个关系
（我更喜欢括号，因为我觉得Pascal比较**恶心**）。下面有两个简单例子：

```ocamltop
  if 1 = 0 then
    print_endline "THEN"
  else begin
    print_endline "ELSE";
    failwith "else clause"
  end;;
  
  if 1 = 0 then
    print_endline "THEN"
  else (
    print_endline "ELSE";
    failwith "else clause"
  );;
```

## For 循环和 while 循环
OCaml 支持一种比较受限制的 `for` 循环：

```ocaml
for variable = start_value to end_value do
  expression
done
  
for variable = start_value downto end_value do
  expression
done
```
下面是 lablgtk 中的例子：

```ocaml
for i = 1 to n_jobs () do
  do_next_job ()
done
```
Ocaml 中的 `for` 循环不过是下面这中形式的简写：

```ocaml
let i = 1 in
do_next_job ();
let i = 2 in
do_next_job ();
let i = 3 in
do_next_job ();
  ...
let i = n_jobs () in
do_next_job ();
()
```
OCaml 不支持`for`循环中诸如 `break`, `continue` 或 `last` 这些语句的流控制（你可以
在循环体里抛出一个异常再在外面接著，但这个风格看起来太糟糕）。

 OCaml 中 for 循环的表达式必须被返回 `unit`（否则你会接收到一个警告），并且for循环本身也会返回
 `unit`:

```ocamltop
for i = 1 to 10 do i done;;
```
函数式程序员更倾向于用递归，而不是for循环，由于for循环没有返回值，因此Ocaml中的for循环
并不这么有用。我们会在下面讨论递归。

**While 循环** 是写成：

```ocaml
while boolean-condition do
  expression
done
```
和for循环同样，while循环也不支持循环流控制，当然你还是可以用异常，但这说明while循环
其实是相当受限制的。同样，函数式程序员更喜欢递归，因此while循环是二等公民。

如果你改变一下思维，其实你会发现你完全用不到while循环，除非你使用到引用。假设Ocaml
不支持引用：

```ocaml
let quit_loop = false in
while not quit_loop do
  print_string "Have you had enough yet? (y/n) ";
  let str = read_line () in
  if str.[0] = 'y' then
    (* how do I set quit_loop to true ?!? *)
done
```
 `quit_loop` 不是一个真正的变量，let 绑定只是让 `quit_loop` 成为 `false` 的简写。
这就是说while循环的条件语句总是会真的，因此这是一个死循环！

幸运的是OCaml是*有*引用的，所以我们可以写出想要的代码。但是不要误会 `!` 是C/Java中的
非，在OCaml中是“解引用”的意思。你最好把 `!` 读作“解引”：

```ocaml
let quit_loop = ref false in
while not !quit_loop do
  print_string "Have you had enough yet? (y/n) ";
  let str = read_line () in
  if str.[0] = 'y' then
    quit_loop := true
done;;
```
## 迭代链表
如果你要迭代整个链表，是时候改变一下思维，不要老挂记着老朋友for循环了。OCaml有更好更快的方式
来迭代整个链表，这些函数都在`List` 模块里。在这个模块里有很多很好的函数，不过下面我只会讨论最
有用的一组。

首先我们先定义一个链表：

```ocamltop
let my_list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
```
如果你想迭代链表中的每个元素各一次，用`List.iter`, 如下：

```ocamltop
let f elem =
  Printf.printf "I'm looking at element %d now\n" elem in
  List.iter f my_list
```
当你想用for循环的时候，`List.iter` 应该是你的首选。

如果你想*变换*链表中的每个元素，比方说给每个元素翻倍，则可以用 `List.map`。Perl程序员可能
会对下面的函数用法感到熟悉：
```ocamltop
List.map (( * ) 2) my_list
```
Perl里，我们用`grep`来过滤某个条件，比方说返回所有偶数。OCaml中这个函数叫 `List.filter`:

```ocamltop
let is_even i =
  i mod 2 = 0 in
List.filter is_even my_list
```
如果要找出链表中是否包含某个元素，则要用 `List.mem`：

```ocamltop
List.mem 12 my_list
```
`List.for_all` 和 `List.exists` 的意思跟逻辑里的“任意”和“存在”是一样的。

如果要同时操作两个链表，我们有下面这些函数的“-2”变体，也就是
`iter2`, `map2`, `for_all2`,`exists2`。

 `map` 和 `filter` 函数单独操作每个链表的元素。`Fold` 则是一个不同寻常的函数，它
表示在链表的元素之间插入一个操作符。比方说我想把链表中所有的数字相加，因此我想在元素之间
插入一个加号：

```ocamltop
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
```
`Fold`支持这个操作，但是细节比较麻烦。首先，操作在空链表该返回什么？在这里如果是0则是最好的。
但是如果我们想要求链表的积，则我会想要返回1。所以我要提供某种默认值，然后第二个问题是，
怎么应对不符合结合律的复杂操作，诸如 (a *op* b) *op* c 不等于 a *op* (b *op* c)?
在这个情况下，从左至右还是反过来则会影响结果。因此我们有两个版本 `List.fold_left` (从左到右)和
`List.fold_right` (从右到左)。

让我们用 `List.fold_left` 来定义 `sum` 和 `product` 函数：

```ocamltop
let sum = List.fold_left ( + ) 0;;
let product = List.fold_left ( * ) 1;;
sum my_list;;
product my_list;;
```
这太简单了，现在我有一个方式来表示阶乘：

```ocamltop
let fact n = product (range 1 n);;
fact 10;;
```
（注意到这个阶乘函数并不是这么有用，因为对于较小的n它都引起整数溢出，一个真正的阶乘
应该使用 `Big_int` 模块）

## 迭代字符串
`String` 模块包含很多与字符串相关的函数，其中里面有一些迭代字符串的函数。

`String.fill` 和 `String.blit` 和 C 的 `memset`， `strcpy` 等同。
 `String.copy` 如同 `strdup` 拷贝一个字符串。

`String.iter` 则如 `List.iter`，不过是迭代字符串中的字符。

## 递归
现在我们进入更难的话题：递归了。没有递归党，就没有函数式程序员。而且函数式中的递归和循环
在很多方面上是等价的。在函数式语言中，循环是二等公民，而递归则是支持地最好的。

写递归函数需要想法上的改变。在这一节我会给大家提供一些入门指导和例子。

在第一个例子里，我们讲把整个文件读到字符串里，一般来讲，有三个方法来实现：

###  方法一
求文件的长度，然后用`really_input` 一次性地读进内存。这是最简单的方式，但是对于一些并非
一般文件的文件（比方说键盘），则不太好使了。

###  方法二
这是过程式的方法，用一个while循环，并且通过抛出异常跳出。

###  方法三
一个递归循环，也是通过异常跳出。

我们下面将要介绍几个新的概念。方法二、三将用到 `Buffer` 模块：一个可以扩展的缓冲，你可以认为
这是一个可以很有效率地拼接字符串的缓冲区。而函数将在读到文件尾的时候抛出 `End_of_file` 异常。
另外我们用 `Sys.argv.(1)` 来得到第一个命令行参数。

```ocaml
(* Read whole file: 方法一 *)
open Printf
  
let read_whole_chan chan =
  let len = in_channel_length chan in
  let result = String.create len in
  really_input chan result 0 len;
  result
  
let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan
  
let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  printf "I read %d characters from %s\n" (String.length str) filename
```

方法一不会工作得很好，因为 `read_whole_chan` 并不能很好地读取诸如键盘和套接口这种非一般文件，
方法二将用到while循环：

```ocaml
(* Read whole file: 方法二 *)
open Printf
  
let read_whole_chan chan =
  let buf = Buffer.create 4096 in
  try
    while true do
      let line = input_line chan in
      Buffer.add_string buf line;
      Buffer.add_char buf '\n'
    done;
    assert false (* This is never executed
	                (always raise Assert_failure). *)
  with
    End_of_file -> Buffer.contents buf
  
let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan
  
let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  printf "I read %d characters from %s\n" (String.length str) filename
```

方法二的关键在中间的while循环。还记得我上面提到抛异常是提早跳出循环的唯一方式？
这就是我们在这里的解决方案。虽然我还没有提到异常，但我估计你应该可以理解 `input_line` 
会遇到文件结尾的时候会抛出 `End_of_file` 异常。缓冲 `buf`
会累积文件的内容，然后当遇到文件结尾的时候则返回这个缓冲(`Buffer.contents buf`)。

一个有意思的地方是，为什么在while循环最后有一个多余的语句(`assert false`)呢？要知道
OCaml中的while和for循环是表达式，它们的返回值总是 `unit` 对象 (`()`)。
但是OCaml要求`try`的返回值要和每个接收的表达式的返回值匹配。在这个情况，因为 `End_of_file`
的结果是 `string`，因此`try` 也必须返回一个字符串，尽管这个while是死循环。`assert false`
表达式是一个多态表达式，因此可以自动匹配`with`分支的返回类型。

下面是我们的递归版本。注意到该版本比方法二更短，但是对于过程式程序员来讲可能并不那么容易理解：

```ocaml
(* Read whole file: Approach 3 *)
open Printf
  
let read_whole_chan chan =
  let buf = Buffer.create 4096 in
  let rec loop () =
    let line = input_line chan in
    Buffer.add_string buf line;
    Buffer.add_char buf '\n';
    loop () in
  try
    loop ()
  with
    End_of_file -> Buffer.contents buf
  
let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan
  
let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  printf "I read %d characters from %s\n" (String.length str) filename
```
这里同样有一个死循环，但是是用递归来实现的。`loop` 在末尾调用了它本身，这个死循环会在
 `input_line` 抛出 `End_of_file` 异常的时候跳出。

这看起来好像方法三在文件足够大的时候会导致堆栈溢出，但实际上并非如此。因为这是一个尾递归
调用，编译器会把这段代码编译成一个while循环，因此这里只会用到常数大小的堆栈。

在下一个例子我们会展示递归在构造或者试验某种类型的数据结构上有很卓越的表现，尤其是树。
让我们来定义一个文件系统的递归类型：

```ocamltop
type filesystem = File of string | Directory of filesystem list
```
`opendir` 和 `readdir` 函数将被用来打开和读取目录。我将定义一个有用的函数
`readdir_no_ex` ，它会隐藏 `readdir` 抛出的烦人的 `End_of_file` 异常：

```ocamltop
open Unix  (*  You may need to #load "Unix.cma" *)
  
let readdir_no_ex dirh =
  try
    Some (readdir dirh)
  with
    End_of_file -> None
```
 `readdir_no_ex` 的类型如下，回忆以下先前我们讨论过的null指针：

```ocaml
readdir_no_ex : dir_handle -> string option
```
下面我回定义一个递归函数来将 `filesystem` 类型转变成字符串用来打印：

```ocamltop
let rec string_of_filesystem fs =
  match fs with
  | File filename -> filename ^ "\n"
  | Directory fs_list ->
      List.fold_left (^) "" (List.map string_of_filesystem fs_list)
```
这里我们用到了 `fold_left` 和 `map`。 `map` 这里将链表中的每个 `filesystem` 递归地转
变成 `string`。而 `fold_left (^) ""` 会把一个链表串接成一个长字符串。注意到这里用到了
模式匹配。（库定义了一个函数 `String.concat` 实现和 `fold_left (^) `等同的小鬼，
但是更加迅速）。

现在我们将定义一个函数来递归地读取目录结构，然后返回一个递归的 `filesystem` 数据结构哦。我将
分几步展示这个函数。但是我回在最后展示整个函数。首先这个函数的轮廓如下：

```ocaml
let rec read_directory path =
  let dirh = opendir path in
  let rec loop () =
    (* ..... *) in
  Directory (loop ())
```
`opendir` 打开一个路径并返回一个 `dir_handle` ，然后我们会用 `readdir_no_ex` 来读取这个
句柄下的所有名字。这个函数的返回值会是 `Directory fs_list`，所以我们下面我们要完成的是
 `loop` 函数，它会返回一个 `filesystem` 链表。 `loop` 的类型应该是：

```ocaml
loop : unit -> filesystem list
```
那我们该怎么定义`loop`？让我们一步一步地做：

```ocaml
let rec loop () =
  let filename = readdir_no_ex dirh in
  (* ..... *)
```
首先我们要从目录句柄里读取下一个文件名。 `filename` 是一个 `string option`，也就是说它可以是
 `None` 或者 `Some "foo"`， `foo` 是目录下的下一个文件名。我们还要忽略 `"."` 和 `".."` 文件
（分别是当前目录和父目录）。通过模式匹配可以很轻松地实现这一点：

```ocaml
let rec loop () =
  let filename = readdir_no_ex dirh in
  match filename with
  | None -> []
  | Some "." -> loop ()
  | Some ".." -> loop ()
  | Some filename ->
     (* ..... *)
```
`None`的时候很简单，如果`loop`到了目录尾，`loop`要返回一个文件名的链表，但是没有文件名阿，
所以应该返回一个空链表(`[]`)。

对于 `"."` 和 `".."` 我们只要简单地忽略它，再调用一遍 `loop` 即可。

那我们该怎样处理 `loop` 正常返回文件名的情况呢（ `Some filename` 的情况）？令`pathname`
是文件路径，首先我们得先判断这个文件是否目录，如果是的话，我们将
`this`的值设成 `read_directory` 递归调用的返回值，类型是`Directory something`。
注意到整个函数`read_directory` 的返回值是 `Directory (loop ())`。 如果文件是一个
普通文件，则我们让`this`的值是 `File pathname`。然后我们很巧妙地返回 `this :: loop ()`。
这里的 `loop ()` 的递归调用来计算目录的剩余成员，并把这些成员接在 `this` 的后面。

```ocamltop
let rec read_directory path =
  let dirh = opendir path in
  let rec loop () =
    let filename = readdir_no_ex dirh in
    match filename with
    | None -> []
    | Some "." -> loop ()
    | Some ".." -> loop ()
    | Some filename ->
        let pathname = path ^ "/" ^ filename in
        let stat = lstat pathname in
        let this = if stat.st_kind = S_DIR then
                     read_directory pathname
                   else
                     File pathname in
        this :: loop () in
  Directory (loop ())
```
这个递归有点复杂，虽然这个例子是生造的，但这个复杂的递归模式在现实生活中是很典型的。
这个例子主要指出了两个点：

* 用递归来创建一个链表：

    ```ocaml
    let rec loop () =
      a match or if statement
      | base case -> []
      | recursive case -> element :: loop ()
    ```
    把这和之前的`range`函数比较，这个递归的模式是一样的：
    
    ```ocamltop
    let rec range a b =
      if a > b then []            (* Base case *)
      else a :: range (a+1) b     (* Recursive case *)
    ```
	
* 用递归来创建一个树：

    ```ocaml
    let rec read_directory path =
      (* blah blah *)
      if file-is-a-directory then
        read_directory path-to-file
      else
        Leaf file
    ```
    接下来的，不就是几行代码，调用 `read_directory` 并打印其结果罢了：
    
    ```ocaml
    let path = Sys.argv.(1) in
    let fs = read_directory path in
    print_endline (string_of_filesystem fs)
    ```

###  附录
当我把这个例子发到 the caml-list mailing list后，我收到很多回帖。 (
[前方英语注意](http://caml.inria.fr/pub/ml-archives/caml-list/2003/06/2732fbf1bed1ae50fefb6ea410ea9955.en.html).)

首先 `read_directory` 有一个很基本的错误就是当这个函数调用在很大的目录的时候，
这个函数会出错。我也没有显式地调用 `closedir` 关闭这个目录句柄。OCaml的垃圾收集
这里不发挥作用，因为文件句柄是不会被收集和自动关闭的。

这很容易打上补丁：只要在 `read_directory` 的最后调用 `closedir` 一次即可：
```ocaml
let rec read_directory path =
  let dirh = opendir path in
    (* ... *)
  let result = Directory (loop ()) in
  closedir dirh;
  result
```
下一个问题是 `readdir` 会在一个“非异常”情形下抛出一个 `End_of_file` 异常。我不认为
在这个情况下抛异常是一种好的风格。在一般的程序，我完全不想写 `try ... with` 语句，因为
异常往往表示有无法处理的问题发生，比如说用完硬盘或者内存。在程序内部抛出并接收，这不是一个
异常的情况（但是调用`readdir`的程序则要准备处理`End_of_file`异常)。

但是 Eric Cooper 找到一种方式来写这个函数并处理这个异常，而这还是一个函数式中很常用的技术。
这就是传入一个**累积器**来累积函数的返回结果，但是是通过参数传入。实际上累积器表示目前为止
函数的返回值，所以当遇到异常(`End_of_file`)，我们则放弃并返回目前的结果。下面是他的代码。累积器
标红：

```ocamltop
let rec read_filesystem path =
  if (lstat path).st_kind = S_DIR then
    Directory (read_directory path)
  else
    File path
  
and read_directory path =
  let dirh = opendir path in
  let rec loop entries =
    try
      match readdir dirh with
      | "." | ".." -> loop entries
      | filename ->
	     loop (read_filesystem (path ^ "/" ^ filename) :: entries)
    with End_of_file -> entries in
  let list = loop [] in
  closedir dirh;
  list
```
注意 `End_of_file -> entries` 表示当我们遇到异常的时候，直接返回结果。

下面，有人指出最简单的实现方式完全不用递归，而用命令式的循环（最好是while循环），并且
用一个引用的链表来存储所有累积的结果。因为 `readdir` 抛出一个异常，我们有一个简单的方式来
跳出循环，并且在`with`-语句我们可以直接返回 `!list` (解引累积结果)。

这个组织行得通，并且证明了往往这个时候采用命令式的方法是最好的，尤其是这里
`opendir ... readdir ... closedir` 都是命令式的 API。
所以用命令式的解决方案更简单是完全不奇怪的。OCaml不规定原则性的规条，它不会在意
在合理的地方使用命令式的方法。

下面是 Fabrice Le Fessant 提供的解决方法：

```ocaml
let list = ref [] in
let dir = opendir "......." in
try
  while true do
    match readdir dir with
    | "." | ".." -> ()
    | filename -> list := filename :: !list
  done;
  assert false
with End_of_file -> !list
```
###  递归例子：链表中最大的元素
链表的基本递归模式是：

```ocaml
let rec loop () =
  a match or if statement
  | base case -> []
  | recursive case -> element :: loop ()
```
这里的关键是实际上是match / 基本情况 / 递归情况模式。在这个例子里，我们将有两个基本情况
和一个递归情况。不过在我们展示代码之前，首先让我们先考虑以下问题本身。当我们熟虑之后，
解决方案就会自己出现。

首先，我们先清楚链表最大值就是最大的元素（译注：原文废话如此，估计外国人数学太差），比方说
 `[1; 2; 3; 4; 1]`的最大值是 `4`。

那有特殊情况吗？有的，那就是空链表，这时没有最大值，因此我们应该抛出一个异常。

那对于一个只有一个元素的链表呢，如 `[4]` ？很简单，就是这个元素本身。所以 `list_max [4]`
应该返回4， 或者说 `list_max [x]` 应该返回 `x`。

那什么是 `x :: remainder` 的最大值呢？

先考虑一下，比方说你知道了`remainder`的最大值，令其为 `y`。那`x :: remainder`的最大值是
什么？这取决于 `x > y` 还是 `x <= y`。如果 `x` 大于 `y`，则应该是 `x`，否则应该是 `y`。
（译注：鬼佬的数学真的太差了，这都能解释得这么冗长）

那这是否真的可行呢？再看看 `[1; 2; 3; 4; 1]` = `1 :: [2; 3; 4; 1]`。现在`[2; 3; 4; 1]`
的最大值是 `4`。现在我们再看看 `x = 1` 和 `y = 4`。 `x = 1` 没有影响，因为 `y = 4` 更大，
所以整个链表的最大值是 `y = 4`。

让我们直接来看看代码：

```ocamltop
  let rec list_max xs =
    match xs with
    | [] ->   (* empty list: fail *)
	   failwith "list_max called on empty list"
    | [x] -> (* single element list: return the element *)
	   x
    | x :: remainder -> (* multiple element list: recursive case *)
	   max x (list_max remainder)
```
我已经在相应的位置加上了注释。那它是否可行呢？

```ocamltop
list_max [1; 2; 3; 4; 1];;
list_max [];;
list_max [5; 4; 3; 2; 1];;
list_max [5; 4; 3; 2; 1; 100];;
```
注意这个解决方案是 （1） 不同于命令式的for循环 （2）更接近问题的描述本身。函数式程序员
会告诉你这是因为函数式的风格比命令式风格更高级，因此更加好更加简单。不管你是否相信这个说法，
函数式的版本更加容易理解里面的逻辑，因此也更容易证明这段代码是正确的（正确是指数学意义上
程序是可以证明是没有bug的，可以用作空间站，核子反应堆或者其他高质量软件）。

###  尾递归
让我们再来看看 `range` 函数：

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a+1) b
```
下面我将重写这个函数让结构更加清楚点（但是没改变这个函数）：

```ocamltop
let rec range a b =
  if a > b then []
  else
    let result = range (a+1) b in
    a :: result
```
让我们来调用这个函数：

```ocamltop
List.length (range 1 10);;
List.length (range 1 1000000);;
```
这看起来好像是递归的问题，因此整个函数式都是问题。如果我们总是写递归函数，那么我们将终有一天
遇到堆栈溢出。

实际上并不是这样的。编译器会对某种递归进行优化，并把它变成while循环。因此这种形式的递归
只用到常数量的堆栈，且与while循环一样迅速。这些函数叫做**尾递归函数**。

在尾递归函数里，所有的递归调用都在函数的返回点。还记得 `loop ()` 函数吗？它们都有下面的形式：

```ocaml
let rec loop () =
  (* do something *)
  loop ()
```
因为`loop()`的递归调用在最后，因此`loop`是尾递归的，编译器会将其编译成一个while循环。

不幸的是，`range`并不是尾递归的，而更长的版本告诉了我们为什么。 `range` 的递归调用
并不发生在最后，实际上，最后进行的操作是 `::` (cons) 操作。实际上，编译器不会将其
转变成一个while循环，并且这个实现对堆栈也不友好。

记得我们在上面的附录中提到 Eric Cooper 的累积器技巧，而这个技术被广泛使用在函数式中。
我们会知道为什么会这样。这是因为你可以把`range`实现成尾递归的形式，这能让实现更下高效
能接收更大的输入。

让我们用累积器来记录`range`到目前为止的结果：

```ocaml
let rec range2 a b accum =
  (* ... *)
  
let range a b =
  range2 a b []
```
(我可能更加倾向于用嵌套函数)

这里的 `accum` 参数将用来累积结果。我们传入一个空链表。最简单的情况是 `a > b`:

```ocaml
let rec range2 a b accum =
  if a > b then accum
  else
    (* ... *)
```
当 `a > b` (也就是递归该结束了),则该返回结果了 (`accum`)。

现在的问题是写 `else`-语句 来保证 `range2` 在最后才被调用，来使它是一个尾递归函数：

```ocamltop
let rec range2 a b accum =
  if a > b then accum
  else range2 (a+1) b (a :: accum)
```
还有一个小问题：我们把这个链表创建反了。但是这很容易解决：
```ocamltop
let range a b = List.rev (range2 a b []);;
```
现在这段代码可以工作了，尽管它运行得比较慢，因为它真的要创建一个长100w的链表：

```ocamltop
List.length (range 1 1000000)
```
下面的实现基本有上面的两倍快，因为它不用反转整个链表：、

```ocamltop
let rec range2 a b accum =
  if b < a then accum
  else range2 a (b-1) (b :: accum);;
  
let range a b =
  range2 a b [];;
```
这是一个尾递归的简短介绍。但实际上，判断一个函数是否尾递归可以挺难的。那我们学到了什么？
其中一个就是递归函数可以非常危险。你的函数可能在小数据输入时工作正常，但是在大数据量的
时候就会引爆堆栈。这是一个不用递归而应更多用迭代的理由。

## 可变 records, 引用和数组
前面我们提到records，这个C中的 `struct`很像：

```ocamltop
type pair_of_ints = { a : int; b : int };;
{a=3; b=5};;
{a=3};;
```
一点没有提到的是，OCaml的 records 可以有可变的域。通常一个表达式如 `{a = 3; b = 5}`
是不可变的。但是如果一个 record 有 **可变域**，因此可以改变这些域的值。
这是一个OCaml命令式的特性，因为函数式往往不允许可变对象。

这里是一个定义了可变域的对象。这个域是用来数这个对象使用的次数。者可以用作缓冲来
决定哪个对象留在内存：

```ocamltop
type name = { name : string; mutable access_count : int }
```
下面是一个定义在`name`类的函数，它打印`name`域并且增加 `access_count` 域：

```ocamltop
let print_name name =
  print_endline ("The name is " ^ name.name);
  name.access_count <- name.access_count + 1
```
注意到一个奇怪的而非函数式的地方：它修改了 `access_count` 域。如果你认真读了第五章，
你会发现这个函数不是纯的。OCaml是一个函数式语言，但并不强制所有的函数都是纯的。

不管如何，让我们来调用一番：

```ocamltop
let n = { name = "Richard Jones"; access_count = 0 };;
n;;
print_name n;;
n;;
print_name n;;
n;;
```
只有显式地标志 `mutable` 的域可以被`<-` 操作符赋值。如果你对不可变的域赋值，OCaml
则会报错：

```ocamltop
n.name <- "John Smith";;
```
引用是用records和一个可变域 `contents` 来实现的。下面是 `Pervasives` 中的定义：

```ocamltop
type 'a ref = { mutable contents : 'a }
```
并且看清楚Ocaml toplevel如何打印这个引用：

```ocamltop
let r = ref 100;;
```
数组是OCaml中另一种可变的数据结构。在OCaml中，链表对某种操作是比较慢的，比方说跳到
第n个元素或者随机索引，都会很慢。OCaml的`Array`类型是一个真正的数组，所以随机索引很快，但是
插入和删除很慢。 `Array` 相当可变，你可以随便更改元素的值。

数组很容易操作：

```ocamltop
let a = Array.create 10 0;;
for i = 0 to Array.length a - 1 do
  a.(i) <- i
done;;
a;;
```
定义数组的语法是： `[| element; element; ... |]`

OCaml编译是设计成适用于大量数值运算的(大概就是fortran干的那些), 所以它包含很多
数字数组、向量和矩阵相关的优化。下面是一个密集矩阵乘法的跑分（译注：也就是说这个乘法是老老实实
用二位数组表示的）。注意这里用到了for循环，并且变成风格也相当命令式：

```ocamltop
let size = 30

let mkmatrix rows cols =
  let count = ref 1
  and last_col = cols - 1
  and m = Array.make_matrix rows cols 0 in
  for i = 0 to rows - 1 do
    let mi = m.(i) in
    for j = 0 to last_col do
      mi.(j) <- !count;
      incr count
    done;
  done;
  m

let rec inner_loop k v m1i m2 j =
  if k < 0 then v
  else inner_loop (k - 1) (v + m1i.(k) * m2.(k).(j)) m1i m2 j

let mmult rows cols m1 m2 m3 =
  let last_col = cols - 1
  and last_row = rows - 1 in
  for i = 0 to last_row do
    let m1i = m1.(i) and m3i = m3.(i) in
    for j = 0 to last_col do
      m3i.(j) <- inner_loop last_row 0 m1i m2 j
    done;
  done

let () =
  let n =
    try int_of_string Sys.argv.(1)
    with Invalid_argument _ -> 1
  and m1 = mkmatrix size size
  and m2 = mkmatrix size size
  and m3 = Array.make_matrix size size 0 in
  for i = 1 to n - 1 do
    mmult size size m1 m2 m3
  done;
  mmult size size m1 m2 m3;
  Printf.printf "%d %d %d %d\n" m3.(0).(0) m3.(2).(3) m3.(3).(2) m3.(4).(4)

```
