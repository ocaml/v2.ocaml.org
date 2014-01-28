<!-- ((! set title Ocaml程序的结构 !)) ((! set learn !)) -->

*Table of contents*

Ocaml程序的结构
==============

Ocaml程序的结构
--------------

现在我们将从整体上观察一些OCaml程序。我将传授以下内容：局部和全局定义，何时使用`;;`而何时用`;`，模块，嵌套函数，以及引用。为此我们会见到很多现在还不理解意义的目前还未接触过的OCaml概念。不用担心这些细节，只要专注于程序的整体形状以及我指出的那些特性。

### 局部"变量"(*实际是*局部表达式)

我们来看C中的`average`函数并且加一个局部变量。

    double
    average (double a, double b)
    {
      double sum = a + b;
      return sum / 2;
    }

现在来对OCaml版本做同样的事：

```ocaml
let average a b =
  let sum = a +. b in
  sum /. 2.0
```

标准短语`let name = expression in`用来定义一个命名的局部表达式。以后`name`在这个函数中就可以用来代替`expression`，直到一个`;;`结束本代码块。注意我们在`in`之后并不缩进.只要把`let ... in`看作是一个整体就可以。

现在我们比较一下C局部变量和这些命名的局部表达式的区别。它们是不一样的。C变量`sum`在栈上有已经分配的位置，如果你需要你可以稍后在函数中给它赋值，甚至可以直接得到它的地址值。而在OCaml中却不能这样。OCaml中`sum`只是表达式`a +. b`的简短别名。我们无法给`sum`赋值或改值。（稍后我们会看到对真正的变量我们可以这样做。）

下面的例子更清楚地说明这个区别。下面的两段代码返回同样的值（(a+b) +
(a+b)^2^）：

    let f a b =
      (a +. b) +. (a +. b) ** 2.
      ;;

    let f a b =
      let x = a +. b in
      x +. x ** 2.
      ;;

后者可能快一些（但大多数编译器应该可以做到“消除公共子表达式”。），而且可读性更强。后者中的`x`只是`a +. b`的缩略名称.

### 全局“变量”（*实际是*全局表达式)

我们也可以在top
level中象上面定义局部“变量”那样定义全局名，但实际上这些都不是真正的变量，而只是缩略名。下面是一个缩减后的实际代码：

    let html =
      let content = read_whole_file file in
      GHtml.html_from_string content
      ;;

    let menu_bold () =
      match bold_button#active with
        true -> html#set_font_style ~enable:[`BOLD] ()
      | false -> html#set_font_style ~disable:[`BOLD] ()
      ;;

    let main () =
      (* code omitted *)
      factory#add_item "Cut" ~key:_X ~callback: html#cut
      ;;

在这段实际代码中，`html`是一个HTML编辑小部件（widget）（来自lablgtk库的一个对象），它在程序开始处被第一个`let html =`语句创造，而后在以后的几个函数中被引用。

注意上面程序段中的`html`名不是象C或其他命令式语言中那样的真正的全局变量。并没有空间被分配用来保存“`html`指针”，也无法给`html`赋值，比如，让它指向另一个小部件。以后的章节中我们会介绍真正的变量：引用。

### Let－绑定

任何`let ...`，无论是在top
level（全局）还是在一个函数中，经常被称作**let-绑定（binding）**.

### 引用：真正的变量

如果我们需要真正的可赋值和改值的变量怎么办？我们需要用到**引用**。引用很象C/C++中的指针.在Java中，所有存放对象的变量实际都是指向对象的指针。在Perl中，引用就是引用，和OCaml一样。

下面举例说明在OCaml中怎样创造一个int的引用：

    ref 0;;

实际这个语句并无用处。我们创造了一个引用，但是因为没有命名它会被垃圾收集器立刻收走。（实际上在编译时就可能被扔掉。）我们来命名一个引用。

    let my_ref = ref 0;;

