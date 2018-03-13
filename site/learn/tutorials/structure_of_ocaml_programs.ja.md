<!-- ((! set title OCamlプログラムの構造 !)) ((! set learn !)) -->

*Table of contents*

OCamlプログラムの構造
====================

さて、ここからは、俯瞰的に、実際のOCamlプログラムを見ていくことにしよう。ここで述べるのは、ローカル＆グローバルな定義、`;;`と`;`の
使い分け、モジュール、入れ子関数、そして参照についてである。進むにつれ、今まで見たことがなくて意味のわからないOCamlの概念が、たくさん出てく
るだろう。今はつぶさにわからなくてもよい。そのかわり、大まかな形でプログラムを見ることと、説明の主眼点をつかむことに、集中してほしい。

## ローカルな"変数" (*本当は*ローカルな式)

では、`average`関数にローカルな変数を加えたものを、Cで見てみよう。(先にあげた、最初の定義と比べてみよ)

```C
double average (double a, double b)
{
  double sum = a + b;
  return sum / 2;
}
```
同じことを、OCamlでやってみよう。

```ocamltop
let average a b =
  let sum = a +. b in
  sum /. 2.0;;
```

標準の句の`let name = expression in`が、ローカルな式に名前をつけて定義するのに使われている。これで`name`は、後で関数のなかで、`expression`の代わりに使えるようになる。式の終わりの`;;`で、コードのブロックが閉じる。inのあとでインデントをしないのに注意。これは、`let ... in`はひとつの文である、と考えること。

では比べよう。Cのローカルな変数と、これらの名前をつけられたローカルな式は、ぱっと見ると一緒だが、実はちょっと違う。Cの変数`sum`は、スタック上に領域が確保されている。後で関数のなかで、`sum`に代入もできるし、`sum`のアドレスを得たりもできる。OCamlでは、そうはいかない。OCamlでは、`sum`は式`a +. b`の略名にすぎない。`sum`に、代入は全くできないし、その値を変えることもだめである。(本当の変数をどうやるか、はすぐに明らかになる。)

より分かりやすくするための、もうひとつの例。以下の２つのコードは、同じ値を返すわけだが(すなわち
(a+b) + (a+b)^2^):

```ocamltop
let f a b =
  (a +. b) +. (a +. b) ** 2.
  ;;

let f a b =
  let x = a +. b in
  x +. x ** 2.
  ;;
```

２つめのほうがたぶん速い(しかし、ほとんどのコンパイラは、この処置を"共通部分式の削除"でしてくれるはずだ)、それに、明らかに読みやすい。２つめの例の`x`は`a +. b`の略にすぎない。

## グローバルな"変数" (*本当は*グローバルな式)

グローバルな名前の定義は、トップレベルで行われる。さきほどのローカルな"変数"と同じく、
これらは本当の変数ではまるでなく、略名にすぎない。
この例は、実際にあったものだ(省略をしたが)。

```ocaml
let html =
  let content = read_whole_file file in
  GHtml.html_from_string content
  ;;

let menu_bold () =
  match bold_button#active with
  | true -> html#set_font_style ~enable:[`BOLD] ()
  | false -> html#set_font_style ~disable:[`BOLD] ()
  ;;

let main () =
  (* code omitted *)
  factory#add_item "Cut" ~key:_X ~callback: html#cut
  ;;
