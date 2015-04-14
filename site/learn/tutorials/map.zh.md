<!-- ((! set title Map !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Map

## Map模块
Map创建一种映射关系。比方说，我们需要关联一组用户及其对应的密码，这里存在从用户到密码的
映射关系，可以通过Map模块通过函数式的方式相当迅速地来处理。在下面的例子中我将创建一个从
字符串到字符串的映射，当然这只是例子，映射的类型是很随意的。

创建一个Map是很容易的：

```ocamltop
module MyUsers = Map.Make(String);;
```

我们现在已经创建了一个新的模块，叫做 `MyUsers`。现在我们要往里面加入数据，但是首先，我们先
新建一个空的映射：

```ocamltop
let m = MyUsers.empty;;
```
然后再往里面加数据:

```ocamltop
let m = MyUsers.add "fred" "sugarplums" m;;
```
`m`是一个全新的映射，因此前一个`m`已经被隐藏掉。这个`m`比前一个多了用户
"fred" 和他的密码 "sugarplums"。有一点很值得指出的是，当我们加入字符串 "sugarplums" 
的时候，我们已经固定了映射的目标类型。这也就是说，我们的模块`MyUsers`成为了一个*只能*从字符串到字符串
的映射。如果我们想插入一个整数作为键还是值，都必须创建一个新的映射。

让我们加入更多的数据。

```ocamltop
let m = MyUsers.add "tom" "ilovelucy" m;;
let m = MyUsers.add "mark" "ocamlrules" m;;
let m = MyUsers.add "pete" "linux" m;;
```
但是我们也得看得到里面的数据啊？一个函数足以完成这个任务：

```ocamltop
let print_users key password =
  print_string(key ^ " " ^ password ^ "\n");;
```

通过传入两个字符串到该函数，就能在屏幕很好地打印出键和密码，并且换行。然后我们得把这个函数
应用到映射的每对键值对上：

```ocamltop
MyUsers.iter print_users m;;
```
当然，有时候我们只想找到(find)某个用户的密码：

```ocamltop
MyUsers.find "fred" m;;
```
这个调用会很迅速地返回Fred的密码: "sugarplums"。


