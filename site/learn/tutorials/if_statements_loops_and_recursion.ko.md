<!-- ((! set title If 문, 루프, 재귀 !)) ((! set learn !)) -->

*Table of contents*

If 문, 루프, 재귀
=================

if 문 - 사실은 if 표현식(expression)
------------------------------------

Ocaml은 다음 두가지 형태의 명백한 의미의 if 문이 있다:

```ocaml
if boolean-condition then expression
  
if boolean-condition then expression else other-expression
```

여태까지 사용해왔던 다른 언어들과는 다르게, ocaml에서 if문은 진짜
표현식(expression)이다. Ocaml의 if문은 사실 다음과 더 비슷하다.
`boolean-condition ? expression :other-expression`

다음은 if문의 간단한 예제이다:

```ocamltop
let max a b =
  if a > b then a else b
```

잠깐 위 예제를 OCaml 톱레벨에서 입력해 보면 이 함수가 아래의 타입인
다형적(polymorphic) 함수라는 것을 알 수 있다.

```ocaml
max : 'a -> 'a -> 'a
```

따라서 OCaml에서 위의 `max` 함수는 어떤 타입에도 사용할 수 있다:

```ocamltop
max 3 5;;
max 3.5 13.0;;
max "a" "b";;
```

이는 `>`가 사실상 다형적(polymorphic)이기 때문에, 심지어 객체를 비롯한
어떠한 타입에도 동작한다. (사실 비트를 가지고 비교하기 때문).

[참고: `max`와 `min`는 라이브러리에 포함되어 있다]

이제 if 문에 대해서 좀더 자세히 알아보자. `range`는 충분히 설명하지
않았던 함수인데, 아마도 여태까지 배웠던 재귀 함수, 리스트, if 표현식을
조합하면, 이해할 수 있을 것이다:

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a+1) b
```

이제 이 함수에 몇가지 예제를 적용해 보자. 먼저 쉬운 예로 `a > b` 부터
해보도록 하자. `range 11 10` 하면 `[]` 가 되돌려 진다.(빈 리스트) 그리곤
끝이다.

`range 10 10`를 했을때는 어떨까? `10 > 10`가 거짓이 되니까 `else`부분이
계산되어진다, 그렇다면: `10 :: (range 11 10)` (가독성을 위해 괄호를
넣었다). 방금전에 했던 것처럼 `range 11 10` = `[]`다, 따라서 이것은:
`10 :: []`이다. 앞에서 설명했던 리스트의 `::` (cons) 연산자가
기억나는가? `10 :: []`는 `[ 10 ]` 같다.

이것을 한번 해보자 `range 9 10`:

```ocaml
range 9 10
→ 9 :: (range 10 10)
→ 9 :: [ 10 ]
→ [9; 10]
```

`range 1 10` 은 명확하게 다음과 같이 계산되어진다.
`[ 1; 2; 3; 4; 5; 6; 7; 8; 9; 10 ]`.

여기서 우리가 얻은 것은 단순한 케이스의 재귀호출이다. 미리 이야기
하자면, 함수형 프로그래밍은 루프 보다는 재귀호출을 선호한다고 말할수
있다. 이 장의 마지막 부분에서 재귀호출에 대해 더 논의 할 것이다.

잠시 if 문으로 돌아가면, 아래 함수는 무엇을 하는 것일까?

```ocamltop
let f x y =
  x + if y > 0 then y else 0
```

단서: 전체 if 표현식에 괄호를 쳐보자. 이 함수는 마치 [전기
다이오드](https://en.wikipedia.org/wiki/Diode#Current.E2.80.93voltage_characteristic)처럼
`y`를 클립(clip)한다.

`abs` (절대값) 함수는 `Pervasives`에서 다음과 같이 정의된다:

```ocamltop
let abs x =
  if x >= 0 then x else -x
```

역시 `Pervasives`에서 `string_of_float`함수는 중첩된 if 표현식의 복잡한
쌍을 가지고 있다:

```ocaml
let string_of_float f =
  let s = format_float "%.12g" f in
  let l = string_length s in
  let rec loop i =
    if i >= l then s ^ "."
    else if s.[i] = '.' || s.[i] = 'e' then s
    else loop (i+1) in
  loop 0
```

이 함수를 살펴보자. 이 함수를 인자 `f` = 12.34로 호출 한다면, `s` =
"12.34", 그리고 `l` = 5가 된다. 우리는 `loop`를 초기값 `i` = 0로
호출한다.

`i`가 `l` 보다 크거나 같지 않고 `s.[i]` (`s`내에서 `i`번째 문자)가
마침표 또는 `'e'`가 아니므로 `loop (i+1)`가 호출된다, 즉 `loop 1`.

`i` = 1로 다시 반복하면 `loop 2`를 호출한다.

`i` = 2의 경우는 `s.[i]`가 마침표 이므로 (원 문자열을 상기하면 `s` =
"12.34"), 이는 즉시 `s`를 반환하고 함수 `string_of_float`는 "12.34"를
반환한다.

`loop`가 무엇을 하는 것일까? 사실 이 함수는 `format_float`이 반환한
문자열이 마침표 (또는 `'e'`)를 포함하고 있는지 검사한다. 만일 `12.0`로
`string_of_float`를 호출한다면, `format_float`는 문자열 "12"를
반환하겠지만, `string_of_float`는 "12." 또는 "12.0"를 반환해야 한다
(OCaml의 부동소수점 상수는 정수 상수와 구별하기 위해 마침표를 포함해야
하기 때문에). 그래서 마침표 유무를 검사하는 것이다.

이 함수에서 사용된 이상한 재귀호출은 거의 효율 때문이다. OCaml은 루프를
지원하는데 왜 루프를 사용하지 않았을까? 다음 섹션에서 OCaml의 `for`
루프가 `string_of_float` 사용이 불가능 하다는 것을 배울 것이다. 하지만
여기 좀더 직관적이지만 두배 정도 느린 `string_of_float` 코드가 있다:

```ocaml
let string_of_float f =
  let s = format_float "%.12g" f in
  if String.contains s '.' || String.contains s 'e'
  then s
  else s ^ "."