此引用现在保存一个整数0。让我们给它赋其他值：

    my_ref := 100;;

然后我们来看这个引用包含的值：

    # !my_ref;;
    - : int = 100

因此，`:=`操作符用来给引用赋值，`!`操作符用来取出引用的值（解引用）。
下面是一个粗略的比较：

    OCaml                   C/C++

    let my_ref = ref 0;;    int a = 0; int *my_ptr = &a;
    my_ref := 100;;         *my_ptr = 100;
    !my_ref                 *my_ptr

引用是有用的，但你会发现你不会经常用它。在函数定义中用`let name = expression in`来命名局部表达式将会常用得多。

### 嵌套函数

C中事实上没有嵌套函数的概念。GCC对C支持嵌套函数但是我发现几乎没有程序用到这个扩展。不管怎样，下面是GCC的info页给出的关于嵌套函数的说明：

“嵌套函数”是在另一个函数内部定义的函数。（GNU C＋＋
不支持嵌套函数）嵌套函数的名字域是它被定义的那个程序块。例如：下面我们定义一个名为‘square‘的嵌套函数，然后调用它两次：

    foo (double a, double b)
    {
      double square (double z) { return z * z; }

      return square (a) + square (b);
    }

嵌套函数可以使用包含它的函数当前可见的所有变量。这就是"lexical
scoping"。例如，下面我们演示一个嵌套函数如何使用一个名为'offset'的继承变量。

    bar (int *array, int offset, int size)
    {
      int access (int *array, int index)
        { return array[index + offset]; }
      int i;
      /* ... */
      for (i = 0; i < size; i++)
        /* ... */ access (array, i) /* ... */
    }

现在你明白了吧？继承函数在OCaml中是非常有用也是非常常用的。下面是真实代码中的嵌套函数的例子：

    let read_whole_channel chan =
      let buf = Buffer.create 4096 in
      let rec loop () =
        let newline = input_line chan in
        Buffer.add_string buf newline;
        Buffer.add_char buf '\n';
        loop ()
      in
      try
        loop ()
      with
        End_of_file -> Buffer.contents buf;;

不用担心这段代码在干什么－它包含了很多我们还未涉及的概念。只要专注于名叫`loop`的只有一个
unit
参数的嵌套函数就可以了。你可以在函数`read_whole_channel`中来调用函数`loop()`，但是它在`read_whole_channel`函数外是没有定义的。嵌套函数可以使用主函数中定义的变量。（这里`loop`使用了局部变量`buf`）。

嵌套函数的格式和局部命名表达式相同。`let name arguments = function-definition in`.

通常我们如上面的例子中那样让函数定义缩进，如果你函数是递归的记住用`let rec`代替`let`，如上面的例子中那样。

### 模块和`open`

OCaml带有很多有趣的模块（含有用代码的库）。例如标准模块中有画图、与GUI小部件（widget）交互、处理大数、数据结构、POSIX系统调用等模块。这些库位于`/usr/lib/ocaml/VERSION/`
（当然是指在Unix系统下的情况）。
现在我们专注于一个比较简单的模块`Graphics`。

模块`Graphics`安装在5个文件中（在我的系统上）：

    /usr/lib/ocaml/3.08/graphics.a
    /usr/lib/ocaml/3.08/graphics.cma
    /usr/lib/ocaml/3.08/graphics.cmi
    /usr/lib/ocaml/3.08/graphics.cmxa
    /usr/lib/ocaml/3.08/graphics.mli

现在我们只专注于`graphics.mli`文件.这是一个text文件，因而是可读的。首先注意文件名是`graphics.mli`而不是`Graphics.mli`。OCaml通常将文件名的第一个字母大写作为模块名。如果不知道这一点的话这有些容易使人混淆。

如果你想用`Graphics`中的函数，存在两种方法。一是在程序开头声明`open Graphics;;`。二是在所有函数调用前加上前缀，比如`Graphics.open_graph`。`open`
有点象Java中的`import`语句，不过更象Perl中的 `use`语句。

