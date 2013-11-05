<title>Functional Programming</title>

<body>

<h1><span>Functional Programming</span></h1>

<h2><a name="What_is_functional_programming_"></a>What is functional
  programming?</h2>
<p>We've got quite far into the tutorial, yet we haven't really considered <strong>functional programming</strong>. All of the features given so far - rich data types, pattern matching, type inference, nested functions - you could imagine could exist in a kind of &quot;super C&quot; language. These are Cool Features certainly, and make your code concise, easy to read, and have fewer bugs, but they actually have very little to do with functional programming. In fact my argument is going to be that the reason that functional languages are so great is <em>not</em> because of functional programming, but because we've been stuck with C-like languages for years and in the meantime the cutting edge of programming has moved on considerably. So while we were writing <code>struct { int type; union { ... } }</code> for the umpteenth time, ML and Haskell programmers had safe variants and pattern matching on datatypes. While we were being careful to <code>free</code> all our <code>malloc</code>s, there have been languages with garbage collectors able to outperform hand-coding since the 80s.</p>
<p>Well, after that I'd better tell you what functional programming is anyhow.</p>
<p>The basic, and not very enlightening definition is this: in a <strong>functional language</strong>, <strong>functions</strong> are first-class citizens.</p>
<p>Lot of words there that don't really make much sense. So let's have an example:</p>
<pre ml:content="ocaml">
  let double x = x * 2 in
  List.map double [ 1; 2; 3 ]
</pre>

<p>In this example, I've first defined a nested function called <code>double</code> which takes an argument <code>x</code> and returns <code>x * 2</code>. Then <code>map</code> calls <code>double</code> on each element of the given list (<code>[1; 2; 3]</code>) to produce the result: a list with each number doubled.</p>
<p><code>map</code> is known as a <strong>higher-order function</strong> (HOF). Higher-order functions are just a fancy way of saying that the function takes a function as one of its arguments.</p>
<p>So far so simple. If you're familiar with C/C++ then this looks like passing a function pointer around. Java has some sort of abomination called an anonymous class which is like a dumbed-down, slow and long-winded closure.  If you know Perl then you probably already know and use Perl's closures and Perl's <code>map</code> function, which is exactly what we're talking about. The fact is that Perl is actually quite a good functional language.</p>
<p><strong>Closures</strong> are functions which carry around some of the &quot;environment&quot; in which they were defined. In particular, a closure can reference variables which were available at the point of its definition. Let's generalise the function above so that now we can take any list of integers and multiply each element by an arbitrary value <code>n</code>:</p>
<pre ml:content="ocaml">
  let multiply n list =
    let f x =
      n * x in
    List.map f list
</pre>

<p>Hence:</p>
<pre ml:content="ocaml">
multiply 2 [1; 2; 3];;
multiply 5 [1; 2; 3];;
</pre>

<p>The important point to note about the <code>multiply</code> function is the nested function <code>f</code>. This is a closure. Look at how <code>f</code> uses the value of <code>n</code> which isn't actually passed as an explicit argument to <code>f</code>. Instead <code>f</code> picks it up from its environment - it's an argument to the <code>multiply</code> function and hence available within this function.</p>
<p>This might sound straightforward, but let's look a bit closer at that call to map: <code>List.map f list</code>.  </p>
<p><code> map</code> is defined in the <code>List</code> module, far away from the current code. In other words, we're passing <code>f</code> into a module defined &quot;a long time ago, in a galaxy far far away&quot;. For all we know that code might pass <code>f</code> to other modules, or save a reference to <code>f</code> somewhere and call it later. Whether it does this or not, the closure will ensure that <code>f</code> always has access back to its parental environment, and to <code>n</code>.</p>
<p>Here's a real example from lablgtk. This is actually a method on a class (we haven't talked about classes and objects yet, but just think of it as a function definition for now).</p>
<pre ml:content="ocaml noeval">
class html_skel obj = object (self)
  ...
  ...
  method save_to_channel chan =
    let receiver_fn content =
      output_string chan content;
      true in
    save obj receiver_fn
</pre>

<p>First of all you need to know that the <code>save</code> function called at the end of the method takes as its second argument a function (<code>receiver_fn</code>). It repeatedly calls <code>receiver_fn</code> with snippets of text from the widget that it's trying to save.</p>
<p>Now look at the definition of <code>receiver_fn</code>. This function is a closure alright because it keeps a reference to <code>chan</code> from its environment.</p>
<h3>Partial function applications and currying</h3>
<p>Let's define a plus function which just adds two integers:</p>
<pre ml:content="ocaml silent">
  let plus a b =
    a + b
</pre>

<p>Some questions for people asleep at the back of the class.</p>
<ol><li>What is <code>plus</code>?</li>
<li>What is <code>plus 2 3</code>?</li>
<li>What is <code>plus 2</code>?</li></ol>
<p>Question 1 is easy. <code>plus</code> is a function, it takes two arguments which are integers and it returns an integer. We write its type like this:</p>
<pre ml:content="ocaml noeval">
  plus : int -> int -> int
