<!-- ((! set title OCaml 프로그램의 구조 !)) ((! set learn !)) -->

*목차*

# OCaml 프로그램의 구조

이제 OCaml 프로그램을 자세히 살펴보기로 합니다. 전역 / 지역 변수, 언제 `;;` 혹은 `;` 를 사용하는지, 모듈, 중첩 함수, 참조에 대해서 가르칠 것입니다.
이를 위해 이전에 OCaml 개념을 보지 못했기 때문에 아직은 이해할 수 없는 여러가지 OCaml의 개념들에 대해서 살펴볼 것입니다. 그 순간의 세부 내용에 대해서는 걱정하지 마십시오. 대신 프로그램의 전반적인 형태와 지적하는 기능에 대해서 집중하세요.

##  지역 "변수(variables)" (*really* local expressions)
C 언어에서 `average` 함수를 정의하고, 지역 변수를 추가해 보겠습니다.
(앞서 전의한 첫 번째 정의와 비교하십시오.)

```C
double average (double a, double b)
{
  double sum = a + b;
  return sum / 2;
}
```
이제 동일한 OCaml 버전을 보겠습니다.

```ocamltop
let average a b =
  let sum = a +. b in
  sum /. 2.0;;
```
`let name = expression in` 구문은 표현식에 이름을 정의하기 위해서 사용되고, `name`은 그 함수에서 나중에 `expression` 대신 사용할 수 있습니다.
그리고 `;;`을 사용하여 코드 블록을 종료합니다. `in` 다음에 들여쓰기 하지 않은 것을 주목하세요. `let ... in`은 원래 그런 문법이 있는 것으로 단순히 생각하세요.

이제 C 지역 변수와 명명된 표현식을 비교하는 것은 일종의 트릭입니다. 사실 이 두 가지는 다소 다릅니다.
C 변수 `sum`은 스택에 할당된 슬롯을 가지고 있습니다. 만약 여러분이 원한다면 함수 안에서 나중에 `sum`을 할당하거나, `sum`의 주소를 가져올 수도 있습니다. 그러나 OCaml 버전에서는 절대로 적용되지 않습니다. OCaml 버전에서, `sum`은 그냥 표현식 `a + b`의 축약어입니다. `sum`을 다시 할당하거나 변경할 방법은 없습니다. (잠시 후에 값을 어떻게 변경하는지 보게 될 것입니다.)

이것읆 명확하게 하는 또 다른 예가 있습니다. 다음의 2개의 코드 조각은 같은 값((a+b) + (a+b)²)을 반환합니다. 

```ocamltop
let f a b =
  (a +. b) +. (a +. b) ** 2.
  ;;

let f a b =
  let x = a +. b in
  x +. x ** 2.
  ;;
```

두 번째 버전은 더 빠를 수도 있습니다. (그러나 대부분의 컴파일러는 "공통 하위표현식 제거" 단계를 수행하도록 되어 있습니다), 그리고 더 읽기 쉽습니다. 두 번째 예제에서 `x`는 `a +. b`의 축약입니다.

##  전역 "변수(variables)" (*really* global expressions)

최상위 수준에 있는 것들에 대한 전역 이름을 정의할 수 있으며, 위의 지역 "변수"와 마찬가지로 이것은 전혀 변하지 않습니다. 이것은 단순히 약식 이름입니다. 다음은 실제 예제의 일부입니다. (생략되어 있습니다.)

```ocaml
let html =
  let content = read_whole_file file in
  GHtml.html_from_string content
  ;;

let menu_bold () =
  match bold_button#active with
  | true -> html#set_font_style ~enable:[`BOLD] ()
  | false -> html#set_font_style ~disable:[`BOLD] ()
  ;;

let main () =
  (* code omitted *)
  factory#add_item "Cut" ~key:_X ~callback: html#cut
  ;;
