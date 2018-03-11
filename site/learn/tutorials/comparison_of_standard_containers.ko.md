<!-- ((! set title Comparison of Standard Containers !)) ((! set learn !)) -->

*Table of contents*

# 표준 컨테이너의 비교
This is a rough comparison of the different container types that are
provided by the OCaml language or by the OCaml standard library. In each
case, n is the number of valid elements in the container.

Note that the big-O cost given for some operations reflects the current
implementation but is not guaranteed by the official documentation.
Hopefully it will not become worse. Anyway, if you want more details,
you should read the documentation about each of the modules. Often, it
is also instructive to read the corresponding implementation.

See also: [Standard Library
Examples](standard_library_examples.html "Standard Library Examples")

## List : 불변 단일 연결 리스트 (Singly Linked List)
원소를 추가하는 것은 항상 원소 x와 리스트 tl로부터 새로운 리스트 l을 만든다. tl은 변경되지 않고, 복사되지도 않는다.

* 원소 "추가" : O(1), cons 연산자 `::` 를 사용
* 길이 계산 : O(n), 함수 `List.length`
* i번째 항목 접근 : O(i)
* 원소 찾기 : O(n)

적합한 용도 : I/O, 패턴 매칭

그리 효율적이지는 않은 용도 : 무작위 접근(random access), 색인 달린 원소(indexed element)

## Arrays and strings: mutable vectors
Arrays and strings are very similar. Strings are specialized in storing
chars (bytes), have some convenient syntax and store them compactly.

* "adding" an element: O(n)
* length: O(1), function `Array.length`
* accessing cell i: O(1)
* finding an element: O(n)

Well-suited for sets of elements of known size, access by numeric index,
in-place modification. Basic arrays and strings have a fixed length. For
extensible strings, the standard Buffer type can be used (see below).

## Set and Map: immutable trees
Like lists, these are immutable and they may share some subtrees. They
are a good solution for keeping older versions of sets of items.

* "adding" an element: O(log n)
* returning the number of elements: O(n)
* finding an element: O(log n)

Sets and maps are very useful in compilation and meta-programming, but
in other situations hash tables are often more appropriate (see below).

## Hashtbl: automatically growing hash tables
Ocaml hash tables are mutable data structures, which are a good solution
for storing (key, data) pairs in one single place.

* adding an element: O(1) if the initial size of the table is larger
 than the number of elements it contains; O(log n) on average if n
 elements have been added in a table which is initially much smaller
 than n.
* returning the number of elements: O(1)
* finding an element: O(1)

## Buffer: extensible strings
Buffers provide an efficient way to accumulate a sequence of bytes in a
single place. They are mutable.

* adding a char: O(1) if the buffer is big enough, or O(log n) on
 average if the initial size of the buffer was much smaller than the
 number of bytes n.
* adding a string of k chars: O(k * "adding a char")
* length: O(1)
* accessing cell i: O(1)

## Queue
OCaml queues are mutable first-in-first-out (FIFO) data structures.

* adding an element: O(1)
* taking an element: O(1)
* length: O(1)

## Stack
OCaml stacks are mutable last-in-first-out (LIFO) data structures. They
are just like lists, except that they are mutable, i.e. adding an
element doesn't create a new stack but simply adds it to the stack.

* adding an element: O(1)
* taking an element: O(1)
* length: O(n)

