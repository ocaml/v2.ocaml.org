<head>
<title>If Statements, Loops and Recursion</title>
</head>
<body>

<h1><span>If Statements, Loops and Recursion</span></h1>

<h2><a name="If_statements__actually_these_are_if_expressions_"></a>
  If statements (actually these are if expressions)</h2>
<p>OCaml has an if statement with two variations, and the obvious meaning:</p>
<pre ml:content="ocaml noeval">
if boolean-condition then expression
</pre>

<pre ml:content="ocaml noeval">
if boolean-condition then expression else other-expression
</pre>

<p>Unlike in the conventional languages you'll be used to, if statements are really expressions. In other words, they're much more like <code><em>boolean-condition</em> ? <em>expression</em> : <em>other-expression</em></code> than like the if statements you may be used to.</p>
<p>Here's a simple example of an <code>if</code> statement:</p>
<pre ml:content="ocaml noeval">
let max a b =
  if a &gt; b then a else b
</pre>

<p>As a short aside, if you type this into the OCaml toplevel, you'll notice that OCaml decides that this function is polymorphic, with the following type:</p>
<pre>
max : 'a -&gt; 'a -&gt; 'a
</pre>

<p>And indeed OCaml lets you use <code>max</code> on any type:</p>
<pre ml:content="ocaml">
max 3 5;;
max 3.5 13.0;;
max &quot;a&quot; &quot;b&quot;;;
</pre>

<p>This is because <code>&gt;</code> is in fact polymorphic. It works on any type, even objects (it does a binary comparison).</p>
<p>[Note that the <code>Pervasives</code> module defines <code>min</code> and <code>max</code> for you.]</p>
<p>Let's look a bit more closely at the <code>if</code> expression. Here's the <code>range</code> function which I showed you earlier without much explanation. You should be able to combine your knowledge of recursive functions, lists and if expressions to see what it does:</p>
<pre ml:content="ocaml silent">
  let rec range a b =
    if a &gt; b then []
    else a :: range (a+1) b
</pre>

