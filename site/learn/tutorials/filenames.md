<!-- ((! set title Filenames !)) ((! set learn !)) -->

# Filenames
This is a reference to the standard **filenames** and extensions used by
various parts of the OCaml build system.

Note: There is an [extended mailing list posting about filenames used by
OCaml
here](http://caml.inria.fr/pub/ml-archives/caml-list/2008/09/2bc9b38171177af5dc0d832a365d290d.en.html "http://caml.inria.fr/pub/ml-archives/caml-list/2008/09/2bc9b38171177af5dc0d832a365d290d.en.html").

## Source and object files
The basic source, object and binary files, with comparisons to C
programming:



<table>
<thead>
<tr class="header">
<th align="left">Purpose</th>
<th align="left">C</th>
<th align="left">Bytecode</th>
<th align="left">Native code</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Source code</td>
<td align="left">*.c</td>
<td align="left">*.ml</td>
<td align="left">*.ml</td>
</tr>
<tr class="even">
<td align="left">Header files<sup>1</sup></td>
<td align="left">*.h</td>
<td align="left">*.mli</td>
<td align="left">*.mli</td>
</tr>
<tr class="odd">
<td align="left">Object files</td>
<td align="left">*.o</td>
<td align="left">*.cmo</td>
<td align="left">*.cmx<sup>2</sup></td>
</tr>
<tr class="even">
<td align="left">Library files</td>
<td align="left">*.a</td>
<td align="left">*.cma</td>
<td align="left">*.cmxa<sup>3</sup></td>
</tr>
<tr class="odd">
<td align="left">Binary programs</td>
<td align="left">prog</td>
<td align="left">prog</td>
<td align="left">prog.opt<sup>4</sup></td>
</tr>
</tbody>
</table>


###  Notes
1. In C the header files describe the functions, etc., but only by
 convention. In OCaml, the *.mli file is the exported signature of
 the [module](modules.html "modules"), and the compiler strictly
 enforces it.<br />
 In most cases for a module called `Foo` you will find two files:
 `foo.ml` and `foo.mli`. `foo.ml` is the implementation and `foo.mli`
 is the interface or signature.<br />
 Notice also that the first letter of the file is turned to
 uppercase to get the module name. For example, Extlib contains a
 file called `uTF8.mli` which is the signature of a module called
 `UTF8`.
1. There is also a corresponding *.o file which contains the actual
 machine code, but you can usually ignore this file.
1. There is also a corresponding *.a file which contains the actual
 machine code, but you can usually ignore this file.
1. This is the convention often used by OCaml programs, but in fact you
 can name binary programs however you want.

## *.cmi files
`*.cmi` files are intermediate files which are compiled forms of the
`.mli` (interface or "header file").

To produce them, just compile the `.mli` file:

```
ocamlc -c foo.mli
```
