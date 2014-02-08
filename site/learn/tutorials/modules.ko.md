<!-- ((! set title 모듈 !)) ((! set learn !)) -->

*Table of contents*

모듈
====

기본 사용법
-----------

OCaml에서 모든 코드는 모듈 내에 들어 있다. 또한 자주 사용되지 않지만
파일 시스템의 디렉토리와 비슷하게, 모듈 자체가 다른 모듈의 서브 모듈이
될 수 있다.

`amodule.ml`과 `bmodule.ml` 두 파일을 사용해 프로그램을 작성한다고 하면,
각 파일의 이름에 따라 `Amodule`, `Bmodule`라는 이름의 모듈이 자동으로
정의되며 각 모듈들은 해당 파일 내에 입력한 내용을 제공하게 된다.

`amodule.ml` 파일의 내용은 다음과 같다:

```ocaml
let hello () = print_endline "Hello"
```

`bmodule.ml`은 아래와 같다:

```ocaml
Amodule.hello ()
```

보통 파일들은 하나씩 컴파일 된다. 직접 해 보자.

```shell
ocamlopt -c amodule.ml
ocamlopt -c bmodule.ml
ocamlopt -o hello amodule.cmx bmodule.cmx
```

자 이제 우리는 "Hello"를 인쇄하는 훌륭한 실행 파일이 생겼다. 위 코드에서
보이는 것 처럼 어떤 모듈에서 무엇인가에 접근하기 위해서는 (항상 대문자로
시작하는) 모듈의 이름 + 점(.) + 값, 타입 생성자 또는 해당 모듈이
제공하는 무엇인가의 이름을 사용한다.

표준 라이브러리부터 시작해 라이브러리들은 모듈들의 콜렉션을 제공한다.
예를 들어 `List.iter`는 `List` 모듈 내의 `iter` 함수를 지정한다.

자, 어떤 모듈을 자주 사용한다면, 그 모듈의 내용을 바로 접근하고 싶을
수도 있을 것이다. 이를 위해 `open` 지시자를 사용한다. 우리 예에서는
`bmodule.ml` 가 아래와 같이 쓰여질 수 있을 것이다:

```ocaml
open Amodule;;
hello ();;
```

별개의 이야기 이지만, 사람들은 보기 싫은 ";;"를 피하려는 경향이 있기
때문에 아래와 같이 쓰는 것이 더욱 일반적이다:

```ocaml
open Amodule
let () =
  hello ()
```

어쨌건 `open`을 사용하거나 말거나는 개인적인 기호의 문제이다. 어떤
모듈들은 다른 모듈들에서도 사용되는 이름을 제공해, 이름이 겹칠 수도
있다. `List` 모듈이 이런 예이다. 일반적으로 우리는 `open List`라고 하지
않는다. `Printf`와 같은 다른 모듈들이 `printf`와 같이 충돌을 일으켜서는
안되는 이름을 제공하기 때문이다. `Printf.printf`를 반복해서 쓰지 않기
위해 `open Printf`을 파일 맨 앞에 쓰는 것이 훨씬 상식적이다.

우리가 언급한 내용을 보여주는 간단한 예제가 있다:

```ocamltop
open Printf
let my_data = [ "a"; "beautiful"; "day" ]
let () = List.iter (fun s -> printf "%s\n" s) my_data
```

인터페이스와 시그너쳐 (Interfaces and signatures)
------------------------------------------------

모듈은 자신을 사용하는 다른 프로그램들에게 함수, 타입, 서브 모듈 등과
같은 여러가지를 제공할 수 있다. 특별한 지정이 없다면 모듈 내에서 정의된
모든 것은 외부에서 접근이 가능하다. 대체로 개인이 작성한 소규모
프로그램의 경우는 상관 없지만, 모듈이 내부적으로만 사용되는 함수들과
타입들이 아닌 단지 외부에 제공해야 할 것들만 외부로 제공하는 것이 더
나은 상황들이 많이 있다.

