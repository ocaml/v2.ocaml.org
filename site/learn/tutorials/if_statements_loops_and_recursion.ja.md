<!-- ((! set title If文、ループと再帰 !)) ((! set learn !)) -->

*Table of contents*

If文、ループと再帰
=================

if文(実は、if式)
----------------

OCaml には `if` 文が2種類ある、といっても別に変な意味ではない:

```ocaml
if 真偽の条件 then 式
  
if 真偽の条件 then 式 else 他の式
```

使い慣れた在来の言語とは違って、`if`
文は実は式である。言いかえれば、いわゆる if 文によりも、
`真偽の条件 ? 式 : 他の式` のほうに、もっとよく似ている。

if文の簡単な例:

```ocamltop
let max a b =
  if a > b then a else b
```

余談だが、OCaml のトップレベルでこれを入力すると、 OCaml
にとってこの関数は、多相で、以下のような型を持つことがわかる:

```ocaml
max : 'a -> 'a -> 'a
```

OCaml によれば、 `max` をどの型に使ってもよいということになる:

```ocamltop
max 3 5;;
max 3.5 13.0;;
max "a" "b";;
```

これは、`>`が実は多相だからだ。どの型にでも使えて、オブジェクトにさえ(バイナリ比較が行われる)使える。

[注 `Pervasives` モジュールに、 `min` 、`max` 関数がもう定義してある。]

もっとじっくり、 if 式を見てみよう。 `range`
関数は、前にもう登場したが、そのときはたいした説明をしなかった。再帰関数や、リストや、if式の知識を結びつければ、何をやっているかわかるはずだ:

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a+1) b
```

この関数の典型的な呼ばれかたを調べてみよう。まずは、簡単な `a > b`
の場合で、はじめよう。 `range 11 10` と呼ぶと、 `[]` (空リスト)
が返ってくる。それだけ。

`range 10 10` と呼ぶとどうだろう。 `10 > 10` は偽だから、 `else`
節が評価されて、それは: `10::(range 11 10)`
(カッコを補って、評価の順番をわかりやすくしておいた。)
となり、すでにやったように、 `range 11 10` = `[]` なので、これは:
`10 :: []` となる。リストの正式な書きかたと、 `::`
(cons)演算子のことは、覚えている? `10 :: []` は、 `[ 10 ]`
とまったく同じだ。

`range 9 10` をやってみよう:

```ocaml
range 9 10
→ 9 :: (range 10 10)
→ 9 :: [ 10 ]
→ [9; 10]
```

となれば、 `range 1 10` を評価すると `[ 1; 2; 3; 4; 5; 6; 7; 8; 9; 10 ]`
になるのは明らかだろう。

これは、再帰の簡単な例になっている。関数型プログラミングでは、ループよりも再帰が好まれる、が、すこし先を急ぎすぎた。再帰についてはこの章の最後でもっと掘りさげることにする。

それはさておき、`if` 文についてだ。この関数は何をやっている?

```ocamltop
let f x y =
  x + if y > 0 then y else 0
```

ヒント: if 式のまわりにカッコを補うとよい。 `y`を
[ダイオード](https://en.wikipedia.org/wiki/Diode#Current.E2.80.93voltage_characteristic "https://en.wikipedia.org/wiki/Diode#Current.E2.80.93voltage_characteristic")ではさんだようになっている。

`abs` (絶対値)関数は、 `Pervasives` でこう定義されている:

```ocamltop
let abs x =
  if x >= 0 then x else -x
```

また、 `Pervasives` の、 `string_of_float` 関数をみると、2つの `if`
式が複雑に入れ子している:

```ocaml
let string_of_float f =
  let s = format_float "%.12g" f in
  let l = string_length s in
  let rec loop i =
    if i >= l then s ^ "."
    else if s.[i] = '.' || s.[i] = 'e' then s
    else loop (i+1) in
  loop 0
```

この関数を調べてみよう。関数を `f` = 12.34 で呼んだとする。すると `s` =
"12.34"、`l` = 5 だ。 `loop` をはじめて呼び、このとき `i` = 0 である。

`i` は、 `l` 以上ではなく、 `s.[i]` (`s` の `i` 番めの文字)
はピリオドでも `'e'` でもない。よって `loop(i+1)` が呼ばれる。つまり
`loop 1`。

`i` = 1 でも同じ動きをして、結局 `loop 2` を呼ぶ。

`i` = 2 で、ようやく、 `s.[i]` がピリオドであり(もとの文字列が `s` =
"12.34" だから)、ここですぐに `s` を返し、関数 `string_of_float` は
"12.34" を返す。

`loop` は何をするのだろう? 実は、 `format_float`
から返された文字列に、ピリオドが(または `'e'`
が)あるかどうかをチェックしているのだ。 `string_of_float` を `12.0`
で呼んだとしよう。 `format_float` は文字列 "12" を返すが、
`string_of_float` は "12." か "12.0"
を返さなければならない。(OCamlでは、小数にはピリオドをつけて、整数と区別しなければならないからだ。)そのためのチェックだ。

この関数の妙な再帰の使いかたは、効率のためにやっているのが本音だ。OCamlはループに対応しているのに、なぜ著者はループを使わなかったのだろう?次の節で、OCamlの
for ループには制限があって、 `string_of_float`
のなかでは使えないことにふれる。ここで、まあ、より直感的ではあるが、おおよそ2倍も遅くなる
`string_of_float` の書き方を示しておく:

```ocaml
let string_of_float f =
  let s = format_float "%.12g" f in
  if String.contains s '.' || String.contains s 'e'
  then s
  else s ^ "."
