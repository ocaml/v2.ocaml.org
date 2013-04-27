<title>Modules</title>
<body>

<h1><span>Modules</span></h1>

<h2><a name="Basic_usage"></a>Basic usage</h2>

<p>In OCaml, every piece of code is wrapped into a module. Optionally, a module itself can be a submodule of another module, pretty much like directories in a file system-but we don't do this very often.</p>
<p>When you write a program let's say using two files <code>amodule.ml</code> and <code>bmodule.ml</code>, each of these files automatically defines a module named <code>Amodule</code> and a module named <code>Bmodule</code> that provide whatever you put into the files.</p>
<p>Here is the code that we have in our file <code>amodule.ml</code>:</p>
<pre ml:content="ocaml noeval">
let hello () = print_endline &quot;Hello&quot;
</pre>

<p>And here is what we have in <code>bmodule.ml</code>:</p>
<pre ml:content="ocaml noeval">
Amodule.hello ()
</pre>

<p>Usually files are compiled one by one, let's do it:</p>
<pre>
ocamlopt -c amodule.ml
ocamlopt -c bmodule.ml
ocamlopt -o hello amodule.cmx bmodule.cmx
</pre>

<p>Now we have a wonderful executable that prints &quot;Hello&quot;. As you can see, if you want to access anything from a given module, use the name of the module (always starting with a capital) followed by a dot and the thing that you want to use. It may be a value, a type constructor, or anything else that a given module can provide.</p>
<p>Libraries, starting with the standard library, provide collections of modules. for example, <code>List.iter</code> designates the <code>iter</code> function from the <code>List</code> module.</p>
<p>OK, if you are using a given module heavily, you may want to make its contents directly accessible. For this, we use the <code>open</code> directive. In our example, <code>bmodule.ml</code> could have been written:</p>
<pre ml:content="ocaml noeval">
open Amodule;;
hello ();;
</pre>

<p>As a side note, people tend to avoid the ugly &quot;;;&quot;, so it more common to write it like:</p>
<pre ml:content="ocaml noeval">
open Amodule
let () =
  hello ()
</pre>

<p>Anyway, using <code>open</code> or not is a matter of personal taste. Some modules provide names that are used in many other modules. This is the case of the <code>List</code> module for instance. Usually we don't do <code>open List</code>. Other modules like <code>Printf</code> provide names that are normally not subject to conflicts, such as <code>printf</code>. In order to avoid writing <code>Printf.printf</code> all over the place, it often makes sense to place one <code>open Printf</code> at the beginning of the file.</p>
<p>There is a short example illustrating what we just mentioned:</p>
<pre ml:content="ocaml noeval">
open Printf
let my_data = [ &quot;a&quot;; &quot;beautiful&quot;; &quot;day&quot; ]
let () = List.iter (fun s -&gt; printf &quot;%s\n&quot; s) my_data
</pre>

<h2><a name="Interfaces_and_signatures"></a>Interfaces and signatures</h2>

<p>A module can provide a certain number of things (functions, types, submodules, ...) to the rest of the program that is using it. If nothing special is done, everything which is defined in a module will be accessible from outside. That's often fine in small personal programs, but there are many situations where it is better that a module only provides what it is meant to provide, not any of the auxilliary functions and types that are used internally.</p>
<p>For this we have to define a module interface, which will act as a mask over the module's implementation. Just like a module derives from a .ml file, the corresponding module interface or signature derives from a .mli file. It contains a list of values with their type, and more. Let's rewrite our <code>amodule.ml</code> file:</p>
<pre ml:content="ocaml noeval">
let message = &quot;Hello&quot;
let hello () = print_endline message
</pre>

<p>As it is, <code>Amodule</code> has the following interface:</p>
<pre ml:content="ocaml noeval">
val message : string
val hello : unit -&gt; unit
</pre>

<p>Let's assume that accessing the <code>message</code> value directly is none of the others modules' business. We want to hide it by defining a restricted interface. This is our <code>amodule.mli</code> file:</p>
<pre ml:content="ocaml noeval">
val hello : unit -&gt; unit
(** displays a greeting message *)
</pre>

