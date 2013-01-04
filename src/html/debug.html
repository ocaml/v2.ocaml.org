<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta content="IE=8" http-equiv="X-UA-Compatible" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <title>Debugging</title>
    <link href="css/ocaml.css" media="all" type="text/css" rel="stylesheet" />
  </head>
  <body class="en" onload="caml_onload()">

    <div class="pull-right hero-unit" style="margin-left: 1em" >
      <em>Table of contents</em>
      <div ml:replace="toc"></div>
    </div>

    <h1>Debugging</h1>
    <p>
      This note quickly presents two techniques to debug OCaml
      programs:
    </p>
    <ul>
      <li>
        <a href="#trace">Tracing functions calls</a>that works in the toplevel,
      </li>
      <li>
        <a href="#ocamldebug">OCaml debugger</a>, which allows
        analysing programes compiled with <tt>ocamlc</tt>.
      </li>
    </ul>

    <h2><a name="trace"></a>Tracing functions calls in the toplevel</h2>

    <p>
      The simplest way to debug programs in the toplevel is to follow
      the function calls, by &#8220;tracing&#8221; the faulty
      function:
    </p>
<pre class="listing">
<code ml:replace="ocaml">
  let rec fib x = if x <= 1 then 1 else fib (x - 1) + fib (x - 2);;
</code
><span class="ocamltop-prompt"># </span>#trace fib<span class="ocamltop-prompt">;;</span>
<span class="ocamltop-output">fib is now traced.</span>
<span class="ocamltop-prompt"># </span>fib 3<span class="ocamltop-prompt">;;</span>
<span class="ocamltop-output"
>fib &lt;-- 3
fib &lt;-- 1
fib --&gt; 1
fib &lt;-- 2
fib &lt;-- 0
fib --&gt; 1
fib &lt;-- 1
fib --&gt; 1
fib --&gt; 2
fib --&gt; 3
- : int = 3</span>
<span class="ocamltop-prompt"># </span>#untrace fib<span class="ocamltop-prompt">;;</span>
<span class="ocamltop-output">fib is no longer traced.</span>
</pre>

    <h3><a name="trace-poly"></a>Polymorphic function</h3>

    <p>
      A difficulty with polymorphic functions is that the output of
      the trace system is not very informative in case of polymorphic
      arguments and/or results. Consider a sorting algorithm (say
      bubble sort):
    </p>
    <pre ml:content="ocaml">
  let exchange i j v =
    let aux = v.(i) in
    v.(i) <- v.(j); v.(j) <- aux;;
  
  let one_pass_vect fin v =
    for j = 1 to fin do
      if v.(j - 1) > v.(j) then exchange (j - 1) j v
    done;;
  
  let bubble_sort_vect v =
    for i = Array.length v - 1 downto 0 do
    one_pass_vect i v
  done;;

  let q = [| 18; 3; 1 |];;
</pre>
<pre class="listing">
<span class="ocamltop-prompt"># </span>#trace one_pass_vect<span class="ocamltop-prompt">;;</span>
<span class="ocamltop-output">one_pass_vect is now traced.</span>
<span class="ocamltop-prompt"># </span>bubble_sort_vect q<span class="ocamltop-prompt">;;</span>
<span class="ocamltop-output"
>one_pass_vect &lt;-- 2
one_pass_vect --&gt; &lt;fun&gt;
one_pass_vect* &lt;-- [|&lt;poly&gt;; &lt;poly&gt;; &lt;poly&gt;|]
one_pass_vect* --&gt; ()
one_pass_vect &lt;-- 1
one_pass_vect --&gt; &lt;fun&gt;
one_pass_vect* &lt;-- [|&lt;poly&gt;; &lt;poly&gt;; &lt;poly&gt;|]
one_pass_vect* --&gt; ()
one_pass_vect &lt;-- 0
one_pass_vect --&gt; &lt;fun&gt;
one_pass_vect* &lt;-- [|&lt;poly&gt;; &lt;poly&gt;; &lt;poly&gt;|]
one_pass_vect* --&gt; ()
- : unit = ()</span>
</pre>

    <p>
      The function <code>one_pass_vect</code> being polymorphic, its
      vector argument is printed as a vector containing polymorphic
      values, <code><b></b>[|&lt;poly&gt;; &lt;poly&gt;; <b></b>
      <b></b> <b></b> <b></b> &lt;poly&gt;|]</code>, and thus we
      cannot properly follow the computation.
    </p>

    <p>
      A simple way to overcome this problem is to define a monomorphic
      version of the faulty function. This is fairly easy using a
      <em>type constraint</em>. Generally speaking, this allows a
      proper understanding of the error in the definition of the
      polymorphic function. Once this has been corrected, you just
      have to suppress the type constraint to revert to a polymorphic
      version of the function. For our sorting routine, a single type
      constraint on the argument of the <code>exchange</code> function
      warranties a monomorphic typing, that allows a proper trace of
      function calls:
    </p>

