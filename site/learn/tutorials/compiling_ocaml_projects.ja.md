<!-- ((! set title OCamlプログラムをコンパイルする !)) ((! set learn !)) -->

*Table of contents*

OCamlプログラムをコンパイルする
=============================

コンパイルの基本
---------------

OCaml のコアディストリビューションには `ocamlc` と `ocamlopt`
コンパイラが含まれる。 これらを直接使うのもよいが、
もしサードパーティ製のライブラリを使うのなら、
ライブラリがシステムのどこにインストールされたのかを
気にする必要を抑えてくれる `ocamlfind` フロントエンドを使うべきだ。
もっと自動的にコンパイルする方法を知りたければ、
先のセクション「ビルドの自動化システム」まで飛ばしてよい。

このセクションでは、 まず `ocamlc` や `ocamlopt` だけを使って
簡単なプログラムをコンパイルする方法を見ていく。 そして、
ライブラリの使いかたと、 `ocamlfind` コマンドを提供している
[findlib](http://projects.camlcity.org/projects/findlib.html)
システムの利用方法を見ていく。

### ocamlc と ocamlopt

`ocamlc` はバイトコードコンパイラであり、 `ocamlopt`
はネイティブコードコンパイラだ。
もしどちらを使ったらいいかわからなければ `ocamlopt` を使おう。
これはスタンドアロンの実行形式を生成し、 普通はバイトコードよりも速い。

`progprog` というプログラムが二つのソースファイル `module1.ml` と
`module2.ml` からなっているとしよう。
ネイティブコードにコンパイルするには `ocamlopt` を使う。
ここで、自動でロードされる標準ライブラリ以外は使っていないとしよう。
このプログラムのコンパイルは1ステップで出来る:

```shell
ocamlopt -o progprog module1.ml module2.ml
```

これだけだ。 コンパイラは `progprog` または `progprog.exe`
という名前の実行ファイルを生成する。
もし複数のファイルからなるプログラムの書き方が不思議であれば、
モジュール チュートリアルを見よ。
忘れないで欲しいのはソースファイルの順番が重要だということだ。
`module2.ml` がコマンドラインで先にこない限り、 `module1.ml` は
`module2.ml` で定義されたものに依存してはならない。

では標準ライブラリ以外のライブラリを使おう。 OCaml
ディストリビューションは標準ライブラリといっしょに配られており、
加えて他のライブラリもあなたは同様に使える。
ネットワークから3Dグラフィックに至る広範囲のアプリケーションのための、
サードパーティ製のライブラリがいっぱいある。
以下の事を理解しなければならない:

1.  OCaml
    コンパイラは標準ライブラリがどこにあるかを知っており、システマティックに使う(`ocamlc -where`
    を試してみよ)。これに付いてあなたが心配することはない。
2.  INRIA から配られる OCaml ディストリビューションの他のライブラリ(Str,
    Unix, Bigarray など)
    は標準ライブラリと同じディレクトリにインストールされる。
3.  サードパーティ製のライブラリはいろんなところにインストールされるだろうし、システムによってインストール場所が違ってしまうライブラリもあるだろう。

プログラムが Unix ライブラリ (Unix
システム向けに限らないシステムコールを提供)
のみを使っている場合、コマンドラインはこうなる:

```shell
ocamlopt -o progprog unix.cmxa module1.ml module2.ml
```

`.cmxa` はネイティブコードライブラリの拡張子であり、 `.cma`
はバイトコードライブラリの拡張子だ。 `unix.cmxa`
ファイルはかならず標準ライブラリと同じ場所にインストールされ、
そのディレクトリはライブラリのサーチパスに入っているので見つかる。

もし SDL と openGL を使ったビデオゲームのプログラムであれば、
コンパイラに、どのライブラリを使うのか、また
どこにそのライブラリがあるのかを伝える必要がある。 つまり lablGL や
OCamlSDL を使うと、 openGL や SDL の手元の実装を OCaml
が連結するという意味だ。 lablGL は `lablgl.cmxa` という OCaml
ライブラリファイルをひとつ提供し、 OCamlSDL は `sdl.cmxa`
というコアライブラリひとつと、 3 つのオブションファイル
`sdlloader.cmxa`, `sdlmixer.cmxa`, `sdlttf.cmxa` を提供する。
これらのファイルを使いたければ、コマンドラインにこれらを書かないといけない。
またライブラリに依存するライブラリも示さないといけない。 ここで、
OCamlSDL が Bigarray ライブラリを必要だとする。 `ocamlopt` の `-l`
オプションで探索パスを全部伝えないといけない。
このようなインストール依存情報を `ocamlfind` が肩代りしてくれる。

### ocamlfind フロントエンドを使う

サードパーティ製の
OCamlライブラリを使うどんなプログラムやライブラリのコンパイルでも、
`ocamlfind` を使うことが高く推奨できる。
ライブラリの作者は自作ライブラリのインストールが `ocamlfind`
でできるようにすべきだ。
さもなくば、作者ではないあなたがそうしないといけないかもしれない。
それ自体はさほど難しくはないが、
たいていはそんなことはしなくても済むだろう。 よし、
使いたいライブラリは全て `ocamlfind`
で適切にインストールされていると仮定しよう。

どのパッケージやサブパッケージがシステムで利用可能になっているかは
以下のようにタイプすると分かる:

```shell
ocamlfind list
```

これでパッケージ名のリストがバージョンIDといっしょに表示される。

以下の例では、LablGL と OCamlSDL を使うこととして、 lablGL, sdl,
sdl.sdlimage, sdl.sdlmixer, sdl.sdlttf のパッケージを使ってみよう。 sdl
パッケージは Bigarray パッケージを必要としているが、 そんなことは
`ocamlfind` が知っているので心配することはない。

プログラムをコンパイルするコマンドは:

```shell
ocamlfind ocamlopt -o progprog -linkpkg \
  -package lablGL,sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf \
  module1.ml module2.ml
```

`ocamlfind` が把握している限り、 ライブラリの位置にかかわらず動作する。

ファイルを分割してコンパイルも出来ることに注意。
プログラムの一部だけをリコンパイルしたいときに大変役立つ。
ソースファイルを個別にコンパイルして最後にいっしょにリンクする動作をする、
等価コマンドがこれだ:

```shell
ocamlfind ocamlopt -c \
  -package lablGL,sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf \
  module1.ml
ocamlfind ocamlopt -c \
  -package lablGL,sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf \
  module2.ml
ocamlfind ocamlopt -o progprog -linkpkg \
  -package lablGL,sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf \
  module1.cmx module2.cmx
```

分割コンパイルは手作業では普通はやらないが、 `Makefile`
をつかって再コンパイルをするときだけは必要になる。
これについては次の節で。

ビルドの自動化システム
---------------------

複雑な OCaml プログラム群のコンパイル(ビルド)は、
献身的なツールがあるのでとても簡単になっている。 有名どころである GNU
make が使える。 OMake は GNU make の類似品だが、 OCaml と C
の両方のコンパイルに対応している。
ほかにも、単純なものかもしれないがコンパイルツールが [Caml
Hump](http://mirror.ocamlcore.org/caml.inria.fr/cgi-bin/hump.html)の
[build
tools](http://mirror.ocamlcore.org/caml.inria.fr/cgi-bin/hump.en02dc.html?sort=1&browse=55)
に挙げられている。
<!-- FIXME: the links to the hump must be replaced with OPAM -->

-   [GNU make
    でのコンパイル](compiling_with_gnu_make.ja.html "GNU make でのコンパイル")
-   [OMake
    でのコンパイル](compiling_with_omake.ja.html "OMake でのコンパイル")
-   [Oasis](setting_up_with_oasis.html)