[Windows用户：必须使用一个定制的toplevel才可以使这个例子能够正常的在交互模式下使用。在命令行中键入命令
`ocamlmktop -o ocaml-graphics graphics.cma`。]

下面几个例子将更好的说明。（下面两个例子画出不同的东西，你可以自己试一下）。注意第一个例子调用A`open_graph`，而第二个使用`Graphics.open_graph`。

    (* 用 ocamlc graphics.cma grtest1.ml -o grtest1 来编译这个程序*)

    open Graphics;;

    open_graph " 640x480";;
    for i = 12 downto 1 do
      let radius = i * 20 in
      set_color (if (i mod 2) = 0 then red else yellow);
      fill_circle 320 240 radius
    done;;
    read_line ();;

    (* 用 ocamlc graphics.cma grtest2.ml -o grtest2 来编译这个程序*)

    Random.self_init ();;
    Graphics.open_graph " 640x480";;

    let rec iterate r x_init i =
            if i = 1 then x_init
            else
                    let x = iterate r x_init (i-1) in
                    r *. x *. (1.0 -. x);;

    for x = 0 to 639 do
            let r = 4.0 *. (float_of_int x) /. 640.0 in
            for i = 0 to 39 do
                    let x_init = Random.float 1.0 in
                    let x_final = iterate r x_init 500 in
                    let y = int_of_float (x_final *. 480.) in
                    Graphics.plot x y
            done
    done;;

    read_line ();;

两个例子都用到了一些我们还没有涉及的特性：命令风格的for循环，if-then-else和递归。我们将在以后介绍。不过我们应该观察这些程序而试着发现（1）它们的原理，（2）类型推导如何帮助我们消除bugs。

### `Pervasives`模块

有一个模块我们无需使用"`open`"。这就是`Pervasives`模块（你可以阅读`/usr/lib/ocaml/3.08/pervasives.mli`）。所有`Pervasives`中的符号会被自动引入所有的OCaml程序中。

### 重命名模块

如果你想用`Graphics`模块中的符号，但是不想全部引入它们而又觉得每次使用前缀`Graphics`太麻烦，那怎么办呢？
你可以象下面这样重命名它们:

    module Gr = Graphics;;

    Gr.open_graph " 640x480";;
    Gr.fill_circle 320 240 240;;
    read_line ();;

实际上这在引入一个嵌套模块（模块可以被嵌套）而又不想每次键入完整路径名的时候非常有用。

### 使用`;;`或`;`或两者都不用。

现在，我们将看看一个很重要的概念，什么时候你应该使用`;;`，什么时候你应该使用`;`，什么时候你都不用。这是一个很有意思的窍门，除非你能真正掌握这点。而且往往也会花费初学者很长的时间来掌握。

规则\#1：你必须使用`;;`在代码的最顶端来分隔不同的语句。并且*绝对*不要在函数定义中或者其他的语句中使用。

首先看看以下的一段代码：

    Random.self_init ();;
    Graphics.open_graph " 640x480";;

    let rec iterate r x_init i =
            if i = 1 then x_init
            else
                    let x = iterate r x_init (i-1) in
                    r *. x *. (1.0 -. x);;

我们有两个顶层代码和一个函数定义。（函数名为`iterate`），每一句都用`;;`分隔。

规则\#2：*有时候*你可以省略掉`;;`。初学者可以不用考虑这个问题，而总是按照第一条规则使用`;;`。既然后面将要看到别人写的一些代码，你还是需要知道什么时候我们可以省略`;;`\>。可以省略的地方是：

-   关键字`let`之前。
-   关键字`open`之前。
-   关键字`type`之前。
-   文件的最后。
-   一些其他（非常少）Ocaml能够“猜出”是语句结尾而不是中间的地方。