```

begin ... end を使う
--------------------

これは lablgtk からのコードである:

```ocaml
if GtkBase.Object.is_a obj cls then
  fun _ -> f obj
else begin
  eprintf "Glade-warning: %s expects a %s argument.\n" name cls;
  raise Not_found
end
```

`begin` と `end`
はカッコを開閉する**構文糖**というものである。うえの例では、 `else`
節の2つの文をひとつにまとめている。もし、著者がこう書いてしまったらどうなるだろう:

```ocaml
if GtkBase.Object.is_a obj cls then
  fun _ -> f obj
else
  eprintf "Glade-warning: %s expects a %s argument.\n" name cls;
  raise Not_found
```

きっちりカッコをつけて、インデントをちゃんとしてやると、上の式はこうなる:

```ocaml
(if GtkBase.Object.is_a obj cls then
   fun _ -> f obj
 else
   eprintf "Glade-warning: %s expects a %s argument.\n" name cls
);
raise Not_found
```

これでは、意図したとおりになっていない。 `begin` と `end`
は、複数の文をひとまとめにするのに必要で、 if 式の `then` や `else`
節で使われる。なんなら、単にふつうのカッコ `( ... )`
を使ってもよい(私がそうだ。 Pascal なんて**まっぴらごめんだ**
:-)。簡単な例をふたつ:

```ocamltop
  if 1 = 0 then
    print_endline "THEN"
  else begin
    print_endline "ELSE";
    failwith "else clause"
  end;;

  if 1 = 0 then
    print_endline "THEN"
  else (
    print_endline "ELSE";
    failwith "else clause"
  );;
```

for ループと while ループ
-------------------------

OCaml には、制限つきだが、おなじみの **for** ループもある。

```ocaml
for variable = start_value to end_value do
  expression
done
  
for variable = start_value downto end_value do
  expression
done
```

lablgtk からの簡単な実例:

```ocaml
for i = 1 to n_jobs () do
  do_next_job ()
done
```

OCaml の for ループは、こう書くのを短くしただけだ。

```ocaml
let i = 1 in
do_next_job ();
let i = 2 in
do_next_job ();
let i = 3 in
do_next_job ();
  ...
let i = n_jobs () in
do_next_job ();
()
```

OCaml には、手前の for
ループから脱出するという概念がない(実際には、例外を throw して外側で
catch すれば*できないことはない*が、これは遅いし、みっともない)。
関数型プログラマは、明示的なループよりも再帰を好み、こと for
ループについては、どうもいけ好かなく感じている。それというのも、OCaml の
for ループが比較的に弱いからだ。再帰については下で説明する。

OCaml の for ループの中の式は、評価されたら `unit`
になるべきである(さもないと、警告がでる)。また、for ループ 式全体も、
`unit` を返す。

```ocamltop
for i = 1 to 10 do i done;;
```

OCaml の **While ループ** はこう書く:

```ocaml
while boolean-condition do
  expression
done
```

for ループと同じく、言語には while ループから脱出する方法がない。例外を
throw すれば別だが、やっぱり、 while
ループは、かなり使いにくい。関数型プログラマは再帰を好むので、 while
ループは言語のなかで第2級の身分なのである。

while
ループで思考するのをやめてみれば、そんなもの、ちっとも使う必要はなかったと気づくだろう。しかし、古くからの友達、参照が、すがりついてくる。
OCaml に参照がもしなかったら、と、ちょっと考えてみよう:

```ocaml
let quit_loop = false in
while not quit_loop do
  print_string "Have you had enough yet? (y/n) ";
  let str = read_line () in
  if str.[0] = 'y' then
    (* how do I set quit_loop to true ?!? *)
done
```

`quit_loop` は本当の"変数"ではないことを思い出してほしい。 - let
束縛は、`false` の略として `quit_loop`
をつくっているだけなのだ。よって、 while ループの条件は (赤で示した)
常に真であり、永遠にループしてしまう。

幸運にも OCaml には参照が
*ある*ので、上のようなコードを書いたって別にいい。 `!`
(びっくりマーク)は C/Java では "not"
の意味だが、ここでは"ポインタの参照をたどる"意味で使われているので、混同しないように。実は
Forth とおなじである。 `!` は "get" とか "deref" と読むとよいだろう。

```ocaml
let quit_loop = ref false in
while not !quit_loop do
  print_string "Have you had enough yet? (y/n) ";
  let str = read_line () in
  if str.[0] = 'y' then
    quit_loop := true
done;;
```

リストをループする
------------------

リストをループしよう・・・おっと、手続き型プログラマさん、愛用のリボルバ－ForLoopスペシャル
に手をかけないでくださいよ! OCaml
には、リストをループするための、もっと手軽で速い方法がある。それらは
`List` モジュールに置かれている。 `List`
にはいい関数が何ダースもあるわけだが、ここでは、そのなかでも最も便利なものについてだけ、説明することにする。

まずは、これから使うリストをひとつ定義しよう:

```ocamltop
let my_list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
```

リストのすべての要素のおのおので、関数を呼びたいときは、 `List.iter`
でこうする:

```ocamltop
let f elem =
  Printf.printf "I'm looking at element %d now\n" elem in
  List.iter f my_list