```

この実際にあったコードで、`html`は、HTML作成ウィジェット(lablgtkライブラリのオブジェクト)であり、プログラムの冒頭で、一度だけ作られている。それが最初の`let html =`文である。それから、後の関数で2、3度参照されている。

気をつけてほしいのは、上のコードの`html`はあくまで名前で、Cでいうようなグローバルな変数と、対応していないことだ。あるいは、他の手続き型言語のそれともちがう。領域を確保しておらず、"`html`ポインタ"を"格納"していないのだ。`html`への代入はできないので、例えば、再代入で他のウィジェットへのポインタになったりもしない。次の節で、参照について説明する。それが本当の変数である。

## Let 束縛

`let ...`を使う、というとき、それがトップレベル(グローバル)か、関数内か、にかかわらず、**let束縛**をする、と呼ぶことがある。

## 参照:　本当の変数

本当の変数が必要なとき、つまり代入や変更をプログラム中でやるには、どうしたらよいだろう?それには**参照**を使うことになる。参照は、C/C++のポインタと非常によく似ている。Javaでは、オブジェクトを格納する変数はどれも、実はオブジェクトへの参照(ポインタ)になっている。Perlでは、参照は参照で - OCamlと一緒だ。

どうやって`int`への参照を作るか、OCamlではこうだ:

```ocamltop
ref 0;;
```

こんな文は、くずと同じだ。参照を作ったはいいが、名前をつけていないので、ガーベジコレクタがやってきて、すぐに掃除していってしまう!(実際には、コンパイルのときに消されてしまう。)参照に名前をつけてあげよう:

```ocamltop
let my_ref = ref 0
```

この参照は、いまは整数ゼロを格納している。何か別なものをいれてみよう(代入):

```ocamltop
my_ref := 100
```

参照の中身がどうなったか、見てみよう:

```ocamltop
!my_ref
```

そう、`:=`演算子は、参照に代入をするのに使われ、`!`演算子は、参照の中身をとりだすのに使われる。
大雑把な比較を、C/C++としてみよう:


OCaml
```ocamltop
let my_ref = ref 0;;
my_ref := 100;;
!my_ref
```

C/C++
```C
int a = 0; int *my_ptr = &a;
*my_ptr = 100;
*my_ptr;
```
参照にも使いどころはあるが、しかし、そう頻繁には参照は使わないと思ってよい。それよりよっぽどよく使うのは、`let name = expression in`のほうで、名前を関数内のローカルな式につけることである。

## 入れ子関数

Cには、入れ子関数の概念がないと言ってよい。GCCは、入れ子関数をCプログラマに提供しているが、この拡張を実際に使っているプログラムをみたことがない。それはさておき、info
gccの、入れ子関数についてのページをのせておこう。

[日本語訳](https://web.archive.org/web/20070328133739/http://www.sra.co.jp/wingnut/gcc/gcc-j.html#Nested%20Functions)

ネストした関数 とは、なにか別の関数のなかで定義された関数である。(GNU
C++ ではネストした関数はサポートしていない。)
ネストした関数の名前は、定義されたブロック内で有効である。以下の例では、square
という名前のネストした関数を定義し、二回呼び出している。

```C
foo (double a, double b)
{
  double square (double z) { return z * z; }

  return square (a) + square (b);
}
```

ネストした関数からは、それを含む関数の変数のうち、ネストした関数が定義されている点で見えるものは全部
参照可能である。これは、レキシカル・スコーピング
と呼ばれている。例えば、以下の例では、ネストした関数が offset
という名前の変数を親関数から継承している。

```C
bar (int *array, int offset, int size)
{
  int access (int *array, int index)
    { return array[index + offset]; }
  int i;
  /* ... */
  for (i = 0; i < size; i++)
    /* ... */ access (array, i) /* ... */
}
```

つかめただろうか。入れ子関数は、もう、大変に重宝で、OCamlではしきりに使われる。ここで入れ子関数の例を、実際のコードから見てみよう。

```ocamltop
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
```

このコードが何をしているかは、気にしなくてよい。まだこのチュートリアルで説明していないことが
、たくさん使われている。かわりによく見てほしいのは、中央の入れ子関数、`loop`である。それの引数はひとつだけで、unitをとっている。`loop()`の呼び出しは、関数内で、つまり`read_whole_channel`内で行える。ただし、この定義は、関数の外からは参照できない。この入れ子関数は、親の関数内で定義された変数にアクセスできる。(それで`loop`は、ローカルな名前`buf`にアクセスしている)

この入れ子関数の形は、ローカルな名前を式につけたときと同じである:`let name arguments = function-definition in`.

上の例のように、通常は、インデントを、関数定義で改行したときにやる。それから、関数がこの例のように再帰のときは、`let`でなく`let rec`を使うのを忘れないように。

## モジュールと`open`

OCamlには、興味津々たるモジュール(ライブラリ。便利なコードをまとめたもの)がたくさんついてい
る。例えば、標準ライブラリには、グラフィックを描くもの、GUI部品を操作するもの、大きな数やデータ構造をあつかうもの、POSIXシステムコールを
作るもの、がある。これらのライブラリが置かれているのは、`/usr/lib/ocaml/`である(Unixなら)。これらのなかから、特に、シンプルなモジュールをひとつ選んで、紹介しよう。`Graphics`モジュールだ。

`Graphics`モジュールでインストールされるのは、5つのファイルである(手元のシステムでは)

```
/usr/lib/ocaml/graphics.a
/usr/lib/ocaml/graphics.cma
/usr/lib/ocaml/graphics.cmi
/usr/lib/ocaml/graphics.cmx
/usr/lib/ocaml/graphics.cmxa
/usr/lib/ocaml/graphics.cmxs
/usr/lib/ocaml/graphics.mli
```

ここで、ファイル`graphics.mli`に注目してみよう。これはテキストファイルだから、目を通してみるとよい。お気づきのように、名前は`graphics.mli`で、`Graphics.mli`ではない。OCamlでは、ファイル名の先頭を大文字にしたのが、モジュール名になる。慣れないうちは、これはとても間違えやすい!

`Graphics`のなかの関数を使うには、やりかたが２通りある。それには、プログラムの最初で、`open Graphics;;`宣言をするか、あるいは、頭に付け足しをして関数を呼ぶか、だ。それだと`Graphics.open_graph.open`のようになる。`open`は、ちょっと、Javaの`import`文みたいだ。もっとよく似ているのは、Perlの`use`文だ。

[Windows ユーザへ: この例を Windows
でインタラクティブに実行するには、専用のトップレベルを作らないといけない。それには、コマンドラインから、`ocamlmktop -o ocaml-graphics graphics.cma`
とコマンドすればよい。]

すこし例を見るとわかるはずだ。(下の２つの例が描いているのは、それぞれ違う。やってみて。)
ちなみに、最初の例で呼んでいるのは、`open_graph`で、２つめの例では、`Graphics.open_graph`だ。

```ocaml
(* To compile this example: ocamlc graphics.cma grtest1.ml -o grtest1 *)
open Graphics;;

