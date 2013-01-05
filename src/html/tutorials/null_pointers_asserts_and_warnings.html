<title>Null Pointers, Asserts and Warnings</title>
<body>

  <div class="pull-right hero-unit" style="margin-left: 1em" >
    <em>Table of contents</em>
    <div ml:replace="toc 2 2"></div>
  </div>

<h1>Null Pointers, Asserts and Warnings</h1>

<h2><a name="Null_pointers"></a>Null pointers</h2>

<p>So you've got a survey on your website which asks your readers for their names and ages. Only problem is that for some reason a few of your readers don't want to give you their age - they stubbornly refuse to fill that field in. What's a poor database administrator to do?</p>
<p>Assume that the age is represented by an <code>int</code>, there are two possible ways to solve this problem. The most common one (and the most <em>wrong</em> one) is to assume some sort of &quot;special&quot; value for the age which means that the age information wasn't collected. So if, say, age = -1 then the data wasn't collected, otherwise the data was collected (even if it's not valid!). This method kind of works until you start, for example, calculating the mean age of visitors to your website. Since you forgot to take into account your special value, you conclude that the mean age of visitors is 7½ years old, and you employ web designers to remove all the long words and use primary colours everywhere.</p>
<p>The other, correct method is to store the age in a field which has type &quot;int or null&quot;. Here's a SQL table for storing ages:</p>
<pre>
create table users
(
  userid serial,
  name text not null,
  age int             -- may be null
);
</pre>

<p>If the age data isn't collected, then it goes into the database as a special SQL <code>NULL</code> value. SQL ignores this automatically when you ask it to compute averages and so on.</p>
<p>Programming languages also support nulls, although they may be easier to use in some than in others. In Perl, any scalar (ie. number or string) can be <code>undef</code> (Perl's way of saying null). This is a cause of many warnings which are often ignored by inexperienced programmers, even though they probably represent serious errors. In Java, any reference to an object can also be null, so it might make sense in Java to store the age as an <code>Integer</code> and allow references to the age to be <code>null</code>. In C pointers can, of course, be null, but if you wanted a simple integer to be null, you'd have to first box it up into an object allocated by <code>malloc</code> on the heap.</p>
<p>OCaml has an elegant solution to the problem of nulls, using a simple polymorphic variant type defined (in <code>Pervasives</code>) as:</p>
<pre ml:content="ocaml noeval">
  type 'a option = None | Some of 'a
</pre>

<p>A &quot;null pointer&quot; is written <code>None</code>. The type of age in our example above (an <code>int</code> which can be null) is <code>int option</code> [remember: backwards like <code>int list</code> and <code>int binary_tree</code>].</p>
<pre ml:content="ocaml">
  Some 3
</pre>

<p>What about a list of optional ints?</p>
<pre ml:content="ocaml">
  [ None; Some 3; Some 6; None ]
</pre>

<p>And what about an optional list of ints?</p>
<pre ml:content="ocaml">
  Some [1; 2; 3]
</pre>

<h2><a name="Assert__warnings__fatal_errors__and_printing_to_stderr"></a>
  Assert, warnings, fatal errors, and printing to stderr</h2>

<p>One great feature of Perl is the rich set of commands for debugging programs and handling unexpected errors, including the ability to print stack traces, throw and catch exceptions and the like. OCaml doesn't have quite such a rich set of debugging commands - better than Java, about the same as C, not nearly as good as Perl.  (We'll talk about exceptions in more detail later on.)</p>
<p>First of all, <code>assert</code> takes an expression as an argument and throws an exception. Assuming that you don't catch this exception (it's probably unwise to catch this exception, particularly for beginners), this results in the program stopping and printing out the source file and line number where the error occurred. An example:</p>
<pre ml:content="ocaml">
  assert (Sys.os_type = "Win32")
</pre>

<p>(Running this on Win32, of course, won't throw an error).</p>
<p>You can also just call <code>assert false</code> to stop your program if things just aren't going well, but you're probably better to use ...</p>
<p><code>failwith &quot;error message&quot;</code> throws a <code>Failure</code> exception, which again assuming you don't try to catch it, will stop the program with the given error message. <code>failwith</code> is often used during pattern matching, like this real example:</p>
<pre ml:content="ocaml noeval">
match Sys.os_type with
| "Unix" | "Cygwin" ->   (* code omitted *)
| "Win32" ->             (* code omitted *)
| "MacOS" ->             (* code omitted *)
| _ -> failwith "this system is not supported"
</pre>

<p>Note a couple of extra pattern matching features in this example too. A so-called &quot;range pattern&quot; is used to match either <code>&quot;Unix&quot;</code> or <code>&quot;Cygwin&quot;</code>, and the special <code>_</code> pattern which matches &quot;anything else&quot;.</p>
<p>If you want to debug your program, but, like me, you have an aversion to debuggers which aren't gdb, then you'll probably want to print out a warning some way through your function. Here's an example:</p>
<pre ml:content="ocaml noeval">
open Graphics

let () =
  open_graph " 640x480";
  for i = 12 downto 1 do
    let radius = i * 20 in
    prerr_endline ("radius is " ^ string_of_int radius);
    set_color (if i mod 2 = 0 then red else yellow);
    fill_circle 320 240 radius
  done;
  read_line ()
</pre>

<p class="first_para">If you prefer C-style <code>printf</code>'s then try using OCaml's <code>Printf</code> module instead:</p>
<pre ml:content="ocaml noeval">
open Graphics
open Printf

let () =
  open_graph " 640x480";
  for i = 12 downto 1 do
    let radius = i * 20 in
    eprintf "radius is %d\n" radius;
    set_color (if i mod 2 = 0 then red else yellow);
    fill_circle 320 240 radius
  done;
  read_line ()
</pre>

</body>
