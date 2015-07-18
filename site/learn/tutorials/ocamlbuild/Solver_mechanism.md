<!-- ((! set title Solver mechanism !)) ((! set learn !)) -->

# Solver mechanism
## Rules

Ocamlbuild has rules which say how to build targets. These rules are
similar to those of a Makefile: they contain a list of *dependencies*, a
list of *productions*, and the command that build the productions.

### Triggering rules
When trying to build a target, Ocamlbuild looks for all rules that are
*valid* for this target. A rule is valid for a given target if, and only
if:

- its dependencies can be built (i.e. there is a valid rule for each
 dependency),
- the target name matches one of the rule's productions.

The tags of the target or the dependencies have no effect on whether a
rule is valid or not.

Then, Ocamlbuild tries the first valid rule. Because rules can
discover new dependencies, they can fail if there is no valid rule to
make the new dependencies. In this case, Ocamlbuild continues with the
next valid rule, until a rule succeeds. If all valid rules fail, then
the solver fails to build the target.

### Dynamic dependencies
A rule can generate new dependencies at run-time. For example, imagine
you use the following `example.itarget` file: `bla.byte plop.native`.
When executing the following command: ocamlbuild example.otarget

- Ocamlbuild looks for rules which match `example.otarget` as a
  target.
- There is one such rule, which has one single dependency:
  `example.itarget`.
- The file `example.itarget` already exists, so there is no need to
  build it: the rule is valid, and it is executed.
- The file `example.itarget` is read, and the rule adds two
  dependencies: `bla.byte` and `plop.native`.
- `Ocamlbuild` tries to build these new dependencies before finishing
  to build `example.otarget`.

### Debugging rules
To understand how the solver works, you can simply run Ocamlbuild
using a command such as: `ocamlbuild -classic-display -verbose 10 target`.
You'll get both the backtrace in case of a failure, and the actual names
and order of the rules that are triggered.

This is especially useful if you are developing a plugin and are adding
new rules.

## Tags
All files have tags associated to them. This is the easiest way to
change the behaviour of the rules. To add or delete tags from a file,
use the `_tags` file.

### Holes
When a rule is triggered, the tags of the files may modify the command
of the rule. Commands come with holes in them; these holes are lists of
tags that are replaced by the corresponding options.

For instance, the `ocamlc` command used to compile an `.ml` file to a
`.cmo` file contains a hole. This hole contains the tags of the `.ml`
file, along with some other tags such as `ocaml`, `byte` and `compile`.
When a hole contains the tags `ocaml`, `compile` and `thread`, the
`-thread` option is added to the command, in place of the hole.

So if you try to compile an `.ml` file which is tagged with the `thread`
tag, then the file will be compiled using the `-thread` option.

### Other uses

Some tags, such as `not_hygienic` or `precious`, are not used in holes.
In fact, if you program your own plugin, you may use tags in any way
that suits your needs. But remember that fancy stuff makes it difficult
to understand the semantics of your tag!