open_graph " 640x480";;
for i = 12 downto 1 do
  let radius = i * 20 in
  set_color (if i mod 2 = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;

(* To compile this example: ocamlc graphics.cma grtest2.ml -o grtest2 *)

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
```

これらの例の両方のとも、まだ話していない機能をいくらか使っている。手続き型っぽいforループ、if-
then-else、そして再帰だ。これらについては後で触れる。ともかくは、これらのプログラムを、よく見て、ぜひ、動かしてみてほしい。そうすれば、
(1)どう動くか (2)型推論がどれほどバグをつぶすのに役立つか
がわかるはずだ。

## Pervasives モジュール

モジュールで、ひとつだけ、"`open`"する必要がないものがある。それは、`Pervasives`モジュールである。(目を通すとよい。
`/usr/lib/ocaml/pervasives.mli`)`Pervasives`モジュールのすべてのシンボルは、自動で、OCamlプログラムにインポートされる。

## モジュールをリネームする

こんなときはどうしたらよいだろう?`Graphics`モジュールに使いたいシンボルがあるが、まるごとインポートするのは嫌で、かといって`Graphics`をいちいちタイプするのも面倒だ、というとき。リネームという手がある。

```ocaml
module Gr = Graphics;;

Gr.open_graph " 640x480";;
Gr.fill_circle 320 240 240;;
read_line ();;
```

実はこれが本当に便利なのは、インポートを、入れ子になったモジュールに対してやりたいときだ。(モジュールは、入れ子入れ子となっていることがままある。)そんなとき、入れ子になったモジュール名のフルパスを、いちいちタイプせずにすむ。

## `;;`と`;`、使ったり、削ったり。

**This section is not up to date with the English one**

ここで触れるのは、非常に大切なことである。`;;`を使うべきとき、`;`を使うべきとき、どちらも使うべきでないとき、それはいつか?これは、"コツをつかむ"までは、わかりにくい。著者も、OCamlを勉強中に、ずいぶんてこずった。

ルール1。`;;`を使うべきときとは、コードのトップレベルにある文を区切るときだ。関数定義の中のときや、他の文のときは、いらない。

先ほどのgraphicsの例の、2つめのやつを見てみよう。

```ocaml
Random.self_init ();;
Graphics.open_graph " 640x480";;

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x);;
```

2つのトップレベルの文があり、1つの関数定義(関数`iterate`のやつ)がある。おのおのに`;;`がついている。

ルール2。*とき*に、`;;`を削ってもよいことがある。初心者のうちは気にしなくてよい。常にルール1に沿って`;;`を置いていればよい。しかし、他人のコードをたくさん読むようになると、`;;`を削れることも知っておかねばなるまい。特別にこれが許されるところとは:

-   `let`キーワードの前
-   `open`キーワードの前
-   `type`キーワードの前
-   ファイルの最後の最後
-   少々の(非常にまれな)場合で、OCamlが"推測して"、次に新しい文のはじまりがくることや、今の文が続くのではないということが、わかるとき。

これは、ちゃんと動くコードでありながら、`;;`を極限まで削ってみたものだ。

```ocaml
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
```

ルール3と4は、一重の`;`についてだ。こいつは、`;;`とは完全に別物だ。セミコロンひとつの`;`は、
シークエンスポイントということになっている。言ってみれば、これは、C、C++、Java、Perlのセミコロンひとつと全く同じことである。意味
は、"まずは、このポイントの前にあることをやる。前のが終わってから、後にあることをやる。"である。
ご存じなかったろう。

ルール3。`let ... in`は文と思って、その後ろに一重の;を置かない。

ルール4。他のすべての文で、コードのブロック内にあるものには、一重の`;`をつける。ただし一番最後のはのぞく。

上の例の、内側のforループがよい実演である。このコードでは一切、一重の`;`を使っていない。

```ocaml
for i = 0 to 39 do
  let x_init = Random.float 1.0 in
  let x_final = iterate r x_init 500 in
  let y = int_of_float (x_final *. 480.) in
  Graphics.plot x y
