<!-- ((! set title データ型とパターンマッチング !)) ((! set learn !)) -->

*Table of contents*

データ型とパターンマッチング
=========================

連結リスト
----------

Perlと同じく、OCamlはリストを言語組込みで提供している。OCamlのリストは、全ての要素が、同じ型をもっていなければならない。リストを書くには、こうする:

```ocamltop
[1; 2; 3]
```
(注 セミコロンだ、コンマじゃない)

[]は空のリストだ。

リストには、**head**(最初の要素) と**tail**(その残りの要素)がある。head
は要素で、tail はリストだ。上の例では、head は整数`1`で、tail
は*リスト*`[2; 3]`だ。

別のやりかたでリストを書くには、**cons**演算子で`head :: tail`とやる。なので、以下のやりかたでリストを書いても、まったく一緒だ:

```ocaml
[1; 2; 3]
1 :: [2; 3]
1 :: 2 :: [3]
1 :: 2 :: 3 :: []
```

どうしてcons演算子に触れたかって?そりゃ、*パターンマッチング*をリストにやろうってときに便利だからだ。後で説明する。

### 連結リストの型

整数の連結リストの型は、`int list`で、一般に、`foo`の連結リストの型は、`foo list`である。

ここからわかるように、連結リストの全ての要素は、同じ型でなければならない。しかし、型は多相でもよい(すなわち`'a list`)
これにうってつけなのは、"何かのlist"を扱うような総称関数を、書くときだ。(ただし注意:`'a list`は、個々の要素が違う型を持つということではない。-
リストは、うーん、整数と文字列をごちゃまぜにふくむみたいな、そんなものを作るのには使えない。要素の型は何でもよいが、全部が同じ型でないといけないということだ。)

`length`関数は、OCamlの`List`モジュールのところで定義されている。これがよい例だ。リストに入っているのが、整数でも、文字列でも、オブジェクトでも、ちっちゃいふわふわの動物でも、関係なく、`List.length`関数を呼べばよい。`List.length`の型は、従って、こうなっている:

```ocaml
List.length : 'a list -> int
```

構造体
------

CとC++には、単純な`struct`という概念がある。structure(訳注:構造体)の略だ。Javaにはクラスがあり、これも似たようなことができるうえに、もっといろんな用途もある。

単純なCの構造体を考えよう:

```C
struct pair_of_ints {
  int a, b;
};
```

OCamlで、これに等価なもので、もっとも簡単なのは、`タプル`(訳注:組)である。`(3, 4)`といったもので、型は`int * int`だ。リストと違って、タプルは違う型の要素を含めるので、例えば、`(3, "hello", 'x')`とすれば、型は`int * string * char`だ。

ちょっと難しいが、別のやりかたでCの構造体を書くには、**レコード**がある。レコードは、Cの構造体みたいに、名前を要素につけることができる。タプルでは、名前を要素につけられないので、かわりに、どこに来るかの順番を覚えておかなければならない。これが、先ほどのCの構造体と等価なレコードだ。

```ocamltop
type pair_of_ints = { a : int; b : int };;
```

これは型を定義している。この型のオブジェクトを実際に*作る*にはこうする。

```ocamltop
{ a=3; b=5 }
```

注
型定義をするときに":"があったところに、この型のオブジェクトを作るときには、"="が入っている。

これは、この型のをトップレベルでやった例だ。:

```ocamltop
type pair_of_ints = { a : int; b : int };;
{a=3; b=5};;
{a=3};;
```

そう、OCamlは、構造体のフィールドを未定義のままにはさせてくれない。

ヴァリアント (修飾つき共用体と列挙型)
-------------------------------------

