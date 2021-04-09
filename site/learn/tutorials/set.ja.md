<!-- ((! set title 集合 !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

Set (集合)モジュール
====================

文字列の集合を作るには:

```ocamltop
module SS = Set.Make(String);;
```

集合を作るには、どこかからはじめないといけない。 そのために空集合がある:

```ocamltop
let s = SS.empty;;
```

または、はじめの要素が分かっているのなら、 集合は次のように作れる:

```ocamltop
let s = SS.singleton "hello";;
```

この集合に要素を何個か追加するにはこうすればよい:

```ocamltop
let s =
  List.fold_right SS.add ["hello"; "world"; "community"; "manager";
                          "stuff"; "blue"; "green"] s;;
```

ここで、集合をいじっていると、
作った集合のなかに何があるかを見たいと思うことだろう。 そのために、
集合を表示する関数を次のように書ける。

```ocamltop
(* Prints a new line "\n" after each string is printed *)
let print_set s = 
   SS.iter print_endline s;;
```

集合の中のある特定の要素を削除したいときには削除関数がある
(訳注:`SS.remove "hello" s;;`)。
しかし、同時に何個かの要素を削除したいときには、
「フィルタ」を通すようなものを考える。
5文字以下の単語をすべてフィルタリングしよう。

このように書ける:

```ocamltop
let my_filter str =
  String.length str <= 5;;
let s2 = SS.filter my_filter s;;
```

あるいは匿名関数を使って:

```ocamltop
let s2 = SS.filter (fun str -> String.length str <= 5) s;;
```

集合内にある要素が存在するかどうかを調べたいときは このようになるだろう:

```ocamltop
SS.mem "hello" s2;;
```

`Set` モジュールはまた、
集合理論の操作、和集合、積集合、差集合を提供する。
例えば、元の集合と短い文字列集合(5文字以下)の集合の差集合は、
長い文字列集合である:

```ocamltop
print_set (SS.diff s s2);;
```

`Set` モジュールは純粋に関数的データ構造を提供することに注意:
集合から要素を取り除くのは集合が変更されるのではなくむしろ、
元の集合とほとんど同じ(内部的には多くを共有する)新しい集合が返される。
