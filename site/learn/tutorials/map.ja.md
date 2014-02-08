<!-- ((! set title 写像 !)) ((! set learn !)) ((! set center !)) -->

Map (写像)モジュール
--------------------

`Map` は「マッピング(写像)」を作成する。 例えば、
ユーザーとユーザーに関連づけられたパスワードからなるデータがあるとしよう。
`Map` モジュールでユーザー名からそのパスワードへの写像を作成できる。
`Map` モジュールは単にこれをするのではなく、とても効率的に行う。
また関数的方法で行う。 以下の例では文字列から文字列への写像を行うが、
そのような異なったデータ型でも写像を行える。

`Map` を作るにはこうする:

```ocamltop
module MyUsers = Map.Make(String);;
```

よし、これでモジュールが作られたのでこのなかに何か入れはじめよう。
どこから始めようか? うーん、空のモジュールからはじめてみよう。

```ocamltop
let m = MyUsers.empty;;
```

ふぅむ。空のモジュールはちょっとつまらないので、何かデータを加えよう。

```ocamltop
let m = MyUsers.add "fred" "sugarplums" m;;
```

ここで "`fred`" と、 彼のパスワードである "`sugarplums`"
をモジュールに加えた。 とても重要な点を指摘する。 一旦、文字列
"`sugarplums`" を加えると写像の型が固定される。 つまりこれは `MyUsers`
モジュールが文字列から文字列への写像であるということだ。
もし文字列から整数への写像や整数から何かへの写像が欲しければ
別の写像を作らないといけない。

ついでにいくつか追加データを加えよう。

```ocamltop
let m = MyUsers.add "tom" "ilovelucy" m;;
let m = MyUsers.add "mark" "ocamlrules" m;;
let m = MyUsers.add "pete" "linux" m;;
```

`Map` モジュールのなかにいくつかデータがあるので、
どこかでデータが見られると親切じゃないかな?
簡単な表示関数を作ってみよう。

```ocamltop
let print_users key password =
  print_string(key ^ " " ^ password ^ "\n")
```

ふたつの文字列、キーとパスワードをとって
それらを最後の改行も込みにして表示してくれる関数である。
これで必要なのは写像に適用する関数だ。 それはこんな感じになるだろう:

```ocamltop
MyUsers.iter print_users m
```

だが写像にデータを置く理由は、
データを素早く見つけ出したいからかもしれない。
見つけ出しかたを実際に示す:

```ocamltop
MyUsers.find "fred" m
```

これは素早く効率的に `Fred` のパスワードである "`sugarplums`" を返す。