"修飾つき共用体"(原文 "qualified
union")はCにはないと言ってよいが、GCCコンパイラは対応している。以下は、修飾つき共用体の、Cでの一般的な使われかたの、見本である:

```C
struct foo {
  int type;
#define TYPE_INT 1
#define TYPE_PAIR_OF_INTS 2
#define TYPE_STRING 3
  union {
    int i;        // If type == TYPE_INT.
    int pair[2];  // If type == TYPE_PAIR_OF_INTS.
    char *str;    // If type == TYPE_STRING.
  } u;
};
```

こうしてみると、ふつふつと、見ちゃいられないという思いがする。てはじめに、安全じゃない:
プログラマーが、ついうっかり、`u.i`フィー
ルドを間違えてしまい、実際には文字列が構造体に入っていた、なんてはめになりそうだ。そのうえ、コンパイラがチェックして、すべての型の可能性が
switch文で調べられているかを確かめる、なんてことは、簡単にはできない(かわりに列挙型を使えば、この問題は解消できる)。プログラマーは`type`フィールドをセットし忘れるかもしれない、そうしたら無茶苦茶なことになる。いやがうえにも、厄介だ。

OCamlでは、簡潔に美しく、こうなる。:

```ocamltop
type foo =
  | Nothing
  | Int of int
  | Pair of int * int
  | String of string
```

これが型定義だ。`|`で区切られている。それぞれの区切りの頭のところは、コンストラクタという。呼びやすいものをつければよいが、大文字ではじめること。コンストラクタで、値を定義するときは、続けて`of type`の部分がくる。typeはいつも小文字ではじまる。上の例では、Nothingは定数として使われ、他のコンストラクタは、値とともに使われている。

実際にこの型のものを*作る*には、こう書く。:

```ocaml
Nothing
Int 3
Pair (4, 5)
String "hello"
...
```

これらの式の各々が、型`foo`をもつ。

注
型定義を書くときに、`of`を使うが、この型の要素を書くときには、使わない。

拡張によって、単純なCの列挙型は、こう定義される:

```C
enum sign { positive, zero, negative };
```

OCamlではこう書ける:

```ocaml
type sign = Positive | Zero | Negative
```

### 再帰ヴァリアント(ツリーに使う)

ヴァリアントは再帰でもよく、ツリー構造を定義するのに普通は使う。これこそが、関数型言語の表現力の、真髄である。:

```ocamltop
type binary_tree =
  | Leaf of int
  | Tree of binary_tree * binary_tree
```

2分木をいくつか用意した。練習に、これらを紙に書き下してみよう。

```ocaml
Leaf 3
Tree (Leaf 3, Leaf 4)
Tree (Tree (Leaf 3, Leaf 4), Leaf 5)
Tree (Tree (Leaf 3, Leaf 4), Tree (Tree (Leaf 3, Leaf 4), Leaf 5))
```

### パラメータつきヴァリアント

前の節の２分木は、おのおのの葉に整数をもっていた、しかし、もし、２分木の*カタチ*を記述したい、葉ノードになにを納めるかは、後で決めたい、というときはどうしたらよいだろうか?
こういうときは、パラメータつき(多相)ヴァリアントを使って、こうする。:

```ocamltop
type 'a binary_tree =
  | Leaf of 'a
  | Tree of 'a binary_tree * 'a binary_tree
```

これが汎用な型である。整数をおのおのの葉におさめるとき、型の指定は、`int binary_tree`となる。同様に、文字列をおのおのの葉におさめるとき、型の指定は、`string binary_tree`となる。次の例では、トップレベルで、いくつかのインスタンスに型をつけて、型推論システムに型を示してもらっている。:

```ocamltop
Leaf "hello";;
Leaf 3.0;;
```

どのように型名がさかのぼるかに注意。これを、リスト(例えば`int list`など)の型名と、比べてみるとよい。

実は、`'a list`は同じように"さかのぼる"わけではない。リストはパラメータつきヴァリアント型ではあるが、次のようなちょっと変な定義になっている:

```ocaml
type 'a list = [] | :: of 'a * 'a list   (* not real OCaml code *)
```

実際には、上の定義でコンパイルされるわけではない。もっと正確な定義は、こうだ:

```ocamltop
type 'a equiv_list =
  | Nil
  | Cons of 'a * 'a equiv_list;;
Nil;;
Cons(1, Nil);;
Cons(1, Cons(2, Nil));;
```

前に、リストは2通りのやりかたで書けるといったことを、思い出してほしい。構文糖で`[1; 2; 3]`と書けたり、もっと正式には、`1 :: 2 :: 3 :: []`と書けた。上の`'a list`の定義を見れば、正式な定義の理由が、きっとわかるだろう。

リスト、構造体、ヴァリアント　- まとめ
--------------------------------------

OCamlでの名前 型定義の例 使用例

```text
リスト          int list                       [1; 2; 3]
タプル          int * string                   (3, "hello")
レコード        type pair =                    { a = 3; b = "hello" }
                 { a: int; b: string }
ヴァリアント    type foo =
	             | Int of int                 Int 3
			     | Pair of int * string
ヴァリアント    type sign =
                 | Positive                   Positive
			     | Zero                       Zero
                 | Negative
パラメータつき  type 'a my_list =
ヴァリアント      | Empty                      Cons (1, Cons (2, Empty))
                 | Cons of 'a * 'a my_list
```

パターンマッチング(データ型に)
------------------------------

とってもクールな機能が、関数型言語にはある。それは、データ構造をバラして、データにパターンマッチング
をする、そんな能力だ。これは、まあ、"関数型"の機能というわけではない。 -
どうにかすれば、Cでも、こういったことはできるんじゃないか、とも思える。しかし、これがクールな機能だというのに、変わりはない。

実際のプログラムの仕様をもとに、はじめよう:
単純な数学の式を表現したい。`n * (x + y)`のような。または、それらの掛け算を記号的に行って、`n * x + n * y`を得たいのだ。

型の定義を、これらの式についておこなう:

```ocamltop
type expr =
  | Plus of expr * expr        (* means a + b *)
  | Minus of expr * expr       (* means a - b *)
  | Times of expr * expr       (* means a * b *)
  | Divide of expr * expr      (* means a / b *)
  | Value of string            (* "x", "y", "n", etc. *)
```

式`n * (x + y)`はこう書かれる:

```ocamltop
Times (Value "n", Plus (Value "x", Value "y"))
```

出力をする関数を書いて、`Times (Value "n", Plus (Value "x", Value "y"))`を、もっとこう、`n * (x + y)`み
たいに、書き出すようにしよう。実際には、ふたつの関数を書く。ひとつは、式を変換して、うまく文字列にするもの。ひとつは、それを書き出すもの。
(理由は、同様に文字列をファイルに書き出すものも、書きたいからだ。それだけのために関数まるごとを書きなおすのは避けたい。)

```ocamltop
let rec to_string e =
  match e with
  | Plus (left, right) ->
     "(" ^ to_string left ^ " + " ^ to_string right ^ ")"
  | Minus (left, right) ->
     "(" ^ to_string left ^ " - " ^ to_string right ^ ")"
  | Times (left, right) ->
	 "(" ^ to_string left ^ " * " ^ to_string right ^ ")"
  | Divide (left, right) ->
	 "(" ^ to_string left ^ " / " ^ to_string right ^ ")"
  | Value v -> v ;;
  
let print_expr e =
  print_endline (to_string e);;
```

(注:　\^演算子は、文字列を連結する。)

printの関数を実行するとこうなる:

```ocamltop
print_expr (Times (Value "n", Plus (Value "x", Value "y")))
```

パターンマッチングの一般的な形はこう:

```ocaml
match value with
| pattern    ->  result
| pattern    ->  result
  ...
```

左手のpatternは、うえの`to_string`関数のように、単純かもしれないし、あるいは、複雑で、入れ子かもしれない。次の例で、この関数に、掛け算をいれる。式の形は、`n * (x + y)`か`(x + y) * n`である。このように、入れ子のパターンを使うことになる。

```ocamltop
let rec multiply_out e =
  match e with
  | Times (e1, Plus (e2, e3)) ->
     Plus (Times (multiply_out e1, multiply_out e2),
           Times (multiply_out e1, multiply_out e3))
  | Times (Plus (e1, e2), e3) ->
     Plus (Times (multiply_out e1, multiply_out e3),
           Times (multiply_out e2, multiply_out e3))
  | Plus (left, right) ->
     Plus (multiply_out left, multiply_out right)
  | Minus (left, right) ->
     Minus (multiply_out left, multiply_out right)
  | Times (left, right) ->
     Times (multiply_out left, multiply_out right)
  | Divide (left, right) ->
     Divide (multiply_out left, multiply_out right)
  | Value v -> Value v
```

実行するとこうなる。:

```ocamltop
print_expr(multiply_out(Times (Value "n", Plus (Value "x", Value "y"))))
```

どのように`multiply_out`関数は動いているんだろう?
はじめの2つのパターンが鍵だ。1番めのパターンは、`Times (e1, Plus (e2, e3))`で、`e1 * (e2 + e3)`のかたちの式にマッチする。この1番めのパターンマッチの右手を見ると、`(e1 * e2) + (e1 * e3)`なので、等しいことがわかるだろう。

2番めのパターンも、同じことをやっている。ただ、式の形は`(e1 + e2) * e3`だ。

のこりのパターンは、式の形を変えないが、しかし、重大なことを*やっている*。`multiply_out`関数を再帰的に、部分式にたいして呼んでいる。これによって、式のなかの部分式にもすべて、掛け算が行われる。(もし、式の掛け算がただ一段階ですんでいれば、残りのパターンはすべて、単純な`e -> e`ルールに置き換えられただろう。)

逆をやれるだろうか？(すなわち、共通部分式のくくりだし)できるとも!(ただ、もうすこし複雑になる。)以下のバージョンは、一段階の式でしかうまく動かない。改良をすれば、何段階の式でも、より複雑な場合でも、うまくやれるようにできる。:

```ocamltop
let factorize e =
  match e with
  | Plus (Times (e1, e2), Times (e3, e4)) when e1 = e3 ->
     Times (e1, Plus (e2, e4))
  | Plus (Times (e1, e2), Times (e3, e4)) when e2 = e4 ->
     Times (Plus (e1, e3), e4)
  | e -> e;;

factorize (Plus (Times (Value "n", Value "x"),
                 Times (Value "n", Value "y")))
```

上のfactorize関数で、更にまたいくつか、機能が明らかになった。**ガード**というものを、各パターンマッチにつけたすことができる。
ガードは、条件式で、`when`のあとにくる。意味は、パターンマッチが起こるのは、パターンがマッチして、*さらに*、`when`-節の条件が満たされるときだ。

```ocaml
match value with
| pattern  [ when condition ] ->  result
| pattern  [ when condition ] ->  result
  ...
```

2番目の機能は、`=`演算子だ。これは、2つの式の間で、"構造的等しさ"をテストする。再帰的におのおのの式に入っていって、そのすべての段階で、ちゃんと同じであるかを調べる。

OCamlは、コンパイル時にチェックをして、パターンのすべての可能性が網羅されているかを確かめてくれる。型定義を変更して、上の`type expr`に`Product`ヴァリアントを加えてみた:

```ocamltop
type expr = Plus of expr * expr      (* means a + b *)
          | Minus of expr * expr     (* means a - b *)
          | Times of expr * expr     (* means a * b *)
          | Divide of expr * expr    (* means a / b *)
          | Product of expr list     (* means a * b * c * ... *)
          | Value of string          (* "x", "y", "n", etc. *)
```

それから再コンパイルを、`to_string`関数を変えずにやった。OCamlは以下の警告をしてきた。

```ocamltop
let rec to_string e =
  match e with
  | Plus (left, right) ->
     "(" ^ to_string left ^ " + " ^ to_string right ^ ")"
  | Minus (left, right) ->
     "(" ^ to_string left ^ " - " ^ to_string right ^ ")"
  | Times (left, right) ->
	 "(" ^ to_string left ^ " * " ^ to_string right ^ ")"
  | Divide (left, right) ->
	 "(" ^ to_string left ^ " / " ^ to_string right ^ ")"
  | Value v -> v ;;
```