done
```

上のコードでただひとつ、`;`を置いてもよいと思われるのは、`Graphics. plot x y`の後ろである。しかし、これはブロックの最後の文になっているから、ルール4で、そこには置かない。

`;`は演算子で、`+`みたいなものだ。厳密には`+`と同じではないけど、概念としては同じだ。`+`は型`int -> int -> int`をもち、2つのintをとり、1つのint(和)を返す。`;`は型`unit -> 'b -> 'b`をもち、2つの値をとり、単純に2番目のを返す。むしろ、Cの`,`(コンマ)演算子みたいだ。
`a ; b ; c; d`と、簡単に書ける。`a + b + c + d`と書くようなものだ。

ここで、あまり語られることのない、ひとつの"悟り"がある -
OCamlでは、ほとんどすべてが式だ。
`if/then/else`は式だ。`a ; b`は式だ。`match foo with ...`は式だ。以下のコードは、完全に正しい(そして、すべて同じことをやっている):

```ocamltop
let f x b y = if b then x+y else x+0
let f x b y = x + (if b then y else 0)
let f x b y = x + (match b with true -> y | false -> 0)
let f x b y = x + (let g z = function true -> z | false -> 0 in g y b)
let f x b y = x + (let _ = y + 3 in (); if b then y else 0)
```

特に最後のには注をしておく。`;`が、ふたつの文を"つなぐ"演算子として使われている。OCamlのすべての関数は、こう表現できる:

```ocaml
let name [parameters] = expression
```

OCamlの、何が式か、の定義は、Cよりもすこし広い。Cには、"文"という概念がある
-
しかし、Cの文はすべて、OCamlでは、実は式にすぎない(`;`演算子で結合されている)

ひとつ、`;`が`+`と違うところは、`+`は関数のように参照できることだ。例えば、`sum_list`関数を定義して、intのリストの和を求められる。:

```ocaml
let sum_list = List.fold_left ( + ) 0
```

## まとめよう: 実物のコード

この節では、いくつか実物のコードの断片をお見せしよう。lablgtk 1.2
ライブラリから拝借する。(Lablgtk
は、OCamlの、UnixネイティブGUIウィジェットを操作するライブラリである。)注意を一言:これらの断片には、まだ触れていないアイディアが、
たくさん含まれている。詳細にこだわらず、コードの大まかなかたちを見てほしい。作者が、どこで`;;`を使っているか、どこで`;`を使っているか、どこで`open`を使っているか、何を意識したコードか、どんなふうに式にローカル、グローバルな名前をつけているか。

...何がなんだかってことにならないように、糸口をつけておこう。

-   `?foo`と`~foo`は、OCaml流の、関数のオプショナル引数と名前つき引数で
    ある。これにあたるものはC由来の言語には見あたらないが、しかし
    Perl、Python、Smalltalkは、この概念をもっているので、引数に名前をつけて関数を呼んだり、いくつか省略したり、つけたしをしたり、
    好きなようにできる。
-   `foo#bar`は、メソッド呼出しだ(`bar`というメソッドを、`foo`というオブジェクトで、呼んでいる)。これと同じなのが、`foo->bar`とか`foo.bar`とか`$foo->bar`で、C++やJavaやPerlに、それぞれある。

