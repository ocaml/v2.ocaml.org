<!-- ((! set title Ocamlbuild file rule no longer exists !)) ((! set learn !)) -->

# Ocamlbuild file rule no longer exists
The file_rule function accessible through the plugin interface of
ocamlbuild is no longer available. Indeed its design was flawed, so we
removed it. You can now do a similar job using the rule function and
returning the **Echo\(texts, dest_path\)** command primitive.