```

이 코드에서, `html`은 HTML 편집 위젯(lablgtk 라이브러리의 객체)으로, 첫번째 `let html =` 구문에서 프로그램 시작시 한번 생성됩니다. 이것은 뒤에 정의된 함수 안에서 여러번 참조됩니다.

`html` 이름은 C 또는 다른 명령형 언어에서와 같이 실제 전역 변수와 비교해서는 안됩니다. `html` 포인터를 저장하기 위해 할당된 공간은 없습니다. 예를 들어 `html`을 다른 위젯을 가르키도록 다시 지정하는 방법은 없습니다. 다음 절에서 진짜 변수인 참조(references)에 대해서 설명하겠습니다.

## Let-바인딩
최상위 수준(globally)에서 또는 함수 내부에서 사용하는 `let ...` 구문은 **let-바인딩**이라고 부릅니다.

## 참조(References): 실제 변수
만약 프로그램을 통해 할당하거나 변경할 수 있는 실제 변수를 원하면 어떻게 해야 할까요? **참조(reference)**를 사용해야 합니다. 참조는 C/C++의 포인터와 매우 유사합니다. 자바에서 객체를 저장하는 모든 변수는 실제로 객체에 대한 참조(포인터)입니다. 펄에서는 참조는 OCaml에서와 같은 참조입니다.

다음은 OCaml에서 `int`에 대한 참조를 만드는 방법입니다.

```ocamltop
ref 0;;
```

사실 저 구분은 전혀 유용하지 않습니다. 우리는 참조를 만들었고, 이름을 짓지 않았기 때문에 가비지 컬렉터가 따라 와서 즉시 수집할 것입니다. (사실, 그것은 아마도 컴파일 타임에 버려질 겁니다). 참조에 대한 이름을 지어 보겠습니다.


```ocamltop
let my_ref = ref 0
```

이 참조는 현재 정수 0이 저장되어 있습니다. 여기에 다른 값을 넣어 보겠습니다.(할당):

```ocamltop
my_ref := 100
```

이제 참조에 저장된 값을 찾아 보겠습니다.

```ocamltop
!my_ref
```

`:=` 연산자는 참조에 할당하기 위해 사용되었고, `!` 연산자는 역참조하여 값을 가져옵니다. 여기 대략적으로 C/C++ 과 비교하는 코드가 있습니다:

OCaml
```ocamltop
let my_ref = ref 0;;
my_ref := 100;;
!my_ref
```

C/C++
```C
int a = 0; int *my_ptr = &a;
*my_ptr = 100;
*my_ptr;
```

참조에 대해서 설명하기는 했지만, 참조가 자주 쓰이지 않는다는 것을 알게 될 것입니다. 이름을 지어주기 위해서, 참조를 사용하기 보다는 `let name = expression in` 구문을 사용할 것입니다.


## 중첩 함수
C는 실제로 중첩 함수 개념을 갖고 있지 않습니다. GCC에서는 중첩함수를 지원하기는 하지만, 이 실제로 확장기능을 사용하는 프로그램을 전혀 보지 못했습니다. 아무튼, 여기 중첩함수에 대한 gcc 정보 페이지의 내용은 다음과 같이 설명합니다.

"중첩 함수"는 다른 함수 내부에서 정의된 함수입니다.(중첩 함수는 GNU C++에서 지원되지 않습니다.) 중첩 함수의 이름은 정의된 블록과 같은 장소에 있습니다. 예를 들어, `square` 라는 중첩 함수를 정의하고, 그것을 두 번 호출합니다: 


```C
foo (double a, double b)
{
  double square (double z) { return z * z; }

  return square (a) + square (b);
}
```

중첩 된 함수는 정의된 지점에서 볼 수 있는 포함된 함수의 모든 변수에 액세스 할 수 있습니다. 이것을 "유효 범위(lexical scoping)"라고 부릅니다. 예를 들어, `offset`이라는 이름의 상속된 변수를 사용하는, 중첩 함수의 예를 보겠습니다.

```C
bar (int *array, int offset, int size)
{
  int access (int *array, int index)
    { return array[index + offset]; }
  int i;
  /* ... */
  for (i = 0; i < size; i++)
    /* ... */ access (array, i) /* ... */
}
```
당신은 아이디어를 얻습니다. 그러나 중첩된 함수는 OCaml에서 매우 유용하고, 매우 많이 사용됩니다. 다음은 실제 코드에서 중첩된 함수의 예입니다.

```ocamltop
let read_whole_channel chan =
  let buf = Buffer.create 4096 in
  let rec loop () =
    let newline = input_line chan in
    Buffer.add_string buf newline;
    Buffer.add_char buf '\n';
    loop ()
  in
  try
    loop ()
  with
    End_of_file -> Buffer.contents buf;;
