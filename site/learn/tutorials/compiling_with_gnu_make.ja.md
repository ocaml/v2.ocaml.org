<!-- ((! set title GNU make でのコンパイル !)) ((! set learn !)) -->

*Table of contents*

GNU make でのコンパイル
======================

OCamlMakefile と組み合わせて GNU make を使う
-------------------------------------------

[OCamlMakefile](https://bitbucket.org/mmottl/ocaml-makefile)
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

    nc           ネィティブコードの実行ファイル作成
    bc           バイトコードの実行ファイル作成
    ncl          ネィティブコードのライブラリ作成
    bcl          バイトコードのライブラリ作成
    libinstall   ocamlfindを用いたライブラリのインストール
    libuninstall ocamlfindを用いたライブラリのアンインストール
    top          あなたのモジュールでカスタマイズされたトップレベルの生成
    clean        OCamlMakefile で自動生成されたファイルの削除

OCamlMakefile + ライブラリ + Camlp4 の構文解析
---------------------------------------------

OCaml ライブラリのインストールの推奨ツールが
[Findlib](http://www.ocaml-programming.de/programming/findlib.html)
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

これは普通、一つの方法でいろんな環境にインストールする、 慣習的には
configure スクリプトで行う類の前準備段階で必要になる。
他にも、デフォルトサーチパスに含まれていない標準ディレクトリ (たとえば
/path/to/stdlib/camlp4) でも同じだ。
この場合は以下のように書けば十分で、この方が可搬性がある:

```makefile
INCDIRS = +camlp4
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

camlp4 による構文拡張はどうだろうか。
プリプロセッサでロードされるバイトコードユニットみたいに
構文拡張を定義しているパッケージがあるかもしれない。 OCamlMakefile
を使う場合、
プリプロセッサを使いたいときにはファイルの1行目に以下の定義をする:

```ocaml
(*pp ...
```

つまりこのように書く:

```ocaml
(*pp camlp4o -I /path/to/pa_infix pa_infix.cmo *)
```

うーん、このやりかたはちょっと不便だ。
だから各ファイルで同じプリプロセッサを使うことにして、 Makefile の PP
変数にこの共通の方法を代入する:

```makefile
PP = camlp4o -I /path/to/pa_infix pa_infix.cmo
export PP
```

そうすれば、OCaml ファイルはこう始められる:

```ocaml
(*pp $PP *)
```

このプリプロセッサ定義でもまだ満足できない。 ocamlfind
の特長と同じようにして構文拡張ファイルを取り込みたい。
そのためには、[camlp4find](http://martin.jambon.free.fr/ocaml.html)
スクリプトが使える。 普通、PACKS 変数に使うパッケージを羅列しておくと、
camlp4 が ocamlfind と同じように構文拡張をロードしてくれる:

```makefile
PACKS = unix micmatch_pcre \
   pa_tryfinally pa_lettry pa_forin pa_forstep pa_repeat pa_arg
PP = camlp4find $(PACKS)
export PP
```

## まとめ

必要なもの:

-   GNU make
-   OCamlMakefile (プロジェクトのメインディレクトリにコピーする)
-   Findlib (ocamlfind)
-   camlp4find (プロジェクトのメインディレクトリにコピーする)
-   ocamlfind でインストールした Camlp4 パッケージ
-   以下の雛型を元に小さい Makefile を書く
-   ソースファイルの先頭行におまじないを書いておく

ocamllex と unix, micmatch\_pcre ライブラリを使う例を全部示す。 Makefile
はこんな感じだ:

```makefile
RESULT = myprogram
SOURCES = mymodule1.mll mymodule2.mli mymodule2.ml mymainmodule.ml
PACKS = unix micmatch_pcre
PP = camlp4find $(PACKS)
export PP
CREATE_LIB = yes # ???
OCAMLMAKEFILE = OCamlMakefile
include $(OCAMLMAKEFILE)
```

.ml や .mli ファイルは以下の行で始める:

```ocaml
(*pp $PP *)
```
