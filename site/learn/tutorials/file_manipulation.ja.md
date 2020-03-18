<!-- ((! set title ファイル操作 !)) ((! set learn !)) -->

*Table of contents*

ファイル操作
===========

これは標準ライブラリが提供するものだけを用いた、 OCaml
の基本的なファイル操作のガイドだ。

興味のあるモジュールの公式ドキュメントはこちら:
[Pervasives](/releases/latest/manual.htmllibref/Pervasives.html),
[Printf](/releases/latest/manual.htmllibref/Printf.html).

標準ライブラリは、読み込んだファイルを直接文字列に入れたり、
直接文字列をファイルに保存したりするような存在しない。 このような関数は
[Extlib](http://code.google.com/p/ocaml-extlib/)
など、サードパーティ製のライブラリにある。 [Std.input_file and
Std.output_file](http://ocaml-extlib.googlecode.com/svn/doc/apiref/Std.html)
を見よ。

バッファリングされたチャネル
--------------------------

OCaml で普通にファイルを開くと**チャネル**を返す。
二種類のチャネルがある。

-   ファイルに書き込むためのチャネル : `out_channel` 型
-   ファイルから読み込むためのチャネル : `in_channel` 型

### 書き込み

ファイルに書き込むにはこうする:

1.  `out_channel` を得るためにファイルを開く
2.  チャネルに何か書く
3.  物理デバイスに書き込みを強制したければ、チャネルをフラッシュしなければならない。そうしないのならすぐに書き込まないだろう。
4.  終わったらチャネルを閉じる。この時自動的にチャネルはフラッシュされる。

よく使う関数: `open_out`, `open_out_bin`, `flush`, `close_out`,
`close_out_noerr`

`out_channels` の標準出力／標準エラー出力版: `stdout`, `stderr`

### 読み込み

ファイルから読み込むにはこうする:

1.  `in_channel` を得るためにファイルを開く
2.  チャネルから文字を読み込む。読み込みによってチャネルは消費されるので、文字を読み込んだら、チャネルはファイルの次の文字を指すだろう。
3.  読み込める文字がなくなったときは `End_of_File`
    例外が上がる。そうしたら大抵はチャネルを閉じる。

よく使う関数: `open_in`, `open_in_bin`, `close_in`, `close_in_noerr`

`in_channel` の標準入力版: `stdin`

### シーク

何かをチャネルから読み込んだりチャネルに書き込んだりするときはいつも、
読み書きの直後に現在位置が次の文字に移動する。
ファイルの特定の位置に移動したいようなときや、
ファイルを最初から読み直したいときもあるだろう。
普通のファイルの位置を変えることは出来る。 `seek_in` や `seek_out`
が使える。

### これで大丈夫

-   ファイルに実際に書きたいのなら、`out_channel`
    のフラッシュを忘れないように。ファイルでないもの、例えば標準出力(`stdout`)やソケットへの書き込みの場合は特に重要だ。
-   OS
    は同時にオープンできるファイル数に制限があるので、使わなかったチャネルも閉じるのを忘れないように。ファイルの操作中にいかなる例外が上がった場合でも、対応するチャネルを閉じてから再度例外をあげること。
-   `Unix`
    モジュールはバッファリングしないファイルデスクリプタなどへのアクセスを提供する。標準チャネルに対応した同じ名前の標準ファイルデスクリプタ
    `stdin`, `stdout`, `stderr` が提供される。なので、`open Unix`
    すると型エラーを起こすかもしれない。`stdout`ファイルデスクリプタではなく
    `stdout`チャネルを使いたいときはモジュール名を前に付ければ良い:
    `Pervasives.stdout`。*注意:
    どのモジュールにも属していないと思っているものは実は `Pervasives`
    モジュールに属している。これは自動的にオープンされている。*
-   `open_out` と `open_out_bin`
    はもしファイルが存在したらそのファイルを切り捨ててしまう。この挙動で困るなら
    `open_out_gen` を使え。

### 例

```ocaml
open Printf
  
let file = "example.dat"
let message = "Hello!"
  
let () =
  (* message をファイルに書く *)
  let oc = open_out file in    (* ファイルの新規作成か切捨て。チャネルが返る *)
  fprintf oc "%s\n" message;   (* 何か書く *)
  close_out oc;                (* チャネルをフラッシュして閉じる *)
  
  (* ファイルから読んで最初の行を表示 *)
  let ic = open_in file in
  try 
    let line = input_line ic in  (* in_channel から1行読んで捨てる \n *)
    print_endline line;          (* 結果を stdout に書く *)
    flush stdout;                (* ここで実際に対象デバイスに書き込む *)
    close_in ic                  (* 入力チャネルを閉じる *)
  with e ->                      (* 期待しない例外が起こったとき *)
    close_in_noerr ic;           (* 緊急にチャネルを閉じる *)
    raise e                      (* エラー終了: ファイルは閉じられるが
                                    チャネルはフラッシュされない *)
  
  (* 通常終了: チャネルは全てフラッシュされて閉じられる *)
```
