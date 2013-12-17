<!-- ((! set title Map !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Map

## Module Map
Map creates a "mapping". For instance, lets say I have some data that is
users and their associated passwords. I could with the Map module create
a mapping from user names to their passwords. The mapping module not
only does this but it does it fairly efficiently. It also does this in a
functional way. In the example below I am going to do a mapping from
strings to strings. However it is possible to do mappings with all
different types of data.

To create a Map I can do:

```ocamltop
module MyUsers = Map.Make(String);;
```
Ok, we have created the module. Now, lets start putting something into
it. Where do we start? Well, lets try an empty module to begin with:

```ocamltop
let m = MyUsers.empty;;
```
Hummm. An empty module is kind of boring, so lets add some data.

```ocamltop
let m = MyUsers.add "fred" "sugarplums" m;;
```
We have now added "fred" and his password of "sugarplums" to our module.
There is a fairly important point to make here. Once we have added the
string "sugarplums" we have fixed the types of mappings that we can do.
This means our mapping in our module MyUsers is from strings to strings.
If we want a mapping from strings to integers or a mapping from integers
to whatever we will have to create a different mapping.

Lets add in some additional data just for kicks.

```ocamltop
let m = MyUsers.add "tom" "ilovelucy" m;;
let m = MyUsers.add "mark" "ocamlrules" m;;
let m = MyUsers.add "pete" "linux" m;;
```
Now that we have some data inside of our Map module, wouldn't it be nice
to be able to view that data at some point? Lets begin by creating a
simple print function.

```ocamltop
let print_users key password =
  print_string(key ^ " " ^ password ^ "\n");;
```
We have here a function that will take two strings, a key and a pasword,
and print them out nicely, including a new line character at the end.
All we need to do is to have this function applied to our mapping. Here
is what that would look like.

```ocamltop
MyUsers.iter print_users m;;
```
The reason we put our data into a mapping however is probably so we can
quickly find the data. Lets actually show how to do a find.

```ocamltop
MyUsers.find "fred" m;;
```
This should quickly and efficienty return Fred's password: "sugarplums".


