<!-- ((! set title ラベル !)) ((! set learn !)) -->

*Table of contents*

ラベル
======

例外とハッシュテーブル
--------------------

*(未完)*

相互再帰関数
-----------

互いに互いを呼出しあうような2つの関数を、定義したいと思う。これは、あまりよく使うわけではないが、
知っておくと役に立つことがある。ポピュラーな例( Ryan Tarpine
に感謝)はこうだ: 数 0 は 偶数である。その他の 0
より大きい数は、その1つ前がもし奇数なら、偶数である。よって:

```ocamltop
let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)
```

上のコードは、まだ`odd` 関数を定義していないので、コンパイルできない!
しかし簡単なことだ。 ゼロは奇数ではない、 そして、その他の 0
より大きい数は、その1つ前がもし偶数なら、奇数である。そんな関数を補ってやれば、完成だ:

```ocamltop
let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)
  
let rec odd n =
  match n with
  | 0 -> false
  | x -> even (x-1)
```

惜しい ...
このプログラムはコンパイルできない。`even`関数をコンパイルするには、前もって`odd`が定義されていなければならず、`odd`関数をコンパイルするには、前もって`even`が定義されていなければならない。お互いの定義の順をひっくり返したって、だめなものはだめだ。

OCamlでは、"プロトタイプを前においておく"
はないが、2つやそれ以上の相互再帰関数たちを定義するための、特別な構文がある。すると`odd`と`even`はこうなる:

```ocamltop
let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)
and odd n =
  match n with
  | 0 -> false
  | x -> even (x-1)
```

これが果たして役に立つかどうか、私にはわからない。というのも、私は相互再帰関数なんてものを書くはめに
はなったことがないし、あっと驚くような例も思いつかないからだ。一応、こんなものもある、でいいだろう。相互再帰の、クラス定義やモジュールを書くのに
も、同じような構文が使われる。

関数名や引数に別名をつける
------------------------

第5章で、関数の部分適用について説明した。これを巧みに使うことで、タイプ量を省くことができる:
関数名や引数に別名をつけるのだ。

まだオブジェクト指向プログラミングにはふれていないが(それは次の章のテーマである)、ここで、
OCamlNet での、 関数を別名で呼び出している様子を見てみよう。
ここで知っておかねばならないのは、`cgi # output # output_string "string"`
は メソッド呼出しだということだ。 Java
でいう、`cgi.output().output_string ("string")`と似たようなものだ。

```ocaml
let begin_page cgi title =
  let out = cgi # output # output_string in
  out "<html>\n";
  out "<head>\n";
  out ("<title>" ^ text title ^ "</title>\n");
  out ("<style type=\"text/css\">\n");
  out "body { background: white; color: black; }\n";
  out "</style>\n";
  out "</head>\n";
  out "<body>\n";
  out ("<h1>" ^ text title ^ "</h1>\n")
```

`let out = ...`
は、メソッド呼出しに、関数の部分適用をやっている(部分というのは、 string
引数をまだ渡していないからだ)。`out`は従って関数であり、 string
引数を1つとる。

```ocaml
out "<html>\n";
```

は

```ocaml
cgi # output # output_string "<html>\n";
```

に等しい。これで大幅にタイプ量を省けた。

引数を加えることもできる。この`print_string`のもうひとつの定義はある意味、
関数名 & 引数に、別名をつけているとも考えることができる:

```ocaml
let print_string = output_string stdout
```

`output_string` は
2つの引数をとる(チャンネルと文字列)が、ここで渡したのは1つだけなので、部分適用になっている。よって、
`print_string` は関数で、 string 引数をひとつ、とろうとしている。

関数の、ラベル付き引数、オプショナル引数
----------------------------------------

### ラベル付き引数

Python には、関数への引数を書くのに最良の構文がある。これが例だ( Python
チュートリアルからそのままとった。 私は Python プログラマではないので):

```python
def ask_ok(prompt, retries=4, complaint='Yes or no, please!'):
  # function definition omitted
```

この Python の関数は、こんな風に呼ぶことができる:

```python
ask_ok ('Do you really want to quit?')
ask_ok ('Overwrite the file?', 2)
ask_ok (prompt='Are you sure?')
ask_ok (complaint='Please answer yes or no!', prompt='Are you sure?')
```

Python
では、呼び出すときに、引数に名前をつけることができる。普通に関数を呼ぶ構文もあるし、オプショナル引数をデフォルトの値とともに使うこともできる。

Perlでも似たようなことができる。

