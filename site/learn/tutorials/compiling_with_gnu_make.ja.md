<!-- ((! set title GNU make でのコンパイル !)) ((! set learn !)) -->

*Table of contents*

GNU make でのコンパイル
======================

OCamlMakefile と組み合わせて GNU make を使う
-------------------------------------------

[OCamlMakefile](http://mmottl.github.io/ocaml-makefile/)
は、 複雑なOCamlプロジェクトのコンパイル作業をとても楽にする生成的な
Makefile だ。

標準のライブラリのみを使う基本的なOCamlプログラムやライブラリについては、
単にカレントディレクトリにOCamlMakefileをコピーし、 以下の Makefile
を作成する：

```makefile
RESULT = myprogram
SOURCES = \
  mymodule1.mli mymodule1.ml \
  myparser.mli myparser.mly mylexer.mll mymodule2.ml \
  mymainprogram.ml
  
OCAMLMAKEFILE = OCamlMakefile
include $(OCAMLMAKEFILE)
```

これは5つのコンパイル対象がある上に ocamlyacc と ocamllex
をも使う、かなり複雑なプログラムだ。 ocamlyacc が生成する .mli
ファイル(この例では myparser.mli) 以外の
ソースファイルだけ書く必要がある。

(上記例の最後で include される) OCamlmakefile
はいろんなターゲットを提供する。 詳細は OCamlMakefile
のドキュメントを参照してもらうとして、ここでは主なものを 紹介する：

```text
nc           ネィティブコードの実行ファイル作成
bc           バイトコードの実行ファイル作成
ncl          ネィティブコードのライブラリ作成
bcl          バイトコードのライブラリ作成
libinstall   ocamlfindを用いたライブラリのインストール
libuninstall ocamlfindを用いたライブラリのアンインストール
top          あなたのモジュールでカスタマイズされたトップレベルの生成
clean        OCamlMakefile で自動生成されたファイルの削除
```

OCamlMakefile + ライブラリ + Camlp4 の構文解析
---------------------------------------------

OCaml ライブラリのインストールの推奨ツールが
[Findlib](http://www.camlcity.org/archive/programming/findlib.html "Findlib")
(コマンド名は ocamlfind) だ。
パッケージのインストール先を把握し、依存性に応じてロードし、
あたえられた状況下でどのファイルを使うべきかを知っている。

もし Findlib を**使わない**場合、
標準ランタイムライブラリをロードするには LIBS と INCDIRS
変数を設定しておけばよい。 LIBS は .cma や .cmxa
拡張子をのぞいたライブラリファイル名 (xxx.cma や xxx.cma の xxx 部分)
を羅列する:

```makefile
LIBS = str unix
```

もし非標準のライブラリを標準ライブラリと同じディレクトリに
インストールしてない場合、 INCDIRS
変数にそのディレクトリを羅列する必要がある。

```makefile
INCDIRS = /path/to/somelibdirectory/
```

よし。だがライブラリは ocamlfind を使ってインストールする方が好ましい。
OCamlMakefile を使う場合、PACKS 変数を設定する必要がある:

```makefile
PACKS = netstring num
```

標準ライブラリの一部ではないが、 OCaml の標準インストールに添付される
unix, str, bigarray のような ライブラリは、Findlib
が自動認識してくれる。 つまりこれらのパッケージを要求されるとき (例えば
netstring は unix と pcre を要求する)は自動でロードされる。

## まとめ

必要なもの:

-   GNU make
-   OCamlMakefile (プロジェクトのメインディレクトリにコピーする)
-   Findlib (ocamlfind)
-   以下の雛型を元に小さい Makefile を書く
-   ソースファイルの先頭行におまじないを書いておく

ocamllex と unix, micmatch\_pcre ライブラリを使う例を全部示す。 Makefile
はこんな感じだ:

```makefile
RESULT = myprogram
SOURCES = mymodule1.mll mymodule2.mli mymodule2.ml mymainmodule.ml
PACKS = unix micmatch_pcre
CREATE_LIB = yes # ???
OCAMLMAKEFILE = OCamlMakefile
include $(OCAMLMAKEFILE)
```
