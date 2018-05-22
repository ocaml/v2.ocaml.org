<!-- ((! set title Comparison of Standard Containers !)) ((! set learn !)) -->

*Table of contents*

# 표준 컨테이너의 비교
이 글은 OCaml 언어나 OCaml 표준 라이브러리에서 제공하는 서로 다른 컨테이너 타입들에 대한 대략적인 비교이다. 매 경우, n은 컨테이너 내의 유효한 원소의 수를 지칭한다.

몇몇 연산에 big-O로 제시된 비용이 현재의 구현에 의거할 뿐 공식 documentation에 의해 보장되는 것이 아님에 주의하라. 현재의 비용보다 더 나빠지진 않을 것이다. 더 자세한 정보를 원한다면, 각 모듈에 대한 documentation을 읽어야 한다. 구현된 코드를 읽어보는 것도 유익하다.

## List : 불변 단일 연결 리스트 (Singly Linked List)
원소를 추가하는 것은 항상 원소 x와 리스트 tl로부터 새로운 리스트 l을 만든다. tl은 변경되지 않고, 복사되지도 않는다.

* 원소 "추가" : O(1), cons 연산자 `::` 를 사용
* 길이 계산 : O(n), 함수 `List.length`
* i번째 항목 접근 : O(i)
* 원소 찾기 : O(n)

적합한 용도 : I/O, 패턴 매칭

그리 효율적이지는 않은 용도 : 무작위 접근(random access), 색인 달린 원소(indexed element)

## Array와 string : 가변 벡터
Array와 string은 매우 유사하다. string은 char(혹은 byte)를 저장하는데 특화되어, 몇 가지 편리한 문법를 제공하고 원소들을 조밀하게 저장한다. 
원소를 추가하는 것은 항상 원소 x와 리스트 tl로부터 새로운 리스트 l을 만든다. tl은 변경되지 않고, 복사되지도 않는다.

* 원소 "추가" : O(n)
* 길이 계산 : O(1), 함수 `Array.length`, `String.length`
* i번째 항목 접근 : O(1)
* 원소 찾기 : O(n)

적합한 용도 : 크기가 알려진 집합, 정수 색인 접근, in-place 수정. 기본 array와 string은 고정 길이를 가진다. 확장 가능한 string를 위해서는 표준 Buffer 타입이 사용 가능하다. (아래 참조)

## Set과 Map : 불변 트리
List 처럼, 이들은 불변이며 subtree를 공유할 수도 있다. 이들은 이전 버전의 집합을 보존하는데 좋은 해결책이다. 

* 원소 "추가" : O(log n)
* 원소 수 계산 : O(n)
* 원소 찾기 : O(log n)

Set과 Map은 컴파일과 메타-프로그래밍에서 아주 유용하지만, 이외의 상황에서는 해시 테이블이 더욱 적합하다. (아래 참조)

## Hashtbl : 자동으로 성장하는 해시 테이블
OCaml의 Hashtbl (해시 테이블)은 (key, data) 쌍을 한 곳에 저장하기 좋은 자료구조이다.

* 원소 추가 : 초기 테이블의 크기가 삽입된 원소 수 보다 크다면 O(1); 초기 테이블의 크기보다 훨씬 많은 n개의 원소가 삽입되어 있다면 평균 O(log n)
* 원소 수 계산 : O(1)
* 원소 찾기 : O(1)

## Buffer: 확장 가능한 string
Buffer는 byte의 sequence를 한데 모으는데 효율적이다. 가변적이다.

* char 추가 : 초기 Buffer가 충분히 크다면 O(1); 초기 Buffer의 크기보다 훨씬 많은 n개의 byte가 삽입되어 있다면 평균 O(log n)
* 길이 계산 : O(1)
* i번째 항목 접근 : O(1)

## Queue
OCaml의 Queue은 가변 first-in-first-out (FIFO) 자료구조이다.

* 원소 추가 : O(1)
* 최상부 원소 접근 : O(1)
* 길이 계산 : O(1)

## Stack
OCaml의 Stack은 가변 last-in-first-out (LIFO) 자료구조이다. 가변이라는 점만 제외하면 (예를 들어 원소를 추가하는 것이 새로운 Stack을 만들지 않는다.) List와 거의 같다.

* 원소 추가 : O(1)
* 최상부 원소 접근 : O(1)
* 길이 계산 : O(1)