```
이 코드가 하는 일에 대해서 고민하지 마십시오. 이 튜토리얼에서는 다루지 않는 많은 개념을 포함하고 있습니다. 대신 중간에 있는 `loop`라는 인수가 없는 중첩함수에 집중하세요.
`read_whole_channel` 함수 내에서 `loop()`를 호출할 수 있지만, 이 함수 외부에서는 정의되어 있지 않습니다. 중첩된 함수는 main 함수에 정의된 변수에 접근할 수 있습니다. (여기서 `loop`는 지역 이름 `buf`와 `chan`에 접근합니다.)

중첩된 함수의 형식은 지역에 명명된 표현식 `let name arguments = function-definition in`과 동일합니다.

위 에제처럼, 함수 정의를 새 줄에 들여쓰기하고, 함수가 재귀적인 경우 `let` 대신 `let rec`를 사용해야 합니다. 

## 모듈 및 `open`
OCaml에는 재미있고 흥미로운 모듈들이 많이 있습니다. 예를 들어 그래픽, GUI 위젯 인터페이스, 큰 숫자 처리, 데이터 구조 및 POSIX 시스템 호출을 위한 표준라이브러리가 있습니다. 이 라이브러리들은 유닉스 시스템의 경우 `/usr/lib/ocaml/` 위치에 있습니다.
이 예제에서는, `Graphics`라는 간단한 모듈에 집중할 것입니다.

`Graphics` 모듈은 7개의 파일로 설치됩니다.

```
/usr/lib/ocaml/graphics.a
/usr/lib/ocaml/graphics.cma
/usr/lib/ocaml/graphics.cmi
/usr/lib/ocaml/graphics.cmx
/usr/lib/ocaml/graphics.cmxa
/usr/lib/ocaml/graphics.cmxs
/usr/lib/ocaml/graphics.mli
```
지금은 `graphics.mli` 파일에 집중하십시오. 이 파일은 텍스트 파일이므로, 읽을 수 있습니다. 먼저 이름이 `Graphics.mli`이 아니라, `graphics.mli`인 것을 확인하세요. OCaml은 항상 파일 이름의 첫 글자를 대문자로 만들어서 모듈 이름으로 사용합니다. 그것에 대해 알기 전까지, 이것은 꽤 혼란스러울 수 있습니다!

`Graphics`에서 함수를 시용하려면, 두 가지 방법이 있습니다. 프로그램의 시작부분에 
`open Graphics;;`라고 선언하거나, `Graphics.open_graph`와 같이 모든 함수 호출에 접두사를 붙이는 것입니다. `open`은 자바의 `import` 구문과 약간 비슷하고, 펄의 `use` 구문과는 매우 유사합니다.

인터프리터의 최상위 레벨에서 `Graphics`를 사용하려면, 먼저 라이브러리를 로드해야 합니다.

```ocaml
#load "graphics.cma";;
```
윈도 사용자: 이 예제를 윈도 인터프리터에서 작동하려면, 사용자 정의 최상위 레벨을 작성해야 합니다. 명령행에서 `ocamlmktop -o ocaml-graphics graphics.cma` 명령을 실행하십시오.
<!-- FIXME: is this last remark still true? -->
명확히 하기 위해 몇가지 예제가 있습니다. (두 가지 예제는 다른 것을 그립니다. - 시험해 보십시오.) 첫번째 예제는 `open_graph` 그리고 두 번째 예제는 `Graphics.open_graph`를 호출합니다.

```ocaml
(* To compile this example: ocamlc graphics.cma grtest1.ml -o grtest1 *)
open Graphics;;

open_graph " 640x480";;
for i = 12 downto 1 do
  let radius = i * 20 in
  set_color (if i mod 2 = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;

(* To compile this example: ocamlc graphics.cma grtest2.ml -o grtest2 *)

Random.self_init ();;
Graphics.open_graph " 640x480";;

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x);;

for x = 0 to 639 do
  let r = 4.0 *. (float_of_int x) /. 640.0 in
  for i = 0 to 39 do
    let x_init = Random.float 1.0 in
    let x_final = iterate r x_init 500 in
    let y = int_of_float (x_final *. 480.) in
    Graphics.plot x y
  done
done;;