```

`List.iter` を使うことをいつでも念頭において、 for
ループときたらセキズイ反射で思い出すように。

リストの要素をおのおのに応じて *変換* したいときは -
例えば、リストの要素のおのおのを2倍したいとか - `List.map`
を使う。この関数は、前に Perl
でプログラムをしたことがある人なら馴染みがあるだろう。

```ocamltop
List.map (( * ) 2) my_list
```

Perl には、 "grep"
という便利な関数がある。これはリストのなかで条件を満たす要素だけをフィルタしてとりだすものだ。
- 例えば、リストのなかのすべての偶数を返すとか。 OCaml では、この関数は
`List.filter` と呼ばれている。

```ocamltop
let is_even i =
  i mod 2 = 0 in
  List.filter is_even my_list
```

リストの中身に探したい要素が見つかるかどうかには、 `List.mem` (member
の略)を使う:

```ocamltop
List.mem 12 my_list
```
`List.for_all` と `List.exists` は、述語論理の "forall" 、 "exist"
演算子と同じである。

2つのリストを同時に処理していくのには、 これらの関数の "-2"
版がある。つまり、 `iter2` 、`map2` 、 `for_all2` 、`exist2` 。

`map` と `filter`
関数は、リストの要素を別個に、ひとつひとつで処理するものだった。
\<dfn\>Fold\</dfn\>
は、もっと変な処理をする。これについては、"リストの各要素の間に演算子をはさむ"のだと考えるのが一番だ。リストの数字をすべて足したいとしよう。こ
こでやりたいのは、いってみれば、リストの要素の間にプラス記号をはさんでいくということだ:

```ocamltop
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
```
fold
処理がやるのはこれだ。しかし、これは実際にはもうすこし厄介な話になる。まずはじめに、もし空リストを
fold しようとしたらどうなるだろう?
リストを足し算するときには、答えが0になってくれたほうが、エラーになるよりいいだろう。しかしリストを掛け算するときには、答えが1になってくれたほ
うがありがたい。となると、なんらかの"デフォルト"を、引数として fold
にあたえてやることになる。2つめの問題は、 `+` や `*`
のような簡単な演算子のときはいいが、もし何か結合的でない演算子(つまり、
(a *op* b) *op* c と a *op* (b *op* c)
が等しくない)のときはどうなるかということだ。その場合は、リストの左端からはじめて右にやっていくのと、右からはじめて左にやっていくのとで、違いがでてくる。このために、
fold には2種類あって、 `List.fold_left` (左から右に) と
`List.fold_right` (右から左に、これは効率が悪くなる)と なっている。

`List.fold_left` を使って、整数リスト用の `sum` と `product`
関数を定義してみよう。

```ocamltop
let sum = List.fold_left ( + ) 0;;
let product = List.fold_left ( * ) 1;;
sum my_list;;
product my_list;;
```

こりゃ簡単! ひょっとしたら、数学の階乗もこれでいけるぞ:

```ocamltop
let fact n = product (range 1 n);;
fact 10;;
```

(注 この階乗の関数にはちょっと問題がある。整数のオーバーフローのせいで、
`n` がかなり小さいときでも誤った答えがでてしまう。本当の階乗の関数には
`Big_int` モジュールを使うことになる。)

文字列をループする
------------------

`String`
モジュールには、何ダースもの便利な文字列関係の関数がつまっていて、それらのいくつかは、文字列をループすることに関するものである。

`String.fill` と `String.blit` はそれぞれCの `memset` と `strcpy`
と等しい。 `String.copy` は、 `strdup` のように、文字列をコピーする。

`String.iter` 関数もあり、 `List.iter`
のように動く。違うことといえば文字列の文字について動くことくらいだ。

再帰
----

さあ、難しい話題にとりかかろう -
再帰だ。関数型プログラマは、再帰関数へのその愛をもって語られる。再帰関数は、どこを切っても手続き型プログラミングのループに負けずとも劣らない。関
数型言語においてループは第2級の身分であり、その一方で、再帰関数には最高のサポートがはかられている。

再帰関数を書くには、意識改革をして、 for ループや while
ループから脱却する必要がある。次の節で、例をだしつつ、導入をしていこう。

最初の例では、ファイルの全体をメモリに読み込む(長い文字列として)。これには実質的に、3つのアプローチが考えられる:

### アプローチ 1

ファイルの長さを得て、読み込みを `really_input`
メソッドで一気に行う。もっとも単純だが、チャンネルに対しては、それが実はファイルではないため、うまくいかない(例えば、キーボード入力を読むなどができない)。なので、他の2つのアプローチも見てみよう。

### アプローチ 2

手続き型アプローチで、 while ループを使い、例外で脱出する。

### アプローチ 3

再帰のループ。再帰を脱出するには、やはり例外を使う。

-----

ここで、新しい概念を少し紹介しよう。後の2つのアプローチでは、 `Buffer`
モジュールを使うことになる -
バッファは伸ばしていけるので、これを、テキストを効率的に終端に追加していける文字列のように、みたてることができる。また、
`End_of_file` 例外を catch
するようにする。これは入力関数が、入力の終了に達すると throw
する。さらに、 `Sys.argv.(1)`
を使って、コマンドラインのパラメータの1番目を取得する。

```ocaml
(* Read whole file: Approach 1 *)
open Printf

