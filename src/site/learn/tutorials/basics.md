<title>The Basics</title>
<body>
<h1><span>The Basics</span></h1>
<a name="Comments"></a><h2><span>Comments</span></h2>
<p class="first_para">OCaml comments are delimited by <code>(*</code> and <code>*)</code>, like this:</p>
<pre ml:content="ocaml noeval">
(* This is a single-line comment. *)

(* This is a
 * multi-line
 * comment.
 *)
</pre>

<p class="first_para">In other words, the commenting convention is very similar to original C (<code>/* ... */</code>). There is currently no single-line comment syntax (like <code># ...</code> in Perl or <code>// ...</code> in C99/C++/Java).</p>
<p>OCaml counts nested <code>(* ... *)</code> blocks, and this allows you to comment out regions of code very easily:</p>
<pre ml:content="ocaml noeval">
(* This code is broken ...

(* Primality test. *)
let is_prime n =
  (* note to self: ask about this on the mailing lists *) XXX;;

*)
</pre>

<a name="Calling_functions"></a><h2><span>Calling functions</span></h2>
<p class="first_para">Let's say you've written a function - we'll call it <code>repeated</code> - which takes a string <code>s</code> and a number <code>n</code>, and returns a new string which contains original <code>s</code> repeated <code>n</code> times.</p>
<p>In most C-derived languages a call to this function will look like this:</p>
<pre>
repeated (&quot;hello&quot;, 3)  /* this is C code */
</pre>

<p class="first_para">This means &quot;call the function <code>repeated</code> with two arguments, first argument the string hello and second argument the number 3&quot;.</p>
<p>OCaml, in common with other functional languages, writes and brackets function calls differently, and this is the cause of many mistakes. Here is the same function call in OCaml:</p>
<pre ml:content="ocaml noeval">
repeated "hello" 3  (* this is OCaml code *)
</pre>

<p class="first_para">Note — <strong>no</strong> brackets, and <strong>no</strong> comma between the arguments.</p>
<p>The syntax <code>repeated (&quot;hello&quot;, 3)</code> <strong>is</strong> meaningful in OCaml. It means &quot;call the function <code>repeated</code> with ONE argument, that argument being a 'pair' structure of two elements&quot;. Of course that would be a mistake, because the <code>repeated</code> function is expecting two arguments, not one, and the first argument should be a string, not a pair. But let's not worry about pairs (&quot;tuples&quot;) just yet. Instead, just remember that it's a mistake to put the brackets and commas in around function call arguments.</p>
<p>Let's have another function - <code>prompt_string</code> - which takes a string to prompt and returns the string entered by the user. We want to pass this string into <code>repeated</code>. Here are the C and OCaml versions:</p>
<pre>
/* C code: */
repeated (prompt_string (&quot;Name please: &quot;), 3)
</pre>

<pre ml:content="ocaml noeval">
(* OCaml code: *)
repeated (prompt_string "Name please: ") 3
</pre>

<p class="first_para">Take a careful look at the bracketing and the missing comma. In the OCaml version, the brackets enclose the first argument of repeated because that argument is the result of another function call.  In general the rule is: &quot;bracket around the whole function call - don't put brackets around the arguments to a function call&quot;. Here are some more examples:</p>
<pre ml:content="ocaml noeval">
f 5 (g "hello") 3    (* f has three arguments, g has one argument *)
f (g 3 4)            (* f has one argument, g has two arguments *)

# repeated ("hello", 3);;     (* OCaml will spot the mistake *)
This expression has type string * int but is here used with type string
</pre>

<a name="Defining_a_function"></a><h2><span>Defining a function</span></h2>
<p class="first_para">You all know how to define a function (or static method, for Java-heads) in our existing languages. How do we do it in OCaml?</p>
<p>The OCaml syntax is pleasantly concise. Here's a function which takes two floating point numbers and calculates the average:</p>
<pre ml:content="ocaml noeval">
let average a b =
  (a +. b) /. 2.0;;
</pre>

<p class="first_para">Type this into the OCaml &quot;toplevel&quot; (on Unix, type the command <code>ocaml</code> from the shell) and you'll see this:</p>
<pre ml:content="ocaml">
  let average a b =
    (a +. b) /. 2.0;;
</pre>

<p class="first_para">If you look at the function definition closely, and also at what OCaml prints back at you, you'll have a number of questions:</p>
<ul><li>What're all those extra periods doing there in the code?</li>
<li>What does all that stuff about <code>float -&gt; float -&gt; float</code> mean?</li></ul>
<p class="first_para">I'll answer those questions in the next sections, but first I want to go and define the same function in C (the Java definition would be fairly similar to C), and hopefully that should raise even more questions. Here's our C version of <code>average</code>:</p>
<pre>
double
average (double a, double b)
{
  return (a + b) / 2;
}
</pre>

<p class="first_para">Now look at our much shorter OCaml definition above. Hopefully you'll be asking:</p>
<ul><li>Why don't we have to define the types of <code>a</code> and <code>b</code> in the OCaml version?  How does OCaml know what the types are (indeed, <em>does</em> OCaml know what the types are, or is OCaml completely dynamically typed?).</li>
<li>In C, the <code>2</code> is implicitly converted into a <code>double</code>, can't OCaml do the same thing?</li>
<li>What is the OCaml way to write <code>return</code>?</li></ul>
<p class="first_para">OK, let's get some answers.</p>
<ul><li>OCaml is a strongly <em>statically typed</em> language (in other words, there's nothing dynamic going on between int, float and string, as in Perl).  </li>
<li>OCaml uses <em>type inference</em> to work out the types, so you don't have to. If you use the OCaml toplevel as above, then  OCaml will tell you its inferred type for your function.</li>
<li>OCaml doesn't do any implicit casting. If you want a float, you have to write <code>2.0</code> because <code>2</code> is an integer. OCaml does <strong>no automatic conversion</strong> between int, float, string or any other type.</li>
<li>As a side-effect of type inference in OCaml, functions (including operators) can't have overloaded definitions. OCaml defines <code>+</code> as the <em>integer</em> addition function. To add floats, use <code>+.</code> (note the trailing period). Similarly, use <code>-.</code>, <code>*.</code>, <code>/.</code> for other float operations.</li>
<li>OCaml doesn't have a <code>return</code> keyword - the last expression in a function becomes the result of the function automatically.  </li></ul>
<p class="first_para">We will present more details in the following sections and chapters.</p>
<a name="Basic_types"></a><h2><span>Basic types</span></h2>
<p class="first_para">The basic types in OCaml are:</p>
<pre>
OCaml type     Range

int            31-bit signed int (roughly +/- 1 billion) on 32-bit processors,
               or 63-bit signed int on 64-bit processors
float          IEEE double-precision floating point, equivalent to C's double
bool           A boolean, written either true or false
char           An 8-bit character
string         A string
unit           Written as ()
</pre>

<p class="first_para">OCaml uses one of the bits in an <code>int</code> internally in order to be able to automatically manage the memory use (garbage collection). This is why the basic <code>int</code> is 31 bits, not 32 bits (63 bits if you're using a 64 bit platform). In practice this isn't an issue except in a few specialised cases. For example if you're counting things in a loop, then OCaml limits you to counting up to 1 billion instead of 2 billion. This isn't going to be a problem because if you're counting things close to this limit in any language, then you ought to be using bignums (the <code>Nat</code> and <code>Big_int</code> modules in OCaml).  However if you need to do things such as processing 32 bit types (eg. you're writing crypto code or a network stack), OCaml provides a <code>nativeint</code> type which matches the native integer type for your platform.</p>
<p>OCaml doesn't have a basic unsigned integer type, but you can get the same effect using <code>nativeint</code>. As far as I can tell OCaml doesn't have single-precision floating point numbers at all.</p>
<p>OCaml provides a <code>char</code> type which is used for characters, written <code>'x'</code> for example. Unfortunately the <code>char</code> type does not support Unicode or UTF-8. This is a serious flaw in OCaml which should be fixed, but for the time being there are <a href="http://camomile.sourceforge.net/" class="external" title="http://camomile.sourceforge.net/">comprehensive Unicode libraries</a> which work around it.</p>
<p>Strings are not just lists of characters. They have their own, more efficient internal representation.</p>
<p>The <code>unit</code> type is sort of like <code>void</code> in C, but we'll talk about it more below.</p>
<a name="Implicit_vs__explicit_casts"></a><h2><span>Implicit vs. explicit casts</span></h2>
<p class="first_para">In C-derived languages ints get promoted to floats in certain circumstances. For example if you write <code>1 + 2.5</code> then the first argument (which is an integer) is promoted to a floating point number, and the result is also a floating point number. It's as if you had written <code>((double) 1) + 2.5</code>, but all done implicitly.</p>
<p>OCaml never does implicit casts like this. In OCaml, <code>1 + 2.5</code> is a type error. The <code>+</code> operator in OCaml requires two ints as arguments, and here we're giving it an int and a float, so it reports this error:</p>
<pre ml:content="ocaml">
1 + 2.5;;
</pre>

<p class="first_para">(In the &quot;translated from the French&quot; language of OCaml error messages this means &quot;you put a float here, but I was expecting an int&quot;).</p>
<p>To add two floats together you need to use a different operator, <code>+.</code> (note the trailing period).</p>
<p>OCaml doesn't promote ints to floats automatically so this is also an error:</p>
<pre ml:content="ocaml">
1 +. 2.5
</pre>

<p class="first_para">Here OCaml is now complaining about the first argument.</p>
<p>What if you actually want to add an integer and a floating point number together? (Say they are stored as <code>i</code> and <code>f</code>). In OCaml you need to explicitly cast:</p>
<pre ml:content="ocaml noeval">
 (float_of_int i) +. f
</pre>

<p class="first_para"><code>float_of_int</code> is a function which takes an <code>int</code> and returns a <code>float</code>. There are a whole load of these functions, called such things as <code>int_of_float</code>, <code>char_of_int</code>, <code>int_of_char</code>, <code>string_of_int</code> and so on, and they mostly do what you expect.</p>
<p>Since converting an <code>int</code> to a <code>float</code> is a particularly common operation, the <code>float_of_int</code> function has a shorter alias: the above example could simply have been written</p>
<pre ml:content="ocaml noeval">
float i +. f
</pre>

<p class="first_para">(Note that unlike C, it is perfectly valid in OCaml for a type and a function to have the same name.)</p>
<h3>Is implicit or explicit casting better?</h3>
<p class="first_para">You might think that these explicit casts are ugly, time-consuming even, and you have a point, but there are at least two arguments in their favour. Firstly, OCaml needs this explicit casting to be able to do type inference (see below), and type inference is such a wonderful time-saving feature that it easily offsets the extra keyboarding of explicit casts. Secondly, if you've spent time debugging C programs you'll know that (a) implicit casts cause errors which are hard to find, and (b) much of the time you're sitting there trying to work out where the implicit casts happen.  Making the casts explicit helps you in debugging.  Thirdly, some casts (particularly int &lt;-&gt; float) are actually very expensive operations.  You do yourself no favours by hiding them.</p>
<a name="Ordinary_functions_and_recursive_functions"></a><h2><span>Ordinary functions and recursive functions</span></h2>
<p class="first_para">Unlike in C-derived languages, a function isn't recursive unless you explicitly say so by using <code>let rec</code> instead of just <code>let</code>. Here's an example of a recursive function:</p>
<pre ml:content="ocaml noeval">
let rec range a b =
  if a > b then []
  else a :: range (a+1) b
</pre>

<p class="first_para">Notice that <code>range</code> calls itself.</p>
<p>The only difference between <code>let</code> and <code>let rec</code> is in the scoping of the function name. If the above function had been defined with just <code>let</code>, then the call to <code>range</code> would have tried to look for an existing (previously defined) function called <code>range</code>, not the currently-being-defined function.  Using <code>let</code> (without <code>rec</code>) allows you to re-define a value in terms of the previous definition.  For example:</p>
<pre ml:content="ocaml noeval">
let positive_sum a b = 
  let a = max a 0
  and b = max b 0 in
  a + b
</pre>

<p class="first_para">This redefinition hides the previous &quot;bindings&quot; of <code>a</code> and <code>b</code> from the function definition.  In some situations coders prefer this pattern to using a new variable name (<code>let a_pos = max a 0</code>) as it makes the old binding inaccessible, so that only the latest values of a and b are accessible.</p>
<p>There is no performance difference between functions defined using <code>let</code> and functions defined using <code>let rec</code>, so if you prefer you could always use the <code>let rec</code> form and get the same semantics as C-like languages.</p>
<a name="Types_of_functions"></a><h2><span>Types of functions</span></h2>
<p class="first_para">Because of type inference you will rarely if ever need to explicitly write down the type of your functions. However, OCaml often prints out what it thinks are the types of your functions, so you need to know the syntax for this. For a function <code>f</code> which takes arguments <code>arg<sub>1</sub></code>, <code>arg<sub>2</sub></code>, ...  <code>arg<sub>n</sub></code>, and returns type <code>rettype</code>, the compiler will print:</p>
<pre>
f : arg1 -&gt; arg2 -&gt; ... -&gt; argn -&gt; rettype
</pre>

<p class="first_para">The arrow syntax looks strange now, but when we come to so-called &quot;currying&quot; later you'll see why it was chosen. For now I'll just give you some examples.</p>
<p>Our function <code>repeated</code> which takes a string and an integer and returns a string has type:</p>
<pre>
repeated : string -&gt; int -&gt; string
</pre>

<p class="first_para">Our function <code>average</code> which takes two floats and returns a float has type:</p>
<pre>
average : float -&gt; float -&gt; float
</pre>

<p class="first_para">The OCaml standard <code>int_of_char</code> casting function:</p>
<pre>
int_of_char : char -&gt; int
</pre>

<p class="first_para">If a function returns nothing (<code>void</code> for C and Java programmers), then we write that it returns the <code>unit</code> type. Here, for instance, is the OCaml equivalent of <code>fputc</code>:</p>
<pre>
output_char : out_channel -&gt; char -&gt; unit
</pre>

<h3>Polymorphic functions</h3>
<p class="first_para">Now for something a bit stranger. What about a function which takes <em>anything</em> as an argument? Here's a odd function which takes an argument, but just ignores it and always returns 3:</p>
<pre ml:content="ocaml noeval">
let give_me_a_three x = 3
</pre>

<p class="first_para">What is the type of this function? In OCaml we use a special placeholder to mean &quot;any type you fancy&quot;. It's a single quote character followed by a letter. The type of the above function would normally be written:</p>
<pre ml:content="ocaml noeval">
give_me_a_three : 'a -> int
</pre>

<p class="first_para">where <code>'a</code> really does mean any type. You can, for example, call this function as <code>give_me_a_three &quot;foo&quot;</code> or <code>give_me_a_three 2.0</code> and both are quite valid expressions in OCaml.</p>
<p>It won't be clear yet why polymorphic functions are useful, but they are very useful and very common, and so we'll discuss them later on. (Hint: polymorphism is kind of like templates in C++ or generics in Java 1.5).</p>
<a name="Type_inference"></a><h2><span>Type inference</span></h2>
<p class="first_para">So the theme of this tutorial is that functional languages have many Really Cool Features, and OCaml is a language which has all of these Really Cool Features stuffed into it at once, thus making it a very practical language for real programmers to use. But the odd thing is that most of these cool features have nothing to do with &quot;functional programming&quot; at all. In fact, I've come to the first Really Cool Feature, and I still haven't talked about why functional programming is called &quot;functional&quot;. Anyway, here's the first Really Cool Feature: type inference.</p>
<p>Simply put: you don't need to declare the types of your functions and variables, because OCaml will just work them out for you.</p>
<p>In addition OCaml goes on to check all your types match up (even across different files).</p>
<p>But OCaml is also a practical language, and for this reason it contains backdoors into the type system allowing you to bypass this checking on the rare occasions that it is sensible to do this. Only gurus will probably need to bypass the type checking.</p>
<p>Let's go back to the <code>average</code> function which we typed into the OCaml toplevel:</p>
<pre ml:content="ocaml">
  let average a b =
    (a +. b) /. 2.0
</pre>

<p class="first_para">Mirabile dictu! OCaml worked out all on its own that the function takes two <code>float</code> arguments and returns a <code>float</code>.</p>
<p>How did it do this? Firstly it looks at where <code>a</code> and <code>b</code> are used, namely in the expression <code>(a +. b)</code>. Now, <code>+.</code> is itself a function which always takes two <code>float</code> arguments, so by simple deduction, <code>a</code> and <code>b</code> must both also have type <code>float</code>.</p>
<p>Secondly, the <code>/.</code> function returns a <code>float</code>, and this is the same as the return value of the <code>average</code> function, so <code>average</code> must return a <code>float</code>. The conclusion is that <code>average</code> has this type signature:</p>
<pre ml:content="ocaml noeval">
average : float -> float -> float
</pre>

<p class="first_para">Type inference is obviously easy for such a short program, but it works even for large programs, and it's a major time-saving feature because it removes a whole class of errors which cause segfaults, <code>NullPointerException</code>s and <code>ClassCastException</code>s in other languages (or important but often ignored runtime warnings, as in Perl).</p>

</div>

</body>
