<!-- ((! set title Garbage Collection !)) ((! set learn !)) -->

# 垃圾收集

*Table of contents*

## 垃圾收集，引用计数，显式分配
和所有的现代语言一样，OCaml提供垃圾收集器，所以你不用像C/C++一样显式地分配和释放内存。

JWZ在他的文章 [&quot;Java sucks&quot;
rant（Java蛋疼（怒）！）](http://www.jwz.org/doc/java.html "http://www.jwz.org/doc/java.html"):

> 第一个好家伙是Java没有 `free()`。其他的都没有所谓了。这几乎掩盖了所有的缺点，不管有多糟糕，
> 这个有点让后续文档基本都没有意义了，**但是...**（译注：但是啥大家自己看吧）

OCaml的垃圾收集器是划时代的，比大部分的手动分配都要表现出色。和Java臭名昭著的GC不一样，
OCaml的GC不会在启动时分配大量的内存，也不会有需要手动改写的限制。

为什么GC可以比C里显式的内存分配还要快？我们通常假设调用`free`不消耗任何时间。实际上`free`
会索引内存分配器的复杂数据结构，是一个很复杂很昂贵的操作。每次你调用`free`，所有的
代码和数据都要加载到CPU缓存。而收集器则会释放一次性释放内存（比方说一个内存池分配器或者GC），
因此只要加载一次到内存即可，昂贵的开销则被分摊开。（译注：这不完全是真的，取决于malloc的实现）

GC 还会通过移动内容来收紧堆。（译注：也就是把在用的内存放到一起）这样会让内存的分配更加简单，
更加快。一个简单的GC可以和L1，L2缓存很好地互动。

当然，这些原因都不是可以排除编写一个手动分配器的理由，但这对于很多程序员而言都是相当难的活。

OCaml的垃圾收集器有两个堆，**主要堆** 和 **次要堆**。这里有一个原则：大多数的对象都很小，
并且频繁分配和很快就释放。这些对象首先进入次要堆，次要堆是GC的主要对象。其中只有很少对象是
长期存在的。这些对象都会从次要堆升级到主要堆，而主要堆则没有GC得这么频繁。

OCaml的GC是同步的。它不会运行在另外一个线程，并且它只能在一个分配申请时才被调用。

###  GC 对引用计数
Perl也有GC，但所用的是简单的**引用计数**。这种方法很简单，不过就是简单地在每个Perl的对象里
持有一个来自其他对象的引用计数。当这个计数减少到0的时候，这意味着没有对象在引用这个对象，
因此这个对象可以被释放。

引用计数不被计算机科学家认为是一个很严格的GC，但它在实际上比一个完全的GC有多很多优点。
通过引用计数，你可以不显式调用 `close`/`closedir` 。比方说：

```perl
foreach (@files)
{
  my $io = new IO::File "< $_" or die;
  # read from $io
}
```
这段Perl代码迭代一系列的`@files`，然后打开并读取每个文件。这里没有需要关闭`$io`因为
Perl使用的是引用计数，当我们到了循环的最后，`$io`会在定义域之外，因此引用计数会变成0，
并马上被释放。（译注：这种风格是很不可取的，这依赖了语言解析器本身的实现，因此引入了一个
很难察觉到的耦合）

考虑一下下面这段OCaml代码：

```ocaml
let read_file filename =
  let chan = open_in filename in
  (* read from chan *) in
List.iter read_file files
```
调用 `read_file` 会打开文件但不会关闭它。因为OCaml用的是一个完全的GC，所以`chan` 
在次要堆满之前不会被收集。并且，**OCaml 即使在收集句柄的内存时也不会关闭通道**，
因此这样下去，进程迟早会耗尽文件描述符资源。

在写OCaml程序，尤其是文件和目录处理或其他需要终结方法的重量级对象的时候你需要关注到这一点。

为了公平起见，我下面也要提及以下引用计数的缺点：

* 所有的对象都要存放一个计数器。也就是说每个对象都有一个字的开销。程序会消耗更多的内存，
也导致了程序更加慢，因为缓存更容易被塞满或者分配到不同的交换页。
* 引用计数是很昂贵的。每次你修改一个到对象的指针的时候你都必须检查引用计数。当你不停地
修改引用，那么这种检查就会更频繁，你的程序也会更慢，也会膨胀你的代码量。
* 引用计数不能处理循环引用，或者自引用。我（原作者）曾经在很多语言里编程但不能回忆起曾经
用到过这种结构（译注：嗯...双向链表就是这种结构）。
* 当然，图算法就违反了前面的假设。不要尝试在Perl里实现TSP算法。

## Gc 模块
`Gc` 模块包含很多有用的函数用来在OCaml程序里查询和调用GC。

下面是在退出之前打印出GC统计数据的程序：

```ocaml
let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x)
  
let () =
  Random.self_init ();
  Graphics.open_graph " 640x480";
  for x = 0 to 640 do
    let r = 4.0 *. (float_of_int x) /. 640.0 in
    for i = 0 to 39 do
      let x_init = Random.float 1.0 in
      let x_final = iterate r x_init 500 in
      let y = int_of_float (x_final *. 480.) in
      Graphics.plot x y
    done
  done;
  Gc.print_stat stdout
```
下面是这段程序打印出来的内容：

```
minor_words: 115926165     # 非配的字的总数
promoted_words: 31217      # 从次要堆升级到主要堆的字的总数
major_words: 31902         # 直接分配在主要堆的大对象的字的总数
minor_collections: 3538    # 次要堆收集的次数
major_collections: 39      # 主要堆收集的次数
heap_words: 63488          # 堆的大小，这里word大概是256K
heap_chunks: 1
top_heap_words: 63488
live_words: 2694
live_blocks: 733
free_words: 60794
free_blocks: 4
largest_free: 31586
fragments: 0
compactions: 0
```
可见，次要堆收集的次数大约是主要堆收集的100倍（只是这个例子的情况，不一定如此）。
随着程序的运行，整整440MB内存被分配，尽管它们的大多数都会在次要堆里被收集，释放。
只有大概128K被升级到长期存贮的主要堆，而另外由大对象构成的128K内存则直接分配在主要堆上。

我们可以指示GC在某些事件发生时（比方说主要堆收集）打印出debug信息。试一下把下面的代码
粘帖到上面例子的开始：

```ocaml
Gc.set { (Gc.get ()) with Gc.verbose = 0x01 }
```
（我们还没有见到 `{ expression with field = value }` 形式，但是这很容易知道它
做的些什么。上面的代码会让每次主要堆收集的时候都打印一条信息。

## 终结化和Weak模块
我们可以写一个叫**finaliser**的函数，它会在GC释放对象之前被调用。

`Weak` 模块让我们创建一个所谓的弱指针。一个**弱指针**最好通过和一个普通指针来比较得出
其含义。当我们有一个通常的OCaml对象，我们通过名字(也就是 `let name = ... in`)或者其他
对象来引用那个对象。GC指导我们有一个引用到那个对象因而不会收集它。这就是一般我们说的
普通指针。但是，如果你持有的是一个弱指针或者弱引用到一个对象，那么你就对GC给出了这个对象
随时可以被收集的提示（但不意味着GC一定要收集它）。一些时间后，当你来检查这个对象的时候，
你可以把弱指针转变成一个通常指针，或者通知GC去收集它。

通过终止化和弱指针可以实现在内存对象数据库缓存。让我们想象一下我们有一个文件存储大量的
用户记录。这些数据太大因而不能被完全加载到内存。并且其他程序会通过不同方法来访问这些
文件里的数据，所以我们当我们在内存里持有它们的内存时，我们需要锁定单独的记录。

对于我们这个数据库缓存的公共接口是下面这两个函数：

```ocaml
type record = { mutable name : string; mutable address : string }
val get_record : int -> record
val sync_records : unit -> unit
```
 `get_record` 函数是最主要被调用的接口。它从缓存或硬盘里获取第n个记录并且返回它。这个
程序就可以修改`record.name`和`record.address`域。然后就可以把这个记录束之高阁！
在最后，GC会调用终结化会把记录重新写到硬盘里。

`sync_records` 函数也可以在用户程序里调用。这个函数同步硬盘和内存里的所有记录拷贝。

OCaml在现在退出时不会运行终结化。但是你可以强制把下面的指令加到代码里。下面的指令
会让OCaml退出的时候调用一个GC周期：

```ocaml
at_exit Gc.full_major
```
我们的代码也会通过`Weak`模块来实现一个最近访问记录的缓存。使用`Weak`模块而不手动处理
所有事的优点有两个：其一，GC对内存需求有全局视图，这让它在一个优势地来决断什么时候
来缩小缓存。其二，我们的代码会相当简单。

对于我们的例子，我们将要用一个简单的文件格式来表示用户纪录。这个文件不过是一个用户记录
列表，每个用户纪录有256字节的固定大小。每个用户记录只有两个域（多余部分用空格填充），
name域和address域。在一个记录被录入内存之前，程序必须首先获取记录的互斥锁，在这个
在内存记录被写回文件之后，程序才会释放它。下面是一些定义文件格式和读写，锁相关的底层
代码：
```ocaml
type record = { mutable name : string; mutable address : string }
  
(* On-disk format. *)
let record_size = 256
let name_size = 64
let addr_size = 192
  
(* Low-level load/save records to file. *)
let seek_record n fd =
  ignore(Unix.lseek fd (n * record_size) Unix.SEEK_SET)
  
let write_record record n fd =
  seek_record n fd;
  ignore(Unix.write fd record.name 0 name_size);
  ignore(Unix.write fd record.address 0 addr_size)
  
let read_record record n fd =
  seek_record n fd;
  ignore(Unix.read fd record.name 0 name_size);
  ignore(Unix.read fd record.address 0 addr_size)
  
(* Lock/unlock the nth record in a file. *)
let lock_record n fd =
  seek_record n fd;
  Unix.lockf fd Unix.F_LOCK record_size
  
let unlock_record n fd =
  seek_record n fd;
  Unix.lockf fd Unix.F_ULOCK record_size
```

我们也会需要一个函数来创建和清空`record`对象：
```ocaml
(* Create a new, empty record. *)
let new_record () =
  { name = String.make name_size ' ';
    address = String.make addr_size ' ' }
```
因为这是一个很简单的程序，所以我们将先确定记录的数目。

```ocaml
(* Total number of records. *)
let nr_records = 10000
  
(* On-disk file. *)
let diskfile =
  Unix.openfile "users.bin" [ Unix.O_RDWR; Unix.O_CREAT ] 0o666
```
先下载 [users.bin.gz](/img/users.bin.gz) ，然后解压缩并运行该个程序。

我们的缓存相当简单：

```ocaml
(* Cache of records. *)
let cache = Weak.create nr_records
```
`get_record` 函数很短并且基本上只有两个部分。我们把记录从缓存里拿出来。如果缓存
返回`None`，那么我们还没有把记录读取到缓存来，或者说它已经被写到硬盘里，并从缓存里
删除。如果缓存返回`Some record`那么我们把`record`部分返回即可（这会把一个弱指针
升级成一般指针）。

```ocaml
open Printf
  
(* The finaliser function. *)
let finaliser n record =
  printf "*** objcache: finalising record %d\n%!" n;
  write_record record n diskfile;
  unlock_record n diskfile
  
(* Get a record from the cache or off disk. *)
let get_record n =
  match Weak.get cache n with
  | Some record ->
      printf "*** objcache: fetching record %d from memory cache\n%!" n;
      record
  | None ->
      printf "*** objcache: loading record %d from disk\n%!" n;
      let record = new_record () in
      Gc.finalise (finaliser n) record;
      lock_record n diskfile;
      read_record record n diskfile;
      Weak.set cache n (Some record);
      record
```
`sync_records` 函数更加简单。首先它会清空缓存并把所有弱指针都替换成`None`。这个的意思
是GC可以收集并终结化所有的记录。但这不意味着GC一定会马上收集它们（实际上一般不会马上收集），
所以要让GC马上收集记录，我们要引起一个主要堆的收集：
```ocaml
(* Synchronise all records. *)
let sync_records () =
  Weak.fill cache 0 nr_records None;
  Gc.full_major ()
```
最后，我们有一些测试代码。我不会把这些代码贴上，但是你可以在下载完整的代码[objcache.ml](objcache.ml)，
并且编译它：

```shell
ocamlc unix.cma objcache.ml -o objcache
```

## 练习
下面是一些对上面例子扩展的例子，难度随题号上升：

1. 用对象实现记录，并允许它透明地填充字符串。你会需要提供方法来设、得name和address域（
因此一共有4个公共方法）。尽量将实现细节隐藏到类内部。
1. 扩展程序使得当获取记录的时候获取的是读锁，但是写的时候获取的是写锁。
1. 支持 **不同数目的记录** 并且添加一个函数来增加记录（贴士:OCaml支持弱哈希表）。
1. 加上 **变长记录**。
1. 让底层文件的表示格式为**DBM-style hash**.
1. 为用户提供一个通用目的的，关系型数据库的缓存（带锁）。