下面是一些正确省略了所有`;;`的代码：

    open Random                   (* ;; *)
    open Graphics;;

    self_init ();;
    open_graph " 640x480"         (* ;; *)

    let rec iterate r x_init i =
            if i = 1 then x_init
            else
                    let x = iterate r x_init (i-1) in
                    r *. x *. (1.0 -. x);;

    for x = 0 to 639 do
            let r = 4.0 *. (float_of_int x) /. 640.0 in
            for i = 0 to 39 do
                    let x_init = Random.float 1.0 in
                    let x_final = iterate r x_init 500 in
                    let y = int_of_float (x_final *. 480.) in
                    Graphics.plot x y
            done
    done;;

    read_line ()                  (* ;; *)

规则\#3和规则\#4是关于单独的`;`。它与`;;`完全不同。单独的分号`;`被称作**连接点**（sequence
point)，具有在C，C++，Java和Perl中一样的用途。我打赌你不知道它表示“先执行这个位置之前的语句，执行完成之后继续之后的语句”。

规则\#3：把`let ... in`看作一条语句，永远不要在它后面加上单独的`;`。

规则\#4：在所有代码块中其他的语句后面跟上一个单独的`;`，最后一个*例外*。

上面示例中的for循环内部就是一个很好的例子。
请注意我们从来都不会在下面的代码中使用单独的`;`：

            for i = 0 to 39 do
                    let x_init = Random.float 1.0 in
                    let x_final = iterate r x_init 500 in
                    let y = int_of_float (x_final *. 480.) in
                    Graphics.plot x y
            done

上面代码中唯一可能考虑加上`;`的地方是在`Graphics.plot x y`的后面，但是因为这是代码块中的最后一条语句，规则\#4要求我们不要加在这里。

**“；”注解：**Brian Hurt更正了一些我对于";"的观点。
`;`是和`+`一样的运算符。当然只是概念上的，并不完全一样。`+`具有`int -> int -> int`类型
- 接受两个整型并返回一个整型（求和）。`;`的类型是`unit -> 'b -> 'b` -
接受两个值并简单返回第二个。就像C中的`,`（逗号）运算符，你可以如同`a + b + c + d`一样写`a ; b ; c ; d`。

