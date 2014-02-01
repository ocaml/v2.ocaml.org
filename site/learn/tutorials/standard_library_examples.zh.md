<!-- ((! set title 标准库示例 !)) ((! set learn !)) -->

标准库示例
=========

**标准库示例**

- [哈希表](hashtbl.html "Hashtbl")
- [集合](set.html "Set")
- [映射表](map.html "Map")

参见： [Comparison of Standard
Containers](comparison_of_standard_containers.html)

以stack为例

编写如下一行代码即可看见Stack库中的函数定义。

```ocaml
module MyStack = Stack
```

创建一个自己的stack

```ocaml
let myStack ＝ Stack.create ()
```

注意括号匹配函数中的unit参数，这是必须的。

然后即可进行你所希望的push以及pop等操作了。

```ocaml
Stack.push "hello" myStack
```

稍微复杂一些的例如Set，使用的时候需要定义类型，用到了functor。

如下代码定义了一个string类型的集合模块：

```ocaml
module MySet = Set.Make(String)
```

然后可以像使用Stack那样使用你的集合了，例如定义一个空的集合：

```ocaml
let mySet = Myset.empty
```

注意集合分为集合本身的类型和集合中元素的类型。