<p>Let's examine some typical calls to this function. Let's start with the easy case of <code>a &gt; b</code>. A call to <code>range 11 10</code> returns <code>[]</code> (the empty list) and that's it.</p>
<p>What about calling <code>range 10 10</code>? Since <code>10 &gt; 10</code> is false, the <code>else</code>-clause is evaluated, which is: <code>10 :: (range 11 10)</code> (I've added the brackets to make the order of evaluation more clear). We've just worked out that <code>range 11 10</code> = <code>[]</code>, so this is: <code>10 :: []</code>. Remember our formal description of lists and the <code>::</code> (cons) operator? <code>10 :: []</code> is just the same as <code>[ 10 ]</code>.</p>
<p>Let's try <code>range 9 10</code>:</p>
<pre ml:content="ocaml noeval">
range 9 10
→ 9 :: (range 10 10)
→ 9 :: [ 10 ]
→ [9; 10]
</pre>

<p>It should be fairly clear that <code>range 1 10</code> evaluates to <code>[ 1; 2; 3; 4; 5; 6; 7; 8; 9; 10 ]</code>.</p>
<p>What we've got here is a simple case of recursion. Functional programming can be said to prefer recursion over loops, but I'm jumping ahead of myself. We'll discuss recursion more at the end of this chapter.</p>
<p>Back, temporarily, to if statements. What does this function do?</p>
<pre ml:content="ocaml noeval">
let f x y =
  x + if y &gt; 0 then y else 0
</pre>

<p>Clue: add brackets around the whole of the if expression. It clips <code>y</code> like an <a href="http://www.noir-medical.com/graphics/diode_graph.gif" class="external" title="http://www.noir-medical.com/graphics/diode_graph.gif">electronic diode</a>.</p>
<p>The <code>abs</code> (absolute value) function is defined in <code>Pervasives</code> as:</p>
<pre ml:content="ocaml noeval">
let abs x =
  if x &gt;= 0 then x else -x
</pre>

<p>Also in <code>Pervasives</code>, the <code>string_of_float</code> function contains a complex pair of nested if expressions:</p>
<pre ml:content="ocaml noeval">
let string_of_float f =
  let s = format_float &quot;%.12g&quot; f in
  let l = string_length s in
  let rec loop i =
    if i &gt;= l then s ^ &quot;.&quot;
    else if s.[i] = '.' || s.[i] = 'e' then s
    else loop (i+1) in
  loop 0
</pre>

<p>Let's examine this function. Suppose the function is called with <code>f</code> = 12.34. Then <code>s</code> = &quot;12.34&quot;, and <code>l</code> = 5. We call <code>loop</code> the first time with <code>i</code> = 0.</p>
<p><code>i</code> is not greater than or equal to <code>l</code>, and <code>s.[i]</code> (the <code>i</code><sup>th</sup> character in <code>s</code>) is not a period or <code>'e'</code>. So <code>loop (i+1)</code> is called, ie. <code>loop 1</code>.</p>
<p>We go through the same dance for <code>i</code> = 1, and end up calling <code>loop 2</code>.</p>
<p>For <code>i</code> = 2, however, <code>s.[i]</code> is a period (refer to the original string, <code>s</code> = &quot;12.34&quot;).  So this immediately returns <code>s</code>, and the function <code>string_of_float</code> returns &quot;12.34&quot;.</p>
<p>What is <code>loop</code> doing? In fact it's checking whether the string returned from <code>format_float</code> contains a period (or <code>'e'</code>). Suppose that we called <code>string_of_float</code> with <code>12.0</code>.  <code>format_float</code> would return the string &quot;12&quot;, but <code>string_of_float</code> must return &quot;12.&quot; or &quot;12.0&quot; (because floating point constants in OCaml must contain a period to differentiate them from integer constants). Hence the check.</p>
<p>The strange use of recursion in this function is almost certainly for efficiency. OCaml supports for loops, so why didn't the authors use for loops? We'll see in the next section that OCaml's for loops are limited in a way which prevents them from being used in <code>string_of_float</code>. Here, however, is a more straightforward, but approximately twice as slow, way of writing <code>string_of_float</code>:</p>
<pre ml:content="ocaml noeval">
let string_of_float f =
  let s = format_float &quot;%.12g&quot; f in
  if String.contains s '.' || String.contains s 'e'
  then s
  else s ^ &quot;.&quot;
</pre>

<a name="Using_begin_____end"></a><h2><span>Using begin ... end</span></h2>
<p>Here is some code from lablgtk:</p>
<pre ml:content="ocaml noeval">
if GtkBase.Object.is_a obj cls then
  fun _ -&gt; f obj
else begin
  eprintf &quot;Glade-warning: %s expects a %s argument.\n&quot; name cls;
  raise Not_found
end
</pre>

<p><code>begin</code> and <code>end</code> are what is known as <strong>syntactic sugar</strong> for open and close parentheses. In the example above, all they do is group the two statements in the <code>else</code>-clause together. Suppose the author had written this instead:</p>
<pre ml:content="ocaml noeval">
if GtkBase.Object.is_a obj cls then
  fun _ -&gt; f obj
else
  eprintf &quot;Glade-warning: %s expects a %s argument.\n&quot; name cls;
  raise Not_found
</pre>

<p>Fully bracketing and properly indenting the above expression gives:</p>
<pre ml:content="ocaml noeval">
(if GtkBase.Object.is_a obj cls then
   fun _ -&gt; f obj
 else
   eprintf &quot;Glade-warning: %s expects a %s argument.\n&quot; name cls
);
raise Not_found
</pre>

<p>Not what was intended at all. So the <code>begin</code> and <code>end</code> are necessary to group together multiple statements in a <code>then</code> or <code>else</code> clause of an if expression. You can also use plain ordinary parentheses <code>( ... )</code> if you prefer (and I do prefer, because I <strong>loathe</strong> Pascal :-). Here are two simple examples:</p>
<pre ml:content="ocaml">
  if 1 = 0 then
    print_endline &quot;THEN&quot;
  else begin
    print_endline &quot;ELSE&quot;;
    failwith &quot;else clause&quot;
  end;;

  if 1 = 0 then
    print_endline &quot;THEN&quot;
  else (
    print_endline &quot;ELSE&quot;;
    failwith &quot;else clause&quot;
  );;
</pre>

<a name="For_loops_and_while_loops"></a><h2><span>For loops and while loops</span></h2>
<p>OCaml supports a rather limited form of the familiar <code>for</code> loop:</p>
<pre ml:content="ocaml noeval">
for variable = start_value to end_value do
  expression
done

for variable = start_value downto end_value do
  expression
done
</pre>

<p>A simple but real example from lablgtk:</p>
<pre ml:content="ocaml noeval">
for i = 1 to n_jobs () do
  do_next_job ()
done
</pre>

<p>In OCaml, <code>for</code> loops are just shorthand for writing:</p>
<pre ml:content="ocaml noeval">
let i = 1 in
do_next_job ();
let i = 2 in
do_next_job ();
let i = 3 in
do_next_job ();
  ...
let i = n_jobs () in
do_next_job ();
()
</pre>

<p>OCaml doesn't support the concept of breaking out of a <code>for</code> loop early - i.e. it has no <code>break</code>, <code>continue</code> or <code>last</code> statements. (You <em>could</em> throw an exception and catch it outside, and this would run fast but often looks clumsy.)  </p>
<p>The expression inside an OCaml for loop should evaluate to <code>unit</code> (otherwise you'll get a warning), and the for loop expression as a whole returns <code>unit</code>:</p>
<pre ml:content="ocaml">
for i = 1 to 10 do i done;;
</pre>

<p>Functional programmers tend to use recursion instead of explicit loops, and regard <strong>for</strong> loops with suspicion since it can't return anything, hence OCaml's relatively powerless <strong>for</strong> loop.  We talk about recursion below.</p>
<p><strong>While loops</strong> in OCaml are written:</p>
<pre ml:content="ocaml noeval">
while boolean-condition do
  expression
done
</pre>

<p>As with for loops, there is no way provided by the language to break out of a while loop, except by throwing an exception, and this means that while loops have fairly limited use. Again, remember that functional programmers like recursion, and so while loops are second-class citizens in the language.</p>
<p>If you stop to consider while loops, you may see that they aren't really any use at all, except in conjunction with our old friend references. Let's imagine that OCaml didn't have references for a moment:</p>
<pre ml:content="ocaml noeval">
let quit_loop = false in
while not quit_loop do
  print_string &quot;Have you had enough yet? (y/n) &quot;;
  let str = read_line () in
  if str.[0] = 'y' then
    (* how do I set quit_loop to true ?!? *)
done
</pre>

<p>Remember that <code>quit_loop</code> is not a real &quot;variable&quot; - the let-binding just makes <code>quit_loop</code> a shorthand for <code>false</code>. This means the while loop condition (shown in red) is always true, and the loop runs on forever!</p>
<p>Luckily OCaml <em>does have</em> references, so we can write the code above if we want. Don't get confused and think that the <code>!</code> (exclamation mark) means &quot;not&quot; as in C/Java. It's used here to mean &quot;dereference the pointer&quot;, similar in fact to Forth. You're better off reading <code>!</code> as &quot;get&quot; or &quot;deref&quot;.</p>
<pre ml:content="ocaml noeval">
let quit_loop = ref false in
while not !quit_loop do
  print_string &quot;Have you had enough yet? (y/n) &quot;;
  let str = read_line () in
  if str.[0] = 'y' then
    quit_loop := true
done;;
</pre>

<a name="Looping_over_lists"></a><h2><span>Looping over lists</span></h2>
<p>If you want to loop over a list, don't be an imperative programmer and reach for your trusty six-shooter Mr. For Loop! OCaml has some better and faster ways to loop over lists, and they are all located in the <code>List</code> module. There are in fact dozens of good functions in <code>List</code>, but I'll only talk about the most useful ones here.</p>
<p>First off, let's define a list for us to use:</p>
<pre ml:content="ocaml">
let my_list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
</pre>

<p>If you want to call a function once on every element of the list, use <code>List.iter</code>, like this:</p>
<pre ml:content="ocaml">
  let f elem =
    Printf.printf &quot;I'm looking at element %d now\n&quot; elem in
  List.iter f my_list
</pre>

<p><code>List.iter</code> is in fact what you should think about using first every time your cerebellum suggests you use a for loop.</p>
<p>If you want to <em>transform</em> each element separately in the list - for example, doubling each element in the list - then use <code>List.map</code>. This function will be familiar to people who've</p>
<p>programmed in Perl before.</p>
<pre ml:content="ocaml">
  List.map (( * ) 2) my_list
</pre>

<p>Perl has the useful function &quot;grep&quot; for filtering only elements of a list which satisfy some condition - eg. returning all even numbers in a list. In OCaml this function is called <code>List.filter</code>:</p>
<pre ml:content="ocaml">
  let is_even i =
    i mod 2 = 0 in
  List.filter is_even my_list
</pre>

<p>To find out if a list contains some element, use <code>List.mem</code> (short for member):</p>
<pre ml:content="ocaml">
  List.mem 12 my_list
</pre>

<p><code>List.for_all</code> and <code>List.exists</code> are the same as the &quot;forall&quot; and &quot;exist&quot; operators in predicate logic.</p>
<p>For operating over two lists at the same time, there are &quot;-2&quot; variants of some of these functions, namely <code>iter2</code>, <code>map2</code>, <code>for_all2</code>, <code>exists2</code>.</p>
<p>The <code>map</code> and <code>filter</code> functions operate on individual list elements in isolation. &lt;dfn&gt;Fold&lt;/dfn&gt; is a more unusual operation that is best thought about as &quot;inserting an operator between each element of the list&quot;. Suppose I wanted to add all the numbers in my list together. In hand-waving terms what I want to do is insert a plus sign between the elements in my list:</p>
<pre ml:content="ocaml noeval">
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
</pre>

<p>The fold operation does this, although the exact details are  a little bit more tricky. First of all, what happens if I try to fold an empty list? In the case of summing the list it would be nice if the answer was zero, instead of error. However if I was trying to find the product of the list, I'd like the answer to be one instead. So I obviously have to provide some sort of &quot;default&quot; argument to my fold. The second issue doesn't arise with simple operators like <code>+</code> and <code>*</code>: what happens if the operator I'm using isn't associative, ie. (a <em>op</em> b) <em>op</em> c not equal to a <em>op</em> (b <em>op</em> c)? In that case it would matter if I started from the left hand end of the list and worked right, versus if I started from the right and worked left. For this reason there are two versions of fold, called <code>List.fold_left</code> (works left to right) and <code>List.fold_right</code> (works right to left, and is also less efficient).</p>
<p>Let's use <code>List.fold_left</code> to define <code>sum</code> and <code>product</code> functions for integer lists:</p>
<pre ml:content="ocaml">
let sum = List.fold_left ( + ) 0;;
let product = List.fold_left ( * ) 1;;
sum my_list;;
product my_list;;
</pre>

<p>That was easy! Notice that I've accidentally come up with a way to do mathematical factorials:</p>
<pre ml:content="ocaml">
let fact n = product (range 1 n);;
fact 10;;
</pre>

<p>(Notice that this factorial function isn't very useful because it overflows the integers and gives wrong answers even for quite small values of <code>n</code>. A real factorial function would use the <code>Big_int</code> module.)</p>

<a name="Looping_over_strings"></a><h2><span>Looping over strings</span></h2>
<p>The <code>String</code> module also contains many dozens of useful string-related functions, and some of them are concerned with looping over strings.</p>
<p><code>String.fill</code> and <code>String.blit</code> are the equivalents to C <code>memset</code> and <code>strcpy</code> respectively. <code>String.copy</code> copies a string, like <code>strdup</code>.</p>
<p>There is also a <code>String.iter</code> function which works like <code>List.iter</code>, except over the characters of the string.</p>

<a name="Recursion"></a><h2><span>Recursion</span></h2>
<p>Now we come to a hard topic - recursion. Functional programmers are defined by their love of recursive functions, and in many ways recursive functions in f.p. are the equivalent of loops in imperative programming. In functional languages loops are second-class citizens, whilest recursive functions get all the best support.</p>
<p>Writing recursive functions requires a change in mindset from writing for loops and while loops. So what I'll give you in this section will be just an introduction and examples.</p>
<p>In the first example we're going to read the whole of a file into memory (into a long string). There are essentially three possible approaches to this:</p>

<h3>Approach 1</h3>
<p>Get the length of the file, and read it all in one go using the <code>really_input</code> method. This is the simplest, but it might not work on channels which are not really files (eg.  reading keyboard input) which is why we look at the other two approaches.</p>

<h3>Approach 2</h3>
<p>The imperative approach, using a while loop which is broken out of using an exception.</p>

<h3>Approach 3</h3>
<p>A recursive loop, breaking out of the recursion again using an exception.</p>
<p>-----</p>
<p>We're going to introduce a few new concepts here. Our second two approaches will use the <code>Buffer</code> module - an expandable buffer which you can think of like a string onto which you can efficiently append more text at the end. We're also going to be catching the <code>End_of_file</code> exception which the input functions throw when they reach the end of the input. Also we're going to use <code>Sys.argv.(1)</code> to get the first command line parameter.</p>
<pre ml:content="ocaml noeval">
(* Read whole file: Approach 1 *)

let read_whole_chan chan =
  let len = in_channel_length chan in
  let result = String.create len in
  really_input chan result 0 len;
  result

let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan

let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  Printf.printf &quot;I read %d characters from %s\n&quot; (String.length str) filename
</pre>

<p>Approach 1 works but is not very satisfactory because <code>read_whole_chan</code> won't work on non-file channels like keyboard input or sockets. Approach 2 involves a while loop:</p>
<pre ml:content="ocaml noeval">
(* Read whole file: Approach 2 *)

let read_whole_chan chan =
  let buf = Buffer.create 4096 in
  try
    while true do
      let line = input_line chan in
      Buffer.add_string buf line;
      Buffer.add_char buf '\n'
    done;
    assert false (* This is never executed (always raise Assert_failure). *)
  with
    End_of_file -&gt; Buffer.contents buf

let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan

let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  Printf.printf &quot;I read %d characters from %s\n&quot; (String.length str) filename
</pre>

<p>The key to approach 2 is to look at the central while loop. Remember that I said the only way to break out of a while loop early was with an exception? This is exactly what we're doing here. Although I haven't covered exceptions yet, you probably won't have any trouble understanding the <code>End_of_file</code> exception thrown in the code above by <code>input_line</code> when it hits the end of the file. The buffer <code>buf</code> accumulates the contents of the file, and when we hit the end of the file we return it (<code>Buffer.contents buf</code>).</p>
<p>One curious point about this is the apparently superfluous extra set of quotes (<code>&quot;&quot;</code>) just after the while loop. What are they for? Remember that while loops, like for loops, are just expressions, and they return the <code>unit</code> object (<code>()</code>). However OCaml demands that the return type inside a <code>try</code> matches the return type of each caught exception. In this case because <code>End_of_file</code> results in a <code>string</code>, the main body of the <code>try</code> must also &quot;return&quot; a string - even though because of the infinite while loop the string could never actually be returned.</p>
<p>Here's our recursive version. Notice that it's <em>shorter</em> than approach 2, but not so easy to understand for imperative programmers at least:</p>
<pre ml:content="ocaml noeval">
(* Read whole file: Approach 3 *)

let read_whole_chan chan =
  let buf = Buffer.create 4096 in
  let rec loop () =
    let line = input_line chan in
    Buffer.add_string buf line;
    Buffer.add_char buf '\n';
    loop () in
  try
    loop ()
  with
    End_of_file -&gt; Buffer.contents buf

let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan

let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  Printf.printf &quot;I read %d characters from %s\n&quot; (String.length str) filename
</pre>

<p>Again we have an infinite loop - but in this case done using recursion. <code>loop</code> calls itself at the end of the function. The infinite recursion is broken when <code>input_line</code> throws an <code>End_of_file</code> exception.</p>
<p>It looks like approach 3 might overflow the stack if you gave it a particularly large file, but this is in fact not the case. Because of tail recursion (discussed below) the compiler will turn the recursive <code>loop</code> function into a real while loop (!) which runs in constant stack space.</p>
<p>In the next example we will show how recursion is great for constructing or examining certain types of data structures, particularly trees. Let's have a recursive type to represent files in a filesystem:</p>
<pre ml:content="ocaml noeval">
type filesystem = File of string | Directory of filesystem list
</pre>

<p>The <code>opendir</code> and <code>readdir</code> functions are used to open a directory and read elements from the directory. I'm going to define a handy <code>readdir_no_ex</code> function which hides the annoying <code>End_of_file</code> exception that <code>readdir</code> throws when it reaches the end of the directory:</p>
<pre ml:content="ocaml noeval">
open Unix  (*  You may need to #load &quot;Unix.cma&quot; *)

let readdir_no_ex dirh =
  try
    Some (readdir dirh)
  with
    End_of_file -&gt; None
</pre>

<p>The type of <code>readdir_no_ex</code> is this. Recall our earlier discussion about null pointers.</p>
<pre ml:content="ocaml noeval">
readdir_no_ex : dir_handle -&gt; string option
</pre>

<p>I'm also going to define a simple recursive function which I can use to convert the <code>filesystem</code> type into a string for (eg) printing:</p>
<pre ml:content="ocaml noeval">
let rec string_of_filesystem fs =
  match fs with
  | File filename -&gt; filename ^ &quot;\n&quot;
  | Directory fs_list -&gt;
      List.fold_left (^) &quot;&quot; (List.map string_of_filesystem fs_list)
</pre>

<p>Note the use of <code>fold_left</code> and <code>map</code>. The <code>map</code> is used to (recursively) convert each <code>filesystem</code> in the list into a <code>string</code>. Then the <code>fold_left (^) &quot;&quot;</code> concatenates the list together into one big string. Notice also the use of pattern matching.  (The library defines a function called <code>String.concat</code> which is essentially equivalent to <code>fold_left (^) </code>, but implemented more efficiently).</p>
<p>Now let's define a function to read a directory structure, recursively, and return a recursive <code>filesystem</code> data structure. I'm going to show this function in steps, but I'll print out the entire function at the end of this section. First the outline of the function:</p>
<pre ml:content="ocaml noeval">
let rec read_directory path =
  let dirh = opendir path in
  let rec loop () =
    (* ..... *) in
  Directory (loop ())
</pre>

<p>The call to <code>opendir</code> opens up the given path and returns a <code>dir_handle</code> from which we will be able to read the names using <code>readdir_no_ex</code> later. The return value of the function is going to be a <code>Directory <em>fs_list</em></code>, so all we need to do to complete the function is to write our function <code>loop</code> which returns a list of <code>filesystem</code>s. The type of <code>loop</code> will be:</p>
<pre ml:content="ocaml noeval">
loop : unit -&gt; filesystem list
</pre>

<p>How do we define loop? Let's take it in steps again.</p>
<pre ml:content="ocaml noeval">
let rec loop () =
  let filename = readdir_no_ex dirh in
  (* ..... *)
</pre>

<p>First we read the next filename from the directory handle. <code>filename</code> has type <code>string option</code>, in other words it could be <code>None</code> or <code>Some &quot;foo&quot;</code> where <code>foo</code> is the name of the next filename in the directory. We also need to ignore the <code>&quot;.&quot;</code> and <code>&quot;..&quot;</code> files (ie. the current directory and the parent directory). We can do all this with a nice pattern match:</p>
<pre ml:content="ocaml noeval">
let rec loop () =
  let filename = readdir_no_ex dirh in
  match filename with
  | None -&gt; []
  | Some &quot;.&quot; -&gt; loop ()
  | Some &quot;..&quot; -&gt; loop ()
  | Some filename -&gt;
     (* ..... *)
</pre>

<p>The <code>None</code> case is easy. Thinking recursively (!)  if <code>loop</code> is called and we've reached the end of the directory, <code>loop</code> needs to return a list of entries - and there's no entries - so it returns the empty list (<code>[]</code>).</p>
<p>For <code>&quot;.&quot;</code> and <code>&quot;..&quot;</code> we just ignore the file and call <code>loop</code> again.</p>
<p>What do we do when <code>loop</code> reads a real filename (the <code>Some filename</code> match below)? Let <code>pathname</code> be the full path to the file.  We 'stat' the file to see if it's really a directory.  If it <em>is</em> a directory, we set <code>this</code> by recursively calling <code>read_directory</code> which will return <code>Directory <em>something</em></code>. Notice that the overall result of <code>read_directory</code> is <code>Directory (loop ())</code>. If the file is really a file (not a directory) then we let <code>this</code> be <code>File pathname</code>. Then we do something clever: we return <code>this :: loop ()</code>. This is the recursive call to <code>loop ()</code> to calculate the remaining directory members (a list), to which we prepend <code>this</code>.</p>
<pre ml:content="ocaml noeval">
let rec read_directory path =
  let dirh = opendir path in
  let rec loop () =
    let filename = readdir_no_ex dirh in
    match filename with
    | None -&gt; []
    | Some &quot;.&quot; -&gt; loop ()
    | Some &quot;..&quot; -&gt; loop ()
    | Some filename -&gt;
        let pathname = path ^ &quot;/&quot; ^ filename in
        let stat = lstat pathname in
        let this = if stat.st_kind = S_DIR then
                     read_directory pathname
                   else
                     File pathname in
        this :: loop () in
  Directory (loop ())
</pre>

<p>That's quite a complex bit of recursion, but although this is a made-up example, it's fairly typical of the complex patterns of recursion found in real-world functional programs. The two important lessons to take away from this are:</p>
<ul><li>The use of recursion to build a list:</li></ul>
<pre ml:content="ocaml noeval">
let rec loop () =
  a match or if statement
  | base case -&gt; []
  | recursive case -&gt; element :: loop ()
</pre>

<p>Compare this to our previous <code>range</code> function. The pattern of recursion is exactly the same:</p>
<pre ml:content="ocaml noeval">
let rec range a b =
  if a &gt; b then []            (* Base case *)
  else a :: range (a+1) b     (* Recursive case *)
  ;;
</pre>

<ul><li>The use of recursion to build up trees:</li></ul>
<pre ml:content="ocaml noeval">
let rec read_directory path =
  (* blah blah *)
  if file-is-a-directory then
    read_directory path-to-file
  else
    Leaf file
</pre>

<p>All that remains now to make this a working program is a little bit of code to call <code>read_directory</code> and display the result:</p>
<pre ml:content="ocaml noeval">
let path = Sys.argv.(1) in
let fs = read_directory path in
print_endline (string_of_filesystem fs)
</pre>

<h3>Addendum</h3>
<p>After I posted this example to the caml-list mailing list I received many follow-ups. (You can <a href="http://caml.inria.fr/pub/ml-archives/caml-list/2003/06/2732fbf1bed1ae50fefb6ea410ea9955.en.html" class="external" title="http://caml.inria.fr/pub/ml-archives/caml-list/2003/06/2732fbf1bed1ae50fefb6ea410ea9955.en.html">read the full thread</a>.)</p>
<p>First of all there is a basic fault with <code>read_directory</code> directory which will cause it to fail if you try to run it on very large directory structures. I don't explicitly call <code>closedir</code> to close the directory handle. The garbage collector doesn't help, because in OCaml the garbage collector does <strong>not</strong> collect and close open file and directory handles.</p>
<p>The fix is pretty trivial: add a call to <code>closedir</code> at the end of the <code>read_directory</code> function:</p>
<pre ml:content="ocaml noeval">
let rec read_directory path =
  let dirh = opendir path in
    (* ... *)
  let result = Directory (loop ()) in
  closedir dirh;
  result
</pre>

<p>Next up is the issue of <code>readdir</code> throwing an exception in a rather &quot;unexceptional&quot; situation, namely <code>End_of_file</code>. I don't agree that throwing an exception in this case is the right thing to do. In typical programs I want to never have to write a <code>try ... with</code> clause, because exceptions are supposed to mean &quot;something really bad happened which I'm not prepared to deal with&quot;, like running out of disk space or memory. Throwing an exception as part of the routine running of a function (every program which uses <code>readdir</code> <em>has</em> to be prepared to handle <code>End_of_file</code>), that's not an exceptional situation.</p>
<p>However, Eric Cooper came up with a way to write the function and check the exception, and this highlights another frequent technique used by functional programmers. Namely, passing an <strong>accumulator</strong> which contains the result of the function call, but passed as an <em>argument</em> to the function (!) Really the accumulator means &quot;this is the result so far&quot;, so in the exceptional case (<code>End_of_file</code>) we give up and return the result so far. Here is his code with all the references to the accumulator argument in red:</p>
<pre ml:content="ocaml noeval">
let rec read_filesystem path =
  if (lstat path).st_kind = S_DIR then
    Directory (read_directory path)
  else
    File path

and read_directory path =
  let dirh = opendir path in
  let rec loop entries =
    try
      match readdir dirh with
      | &quot;.&quot; | &quot;..&quot; -&gt; loop entries
      | filename -&gt; loop (read_filesystem (path ^ &quot;/&quot; ^ filename) :: entries)
    with End_of_file -&gt; entries in
  let list = loop [] in
  closedir dirh;
  list
</pre>

<p>Notice <code>End_of_file -&gt; entries</code> which means &quot;when we get the exception, give up and return the result so far&quot;.</p>
<p>Next up - it was pointed out that the easiest way to do this is actually not to use recursion at all, but instead to do the loop imperatively (a while loop is probably best) and have a reference to a list to store the ongoing accumulated result. Because <code>readdir</code> throws an exception, we have a simple way to break out of the while loop, <em>and</em> in the <code>with</code>-clause we can just return <code>!list</code> (dereference the reference to the list of entries we've built up).</p>
<p>It all works nicely, and proves that writing code imperatively is often best, <em>particularly</em> as in this case where <code>opendir ... readdir ... closedir</code> is essentially an imperative API, designed for C programmers. It's no surprise, therefore, that the imperative solution is easier. OCaml, not being a  <a href="http://www.elsewhere.org/jargon/html/entry/bondage-and-discipline-language.html" class="external" title="http://www.elsewhere.org/jargon/html/entry/bondage-and-discipline-language.html">bondage and discipline language</a>, doesn't mind you using the imperative approach when it makes sense.</p>
<p>Here is the outline of the imperative approach by Fabrice Le Fessant:</p>
<pre ml:content="ocaml noeval">
let list = ref [] in
let dir = opendir &quot;.......&quot; in
try
  while true do
    match readdir dir with
    | &quot;.&quot; | &quot;..&quot; -&gt; ()
    | filename -&gt; list := filename :: !list
  done
with End_of_file -&gt; !list
</pre>

<h3>Recursion example: maximum element in a list</h3>
<p>Remember the basic recursion pattern for lists:</p>
<pre ml:content="ocaml noeval">
let rec loop () =
  a match or if statement
  | base case -&gt; []
  | recursive case -&gt; element :: loop ()
</pre>

<p>The key here is actually the use of the match / base case / recursive case pattern. In this example - finding the maximum element in a list - we're going to have two base cases and one recursive case. But before I jump ahead to the code, let's just step back and think about the problem. By thinking about the problem, the solution will appear &quot;as if by magic&quot; (I promise you :-)</p>
<p>First of all, let's be clear that the maximum element of a list is just the biggest one. eg. The maximum element of the list <code>[1; 2; 3; 4; 1]</code> is <code>4</code>.</p>
<p>Are there any special cases? Yes there are. What's the maximum element of the empty list <code>[]</code>? There <em>isn't one</em>. If we are passed an empty list, we should throw an error.</p>
<p>What's the maximum element of a single element list such as <code>[4]</code>? That's easy: it's just the element itself. So <code>list_max [4]</code> should return <code>4</code>, or in the general case, <code>list_max [x]</code> should return <code>x</code>.</p>
<p>What's the maximum element of the general list <code>x :: remainder</code> (this is the &quot;cons&quot; notation for the list, so <code>remainder</code> is the tail - also a list)?</p>
<p>Think about this for a while. Suppose you know the maximum element of <code>remainder</code>, which is, say, <code>y</code>. What's the maximum element of <code>x :: remainder</code>? It depends on whether <code>x &gt; y</code> or <code>x &lt;= y</code>. If <code>x</code> is bigger than <code>y</code>, then the overall maximum is <code>x</code>, whereas conversely if <code>x</code> is less than <code>y</code>, then the overall maximum is <code>y</code>.</p>
<p>Does this really work? Consider <code>[1; 2; 3; 4; 1]</code> again. This is <code>1 :: [2; 3; 4; 1]</code>. Now the maximum element of the remainder, <code>[2; 3; 4; 1]</code>, is <code>4</code>. So now we're interested in <code>x = 1</code> and <code>y = 4</code>.  That head element <code>x = 1</code> doesn't matter because <code>y = 4</code> is bigger, so the overall maximum of the whole list is <code>y = 4</code>.</p>
<p>Let's now code those rules above up, to get a working function:</p>
<pre ml:content="ocaml">
  let rec list_max xs =
    match xs with
    | [] -&gt; failwith &quot;list_max called on empty list&quot;  (* empty list: fail *)
    | [x] -&gt; x                                        (* single element list: return the element *)
    | x :: remainder -&gt; max x (list_max remainder)    (* multiple element list: recursive case *)
</pre>

<p>I've added comments so you can see how the rules / special cases we decided upon above really correspond to lines of code.</p>
<p>Does it work?</p>
<pre ml:content="ocaml">
list_max [1; 2; 3; 4; 1];;
list_max [];;
list_max [5; 4; 3; 2; 1];;
list_max [5; 4; 3; 2; 1; 100];;
</pre>

<p>Notice how the solution proposed is both (a) very different from the imperative for-loop solution, and (b) much more closely tied to the problem specification. Functional programmers will tell you that this is because the functional style is much higher level than the imperative style, and therefore better and simpler. Whether you believe them is up to you. It's certainly true that it's much simpler to reason logically about the functional version, which is useful if you wanted to formally prove that <code>list_max</code> is correct (&quot;correct&quot; being the mathematical way to say that a program is provably bug-free, useful for space shuttles, nuclear power plants and higher quality software in general).</p>

<h3>Tail recursion</h3>
<p>Let's look at the <code>range</code> function again for about the twentieth time:</p>
<pre ml:content="ocaml noeval">
let rec range a b =
  if a &gt; b then []
  else a :: range (a+1) b
</pre>

<p>I'm going to rewrite it slightly to make something about the structure of the program clearer (still the same function however):</p>
<pre ml:content="ocaml silent">
let rec range a b =
  if a &gt; b then []
  else
    let result = range (a+1) b in
    a :: result
</pre>

<p>Let's call it:</p>
<pre ml:content="ocaml">
List.length (range 1 10);;
List.length (range 1 1000000);;
</pre>

<p>Hmmm ... at first sight this looks like a problem with recursive programming, and hence with the whole of functional programming! If you write your code recursively instead of iteratively then you necessarily run out of stack space on large inputs, right?</p>
<p>In fact, wrong. Compilers can perform a simple optimisation on certain types of recursive functions to turn them into while loops. These certain types of recursive functions therefore run in constant stack space, and with the equivalent efficiency of imperative while loops. These functions are called <strong>tail-recursive functions</strong>.</p>
<p>In tail-recursive functions, the recursive call happens last of all. Remember our <code>loop ()</code> functions above? They all had the form:</p>
<pre ml:content="ocaml noeval">
let rec loop () =
  (* do something *)
  loop ()
</pre>

<p>Because the recursive call to <code>loop ()</code> happens as the very last thing, <code>loop</code> is tail-recursive and the compiler will turn the whole thing into a while loop.</p>
<p>Unfortunately <code>range</code> is not tail-recursive, and the longer version above shows why. The recursive call to <code>range</code> doesn't happen as the very last thing. In fact the last thing to happen is the <code>::</code> (cons) operation. As a result, the compiler doesn't turn the recursion into a while loop, and the function is not efficient in its use of stack space.</p>
<p>Now recall we discussed in the addendum above Eric Cooper's &quot;accumulator&quot; technique, and I said that this technique was widely used in functional programming. We will now see why this is the case. It's because it allows you to write functions such as <code>range</code> above in a tail-recursive manner, which means they will be efficient and work properly on large inputs.</p>
<p>Let's plan our rewritten <code>range</code> function which will use an accumulator argument to store the &quot;result so far&quot;:</p>
<pre ml:content="ocaml noeval">
let rec range2 a b accum =
  (* ... *)

let range a b =
  range2 a b []
</pre>

<p>(I could and probably should have used a nested function here.)</p>
<p>The <code>accum</code> argument is going to accumulate the result. It's the &quot;result so far&quot;. We pass in the empty list (&quot;no result so far&quot;). The easy case is when <code>a &gt; b</code>:</p>
<pre ml:content="ocaml noeval">
let rec range2 a b accum =
  if a &gt; b then accum
  else
    (* ... *)
</pre>

<p>If <code>a &gt; b</code> (ie. if we've reached the end of the recursion), then stop and return the result (<code>accum</code>).</p>
<p>Now the trick is to write the <code>else</code>-clause and make sure that the call to <code>range2</code> is the very last thing that we do, so the function is tail-recursive:</p>
<pre ml:content="ocaml">
  let rec range2 a b accum =
    if a &gt; b then accum
    else range2 (a+1) b (a :: accum)
</pre>

<p>There's only one slight problem with this function: it constructs the list backwards!  However, this is easy to rectify by redefining range as:</p>
<pre ml:content="ocaml">
 let range a b = List.rev (range2 a b []);;
</pre>

<p>It works this time, although it's a bit slow to run because it really does have to construct a list with a million elements in it:</p>
<pre ml:content="ocaml">
  List.length (range 1 1000000)
</pre>

<p>The following implementation is twice as fast as the previous one, because it does not need to reverse a list:</p>
<pre ml:content="ocaml">
  let rec range2 a b accum =
    if b &lt; a then accum
    else range2 a (b-1) (b :: accum);;

  let range a b =
    range2 a b [];;
</pre>

<p>That was a brief overview of tail recursion, but in real world situations determining if a function is tail recursive can be quite hard. What did we really learn here? One thing is that recursive functions have a dangerous trap for inexperienced programmers. Your function can appear to work for small inputs (during testing), but fail catastrophically in the field when exposed to large inputs. This is one argument <em>against</em> using recursive functions, and for using explicit while loops when possible.</p>
<a name="Mutable_records__references__again___and_arrays"></a><h2><span>Mutable records, references (again!) and arrays</span></h2>
<p>Previously we mentioned records in passing. These are like C <code>struct</code>s:</p>
<pre ml:content="ocaml">
type pair_of_ints = { a : int; b : int };;
{a=3; b=5};;
{a=3};;
</pre>

<p>One feature which I didn't cover: OCaml records can have mutable fields. Normally an expression like <code>{a = 3; b = 5}</code> is an immutable, constant object. However if the record has &lt;dfn&gt;mutable fields&lt;/dfn&gt;, then there is a way to change those fields in the record. This is an imperative feature of OCaml, because functional languages don't normally allow mutable objects (or references or mutable arrays, which we'll look at in a moment).</p>
<p>Here is an object defined with a mutable field. This field is used to count how many times the object has been accessed. You could imagine this being used in a caching scheme to decide which objects you'd evict from memory.</p>
<pre ml:content="ocaml silent">
  type name = { name : string; mutable access_count : int }
</pre>

<p>Here is a function defined on names which prints the <code>name</code> field and increments the mutable <code>access_count</code> field:</p>
<pre ml:content="ocaml">
  let print_name name =
    print_endline (&quot;The name is &quot; ^ name.name);
    name.access_count &lt;- name.access_count + 1
</pre>

<p>Notice a strange, and very non-functional feature of <code>print_name</code>: it modifies its <code>access_count</code> parameter. If you read chapter 5 closely, you'll see that this function is not &quot;pure&quot;. OCaml is a functional language, but not to the extent that it forces functional programming down your throat.</p>
<p>Anyway, let's see <code>print_name</code> in action:</p>
<pre ml:content="ocaml">
  let n = { name = &quot;Richard Jones&quot;; access_count = 0 };;
  n;;
  print_name n;;
  n;;
  print_name n;;
  n;;
</pre>

<p>Only fields explicitly marked as <code>mutable</code> can be assigned to using the <code>&lt;-</code> operator. If you try to assign to a non-mutable field, OCaml won't let you:</p>
<pre ml:content="ocaml">
  n.name &lt;- &quot;John Smith&quot;;;
</pre>

<p>References, with which we should be familiar by now, are implemented using records with a mutable <code>contents</code> field. Check out the definition in <code>Pervasives</code>:</p>
<pre ml:content="ocaml noeval">
type 'a ref = { mutable contents : 'a }
</pre>

<p>And look closely at what the OCaml toplevel prints out for the value of a reference:</p>
<pre ml:content="ocaml">
let r = ref 100;;
</pre>

<p>Arrays are another sort of mutable structure provided by OCaml.  In OCaml, plain lists are implemented as linked lists, and linked lists are slow for some types of operation. For example, getting the head of a list, or iterating over a list to perform some operation on each element is reasonably fast. However, jumping to the n<sup>th</sup> element of a list, or trying to randomly access a list - both are slow operations. The OCaml <code>Array</code> type is a real array, so random access is fast, but insertion and deletion of elements is slow. <code>Array</code>s are also mutable so you can randomly change elements too.</p>
<p>The basics of arrays are simple:</p>
<pre ml:content="ocaml">
  let a = Array.create 10 0;;
  for i = 0 to Array.length a - 1 do
    a.(i) &lt;- i
  done;;
  a;;
</pre>

<p>Notice the syntax for writing arrays: <code>[| <em>element</em>; <em>element</em>; ... |]</code></p>
<p>The OCaml compiler was designed with heavy numerical processing in mind (the sort of thing that FORTRAN is traditionally used for), and so it contains various optimisations specifically for arrays of numbers, vectors and matrices. Here is some benchmark code for doing dense matrix multiplication. Notice that it uses for-loops and is generally very imperative in style:</p>
<pre ml:content="ocaml noeval">
(*
 * $Id: index.shtml,v 1.3 2004/04/23 12:33:00 rich Exp $
 * http://www.bagley.org/~doug/shootout/
 * from Markus Mottl
 *)

let size = 30

let mkmatrix rows cols =
  let count = ref 1
  and last_col = cols - 1
  and m = Array.make_matrix rows cols 0 in
  for i = 0 to rows - 1 do
    let mi = m.(i) in
    for j = 0 to last_col do
      mi.(j) &lt;- !count;
      incr count
    done;
  done;
  m

let rec inner_loop k v m1i m2 j =
  if k &lt; 0 then v
  else inner_loop (k - 1) (v + m1i.(k) * m2.(k).(j)) m1i m2 j

let mmult rows cols m1 m2 m3 =
  let last_col = cols - 1
  and last_row = rows - 1 in
  for i = 0 to last_row do
    let m1i = m1.(i) and m3i = m3.(i) in
    for j = 0 to last_col do
      m3i.(j) &lt;- inner_loop last_row 0 m1i m2 j
    done;
  done

let () =
  let n =
    try int_of_string Sys.argv.(1)
    with Invalid_argument _ -&gt; 1
  and m1 = mkmatrix size size
  and m2 = mkmatrix size size
  and m3 = Array.make_matrix size size 0 in
  for i = 1 to n - 1 do
    mmult size size m1 m2 m3
  done;
  mmult size size m1 m2 m3;
  Printf.printf &quot;%d %d %d %d\n&quot; m3.(0).(0) m3.(2).(3) m3.(3).(2) m3.(4).(4)
</pre>


</div>

</body>
