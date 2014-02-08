<!-- ((! set title ハッシュ表 !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

Hashtbl (ハッシュ表)モジュール
============================

`Hashtbl`
モジュールは効率的な変更可能ルックアップテーブルで実装されている。
ハッシュ表を作成するにはこう書く:

```ocamltop
let my_hash = Hashtbl.create 123456;;
```

`123456` は `hashtbl` の初期サイズだ。
この初期値は単純にハッシュ表に載せるデータ量をうまく予想したものだ。
サイズが過小評価であればハッシュ表は大きくなることができるので、
あまり心配しなくてよい。 `my_hash` の型は

```ocaml
val my_hash : ('_a, '_b) Hashtbl.t
```

`'_a` と `'_b` はそれぞれキーと値の型に対応する。
キーと値の型がまだ決まっていないので、 それらに具体的な型(例: `int`,
`float * string`) は設定されない。
下線はキーとデータの型がいったん選択されたら固定されることを示す。
言い替えれば、ハッシュ表のキーとしてint を使った後に、
同じハッシュ表のキーとして文字列を使えないということだ。

`my_hash` に幾つかデータを加えよう。
クロスワードを解くプログラムに取り組んでおり、
ある文字で始まる単語を全部見つけたいとする。 はじめにデータを `my_hash`
に入力する必要がある。

ハッシュ表は修正をするとそこで更新される、つまり `Map` とは違い、
表を変更するたびに別のハッシュ表が作られるわけではないことに注意。
ゆえに、 "`let my_hash = Hashtbl.add my_hash ...`"
というコードは全く意味がない。 かわりにこのように書こう:

```ocamltop
Hashtbl.add my_hash "h" "hello";
Hashtbl.add my_hash "h" "hi";
Hashtbl.add my_hash "h" "hug";
Hashtbl.add my_hash "h" "hard";
Hashtbl.add my_hash "w" "wimp";
Hashtbl.add my_hash "w" "world";
Hashtbl.add my_hash "w" "wine";;
```

`my_hash` の中から "`h`"
をキーとする要素をひとつ取り出すには次のように書く。 `find`
がちょうど一つの要素だけをどう返すのか分かるだろうか。 "`h`"
をキーとする最後に入力したデータ要素だ。

```ocamltop 
Hashtbl.find my_hash "h"
```

我々が欲しかったものは "`h`" で始まる全ての要素だったはずだ。
そのために、それら全部を見つけたい。"`find_all`" とは
まさにおあつらえ向きの名前ではないか。

```ocamltop
Hashtbl.find_all my_hash "h"
```

とすると

    ["hard"; "hug"; "hi"; "hello"]

が返る。

`my_hash` のなかにある文字で始まるエントリがあるかどうかを見つけるには
次のようにする:

```ocamltop
Hashtbl.mem my_hash "h"
```