```perl
sub ask_ok
{
  my %params = @_;
  
  my $prompt = $params{prompt};
  my $retries = exists $params{retries} ? $params{retries} : 4;
  
  # ... etc.
}
  
ask_ok (prompt => "Are you sure?", retries => 2);
```

OCaml にも、
ラベル付き引数と、オプショナル引数(デフォルトの値もある)が、用意されている。

基本の構文は:

```ocamltop
let rec range ~first:a ~last:b =
  if a > b then []
  else a :: range ~first:(a+1) ~last:b
```

(`to` と `end` はどちらも、 OCaml
では予約語なので、ラベルに使えないのに注意。なので、 `~from/~to` や
`~start/~end` は使えない。)

前の `range` 関数の型は:

```ocaml
range : int -> int -> int list
```

そして、ラベル付き引数を使った、新しい `range` 関数の型は:

```ocaml
range : first:int -> last:int -> int list
```

(紛らわしいことに、`~`(チルダ)は型定義には*でてこない*。ここ以外では必ず付ける)。

ラベル付き引数なら、どのような順で引数をあたえても構わない:

```ocamltop
range ~first:1 ~last:10;;
range ~last:10 ~first:1;;
```

引数に名前をつけて、ラベルを関数定義内で変数と同じように使えるようにするための、短い書きかたもある。これは、
`lablgtk/gaux.ml` (lablgtk で使われている、便利で変なもののライブラリ)
で定義されている関数だ:

```ocamltop
let may ~f x =
  match x with
  | None -> ()
  | Some x -> ignore(f x)
```

ここでじっくり、この関数が何なのかを考え、型シグネチャを手で書き下すなどすると、後で理解がはかどる。やることがたくさんある。最初に、引数
`~f` は、単なる `~f:f` の略だ(すなわち、ラベルは `~f`
で、関数内で使われる変数は、 `f` である)。
次に気づくのは、関数がふたつの引数をとることだ。2番目の引数 (`x`)
にはラベルがない - ラベル有り無しが混ざった関数もいいわけだ。

ラベル付き引数 `f` の型はなんだろう? 明らかに、なにかの関数だ。

ラベルなしの引数 `x` の型はなんだろう? `match`
節がてがかりになる。よって、 `'a option` だ。

ここから、 `f` が `'a` の引数をとることがわかる。それから、 `f`
の返り値は、無視されているので、なんにでもなることがわかる。よって、 `f`
の型は `'a -> 'b` だ。

`may` 関数は全体として `unit` を返す。 `match` のどちらの場合も、結果が
`()` だからだ。

こうして、`may` 関数の型は(なんなら、 OCaml
のトップレベルでこれを確かめられる):

```ocaml
may : f:('a -> 'b) -> 'a option -> unit
```

この関数は何なのだろう? 関数を OCaml
のトップレベルで実行すると、てがかりが見つかる:

```ocamltop
may ~f:print_endline None;;
may ~f:print_endline (Some "hello");;
```

ラベルなし引数が、もし "null ポインタ" なら、 may
はなにもしない。そうでないときは、その引数で 関数 f
を呼ぶ。なぜこれが役に立つのか? このあと、明らかになる。

### オプショナル引数

オプショナル引数は、見るとラベル付き引数みたいだが、 `~` のかわりに `?`
を前に付ける。例はこうだ:

```ocamltop
let rec range ?(step=1) a b =
  if a > b then []
  else a :: range ~step (a+step) b
```

`~` と `?`
とが入れ替わって、なんだか紛らわしい構文だ。それについては次の節で説明する。この関数はこう呼ぶ:

```ocamltop
range 1 10;;
range 1 10 ~step:2;;
```

この場合、 `?(step=1)` で、 `~step` がオプショナル引数、デフォルトが 1
なのは、言うまでもない。デフォルトなしのオプショナル引数も使える。これは
lablgtk からの例(変更あり)である:

```ocamltop
type window = { mutable title: string;
                mutable width: int;
                mutable height: int }
  
let create_window () =
  { title = "none"; width = 640; height = 480; }
  
let set_title window title =
  window.title <- title
  
let set_width window width =
  window.width <- width
  
let set_height window height =
  window.height <- height
  
let open_window ?title ?width ?height () =
  let window = create_window () in
  may ~f:(set_title window) title;
  may ~f:(set_width window) width;
  may ~f:(set_height window) height;
  window
```

この例は、かなり複雑かつ巧妙だが、このパターンは、lablgtk
のソースコード中で一貫してよく使われている。まずは、単純な
`create_window` 関数に集中しよう。この関数は `unit` をとって `window`
を返す。title, width, height のデフォルト設定で `window`
の初期化が行われる:

```ocamltop
create_window ();;
```

