<!-- ((! set title Objects !)) ((! set learn !)) -->

# Objects

*Table of contents*

## 对象和类
OCaml是一个面向对象的，命令式的，函数式的语言。它混合了多种编程范式，允许你用最恰当的
（或者最熟悉的）编程范式来解决问题。在这一章我们将 看一下OCaml的面向对象的编程，但是
我也将讲一下你什么时候该用什么时候不该用面向对象。

一个在课堂里典型的OO编程例子是堆栈类。这是一个很糟糕的例子，但是我还是要用这个例子
来展示一下OCaml的OO编程。

下面是一个整数堆栈的例子。这是用链表来实现的：

```ocamltop
class stack_of_ints =
  object (self)
    val mutable the_list = ( [] : int list ) (* instance variable *)
    method push x =                        (* push method *)
      the_list <- x :: the_list
    method pop =                           (* pop method *)
      let result = List.hd the_list in
      the_list <- List.tl the_list;
      result
    method peek =                          (* peek method *)
      List.hd the_list
    method size =                          (* size method *)
      List.length the_list
  end
```
`class name = object (self) ... end` 是定义`name`类的基本模式。

这个类有一个变量 `the_list`， 它是可变的。我们先用一个新鲜的关键字实例化这个变量（每次在`stack_of_ints`
被实例化的时候）。`( [] : int list )` 的意思是 “一个空的`int`链表”。记得一个空
链表`[]`的类型是 `'a list`，是多态的，但是我们想要一个`int`栈，因此我们要在这里清楚地
告诉类型推导引擎这实在是一个整数链表。这个语法是 `( expression : type )`， 意思是`type`
类型的`expression`。这不是一个类型转换，因为你不能用这个语法来跳出类型推导，只是用来
限制多态类型让类型更加明确。因此如果你 `( 1 : float )`:

```ocamltop
(1 : float);;
```

类型安全还是存在的。让我们回到例子。

这个类有四个方法， `push` 把一个整数推进栈， `pop` 则弹出一个整数， `<-` 是用来赋值
可变实例的变量。这和用`<-`赋值record的可变域是一样的。

`peek`返回栈的第一个元素，但不弹出它，而 `size` 返回栈的长度。

让我们写一些代码来测试这个类。首先我们要先实例化一个对象，我们用`new`操作符：

```ocamltop
let s = new stack_of_ints
```
首先我们先推入和弹出一些整数：

```ocamltop
for i = 1 to 10 do
  s#push i
done;;
while s#size > 0 do
  Printf.printf "Popped %d off the stack.\n" s#pop
done;;
```
注意这个语法。 `object#method` 的意思是在 `object` 上调用 `method`。这和
一般语言的 `object.method` 或者 `object->method` 是一样的。

在OCaml toplevel我们可以更清楚地查看对象和方法的类型：

```ocamltop
let s = new stack_of_ints;;
s#push;;
```
`s` 是不透明的，实现是对调用者隐藏的。

###  多态类
虽然整数堆栈很好，但是如果栈是多态的话自然是更好的，正如`'a list`，我们要定义一个 `'a stack`:

```ocamltop
class ['a] stack =
  object (self)
    val mutable list = ( [] : 'a list )  (* instance variable *)
    method push x =                      (* push method *)
      list <- x :: list
    method pop =                         (* pop method *)
      let result = List.hd list in
      list <- List.tl list;
      result
    method peek =                        (* peek method *)
      List.hd list
    method size =                        (* size method *)
      List.length list
  end
```
`class ['a] stack` 并不只定义一个类，而是定义一族类的类，每个类定义一种类型（也就是无穷多个类）。
让我们试一下用 `'a stack` 类。在这里我们创建一个栈并推入一个浮点数。注意看这个栈的类型：

