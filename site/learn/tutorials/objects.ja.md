<!-- ((! set title オブジェクト !)) ((! set learn !)) -->

*Table of contents*

オブジェクト
============

オブジェクトとクラス
--------------------

OCamlはオブジェクト指向、命令型、関数型言語だ :-)。
これらのパラダイムを混ぜて、
手元の仕事にもっともふさわしい(あるいは慣れた)
プログラミングパラダイムが使える。 本章では OCaml
でのオブジェクト指向プログラミングに注目するが、
何故オブジェクト指向のプログラムを書きたいか、
あるいは書きたくないかについても話題にする。

オブジェクト指向プログラミングを示すのに、
教科書で用いられる古典的でばかげた例として、 スタッククラスがある。
これはいろんな意味でとてもひどい例だが、 オブジェクト指向 OCaml
を書く基本をこれで紹介する。

整数のスタックを提供する基本コードがこれだ。
このクラスは線形リストで実装してある。

```ocamltop
class stack_of_ints =
  object (self)
    val mutable the_list = ( [] : int list ) (* インスタンス変数 *)
    method push x =                        (* push メソッド *)
      the_list <- x :: the_list
    method pop =                           (* pop メソッド *)
      let result = List.hd the_list in
      the_list <- List.tl the_list;
      result
    method peek =                          (* peek メソッド *)
      List.hd the_list
    method size =                          (* size メソッド *)
      List.length the_list
  end
```

`class name = object (self) ... end` が `name` という
名前のクラスを定義する基本パターンだ。

クラスには `the_list`
という名前の変更可能なインスタンス変数(定数ではない)
がひとつある。これは基礎的な線形リストだ。
ちょっと分かりにくいかもしれないがちょっとしたコードを使って、
この変数を初期化(`stack_of_ints` のオブジェクトが生成されるたびに)する。
この `( [] : int list )` 式は「`int list` 型の空リスト」という意味だ。
単純な空リスト `[]` は `'a list` 型、
つまり任意型のリストであったことを思いだそう。 欲しいのは `int`
のスタックであって他の何者でもないのだから、
ここでは、型推論エンジンに対して一般的な「任意のリスト」ではなく
実際にはもっと狭い「`int` のリスト」ということを伝えている。
`( 式 : 型 )` という文法は、 その`式`がその`型`であることを意味する。
これは一般的な型キャスト*ではない*。というのも、
型推論エンジンを無効にするのではなく、
汎用の型をもっと特定のものに狭めるだけだからだ。 だから例えば
`( 1 : float )` とは書けない。

```ocamltop
(1 : float);;
```

型安全は保存される。じゃあ例に戻ろうか...

このクラスには４つの単純なメソッドがある。 `push`
は整数をスタックにプッシュする(積む)。 `pop`
はスタックの先頭の整数をポップ(取り出し)してそれを返す。 `<-`
(割り当て演算子)は変更可能なインスタンス変数の更新があるときに用いる。
同じく `<-`
割り当て演算子でレコード内の破壊可能フィールドの更新にも用いる。

`peek` はスタックに影響を及ぼさずに先頭(つまりリストの先頭)を返し、
`size` はスタックの要素数(つまりリストの長さ)を返す。

この整数スタックをテストするコードを書いてみよう。
まず新しいオブジェクトを生成しよう。 `new`
演算子というお馴染のものが使える。

```ocamltop
let s = new stack_of_ints
```

ではいくつかの要素をスタックにプッシュしてポップしよう。

```ocamltop
for i = 1 to 10 do
  s#push i
done;;
while s#size > 0 do
  Printf.printf "Popped %d off the stack.\n" s#pop
done;;
```

文法に注意しよう。 `object#method` は `object` の `method`
を呼び出すという意味だ。 これは他の命令型言語でいうところの
`object.method` やら `object->method` と同じことだ。

OCaml のトップレベルだとオブジェクトやメソッドの型が詳細に分かる。

```ocamltop
let s = new stack_of_ints;;
s#push;;
```

`s` は不明確なオブジェクトだ。
実装(つまりリスト)は呼び出し側から隠されている。

### 多相クラス

整数のスタックはこれでいいが、どんな型でも格納できるスタックはどうだろう?
(混合型を格納できる１つのスタックでなく、任意の一つの型のオブジェクトを
格納できる複数のスタックだ)。 `'a list` という感じで `'a stack`
を定義しよう。

```ocamltop
class ['a] stack =
  object (self)
    val mutable list = ( [] : 'a list )  (* instance variable *)
    method push x =                      (* push method *)
      list <- x :: list
    method pop =                         (* pop method *)
      let result = List.hd list in
      list <- List.tl list;
      result
    method peek =                        (* peek method *)
      List.hd list
    method size =                        (* size method *)
      List.length list
  end
```