</pre>

<p>Question 2 is even easier. <code>plus 2 3</code> is a number, the integer <code>5</code>. We write its value and type like this:</p>
<pre ml:content="ocaml noeval">
  5 : int
</pre>

<p>But what about question 3? It looks like <code>plus 2</code> is a mistake, a bug. In fact, however, it isn't. If we type this into the OCaml toplevel, it tells us:</p>
<pre ml:content="ocaml">
  plus 2
</pre>

<p>This isn't an error. It's telling us that <code>plus 2</code> is in fact a <em>function</em>, which takes an <code>int</code> and returns an <code>int</code>. What sort of function is this? We experiment by first of all giving this mysterious function a name (<code>f</code>), and then trying it out on a few integers to see what it does:</p>
<pre ml:content="ocaml">
let f = plus 2;;
f 10;;
f 15;;
f 99;;
</pre>

<p>In engineering this is sufficient <a href="http://www.princeton.edu/~sacm/humor/proof.html" class="external" title="http://www.princeton.edu/~sacm/humor/proof.html">proof by example</a> for us to state that <code>plus 2</code> is the function which adds 2 to things.</p>
<p>Going back to the original definition, let's &quot;fill in&quot; the first argument (<code>a</code>) setting it to 2 to get:</p>
<pre ml:content="ocaml noeval">
let plus 2 b =       (* This is not real OCaml code! *)
  2 + b
</pre>

<p>You can kind of see, I hope, why <code>plus 2</code> is the function which adds 2 to things.</p>
<p>Looking at the types of these expressions we may be able to see some rationale for the strange -&gt; arrow notation used for function types:</p>
<pre>
    plus : int -&gt; int -&gt; int
  plus 2 : int -&gt; int
plus 2 3 : int
</pre>