let read_whole_chan chan =
  let len = in_channel_length chan in
  let result = String.create len in
  really_input chan result 0 len;
  result

let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan

let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  printf "I read %d characters from %s\n" (String.length str) filename
```

アプローチ 1 は動くけども、ちょっと不満が残る。 `read_whole_chan`
は、チャンネルに対しては、それがファイルではないために、動かない。となると、キーボード入力やソケットが読めない。アプローチ
2 は while ループが入る:

```ocaml
(* Read whole file: Approach 2 *)
open Printf

let read_whole_chan chan =
  let buf = Buffer.create 4096 in
  try
    while true do
      let line = input_line chan in
      Buffer.add_string buf line;
      Buffer.add_char buf '\n'
    done;
    assert false (* This is never executed
	                (always raise Assert_failure). *)
  with
    End_of_file -> Buffer.contents buf

let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan

let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  printf "I read %d characters from %s\n" (String.length str) filename
```

アプローチ 2 のカギは、中央の while ループにある。手前の while
ループから脱出するには例外を使うのが唯一の方法だと言ったのを覚えているだろうか?
ここでやっているのはまさにそれだ。例外はまだ紹介していないが、
`End_of_file` 例外を `input_line` が throw
して、ファイルの終端に達したことがわかるというのは、難なく理解してもらえるだろう。バッファ
`buf`
にはファイルの中身が蓄積される。ファイルの終端に達したらそれを返してやる
(`Buffer.contents buf`)。

ちょっと気になる点がある。なんだか余分に見えるクオート (`""`) が、 while
ループの後ろについている。何のためにあるんだろう?
思い出してほしいのは、while ループや、 for ループは、ただの式であり、
`unit` オブジェクト (`()`) を返すということだ。ところで、 OCaml は `try`
の中に返り値の型がないといけなくて、 しかもそれが、 `catch`
する例外の型と一致している必要がある。この場合には、 `End_of_file`
の結果は `文字列` だから、 `try` の中身も文字列を"返す"必要がある - 無限
while ループなので、実際には文字列を返したりはしないけれども。

これが、再帰バージョンだ。アプローチ 2 より *短い*
ことに注意。ただ、わかりやすくはない。少なくとも手続き型プログラマには:

```ocaml
(* Read whole file: Approach 3 *)
open Printf

let read_whole_chan chan =
  let buf = Buffer.create 4096 in
  let rec loop () =
    let line = input_line chan in
    Buffer.add_string buf line;
    Buffer.add_char buf '\n';
    loop () in
  try
    loop ()
  with
    End_of_file -> Buffer.contents buf

let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan

