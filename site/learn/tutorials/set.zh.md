<!-- ((! set title Set !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Set

## Set模块
如下创建一个字符串集合：

```ocamltop
module SS = Set.Make(String);;
```
然后新建一个空集：

```ocamltop
let s = SS.empty;;
```
不过我们也可以选择创建一个只包含一个元素的集合：

```ocamltop
let s = SS.singleton "hello";;
```
我们还可以向集合中加入元素：

```ocamltop
let s =
  List.fold_right SS.add ["hello"; "world"; "community"; "manager";
                          "stuff"; "blue"; "green"] s;;
```
我们可以通过一个函数来打印一个集合的内容：

```ocamltop
(* 打印出每个字符串并且在最后换行 *)
let print_set s = 
   SS.iter print_endline s;;
```
我们可以通过remove函数移除某个元素。但是当我们想移除很多元素的时候，我们更应该使用`filter`。
下面我们将`filter`掉长度大于5的字符串：

```ocamltop
let my_filter str =
  String.length str <= 5;;
let s2 = SS.filter my_filter s;;
```

用匿名函数(lambda)往往简洁：

```ocamltop
let s2 = SS.filter (fun str -> String.length str <= 5) s;;
```
如果我们想看看某个元素是否在集合内，我们可以这么做：

```ocamltop
SS.mem "hello" s2;;
```

Set模块提供了很多集合论的一些操作，如并，交，差等。比如说我们可以作原集合与字符串长度小于5的集合的差：

```ocamltop
print_set (SS.diff s s2);;
```
要注意的是，Set模块是纯函数式的，每个修改操作都会创建一个新的集合，而不会修改原来的集合。