```

begin ... end 사용하기
----------------------

lablgtk의 코드 일부를 보자:

```ocaml
if GtkBase.Object.is_a obj cls then
  fun _ -> f obj
else begin
  eprintf "Glade-warning: %s expects a %s argument.\n" name cls;
  raise Not_found
end
```

`begin`와 `end`는 열기 및 닫기 괄호에 해당하는 소위 **문법 설탕**이다.
위의 예에서 이들이 하는 것은 `else` 절 내의 두 개의 문(statement)을
하나로 묶어 주는 것이 전부이다. 대신에 다음과 같이 작성했다고 가정해
보자:

```ocaml
if GtkBase.Object.is_a obj cls then
  fun _ -> f obj
else
  eprintf "Glade-warning: %s expects a %s argument.\n" name cls;
  raise Not_found
```

완전히 괄호를 치고 적절히 인덴트를 한다면 다음과 같이 된다:

```ocaml
(if GtkBase.Object.is_a obj cls then
   fun _ -> f obj
 else
   eprintf "Glade-warning: %s expects a %s argument.\n" name cls
);
raise Not_found
```

의도한 바와 전혀 다르다. 따라서 if 표현식의 `then` 또는 `else` 절 내에
있는 여러개의 문(statement)를 묶기 위해서 `begin`과 `end`가 필요한
것이다. 또한 원한다면 `( ... )` 와 같은 일반적인 괄호를 사용할 수도
있다. (나 역시 Pascal을 **질색**하기 때문에 괄호를 더 선호한다 :-).
간단한 예제 두 개를 보자:

```ocamltop
  if 1 = 0 then
    print_endline "THEN"
  else begin
    print_endline "ELSE";
    failwith "else clause"
  end;;
  
  if 1 = 0 then
    print_endline "THEN"
  else (
    print_endline "ELSE";
    failwith "else clause"
  );;
```

for 루프와 while 루프
---------------------

OCaml은 우리에게 익숙한 `for`를 약간 제한된 형태로 지원한다:

```ocaml
for variable = start_value to end_value do
  expression
done
  
for variable = start_value downto end_value do
  expression
done
```

lablgtk의 단순하지만 실제 코드를 보면:

```ocaml
for i = 1 to n_jobs () do
  do_next_job ()
done
```

OCaml에서 `for` 루프는 단지 아래의 축약형일 뿐이다:

```ocaml
let i = 1 in
do_next_job ();
let i = 2 in
do_next_job ();
let i = 3 in
do_next_job ();
  ...
let i = n_jobs () in
do_next_job ();
()
```

OCaml은 `for` 에서 루프의 종료전 빠져나오는 개념을 지원하지 않는다 -
i.e. `break`, `continue`, `last` 문과 같은 것이 없다. (예외를 발생
시키고 외부에서 캐치 하는 방법을 *쓸 수도* 있는데, 빠르긴 하지만 종종
지저분해 보인다.)

OCaml의 for 루프 내의 표현식은 `unit` 타입이어야 하며 (그렇지 않으면
컴파일러 경고를 받는다.), 따라서 for 루프 전체의 표현식 역시 `unit`를
반환한다:

```ocamltop
for i = 1 to 10 do
  i (* 경고: 이 표현식은 unit 이다. *)
done
```

함수형 프로그래머들은 명시적인 루프 대신 재귀호출을 사용하는 경향이
있으며, OCaml의 상대적으로 능력이 약한 **for** 루프 때문에 **for**
루프를 의심스럽게 대한다. 아래에서 재귀호출에 대해 이야기 할 예정이다.

OCaml의 **while 루프**는 다음과 같다:

```ocaml
while boolean-condition do
  expression
done
```

for 루프와 같이, 예외를 발생시키지 않고는 while 루프 바깥으로 빠져
나오는 방법은 없다. 이는 while 루프 역시 사용이 제한되어 있다는 점을
의미한다. 다시 말하자면 함수형 프로그래머들은 재귀호출을 좋아 하기
때문에 while 루프는 이 언어에서는 이등 시민으로 간주된다.

만일 while 루프에 한 고려를 중단하면, 이 while 루프가 별다른 쓸모가
없다는 것을 볼 수 있을 것이다, 우리의 오랜 친구 레퍼런스(reference)와
함께 사용하지 않는다면. 잠시 OCaml이 레퍼런스가 없다고 상상해 보자:

```ocaml
let quit_loop = false in
while not quit_loop do
  print_string "Have you had enough yet? (y/n) ";
  let str = read_line () in
  if str.[0] = 'y' then
    (* how do I set quit_loop to true ?!? *)
