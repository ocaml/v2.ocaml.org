<!-- ((! set title Working on dependent projects with ocamlbuild !)) ((! set learn !)) -->

# Working on dependent projects with ocamlbuild
If you are on a file system that supports symbolic links, the following
setup allows to work simultaneously on a `base` project and two
independent projects `p1` and `p2` that depend on `base`. The setup is
very simple and any change to the sources of `base` automatically gets
propagated in the builds of `p1` and `p2`.

Suppose the sources are distributed as follows : `<pre>
base/src
p1/src
p2/src
</pre>` Simply create these symbolic links : `<pre>
ln -s ../base/src p1/base
ln -s ../base/src p2/base
</pre>`

and modify `p1` and `p2`'s `_tags` file as follows : `<pre>
echo "<base>: include" >> p1/_tags
echo "<base>: include" >> p2/_tags
</pre>`

The rest will be sorted out by ocamlbuild. When a change is done in
`base/src` nothing needs to be recompiled there: new builds of `p1` or
`p2` will automatically use the latest version of `base`'s sources.

## Internal and external project interface
Sometimes in the `base` project you want to have both an internal and an
external interface for module definitions. For example in the following
layout assume `b.ml` accesses definitions in `a.ml` that clients of the
`base` project should not see. `<pre>
base/src/a.ml
base/src/b.ml
</pre>`

In order to do this, adjust the directory layout to :

`<pre>
base/src/internal/a.ml
base/src/internal/b.ml
base/src/base.ml
base/src/base.mli
</pre>`

With `base.ml` as follows : `<pre>
module A = A
module B = B
</pre>` and `base.mli` restricting the signatures of A and B as needed.
Finally add the following `p1/myocamlbuild.ml` and `p2/myocamlbuild.ml`
plugins. `<pre>
open Ocamlbuild_plugin;;
open Ocamlbuild_pack;;
dispatch begin function
| After_rules ->
    Pathname.define_context "base" ["base/internal"]
| _ -> ()
end;;
</pre>`

## Caveats
+     Scalability. Since both `p1` and `p2` build their own version of
 `base`, this means longer build times after an `ocamlbuild -clean`.
 On the other hand with ocamlbuild you don't need to clean as much as
 you had with makefiles.

+     If `base/src` needs a plugin to build you will have to integrate it
 into `p1` and `p2`'s myocamlbuild.ml. This caveat may be removed in
 the future once ocamlbuild supports multiple plugins. Note that if
 you are only using tagged caml sources nothing special needs to be
 done, just put your tags in `base/src/_tags`.

