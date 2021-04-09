<!-- ((! set 文件名和后缀 !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

文件名和后缀
===========

这是一个在众多OCaml生成平台上使用的标准**文件名**和后缀名的参考.

源文件和目标文件
----------------

与C语言源文件、目标文件和二进制文件的对照:

<table>
<thead>
<tr class="header">
<th align="left">用途</th>
<th align="left">C</th>
<th align="left">字节码</th>
<th align="left">原生码</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">源文件</td>
<td align="left">*.c</td>
<td align="left">*.ml</td>
<td align="left">*.ml</td>
</tr>
<tr class="even">
<td align="left">头文件<sup>1</sup></td>
<td align="left">*.h</td>
<td align="left">*.mli</td>
<td align="left">*.mli</td>
</tr>
<tr class="odd">
<td align="left">目标文件</td>
<td align="left">*.o</td>
<td align="left">*.cmo</td>
<td align="left">*.cmx<sup>2</sup></td>
</tr>
<tr class="even">
<td align="left">库文件</td>
<td align="left">*.a</td>
<td align="left">*.cma</td>
<td align="left">*.cmxa<sup>3</sup></td>
</tr>
<tr class="odd">
<td align="left">二进制程序</td>
<td align="left">prog</td>
<td align="left">prog</td>
<td align="left">prog.opt<sup>4</sup></td>
</tr>
</tbody>
</table>


### 注释

1.  在C中，头文件用来描述函数等，但只是一项传统而已。而在OCaml中，`*.mli`文件用来导出[模块](modules.html "模块")的签名(signature),且编译器严格执行它。就拿模块的一个叫`Foo`的通用例子来说, 你有两个文件:
    `foo.ml`和`foo.mli`。`foo.ml` 是实现, `foo.mli`是接口或标签.同时注意,要取得模块名得把文件名的首字母大写.例如,
    提扩展库中包括一个名为`uTF8.mli` 的文件，它是模块`UTF8`的标签.
2.  同时存在一个对应的\*.o
    文件,它包含了实际的机器码,但你通常可以忽略它。
3.  同时存在一个对应的
    \*.a文件,它包含了实际的机器码,但你通常可以忽略它。
4.  OCaml程序通常用这个。但事实上, 你可以给这个二进制文件取任意名称.
