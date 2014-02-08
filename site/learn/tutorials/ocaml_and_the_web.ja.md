<!-- ((! set title OCamlでWebプログラミング !)) ((! set learn !)) -->

*Table of contents*

OCamlと Web プログラミング
=========================

他の言語同様、OCaml でも CGI プログラムを書ける。 OCaml で CGI
スクリプトを書くことは、 他のプログラムで OCaml
を使うのと同じ利点がある。 欠点は、OCaml 向けの CGI
ライブラリがほとんどない事実だ。 個人的には [OCamlNet
library](http://projects.camlcity.org/projects/ocamlnet.html)
の中のものが突出していると思う。

もっと書く...

スクリプト言語としてのOCaml
-------------------------

Apache で OCaml スクリプトを設定するのは別に難しくもない。
トップレベル対話環境をヘルパプログラムとして設定でき、
したがって即席のスクリプトインタプリタとして使える。

正確な詳細はここに書く予定 ...

PHPのような感じでもっと強力な本物のスクリプト言語であるOCaml関数を使えるように、
Camlp4 でプリプロセッサを書いて本物のスクリプトエンジン
(カスタムトップレベル経由)を構築するのは難しくない。
コードは特別なタグ("`<?caml`" と "`?>`" のような) で囲わねばならないが、
これらのタグの中を除いては変更なくそのまま表示する。誰か作る人は？ :)

答え:既にあって、
[Camlmix](http://martin.jambon.free.fr/camlmix/ "http://martin.jambon.free.fr/camlmix/")
と呼ばれてる :-)
最新版(1.3)ではそのまま(モジュールの評価時にテキストが表示される)
もしくは他のモジュールから呼び出せる `render`
関数に組み込むようプログラムをコンパイルできる。

CGI プログラミング
-----------------

もっと恒久的な「濃いweb」コンテンツや、
速度重視で実行される必要のある動作(つまり複雑な計算処理)では、
スクリプトでは解になっていないだろう。
スクリプトをバイナリ形式(特にネイティブコード)にコンパイルすれば、
スピードが特に加速されるだろう。

[Ocamlscript](http://mirror.ocamlcore.org/caml.inria.fr/cgi-bin/hump.en75dc.html?contrib=463 "http://caml.inria.fr/cgi-bin/hump.en.cgi?contrib=463")
は透過的にコンパイルされる1ファイルスクリプトを書ける
(必要に応じてネイティブコードコンパイラも使える)。
つまりいいとこ取りが本当にできてしまうのだ。

[Ocamlscript version
2](http://ocaml.pbwiki.com/Ocamlscript "http://ocaml.pbwiki.com/Ocamlscript")は
[ocamlfind
(Findlib)](http://www.ocaml-programming.de/packages/ "http://www.ocaml-programming.de/packages/")
によるパッケージインストールに完全対応しているので、
好みのライブラリをいっぱい、スクリプトから、いとも簡単にロードできる。

Webサーバとフレームワーク
-----------------------

[PPS Computer Science
Laboratory](http://www.pps.jussieu.fr/ "Jussieu")
は[Ocsigen](http://www.ocsigen.org/)
を作っている。 これは Ocaml で書かれた OCaml のための web
サーバでありフレームワークだ。 GET
引数も許容されたパターンマッチングや他の巧みな特長により、 関数が URL
に登録される方式である。