<pre class="listing">
<span class="ocamltop-prompt"># </span><span class="kwa">let</span> <span class="ocaml-function">exchange</span> <span class="ocaml-variable">i j (v : int vect)</span> =
    [...]
<span class="ocamltop-output">exchange : int -&gt; int -&gt; int vect -&gt; unit = &lt;fun&gt;</span>
    [...]
<span class="ocamltop-output">one_pass_vect : int -&gt; int vect -&gt; unit = &lt;fun&gt;</span>
    [...]
<span class="ocamltop-output">bubble_sort_vect : int vect -&gt; unit = &lt;fun&gt;</span>
<span class="ocamltop-prompt"># </span>#trace one_pass_vect<span class="ocamltop-prompt">;;</span>
<span class="ocamltop-output">one_pass_vect is now traced.</span>
<span class="ocamltop-prompt"># </span><span class="kwa">let</span> q = [| 18; 3; 1 |]<span class="ocamltop-prompt">;;</span>
<span class="ocamltop-output">q : int vect = [|18; 3; 1|]</span>
<span class="ocamltop-prompt"># </span>bubble_sort_vect q<span class="ocamltop-prompt">;;</span>
<span class="ocamltop-output"
>one_pass_vect &lt;-- 2
one_pass_vect --&gt; &lt;fun&gt;
one_pass_vect* &lt;-- [|18; 3; 1|]
one_pass_vect* --&gt; ()
one_pass_vect &lt;-- 1
one_pass_vect --&gt; &lt;fun&gt;
one_pass_vect* &lt;-- [|3; 1; 18|]
one_pass_vect* --&gt; ()
one_pass_vect &lt;-- 0
one_pass_vect --&gt; &lt;fun&gt;
one_pass_vect* &lt;-- [|1; 3; 18|]
one_pass_vect* --&gt; ()
- : unit = ()</span>
</pre>

    <h3><a name="trace-limit"></a>Limitations</h3>

    <p>
      To keep track of assignments to data structures and mutable
      variables in a program, the trace facility is not powerful
      enough. You need an extra mechanism to stop the program in any
      place and ask for internal values: that is a symbolic debugger
      with its stepping feature.
    </p>

    <p>
      Stepping a functional program has a meaning which is a bit weird
      to define and understand. Let me say that we use the notion of
      <em>runtime events</em> that happen for instance when a
      parameter is passed to a function or when entering a pattern
      matching, or selecting a clause in a pttern
      matching. Computation progress is taken into account by these
      events, independantly of the instructions executed on the
      hardware.
    </p>

    <p>
      Although this is difficult to implement, there exists such a
      debugger for OCaml under Unix: <tt>ocamldebug</tt> (there also
      exists one for Caml Light, as a user contribution).  Its use is
      illustrated in the next section.
    </p>

    <p>
      In fact, for complex programs, it is likely the case that the
      programmer will use explicit printing to find the bugs, since
      this methodology allows the reduction of the trace material :
      only useful data are printed and special purpose formats are
      more suited to get the relevant information, than what can be
      output automatically by the generic pretty-printer used by the
      trace mechanism.
    </p>


    <h2><a name="ocamldebug"></a>The OCaml debugger</h2>

    <p>
      We now give a quick tutorial for the OCaml debugger
      (<tt>ocamldebug</tt>).  Before starting, please note that
      <tt>ocamldebug</tt> does not work under native Windows ports of
      OCaml (but it runs under the Cygwin port.
    </p>

    <h3><a name="ocamldebug-launch"></a>Launching the debugger</h3>

    <p>
      Consider the following obviously wrong program written in the
      file <tt>uncaught.ml</tt>:
    </p>

    <pre ml:content="ocaml noeval">
(* file uncaught.ml *)
<b>let</b> l = ref [];;
<b>let</b> find_address name = List.assoc name !l;;
<b>let</b> add_address name address = l := (name, address) :: ! l;;
add_address "IRIA" "Rocquencourt";;
print_string (find_address "INRIA"); print_newline ();;
</pre>

    <p>
      At runtime, the program raises an uncaught exception
      <code>Not_found</code>. Suppose we want to find where and why
      this exception has been raised, we can proceed as follows:
    </p>

    <ol>
      <li>we compile the program in debug mode:<br />
      <pre class="listing">
ocamlc -g uncaught.ml</pre>
      </li>
      <li>we launch the debugger:
      <pre class="listing">
ocamldebug a.out</pre>
      </li>
    </ol>

    <p>
      Then the debugger answers with a banner and a prompt:
    </p>
    <pre class="listing">
        OCaml Debugger version 4.00.1

(ocd)</pre>

    <h3><a name="ocamldebug-exception"></a>Finding the cause of a
      spurious exception</h3>

    <p>
      Type <tt>r</tt> (for <em>run</em>); you get
    </p>
    <pre class="listing">
(ocd) r
Loading program... done.
Time : 12
Program end.
Uncaught exception: Not_found
(ocd)</pre>

    <p>
      Self explanatory, is'nt it? So, you want to step backward to set
      the program counter before the time the exception is raised;
      hence type in <tt>b</tt> as <em>backstep</em>, and you get
    </p>

    <pre class="listing">
(ocd) b
Time : 11 - pc : 15500 - module List
143     [] -&gt; &lt;|b|&gt;raise Not_found</pre>

    <p>
      The debugger tells you that you are in module <code>List</code>,
      inside a pattern matching on a list that already chose the
      <code><b></b>[<b></b>]</code> case and is about to execute
      <code>raise Not_found</code>, since the program is stopped just
      before this expression (as witnessed by the
      <code>&lt;|b|&gt;</code> mark).
    </p>

    <p>
      But, as you know, you want the debugger to tell you which
      procedure calls the one from <code>List</code>, and also who
      calls the procedure that calls the one from <code>List</code>;
      hence, you want a backtrace of the execution stack:
    </p>
    <pre class="listing">
(ocd) bt
#0  Pc : 15500  List char 3562
#1  Pc : 19128  Uncaught char 221</pre>

    <p>
      So the last function called is from module <code>List</code> at
      character 3562, that is :
    </p>
    <pre ml:content="ocaml noeval">
let rec assoc x = function
    [] -> raise Not_found
          ^
  | (a,b)::l -> if a = x then b else assoc x l
</pre>

    <p>
  The function that calls it is in module <code>Uncaught</code>, file
  <tt>uncaught.ml</tt> char 221:
    </p>
    <pre class="listing">
print_string (find_address "INRIA"); print_newline ();;
                                  ^</pre>

    <p>
      To sum up: if you're developping a program you can compile it
      with the <tt>-g</tt> option, to be ready to debug the program if
      necessary. Hence, to find a spurious exception you just need to
      type <code>ocamldebug a.out</code>, then <tt>r</tt>, <tt>b</tt>,
      and <tt>bt</tt> gives you the backtrace.
    </p>

    <h3><a name="ocamldebug-help"></a>Getting help and info in the
      debugger</h3>

    <p>
      To get more info about the current status of the debugger you
      can ask it directly at the toplevel prompt of the debugger; for
      instance:
    </p>
    <pre class="listing">
(ocd) info breakpoints
No breakpoint.

(ocd) help break
  1      15396  in List, character 3539
break : Set breakpoint at specified line or function.
Syntax: break function-name
break @ [module] linenum
break @ [module] # characternum</pre>

    <h3><a name="ocamldebug-break"></a>Setting break points</h3>

    <p>
      Let's set up a breakpoint and rerun the entire program from the
      beginning (<code><b></b>(g)oto 0</code> then
      <code><b></b>(r)un</code>):
    </p>
    <pre class="listing">
(ocd) break @Uncaught 9
Breakpoint 3 at 19112 : file Uncaught, line 9 column 34

(ocd) g 0
Time : 0
Beginning of program.

(ocd) r
Time : 6 - pc : 19112 - module Uncaught
Breakpoint : 1
9 add "IRIA" "Rocquencourt"&lt;|a|&gt;;;</pre>

    <p>
      Then, we can step and find what happens when
      <code>find_address</code> is about to be called
    </p>
    <pre class="listing">
(ocd) s
Time : 7 - pc : 19012 - module Uncaught
5 let find_address name = &lt;|b|&gt;List.assoc name !l;;

(ocd) p name
name : string = "INRIA"

(ocd) p !l
$1 : (string * string) list = ["IRIA", "Rocquencourt"]
(ocd)</pre>

    <p>
      Now we can guess why <code ml:content="ocaml noeval">List.assoc</code> will fail to find
      "INRIA" in the list...
    </p>

    <h3><a name="ocamldebug-emacs"></a>Using the debugger under
      (X)Emacs</h3>

    <p>
      Note also that under Emacs you call the debugger using
      <tt>ESC-x</tt> <tt>camldebug a.out</tt>.  Then Emacs will set
      you directly to the file and character reported by the debugger,
      and you can step back and forth using <tt>ESC-b</tt> and
      <tt>ESC-s</tt>, you can set up break points using <tt>CTRL-X
      space</tt>, and so on...
    </p>

  </body>
</html>