```ocamltop
let s = new stack;;
s#push 1.0;;
s;;
```
现在这个栈是一个 `float stack`，并且只允许浮点数推入和弹出这个堆栈（对 `'_a` 的解释请看 [OCaml expert
FAQ](http://caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html "http://caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html")).
让我们来看看这个 `float stack` 的类型安全:

```ocamltop
s#push 3.0;;
s#pop;;
s#pop;;
s#push "a string";;
```
我们可以定义一个多态函数来操作所有类型的堆栈。首先我们先试试下面的代码：
```ocamltop
let drain_stack s =
  while s#size > 0 do
    ignore (s#pop)
  done
```
注意 `drain_stack` 的类型，OCaml的类型推导引擎相当聪明，可以推导出 `drain_stack` 可以操作在
所有有 `pop` 和 `size` 方法的对象上！所以如果我们定义另一个有`pop`和`size`方法的类，
那么我们可以把 `drain_stack` 应用到相应的对象上。

我们可以强制OCaml接收更加特定的类型，只允许 `drain_stack` 接收 `'a stack`：

```ocamltop
let drain_stack (s : 'a stack) =
  while s#size > 0 do
    ignore (s#pop)
  done
```

###  继承，虚类，初始器
我注意到Java程序员往往滥用继承，可能是因为这是语言允许的唯一方式来扩展代码。一个更好
的方式是用钩子(cf. 如Apache模块的 API)。注意在一些情况下继承是很有用的，尤其是在写
GUI部件库上。

让我们来考虑一个空造的和Swing类似的OCaml部件库。我们想用下面的类等级结构定义按钮和标签：

```
widget  (所有部件的超级类)
  |
  +----> container  (装部件的部件)
  |        |
  |        +----> button
  |
  +-------------> label
```
(注意到一个 `button` 是 `container` 因为它可以根据情况，装图片或者标签)。

`widget`是一个虚超级类，我希望每个部件又有一个名字，下面是我第一段代码：

```ocamltop
class virtual widget name =
  object (self)
    method get_name =
      name
    method virtual repaint : unit
  end
```
噢！我忘了OCaml不能推导出 `name` 的类型，所以会是 `'a`。但是这定义了一个多态类型，并且
我没有定义是如此 (`class ['a] widget`)。因此我要把`name`限制成字符串：
```ocamltop
class virtual widget (name : string) =
  object (self)
    method get_name =
      name
    method virtual repaint : unit
  end
```
这段代码里有几个新东西，首先这里有一个 **初始器**。`name` 是类的参数，你可以认为它
是如同Java构造器的参数（译注：这里的没啥区别，但是初始器有点像是默认的构造器）：

```java
public class Widget
{
  public Widget (String name)
  {
    ...
  }
}
```
在OCaml，一个构造器构造整个类的实体，而不仅仅是某个方法，因此我们把这些参数写成是
类的参数的形式：

```ocaml
class foo arg1 arg2 ... =
```
然后，这个类里包含了一个虚方法，因此整个类都是虚的。这个虚方法是 `repaint`。
我需要告诉OCaml这个方法是虚的 (`method virtual`)，并且我们要告诉OCaml这个
方法的类型。因为这个方法没有实体，因此不可能推导出方法的类型。这里这个方法返回`unit`。
如果你的类包含任何虚方法（包括继承来的），你需要把类定义成虚的 `class virtual ...`。

如同C++和Java，虚类不能被直接实例化：

```ocamltop
let w = new widget "my widget"
```
现在 `container` 类的实现更加有趣。它要继承 `widget` 并且还要储存一系列的子部件。
下面是 `container` 的一个简单的实现：

```ocamltop
class virtual container name =
  object (self)
    inherit widget name
    val mutable widgets = ( [] : widget list )
    method add w =
      widgets <- w :: widgets
    method get_widgets =
      widgets
    method repaint =
      List.iter (fun w -> w#repaint) widgets
  end
```

注意：

1. `container` 类是虚的，但是它没有任何虚方法，但是我不想这个类被实例化。
1. `container` 类有一个 `name` 参数，会直接用来传入 `widget` 的参数。
1. `inherit widget name` 的意思是 `container` 继承了 `widget`，
并且把它的参数 `name` 传入了 `widget` 的构造器。
1. `container` 包含一个可变链表来包含部件；方法 `add` 会把一个部件加入
链表， `get_widgets` 会返回所有的子部件。
1. `get_widgets` 返回的链表不能被类外部代码修改。这个理由主要是因为OCaml
的链表是不可变的，比方说：

    ```ocaml
    let list = container#get_widgets in
    x :: list
    ```

这段代码会把`x`加到实例`container`内部的`widgets`成员里吗？显然是不会的。 `widgets`
成员是不会内任何外部方法改变的。也就是说，你可以随后修改这个域具体的容器，比方说数组，
而不用修改类外的任何代码。

最后，我们已经实现了`repaint` 虚方法，因此 `container#repaint` 会重画所有的子部件。
注意到我们用到了 `List.iter` 来迭代整个链表，并且我还用到了诸位不太熟悉的lambda表达式：

```ocamltop
(fun w -> w#repaint)
```

这定义了一个匿名函数，它有一个参数 `w` 而函数体只是简单的 `w#repaint`。

下面是 `button` 类的简单实现（只不过过度简单化了）：

```ocamltop
type button_state = Released | Pressed;;
  
class button ?callback name =
  object (self)
    inherit container name as super
    val mutable state = Released
    method press =
      state <- Pressed;
      match callback with
      | None -> ()
      | Some f -> f ()
    method release =
      state <- Released
    method repaint =
      super#repaint;
      print_endline ("Button being repainted, state is " ^
                     (match state with
                      | Pressed -> "Pressed"
                      | Released -> "Released"))
  end
```

注意：

1. 这个类有一个可选参数（参看前章），用来传入可选回调函数的，这个回调函数会在按钮按下的时候
被调用。
1. 表达式 `inherit container name as super`把超级类命名成 `super`。
我们在 `super#repaint` 用到了`super`。这个调用了超级类的方法。
1. 按下按钮 (调用`button#press`) 会把状态设成 `Pressed` 并且调用回调函数。注意到 `callback`
是一个`Option`，可能值是 `None` 或者`Some f`，也就是说类型是 `(unit -> unit) option`。
如果你不太理解这一段，请重新阅读前一章。
1. 注意到 `callback` 变量一个奇怪的地方是，它是作为类参数定义的，但所有方法都能看见并调用它。
也就是说这个变量在对象实例化的时候就传入了，并随对象存在。
1. `repaint` 方法已经被实现，它调用了超级类的`repaint`的方法，然后重新画按钮，然后显示按钮的当前状态。

在我们定义 `label` 类之前，让我们在OCaml toplevel中先试一下 `button` 类：

```ocamltop
let b = new button ~callback:(fun () -> print_endline "Ouch!") "button";;
b#repaint;;
b#press;;
b#repaint;;
b#release;;
```
下面是 `label` 类的实现，相对无聊：

```ocamltop
class label name text =
  object (self)
    inherit widget name
    method repaint =
      print_endline ("Label: " ^ text)
  end;;
```
让我们创建一个 "Press me!" 的标签并将其加入按钮中：

```ocamltop
let l = new label "label" "Press me!";;
b#add l;;
b#repaint;;
```

###  关于 `self`
在所有的例子中，我们用到了定义类的通用模式：

```ocaml
class name =
  object (self)
    (* ... *)
  end
```
我还没有解释 `self` 引用。实际上它是对象的名字，允许你调用同一个类的其他方法，
或者把对象传到类外面的方法。也就是说它完全就和 C++/Java 中的 `this` 和 Perl
中的`$self`是同一回事。如果你不用引用实例本身，你可以完全忽略 `(self)`，而实际上
在所有的例子中，我们完全可以忽略它。但是我回建议你加上这一行，因为你不可能知道
你在未来会不会需要它。加上它只有百利而无一害。

### 继承和强制多态

```ocamltop
let b = new button "button";;
let l = new label "label" "Press me!";;
[b; l];;
```
我创造了一个按钮`b`和一个标签`l`，然后我要创造一个链表来装入两个实例，但是我却得到
一个错误。但是 `b` 和 `l` 确实是 `widget`，那为什么我们不能把它们装到一个容器里呢？
是因为OCaml不能猜到我想要一个 `widget list`? 那让我们来告诉它：

```ocamltop
let wl = ([] : widget list);;
let wl = b :: wl;;
```
OCaml一般不会把子类转型到超级类，但是你可以用`:>`操作符来使其“不一般”：

```ocamltop
let wl = (b :> widget) :: wl;;
let wl = (l :> widget) :: wl;;
```
 `(b :> widget)` 的意思是把 `b` 转型成 `widget`。类型安全同样存在，因为转型的结果
成功与否是可以在编译时就知道的。

实际上转型比上面所说的更麻烦，所以我劝告你认真好好地读一读手册。

上面的`container#add` 的定义实际上是错误的除非你对参数进行转型。

那能否从超级类转型到子类呢？答案是，做好心理准备，绝对不能。这个方向的转型是不安全的，
因为你可能把一个 `label` 转型成 `button`。（译注：也就是说OCaml没有运行时的类型检查，
所以运行地很快）

Java程序员应该对从超级类到子类的转型的问题很熟悉。Java的容器装有`Object`，并当你想从
容器里获取一个元素的时候，你必须将这个元素转型回原来的类型（译注：这在Java引入泛型之前
是真的，但就算引入了泛型，Java的类型系统还不是完全的，欢迎参考相关书籍）。这有可能会引起
 `ClassCastException` 异常。OCaml是强类型的，并且消除运行时类型检查是目标之一，这就是
为什么这个操作是不允许的。

多态和函数式变成应该可能移除很多从超级类到子类的转型。Java的容器只能存贮`Object`是因为
Java没有泛型（译注：这个教程有点太老了）。这是Java的一个错误，并且有望在Java 1.5被修复。
在OCaml中，定义一个如`'a list` 或 `'a stack`多态类是很简单的。但如果你在OCaml中做
扩展性强的OO编程，那么终有一天你可能会需要这样的转型。或许这就是你应该尝试以函数式
的方式先实现你的解决方案，只有在一些特殊的情况下才用OO来解决一些问题。

[Yamagata Yoriyuki 说类型安全的下转型是可能的，高级读者请看：
[http://caml.inria.fr/pub/ml-archives/caml-list/2002/05/a6520926c4eac029206a31d6aa22f967.fr.html](http://caml.inria.fr/pub/ml-archives/caml-list/2002/05/a6520926c4eac029206a31d6aa22f967.fr.html)
且有
[hweak](http://remi.vanicat.free.fr/ocaml/hweak/ "http://remi.vanicat.free.fr/ocaml/hweak/")]

###  `Oo` 模块和比较对象
`Oo` 模块包含了一些OO编程中的一些有用的函数。

`Oo.copy` 可以浅拷贝一个对象。 `Oo.id object` 可以返回全局唯一的对象标签。

`=` 和 `<>` 可以用来比较对象的物理等同（一个拷贝和对象本身不是物理等同的）。你可以
用 `<` 等来用ID来比较大小。

## 没有类的对象
下面是一些不定义类就使用对象的例子。

###  立即对象和立即类型
对象可以当作record来使用，并且有一些特性让他们在某些情况下比record更好使。我们知道
标准创立对象的方式是先定义类，然后用这个类来创建对象。这可能在某些情况下会比较麻烦，
因为类定义往往有很多类型定义且不能递归地和类型一起定义。但是对象可以和record很相象，
并可以用到类型定义上。并且，对象可以不用类定义就实例化。他们叫做 *立即对象*。下面是一些例子：

```ocamltop
let o =
  object
    val mutable n = 0
    method incr = n <- n + 1
    method get = n
  end
```
这个对象有一个类型，这个类型是被公共方法定义的。值和私有方法是不可见的。和record不一样的，
是这个类型不用预先定义。这样做还可以让事情变的更清楚些：
```ocamltop
type counter = < get : int;  incr : unit >
```

比较一下record等价的定义：
```ocamltop
type counter_r = { get : unit -> int;
                   incr : unit -> unit }
```
record值的定义如下：

```ocamltop
let r =
  let n = ref 0 in
  { get = (fun () -> !n);
    incr = (fun () -> incr n) }
```
在功能上来讲，两者差不多，但是这种方法有其优点：

* **速度**: 访问要稍微快一些
* **域名**: 有时候一些record有域名相同的时候很难处理好它们，但是当使用对象
的时候就很好解决。
* **子类型**: 把record转型到更少域的record是不可能的，但这对于对象确是可能的，
所以只要对象有一些共同签名的方法，你就可以在一些数据结构混着用它们
* **类型定义**: 没有必要预先定义一个对象的类型，所以这轻量化模块之间依赖的限制

###  类类型和类型
注意不要混淆*类类型*和对象*类型*。一个*类类型*不是一个数据类型，后者是在OCaml中一般被指代
为类型。一个对象类型是一种数据结构，和record类型和tuple是类似的。

当一个类型定义的时候，两个同名的*类类型*和对象*类型*被创建：

```ocamltop
class t =
  object
    val x = 0
    method get = x
  end
```
`object val x : int method get : int end` 是一个类类型。

在这个例子里，`t`也是实例对象的类型。它的实例也可以和其他类的实例或者立即对象混在一起，只要
它们的类型（公共方法）是一样就可以了。

```ocamltop
let x = object method get = 123 end;;
let l = [ new t; x ];;
```
和有共同子类的实例混在一起也是可以的，这时候需要 `:>` 操作符：

```ocamltop
let x = object method get = 123 end;;
let y = object method get = 80 method special = "hello" end;;
let l = [ x; y ];;
let l = [ x; (y :> t) ];;
```

## 更多对象
OCaml手册，第三章，包含对象和类的规范。在里面还有我没有提到的内容，比方说：

* 私有方法
* 复杂构造器
* 接口
* 多继承
* 多态方法
* 更多转型的细节
* 函数式的对象
* 克隆对象的细节
* 互递归类型
* 二叉方法
* 朋友方法，类
