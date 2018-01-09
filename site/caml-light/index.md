# Caml Light

## Overview

Caml Light is a lightweight, portable implementation of the core Caml
language that was developed in the early 1990's, as a precursor to
OCaml. It used to run on most Unix machines, as well as PC under
Microsoft Windows. The implementation is obsolete, no longer actively
maintained, and will be removed eventually. We recommend switching
immediately to its successor, OCaml.

Caml Light is implemented as a bytecode compiler, and fully
bootstrapped.  The runtime system and bytecode interpreter is written
in standard C, hence Caml Light is easy to port to almost any 32 or 64
bit platform. The whole system is quite small: about 100K for the
runtime system, and another 100K of bytecode for the compiler. Two
megabytes of memory is enough to recompile the whole system.

Debugging is possible by
[tracing function calls in the same way as in OCaml](../learn/tutorials/debug.html).
In the example therein, one should write `trace "fib";;` instead of
`#trace fib;;` and `untrace "fib";;` instead of
`#untrace fib;;`. There also exists a debugger, as a user
contribution.

Some common questions are answered in the [FAQ](faq.html).

## Availability

The Caml Light system is open source software, please read its
[license](license.html) for more details.  The
[latest release](releases/) can be freely downloaded on this site,
together with its [user's manual][].  See also
[Functional programming using Caml Light][programming] for an
introduction to functional programming in general and the Caml Light
language in particular.

[user's manual]: http://caml.inria.fr/pub/docs/manual-caml-light/
[programming]: http://caml.inria.fr/pub/docs/fpcl/index.html