done
```

`quit_loop`가 진짜 "변수"가 아니라는 점을 기억하자 - let-바인딩은 단지
`quit_loop`를 `false`의 약칭으로 만들어 줄 뿐이다. 이는 while 루프의
조건 (붉은 색의)이 언제나 참이며 루프는 무한히 반복한다는 것이다!

다행스럽게도 OCaml은 레퍼런스가 *있어서*, 우리는 원하는대로 위 코드를
작성할 수 있다. 느낌표 `!`가 C/Java에서 처럼 부정을 의미한다고 혼돈하지
말기 바란다. 여기서 의미는 Forth와 비슷하게 "포인터를 디레퍼런스"하는
것을 의미한다. `!`를 "get" 또는 "deref"라고 읽는 것이 좋다. (역주:
dereference를 역참조로 번역하는 것도 고려했지만, 의미가 잘 통하지 않고
사전에서도 디레퍼런스 - '프로그래밍 언어에서 포인터가 가리키는 번지에
수납된 데이터에 접근하기'로 나와있어 그대로 사용합니다)

```ocaml
let quit_loop = ref false in
while not !quit_loop do
  print_string "Have you had enough yet? (y/n) ";
  let str = read_line () in
  if str.[0] = 'y' then
    quit_loop := true
done
```

리스트를 따라 루프 돌기
-----------------------

리스트를 따라 루프를 돌고 싶다고, 명령형 (imperative) 프로그래머가 되어
믿음직한 총잡이 Mr. For Loop씨를 찾을 필요는 없다. OCaml은 리스트를 따라
루프를 돌 수 있는 더 낫고 빠른 방법을 가지고 있으며, 이들은 모두 `List`
모듈 내에 들어 있다. 사실 `List` 모듈 내에는 수십가지의 좋은 함수들이
있지만, 나는 단지 가장 유용한 몇가지만 여기서 이야기 하겠다.

먼저 사용할 리스트를 하나 정의해 보자:

```ocamltop
let my_list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
```

만일 리스트 내의 모든 요소에 대해 함수를 호출하고 싶다면 `List.iter`를
다음과 같이 쓰면 된다:

```ocamltop
let f elem =
  Printf.printf "I'm looking at element %d now\n" elem in
  List.iter f my_list
```

`List.iter`는 사실 당신의 소뇌가 for 루프 사용을 제안할 때 마다 첫번째로
고려해야할 것이다.

만일 리스트내의 모든 요소를 각각 *변화*시키고 싶다면 - 예를 들어 각
요소를 두배로 하는 - `List.map`를 사용하라. 이 함수는 이전에 Perl
프로그래밍을 해 본 사람이라면 친숙할 것이다.

```ocamltop
List.map (( * ) 2) my_list
```

펄에는 리스트 내에서 조건을 만족하는 요소들만 골라낼 수 있는 "grep"
이라는 유용한 함수가 있다 - 예를 들어, 리스트 내에서 짝수만 반환하는.
OCaml에서 이 함수는 `List.filter` 이다:

```ocamltop
let is_even i =
  i mod 2 = 0 in