`set_title`, `set_width`, `set_height` 関数は、`window`
構造体を更新するので純粋でない。使いかたは明らかである、例えば:

```ocamltop
let w = create_window () in
set_title w "My Application";
w;;
```

ここまでは、 前章で説明した、手続き型の "更新可能なレコード"
の話にすぎない。ここからの、 `open_window` 関数が、難しい。この関数は
*4つ*の引数をとり、3つはオプショナルで、その後のラベルなしの `unit`
は必須である。この関数をまずは動かしてみよう:

```ocamltop
open_window ~title:"My Application" ();;
open_window ~title:"Clock" ~width:128 ~height:128 ();;
```

思ったとおりの動きだが、一体どうやってるんだ?! 秘密は、 `may`
関数(上ででてきた)と、オプショナル引数がデフォルトを *持たない*
ことにある。

オプショナル引数にデフォルトがないときは、その型は `'a option` になる。
`'a` は普通は、型推論によって導かれるので、 上の `?title` の場合は、型は
`string option` になる。

`may` 関数は覚えている? それは、関数と引数をとり、その引数が `None`
でなかったら、その引数で関数を呼ぶ。よって:

```ocaml
may ~f:(set_title window) title;
```

もしオプショナル引数の `title` が呼出し時に指定されなければ、 `title` =
`None` であり、 `may` は何もしない。しかし、もし関数を、例えば、

```ocaml
open_window ~title:"My Application" ()
```

と呼んだら、 `title` =
`Some "My Application"` となり、よって `may` は
`set_title window "My Application"` を呼ぶ。

次の節に進む前に、この例をよく吟味して、完全に理解しておいてほしい。

### "警告: このオプショナル引数は、削除できません"

ラベルやオプショナルの引数にふれたが、このまとめを通じて、いくつか疑問が浮かんだはずだ。まずは、なぜ、余分な
`unit` 引数が、 `open_window` についているのだろうか? この関数を 余分の
`unit` なしで、定義してみよう:

```ocamltop
let open_window ?title ?width ?height =
  let window = create_window () in
  may ~f:(set_title window) title;
  may ~f:(set_width window) width;
  may ~f:(set_height window) height;
  window
```

OCamlで関数をコンパイルできたが、なにか見慣れない警告をだしてきた:
"警告: このオプショナル引数は、削除できません" 最後の引数 `?height`
のことをいっているようだ。 なにがここで起きているのかを示すため、
この変更した `open_window` を呼び出してみよう:

```ocamltop
open_window;;
open_window ~title:"My Application";;
```

うまくいったかどうか? いや、だめだ。それどころか、 `open_window`
関数は、実行すらされていない。かわりに、なにか変な型の情報が出力されている。いったいなにがあった?

カリー化とアンカリー化や、関数の部分適用について思い出してほしい。`plus`
関数をこう定義したとして:

```ocamltop
let plus x y =
  x + y
```

これを部分適用すると、例えば `plus 2` として、"何かに 2 を足す関数"
が得られる:

```ocamltop
let f = plus 2;;
f 5;;
f 100;;
```

`plus` の例では、 OCaml のコンパイラは簡単に、 `plus 2`
にまだ充分なだけの引数があたえられていないということを、理解できた。
`plus` 関数が実行されるには、引数がさらにもうひとつ必要なのだ。よって、
`plus 2` は、もうひとつの引数が来るのを待っている関数である。

オプショナル引数がはいると、話がややこしくなってくる。上の
`open_window;;` を呼出す場合がまさにそうだ。ユーザは、 "`open_window`
をいま実行しろ" と言っているのか?
それとも、ユーザは、後でオプショナル引数を(いくつか、あるいは全部)与えようとしているのか?
`open_window;;` は、残りの引数が来るのを、 `plus 2`
のように待っているのか?

OCaml は安全なほうを優先するので、 `open_window`
を実行しない。そのかわりに、部分適用としてそれを扱う。 すなわち、
`open_window` 式は、関数値として、評価される。

元に戻って、ラベルなし引数 `unit` が最後についている `open_window`
の定義をみてみよう:

```ocamltop
let open_window ?title ?width ?height () =
  let window = create_window () in
  may ~f:(set_title window) title;
  may ~f:(set_width window) width;
  may ~f:(set_height window) height;
  window
```

もしもオプショナル引数を `open_window` に与えたければ、最後の `unit`
の前につけなければならない。もしこう打ったら:

```ocamltop
open_window ();;
```

これは "`open_window`
をいま実行せよ、オプショナル引数はすべて指定しない"ということであり、一方、もしこう打ったら:

