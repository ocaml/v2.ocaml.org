<!-- ((! set title Performance and Profiling (discussion) !)) -->
<!-- ((! set learn !)) -->

Performance and Profiling (discussion)
======================================

Discussion about [Performance and Profiling](performance_and_profiling.html).

Java dynamic dispatch
---------------------

There are some serious mistakes in the last paragraph:

- Dynamic method dispatch itself is seldom a performance problem. In
  languages without multiple inheritance (e.g. Java) this is usually
  done via one step of pointer indirection. Objects in OCaml are also
  dynamically dispatched. Since this is the point with polymorphism in
  an OO setting.

- Dynamic method dispatch often hinders a compiler to inline function
  and this hits the performance.

- In Java is a dynamic type check (aka cast) much more expensive than
  a dynamic method dispatch.

  [Discuss](https://discuss.ocaml.org/t/creating-a-discuss-thread-for-tutorials-on-ocaml-org/7677)
