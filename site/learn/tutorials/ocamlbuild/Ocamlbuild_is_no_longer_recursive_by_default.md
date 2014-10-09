# Ocamlbuild is no longer recursive by default
In the release 3.10.0 ocamlbuild had the default tag declaration:

`true: traverse`

Look at [the traverse tag](The_traverse_tag.html) for more
information about this tag.

The problem with this default setting is that when starting, ocamlbuild
wants to read deeply the whole current directory. For instance running
ocamlbuild -documentation in your home could take a while.

For this ocamlbuild only recursive when:

- You give it the -r flag.
- You have a _tags or myocamlbuild.ml file in your directory.