List.filter is_even my_list
```

리스트가 어떤 요소를 가지고 있는지를 확인하기 위해서는 `List.mem`를
사용하면 된다 (member의 약자):

```ocamltop
List.mem 12 my_list
```

`List.for_all`와 `List.exists`는 술어 논리(predicate logic)의 "forall"과
"exist" 연산자와 동일 하다.

두개의 리스트에 대해 동시에 연산을 하고 싶다면, `iter2`, `map2`,
`for_all2`, `exists2` 등과 같은 접두사 "2"로 끝나는 함수들이 있다.

`map`과 `filter` 함수는 개별적인 리스트 요소들에 대해 독립적으로
동작한다. \<dfn\>Fold\</dfn\>는 좀 더 일반적이지 않은 동작으로 "리스트의
각 요소들 사이에 연산자를 삽입한다"라고 생각할 수 있다. 리스트 내의 모든
숫자들을 더하고 싶다고 가정해 보자. 대충 이야기 하자면, 내가 원하는 것은
리스트 내의 요소들 사이에 덧셈 기호를 삽입하는 것이다:

    1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10

fold 연산은 이를 해 준다. 비록 정확한 디테일은 약간 더 어렵지만. 맨
먼저, 내가 빈 리스트를 fold 하려 하면 어떤 일이 벌어질까? 이런 경우
에러를 내는 것 보다는 답이 0이면 좋을 것이다. 하지만 내가 리스트의
내적(product)을 구하고자 한다면 다른 답을 원할 것이다. 따라서 fold를
정의하기 위해서는 일종의 "디폴트" 인자를 제공해야 한다. 두 번째 문제는
`+` 나 `*`와 같은 단순한 연산자에서는 문제가 발생하지 않는다: 만일
사용하려는 연산자가 결합법칙을 만족하지 않는다면 어떻게 할까, 예를 들어
(a *op* b) *op* c 가 a *op* (b *op* c)와 다르다면? 이러한 경우 리스트의
왼쪽에서 연산을 시작해 오른쪽으로 가느냐, 오른쪽에서 시작해 왼쪽으로
가느냐가 문제가 된다. 이러한 이유로 fold는 두개의 버전이 존재한다.
`List.fold_left`는 왼쪽에서 오른쪽으로 가며 `List.fold_right`는
오른쪽에서 왼쪽으로 오는데 약간 효율이 떨어진다.

`List.fold_left`를 써서 정수 리스트에 대한 `sum`(합)과 `product`(곱)
함수를 정의해 보자:

```ocamltop
let sum = List.fold_left ( + ) 0;;
let product = List.fold_left ( * ) 1;;
sum my_list;;
product my_list;;
```

쉽다! 팩토리얼도 같은 방법을 쓸 수 있다:

```ocamltop
let fact n = product (range 1 n);;
fact 10;;
```

(이 팩토리얼 함수는 정수의 오버플로우 때문에 그다지 크지 않은 `n` 값에
대해서도 잘못된 값을 반환할 수 있으므로 별로 유용하지는 않다. 실제
팩토리얼 함수는 `Big_int` 모듈을 사용하여야 한다.)

문자열을 따라 루프 돌기
-----------------------

`String` 모듈 역시 수십개의 유용한 문자열 관련 함수들을 가지고 있으며,
이 함수들중 일부는 문자열을 따라 루프를 도는 데 사용된다.

`String.fill`과 `String.blit`는 C의 `memset`과 `strcpy`에 해당한다.
`String.copy`은 `strdup`와 같이 문자열을 복사한다.

또한 `String.iter` 함수가 있어 `List.iter`와 비슷하게 문자열 내의
문자들에 대해 동작한다.

재귀 호출 (recursion)
---------------------

이제 어려운 주제, 재귀 호출로 넘어 왔다. 함수형 프로그래머들은 이들의
재귀 함수에 대한 사랑으로 정의될 수 있으며, 여러가지로 함수형
프로그래밍에서 재귀 함수는 명령형 프로그래밍에서의 루프와 동일한 것으로
간주된다. 함수형 언어에서 루프는 이등 시민으로 간주되지만, 재귀 함수는
최고의 지원을 받는다.

for 루프와 while 루프를 작성하다 재귀 함수를 작성하는 것은 마인드셋의
변화가 필요하다. 따라서 이 섹션은 소개와 예제를 제공할 것이다.

첫번째 예제에서 우리는 파일 전체를 메모리로(하나의 긴 스트링 형태로)
읽어들일 것이다. 이를 위해서 본질적으로 세가지의 가능한 접근 방법이
있다:

### 방법 1

파일의 길이를 얻어온 후, `really_input` 메소드를 사용하여 한번에 모두
읽어 들인다. 가장 쉬운 방법이지만 실제 파일이 아닌 채널(예, 키보드
입력)에서의 경우라면 전체 길이를 미리 알 수 없기 때문에 불가능하고
따라서 다른 접근 방법을 찾아야 한다.

### 방법 2

명령형 접근으로 예외를 이용한 while 루프를 사용한다.

### 방법 3

재귀적 루프로 역시 예외를 이용하여 끝을 낸다.


여기서 몇가지 새로운 개념을 소개하겠다. 마지만 두 접근 방법들은 `Buffer`
모듈 - 확장 가능한 버퍼로 효율적으로 뒤에 텍스트를 덧붙일 수 있는
스트링과 같이 생각할 수 있다. 입력이 종료되면 `End_of_file` 예외를 캐치
할 수도 있다. 또한 `Sys.argv.(1)`를 사용하여 커맨드라인 파라미터를 얻을
것이다.

```ocaml
(* 전체 파일 읽기: 방법 1 *)
open Printf
  
let read_whole_chan chan =
  let len = in_channel_length chan in
  let result = String.create len in
  really_input chan result 0 len;
  result
  
let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan
  
let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  printf "I read %d characters from %s\n" (String.length str) filename
```

방법 1은 별로 만족스럽지 않은데 `read_whole_chan`가 키보드나 소켓과 같은
비-파일 채널에는 동작하지 않기 때문이다. 방법 2는 while 루프를 사용한다:

```ocaml
(* 전체 파일 읽기: 방법 2 *)
open Printf
  
let read_whole_chan chan =
  let buf = Buffer.create 4096 in
  try
    while true do
      let line = input_line chan in
      Buffer.add_string buf line;
      Buffer.add_char buf '\n'
    done;
    assert false (* This is never executed
	                (always raise Assert_failure). *)
  with
    End_of_file -> Buffer.contents buf
  
let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan
  
let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  printf "I read %d characters from %s\n" (String.length str) filename
```

방법 2의 핵심은 while 루프의 내부를 보면 된다. while 루프에서 빠져
나오는 유일한 방법은 예외라는 것을 기억하는가? 바로 우리가 하고 있는
것이 그것이다. 비록 예외에 대해 아직 배우지 않았지만, 파일의 끝에
도착했을 때 `input_line`에 의해 `End_of_file` 예외가 발생하는 것은 쉽게
이해할 수 있을 것이다. 버퍼 `buf`는 파일의 내용을 누적시키고, 파일의
끝에 도달했을 때 우리는 이 버퍼를 반환한다 (`Buffer.contents buf`).

여기서 궁금한 점은 while 루프 직후에 나오는 불필요해 보이는
따옴표(`""`)이다. 왜 있는 것일까? while 루프는 for 루프와 마찬가지로
단지 표현식이며, `unit` 객체(`()`)를 반환한다. 그러나 OCaml은 `try` 내의
타입이 각 예외의 반환 타입과 매치 되어야 한다. 이 경우 `End_of_file`이
`string`를 반환하기 때문에, `try`의 본체도 문자열을 "반환"하여야 한다 -
무한 루프를 돌기 때문에 문자열을 반환할 일이 절대 없는 경우에요.

이제 재귀적인 버전의 차례다. 방법 2에 비해 *짧다*는 것을 주의하기
바란다. 하지만 명령형 프로그래머에게는 이해하기 쉽지 않다:

```ocaml
(* 전체 파일 읽기: 방법 3 *)
open Printf
  