```ocamltop
open_window;;
```

これは "関数値がほしい" あるいは (トップレベルでよくある) "`open_window`
の型を出力してほしい"ということである。

### `~` でもっと短く

`range`
関数をまた書き直してみよう。今度は、ラベルを使いつつ、できるだけ短く書いてみる:

```ocamltop
let rec range ~first ~last =
  if first > last then []
  else first :: range ~first:(first+1) ~last
```

`~foo` は、 `~foo:foo`
の略である。これは、関数を呼ぶときにもあてはまり、関数の引数を宣言するときと同じである。よって、上で赤く示した
`~last` も、 `~last:last` の略というわけだ。

### `?foo` を関数呼出しで使う

オプショナル引数には、まだちょっとコブがある。アプリケーションを開く関数を書きたいとしよう。中に
`open_window` 関数を含めて、こう書こう:

```ocamltop
let open_application ?width ?height () =
  open_window ~title:"My Application" ~width ~height
```

`~width` は、 `~width:width` の略である。 `width` の型は `'a option`
だが、 `open_window ~width:` は `int` を待っている。

OCaml にはさらなる構文糖が用意されている。関数呼出しに `?width`
と書くと、 `~width:(unwrap width)` の略になる。ここで、 `unwrap` は
"`option` の包み" を `width` のまわりから取りさる関数とする(実際には、
`unwrap`
のような関数を書くのは不可能なのだが、概念としてはわかる)。よって、この関数は正しくはこう書く:

```ocamltop
let open_application ?width ?height () =
  open_window ~title:"My Application" ?width ?height
```

### `~` と `?` の使いどころ

ラベルやオプショナル引数の構文はややこしいので、 `~foo` を使うのか、
`?foo` を使うのか、 ただの `foo`
を使うのか、わからなくなってしまうかもしれない。いささか黒魔術じみていて、なかなか実用には至らないだろう。

`?foo` を使うのは、関数の引数を宣言するとき、つまり:

```ocaml
let f ?arg1 ... =
```

か、関数の呼出しのときに"`option`の包みを取りさる"ための特別な形のとき:

```ocamltop
let open_application ?width ?height () =
  open_window ~title:"My Application" ?width ?height
```

だけである。`?foo` を宣言すると、 `foo`
という変数が作られるので、値が必要なら、`foo` をそのまま使えばよい。

同じことがラベルにもいえる。 `~foo`
の形を使うのは、関数の引数を宣言するときだけである、つまり:

```ocaml
let f ~foo:foo ... =
```

`~foo:foo` と宣言すると、 そのとおり `foo`
という変数が作られるので、値が必要なら、 `foo` をそのまま使えばよい。

ややこしいのには、2つの理由がある:第一に、 `~foo` の略の形 ( `~foo:foo`
に等しい)のせい、第二に、ラベルやオプショナルの引数をとる関数を呼び出すときに、その略の形が使われるせいだ。

この lablgtk のコードは、これらのすべてをやっていて、
かなり手が込んでいる:

```ocaml
let html ?border_width ?width ?height ?packing ?show () =  (* line 1 *)
  let w = create () in
  load_empty w;
  Container.set w ?border_width ?width ?height;            (* line 4 *)
  pack_return (new html w) ~packing ~show                  (* line 5 *)
```

一行目で、関数定義をやっている。5つのオプショナル引数があり、6つ目はお約束の
`unit` 引数である。オプショナル引数のそれぞれが、変数を定義する、例えば
`border_width` などで、 型は `'a option` だ。

4行目で、`?foo`
特別の形を使って、オプショナル引数をとる関数に、オプショナル引数を渡している。
`Container.set` はこのような型をもつ:

```ocaml
module Container = struct
  let set ?border_width ?(width = -2) ?(height = -2) w =
    (* ... *)
```

5行目は、 `~` の略記を使っている。 長い形で書くと:

```ocaml
pack_return (new html w) ~packing:packing ~show:show
```

`pack_return` 関数は、例のごとくラベル付き引数をとり、その `~packing` と
`~show` の型は両方とも `'a option` である。つまり、 `pack_return`
は明示的に `option` の包みを取りさっている。

### 補遺

ラベル付き引数やオプショナル引数はややこしいと思われるのも無理はない、実際、そのとおりなのだ!
幸いにも、これは OCaml
の比較的新しい機能なので、まだそれほど幅広くは使われていない。実のところ、
lablgtk
をハックするのでなければ、ラベル付き引数やオプショナル引数を見ることなど、そうはあるまい(現時点では)

ヴァリアント 再考 ("多相ヴァリアント")
--------------------------------------

