<!-- ((! set title Stack !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

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