read_line ();;
```
이 두 예제는 아직 설명하지 않은 몇 가지 기능을 사용합니다. 명령형 스타일의 `for-loop`, `if-then-else` 및 `재귀`입니다. 이것에 대해서는 나중에 이야기 할 것입니다. 그럼에도 불구하고 이 프로그램들을 살펴보고, (1) 어떻게 동작하는지, (2) 타입 유추가 버그를 제거하는데 어떻게 도움이 되는지 알아봐야 합니다.

## `Pervasives`(기본) 모듈
절대 `open`이 필요하지 않은 모듈이 하나 있습니다. 그것은 `Pervasives` 모듈입니다. (`/usr/lib/ocaml/pervasives.mli`를 읽어보세요. `Pervasives` 모듈의 모든 심볼은 OCaml 프로그램에 자동적으로 가져옵니다.

## 모듈 이름 바꾸기
만약 `Graphics` 모듈의 심볼을 사용하고 싶지만, 모든 심볼을 가져오지 않고, 매번 `Graphics`를 타이핑하는 것이 괴롭다면 어떻게 해야 하나요? 이 트릭을 이용하여 이름을 바꿉니다.

```ocaml
module Gr = Graphics;;

Gr.open_graph " 640x480";;
Gr.fill_circle 320 240 240;;
read_line ();;
```
실제로, 이 방법은 중첩된 모듈(모듈은 서로 중첩될 수 있습니다.)을 가져오지만, 중첩된 모듈의 전체 경로를 타이핑 하고 싶지 않을 때 매우 유용합니다

## `;;` 와 `;`의 이용과 생략
이제 우리는 매우 중요한 이슈를 살펴보려 합니다. 언제 `;;`를 사용해야 하고, 언제 `;`을 사용해야 하며, 그리고 언제 이것을 사용하면 안될까요? 이것은 까다로운 문제이고, 저자 또한 OCaml을 배우는 동안 오랫동안 부담이 되는 것이었습니다.

규칙 #1은 코드의 최상위 레벨의 구문을 분리할때 `;;`을 사용하야 하고, 함수 정의 또는 다른 종류의 명령문에서는 사용하지 않는 것입니다.

두번째 그래픽 예제의 섹션을 살펴 보십시오.

```ocaml
Random.self_init ();;
Graphics.open_graph " 640x480";;

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x);;
```

두개의 최상위 명령문과 함수 정의(`iterate`)가 있습니다. 각각에는 `;;`가 있습니다.

규칙 #2는 *때때로* `;;`을 생략할 수 있다는 것입니다. 초보자인 당신이 이것에 대해서 걱정할 필요는 없습니다. 규칙 #1에 따라 `;;`를 항상 사용해야 하지만, 다른 사람들의 코드를 많이 읽다보면, 가끔 `;;`를 생략할 수 있다는 것을 알게 될 것입니다. 특정 위치는 다음과 같습니다.

* `let` 키워드 앞.
* `open` 키워드 앞.
* `type` 키워드 앞.
* 파일의 끝
* OCaml이 현재 구문의 연속이 아니라 새로운 문장의 시작임을 "추측" 할 수 있는 극소수의 위치(매우 드뭄)

다음은 `;;`를 가능하다면 생략하도록 한 코드의 일부입니다. 

Here is some working code with `;;` elided wherever possible:

```ocaml
open Random                   (* ;; *)
open Graphics;;

self_init ();;
open_graph " 640x480"         (* ;; *)

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x);;

for x = 0 to 639 do
  let r = 4.0 *. (float_of_int x) /. 640.0 in
  for i = 0 to 39 do
    let x_init = Random.float 1.0 in
    let x_final = iterate r x_init 500 in
    let y = int_of_float (x_final *. 480.) in
    Graphics.plot x y
  done
done;;

read_line ()                  (* ;; *)
```

규칙 #3과 #3는 단일 `;`에 대한 것입니다. 이것은 `;;`과 완전히 다릅니다. 단일 세미콜론 `;`는 C, C++, 자바, 펄과 동일한 목적을 갖는 시퀀스 포인트라 부릅니다. 이것의 "먼저 `;` 앞의 작업을 수행하고, 첫번째 작업이 완료되면 `;` 뒤의 작업을 수행하라." 는 의미입니다. 당신이 몰랐다에 베팅합니다. 

규칙 #3은 `let ... in` 구문 뒤에 단일 `;`을 붙이지 않는 것입니다.

규칙 #4는 마지막 구문을 *제외*하고, 코드 블럭 내의 모든 다른 구문은 단일 `;`를 붙이는 것입니다.

위의 예제에서 `for-loop`의 내부는 좋은 데모입니다. 이 코드에서 단일 `;`을 전혀 사용하지 않을 것을 보십시오.

```ocaml
for i = 0 to 39 do
  let x_init = Random.float 1.0 in
  let x_final = iterate r x_init 500 in
  let y = int_of_float (x_final *. 480.) in
  Graphics.plot x y
