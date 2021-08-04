<!-- ((! set title OCaml on Windows !)) ((! set platform !)) -->

*Table of contents*

# OCaml on Windows

Full support for OCaml on Windows is actively being worked on and a workable
environment can already be achieved today. A gentle reminder that if you do not
need Windows binaries, then a more stable option is to use WSL2. This is
described on the [up and running page](/learn/tutorials/up_and_running.html).

## opam-repository-mingw

[opam-repository-mingw](https://github.com/fdopen/opam-repository-mingw) is an
[opam repository](https://opam.ocaml.org/doc/Manual.html#Repositories)
containing patches for packages to build and install on Windows as well as
`mingw32` and `mingw64` compiler variants. For a long time this has been
maintained by [fdopen](https://fdopen.github.io/opam-repository-mingw/) along
with [installers](https://fdopen.github.io/opam-repository-mingw/installation/)
to create a custom cygwin environment with opam and OCaml installed.

As of [August 2021](https://fdopen.github.io/opam-repository-mingw/2021/02/26/repo-discontinued/)
the repository will no longer be updated. It is still useful as an overlay to
the [default opam repository](https://github.com/ocaml/opam-repository). This
means if a package exists in `opam-repository-mingw` the opam client will use
that information, otherwise it will fall through to `opam-repository`. To add
`opam-repository` as an underlay to your opam setup (assuming you followed the
manual installation from the [OCaml for Windows](https://fdopen.github.io/opam-repository-mingw/installation/)
site), you can use:

```
opam repo add upstream https://opam.ocaml.org --rank 2
```

This assumes you only have the `opam-repository-mingw` repository for this switch set with
a priority of `1`.

## opam.2.2.0

After the [successful release](https://github.com/ocaml/opam/releases/tag/2.1.0) 
of `opam.2.1.0` the [next version](https://github.com/ocaml/opam/projects/2) of
`opam` will focus on closing the gap to fully supporting Windows. This includes
supporting external dependency installation for Windows and integrating with the
Windows shell. From an `opam-repository` perspective, the `ocaml-base-compiler`
packages will need to support the `mingw64` and `msvc` variants.

## Docker Images

The [`ocaml/opam`](https://hub.docker.com/r/ocaml/opam) docker hub repository
now contains regularly updated Windows images. This includes images using
`msvc` and `mingw`. If you are comfortable with docker, this might be an
easier way to get a working Windows environment on your machine.
