<!-- ((! set title よくあるエラーメッセージ !)) ((! set learn !)) -->

*Table of contents*

よくあるエラーメッセージ
======================

このページでは、
OCamlコンパイラが出すエラーや警告メッセージからいくつかについて短く説明していく。
長い説明はたいていチュートリアルの専用のセクションにあるだろう。

型エラー
--------

### This expression has type ... but is here used with type ...

オブジェクトの型が使われている文脈で互換性がないときに、
この種のメッセージが頻繁に出てくる。

```ocamltop
1 + 2.5;;
```

"This expression has type X but is here used with type Y" (この式は X
型になっているが Y 型であるべきでは？)はこういう意味だ。
式の中身が単独の `(2.5)` なのでその型は X (`float`) と推論される。
しかし、 文脈つまり `(1 + ...)` のような周囲の状況は Y (`int`)
型の式を期待するという相違があり、 X と互換性がない。

もっと混乱するのが以下のメッセージだ:

```text
This expression has type my_type but is here used with type my_type
```
このエラーは普通、トップレベル環境で型定義を幾つかテストするときに起こる。
OCaml
では、すでに別の型名になっている名前で型を定義することは完全に合法である。
次のセッションで考えてみよう:

```ocamltop
type my_type = A | B;;
let a = A;;
type my_type = A | B;;
let b = B;;
a = b;;
```

コンパイラにとって、2番目の `my_type`
の定義は最初の定義とは全く独立している。
つまり同じ名前の二つの型を定義したことになる。 "`a`"
は早々に定義されているので最初の型に属しており、 "`b`"
は2番目の型に属している。 この例では、 `my_type` の最後の定義より後で
"`a`" を再定義すると問題は解決する。 この種の問題は、
同じモジュール内の同じ型に同じ名前を使うようながっかりなことをしない限り、
実際のプログラムでは起きないだろう。

### Warning: This optional argument cannot be erased

オプション引数を伴う関数は最低一つのラベル無し引数が必要だ。
たとえはこれは良くない:

```ocamltop
let f ?(x = 0) ?(y = 0) = print_int (x + y)
```

単にunit型の引数を付け加えれば解決する。こんなふうに:

```ocamltop
let f ?(x = 0) ?(y = 0) () = print_int (x + y);;
```

[ラベル](labels.ja.html "ラベル")の章で、ラベルつき引数を伴う関数の詳細が分かる。

### The type of this expression, ..., contains type variables that cannot be generalized

これは、コンパイル単位(ファイル)の終端に到達したときに、
コンパイラにとってそのオブジェクトの完全な型が分からないが、
何らかの理由で多相型ではいけないような場合に起きる。 例:

```ocamltop
let x = ref None
```

コンパイル中に以下のメッセージが出る:

```text
The type of this expression, '_a option ref,
contains type variables that cannot be generalized
```

解法:例のように型の注釈を付けてコンパイラに教える:

```ocamltop
let x : string option ref = ref None
```

または:

```ocamltop
let x = ref (None : string option)
```

`'_a`
型のデータは一時的にだけ(たとえばトップレベルセッション)許されている。
これはあたえられたオブジェクトは型が不明だが、
どの型でもなく、多相データでもない。
トップレベル環境では例は以下の結果になる:

```ocamltop
let x = ref None
```

コンパイラは `x` の型がまだ完全には分かっていないことを伝えている。
しかし、あとで `x` を使うときにコンパイラは `x` の型を推論できる:

```ocamltop
x := Some 0
```

これで `x` は既知の型となった:

```ocamltop
x;;
```

[OCaml
FAQ](http://caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html#variables_de_types_faibles)
にもっと詳細がある。

パターンマッチングの警告とエラー
-----------------------------

### This pattern is unused

そのようなコードを意図的に残す理由は全くないので、
この警告はエラーとみなすべきだ。 これは以下の状況のように、
何気なく全称パターンを使ったときに起きやすい。

```ocamltop
let test_member x tup =
  match tup with
  | (y, _) | (_, y) when y = x -> true
  | _ -> false;;
```

明らかにこのプログラマは、 OCaml
のパターンマッチングのなんたるかについて誤解していた。
以下を覚えておこう:

-   場合分けのツリーは左から右に直線的に進む。正規表現のマッチのようなバックトラック(引き返し)はしない。
-   ガード("`when`"
    節)はパターンの一部ではない。これは高々一度だけ評価される単なる条件であり、次のマッチケースへ飛ぶ最後の手段として使われる。
-   小文字の識別子 (上の例の "`y`" のような束縛)
    はまさに名前であり、常にマッチする。

これで、上の例では最初の組だけがテストされるだけというのは明確だ。
従って以下のような結果になる:

```ocamltop
test_member 1 (1, 0);;
test_member 1 (0, 1);;
```

### This pattern-matching is not exhaustive

OCaml のパターンマッチングは、パターンの組が場合を尽くしているか否かを、
型に基づいてのみチェックできる。 したがって以下の例では、 コンパイラは
`mod` 演算が返すであろう `int` の範囲は分からない。

```ocamltop
let is_even x =
  match x mod 2 with
  | 0 -> true
  | 1 | -1 -> false
```

パターンマッチングを使わない解決方法はこの通りだ:

```ocamltop
let is_even x = x mod 2 = 0
```

一般的に、この類の簡単化は不可能であり、
最善解は到達することにない全称ケースを加えることだ:

```ocamltop
let is_even x =
  match x mod 2 with
  | 0 -> true
  | 1 | -1 -> false
  | _ -> assert false
```

有効なプログラムの再コンパイル時の問題
-----------------------------------

### x.cmi is not a compiled interface

古いプログラムを際コンパイルしたり、適切にきれいになってない (訳注: make
clean していないような)
外部ソースからプログラムをコンパイルしたりすると、
このようなエラーメッセージを食らうかもしれない。

```text
some_module.cmi is not a compiled interface
```
これは `some_module.cmi` が OCmal
コンパイラの現在のバージョンにとっては有効でないという意味だ。
たいてい、古いコンパイル済ファイル (`*.cmi`, `*.cmo`, `*.cmx`, ...)
を削除して再コンパイルすれば問題は解決するはずだ。

### Warning: Illegal backslash escape in string

最近のバージョンの OCaml では、
文字列中の保護されないバックスラッシュ(2つ重ねるべき)
を避けるよう警告する。
このようなメッセージは古いプログラムをコンパイルするときにも
出てくることがあるから、
"`-w x`"オプションを付けることで表示を消すことが出来る。

```ocamltop
"\e\n" (* bad practice *);;
"\\e\n" (* good practice *);;
```