done
```
위의 코드에서 `;`을 넣을 수 있다고 생각할 수 있는 유일한 위치는 `Graphics.plot x y` 입니다. 그러나 마지막 구문이기 때문에 규칙 #4는 거기에 넣지 않도록 말하고 있습니다.

## ";"에 대한 정리
Brian Hurt는 ";"에 대한 제 의견을 수정했습니다.

> `;`는 `+` 처럼 연산자 입니다. 글쎄요, `+`와 같지는 않겠지만, 개념적으로는 동일합니다. `+`의 타입 서명은 `int -> int -> int` 입니다. 2개의 int를 취해, int(합계)를 반환합니다. `;`의 타입 서명은 `unit -> 'b -> 'b` 입니다. 두 값을 취해 단순히 두번째 값을 반환합니다. 오히려 C의 `,`(콤마) 연산자와 같습니다. `a + b + c + d`라고 작성하는 것처럼 단순하게 `a ; b ; c ; d`라고 작성할 수 있습니다.
> 이것은 절대로 쉽게 떠올릴 수 있지 않은, "정신적 도약"의 하나입니다. OCaml에서 거의 모든것이 표현식입니다. `if/then/else`는 표현식입니다. `a ; b` 는 표현식입니다. `match foo with ...` 는 표현식입니다. 다음의 코드는 완벽하게 합법적입니다. (그리고 모두 같은 일을 합니다.)
> 
> ```ocamltop
> let f x b y = if b then x+y else x+0
> let f x b y = x + (if b then y else 0)
> let f x b y = x + (match b with true -> y | false -> 0)
> let f x b y = x + (let g z = function true -> z | false -> 0 in g y b)
> let f x b y = x + (let _ = y + 3 in (); if b then y else 0)
> ```
> 
> 특히 마지막 것을 주목하십시오. 저는 2개의 구문을 "조인" 하기 위해 `;`을 사용했습니다. OCaml에서 모든 함수는 다음과 같이 표현할 수 있습니다.
> 
> ```ocaml
> let name [parameters] = expression
> ```
> 
> OCaml에서 표현식에 대한 정의는 C 보다 조금 포괄적입니다. 사실 C는 구문의 개념을 가지고 있고, 모든 C 구문은 OCaml에서 표현식입니다. (`;` 연산자와 결합)
> 
> 함수처럼 `+`를 참조할 수 있다는 점에서 `;`는 `+`와 다릅니다. 예를 들어 정수 리스트의 합을 구하기 위해, 다음과 같이 `sum_list` 함수를 정의할 수 있습니다.
> 
> ```ocamltop
> let sum_list = List.fold_left ( + ) 0
> ```

## 모두 함께 보기: 실제 코드
이 절에서 우리는 lablgtk 1.2 라이브러리의 실제 코드 일부를 볼 것입니다. (Lablgtk는 Unix Gtk 위젯 라이브러리의 OCaml 인터페이스입니다.)
경고: 여기에는 아직 다루지 않은 많은 내용들이 포함되어 있습니다. 상세한 것을 보지 말고, 작성자가 언제 어디서 `;;`, `;`, `open` 을 사용했는지, 코드의 들여쓰기 방법, 지역, 전역 표현식의 사용 등, 코드 전반의 형태를 살펴보십시오. 

... 그러나, 당신이 헤메지 않도록 약간의 단서를 줄 것입니다!

* `?foo` 와 `~foo` 는 OCaml에서 함수의 선택적(optional) 인수를 사용하는 방법입니다. C 파생언어들은 이런 방법이 없지만 펄, 파이썬, 스몰토크에는 모두 함수 호출에서 인수를 이름을 정하고, 일부는 생략하고, 원하는 순서대로 다른 인수를 제공하는 개념이 있습니다. 
 
* `foo#bar` `foo`라는 객체에서 `bar`라는 메소드를 실행하는 메소드 호출입니다. 그것은 C++, 자바 또는 펄의 `foo->bar`, `foo.bar`, `$foo->bar`와 비슷합니다.

