<!-- ((! set title コマンドライン引数 !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

コマンドライン引数
=================

これは、初めて OCaml プログラムを書いたときに
コマンドラインから渡される引数の読み出し方に悩む
人たちのための短いチュートリアルだ。

argv
----

C言語のようにプログラムに渡される引数は配列に格納される。
伝統に従ってこの配列には `argv` という名前がつけられている。
標準ライブラリの `Sys` モジュールに含まれているので、 フルネームは
`Sys.argv` である。
プログラムそれ自身の名前を含んだ引数の数は、単純に配列の長さであり、
`Array.length` 関数で分かる。

簡単な例
--------

以下のプログラムでは `Sys.argv`
内の引数の位置もいっしょに引数を表示する。

```ocaml
open Printf
  
let () =
  for i = 0 to Array.length Sys.argv - 1 do
    printf "[%i] %s\n" i Sys.argv.(i)
  done
```

`args.ml` として上のプログラムを保存して `ocaml args.ml arg1 arg2 arg3`
と実行すると、 以下の結果を得る:

    [0] args.ml
    [1] arg1
    [2] arg2
    [3] arg3

OCaml はサブプロセスとして実際に `argv` が `args.ml arg1 arg2 arg3`
となるような プログラムを走らせたことに注意しよう。 また、プログラムを
`ocamlopt -o args args.ml` とコンパイルして、 `./args arg1 arg2 arg3`
と走らせると以下の結果となる。

    [0] ./args
    [1] arg1
    [2] arg2
    [3] arg3

コマンドラインオプションの解析ツール
------------------------------------

コマンドライン引数を、配列`Sys.argv`を自分で走査せずに
処理するライブラリがある:

-   `Arg` モジュールが標準ライブラリにある。
-   OCaml版
    [Getopt](http://www.eleves.ens.fr/home/frisch/soft.html#Getopt)
    は [GNU
    getopt](http://www.gnu.org/software/libc/manual/html_node/Getopt.html)
    に似ている。
-   [Pa_arg](http://www-personal.umich.edu/~ebreck/code/pa_arg/)
    ライブラリはオプションの定義と読み出しのための便利な構文を提供する。
