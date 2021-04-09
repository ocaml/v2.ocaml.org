<!-- ((! set title ヌルポインタ、assert、警告 !)) ((! set learn !)) -->

*Table of contents*

ヌルポインタ、assert、警告
========================

ヌルポインタ
------------

それでは、あなたが、自分のウェブサイト上である調査をすることになったとしよう。それで、あなたの読者
に、名前と年齢を質問することになった。ただひとつの問題は、なんらかの理由で、年齢を教えてくれない読者がいるということで - かたくなに、
この欄をうめるのはいやだというのだ。あわれなデータベース管理者はどうしたらいい?

前提として、年齢は`int`で表せるとする。この問題を解くのに、2つのやりかたが考えられる。もっとも一般的なのは(そして、もっとも*間違っている*)、
なんらかの"特別な"値を、年齢の情報が得られなかったというのに割り当てる、ということだ。あー、そう、データが得られなかったら
age = -1
、とかね。それ以外なら、データが得られたことにする(有効な値かは別として)。この手のやりかただと、後で困ったことになる。例えば、あなたのウェブサ
イトのお客さんの年齢の、平均を求めることになったとする。ここでうっかり特別な値のことを忘れてしまったら、お客さんの平均年齢は、
7.5才だってことになり、Webデザイナーに、長い単語は全て外して、そこかしこに原色を使えって言いつけることになる。

一方、正しいやりかたは、年齢の欄におさめるものが、型"int か
null"をもつようにすることだ。これは、年齢をおさめるためのSQLテーブルだ:

```SQL
create table users
(
  userid serial,
  name text not null,
  age int             -- may be null
);
```

もし年齢のデータが得られなかったら、データベースに、特別なSQLの値`NULL`をいれる。SQLはこれを自動的に無視して、平均を計算したりしてくれる。

プログラミング言語にもnullはあるが、他の意味で使われすぎるきらいがある。Perlでは、どんなスカラー(つまり数や文字列)でも、`undef`(Perlでのnull)をとれてしまう。これによって、たくさんの警告がでるが、未熟なプログラマーはしばしば無視してしまい、深刻なエラーをも見逃してしまうことがある。Javaでは、オブジェクトへの参照は、nullでもよい。なので、Javaでは、年齢に`Integer`がはいっているとも、年齢が
`null`を参照しているとも、とれてしまう。Cのポインターも、もちろん、nullでもよいので、もしnullもとれる整数がほしければ、それをオブジェクトという箱にいれて、`malloc`でヒープに確保することになる。

OCamlは、nullの問題に、美しい解をもっている。簡単な多相ヴァリアント型を定義すれば(`Pervasives`で)よい:

```ocaml
type 'a option = None | Some of 'a
```

"nullポインタ"は、`None`と書かれる。上の例の、年齢の型(nullもとれる`int`)は、`int option`である。[`int list`や`int binary_tree`でやるとどうだろう]

```ocamltop
Some 3
```

int optionのリストはどうなるだろう?

```ocamltop
[ None; Some 3; Some 6; None ]
```

また、int listのoptionはどうなるだろう?

```ocamltop
Some [1; 2; 3]
```

assert、警告、致命的エラー、stderrへの出力
----------------------------------------

Perlの素晴らしい特徴のひとつは、プログラムのデバッグやエラー処理のためのコマンド群が豊富なこと
だ。スタックトレースをプリントしたり、 throw &　catch で例外をとったり、いろいろなことができる。
OCamlのデバッグコマンド群はそれほどには豊富ではない -
Javaよりまし、Cと同じくらいで、Perlには及ばない。(例外について、あとでより詳しくふれる)

まずはじめに、`assert`は式を引数にとり、例外をthrowする。この例外をcatchしないでいると(この例外をcatchするのはあまり賢明ではない、特に初心者には)、プログラムは停止し、エラーが起きたところのソースファイルと行数を出力する。例:

```ocamltop
assert (Sys.os_type = "Win32")
```

(これをWin32で実行したら、当然、エラーはでない)

どうもうまくいかないというとき、`assert false`を呼べば、そこでプログラムを停止できる。しかし、多分使いやすいのはこっちの・・・

`failwith "error message"`は`Failure`例外をthrowする。例外をcatchしないでいると、やはりプログラムは停止して、与えられたエラーメッセージをだす。`failwith`はしばしば、パターンマッチングでも使われる。現実的な例ではこうなる。

```ocaml
match Sys.os_type with
| "Unix" | "Cygwin" ->   (* code omitted *)
| "Win32" ->             (* code omitted *)
| "MacOS" ->             (* code omitted *)
| _ -> failwith "this system is not supported"
```

変なパターンマッチングがふたつ、この例にでてきている。いわゆる"範囲指定パターン"は、`"Unix"`にも`"Cygwin"`にもマッチさせるのに使う。`_`パターンは特に、"その他なんでも"にマッチさせるのに使う。

プログラムをデバッグしたいけど、私のように、デバッガはgdbじゃなきゃやだ、という人もいるだろう。それなら、警告をprintするものを関数の中にはさめばよい。そのためにはいくつかの方法がある。例えばこうだ。(注
そのコードが赤く目立つようにした。)

```ocaml
open Graphics
  
let () =
  open_graph " 640x480";
  for i = 12 downto 1 do
    let radius = i * 20 in
    prerr_endline ("radius is " ^ string_of_int radius);
    set_color (if i mod 2 = 0 then red else yellow);
    fill_circle 320 240 radius
  done;
  read_line ()
```

もしC風の`printf`がよければ、OCamlの`Printf`モジュールをかわりに試すとよい。

```ocaml
open Graphics
open Printf

let () =
  open_graph " 640x480";
  for i = 12 downto 1 do
    let radius = i * 20 in
    eprintf "radius is %d\n" radius;
    set_color (if i mod 2 = 0 then red else yellow);
    fill_circle 320 240 radius
  done;
  read_line ()
```