1つめの例:プログラマが、標準ライブラリをふたつ開いている(`;;`を削っているのは、次のキーワードに
`open`と`let`がそれぞれきているからだ。)。それから、`file_dialog`関数をつくっている。この関数の中の、2行にわたる`let sel = ... in`文で、式に`sel`という名前をつけている。それからいくつか`sel`のメソッドを呼んでいる。

```ocaml
(* First snippet *)
open StdLabels
open GMain

let file_dialog ~title ~callback ?filename () =
  let sel =
    GWindow.file_selection ~title ~modal:true ?filename () in
  sel#cancel_button#connect#clicked ~callback:sel#destroy;
  sel#ok_button#connect#clicked ~callback:do_ok;
  sel#show ()
```

2つめの例:グローバルな名前を、トップレベルに、長々と並べただけだ。注意として、作者は`;;`をすべて削っている。これはルール2による。

```ocaml
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
```

3つめの例:　作者はインポートをして、`GdkKeysyms`モジュールのシンボルを、まるごと取り込んでいる。さて、見慣れないlet束縛をしている。`let _ = expression`とは、"式の値を計算する(すべての副作用を伴う)、しかし結果は捨てる"ことを意味する。この場合は、"式の値を計算する"とは、`Main.main ()`を実行するということで、これはGtkのメインループである。その副作用として、ウィンドウが画面にポンとでてきて、アプリケーション全体が実行される。
`Main.main()`の結果は不明であり -
たぶん返り値は`unit`だろうが、確かめていない -
アプリケーションが最後に終了するまで、帰ってこない。

この例で見てほしいのは、どのように、本質的に手続き命令の羅列であったものを、扱っているかである。これはまったく、古典的な手続き型のプログラムだ。

```ocaml
(* Third snippet *)
open GdkKeysyms

let () =
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
```