let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  printf "I read %d characters from %s\n" (String.length str) filename
```

またもや無限ループがある - しかしこれは再帰を使っている。 `loop`
は関数の終わりで自身を呼ぶ。無限の再帰だが、 `input_line` が
`End_of_file` 例外を throw したら脱出する。

アプローチ 3
は、巨大なファイルをあたえるとスタックがオーバーフローしそうにみえるが、この場合は大丈夫だ。末尾再帰(下で説明する)なので、コンパイラが再帰
`loop` 関数を本当の while ループに (!)
変えてくれて、一定のスタック領域で実行される。

次の例では、再帰が、データ構造の型を構築したり調べたりするのにどれほど素晴らしいかを、示そう。特にツリーに有効だ。ファイルシステムでファイルを表すために、再帰の型をつくる:

```ocamltop
type filesystem = File of string | Directory of filesystem list
```

`opendir` と `readdir`
関数は、ディレクトリを開いたり、ディレクトリの要素を読んだりするのに使う。悩ましい
`End_of_file` 例外を隠した、手軽な `readdir_no_ex`
関数を定義しよう。この例外は `readdir`
がディレクトリの終わりに達したときに throw される:

```ocamltop
open Unix  (*  You may need to #load "Unix.cma" *)
  
let readdir_no_ex dirh =
  try
    Some (readdir dirh)
  with
    End_of_file -> None
```

`readdir_no_ex` の型はこうだ。前の、null
ポインタの話を思い出してほしい。

```ocaml
readdir_no_ex : dir_handle -> string option
```

`filesystem`
型を文字列に変換する単純な再帰関数も書いておこう。出力などに使える:

```ocamltop
let rec string_of_filesystem fs =
  match fs with
  | File filename -> filename ^ "\n"
  | Directory fs_list ->
      List.fold_left (^) "" (List.map string_of_filesystem fs_list)
```

`fold_left` と `map` を使っているのに注意。 `map` は リストの各
`filesystem` を `文字列` に(再帰的に)変換するのに使われている。
`fold_left (^) ""`は、リストをひとつの大きな文字列に結合している。それからパターンマッチングも使っている。(ライブラリには
`String.concat` という関数が定義されていて、これは本質的に
`fold_left (^)` と一緒だが、より効率的な実装がされている)

では、ディレクトリ構造を、再帰的に読む関数を定義しよう。
返り値は、再帰的な、`filesystem`
データ構造である。この関数を順をおってみていこう。この節の終わりに、関数の全体を載せておく。まずは、関数のあらまし:

```ocaml
let rec read_directory path =
  let dirh = opendir path in
  let rec loop () =
    (* ..... *) in
  Directory (loop ())
```

`opendir` を呼んで、あたえられたパスを開くと、 `dir_handle`
を返してくる。あとでこの名前を `readdir_no_ex`
を使って読むようになる。関数の返り値は、 `Directory fs_list`
になるだろう。そこで、関数の残りを書き上げるのにあと必要なのは、
`filesystem` のリストを返す `loop` 関数を書くことだ。 `loop`
の型は、こうなるだろう:

```ocaml
loop : unit -> filesystem list
```

loop をどう定義したらいい? それが次のステップだ。

```ocaml
let rec loop () =
  let filename = readdir_no_ex dirh in
  (* ..... *)
```

はじめに、ディレクトリハンドルから次の `filename` を読み込んでいる。
`filename` の型は `string option` で、つまり、 `None` or `Some "foo"`
である。 `foo` はディレクトリの次の filename の名前だ。さらに、 `"."` と
`".."`
ファイルはとばす必要がある(すなわち、カレントディレクトリと親ディレクトリ)。これはパターンマッチングでバッチリだ:

```ocaml
let rec loop () =
  let filename = readdir_no_ex dirh in
  match filename with
  | None -> []
  | Some "." -> loop ()
  | Some ".." -> loop ()
  | Some filename ->
     (* ..... *)
```

`None` のときは簡単だ。再帰的に考えれば(!)、もし `loop`
が呼ばれて、ディレクトリの終わりに達したら、 `loop`
はその内容をリストで返さなければならない - もし内容がなかったら -
そのときは空リスト(`[]`)を返す。

`"."` か `".."` なら、単にそのファイルはとばして、 `loop`
をまた呼べばいい。

`loop` が本当にファイル名を読んだとき(一番下の `Some filename`
がマッチしたとき)はどうしたらいいだろう? `pathname`
はファイルへのフルパスとする。ファイルを 'stat'
すれば、本当はディレクトリだったりするかどうかがわかる。もしディレクトリ
*だったら* 、これに `read_directory` を再帰的に呼び出してやって、
`Directory something` を返してもらって、それを `this`
とする。もしファイルが本当にファイルだったら(ディレクトリではなかったら)、
`this` は `File pathname`
とする。それから、ちょっと賢いことをやっている: `this :: loop()`
を返すのだ。 `loop()`
を、残りのディレクトリの中身(リスト)の計算のために、再帰的に呼んでいる。それを、
`this` の後ろにつけている。

```ocamltop
let rec read_directory path =
  let dirh = opendir path in
  let rec loop () =
    let filename = readdir_no_ex dirh in
    match filename with
    | None -> []
    | Some "." -> loop ()
    | Some ".." -> loop ()
    | Some filename ->
        let pathname = path ^ "/" ^ filename in
        let stat = lstat pathname in
        let this = if stat.st_kind = S_DIR then
                     read_directory pathname
                   else
                     File pathname in
        this :: loop () in
  Directory (loop ())
```

かなり複雑な再帰だったろうが、これでもお稽古といったところで、もっと複雑な再帰のパターンが、現実の関数型プログラムにはでてくる。ふたつ、ここでよく覚えておいてほしいのは:

-   リストをつくるための再帰の使いかた:

    ```ocaml
    let rec loop () =
      a match or if statement
      | base case -> []
      | recursive case -> element :: loop ()
    ```
    
    これを、前の `range` 関数と比べてほしい。再帰のパターンがまったく同じだ:
    
    ```ocamltop
    let rec range a b =
      if a > b then []            (* Base case *)
      else a :: range (a+1) b     (* Recursive case *)
      ;;
    ```
	
-   ツリーをつくるための再帰の使いかた:

    ```ocaml
    let rec read_directory path =
      (* blah blah *)
      if file-is-a-directory then
        read_directory path-to-file
      else
        Leaf file
    ```
    
    ここまでくれば、このプログラムを動かすのにあと必要なのは、
    `read_directory`
    を呼んで結果を出力するように、ちょっとコードをたしてやることだけだ:

    ```ocaml
    let path = Sys.argv.(1) in
    let fs = read_directory path in
    print_endline (string_of_filesystem fs)
    ```

### 補遺

この例を caml-list
メーリングリストに投稿したところ、たくさんの反響をいただいた。(ここから
[スレッドが読める](http://mirror.ocamlcore.org/caml.inria.fr/pub/ml-archives/caml-list/2003/06/2732fbf1bed1ae50fefb6ea410ea9955.en.html "http://caml.inria.fr/pub/ml-archives/caml-list/2003/06/2732fbf1bed1ae50fefb6ea410ea9955.en.html")。)

まず、基本的な間違いとして、 `read_directory` directory
は、膨大なディレクトリ構造を相手にすると、エラーがでてしまっていた。明示的に
`closedir`
を呼ばずにいたので、ディレクトリハンドルが閉じていなかった。これはガーベジコレクタ任せではだめで、というのも、
OCaml
のガーベジコレクタは、開いたファイルやディレクトリのハンドルを、閉じたり回収したりは
**してくれない** からだ。

まっさきにすべき修正: `closedir` を、 `read_directory`
関数の終わりで呼ぶようにする。

```ocaml
let rec read_directory path =
  let dirh = opendir path in
    (* ... *)
  let result = Directory (loop ()) in
  closedir dirh;
  result
```

次は、 `readdir` が、"例外ともいえない"ときに、例外を throw
していることだ。つまり、 `End_of_file` 。この場合に例外を throw
するのが正しいのか、どうも納得いかない。普通なら、プログラムに、
`try ... with`
節なんてものを書かずに済みそうなものだ。例外というのは、"手に負えないような、なにか本当に変なことが起きた"
という意味と思われるからだ。ディスクの容量やメモリを使いきってしまったとか。関数のルーチンの一部として例外を
throw するようなのは( `readdir` を使うプログラムはすべて、 `End_of_file`
の扱いに 備えなければ*ならない*)、例外という名にふさわしくない。

しかし、 Eric Cooper
が、この関数を、例外を使わずに書く方法を思いついた。これも、関数型プログラマがよく使うテクニックのひとつによっている。つまり、
**accumulator** (蓄積器)
に関数を呼んだ結果をためておいて、渡すのだが、なんと、関数に *引数*
として渡してしまうのだ(!)。 accumulator は "これまでの結果"
という意味で使われる。この例外の場合( `End_of_file`
)になったら、切り上げて、これまでの結果を返す。これが彼のコードである。
accumulator 引数への参照を赤く示した:

```ocamltop
let rec read_filesystem path =
  if (lstat path).st_kind = S_DIR then
    Directory (read_directory path)
  else
    File path
  
and read_directory path =
  let dirh = opendir path in
  let rec loop entries =
    try
      match readdir dirh with
      | "." | ".." -> loop entries
      | filename ->
	     loop (read_filesystem (path ^ "/" ^ filename) :: entries)
    with End_of_file -> entries in
  let list = loop [] in
  closedir dirh;
  list
```

`End_of_file -> entries`
に注意。"例外になったので、切り上げて、これまでの結果を返す"という意味である。

次だ -
これをやるのに最も簡単なのは、実は、再帰を全く使わずに、手続き型のループを使うことなのだそうだ(
while ループが最適だろう)。その中で、リストへの参照をとっておいて、先の
accumulator のように結果を格納していくのだという。 `readdir` は例外を
throw するので、単純に while ループを脱出でき、 *さらに、* `with`
節を使って、 `!list`
(結果を積み上げたリストへの、参照を引く)を返すことができる。

ちゃんと動く。時には手続き型でコードを書くのがベストということもあるわけだ。
*特に*、このような、 `opendir ... readdir ... closedir`
といった、本質的に手続き型の、C
プログラマ向けに作られたようなAPIを扱うときには。手続き型の解法のほうが簡単だということに、別に驚くことはない。
OCaml は、[緊縛と調教
言語](https://web.archive.org/web/20110611043853/http://www.elsewhere.org/jargon/html/entry/bondage-and-discipline-language.html "http://www.elsewhere.org/jargon/html/entry/bondage-and-discipline-language.html")
にあらず。手続き型のアプローチがわかりやすいときは、それを使えばいいのだ。

これは、 Fabrice Le Fessant による、手続き型のアプローチの、概形だ:

```ocaml
let list = ref [] in
let dir = opendir "......." in
try
  while true do
    match readdir dir with
    | "." | ".." -> ()
    | filename -> list := filename :: !list
  done;
  assert false
with End_of_file -> !list
```

### 再帰の例: リストの最大の要素

リストをあつかう再帰の、基本的な例をみてみよう:

```ocaml
let rec loop () =
  a match or if statement
  | base case -> []
  | recursive case -> element :: loop ()
```

ここで大切なことは、match、 base case、 recursive case
のパターンの使いかただ。これからの例 - リストのなかで最大の要素を求める
- では、2つの base case と、ひとつの recursive case
をとることになる。いきなりコードの話に入る前に、ちょっと足をとめて、じっくりこの問題を考えてみよう。この問題を考えることで、解法が"まるで魔法の
ように"頭に浮かぶようになるだろう(約束するよ :-)

まずはじめに、リストの最大の要素というのは、もっとも値が大きなもののことをいう、とはっきりさせておこう。リスト
`[1; 2; 3; 4; 1]` の最大の要素は、 `4` だ。

特別な場合などあるだろうか? あるとも。 空リスト `[]`
の最大の要素とはなんだ? *そんなものはない* 。
そこで、空リストを渡したときは、エラーを throw するようにするべきだ。

`[4]` のような、要素がひとつだけのリストの最大の要素とはなんだ?
これは簡単だ。それはその要素自身だ。よって、 `list_max [4]` は `4`
を返すべきで、一般に、 `list_max [x]` は `x` を返すべきとなる。

最大の要素は、一般の `x :: remainder` (これは、リストの "cons" 記法で、
`remainder` はつまり tail で、リストだ)のときは、何になるだろう?

じっくり考えてみよう。ここで、 `remainder`
の最大の要素を知っているとして、それを `y` としよう。 `x :: remainder`
の最大の要素はなんだろう? それは、 `x > y` か `x <= y` かで決まる。もし
`x` が `y` より大きければ、全体の最大値は `x` で、逆に `x` が `y`
より小さければ、全体の最大値は `y` だ。

本当にこれでいけるだろうか? `[1; 2; 3; 4; 1]` をまたみてみる。これは、
`1 :: [2; 3; 4; 1]` だ。では、remainder 、 `[2; 3; 4; 1]`
の最大の要素は、 `4` だ。よって、 `x = 1` と `y = 4`
ということになった。先頭の要素 `x = 1` は、もう `y = 4`
のほうが大きいとわかったから、どうでもよく、結局、リスト全体の最大値は
`y = 4` というわけだ。

上記のルールをコードにしていけば、求める関数ができる。

```ocamltop
  let rec list_max xs =
    match xs with
    | [] ->   (* empty list: fail *)
	   failwith "list_max called on empty list"
    | [x] -> (* single element list: return the element *)
	   x
    | x :: remainder -> (* multiple element list: recursive case *)
	   max x (list_max remainder)
```

コメントを加えておいたので、上で決めたルールや特別な場合が、どうコードの各行に対応しているか、見てほしい。

動くかな?

```ocamltop
list_max [1; 2; 3; 4; 1];;
list_max [];;
list_max [5; 4; 3; 2; 1];;
list_max [5; 4; 3; 2; 1; 100];;
```

示した解法はこのように、(a) 手続き型の for-loop
による解法とはかけはなれている。 (b)
やりたいことが非常に率直に表されている。関数型プログラマがよくいう、関数型スタイルは手続き型スタイルよりもずっとレベルが高いというのはこういうこ
とで、より単純で、より良いということだ。信じるかどうかはあなた次第だ。確かなのは、関数型で書いたもののほうが、より理にかなっていて、
`list_max`
が正しいことを公理的に証明することも難しくない。("正しい"というのは、数学的な方法で、このプログラムにバグがないことを証明できるということだ。これは、スペースシャトルや原子力発電所や、ようするに高品質なソフトウェアが求められる場合に、重要である。)

### 末尾再帰

`range` 関数をまた見てみよう。もう、おなじみになってしまった:

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a+1) b
```

ちょっとこれを書き直して、プログラムの構造がもっとわかりやすくなるようにする(中身は同じまま):

```ocamltop
let rec range a b =
  if a > b then []
  else
    let result = range (a+1) b in
    a :: result
```

呼び出そう:

```ocamltop
List.length (range 1 10);;
List.length (range 1 1000000);;
```

うーむ…
ぱっと見たかんじでは、再帰プログラミングにまつわる問題のようだ。つまり、関数型プログラミングの屋台骨に問題があるのか!
繰り返しではなく再帰をつかってコードを書いたために、大きな入力のときにスタック領域を使いきってしまう可能性がでてきた、もうだめだ?

いいや、そんなことはない。コンパイラは単純な最適化をして、ある形の再帰関数を
while
ループに置き換えてくれる。したがって、この形の再帰関数は、一定のスタック領域で動き、効率も手続き型の
while ループと同じである。これらの関数を **末尾再帰関数** という。

末尾再帰関数とは、全体の最後でのみ再帰呼出しをするものをいう。上の
`loop ()` 関数があっただろう? それらはすべて、この形をしていた:

```ocaml
let rec loop () =
  (* do something *)
  loop ()
```

`loop ()` の再帰呼出しが一番最後でだけなので、 `loop` は
末尾再帰であり、コンパイラは全体を while ループにしてくれるだろう。

不幸にも、 `range`
は末尾再帰でない、上の長めにしたほうを見ればわかるだろう。 `range`
の再帰呼出しがあるのは一番最後ではない。というのも、最後にあるのは `::`
(cons) 処理だからだ。結果として、コンパイラは再帰を while
ループにしてくれず、この関数はスタック領域を無駄に使うことになる。

上の補遺で扱った、 Eric Cooper の "accumulator"
法を思い出そう、この方法は関数型プログラミングでいろいろに使われていると私は言った。さあ、こいつの出番だ。こいつを使えば、上の
`range`
のような関数を、末尾再帰を守った形に書けるようになる。効率的で、大きな入力でも大丈夫なようになるのだ。

`range` 関数を書き直して、 accumulator
引数に、"今までの結果"が入るようにしてやろう:

```ocaml
let rec range2 a b accum =
  (* ... *)
  
let range a b =
  range2 a b []
```

(ここは、入れ子関数を本当なら使うところだ)

`accum`
引数に結果を蓄積していく。それが"今までの結果"だ。渡すのは空リストだ("今までの結果は無し")。
簡単なのは、 `a > b` のときだ:

```ocaml
let rec range2 a b accum =
  if a > b then accum
  else
    (* ... *)
```

もし `a > b` なら(つまり、もし再帰の最後まできたら)、やめて、結果(
`accum` )を返す。

巧みなのは、 `else` 節の書きかたである。 `range2`
の呼出しが一番最後になっているのを確かめよう。この関数は末尾再帰になっている:

```ocamltop
let rec range2 a b accum =
  if a > b then accum
  else range2 (a+1) b (a :: accum)
```

ただひとつ、ちょっとした問題がこの関数にはある:
リストを逆に作ってしまうのだ!
これを直すのは簡単で、rangeをこう定義しなおせばよい:

```ocamltop
let range a b = List.rev (range2 a b []);;
```

これでもいいが、すこし遅いのはどうかと思う。100万の要素のリストをつくらねばならないこともあるのだから:

```ocamltop
List.length (range 1 1000000)
```

以下の実装は、前のものより2倍速い。リストを逆順にしなくてよいからだ:

```ocamltop
let rec range2 a b accum =
  if b < a then accum
  else range2 a (b-1) (b :: accum);;
  
let range a b =
  range2 a b [];;
```

末尾再帰について簡潔にまとめたが、現実の世界では、ある関数が末尾再帰になるかどうかを求めるのは、かな
り難しいことがある。ここで本当に学んだことはなんだろう?
それは、再帰関数には、未熟なプログラマにとって危険な罠が潜んでいるということである。
関数がちゃんと動いているように見えても、それは小さな入力(テストの間)のときだけで、大きな入力にさらされた途端、ボロがでてしまうことがある。これ
は、再帰関数を *使わず* に、明示的な while
ループを使うのも、可能ならよいということだ。

更新可能な(mutable)レコード、参照(再び!)、配列
----------------------------------------------

前にレコードについては触れた。これはCの `構造体`のようなものだ:

```ocamltop
type pair_of_ints = { a : int; b : int };;
{a=3; b=5};;
{a=3};;
```

ひとつ、紹介しなかった機能がある: OCaml
のレコードは、更新可能なフィールドを持てる。普通に書いて
`{a = 3; b = 5}`
のようにすると、更新不可能になり、定数的なオブジェクトになる。ところで、もしレコードが
***更新可能な***
フィールドを持つなら、レコードの中のそれらのフィールドを更新するための手段があるはずだ。これは、
OCaml
の手続き型な機能で、なぜなら関数型言語は普通、更新可能なオブジェクトを許さないからだ(更新可能なオブジェクトには他に、参照や、更新可能な配列があ
る。すぐあとで触れる。)

これが、更新可能なフィールドを持って定義されたオブジェクトだ。このフィールドは、このオブジェクトが何回アクセスされたかを数えるのに、使われる。これは思うに、キャッシュの仕組みに使えそうだ。これを見て、どのオブジェクトをメモリから追い出すかを決めればよい。

```ocamltop
type name = { name : string; mutable access_count : int }
```

この関数は name を扱うもので、 `name` フィールドを出力し、更新可能な
`access_count` フィールドをインクリメントする:

```ocamltop
let print_name name =
  print_endline ("The name is " ^ name.name);
  name.access_count <- name.access_count + 1
```

`print_name` は、変な、まったく関数型でないことをやっている:
`access_count` パラメータを変更している。もし
5章をつぶさに読んでいれば、この関数が "純粋" でないとわかるだろう。
OCaml は関数型言語だが、それを強引に押し付けたりはしないのだ。

とにかく、 `print_name` を動かしてみよう:

```ocamltop
let n = { name = "Richard Jones"; access_count = 0 };;
n;;
print_name n;;
n;;
print_name n;;
n;;
```

明示的に `mutable` とつけたフィールドだけが、 `<-`
演算子を使って代入できる。 mutable
でないフィールドに代入しようとしても、 OCaml にはばまれる:

```ocamltop
n.name <- "John Smith";;
```

すでにお手のものになった、参照は、更新可能な `contents`
フィールドを持ったレコードを使って実装されている。 `Pervasives`
にある定義を確かめてみよう:

```ocamltop
type 'a ref = { mutable contents : 'a }
```

さらに、OCaml がトップレベルで出力する参照の値を、よく見てみよう:

```ocamltop
let r = ref 100;;
```

配列は、 OCaml が提供する、また違った種の更新可能な構造体だ。 OCaml
では、リストは連結リストとして実装されているが、連結リストだと遅い処理がいくつかある。例えば、リストの先頭を得たり、リストをまわって各要素になん
らかの処理をしていくというのは、難なく速い。しかし、リストの n
番めの要素に飛ぶとか、リストにランダムアクセスをしようとかは、処理が遅い。
OCaml の `Array`
型は本物の配列なので、ランダムアクセスは速いが、要素の挿入や削除は遅い。
`配列` も更新可能なので、要素をどうとでも更新できる。

配列のイロハは簡単だ:

```ocamltop
let a = Array.create 10 0;;
for i = 0 to Array.length a - 1 do
  a.(i) <- i
done;;
a;;
```

注: 配列を書くための構文は、 `[| element: element; ...|]`

OCaml
のコンパイラは、きつい数値計算をこなすことを考えて、設計されている(
FORTRAN が伝統的に使われていた分野だ)。

そのために、様々な最適化が、数字の配列やベクトルや行列に特化して、なされている。これは、密な行列の掛け算をするベンチマークのコードだ。
for
ループを使い、全体としてかなり手続き型なスタイルをとっているので注意してほしい:

```ocamltop
let size = 30
  
let mkmatrix rows cols =
  let count = ref 1
  and last_col = cols - 1
  and m = Array.make_matrix rows cols 0 in
  for i = 0 to rows - 1 do
    let mi = m.(i) in
    for j = 0 to last_col do
      mi.(j) <- !count;
      incr count
    done;
  done;
  m
  
let rec inner_loop k v m1i m2 j =
  if k < 0 then v
  else inner_loop (k - 1) (v + m1i.(k) * m2.(k).(j)) m1i m2 j
  
let mmult rows cols m1 m2 m3 =
  let last_col = cols - 1
  and last_row = rows - 1 in
  for i = 0 to last_row do
    let m1i = m1.(i) and m3i = m3.(i) in
    for j = 0 to last_col do
      m3i.(j) <- inner_loop last_row 0 m1i m2 j
    done;
  done
  
let () =
  let n =
    try int_of_string Sys.argv.(1)
    with Invalid_argument _ -> 1
  and m1 = mkmatrix size size
  and m2 = mkmatrix size size
  and m3 = Array.make_matrix size size 0 in
  for i = 1 to n - 1 do
    mmult size size m1 m2 m3
  done;
  mmult size size m1 m2 m3;
  Printf.printf "%d %d %d %d\n" m3.(0).(0) m3.(2).(3) m3.(3).(2) m3.(4).(4)

```