<p>This process is called <strong>currying</strong> (or perhaps it's called <strong>uncurrying</strong>, I never was really sure which was which). It is called this after Haskell Curry who did some important stuff related to the lambda calculus. Since I'm trying to avoid entering into the mathematics behind OCaml because that makes for a very boring and irrelevant tutorial, I won't go any further on the subject.  You can find much more information about currying if it interests you by  <a href="http://www.google.com/search?q=currying" class="external" title="http://www.google.com/search?q=currying">doing a search on Google</a>.</p>
<p>Remember our <code>double</code> and <code>multiply</code> functions from earlier on? <code>multiply</code> was defined as this:</p>
<pre ml:content="ocaml">
  let multiply n list =
    let f x =
      n * x in
    List.map f list
</pre>

<p>We can now define <code>double</code>, <code>triple</code> &amp;c functions very easily just like this:</p>
<pre ml:content="ocaml">
let double = multiply 2;;
let triple = multiply 3;;
</pre>

<p>They really are functions, look:</p>
<pre ml:content="ocaml">
double [1; 2; 3];;
triple [1; 2; 3];;
</pre>

<p>You can also use partial application directly (without the intermediate <code>f</code> function) like this:</p>
<pre ml:content="ocaml">
let multiply n = List.map (( * ) n);;
let double = multiply 2;;
let triple = multiply 3;;
double [1; 2; 3];;
triple [1; 2; 3];;
</pre>

<p>In the example above, <code>((*) n)</code> is the partial application of the <code>(*)</code> (times) function. Note the extra spaces needed so that OCaml doesn't think <code>(*</code> starts a comment.</p>
<p>You can put infix operators into brackets to make functions. Here's an identical definition of the <code>plus</code> function as before:</p>
<pre ml:content="ocaml">
let plus = ( + );;
plus 2 3;;
</pre>

<p>Here's some more currying fun:</p>
<pre ml:content="ocaml">
List.map (plus 2) [1; 2; 3];;
let list_of_functions = List.map plus [1; 2; 3];;
</pre>

<h3>What is functional programming good for?</h3>
<p>Functional programming, like any good programming technique, is a useful tool in your armoury for solving some classes of problems. It's very good for callbacks, which have multiple uses from GUIs through to event-driven loops. It's great for expressing generic algorithms. <code>List.map</code> is really a generic algorithm for applying functions over any type of list. Similarly you can define generic functions over trees. Certain types of numerical problems can be solved more quickly with functional programming (for example, numerically calculating the derivative of a mathematical function).</p>
<h3>Pure and impure functional programming</h3>
<p>A <strong>pure function</strong> is one without any <strong>side-effects</strong>. A side-effect really means that the function keeps some sort of hidden state inside it. <code>strlen</code> is a good example of a pure function in C. If you call <code>strlen</code> with the same string, it always returns the same length. The output of <code>strlen</code> (the length) only depends on the inputs (the string) and nothing else. Many functions in C are, unfortunately, impure. For example, <code>malloc</code> - if you call it with the same number, it certainly won't return the same pointer to you. <code>malloc</code>, of course, relies on a huge amount of hidden internal state (objects allocated on the heap, the allocation method in use, grabbing pages from the operating system, etc.).</p>
<p>ML-derived languages like OCaml are &quot;mostly pure&quot;. They allow side-effects through things like references and arrays, but by and large most of the code you'll write will be pure functional because they encourage this thinking.  Haskell, another functional language, is pure functional. OCaml is therefore more practical because writing impure functions is sometimes useful.</p>
<p>There are various theoretical advantages of having pure functions. One advantage is that if a function is pure, then if it is called several times with the same arguments, the compiler only needs to actually call the function once. A good example in C is:</p>
<pre>
for (i = 0; i &lt; strlen (s); ++i)
  {
    // Do something which doesn't affect s.
  }
</pre>

<p>If naively compiled, this loop is O(n<sup>2</sup>) because <code>strlen (s)</code> is called each time and <code>strlen</code> needs to iterate over the whole of <code>s</code>. If the compiler is smart enough to work out that <code>strlen</code> is pure functional <em>and</em> that <code>s</code> is not updated in the loop, then it can remove the redundant extra calls to <code>strlen</code> and make the loop O(n). Do compilers really do this? In the case of <code>strlen</code> yes, in other cases, probably not.</p>
<p>Concentrating on writing small pure functions allows you to construct reusable code using a bottom-up approach, testing each small function as you go along. The current fashion is for carefully planning your programs using a top-down approach, but in the author's opinion this often results in projects failing.</p>

<h3>Strictness vs laziness</h3>
<p>C-derived and ML-derived languages are strict. Haskell and Miranda are non-strict, or lazy, languages. OCaml is strict by default but allows a lazy style of programming where it is needed.</p>
<p>In a strict language, arguments to functions are always evaluated
first, and the results are then passed to the function. For example in
a strict language, the call <code>give_me_a_three (1/0)</code> is
always going to result in a divide-by-zero error:</p>
<pre ml:content="ocaml">
let give_me_a_three _ = 3;;
give_me_a_three (1/0);;
</pre>

<p>If you've programmed in any conventional language, this is just how things work, and you'd be surprised that things could work any other way.</p>
<p>In a lazy language, something stranger happens. Arguments to functions are only evaluated if the function actually uses them. Remember that the <code>give_me_a_three</code> function throws away its argument and always returns a 3? Well in a lazy language, the above call would <em>not</em> fail because <code>give_me_a_three</code> never looks at its first argument, so the first argument is never evaluated, so the division by zero doesn't happen.</p>
<p>Lazy languages also let you do really odd things like defining an infinitely long list. Provided you don't actually try to iterate over the whole list this works (say, instead, that you just try to fetch the first 10 elements).</p>
<p>OCaml is a strict language, but has a <code>Lazy</code> module that lets you write lazy expressions. Here's an example. First we create a lazy expression for <code>1/0</code>:</p>
<pre ml:content="ocaml">
let lazy_expr = lazy (1/0)
</pre>

<p>Notice the type of this lazy expression is <code>int lazy_t</code>.</p>
<p>Because <code>give_me_a_three</code> takes <code>'a</code> (any type) we can pass this lazy expression into the function:</p>
<pre ml:content="ocaml">
give_me_a_three lazy_expr
</pre>

<p>To evaluate a lazy expression, you must use the <code>Lazy.force</code> function:</p>
<pre ml:content="ocaml">
Lazy.force lazy_expr
</pre>

<h3>Boxed vs. unboxed types</h3>
<p>One term which you'll hear a lot when discussing functional languages is &quot;boxed&quot;. I was very confused when I first heard this term, but in fact the distinction between boxed and unboxed types is quite simple if you've used C, C++ or Java before (in Perl, everything is boxed).</p>
<p>The way to think of a boxed object is to think of an object which has been allocated on the heap using <code>malloc</code> in C (or equivalently <code>new</code> in C++), and/or is referred to through a pointer. Take a look at this example C program:</p>
<pre>
#include &lt;stdio.h&gt;

void
printit (int *ptr)
{
  printf (&quot;the number is %d\n&quot;, *ptr);
}

void
main ()
{
  int a = 3;
  int *p = &amp;a;

  printit (p);
}
</pre>

<p>The variable <code>a</code> is allocated on the stack, and is quite definitely unboxed.</p>
<p>The function <code>printit</code> takes a boxed integer and prints it.</p>
<p>The diagram below shows an array of unboxed (top) vs. boxed (below) integers:</p>
<p><img src="../img/boxedarray.png" alt="Boxed Array" /></p>
<p>No prizes for guessing that the array of unboxed integers is much faster than the array of boxed integers. In addition, because there are fewer separate allocations, garbage collection is much faster and simpler on the array of unboxed objects.</p>
<p>In C or C++ you should have no problems constructing either of the two types of arrays above. In Java, you have two types, <code>int</code> which is unboxed and <code>Integer</code> which is boxed, and hence considerably less efficient. In OCaml, the basic types are all unboxed.</p>

</div>
</body>