以下の C コードをコンパイルしてみよう:

```C
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

enum lock { open, close };

main ()
{
  int fd, n;
  char buffer[256];

  fd = open ("/etc/motd", O_RDONLY);                     // line 12
  while ((n = read (fd, buffer, sizeof buffer)) > 0)
    write (1, buffer, n);
  close (fd);                                            // line 15
}
```

このコードをコンパイルすると、エラーがでて、その中にこんなものがある:

```text
test.c: In function `main':
test.c:12: error: called object is not a function
test.c:15: error: called object is not a function
```

これは、Cの 列挙型 (enum)にまつわる問題である。上の例で、 enum 文は
*3つ*のシンボル、つまり、`lock`, `open`, `close`
を予約している。また違う例では:

```C
enum lock { open, close };
enum door { open, close };
```

をコンパイルすると:

```text
test.c:2: error: conflicting types for `open'
test.c:1: error: previous declaration of `open'
test.c:2: error: conflicting types for `close'
test.c:1: error: previous declaration of `close'
```

最初の enum はシンボル `open ` を `enum lock ` 型
の何かとして定義している。そのシンボルは、もう他の enum で使えない。

このことは、C/C++
プログラマには常識なので、そんな下手なコードは書かないだろう。同じような問題が、
OCaml のヴァリアントにもあるのだが、 OCaml
にはそれをやりすごすための方法が用意されている。

この OCaml コードは、なんと、コンパイル*できる*:

```ocamltop
type lock = Open | Close
type door = Open | Close
```

この2つの文が実行されたら、`Open` の型は何になる?
トップレベルで、簡単に調べられる:

```ocamltop
type lock = Open | Close;;
type door = Open | Close;;
Open;;
```

OCaml は `Open` について、直前にあった定義を使うので、型は `door`
になっている。実のところ、これはたいした問題にはならない。というのも、もし誤って
`Open` を `lock` の型の文脈で使おうとしても、OCaml
のすばらしい型推論が、エラーを即座に発見するので、コードをコンパイルできないからだ。

と、ここまではほとんど C みたいだ。さて、`Open`
がひとつだけしか型を持てないというこの制約を、やりすごすための方法が、OCaml
にはあると私は言った。つまり、 `Open` を "型 `lock` の `Open` " と "型
`door` の `Open` "の両方の意味で使いたいというとき、 OCaml
にその通りの動きをさせるための方法があるのだ。

それには、構文をちょっと変えて、こうすればよい:

```ocamltop
type lock = [ `Open | `Close ];;
type door = [ `Open | `Close ];;
```

構文の違いに注意:

1.  それぞれのヴァリアント名の前に、 `` ` `` (バッククォート)
    が付いている。
2.  それらの組を角括弧(`[]`)で囲ってやらなければならない。

当然、こんな疑問が浮かぶ: `` `Open `` の型は何だ?

```ocamltop
`Open;;
```

`` [> `Open] `` というのは、
`` [ `Open | と、その他、我々が知らない何かがある可能性] ``
と読むとよい。 \> (より大きい)
記号は、中のリストにない可能性がある、ということを示している(開かれている)。

`` `Open ``
に特別なことはない。*どんな*単語でも、バッククォートをつければ型として使えるし、さっきはふれなかったがこんなこともできる:

```ocamltop
`Foo;;
`Foo 42;;
```

さあ、 `lock` の状態を出力する関数を書いてみよう:

```ocamltop
let print_lock st =
  match st with
  | `Open -> print_endline "The lock is open"
  | `Close -> print_endline "The lock is closed"
```

関数の型を注意して見てみよう。型推論によって、引数 `st` の型は
`` [< `Close | `Open] `` になっている。 \< (より小さい)記号は、これが
**閉じたクラス**という意味だ。つまり、この関数が動くのは
`` `Close `` か `` `Open `` についてだけで、他ではだめだということだ。

```ocamltop
print_lock `Open;;
```

`print_lock` が `door` にも `lock`
にも、まったく同じようにちゃんと動いている!
型安全性が多少損なわれるが、それはわかっていたことであるし、これによって、型推論が、我々の意図したとおりに推論してくれるようになったことを考えれば、几帳面なコードに執着せずともよいだろう。

これは、多相ヴァリアントのほんのさわりにすぎない。安全な型の推論のため、これらは、滅多なことではコード中で使わないほうがよいだろう。それよ
りも、高等な OCaml
のコードの中でこれらを見ることのほうが、ずっと多いだろう。高等プログラマには、高等テクニックを書くのに型システムを弱めたいということが、ときどき
あるからだ。
