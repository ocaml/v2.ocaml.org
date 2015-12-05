<!-- ((! set title OMake でのコンパイル !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

OMake でのコンパイル
====================

ここでは OCaml プログラムを
[OMake](http://omake.metaprl.org/)
でコンパイルする方法を要約した。 OMake
は、findlib(ocamlfind)で管理される標準ライブラリと同じく、 camlp4
構文ライブラリを使っているOCamlファイルや、 ocamllex, ocamlyacc
を用いて, ネィティブコードの実行ファイル、 ocamlopt
がなければバイトコード実行ファイルを生成することができる。

1.  `omake --install` を実行する:これでカレントディレクトリに
    `OMakefile` の雛型と `OMakeroot` が作られる。`OMakeroot`
    はそのままにしておく。雛型の `OMakefile` は `ocamlfind`
    を使うオプションが書いてないので、基本的には書き直して、追加オプションをファイル中に明示する必要がある。
2.  ここではソースファイルが `parser.mly`, `lexer.mll`, `main.ml`
    だとする。自動生成された `OMakefile`
    からコメントを削除したりコメントアウトしたりする。こんな感じだ:

```
# プログラム名 (拡張子無し)
PROGRAM = myprog

# ソースファイルを拡張し抜きで1行に一つずつ書く。
# 後ろにスペースを付けないこと。
FILES[] =
   parser
   lexer
   main
# 別の書き方もある:
# FILES = parser lexer \
#         main

# ocamlfind を使う場合
USE_OCAMLFIND = true
# ocamlfind で探して使うパッケージ
OCAMLPACKS[] =
   unix
   micmatch_pcre
   labltk
# camlp4 プリプロセッサを使うことを omake に伝える
OCAMLFINDFLAGS = -syntax camlp4o

# ocamldep を走らせる前にファイル生成しておく必要があることを OMake に伝える
# (OMake は ocamllex と ocamlyacc を使うことは知っている)
OCamlGeneratedFiles(lexer.ml parser.mli parser.ml)

# 実行ファイルの生成
OCamlProgram($(PROGRAM), $(FILES))

# デフォルト動作: バイトコードかネイティブコードのどちらか又は両方の生成
.DEFAULT: $(if $(BYTE_ENABLED), $(PROGRAM).run) \
          $(if $(NATIVE_ENABLED), $(PROGRAM).opt)

# 掃除
.PHONY: clean
clean:
  rm -f \
     $(filter-proper-targets $(glob $(addsuffix .*, $(FILES)))) \
     $(PROGRAM).run $(PROGRAM).opt
```

ソースファイル名や実行ファイル名、ライブラリやオプションなど
必要に応じて `OMakefile` を書き換えること。 では `omake` を走らせよう。
コンパイルされて実行ファイル、
`myprog.run`(バイトコード)か`myprog.opt`(ネイティブコード)
、もしくは命名した通りのものができるだろう。 `omake clean`
コマンドで、コンパイルの際に生成したファイルが削除される。

詳しい情報は
[OMakeの公式サイト](http://omake.metaprl.org/)(英語)にある。
