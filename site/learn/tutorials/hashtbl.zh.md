<!-- ((! set title 哈希表 !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Hashtbl

## Hashtbl 模块
Hashtbl模块实现了一个高效的，可变的查询表。如下创建一个哈希表：

```ocamltop
let my_hash = Hashtbl.create 123456;;
```
这个123456是哈希表的初始大小。这个值可以是你对数据量的一种猜测，但是哈希表有可能会
随着数据量的增多而变大，因此用户不用太过在意。`my_hash`的类型是：

```ocaml
val my_hash : ('_a, '_b) Hashtbl.t
```
`'_a` 和 `'_b` 分别是键和值的类型。由于此刻键值的类型还没确定，他们不代表某个特定类型。
这里的下划线表示如果类型一经确定就会被固定下来。也就是说你不能让整型和字符串作为键插入到
同一个哈希表中。

让我们先往`my_hash`加入数据。比方说我们编写一个解纵横字谜的程序，并且想先找出某个字母
为始的所有单词。首先我们需要往`my_hash`中加入数据。

和Map不一样的是，哈希表是直接更新数据结构，而不是每次都新建一个表。因此诸如 
`let my_hash = Hashtbl.add my_hash ...` 这样的代码是没有意义的。我们往往都会如下使用：

```ocamltop
Hashtbl.add my_hash "h" "hello";
Hashtbl.add my_hash "h" "hi";
Hashtbl.add my_hash "h" "hug";
Hashtbl.add my_hash "h" "hard";
Hashtbl.add my_hash "w" "wimp";
Hashtbl.add my_hash "w" "world";
Hashtbl.add my_hash "w" "wine";;
```
如果我们想找出`my_hash`中`"h"`对应的元素，那么应该：

```ocamltop 
Hashtbl.find my_hash "h"
```
注意到这个语句只返回加入`my_mash`的最后一个元素。

那我们如何获取`"h"`所有对应的值呢？没有比下面这段代码更加直观的选择了：

```ocamltop
Hashtbl.find_all my_hash "h"
```
这里返回 `["hard"; "hug"; "hi"; "hello"]`。
如果你移除一个键，那么它对应的前一个值就会变成默认关联的值。
```ocamltop
Hashtbl.remove my_hash "h";;
Hashtbl.find my_hash "h";;
```
这里的旧值被新值隐藏的行为和旧绑定被新绑定隐藏的行为很相似，相当有趣。

在某种情况下，我们更倾向于*替代*前一个值。这时我们应该用`Hashtbl.replace`：

```ocamltop
Hashtbl.replace my_hash "t" "try";
Hashtbl.replace my_hash "t" "test";
Hashtbl.find_all my_hash "t";;
Hashtbl.remove my_hash "t";
Hashtbl.find my_hash "t"
```
当我们想知道 `my_hash`中是否存在某个字母的时候，我们会：

```ocamltop
Hashtbl.mem my_hash "h"
```