`class ['a] stack` は実際には一つのクラスを定義しているのではなく、
可能な型について全部の「クラスのクラス」を定義している
(つまり無限に多くのクラスだ!)。 じゃぁ `'a stack` クラスを使ってみよう。
この例ではスタックを生成して浮動小数点数をこのスタックにプッシュする。
スタックの型に注意しよう。

```ocamltop
let s = new stack;;
s#push 1.0;;
s;;
```

このスタックは今 `float stack` になっており、
このスタックでは浮動小数点数しかプッシュ、ポップできないようだ ( `'_a`
記法の説明に付いては [OCaml expert
FAQ](http://mirror.ocamlcore.org/caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html "http://caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html")
を見よ)。 この新しい `float stack` の型安全を実証しよう。

```ocamltop
s#push 3.0;;
s#pop;;
s#pop;;
s#push "a string";;
```

どんな型のスタックも操作できる多相関数を定義できる。
最初にこれを試してみよう。

```ocamltop
let drain_stack s =
  while s#size > 0 do
    ignore (s#pop)
  done
```

`drain_stack` の型に注意だ。 賢いことに、たぶん賢すぎることに、 OCaml
の型推論エンジンは `pop`, `size` メソッドを持つ
*任意の*オブジェクトで動作する `drain_stack` を推論した! だから、もし、
適切な型署名のある `pop`, `size`
メソッドを含んでいる全く別のクラスを定義していたら、
それとは異なる型のオブジェクトで偶然 `drain_stack`
を呼び出してしまうかもしれない。

OCaml にもっと特定させるよう強制でき、 以下のように `drain_stack` が
引数 `s` の型を制約し `'a stack` (訳注 `stack` クラスに属する任意型)
で呼び出すことのみ許容するようにできる。

```ocamltop
let drain_stack (s : 'a stack) =
  while s#size > 0 do
    ignore (s#pop)
  done
```

### 継承、仮想クラス、初期化子

私は Java プログラマが継承を過剰に使う傾向にあることに気づいた。
おそらく Java では継承がコードを拡張する唯一の合理的な方法だからだ。
コードを拡張するより良い、より一般的な方法は、普通はフックを使うことだ
(cf. Apache のモジュール API)。
にもかかわらず、特定の狭い領域では継承は役に立つし、 GUI
ウィジェットライブラリを書くときはもっとも重要だ。

架空の OCaml のウィジェットライブラリを Java の Swing と
同じようなものと考えよう。 ボタンとラベルを次のクラス階層で定義する:

    widget  (superclass for all widgets)
      |
      +----> container  (any widget that can contain other widgets)
      |        |
      |        +----> button
      |
      +-------------> label

(`button` は `container` であることに注意。
なぜならラベルかイメージのいずれかを含むことが出来て、
それはボタンに何が表示されるかに依存するからだ。)

`widget` はウィジェット全てに対する仮想スーパークラスである。
ウィジェットそれぞれに、生存期間中一定した名前(文字列)が欲しい。
最初の試みはこれだ:

```ocamltop
class virtual widget name =
  object (self)
    method get_name =
      name
    method virtual repaint : unit
  end
```

おぉっと! OCaml は `name` の型を推論できずに `'a`
と推定することを忘れていたよ。 しかしこれは多相クラスを定義しており、
クラスを多相として宣言(`class ['a] widget`)しなかった。 `name`
の型を狭める必要がある。このように:

```ocamltop
class virtual widget (name : string) =
  object (self)
    method get_name =
      name
    method virtual repaint : unit
  end
```

このコードには幾つかあたらしいことがある。
まず、このクラスには**初期化子**が含まれている。
ちょうど例えばJavaでのコンストラクタの引数と同じものと考えられる
クラス(`name`)への引数だ。

```java
public class Widget
{
  public Widget (String name)
  {
    ...
  }
}
```

OCaml ではコンストラクタはクラス全体を構築し、
単なる特定の名前つき関数ではないから、
クラスに引数があるかのように引数を書く。

```ocaml
class foo arg1 arg2 ... =
```

二つ目に、このクラスは仮想メソッドを含んでおり、
その結果クラス全体も仮想とマークされている。 仮想メソッドはここでは
`repaint` である。 OCaml にそれが仮想(`method virtual`)
であることを教える必要があり、 *さらに* OCaml
にこのメソッドの型を教える必要がある。
なぜならこのメソッドにはコードが全く含まれず、 OCaml
は自動で型推論をして型をあたえることは出来ないので、
型を教えてやらないといけない。 この場合、メソッドは単に `unit` を返す。
もしクラスに仮想メソッド(単に継承されただけのものでも)を含む場合、
クラス全体を仮想として `class virtual ...` と指定しなければならない。

C++ や Java 同様、仮想クラスは直接 `new` でインスタンス化出来ない:

```ocamltop
let w = new widget "my widget"
```

この `container` クラスはもっと面白くなる。 `widget`
から継承されなければならず、
ウィジェットを含むリストを格納する仕掛けを持たなければならない。
次に単純な `container` の実装を示す;

```ocamltop
class virtual container name =
  object (self)
    inherit widget name
    val mutable widgets = ( [] : widget list )
    method add w =
      widgets <- w :: widgets
    method get_widgets =
      widgets
    method repaint =
      List.iter (fun w -> w#repaint) widgets
  end
```

注意:

1.  `container`
    クラスは仮想とマークされている。仮想メソッドを全く含んでいないが、この場合、誰かが直接コンテナを生成するのを防ぎたいからだ。
2.  `container` クラスは `widget` を構築するときに直接渡す `name`
    引数がある。
3.  `inherit widget name` は `container` が `widget`
    から継承されており、`name` 引数が `widget`
    のコンストラクタに渡されることを意味する。
4.  `container`
    にはウィジェットの変更可能リストと、ウィジェットをリストに加える
    `add` メソッド、ウィジェットのリストを返す `get_widgets`
    メソッドが含まれる。
5.  `get_widget`
    で返されるウィジェットのリストはクラスの外部のコードでは変更できない。理由はちょっと微妙だが、基本的に
    OCaml
    の線形リストは変更不能であるという事実に落ち着く。誰かが書いた次のコードを想像しよう:

    ```ocaml
    let list = container#get_widgets in
    x :: list
    ```

    これで、`x` がウィジェットのリストに追加されることによって、 `container`
クラスのプライベートな内部表現が変更されるだろうか? そうはならない。
プライベート変数である `widgets` は、
これや他のいかなる外部コードによる変更の試みによっても影響されない。
これは例えば、
後日内部表現に配列を使うように変えても外部コードからクラスを変更する必要もないことを意味する。

最後に、ちょっとじゃないけど、 以前の仮想 `repaint` 関数、すなわち
`container#repaint`
でウィジェットに含まれる全てを再描画するよう実装する。 `List.iter`
を用いてリストを全部繰り返すことと、
馴染の薄いであろう匿名関数式も使うことに注意しよう。

```ocamltop
(fun w -> w#repaint)
```

一つの引数 `w` を伴う匿名関数を定義して `w#repaint` (ウィジェット `w` の
`repaint` メソッド) を呼び出している。

この例では `button` クラスは単純である
(むしろ実際には非現実的な程単純だが気にしない):

type button\_state = Released | Pressed;;

```ocamltop
type button_state = Released | Pressed;;
  
class button ?callback name =
  object (self)
    inherit container name as super
    val mutable state = Released
    method press =
      state <- Pressed;
      match callback with
      | None -> ()
      | Some f -> f ()
    method release =
      state <- Released
    method repaint =
      super#repaint;
      print_endline ("Button being repainted, state is " ^
                     (match state with
                      | Pressed -> "Pressed"
                      | Released -> "Released"))
  end
```

注意:

1.  この関数はオプション引数(前の章を参照)があり、オプションのコールバック関数を渡している。コールバックはボタンが押されたときに呼ばれる。
2.  `inherit container name as super` 式の意味は、スーパークラスに
    `super` と命名している。ここで `repaint` メソッドを `super#repaint`
    と用いている。これはスーパークラスのメソッド呼び出しを明示している。
3.  ボタンの押下 (このかなり安直なコードでの `button#press` の呼び出し)
    によってボタンの状態が `Pressed`
    に設定され、もし定義されていればコールバック関数が呼び出される。`callback`
    変数は `None` か `Some f` のいずれか、言い替えると
    `(unit -> unit) option`
    型であることに注意。これについて自信がなければ前の章を読み直そう。
4.  コールバック変数について奇妙なことに注意。これはクラスへの引数として定義されているが、どのメソッドからも見えるし使うことが出来る。言い替えれば、この変数はオブジェクトが生成されたときに供給されるが、オブジェクトの生存期間中ずっと生きつづける。
5.  `repaint`
    メソッドが実装された。これはスーパークラス(コンテナの再描画)を呼び出してからボタンを再描画し、ボタンの現在の状態を表示する。

`label` を定義する前に、 OCaml トップレベル環境で `button`
クラスで遊んでみよう。

```ocamltop
let b = new button ~callback:(fun () -> print_endline "Ouch!") "button";;
b#repaint;;
b#press;;
b#repaint;;
b#release;;
```

ここに比較的平凡な `label` のクラスがある:

```ocamltop
class label name text =
  object (self)
    inherit widget name
    method repaint =
      print_endline ("Label: " ^ text)
  end;;
```

「Press me!」というラベルを作ってボタンに加えよう。

```ocamltop
let l = new label "label" "Press me!";;
b#add l;;
b#repaint;;
```

### `self` に関する註

上の例は全て汎用パターンを使ってクラスを定義した。

```ocaml
class name =
  object (self)
    (* ... *)
  end
```

`self` への参照について説明していない。
実際にはこれはオブジェクトに命名し、 同一クラス内のメソッド呼び出しや
オブジェクトからクラスの外の関数への受渡しを許可する。 言い替えれば
C++/Java の `this` や Perl の `$self` と全く同じである。
もし自分自身を参照する必要がいないのであれば、 `(self)`
部分を完全に省略できる -- 実際上の例は全て省略可能であろう。
だが私はこれを書いておくようアドバイスする。 いつクラスを変更して `self`
を参照する必要が出るかは分からないのだから。
書いておくペナルティはまったくない。

### 継承と型変換

```ocamltop
let b = new button "button";;
let l = new label "label" "Press me!";;
[b; l];;
```

ボタン `b` とラベル `l` を作り、
両方を含むリストを作ろうとした、がエラーになった。 `b` も `l` も
`widget` なのだが、 何故同じリストに入れられなかったのだろう?
たぶん、OCaml は `widget list` が欲しいことを推論してくれないのだろう。
では教えてみよう:

```ocamltop
let wl = ([] : widget list);;
let wl = b :: wl;;
```

OCaml
はデフォルトではサブクラスをスーパークラスの型に変換しないことがわかる。
かわりに `:>` (型変換) 演算子を使うと教えてやることができる。

```ocamltop
let wl = (b :> widget) :: wl;;
let wl = (l :> widget) :: wl;;
```

式 `(b :> widget)` は 「ボタン `b` は `widget`
型を持つように変換せよ」という意味だ。
コンパイル時にこの型変換が成功するかが完全に判断可能なので、
型安全は保存される。

実際、型変換は上で記述したよりは幾分微妙だから、
詳細を全部を探すにはマニュアルを読むように。

上で定義される `container#add` メソッドは実際誤っており、 `container`
に別の型のウィジェットを加えようとしても失敗する。
型変換によって修正される。

スーパークラス(例えば`widget`) からサブクラス(例えば`button`)への
型変換は可能だろうか? 答えは、たぶん驚くことに NO だ!
この向きの型変換は*安全ではない*。 `widget` を `button`
じゃなくて実際には `label` に型変換しようとしてしまうかもしれない。

スーパークラスからサブクラスへの型変換の問題は、Javaプログラマには馴染だ。
Java のコンテナ型は `Object` を含んでおり、
オブジェクトをコンテナから抽出するときには元の型でキャストしないといけない。
これは `ClassCastException` を実行時に引き起こし得る。 OCaml
の強い型システムは実行時の型エラーを除去する明確なゴールがあるので、
この種の型変換は許容されない。

多相と関数プログラミングによってスーパークラスから
サブクラスへの型変換の必要性をほとんどなくしている。 Java
のコンテナクラスで `Object` を格納するのは、 Java が (コーディング時に)
ジェネリック (C++ の「テンプレート」や OCaml の多相) がないからである。
これは Java 言語の欠点 -- 実際とても基本的な欠点 --- であり、
うまくいけば Java 1.5 で修正されるだろう。 OCaml では `'a list` や
`'a stack` のような多相型の定義がとても簡単なので、 Java
のようなプログラミングは全然要求されない。
こう言ったように、もしあなたがOCaml で大規模な OOP をするなら、
この変換型が実際にとても役立つケースを思いつくことを確信している。
たぶんこの理由から、本当にこれを理解したらまずはじめに関数型で
実装解決しようとして、また OO スタイルは限られた問題領域だけにする
といっていいだろう。

[山形頼之氏が型安全なダウンキャストが可能であると書いている。
上級ユーザは見よ:
[http://caml.inria.fr/pub/ml-archives/caml-list/2002/05/a6520926c4eac029206a31d6aa22f967.fr.html](http://caml.inria.fr/pub/ml-archives/caml-list/2002/05/a6520926c4eac029206a31d6aa22f967.fr.html)
。ここから [hweak](http://remi.vanicat.free.fr/ocaml/hweak/) ライブラリが出来た]

### `Oo` モジュールとオブジェクトの比較

`Oo` モジュールには OOP のための役に立つ関数がある。 `Oo.copy`
でオブジェクトの浅いコピーを作る。 `Oo.id object`
はオブジェクトそれぞれに固有のID値を返す (固有値はクラス全体で)。

`=` と `<>` はオブジェクトの*物理的な*等価比較に使う
(オブジェクトとそのコピーは物理的には同一ではない)。 `<`
などもオブジェクトの固有IDに基づいたオブジェクトの順列決定に使える。

クラスを使わないオブジェクト
----------------------------

ここではほとんどレコードのような、必ずしもクラスを使わない
オブジェクトの使いかたを調べる。

### 直接オブジェクトとオブジェクトの型

オブジェクトはレコードのかわりに使え、
いくつかのケースでレコードよりも選択したくなるような良い特性がある。
オブジェクトを生成する正規の方法が、
まずクラスを定義してからそのクラスを用いて個別のオブジェクトを生成する
ことであると見てきた。 これは場合によっては扱いづらことがある。
クラス定義は型定義よりも多く、また型による再帰定義が出来ないからだ。
だが、オブジェクトは型を持っており、
つまりレコード型にとても類似しており、型定義として使うことができる。
さらにオブジェクトはクラス無しで生成できる。
これは*直接オブジェクト*と呼ばれる。 次に直接オブジェクトの定義を示す:

```ocamltop
let o =
  object
    val mutable n = 0
    method incr = n <- n + 1
    method get = n
  end
```

このオブジェクトには、パブリックメソッドだけが定義された型がある。
値およびプライベートメソッドは不可視である。
レコードとは異なり、このような型は事前に明示的に定義される必要はないが、
そうすることでより明確になる。 次のようにできる:

```ocamltop
type counter = < get : int;  incr : unit >
```

等価なレコード型の定義と比較せよ:

```ocamltop
type counter_r = { get : unit -> int;
                   incr : unit -> unit }
```

このオブジェクトと同様に動作するレコードの実装は以下の通りだろう:

```ocamltop
let r =
  let n = ref 0 in
  { get = (fun () -> !n);
    incr = (fun () -> incr n) }
```

関数型の点においてはオブジェクトもレコードも似ているが、
これらの方法にはそれぞれ利点がある:

-   **スピード**: レコードのフィールドアクセスが若干速い
-   **フィールド名**:
    異なる型のレコード操作はフィールドが同一の名前だと不便であるが、オブジェクトにはそのような問題はない。
-   **サブタイプ**:フィールドがより少ない型へのレコードの型強制は不可能であるが、オブジェクトでは可能だ。なので、メソッドを幾つか共有する異なる種類のオブジェクトにおいて、共通のメソッドだけが可視であるようデータ構造を混在できる。(次の節を見よ)
-   **型定義**:
    あらかじめオブジェクト型を定義する必要はないので、モジュール間の依存性を軽くできる。

### クラス型 vs. 単なる型

*クラス型*と*オブジェクトの型*の混同に注意せよ。
*クラス型*はデータ*型*ではなく、 *型*として通常参照される OCaml
用語である。 オブジェクトの*型*はデータ\</em\>型の一種であり、
レコード型やタプルと同じようなものである。

クラスが定義されると、*クラス型*とオブジェクトの*型*の両方が
同じ名前で定義される。

```ocamltop
class t =
  object
    val x = 0
    method get = x
  end
```

この例では、`t` はこのクラスが生成するオブジェクトの型でもある。
異なるクラスから派生した、あるいはクラスでないオブジェクトでも
同じ型である限りいっしょに混ぜることができる。

```ocamltop
let x = object method get = 123 end;;
let l = [ new t; x ];;
```

共通のサブタイプを共有する混在オブジェクトもできるが、 `:>`
演算子で型変換を明示する必要がある。

```ocamltop
let x = object method get = 123 end;;
let y = object method get = 80 method special = "hello" end;;
let l = [ x; y ];;
let l = [ x; (y :> t) ];;
```

もっとオブジェクト
------------------

OCaml のマニュアルの3章には、
正規のオブジェクトやクラスの参照について書いてある。
ここでカバーしなかったがマニュアルでカバーされる内容として:

-   プライベートメソッド
-   複雑なコンストラクタ
-   インタフェース
-   多重継承
-   多相メソッド
-   型変換についての詳細
-   関数オブジェクト
-   オブジェクトの複製についての詳細
-   相互再帰なクラス
-   バイナリメソッド
-   フレンド