let read_whole_chan chan =
  let buf = Buffer.create 4096 in
  let rec loop () =
    let line = input_line chan in
    Buffer.add_string buf line;
    Buffer.add_char buf '\n';
    loop () in
  try
    loop ()
  with
    End_of_file -> Buffer.contents buf
  
let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan
  
let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  printf "I read %d characters from %s\n" (String.length str) filename
```

역시 무한 루프이지만 이번은 재귀 호출을 이용한다. `loop`는 함수의
마지막에 자기 자신을 다시 호출한다. 이 무한 재귀 호출은 `input_line`가
`End_of_file` 예외를 발생시킬 때 끝이 난다.

방법 3은 매우 큰 파일을 읽을 때 스택 오버플로우를 일으킬 것으로
보이지만, 사실은 그렇지 않다. 아래에서 논의 예정인 꼬리 재귀(tail
recursion) 덕분에 컴파일러는 재귀적인 `loop` 함수를 실제 while 루프로
바꾸어 정해진 스택 공간내에서 작동할 수 있게 한다.

다음 예에서 우리는 얼마나 재귀 호출이 특히 트리와 같은 특정 타입의 자료
구조를 만드는데 대단한지를 보여줄 것이다. 파일 시스템 내에서 파일을
표현하기 위한 재귀적 타입을 만들어 보자:

```ocamltop
type filesystem = File of string | Directory of filesystem list
```

`opendir`과 `readdir` 함수가 디렉토리를 열고 디렉토리 내의 요소들을
읽는데 사용될 것이다. 디렉토리의 끝에 다달았을 때 `readdir`가 내는
성가신 `End_of_file` 예외를 숨기는 간단한 `readdir_no_ex` 함수를
정의했다:

```ocamltop
open Unix  (*  #load "Unix.cma"를 해야 할 수도 있다 *)
  
let readdir_no_ex dirh =
  try
    Some (readdir dirh)
  with
    End_of_file -> None
```

`readdir_no_ex`의 타입은 다음과 같다. Null 포인터에 대한 이전의 논의를
기억해보자.

```ocaml
readdir_no_ex : dir_handle -> string option
```

나는 또한 `filesystem` 타입을 (예를 들어) 인쇄가 가능한 문자열로 바꿀 수
있는 간단한 재귀 함수를 정의할 것이다:

```ocamltop
let rec string_of_filesystem fs =
  match fs with
  | File filename -> filename ^ "\n"
  | Directory fs_list ->
      List.fold_left (^) "" (List.map string_of_filesystem fs_list)
```

`fold_left`와 `map` 함수의 사용에 주의하라. `map`는 리스트 내의 각
`filesystem`을 `string`로 (재귀적으로) 바꾸는 데 사용된다.
`fold_left (^) ""`는 리스트들을 하나의 큰 문자열로 합친다. 또한 패턴
매칭의 사용도 주의하라. (라이브러리에는 `fold_left (^) `과 본질적으로
동일하며 더 효율적으로 구현된 `String.concat` 함수가 정의되어 있다).

자 이제 디렉토리 구조를 재귀적으로 읽고, 재귀적인 `filesystem` 자료
구조를 반환하는 함수를 정의해 보자. 이 함수는 단계적으로 보여줄
것이지만, 전체 함수는 이 섹션의 마지막에 다시 보여줄 것이다. 먼저 함수의
개괄은 다음과 같다:

```ocaml
let rec read_directory path =
  let dirh = opendir path in
  let rec loop () =
    (* ..... *) in
  Directory (loop ())
```

`opendir`를 호출하면 주어진 패스를 열고 추후 `readdir_no_ex`를 이용해
이름들을 읽을 수 있게 해 주는 `dir_handle`를 반환한다. 반환값은
`Directory fs_list`이 되며 우리가 해주어야 할 모든 것은 함수 `loop`를
작성하여 `filesystem`의 리스트를 반환하게 하는 것이다. `loop`의 타입은
다음과 같다:

```ocaml
loop : unit -> filesystem list
```

어떻게 loop를 정의해야 할까? 다시 한 단계 들어가 보자.

```ocaml
let rec loop () =
  let filename = readdir_no_ex dirh in
  (* ..... *)
```

먼저 우리는 디렉토리 핸들(directory handle)에서 다음 파일 이름
(filename)을 읽는다. `filename`은 `string option` 타입이며, 다시 말해
`None`가 되거나 `foo`가 디렉토리 내의 다음 파일명이라면 `Some "foo"`가
될 수 있다. 또한 `"."` 과 `".."` 파일들을 무시해야 한다. (현재
디렉토리와 부모 디렉토리). 이 모든 것을 우리는 패턴 매치를 통해 훌륭히
해 낼 수 있다:

```ocaml
let rec loop () =
  let filename = readdir_no_ex dirh in
  match filename with
  | None -> []
  | Some "." -> loop ()
  | Some ".." -> loop ()
  | Some filename ->
     (* ..... *)
```

`None`의 경우는 쉽다. 재귀적으로 생각하면(!) 만일 `loop`가 호출되고
디렉토리의 끝에 도달했을 때, `loop`는 엔트리들의 리스트를 반환해야 하고
- 그런데 엔트리가 없다 - 따라서 빈 리스트를 반환해야 한다 (`[]`).

`"."`와 `".."`의 경우에는 단순히 무시하고 `loop`를 다시 호출한다.

`loop`가 실제 파일명(`Some filename`에서 매치되는)을 읽을 때는 우리는
무엇을 할까? `pathname`이 파일의 전체 경로라 하자. 이것이 실제
디렉토리인지를 확인하기 위해 파일을 'stat'해 본다. 만일 그것이
디렉토리라면 `read_directory`를 재귀적으로 호출해 반환되는
`Directory something`를 `this`라 하자. `read_directory`의 최종 결과가
`Directory (loop ())`라는 것에 주목하자. 만일 파일이 (디렉토리가 아닌)
실제 파일이라면, `this`가 `File pathname`라 하자. 자 이제 영리한 짓을 해
보자: `this :: loop ()`를 반환한다. 이것은 `loop ()`에 대한 재귀적
호출로 앞에 있는 `this`에서 남아 있는 디렉토리 멤버들(list)을 계산한다.

```ocamltop
let rec read_directory path =
  let dirh = opendir path in
  let rec loop () =
    let filename = readdir_no_ex dirh in
    match filename with
    | None -> []
    | Some "." -> loop ()
    | Some ".." -> loop ()
    | Some filename ->
        let pathname = path ^ "/" ^ filename in
        let stat = lstat pathname in
        let this = if stat.st_kind = S_DIR then
                     read_directory pathname
                   else
                     File pathname in
        this :: loop () in
  Directory (loop ())
```

That's quite a complex bit of recursion, but although this is a made-up
example, it's fairly typical of the complex patterns of recursion found
in real-world functional programs. The two important lessons to take
away from this are:

-   The use of recursion to build a list:

    ```ocaml
    let rec loop () =
      a match or if statement
      | base case -> []
      | recursive case -> element :: loop ()
    ```

    Compare this to our previous `range` function. The pattern of recursion
    is exactly the same:

    ```ocamltop
    let rec range a b =
      if a > b then []            (* Base case *)
      else a :: range (a+1) b     (* Recursive case *)
    ```

-   The use of recursion to build up trees:

    ```ocaml
    let rec read_directory path =
      (* blah blah *)
      if file-is-a-directory then
        read_directory path-to-file
      else
        Leaf file
    ```

    All that remains now to make this a working program is a little bit of
    code to call `read_directory` and display the result:

    ```ocaml
    let path = Sys.argv.(1) in
    let fs = read_directory path in
    print_endline (string_of_filesystem fs)
    ```

###  Addendum
After I posted this example to the caml-list mailing list I received
many follow-ups. (You can [read the full
thread](http://caml.inria.fr/pub/ml-archives/caml-list/2003/06/2732fbf1bed1ae50fefb6ea410ea9955.en.html).)

First of all there is a basic fault with `read_directory` directory
which will cause it to fail if you try to run it on very large directory
structures. I don't explicitly call `closedir` to close the directory
handle. The garbage collector doesn't help, because in OCaml the garbage
collector does **not** collect and close open file and directory
handles.

The fix is pretty trivial: add a call to `closedir` at the end of the
`read_directory` function:

```ocaml
let rec read_directory path =
  let dirh = opendir path in
    (* ... *)
  let result = Directory (loop ()) in
  closedir dirh;
  result
```
Next up is the issue of `readdir` throwing an exception in a rather
"unexceptional" situation, namely `End_of_file`. I don't agree that
throwing an exception in this case is the right thing to do. In typical
programs I want to never have to write a `try ... with` clause, because
exceptions are supposed to mean "something really bad happened which I'm
not prepared to deal with", like running out of disk space or memory.
Throwing an exception as part of the routine running of a function
(every program which uses `readdir` *has* to be prepared to handle
`End_of_file`), that's not an exceptional situation.

However, Eric Cooper came up with a way to write the function and check
the exception, and this highlights another frequent technique used by
functional programmers. Namely, passing an **accumulator** which
contains the result of the function call, but passed as an *argument* to
the function (!) Really the accumulator means "this is the result so
far", so in the exceptional case (`End_of_file`) we give up and return
the result so far. Here is his code with all the references to the
accumulator argument in red:

```ocamltop
let rec read_filesystem path =
  if (lstat path).st_kind = S_DIR then
    Directory (read_directory path)
  else
    File path
  
and read_directory path =
  let dirh = opendir path in
  let rec loop entries =
    try
      match readdir dirh with
      | "." | ".." -> loop entries
      | filename ->
	     loop (read_filesystem (path ^ "/" ^ filename) :: entries)
    with End_of_file -> entries in
  let list = loop [] in
  closedir dirh;
  list
```
Notice `End_of_file -> entries` which means "when we get the exception,
give up and return the result so far".

Next up - it was pointed out that the easiest way to do this is actually
not to use recursion at all, but instead to do the loop imperatively (a
while loop is probably best) and have a reference to a list to store the
ongoing accumulated result. Because `readdir` throws an exception, we
have a simple way to break out of the while loop, *and* in the
`with`-clause we can just return `!list` (dereference the reference to
the list of entries we've built up).

It all works nicely, and proves that writing code imperatively is often
best, *particularly* as in this case where
`opendir ... readdir ... closedir` is essentially an imperative API,
designed for C programmers. It's no surprise, therefore, that the
imperative solution is easier. OCaml, not being a [bondage and
discipline
language](http://dictionary.reference.com/browse/bondage-and-discipline+language),
doesn't mind you using the imperative approach when it makes sense.

Here is the outline of the imperative approach by Fabrice Le Fessant:

```ocaml
let list = ref [] in
let dir = opendir "......." in
try
  while true do
    match readdir dir with
    | "." | ".." -> ()
    | filename -> list := filename :: !list
  done;
  assert false
with End_of_file -> !list
```
###  Recursion example: maximum element in a list
Remember the basic recursion pattern for lists:

```ocaml
let rec loop () =
  a match or if statement
  | base case -> []
  | recursive case -> element :: loop ()
```
The key here is actually the use of the match / base case / recursive
case pattern. In this example - finding the maximum element in a list -
we're going to have two base cases and one recursive case. But before I
jump ahead to the code, let's just step back and think about the
problem. By thinking about the problem, the solution will appear "as if
by magic" (I promise you :-)

First of all, let's be clear that the maximum element of a list is just
the biggest one. eg. The maximum element of the list `[1; 2; 3; 4; 1]`
is `4`.

Are there any special cases? Yes there are. What's the maximum element
of the empty list `[]`? There *isn't one*. If we are passed an empty
list, we should throw an error.

What's the maximum element of a single element list such as `[4]`?
That's easy: it's just the element itself. So `list_max [4]` should
return `4`, or in the general case, `list_max [x]` should return `x`.

What's the maximum element of the general list `x :: remainder` (this is
the "cons" notation for the list, so `remainder` is the tail - also a
list)?

Think about this for a while. Suppose you know the maximum element of
`remainder`, which is, say, `y`. What's the maximum element of
`x :: remainder`? It depends on whether `x > y` or `x <= y`. If `x` is
bigger than `y`, then the overall maximum is `x`, whereas conversely if
`x` is less than `y`, then the overall maximum is `y`.

Does this really work? Consider `[1; 2; 3; 4; 1]` again. This is
`1 :: [2; 3; 4; 1]`. Now the maximum element of the remainder,
`[2; 3; 4; 1]`, is `4`. So now we're interested in `x = 1` and `y = 4`.
That head element `x = 1` doesn't matter because `y = 4` is bigger, so
the overall maximum of the whole list is `y = 4`.

Let's now code those rules above up, to get a working function:

```ocamltop
  let rec list_max xs =
    match xs with
    | [] ->   (* empty list: fail *)
	   failwith "list_max called on empty list"
    | [x] -> (* single element list: return the element *)
	   x
    | x :: remainder -> (* multiple element list: recursive case *)
	   max x (list_max remainder)
```
I've added comments so you can see how the rules / special cases we
decided upon above really correspond to lines of code.

Does it work?

```ocamltop
list_max [1; 2; 3; 4; 1];;
list_max [];;
list_max [5; 4; 3; 2; 1];;
list_max [5; 4; 3; 2; 1; 100];;
```
Notice how the solution proposed is both (a) very different from the
imperative for-loop solution, and (b) much more closely tied to the
problem specification. Functional programmers will tell you that this is
because the functional style is much higher level than the imperative
style, and therefore better and simpler. Whether you believe them is up
to you. It's certainly true that it's much simpler to reason logically
about the functional version, which is useful if you wanted to formally
prove that `list_max` is correct ("correct" being the mathematical way
to say that a program is provably bug-free, useful for space shuttles,
nuclear power plants and higher quality software in general).

###  Tail recursion
Let's look at the `range` function again for about the twentieth time:

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a+1) b
```
I'm going to rewrite it slightly to make something about the structure
of the program clearer (still the same function however):

```ocamltop
let rec range a b =
  if a > b then []
  else
    let result = range (a+1) b in
    a :: result
```
Let's call it:

```ocamltop
List.length (range 1 10);;
List.length (range 1 1000000);;
```
Hmmm ... at first sight this looks like a problem with recursive
programming, and hence with the whole of functional programming! If you
write your code recursively instead of iteratively then you necessarily
run out of stack space on large inputs, right?

In fact, wrong. Compilers can perform a simple optimisation on certain
types of recursive functions to turn them into while loops. These
certain types of recursive functions therefore run in constant stack
space, and with the equivalent efficiency of imperative while loops.
These functions are called **tail-recursive functions**.

In tail-recursive functions, the recursive call happens last of all.
Remember our `loop ()` functions above? They all had the form:

```ocaml
let rec loop () =
  (* do something *)
  loop ()
```
Because the recursive call to `loop ()` happens as the very last thing,
`loop` is tail-recursive and the compiler will turn the whole thing into
a while loop.

Unfortunately `range` is not tail-recursive, and the longer version
above shows why. The recursive call to `range` doesn't happen as the
very last thing. In fact the last thing to happen is the `::` (cons)
operation. As a result, the compiler doesn't turn the recursion into a
while loop, and the function is not efficient in its use of stack space.

Now recall we discussed in the addendum above Eric Cooper's
"accumulator" technique, and I said that this technique was widely used
in functional programming. We will now see why this is the case. It's
because it allows you to write functions such as `range` above in a
tail-recursive manner, which means they will be efficient and work
properly on large inputs.

Let's plan our rewritten `range` function which will use an accumulator
argument to store the "result so far":

```ocaml
let rec range2 a b accum =
  (* ... *)
  
let range a b =
  range2 a b []
```
(I could and probably should have used a nested function here.)

The `accum` argument is going to accumulate the result. It's the "result
so far". We pass in the empty list ("no result so far"). The easy case
is when `a > b`:

```ocaml
let rec range2 a b accum =
  if a > b then accum
  else
    (* ... *)
```
If `a > b` (ie. if we've reached the end of the recursion), then stop
and return the result (`accum`).

Now the trick is to write the `else`-clause and make sure that the call
to `range2` is the very last thing that we do, so the function is
tail-recursive:

```ocamltop
let rec range2 a b accum =
  if a > b then accum
  else range2 (a+1) b (a :: accum)
```
There's only one slight problem with this function: it constructs the
list backwards! However, this is easy to rectify by redefining range as:

```ocamltop
let range a b = List.rev (range2 a b []);;
```
It works this time, although it's a bit slow to run because it really
does have to construct a list with a million elements in it:

```ocamltop
List.length (range 1 1000000)
```
The following implementation is twice as fast as the previous one,
because it does not need to reverse a list:

```ocamltop
let rec range2 a b accum =
  if b < a then accum
  else range2 a (b-1) (b :: accum);;
  
let range a b =
  range2 a b [];;
```
That was a brief overview of tail recursion, but in real world
situations determining if a function is tail recursive can be quite
hard. What did we really learn here? One thing is that recursive
functions have a dangerous trap for inexperienced programmers. Your
function can appear to work for small inputs (during testing), but fail
catastrophically in the field when exposed to large inputs. This is one
argument *against* using recursive functions, and for using explicit
while loops when possible.

## Mutable records, references (again!) and arrays
Previously we mentioned records in passing. These are like C `struct`s:

```ocamltop
type pair_of_ints = { a : int; b : int };;
{a=3; b=5};;
{a=3};;
```
One feature which I didn't cover: OCaml records can have mutable fields.
Normally an expression like `{a = 3; b = 5}` is an immutable, constant
object. However if the record has \<dfn\>mutable fields\</dfn\>, then
there is a way to change those fields in the record. This is an
imperative feature of OCaml, because functional languages don't normally
allow mutable objects (or references or mutable arrays, which we'll look
at in a moment).

Here is an object defined with a mutable field. This field is used to
count how many times the object has been accessed. You could imagine
this being used in a caching scheme to decide which objects you'd evict
from memory.

```ocamltop
type name = { name : string; mutable access_count : int }
```
Here is a function defined on names which prints the `name` field and
increments the mutable `access_count` field:

```ocamltop
let print_name name =
  print_endline ("The name is " ^ name.name);
  name.access_count <- name.access_count + 1
```
Notice a strange, and very non-functional feature of `print_name`: it
modifies its `access_count` parameter. If you read chapter 5 closely,
you'll see that this function is not "pure". OCaml is a functional
language, but not to the extent that it forces functional programming
down your throat.

Anyway, let's see `print_name` in action:

```ocamltop
let n = { name = "Richard Jones"; access_count = 0 };;
n;;
print_name n;;
n;;
print_name n;;
n;;
```
Only fields explicitly marked as `mutable` can be assigned to using the
`<-` operator. If you try to assign to a non-mutable field, OCaml won't
let you:

```ocamltop
n.name <- "John Smith";;
```
References, with which we should be familiar by now, are implemented
using records with a mutable `contents` field. Check out the definition
in `Pervasives`:

```ocamltop
type 'a ref = { mutable contents : 'a }
```
And look closely at what the OCaml toplevel prints out for the value of
a reference:

```ocamltop
let r = ref 100;;
```
Arrays are another sort of mutable structure provided by OCaml. In
OCaml, plain lists are implemented as linked lists, and linked lists are
slow for some types of operation. For example, getting the head of a
list, or iterating over a list to perform some operation on each element
is reasonably fast. However, jumping to the n<sup>th</sup> element of a
list, or trying to randomly access a list - both are slow operations.
The OCaml `Array` type is a real array, so random access is fast, but
insertion and deletion of elements is slow. `Array`s are also mutable so
you can randomly change elements too.

The basics of arrays are simple:

```ocamltop
let a = Array.create 10 0;;
for i = 0 to Array.length a - 1 do
  a.(i) <- i
done;;
a;;
```
Notice the syntax for writing arrays: `[| element; element; ... |]`

The OCaml compiler was designed with heavy numerical processing in mind
(the sort of thing that FORTRAN is traditionally used for), and so it
contains various optimisations specifically for arrays of numbers,
vectors and matrices. Here is some benchmark code for doing dense matrix
multiplication. Notice that it uses for-loops and is generally very
imperative in style:

```ocamltop
let size = 30
  
let mkmatrix rows cols =
  let count = ref 1
  and last_col = cols - 1
  and m = Array.make_matrix rows cols 0 in
  for i = 0 to rows - 1 do
    let mi = m.(i) in
    for j = 0 to last_col do
      mi.(j) <- !count;
      incr count
    done;
  done;
  m
  
let rec inner_loop k v m1i m2 j =
  if k < 0 then v
  else inner_loop (k - 1) (v + m1i.(k) * m2.(k).(j)) m1i m2 j
  
let mmult rows cols m1 m2 m3 =
  let last_col = cols - 1
  and last_row = rows - 1 in
  for i = 0 to last_row do
    let m1i = m1.(i) and m3i = m3.(i) in
    for j = 0 to last_col do
      m3i.(j) <- inner_loop last_row 0 m1i m2 j
    done;
  done
  
let () =
  let n =
    try int_of_string Sys.argv.(1)
    with Invalid_argument _ -> 1
  and m1 = mkmatrix size size
  and m2 = mkmatrix size size
  and m3 = Array.make_matrix size size 0 in
  for i = 1 to n - 1 do
    mmult size size m1 m2 m3
  done;
  mmult size size m1 m2 m3;
  Printf.printf "%d %d %d %d\n" m3.(0).(0) m3.(2).(3) m3.(3).(2) m3.(4).(4)
```