이를 위해 우리는 모듈의 구현(implementation)을 가려줄 수 있는 모듈
인터페이스 (module interface)를 정의해야 한다. 모듈이 .ml 파일내에
정의되는 것과 마찬가지로, 해당 모듈 인터페이스 또는 시그너쳐는 .mli
파일에 들어간다. 이 파일은 타입이 명시된 값(value) 등과 같은 것들을 담고
있다. `amodule.ml` 파일을 다시 작성해 보자:

```ocamltop
let message = "Hello"
let hello () = print_endline message
```

위에 따라 `Amodule`은 아래의 인터페이스를 가진다:

```ocaml
val message : string
val hello : unit -> unit
```

다른 모듈은 `message` 값에 직접 접근할 필요가 없다고 해 보자. 제한된
인터페이스를 정의하여 이 값을 숨기고 싶다면, `amodule.mli` 파일은 다음과
같다:

```ocaml
val hello : unit -> unit
(** Displays a greeting message. *)
```

(.mli 파일을
[ocamldoc](http://caml.inria.fr/pub/docs/manual-ocaml/ocamldoc.html)에서
지원하는 포맷을 이용해 문서화 하는 습관을 들이는 것이 좋다.)

.mli 파일은 .ml 파일과 매칭하기 직전에 컴파일 되어야 한다. `ocamlc`를
사용해서 컴파일 할 수 있으며, .ml 파일을 `ocamlopt`를 사용해 네이티브
코드(native code)로 컴파일 할 때도 마찬가지다:

```shell
ocamlc -c amodule.mli
ocamlopt -c amodule.ml
...
```

추상 타입 (Abstract types)
--------------------------

타입 정의는 어떤가? 우리는 함수와 같은 값(역주: OCaml에서는 함수도
값이다는 것을 기억하기 바란다)들이 .mli 파일에서 이들의 이름, 타입을
함께 명기하여 익스포트 할 수 있는 것을 보았다. 예를 들어 다음과 같다.

```ocaml
val hello : unit -> unit
```

하지만 모듈들은 종종 새로운 타입을 정의한다. 날짜를 표현하는 간단한
레코드 타입을 정의해보자:

```ocaml
type date = { day : int;  month : int;  year : int }
```

.mli 파일을 쓸 때는 다음의 네 가지 (두 가지가 아니라) 선택이 있다.

1.  시그너쳐에서 타입을 완전히 제외한다.
2.  타입 정의를 시그너쳐로 Copy & Paste 한다.
3.  타입을 추상화한다: 오직 이름만 지정한다.
4.  레코드 필드를 읽기 전용으로 만든다: `type date = private { ... }`

위에서 세번째 경우는 다음과 같은 코드가 될 수 있다:

```ocaml
type date
```

여기서 모듈의 사용자들은 타입 `date`의 객체를 조작할 수 있지만, 레코드
내의 필드를 직접 접근하는 것은 불가능하다. 사용자들은 모듈이 제공하는
함수를 써야만 한다. 모듈이 날짜 생성, 두 날짜간의 차이 계산, 날수를
해수로 바꾸는 세개의 함수를 제공한다고 가정해보자:

```ocaml
type date
val create : ?days:int -> ?months:int -> ?years:int -> unit -> date
val sub : date -> date -> date
val years : date -> float
```

요점은 오직 `create`, `sub` 함수를 통해서 `date` 레코드를 만들 수 있다는
것이다. 따라서 모듈의 사용자가 잘못된 레코드를 생성하는 것 자체가
불가능하다. 사실 우리의 구현이 레코드를 사용하고 있지만, 이를 레코드가
아닌 다른 자료 구조로 바꿀 수도 있으며, 이 변경이 모듈을 사용하는 다른
코드들에 어떤 문제도 일으키지 않는다는 것을 알 수 있다. 즉 어떤
라이브러리가 같은 인터페이스를 제공하는 한 자료 구조를 포함한 내부
구조가 바뀌더라도 외부의 모듈에서는 동일하게 사용할 수 있다는 것이다.

서브 모듈 (Submodules)
----------------------

### 서브 모듈 구현 (Submodule implementation)

우리는 `example.ml`이 자동으로 `Example`라는 이름의 모듈이 된다는 것을
보았다. 모듈 시그너쳐는 가능한 넓은 범위에서 자동으로 만들어지거나,
`example.mli` 파일을 작성하여 제한할 수도 있다.

어떤 모듈은 파일 내에서 명시적으로 정의할 수 있다는 것도 이야기 하였다.
이것이 현재 모듈의 서브 모듈이 된다. 아래 `example.ml` 파일을 보자:

```ocaml
module Hello = struct
  let message = "Hello"
  let hello () = print_endline message
end
let goodbye () = print_endline "Goodbye"
let hello_goodbye () =
  Hello.hello ();
  goodbye ()
```

아래의 예에서 두 단계의 모듈이라는 것을 확인할 수 있다:

```ocaml
let () =
  Example.Hello.hello ();
  Example.goodbye ()
```

### 서브모듈 인터페이스

서브모듈의 인터페이스 역시 제한할 수 있다. 이를 모듈 타입이라 한다.
`example.ml` 파일에서 이를 보자:

```ocaml
module Hello : sig
 val hello : unit -> unit
end = 
struct
  let message = "Hello"
  let hello () = print_endline message
end
  
(* 이 지점에서, Hello.message는 더 이상 접근이 불가능하다. *)
let goodbye () = print_endline "Goodbye"
let hello_goodbye () =
  Hello.hello ();
  goodbye ()
```

위에서 `Hello` 모듈의 정의는 `hello.mli`/`hello.ml` 파일 쌍의 경우와
동등하다. 모든 내용을 하나의 코드 블럭에 쓰는 것은 우아하지 못하므로,
보통은 각 모듈 시그너쳐를 따로 정의하는 것을 선호한다:

```ocaml
module type Hello_type = sig
 val hello : unit -> unit
end
  
module Hello : Hello_type = struct
  ...
end
```

`Hello_type` 는 지명된 모듈 타입이며(named module type), 다른 모듈
인터페이스를 정의하기 위해 재사용 될 수 있다.

비록 특정 경우에 서브모듈이 유용할 수 있지만, 진정한 효용은 functor와
함께할 때이다. 다음 섹션으로 넘어가보자.

펑터 (Functors)
---------------

펑터는 아마 Ocaml의 기능 중 가장 복잡한 것일 테지만, 성공적인 OCaml
프로그래머가 되기 위해 펑터를 광범위하게 써야할 필요는 없다. 사실,
아마도 펑터를 직접 정의할 일이 결코 없을테지만, 표준 라이브러리에서
펑터를 분명히 보게 될 것이다. 펑터는 Set과 Map 모듈을 사용하는 유일한
방법이지만, 사용 그 자체는 그다지 어렵지 않다. (역주: 용어 Functor의
한글 번역은 위키백과의
[펑터](http://ko.wikipedia.org/wiki/%ED%8E%91%ED%84%B0)를
참조했다.)

### 펑터는 무엇이며 왜 필요한가?

펑터는 다른 모듈에 의해 매개화되는(parametrized) 모듈이다. 함수가
인수(arguments)라는 다른 값(value)으로 매개화 되는 것과 같다.

기본적으로 OCaml에서 직접적으로 가능하지는 않지만, 펑터는 타입을 값으로
매개화 할 수 있게 해 준다. 예를들어 우리는 int n을 받아, 길이가 n인
배열에 대해서만 동작하는 배열 연산들의 콜렉션을 돌려주는 펑터를 정의할
수 있다. 만일 프로그래머가 실수로 이러한 펑터에 (역주: 원문에는
function이라 되어 있지만 맥락상 펑터가 맞는 것으로 보임) 보통의 배열을
넘긴다면, 컴파일 에러가 날 것이다. 만일 우리가 펑터를 사용하지 않고 표준
배열 타입을 사용한다면, 컴파일러는 에러를 검지하지 못할 것이고, 훨씬 더
나쁜 결과로 런타임 에러를 야기할 것이다.

### 기존의 펑터는 어떻게 쓰나?

표준 라이브러리는 `Make` 펑터를 제공하는 `Set`를 정의한다. 이 펑터는 한
개의 인자를 받는데, 이 인자는 (최소한) 다음 두가지를 제공하는 모듈이다:
`t`로 지정하는 요소의 타입과 `compare`로 지정되는 비교 함수이다. 펑터의
요체는 동일한 비교 함수가 항상 사용되는 것을 보증해 주는 것이다.
프로그래머가 실수를 하는 경우에도.

예를들어 우리가 정수의 집합을 사용하기 원한다면, 다음과 같이 할 수 있다:

```ocamltop
module Int_set = Set.Make (struct
                             type t = int
                             let compare = compare
                           end)
```

문자열 집합의 경우, 표준 라이브러리가 타입 `t`와 함수 `compare`의
`String` 모듈을 제공하기 때문에 훨씬 쉽다. 주의 깊게 따라 왔다면, 문자열
집합을 조작하는 모듈을 어떻게 만드는지는 짐작했을 것이다:

```ocamltop
module String_set = Set.Make (String)
```

(괄호는 꼭 있어야 한다)

### 펑터는 어떻게 정의하나?

하나의 인자를 가진 펑터는 다음과 같이 정의한다:

```ocaml
module F (X : X_type) = struct
  ...
end
```

`X`는 인자로 넘겨질 모듈이고 `X_type`는 이 모듈의 시그너쳐 이며 꼭
필요하다.

반환되는 모듈의 시그너쳐 역시 다음 문법을 사용해 제한할 수 있다:

```ocaml
module F (X : X_type) : Y_type =
struct
  ...
end
```

또는 이를 .mli 파일에 지정할 수도 있다:

```ocaml
module F (X : X_type) : Y_type
```

전반적으로 펑터의 문법은 터득하기 어렵다. 가장 좋은 방법은 표준
라이브러리의 `set.ml` 이나 `map.ml`의 소스 코드를 보는 것일 터이다.
마지막 주석: 펑터는 성능 향상이 아니라, 프로그래머가 정확한 프로그램을
작성하는 것을 돕기 위한 것이다. 펑터의 소스 코드에 대한 접근이 가능해야
하는 ocamldefun과 같은 디펑터라이저 (defunctorizer)를 사용하지 않는
경우에도 런타임 에러의 가능성은 있다.

모듈의 실용적인 조작
-------------------

### 모듈의 인터페이스를 표시하기

`ocaml` 톱레벨에서 `List`와 같은 기존 모듈의 내용을 표시하기 위해 아래의
트릭이 사용된다:

```ocamltop
module M = List;;
```

아니면, 대부분의 라이브러리에 대한 온라인 문서를 참조하거나 labltk
(OCaml용 Tk GUI)에 들어 있는 `ocamlbrowser`를 사용할 수 있다.

### 모듈을 포함시키기

표준 `List` 모듈에서 필요한 어떤 함수가 빠져 있으며, 이 함수를 이 모듈의
일부로 만들고 싶다고 하자. 아래의 `extensions.ml`과 같은 파일을 통해
우리는 `include` 지시자로 같은 효과를 낼 수 있다:

```ocamltop
module List = struct
  include List
  let rec optmap f = function
    | [] -> []
    | hd :: tl ->
       match f hd with
       | None -> optmap f tl
       | Some x -> x :: optmap f tl
end
```

위 파일은 `Extensions.List`라는 새로운 모듈을 만드는데, 표준 `List`
모듈의 모든 내용과 함께 `optmap`라는 새로운 함수가 생겼다. 다른 파일에서
기본 `List` 모듈을 오버라이드(override)하기 위해 우리가 해야할 것은 단지
.ml 파일의 맨 처음에 `open Extensions`를 써 주는 것 뿐이다:

```ocaml
open Extensions
...
List.optmap ...
```