<p>(note that it is a good habit to document .mli files, using the format supported by <a href="http://caml.inria.fr/pub/docs/manual-ocaml/manual029.html" class="external" title="http://caml.inria.fr/pub/docs/manual-ocaml/manual029.html">ocamldoc</a>)</p>
<p>.mli files must be compiled just before the matching .ml files. They are compiled using <code>ocamlc</code>, even if .ml files are compiled to native code using <code>ocamlopt</code>:</p>
<pre>
ocamlc -c amodule.mli
ocamlopt -c amodule.ml
...
</pre>

<a name="Abstract_types"></a><h2><span>Abstract types</span></h2>
<p>What about type definitions? We saw that values such as functions can be exported by placing their name and their type in a .mli file, e.g.</p>
<pre ml:content="ocaml noeval">
val hello : unit -&gt; unit
</pre>

<p>But modules often define new types. Let's define a simple record type that would represent a date:</p>
<pre ml:content="ocaml noeval">
type date = { day : int;
              month : int;
              year : int }
</pre>

<p>There are not two, but four options when it comes to writing the .mli file:</p>
<ol><li>The type is completely omitted from the signature.</li>
<li>The type definition is copy-pasted into the signature.</li>
<li>The type is made abstract: only its name is given.</li>
<li>The record fields are made read-only: <code>type date = private { ... }</code></li></ol>
<p>In case 3, it would be the following code:</p>
<pre ml:content="ocaml noeval">
type date
</pre>

<p>Now, users of the module can manipulate objects of type <code>date</code>, but they can't access the record fields directly. They must use the functions that the module provides. Let's assume the module provides three functions, one for creating a date, one for computing the difference between two dates, and one that returns the date in years:</p>
<pre ml:content="ocaml noeval">
type date
val create : ?days:int -&gt; ?months:int -&gt; ?years:int -&gt; unit -&gt; date
val sub : date -&gt; date -&gt; date
val years : date -&gt; float
</pre>

<p>The point is that only <code>create</code> and <code>sub</code> can be used to create <code>date</code> records. Therefore, it is not possible for the user of the module to create ill-formed records. Actually, our implementation uses a record, but we could change it and be sure that it will not break any code that relies on this module! This takes all its sense in a library since subsequent versions of the same library can continue to expose the same interface, while internally changing the implementation, including data structures.</p>

<h2><a name="Submodules"></a>Submodules</h2>

<h3>Submodule implementation</h3>
<p>We saw that one <code>example.ml</code> file results automatically in one module implementation named <code>Example</code>. Its module signature is  automatically derived and is the broadest possible, or can be restricted by writing an <code>example.mli</code> file.</p>
<p>That said, a given module can also be defined explicitely from within a file. That makes it a submodule of the current module. Let's consider this <code>example.ml</code> file:</p>
<pre ml:content="ocaml noeval">
module Hello = struct
  let message = &quot;Hello&quot;
  let hello () = print_endline message
end
let goodbye () = print_endline &quot;Goodbye&quot;
let hello_goodbye () =
  Hello.hello ();
  goodbye ()
</pre>

<p>From another file, it is clear that we now have two levels of modules. We can write:</p>
<pre ml:content="ocaml noeval">
let () =
  Example.Hello.hello ();
  Example.goodbye ()
</pre>

<h3>Submodule interface</h3>
<p>We can also restrict the interface of a given submodule. It is called a module type. Let's do it in our <code>example.ml</code> file:</p>
<pre ml:content="ocaml noeval">
module Hello : sig
 val hello : unit -&gt; unit
end = 
struct
  let message = &quot;Hello&quot;
  let hello () = print_endline message
end

(* At this point, Hello.message is not accessible anymore. *)
let goodbye () = print_endline &quot;Goodbye&quot;
let hello_goodbye () =
  Hello.hello ();
  goodbye ()
</pre>

<p>The definition of the <code>Hello</code> module above is the equivalent of a <code>hello.mli</code>/<code>hello.ml</code> pair of files. Writing all of that in one block of code is not elegant, so in general we prefer to define the module signature separately:</p>
<pre ml:content="ocaml noeval">
module type Hello_type = sig
 val hello : unit -&gt; unit
end
</pre>

<pre ml:content="ocaml noeval">
module Hello : Hello_type = struct
  ...
end
</pre>

<p><code>Hello_type</code> is a named module type, and can be reused to define other module interfaces.</p>
<p>Although having submodules may be useful in some cases, their real utility becomes apparent with functors. This is the next section.</p>

