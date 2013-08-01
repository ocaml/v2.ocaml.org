<title>The Structure of OCaml Programs</title>
<body>
<h1><span>The Structure of OCaml Programs</span></h1>
<a name="The_structure_of_OCaml_programs"></a><h2><span>The structure of OCaml programs</span></h2>
<p class="first_para">Now we're going to take some time out to take a high-level look at some real OCaml programs. I want to teach you about local and global definitions, when to use <code>;;</code> vs. <code>;</code>, modules, nested functions, and references. For this we're going to look at a lot of OCaml concepts which won't yet make sense because we haven't seen them before. Don't worry about the details for the moment. Concentrate instead on the overall shape of the programs and the features which I'll point out.</p>
<h3>Local &quot;variables&quot; (<em>really</em> local expressions)</h3>
<p class="first_para">Let's take the <code>average</code> function and add a local variable in C. (Compare it to the first definition we had above).</p>
<pre>
double
average (double a, double b)
{
  double sum = a + b;
  return sum / 2;
}
</pre>

<p class="first_para">Now let's do the same to our OCaml version:</p>
<pre ml:content="ocaml noeval">
let average a b =
  let sum = a +. b in
  sum /. 2.0;;
</pre>

<p class="first_para">The standard phrase <code ml:content="ocaml noeval">let name = expression in</code> is used to define a named local expression, and <code>name</code> can then be used later on in the function instead of <code>expression</code>, till a <code>;;</code> which ends the block of code. Notice that we don't indent after the <code>in</code>. Just think of <code>let ... in</code> as if it were a statement.</p>
<p>Now comparing C local variables and these named local expressions is a sleight of hand. In fact they are somewhat different. The C variable <code>sum</code> has a slot allocated for it on the stack. You can assign to <code>sum</code> later in the function if you want, or even take the address of <code>sum</code>. This is NOT true for the OCaml version. In the OCaml version, <code>sum</code> is just a shorthand name for the expression <code>a +. b</code>.  There is no way to assign to <code>sum</code> or change its value in any way. (We'll see how you can do variables whose value changes in a minute).</p>
<p>Here's another example to make this clearer. The following two code snippets should return the same value (namely (a+b) + (a+b)<sup>2</sup>):</p>
<pre ml:content="ocaml noeval">
let f a b =
  (a +. b) +. (a +. b) ** 2.
  ;;
</pre>

<pre ml:content="ocaml noeval">
let f a b =
  let x = a +. b in
  x +. x ** 2.
  ;;
</pre>

<p class="first_para">The second version might be faster (but most compilers ought to be able to perform this step of &quot;common subexpression elimination&quot; for you), and it is certainly easier to read. <code>x</code> in the second example is just shorthand for <code>a +. b</code>.</p>
<h3>Global &quot;variables&quot; (<em>really</em> global expressions)</h3>
<p class="first_para">You can also define global names for things at the top level, and as with our local &quot;variables&quot; above, these aren't really variable at all, just shorthand names for things. Here's a real (but cut-down) example:</p>
<pre ml:content="ocaml noeval">
let html =
  let content = read_whole_file file in
  GHtml.html_from_string content
  ;;

let menu_bold () =
  match bold_button#active with
    true -&gt; html#set_font_style ~enable:[`BOLD] ()
  | false -&gt; html#set_font_style ~disable:[`BOLD] ()
  ;;

let main () =
  (* code omitted *)
  factory#add_item &quot;Cut&quot; ~key:_X ~callback: html#cut
  ;;
</pre>

<p class="first_para">In this real piece of code, <code>html</code> is an HTML editing widget (an object from the lablgtk library) which is created once at the beginning of the program by the first <code>let html =</code> statement. It is then referred to in several later functions.</p>
<p>Note that the <code>html</code> name in the code snippet above shouldn't really be compared to a real global variable as in C or other imperative languages. There is no space allocated to &quot;store&quot; the &quot;<code>html</code> pointer&quot;. Nor is it possible to assign anything to <code>html</code>, for example to reassign it to point to a different widget. In the next section we'll talk about references, which are real variables.</p>
<h3>Let-bindings</h3>
<p class="first_para">Any use of <code>let ...</code>, whether at the top level (globally) or within a function, is often called a <strong>let-binding</strong>.</p>
<h3>References: real variables</h3>
<p class="first_para">What happens if you want a real variable that you can assign to and change throughout your program? You need to use a <strong>reference</strong>. References are very similar to pointers in C/C++. In Java, all variables which store objects are really references (pointers) to the objects. In Perl, references are references - the same thing as in OCaml.</p>
<p>Here's how we create a reference to an <code>int</code> in OCaml:</p>
<pre ml:content="ocaml noeval">
ref 0;;
</pre>

<p class="first_para">Actually that statement wasn't really very useful. We created the reference and then, because we didn't name it, the garbage collector came along and collected it immediately afterwards! (actually, it was probably thrown away at compile-time.) Let's name the reference:</p>
<pre ml:content="ocaml">
let my_ref = ref 0
</pre>

<p class="first_para">This reference is currently storing a zero integer. Let's put something else into it (assignment):</p>
<pre ml:content="ocaml">
my_ref := 100
</pre>

<p class="first_para">And let's find out what the reference contains now:</p>
<pre ml:content="ocaml">
!my_ref
</pre>

<p class="first_para">So the <code>:=</code> operator is used to assign to references, and the <code>!</code> operator dereferences to get out the contents. Here's a rough-and-ready comparison with C/C++:</p>
<table width="100%">
  <tr><th>OCaml</th><th>C/C++</th></tr>
  <tr><td><pre ml:content="ocaml noeval">
let my_ref = ref 0;;
my_ref := 100;;
!my_ref</pre>
    </td><td><pre>
int a = 0; int *my_ptr = &amp;a;
*my_ptr = 100;
*my_ptr</pre></td></tr>
</table>

<p class="first_para">References have their place, but you may find that you don't use references very often. Much more often you'll be using <code>let name = expression in</code> to name local expressions in your function definitions.</p>
<h3>Nested functions</h3>
<p class="first_para">C doesn't really have a concept of nested functions. GCC supports nested functions for C programs but I don't know of any program which actually uses this extension. Anyway, here's what the gcc info page has to say about nested functions:</p>
<p>A &quot;nested function&quot; is a function defined inside another function. (Nested functions are not supported for GNU C++.)  The nested function's name is local to the block where it is defined.  For example, here we define a nested function named `square', and call it twice:</p>
<pre>
foo (double a, double b)
{
  double square (double z) { return z * z; }

  return square (a) + square (b);
}
</pre>

<p class="first_para">The nested function can access all the variables of the containing function that are visible at the point of its definition.  This is called &quot;lexical scoping&quot;.  For example, here we show a nested function which uses an inherited variable named `offset':</p>
<pre>
bar (int *array, int offset, int size)
{
  int access (int *array, int index)
    { return array[index + offset]; }
  int i;
  /* ... */
  for (i = 0; i &lt; size; i++)
    /* ... */ access (array, i) /* ... */
}
</pre>

<p class="first_para">You get the idea. Nested functions are, however, very useful and very heavily used in OCaml. Here is an example of a nested function from some real code:</p>
<pre ml:content="ocaml">
  let read_whole_channel chan =
    let buf = Buffer.create 4096 in
    let rec loop () =
      let newline = input_line chan in
      Buffer.add_string buf newline;
      Buffer.add_char buf '\n';
      loop ()
    in
    try
      loop ()
    with
      End_of_file -> Buffer.contents buf;;
</pre>

<p class="first_para">Don't worry about what this code does - it contains many concepts which haven't been discussed in this tutorial yet. Concentrate instead on the central nested function called <code>loop</code> which takes just a unit argument.  You can call <code>loop ()</code> from within the function <code>read_whole_channel</code>, but it's not defined outside this function. The nested function can access variables defined in the main function (here <code>loop</code> accesses the local names <code>buf</code> and <code>chan</code>).</p>
<p>The form for nested functions is the same as for local named expressions: <code>let name <em>arguments</em> = <em>function-definition</em> in</code>.</p>
<p>You normally indent the function definition on a new line as in the example above, and remember to use <code>let rec</code> instead of <code>let</code> if your function is recursive (as it is in that example).</p>
<h3>Modules and <code>open</code></h3>
<p class="first_para">OCaml comes with lots of fun and interesting modules (libraries of useful code). For example there are standard libraries for drawing graphics, interfacing with GUI widget sets, handling large numbers, data structures, and making POSIX system calls. These libraries are located in <code>/usr/lib/ocaml/<em>VERSION</em>/</code> (on Unix anyway). For these examples we're going to concentrate on one quite simple module called <code>Graphics</code>.</p>
<p>The <code>Graphics</code> module is installed into 5 files (on my system):</p>
<pre>
/usr/lib/ocaml/3.08/graphics.a
/usr/lib/ocaml/3.08/graphics.cma
/usr/lib/ocaml/3.08/graphics.cmi
/usr/lib/ocaml/3.08/graphics.cmxa
/usr/lib/ocaml/3.08/graphics.mli
</pre>

<p class="first_para">For the moment let's just concentrate on the file <code>graphics.mli</code>. This is a text file, so you can read it now. Notice first of all that the name is <code>graphics.mli</code> and not <code>Graphics.mli</code>. OCaml always capitalizes the first letter of the file name to get the module name. This can be very confusing until you know about it!</p>
<p>If we want to use the functions in <code>Graphics</code> there are two ways we can do it. Either at the start of our program we have the <code>open Graphics;;</code> declaration. Or we prefix all calls to the functions like this: <code>Graphics.open_graph</code>. <code>open</code> is a little bit like Java's <code>import</code> statement, and much more like Perl's <code>use</code> statement.</p>
<p>[Windows users: For this example to work interactively on Windows, you will need to create a custom toplevel.  Issue the command <code>ocamlmktop -o ocaml-graphics graphics.cma</code> from the command line.]</p>
<p>A couple of examples should make this clear. (The two examples draw different things - try them out). Note the first example calls <code>open_graph</code> and the second one <code>Graphics.open_graph</code>.</p>
<pre ml:content="ocaml noeval">
(* To compile this example: ocamlc graphics.cma grtest1.ml -o grtest1 *)
open Graphics;;

open_graph &quot; 640x480&quot;;;
for i = 12 downto 1 do
  let radius = i * 20 in
  set_color (if i mod 2 = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;
</pre>

<pre ml:content="ocaml noeval">
(* To compile this example: ocamlc graphics.cma grtest2.ml -o grtest2 *)

Random.self_init ();;
Graphics.open_graph &quot; 640x480&quot;;;

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x);;

for x = 0 to 639 do
  let r = 4.0 *. (float_of_int x) /. 640.0 in
  for i = 0 to 39 do
    let x_init = Random.float 1.0 in
    let x_final = iterate r x_init 500 in
    let y = int_of_float (x_final *. 480.) in
    Graphics.plot x y
  done
done;;

read_line ();;
</pre>

<p class="first_para">Both of these examples make use of some features we haven't talked about yet: imperative-style for-loops, if-then-else and recursion. We'll talk about those later. Nevertheless you should look at these programs and try and find out (1) how they work, and (2) how type inference is helping you to eliminate bugs.</p>
<h3>The <code>Pervasives</code> module</h3>
<p class="first_para">There's one module that you never need to &quot;<code>open</code>&quot;. That is the <code>Pervasives</code> module (go and read <code>/usr/lib/ocaml/3.08/pervasives.mli</code> now). All of the symbols from the <code>Pervasives</code> module are automatically imported into every OCaml program.</p>
<h3>Renaming modules</h3>
<p class="first_para">What happens if you want to use symbols in the <code>Graphics</code> module, but you don't want to import all of them and you can't be bothered to type <code>Graphics</code> each time? Just rename it using this trick:</p>
<pre ml:content="ocaml noeval">
module Gr = Graphics;;

Gr.open_graph " 640x480";;
Gr.fill_circle 320 240 240;;
read_line ();;
</pre>

<p class="first_para">Actually this is really useful when you want to import a nested module (modules can be nested inside one another), but you don't want to type out the full path to the nested module name each time.</p>
<h3>Using and omitting <code>;;</code> and <code>;</code></h3>
<p class="first_para">Now we're going to look at a very important issue. When should you use <code>;;</code>, when should you use <code>;</code>, and when should you use none of these at all? This is a tricky issue until you &quot;get it&quot;, and it taxed the author for a long time while he was learning OCaml too.</p>
<p>Rule #1 is that you should use <code>;;</code> to separate statements at the top-level of your code, and <em>never</em> within function definitions or any other kind of statement.</p>
<p>Have a look at a section from the second graphics example above:</p>
<pre ml:content="ocaml noeval">
Random.self_init ();;
Graphics.open_graph " 640x480";;

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x);;
</pre>

<p class="first_para">We have two top-level statements and a function definition (of a function called <code>iterate</code>). Each one is followed by <code>;;</code>.</p>
<p>Rule #2 is that <em>sometimes</em> you can elide [omit] the <code>;;</code>. As a beginner you shouldn't worry about this - you should always put in the <code>;;</code> as directed by Rule #1. But since you'll also be reading a lot of other peoples' code you'll need to know that sometimes we can elide <code>;;</code>. The particular places where this is allowed are:</p>
<ul><li>Before the keyword <code>let</code>.</li>
<li>Before the keyword <code>open</code>.</li>
<li>Before the keyword <code>type</code>.</li>
<li>At the very end of the file.</li>
<li>A few other (very rare) places where OCaml can &quot;guess&quot; that the next thing is the start of a new statement and not the continuation of the current statement.</li></ul>
<p class="first_para">Here is some working code with <code>;;</code> elided wherever possible:</p>
<pre ml:content="ocaml noeval">
open Random                   (* ;; *)
open Graphics;;

self_init ();;
open_graph " 640x480"         (* ;; *)

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x);;

for x = 0 to 639 do
  let r = 4.0 *. (float_of_int x) /. 640.0 in
  for i = 0 to 39 do
    let x_init = Random.float 1.0 in
    let x_final = iterate r x_init 500 in
    let y = int_of_float (x_final *. 480.) in
    Graphics.plot x y
  done
done;;

read_line ()                  (* ;; *)
</pre>

<p class="first_para">Rules #3 and #4 refer to the single <code>;</code>. This is completely different from <code>;;</code>. The single semicolon <code>;</code> is what is known as a <strong>sequence point</strong>, which is to say it has exactly the same purpose as the single semicolon in C, C++, Java and Perl. It means &quot;do the stuff before this point first, then do the stuff after this point when the first stuff has completed&quot;. Bet you didn't know that.</p>
<p>Rule #3 is: Consider <code>let ... in</code> as a statement, and never put a single <code>;</code> after it.</p>
<p>Rule #4 is: For all other statements within a block of code, follow them with a single <code>;</code>, <em>except</em> for the very last one.</p>
<p>The inner for-loop in our example above is a good demonstration. Notice that we never use any single <code>;</code> in this code:</p>
<pre ml:content="ocaml noeval">
for i = 0 to 39 do
  let x_init = Random.float 1.0 in
  let x_final = iterate r x_init 500 in
  let y = int_of_float (x_final *. 480.) in
  Graphics.plot x y
done
</pre>

<p class="first_para">The only place in the above code where might think about putting in a <code>;</code> is after the <code>Graphics.plot x y</code>, but because this is the last statement in the block, Rule #4 tells us not to put one there.</p>
<h3>Note about &quot;;&quot;</h3>
<p class="first_para">Brian Hurt writes to correct me on &quot;;&quot;</p>
<blockquote>
<p>
The <code>;</code> is an operator, just like <code>+</code> is.  Well,
not quite just like <code>+</code> is, but conceptually the same.
<code>+</code> has type <code>int -&gt; int -&gt; int</code> - it
takes two ints and returns an int (the sum).  <code>;</code> has type
<code>unit -&gt; 'b -&gt; 'b</code> - it takes two values and simply
returns the second one.  Rather like C's <code>,</code> (comma)
operator.  You can write <code>a ; b ; c ; d</code> just as easily as
you can write <code>a + b + c + d</code>.
</p>

<p>
This is one of those "mental leaps" which is never spelled out very
well - in OCaml, nearly everything is an expression.
<code>if/then/else</code> is an expression.  <code>a ; b</code> is an
expression.  <code>match foo with ...</code> is an expression.  The
following code is perfectly legal (and all do the same thing):
</p>

<pre ml:content="ocaml noeval">
let f x b y = if b then x+y else x+0
let f x b y = x + (if b then y else 0)
let f x b y = x + (match b with true -> y | false -> 0)
let f x b y = x + (let g z = function true -> z | false -> 0 in g y b)
let f x b y = x + (let _ = y + 3 in (); if b then y else 0)
</pre>

<p>
Note especially the last one - I'm using <code>;</code> as an operator
to "join" two statements.  All functions in OCaml can be expressed as:
</p>

<pre ml:content="ocaml noeval">
 let name [parameters] = expression
</pre>

<p>
OCaml's definition of what is an expression is just a little wider
than C's.  In fact, C has the concept of "statements"- but all of C's
statements are just expressions in OCaml (combined with the
<code>;</code> operator).
</p>

<p>
The one place that <code>;</code> is different from <code>+</code> is
that I can refer to <code>+</code> just like a function.  For
instance, I can define a <code>sum_list</code> function, to sum a list of ints,
like:
</p>

<pre ml:content="ocaml noeval">
 let sum_list = List.fold_left ( + ) 0
</pre>
</blockquote>
<h3>Putting it all together: some real code</h3>
<p class="first_para">In this section we're going to show some real code fragments from the lablgtk 1.2 library. (Lablgtk is the OCaml interface to the native Unix Gtk widget library). A word of warning: these fragments contain a lot of ideas which we haven't discussed yet. Don't look at the details, look instead at the overall shape of the code, where the authors used <code>;;</code>, where they used <code>;</code> and where they used <code>open</code>, how they indented the code, how they used local and global named expressions.</p>
<p>... However, I'll give you some clues so you don't get totally lost!</p>
<ul><li><code>?foo</code> and <code>~foo</code> is OCaml's way of doing optional and named arguments to functions. There is no real parallel to this in C-derived languages, but Perl, Python and Smalltalk all have this concept that you can name the arguments in a function call, omit some of them, and supply the others in any order you like.</li>
<li><code>foo#bar</code> is a method invocation (calling a method called <code>bar</code> on an object called <code>foo</code>).  It's similar to <code>foo-&gt;bar</code> or <code>foo.bar</code> or <code>$foo-&gt;bar</code> in C++, Java or Perl respectively.</li></ul>
<p class="first_para">First snippet: The programmer opens a couple of standard libraries (eliding the <code>;;</code> because the next keyword is <code>open</code> and <code>let</code> respectively). He then creates a function called <code>file_dialog</code>. Inside this function he defines a named expression called <code>sel</code> using a two-line <code>let sel = ... in</code> statement. Then he calls several methods on <code>sel</code>.</p>
<pre ml:content="ocaml noeval">
(* First snippet *)
open StdLabels
open GMain

let file_dialog ~title ~callback ?filename () =
  let sel =
    GWindow.file_selection ~title ~modal:true ?filename () in
  sel#cancel_button#connect#clicked ~callback:sel#destroy;
  sel#ok_button#connect#clicked ~callback:do_ok;
  sel#show ()
</pre>

<p class="first_para">Second snippet: Just a long list of global names at the top level. Notice that the author elided every single one of the <code>;;</code> because of Rule #2.</p>
<pre ml:content="ocaml noeval">
(* Second snippet *)
let window = GWindow.window ~width:500 ~height:300 ~title:"editor" ()
let vbox = GPack.vbox ~packing:window#add ()

let menubar = GMenu.menu_bar ~packing:vbox#pack ()
let factory = new GMenu.factory menubar
let accel_group = factory#accel_group
let file_menu = factory#add_submenu "File"
let edit_menu = factory#add_submenu "Edit"

let hbox = GPack.hbox ~packing:vbox#add ()
let editor = new editor ~packing:hbox#add ()
let scrollbar = GRange.scrollbar `VERTICAL ~packing:hbox#pack ()
</pre>

<p class="first_para">Third snippet: The author imports all the symbols from the <code>GdkKeysyms</code> module. Now we have an unusual let-binding. <code>let _ = expression</code> means &quot;calculate the value of the expression (with all the side-effects that may entail), but throw away the result&quot;. In this case, &quot;calculate the value of the expression&quot; means to run <code>Main.main ()</code> which is Gtk's main loop, which has the side-effect of popping the window onto the screen and running the whole application. The &quot;result&quot; of <code>Main.main ()</code> is insignificant - probably a <code>unit</code> return value, but I haven't checked - and it doesn't get returned until the application finally exits.</p>
<p>Notice in this snippet how we have a long series of essentially procedural commands. This is really a classic imperative program.</p>
<pre ml:content="ocaml noeval">
(* Third snippet *)
open GdkKeysyms

let () =
  window#connect#destroy ~callback:Main.quit;
  let factory = new GMenu.factory file_menu ~accel_group in
  factory#add_item "Open..." ~key:_O ~callback:editor#open_file;
  factory#add_item "Save" ~key:_S ~callback:editor#save_file;
  factory#add_item "Save as..." ~callback:editor#save_dialog;
  factory#add_separator ();
  factory#add_item "Quit" ~key:_Q ~callback:window#destroy;
  let factory = new GMenu.factory edit_menu ~accel_group in
  factory#add_item "Copy" ~key:_C ~callback:editor#text#copy_clipboard;
  factory#add_item "Cut" ~key:_X ~callback:editor#text#cut_clipboard;
  factory#add_item "Paste" ~key:_V ~callback:editor#text#paste_clipboard;
  factory#add_separator ();
  factory#add_check_item "Word wrap" ~active:false
    ~callback:editor#text#set_word_wrap;
  factory#add_check_item "Read only" ~active:false
    ~callback:(fun b -> editor#text#set_editable (not b));
  window#add_accel_group accel_group;
  editor#text#event#connect#button_press
    ~callback:(fun ev ->
      let button = GdkEvent.Button.button ev in
      if button = 3 then begin
        file_menu#popup ~button ~time:(GdkEvent.Button.time ev); true
      end else false);
  editor#text#set_vadjustment scrollbar#adjustment;
  window#show ();
  Main.main ()
</pre>

</body>