첫번째 예제: 프로그래머는 표준라이브러리 몇개를 엽니다. (`open`과 `let` 키워드 다음의 `;;`는 생략합니다.) 그런다음 `file_dialog` 함수를 생성하고, 이 함수 내에서 두 줄의 `let sel = ... in` 구문을 사용하여 `sel`이라고 명명된 표현식을 정의합니다. 그런다음 `sel` 메소드를 여러번 호출합니다.

```ocaml
(* First snippet *)
open StdLabels
open GMain

let file_dialog ~title ~callback ?filename () =
  let sel =
    GWindow.file_selection ~title ~modal:true ?filename () in
  sel#cancel_button#connect#clicked ~callback:sel#destroy;
  sel#ok_button#connect#clicked ~callback:do_ok;
  sel#show ()
```

두번째 예제: 최상위 수준에 전역 이름 목록. 규칙 #2에 의해 모든 `;;`가 생략된 것을 보십시오.

```ocaml
(* Second snippet *)
let window = GWindow.window ~width:500 ~height:300 ~title:"editor" ()
let vbox = GPack.vbox ~packing:window#add ()

let menubar = GMenu.menu_bar ~packing:vbox#pack ()
let factory = new GMenu.factory menubar
let accel_group = factory#accel_group
let file_menu = factory#add_submenu "File"
let edit_menu = factory#add_submenu "Edit"

let hbox = GPack.hbox ~packing:vbox#add ()
let editor = new editor ~packing:hbox#add ()
let scrollbar = GRange.scrollbar `VERTICAL ~packing:hbox#pack ()
```

세 번째 예제: 저자는 `GdkKeyssyms` 모듈에서 모든 심볼을 가져옵니다. 이제 특이한 형태의 let-binding을 보십시오. `let _ = expression`는 "표현식의 모든 값을 계산(부수적인 부작용이 있습니다.)하고, 결과를 버리십시오"를 의미합니다. 여 경우 Gtk의 메인 루프에서 `Main.main()` 을 실행하는 것은 "표현식의 값을 계산하세요." 라는 의미를 가지고 있고, 화면에 창을 띄우고, 전체 응용 프로그램을 실행하는 부작용을 가지고 있습니다. `Main.main ()`의 결과는 중요하지 않습니다. 아마도 `unit`가 반환 값이지만, 응용 프로그램이 끝날 때까지 반환되지 않습니다.

이 코드가 얼마나 많은 절차형 명령들을 가지고 있는지 주목하십시오. 이것은 정말로 고전적인 명령형 프로그램입니다.

```ocaml
(* Third snippet *)
open GdkKeysyms

let () =
  window#connect#destroy ~callback:Main.quit;
  let factory = new GMenu.factory file_menu ~accel_group in
  factory#add_item "Open..." ~key:_O ~callback:editor#open_file;
  factory#add_item "Save" ~key:_S ~callback:editor#save_file;
  factory#add_item "Save as..." ~callback:editor#save_dialog;
  factory#add_separator ();
  factory#add_item "Quit" ~key:_Q ~callback:window#destroy;
  let factory = new GMenu.factory edit_menu ~accel_group in
  factory#add_item "Copy" ~key:_C ~callback:editor#text#copy_clipboard;
  factory#add_item "Cut" ~key:_X ~callback:editor#text#cut_clipboard;
  factory#add_item "Paste" ~key:_V ~callback:editor#text#paste_clipboard;
  factory#add_separator ();
  factory#add_check_item "Word wrap" ~active:false
    ~callback:editor#text#set_word_wrap;
  factory#add_check_item "Read only" ~active:false
    ~callback:(fun b -> editor#text#set_editable (not b));
  window#add_accel_group accel_group;
  editor#text#event#connect#button_press
    ~callback:(fun ev ->
      let button = GdkEvent.Button.button ev in
      if button = 3 then begin
        file_menu#popup ~button ~time:(GdkEvent.Button.time ev); true
      end else false);
  editor#text#set_vadjustment scrollbar#adjustment;
  window#show ();
  Main.main ()
```

