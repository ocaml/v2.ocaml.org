<!-- ((! set title ガベージコレクション !)) ((! set learn !)) -->

*Table of contents*

ガベージコレクション
==================

ガベージコレクション、参照カウント、明示的確保
------------------------------------------

現代的言語がすべてそうであるように、 OCaml
にはガベージコレクタ(GC)があるので、 C/C++
のようにメモリの確保と開放を明示する必要はない。

JWZ が ["Java
sucks"](http://www.jwz.org/doc/java.html "http://www.jwz.org/doc/java.html")
で吐き捨てているのだが:

> 最初に、良い点: Javaには、`free()` がない。
> これだけはきちんと認めなければならない、だが他は全部あぶく銭だ。
> この一点があるおかげで、他の全てがどんなにひどくても
> 許してしまえるのです。
> この一点さえあれば、このドキュメントの他の全てのことは
> 色褪せてしまう。**だが...**

OCaml のガベージコレクタは、現代的なハイブリッドの
世代別/インクリメンタル コレクタであり、
大抵の場合、手作業のアロケートよりも優れている。 Java GC (GC
に悪名をあたえてしまった)とは違い、 OCaml GC
は実行開始時に巨大なメモリを確保しないし、
手で書き換えないといけないような勝手な固定限界があったりもしない。

ガベージコレクションはなぜCのような明示的メモリ確保より速いのか?
しばしば、`free` の呼び出しコストはないものと思われている。 実際には `free`
は、
メモリアロケータが複雑なデータ構造を操るのを含んだ高価な操作である。
断続的に `free` を呼び出すプログラムだと、 メモリ領域を `free`
するたびにコードとデータが追い出されてしまうので、
コードとデータ全部をキャッシュに載せ直す必要がある。
(プールアロケータまたはGCのような)複数のメモり領域を解放する
回収戦略においては、複数のメモリ確保で1度だけペナルティを払う
(確保あたりのコストはとても少なくなっている)。

GC はまた、周辺メモリ領域を動かしヒープをコンパクトにする。
これによってメモリ確保が簡単になり、従ってより高速になり、 L1, L2
キャッシュに乗っかりやすい賢い GC が書ける。

もちろん、手で超高速なメモリアロケータを書くことを拒絶するつもりは
まったくないが、
それはほとんどのプログラマが考えるより相当困難な仕事であろう。

OCaml のガベージコレクタは二つのヒープ、
**マイナーヒープ**と**メジャーヒープ**が ある。
これは一般原則を認識している:
ほとんどのオブジェクトは、小さく、頻繁に確保され、かつ即座に解放される。
これらのオブジェクトはまずマイナーヒープに入り、
頻繁にガベージコレクトされる。
ほんのわずかのオブジェクトだけ長く生き残る。
これらのオブジェクトはしばらくしたらマイナーヒープからメジャーヒープに
昇格し、メジャーヒープはまれにしかコレクトされない。

OCaml GC は同期的である。別々のスレッドでは走らず、
アロケート要求のときにのみ呼び出されることがある。

### GC vs. 参照カウント

Perlにはガベージコレクションがあるが、
それは**参照カウント**と呼ばれる単純な方式である。 簡単に言えば、Perl
におけるオブジェクトはそれぞれ、
自身を指す(参照する)他のオブジェクトの数を数えて覚えている。
カウントが0になればそのオブジェクトを指すものが何もないので、
オブジェクトは解放される。

参照カウントは、コンピュータ科学者にとっては本気の
ガベージコレクトとは考えられていない。だがこれには
完全なガベージコレクタより実用的には大きな利点がある。
参照カウントを用いると、 コード中の `close` / `closedir`
の明示的な呼び出しをなくすことができる。例えば:

```perl
foreach (@files)
{
  my $io = new IO::File "< $_" or die;
  # read from $io
}
```

このPerlコードでは `@files` というリスト内のそれぞれの要素を open
して読み出すことを一通り繰り返す。 ループの最後でファイルハンドル `$io`
を close する必要はない。 なぜなら Perl は参照カウントを使っており、
ループ終端に到達すると変数 `$io` はスコープから外れ、
このファイルオブジェクトの参照カウントが0になる。
そうすれば即座に解放(つまり close)される。

等価な OCaml コードを考えてみよう:

```ocaml
let read_file filename =
  let chan = open_in filename in
  (* read from chan *) in
List.iter read_file files
```

`read_file` の呼び出しではファイルを open するが close しない。 なぜなら
OCaml は完全なガベージコレクタを採用しており、 `chan`
はしばらく後、マイナーヒープがいっぱいになるまで回収されない。
さらに、**OCaml ではファイルハンドルのメモリを回収するときに
チャネルを閉じない**。
したがってこのプログラムは最終的にファイルデスクリプタを使い果たすだろう。

ファイルやディレクトリその他の複雑なファイナライズを伴う重いオブジェクト
を使う OCaml コードを書くときにはこのことを意識する必要がある。

完全なガベージコレクトに公平になるように、
参照カウント方式の不利な点を言及する:

-   オブジェクトそれぞれに参照カウントを格納する必要がある。言い替えれば、オブジェクトにオーバーヘッドがあるということだ。プログラムはメモリを余計に使うので、キャッシュやスワップ溢れがおきたりして、その結果、遅くなる。
-   参照カウントは高価である -
    ポインタを操作するときは常にオブジェクトの参照カウントをチェックして更新する必要がある。ポインタ操作は頻繁なので、プログラム低速化とコンパイルされたコードの肥大化の原因となる。
-   いわゆる循環参照、自己参照構造を回収できない。いろんな言語でずいぶん長いことプログラミングしてきたが、これらを作ったことを思い出せない。
-   グラフアルゴリズムはもちろん前項の仮定から外れる。Perlで
    TSP(巡回セールスマン問題) を実装しないこと！

Gcモジュール
------------

`Gc`モジュールには
OCamlプログラムからガベージコレクタへ問い合わせたり呼び出したりするための
有用な関数がある。

以下は、プログラムを走らせて走行終了直前の GC の統計を表示する
プログラムである:

```ocaml
let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x)
  
let () =
  Random.self_init ();
  Graphics.open_graph " 640x480";
  for x = 0 to 640 do
    let r = 4.0 *. (float_of_int x) /. 640.0 in
    for i = 0 to 39 do
      let x_init = Random.float 1.0 in
      let x_final = iterate r x_init 500 in
      let y = int_of_float (x_final *. 480.) in
      Graphics.plot x y
    done
  done;
  Gc.print_stat stdout
```

これが出力結果:

    minor_words: 115926165          # 確保されたワード数合計
    promoted_words: 31217           # マイナーからメジャーへの昇格
    major_words: 31902              # 直接メジャーに確保された大きなオブジェクト
    minor_collections: 3538         # マイナーヒープの回収回数
    major_collections: 39           # メジャーヒープの回収回数
    heap_words: 63488               # ヒープの大きさ(ワード単位) = およそ 256K
    heap_chunks: 1
    top_heap_words: 63488
    live_words: 2694
    live_blocks: 733
    free_words: 60794
    free_blocks: 4
    largest_free: 31586
    fragments: 0
    compactions: 0

この結果から、マイナーヒープの回収はおよそメジャーヒープの回収の100倍の頻度で
あることが分かる (この例は必ずしも一般的ではない)。
プログラムの実行期間全体で驚くことに440MBものメモリが確保されている。とはいえ、
もちろんその大部分はすぐにマイナーコレクトで即座に解放されただろうが。
約128KBだけがメジャーヒープの長期貯蔵庫に昇格して、
また大きなオブジェクトと思われる別の128KBは直接メジャーヒープに確保された。

イベントのうちのどれかが発生するときに(例えばメジャーコレクトごと)、
デバッグメッセージを表示させるよう GC に指示できる。
以下のコードを上の例の最初の方にに付け加える:

```ocaml
Gc.set { (Gc.get ()) with Gc.verbose = 0x01 }
```

(これまで `{ 式 with フィールド = 値 }`
形式を扱っていないが、何をしているのかはほぼ自明であろう)。
上のコードでは、GCはメジャーコレクトが始まるたびに
とにかくメッセージを表示するようになる。

ファイナライズと Weak モジュール
------------------------------

オブジェクトが GC によって解放されようとしているときに呼び出される
**ファイナライザ**という関数を書くことができる。

`Weak`モジュールを使うと、いわゆる「弱いポインタ」を作成できる。
この**弱いポインタ**を「普通のポインタ」と比較して
定義するのがもっとも良いだろう。 通常の OCaml
のオブジェクトを扱うときは、 オブジェクトは名前でもって参照する (例:
`let name = ... in`)　か、 他のオブジェクトを経由して参照する。
ガベージコレクタはオブジェクトに参照があることがわかれば回収しない。
これが「普通のポインタ」と呼べるものだ。

しかし、もしオブジェクトに弱いポインタあるいは弱参照があるときには、
ガベージコレクタに対して、いつでも回収してよいというヒントを
あたえることになる (オブジェクトを回収*する*のは必須ではない)。
しばらく後、そのオブジェクトを調べるときに、
弱いポインタを普通のポインタに変更することができ、 そうでなければ GC
から実際にオブジェクトを回収したと通知されるだろう。

ファイナライズと弱いポインタは、
メモリ内オブジェクトのデータベースキャッシュを実装するのに使うことができる。
ディスク上のファイル内に大量のユーザーレコードがある状態を想像しよう。
これは一度にメモリにロードするには余りにもデータ量が多すぎ、また、
ディスク上のデータは他のプログラムがアクセスするかもしれないので、
メモリ上にレコードのコピーを持つときには、それらレコードを個々に
ロックする必要がある。

この「メモリ内オブジェクトのデータベースキャッシュ」の
*公開*インタフェースは、ちょうど2つの関数になる:

```ocaml
type record = { mutable name : string; mutable address : string }
val get_record : int -> record
val sync_records : unit -> unit
```

`get_record` 呼び出しが唯一ほとんどのプログラムで必要なものであり、
キャッシュの外部またはディスクからの n番目のレコードの取得と返却を行う。
するとプログラムは `record.name`、 `record.address`
フィールドを読んだり更新したりできる。
そしてプログラムはその後文字通りこのレコードについて忘れてしまう!
この事象の裏で、どこかのタイミングで
ディスクにレコードを書き戻すファイナライズが行われる。

`sync_record` 関数もまたユーザープログラムから呼び出される。
この関数はレコード全部について、ディスク上とメモリのコピーとを同期化する。

OCaml は現在、終了時にファイナライザを走行しないが、
コードに以下の命令を追加するだけで簡単にこれを強制できる。
以下の命令では完全なメジャーGC を終了時に発生させる。

```ocaml
at_exit Gc.full_major
```

またこのコードでは、 `Weak`
モジュールを使って最近アクセスしたレコードのキャッシュを実装する。
手コードに比べて `Weak` モジュールを使う利点は二つ:
一つ目は、ガベージコレクタがプログラム全体のメモリ要求を観測しており、
キャッシュの縮小を判断するのにより良い位置にいる。
二つ目は、コードがより単純になる。

我々の例ではユーザーレコードファイルはとても単純なフォーマットである。
ファイルはユーザーレコードのリストそのものであり、
ユーザーレコードはそれぞれ256バイトの固定長であって、
二つのフィールドがあり(必要に応じてスペースでパディングされる)、
名前フィールド(64バイト)と住所フィールド(192バイト)からなる。
レコードがメモリに読み込まれる前に、
プログラムはレコードの排他ロックを取得しなければならない。
メモリ内コピーがファイルに書き戻された後、プログラムは
そのロックを解放しなければならない。
以下に、ディスク上フォーマット定義、
レコードの読み書き、ロック、アンロックの低レベル関数のコードを示す:

```ocaml
type record = { mutable name : string; mutable address : string }
  
(* On-disk format. *)
let record_size = 256
let name_size = 64
let addr_size = 192
  
(* Low-level load/save records to file. *)
let seek_record n fd =
  ignore(Unix.lseek fd (n * record_size) Unix.SEEK_SET)
  
let write_record record n fd =
  seek_record n fd;
  ignore(Unix.write fd record.name 0 name_size);
  ignore(Unix.write fd record.address 0 addr_size)
  
let read_record record n fd =
  seek_record n fd;
  ignore(Unix.read fd record.name 0 name_size);
  ignore(Unix.read fd record.address 0 addr_size)
  
(* Lock/unlock the nth record in a file. *)
let lock_record n fd =
  seek_record n fd;
  Unix.lockf fd Unix.F_LOCK record_size
  
let unlock_record n fd =
  seek_record n fd;
  Unix.lockf fd Unix.F_ULOCK record_size
```

また、空のメモリ内 `record` オブジェクトの新規作成関数が必要だ。

```ocaml
(* Create a new, empty record. *)
let new_record () =
  { name = String.make name_size ' ';
    address = String.make addr_size ' ' }
```

これは本当に単純なプログラムだから、レコードの数を固定してしまう。

```ocaml
(* Total number of records. *)
let nr_records = 10000
  
(* On-disk file. *)
let diskfile =
  Unix.openfile "users.bin" [ Unix.O_RDWR; Unix.O_CREAT ] 0o666
```

[users.bin.gz](/img/users.bin.gz)
をダウンロードして、プログラムを走らせる前に 復元しよう。

レコードのキャッシュはとても単純だ:

```ocaml
(* Cache of records. *)
let cache = Weak.create nr_records
```

`get_record` 関数はとても短く、基本的に二つの部分から構成される。
キャッシュからレコードを掴んでくる。 もしキャッシュが `None`
を返してきたら、これは レコードがキャッシュにまだ存在しないか、既に
キャッシュから落ちてディスクに書き戻されている(ファイナライズ)か
を意味している。 キャッシュが `Some record` を返した場合は、 そのまま
`record` を返す
(ここでレコードへの弱いポインタは普通のポインタに昇格する)。

```ocaml
open Printf
  
(* The finaliser function. *)
let finaliser n record =
  printf "*** objcache: finalising record %d\n%!" n;
  write_record record n diskfile;
  unlock_record n diskfile
  
(* Get a record from the cache or off disk. *)
let get_record n =
  match Weak.get cache n with
  | Some record ->
      printf "*** objcache: fetching record %d from memory cache\n%!" n;
      record
  | None ->
      printf "*** objcache: loading record %d from disk\n%!" n;
      let record = new_record () in
      Gc.finalise (finaliser n) record;
      lock_record n diskfile;
      read_record record n diskfile;
      Weak.set cache n (Some record);
      record
```

`sync_records` 関数はもっと簡単だ。 まず、弱いポインタを全部 `None`
に置き換えることでキャッシュを空にする。
つまりこれでガベージコレクタがそこのレコードを全部回収してファイナライズ
出来るようになったということだ。 だが、これは GC
がすぐにレコードを回収*する*というわけではないので
(事実そうなることはあまりない)、 GC
に対してすぐにレコードを回収させるために、 メジャーサイクルも呼び出す:

```ocaml
(* Synchronise all records. *)
let sync_records () =
  Weak.fill cache 0 nr_records None;
  Gc.full_major ()
```

これでようやくテストコードが出来た。 テストコードを再度は示さないが、
完全なプログラムとテストコード
[objcache.ml](http://mirror.ocamlcore.org/ocaml-tutorial.org/_file/objcache.ml)
をダウンロードして 次のようにコンパイルできる:

```shell
ocamlc unix.cma objcache.ml -o objcache
```

練習問題
--------

ここに上記例を拡張する方法がある。 およそ並んでいる順に難しくなる。

1.  レコードを**オブジェクト**として実装し、透過的に文字列を詰めたり取り出したりできるようにせよ。名前と住所のフィールドを取得、設定するメソッド(全部で4つの公開メソッド)が必要になるはずだ。出来る限りクラス内にコードの実装(ファイルアクセスやロック獲得)を隠蔽せよ。
2.  レコードを取得するのに **read lock(読み込みロック)**
    を必要とするよう。ただしユーザーがフィールドを更新する前にこれを更新する
    **write lock(書き込みロック)**
    でこれを更新するように、プログラムを拡張せよ。
3.  **レコードの数を可変に**出来るよう対応し、(ファイルに)新しいレコードを作成する関数を加えよ。[ヒント:
    OCaml は弱いハッシュテーブルをサポートしている]
4.  **可変長レコード**に対応せよ。
5.  **DBM形式ハッシュ**のファイル形式で動作するようにせよ。
6.  **リレーショナルデータベース**(ロックのある)を一つ選択して、「ユーザ」テーブルの汎用キャッシュを提供せよ。