<a name="Functors"></a><h2><span>Functors</span></h2>

<p>Functors are probably one of the most complex features of OCaml, but you don't have to use them extensively to be a successful OCaml programmer. Actually, you may never have to define a functor yourself, but you will surely encounter them in the standard library. They are the only way of using the Set and Map modules, but using them is not so difficult.</p>

<h3>What is a functor and why do we need them?</h3>
<p>A functor is a module that is parametrized by another module, just like a function is a value which is parametrized by other values, the arguments.</p>
<p>Basically, it allows to parametrize a type by a value, which is not possible directly in OCaml. For example, we can define a functor that takes an int n and returns a collection of array operations that work exclusively on arrays of length n. If by mistake the programmer passes a regular array to one of those functions, it will result in a compilation error. If we were not using this functor but the standard array type, the compiler would not be able to detect the error, and we would get a runtime error at some undetermined date in the future, which is much worse.</p>

<h3>How to use an existing functor?</h3>
<p>The standard library defines a <code>Set</code> module, which provides a <code>Make</code> functor. This functor takes one argument, which is a module that provides (at least) two things: the type of elements, given as <code>t</code> and the comparison function given as <code>compare</code>. The point of the functor is to ensure that the same comparison function will always be used, even if the programmer makes a mistake.</p>
<p>For example, if we want to use sets of ints, we would use do this:</p>
<pre ml:content="ocaml noeval">
module Int_set = Set.Make (struct
                             type t = int
                             let compare = compare
                           end)
</pre>

<p>For sets of strings, it is even easier because the standard library provides a <code>String</code> module with a type <code>t</code> and a function <code>compare</code>. If you were following carefully, by now you must have guessed how to create a module for the manipulation of sets of strings:</p>
<pre ml:content="ocaml noeval">
module String_set = Set.Make (String)
</pre>

<p>(the parentheses are necessary)</p>
<h3>How to define a functor?</h3>
<p>A functor with one argument can be defined like this:</p>
<pre ml:content="ocaml noeval">
module F (X : X_type) = struct
 ...
end
</pre>

<p>where <code>X</code> is the module that will be passed as argument, and <code>X_type</code> is its signature, which is mandatory.</p>
<p>The signature of the returned module itself can be constrained, using this syntax:</p>
<pre ml:content="ocaml noeval">
module F (X : X_type) : Y_type =
struct
  ...
end
</pre>

<p>or by specifying this in the .mli file:</p>
<pre ml:content="ocaml noeval">
module F (X : X_type) : Y_type
</pre>

<p>Overall, the syntax of functors is hard to grasp. The best may be to look at the source files <code>set.ml</code> or <code>map.ml</code> of the standard library.</p>
<p>Final remark: functors are made to help programmers write correct programs, not to improve performance. There is even a runtime penalty, unless you use a defunctorizer such as ocamldefun, which requires access to the source code of the functor.</p>
<a name="Practical_manipulation_of_modules"></a><h2><span>Practical manipulation of modules</span></h2>
<h3>Displaying the interface of a module</h3>
<p>In the <code>ocaml</code> toplevel, the following trick allows to visualize the contents of an existing module, such as <code>List</code>:</p>
<pre ml:content="ocaml">
module M = List;;
</pre>

<p>Otherwise, there is online documentation for most libraries or you can use <code>ocamlbrowser</code> which comes with labltk (Tk graphical user interface for OCaml).</p>
<h3>Module inclusion</h3>
<p>Let's say we feel that a function is missing from the standard <code>List</code> module, but we really want it as if it were part of it. In an <code>extensions.ml</code> file, we can achieve this effect by using the <code>include</code> directive:</p>
<pre ml:content="ocaml noeval">
module List = struct
  include List
  let rec optmap f = function
    | [] -&gt; []
    | hd :: tl -&gt;
       match f hd with
       | None -&gt; optmap f tl
       | Some x -&gt; x :: optmap f tl
end
</pre>

<p>It creates a module <code>Extensions.List</code> that has everything the standard <code>List</code> module has, plus a new <code>optmap</code> function. From another file, all we have to do to override the default <code>List</code> module is <code>open Extensions</code> at the beginning of the .ml file:</p>
<pre ml:content="ocaml noeval">
open Extensions
...
List.optmap ...
</pre>


</div>
</body>
