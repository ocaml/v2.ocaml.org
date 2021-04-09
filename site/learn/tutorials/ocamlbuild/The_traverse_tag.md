<!-- ((! set title The traverse tag !)) ((! set learn !)) -->

# The traverse tag
Each time ocamlbuild want to traverse a directory, it checks that the
directory is traversable. To do so it applies tagging rules and look for
the **traverse** tag.

If you have a directory that you want ocamlbuild doesn't traverse it,
just remove the traverse tag from it.

```
"big_directory_without_sources_for_ocamlbuild": -traverse
```

As always with tags, you can also provide a more complex pattern:

```
<{foo,bar}/*> and not "foo/src": -traverse
```

Of course you can also change default behavior:

```
true: -traverse
```