几乎任何东西都是表达式，这是OCaml中一个从未很好描述过的“脑筋急转弯”("mental
leaps")。`if/then/else`是一个表达式。 `a ; b`
是一个表达式。`match foo with ...`是一个表达式。下面的代码完全合法（并且都是作同样一件事）：

    let f x b y = if b then x+y else x+0

    let f x b y = x + (if b then y else 0)

    let f x b y = x + (match b with true -> y | false -> 0)

    let f x b y = x + (let g z = function true -> z | false -> 0 in g y b)

    let f x b y = x + (let _ = y + 3 in (); if b then y else 0)

特别注意最后一个，用了`;`作为运算符“联合”("join")两个语句。OCaml所有的函数可以表示成：

    let name [parameters] = expression

OCaml关于表达式的定义只比C广一点。事实上，C有"statements"的概念，但是所有C的语句只是OCaml的表达式(和`;`运算符一起)。

`;`不同于`+`的一个地方是不能像函数一样引用`+`。比如，可以定义一个对一列整数求和的函数`sum_list`：

    let sum_list = List.fold_left ( + ) 0

### Putting it all together: some real code

In this section we're going to show some real code fragments from the
lablgtk 1.2 library. (Lablgtk is the OCaml interface to the native Unix
Gtk widget library). A word of warning: these fragments contain a lot of
ideas which we haven't discussed yet. Don't look at the details, look
instead at the overall shape of the code, where the authors used `;;`,
where they used `;` and where they used `open`, how they indented the
code, how they used local and global named expressions.

... However, I'll give you some clues so you don't get totally lost!

-   `?foo` and `~foo` is OCaml's way of doing optional and named
    arguments to functions. There is no real parallel to this in
    C-derived languages, but Perl, Python and Smalltalk all have this
    concept that you can name the arguments in a function call, omit
    some of them, and supply the others in any order you like.
-   `foo#bar` is a method invocation (calling a method called `bar` on
    an object called `foo`). It's similar to `foo->bar` or `foo.bar` or
    `$foo->bar` in C++, Java or Perl respectively.

First snippet: The programmer opens a couple of standard libraries
(eliding the `;;` because the next keyword is `open` and `let`
respectively). He then creates a function called `file_dialog`. Inside
this function he defines a named expression called `sel` using a
two-line `let sel = ... in` statement. Then he calls several methods on
`sel`.

    (* First snippet *)

    open StdLabels
    open GMain

    let file_dialog ~title ~callback ?filename () =
      let sel =
        GWindow.file_selection ~title ~modal:true ?filename () in
      sel#cancel_button#connect#clicked ~callback:sel#destroy;
      sel#ok_button#connect#clicked ~callback:do_ok;
      sel#show ()

Second snippet: Just a long list of global names at the top level.
Notice that the author elided every single one of the `;;` because of
Rule \#2.

    (* Second snippet *)

    let window = GWindow.window ~width:500 ~height:300 ~title:"editor" ()
    let vbox = GPack.vbox ~packing:window#add ()

    let menubar = GMenu.menu_bar ~packing:vbox#pack ()
    let factory = new GMenu.factory menubar
    let accel_group = factory#accel_group
    let file_menu = factory#add_submenu "File"
    let edit_menu = factory#add_submenu "Edit"

    let hbox = GPack.hbox ~packing:vbox#add ()
    let editor = new editor ~packing:hbox#add ()
    let scrollbar = GRange.scrollbar `VERTICAL ~packing:hbox#pack ()

Third snippet: The author imports all the symbols from the `GdkKeysyms`
module. Now we have an unusual let-binding. `let _ = expression` means
"calculate the value of the expression (with all the side-effects that
may entail), but throw away the result". In this case, "calculate the
value of the expression" means to run `Main.main ()` which is Gtk's main
loop, which has the side-effect of popping the window onto the screen
and running the whole application. The "result" of `Main.main ()` is
insignificant - probably a `unit` return value, but I haven't checked -
and it doesn't get returned until the application finally exits.

Notice in this snippet how we have a long series of essentially
procedural commands. This is really a classic imperative program.

    (* Third snippet *)

    open GdkKeysyms

    let _ =
      window#connect#destroy ~callback:Main.quit;
      let factory = new GMenu.factory file_menu ~accel_group in
      factory#add_item "Open..." ~key:_O ~callback:editor#open_file;
      factory#add_item "Save" ~key:_S ~callback:editor#save_file;
      factory#add_item "Save as..." ~callback:editor#save_dialog;
      factory#add_separator ();
      factory#add_item "Quit" ~key:_Q ~callback:window#destroy;
      let factory = new GMenu.factory edit_menu ~accel_group in
      factory#add_item "Copy" ~key:_C ~callback:editor#text#copy_clipboard;
      factory#add_item "Cut" ~key:_X ~callback:editor#text#cut_clipboard;
      factory#add_item "Paste" ~key:_V ~callback:editor#text#paste_clipboard;
      factory#add_separator ();
      factory#add_check_item "Word wrap" ~active:false
        ~callback:editor#text#set_word_wrap;
      factory#add_check_item "Read only" ~active:false
        ~callback:(fun b -> editor#text#set_editable (not b));
      window#add_accel_group accel_group;
      editor#text#event#connect#button_press
        ~callback:(fun ev ->
          let button = GdkEvent.Button.button ev in
          if button = 3 then begin
            file_menu#popup ~button ~time:(GdkEvent.Button.time ev); true
          end else false);
      editor#text#set_vadjustment scrollbar#adjustment;
      window#show ();
      Main.main ()
