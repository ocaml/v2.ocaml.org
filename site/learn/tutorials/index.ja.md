<!-- ((! set title OCamlチュートリアル !)) ((! set learn !)) -->
<!-- {{! input template/macros.mpp !}} -->

# OCamlチュートリアル

このウェブサイトはOCamlを学ぼうとする人たちの為の実際的で詳細なチュートリアルを集めたものである。

よく知られている通り、OCamlはアプリケーション開発のための高速、簡潔かつ強力な言語である。ここでは読者がすでにOCamlの処理系をインストールしているものと仮定する。

((! get begin_two_columns !))

### はじめに

* [Up and Running](up_and_running.html)
* [はじめの一歩](basics.ja.html) — 基本中の基本
* [OCamlプログラムの構造](structure_of_ocaml_programs.ja.html)
* [モジュール](modules.ja.html)
* ファイル名と拡張子 - [en](filenames.html)
* プログラミングのスタイル — [en](guidelines.html)

### データ構造

* [Maps (Dictionaries)](map.ja.html)
* [Sets](set.ja.html)
* [Hash Tables](hashtbl.ja.html)
* [標準コンテナの比較](comparison_of_standard_containers.ja.html)

### 言語機能

* [データ型とパターンマッチング](data_types_and_matching.ja.html)
* [関数型プログラミング](functional_programming.ja.html)
* [If文、ループと再帰](if_statements_loops_and_recursion.ja.html)
* [ラベル](labels.ja.html)
* ポインタ - [en](pointers.html)
* [ヌルポインタ、assert、警告](null_pointers_asserts_and_warnings.ja.html)
* [オブジェクト](objects.ja.html)

### エラー

* エラーハンドリング - [en](error_handling.html)
* [よくあるエラーメッセージ](common_error_messages.ja.html)

((! get second_of_two_columns !))

### 相互運用性

* Cライブラリを呼ぶ — [en](calling_c_libraries.html)
* Fortranライブラリを呼ぶ - [en](calling_fortran_libraries.html)

### ビルドシステム

* [OCamlプログラムをコンパイルする](compiling_ocaml_projects.ja.html)
* OCamlbuild — [en](ocamlbuild/)
* OASISを使ったOCamlプロジェクトのセットアップ — [en](setting_up_with_oasis.html)

### 高度なトピックス

* [ガベージコレクション](garbage_collection.ja.html)
* [性能とプロファイル](performance_and_profiling.ja.html)

### 一般的なタスク

* テキストのフォーマットとラッピング — [en](format.html)
* 99 Problems (solved) in OCaml — [en](99problems.html)
* GTKプログラミング入門 — [en](introduction_to_gtk.html)
* [コマンドライン引数](command-line_arguments.ja.html)
* [ファイル操作](file_manipulation.ja.html)

### 謝辞

* [_謝辞_](../../contributors.html#Oldercontributorstothetutorials)

日本語訳にあたり、以下の方から、寄稿、助言、提案をいただきました。ここに、心よりの感謝の意を表します。

- Masaki UKAI
- Teruaki Gemma
- Yoriyuki Yamagata

((! get end_two_columns !))

## 外部リンク

###  Learn by Doing

* [Try OCaml Online](http://try.ocamlpro.com/) (by OCamlPro) allows
 you to immediately start learning OCaml in your browser, without
 installing it. Compiled as a single Javascript page, it gives you
 the full power of OCaml, even when your are disconnected from the
 network.
* [PLEAC-OCaml](http://pleac.sourceforge.net/pleac_ocaml/) provides
 OCaml solutions to the complete set of problems originally posed in
 the very successful Perl Cookbook. OCaml is one of only 3 languages
 for which the full set of solutions has been provided.
* [Rosetta](http://rosettacode.org/wiki/Category:OCaml) is a
 programming chrestomathy site. It provides solutions to the same
 task in many languages. Currently there are few tasks with OCaml
 solutions provided, but perhaps you would like to add new solutions.

###  Tutorials on OCaml

* [The OCaml System](/releases/latest/manual.html) (by
 Inria) is the official user's manual. The first part provides an
 introduction to the core language, objects and classes, and modules.
 Previous versions are [here](http://caml.inria.fr/pub/docs/).
* [OCaml for scientific
 computation](http://www.southampton.ac.uk/~fangohr/software/ocamltutorial/)
 (by Thomas Fischbacher), covers a broad sample of OCaml, from the
 basics to the C API.

###  WikiBooks on OCaml

* [fr.wikibooks.org/wiki/OCaml](http://fr.wikibooks.org/wiki/OCaml)
 (in French):
 Introduction on functional programming using OCaml.
* [fr.wikiversity.org/wiki/Premiers_pas_en_OCaml](http://fr.wikiversity.org/wiki/Premiers_pas_en_OCaml)
 (in French):
 The basics of the OCaml language.

###  Tutorials on Tools

There are also tutorials that can be useful to learn how to use popular
tools and libraries.

* [Camlp5](camlp5.html)
* [A Guide to Extension Points in OCaml](http://whitequark.org/blog/2014/04/16/a-guide-to-extension-points-in-ocaml/)
  (by whitequark), on using PPX, the syntax extensions API that superseded camlp4.

###  Coming From Another Language

These tutorials help learn OCaml from the perspective of being familiar
with another language.

* [OCaml for Haskellers](http://blog.ezyang.com/2010/10/ocaml-for-haskellers/)

###  Advanced Tutorials & Articles

* [Manual](/releases/latest/manual.html)
* [Detecting use cases for GADTs in OCaml](http://mads-hartmann.com/ocaml/2015/01/05/gadt-ocaml.html),
  (by Mads Hartmann), on using generalized algebraic data types in writing interpreters.

### チュートリアルのアーカイブ

これらのチュートリアルは、廃止されたかあるいは、廃止された技術について記述されている。
これらは、まだ誰かの役に立つかもしれないので、念の為ここに保存されている。

* [OCamlでWebプログラミング](ocaml_and_the_web.ja.html)
* Mega Crash course on OCaml ecosystem + code - [en](get_up_and_running.html)
* Streams - [en](streams.html)


