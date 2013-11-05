<head>
  <title>Labels</title>
</head>
<body>

<h1>Labels</h1>

<h2><a name="Exceptions_and_hash_tables"></a>Exceptions and hash
  tables</h2>

<p><em>(unfinished)</em></p>

<a name="Mutually_recursive_functions"></a><h2><span>Mutually recursive functions</span></h2>
<p>Suppose I want to define two functions which call each other. This is actually not a very common thing to do, but it can be useful sometimes. Here's a contrived example (thanks to Ryan Tarpine): The number 0 is even. Other numbers greater than 0 are even if their predecessor is odd. Hence:</p>
<pre ml:content="ocaml noeval">
let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)
</pre>

<p>The code above doesn't compile because we haven't defined the function <code>odd</code> yet! That's easy though. Zero is not odd, and other numbers greater than 0 are odd if their predecessor is even. So to make this complete we need that function too:</p>
<pre ml:content="ocaml noeval">
let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)

let rec odd n =
  match n with
  | 0 -> false
  | x -> even (x-1)
</pre>

<p>The only problem is... this program doesn't compile. In order to compile the <code>even</code> function, we already need the definition of <code>odd</code>, and to compile <code>odd</code> we need the definition of <code>even</code>. So swapping the two definitions around won't help either.</p>
<p>There are no &quot;forward prototypes&quot; in OCaml but there is a special syntax for defining a set of two or more mutually recursive functions, like <code>odd</code> and <code>even</code>:</p>
<pre ml:content="ocaml noeval">
let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)
and odd n =
  match n with
  | 0 -> false
  | x -> even (x-1)
</pre>

<p>It's hard to know exactly how useful this is in practice, since I've never had cause to write mutually recursive functions, nor have I been able to think of a non-trivial example. However it's there. You can also use similar syntax for writing mutually recursive class definitions and modules.</p>
<a name="Aliases_for_function_names_and_arguments"></a><h2><span>Aliases for function names and arguments</span></h2>
<p>Recall in Chapter 5 we talked about partial function application. It's possible to use this as a neat trick to save typing: aliasing function names, and function arguments.</p>
<p>Although we haven't looked at object-oriented programming (that's the subject for the next chapter), here's an example from OCamlNet of an aliased function call. All you need to know is that <code>cgi # output # output_string <em>&quot;string&quot;</em></code> is a method call, similar to <code>cgi.output().output_string (<em>&quot;string&quot;</em>)</code> in Java.</p>
<pre ml:content="ocaml noeval">
let begin_page cgi title =
  let out = cgi # output # output_string in
  out "&lt;html&gt;\n";
  out "&lt;head&gt;\n";
  out ("&lt;title&gt;" ^ text title ^ "&lt;/title&gt;\n");
  out ("&lt;style type=\"text/css\"&gt;\n");
  out "body { background: white; color: black; }\n";
  out "&lt;/style&gt;\n";
  out "&lt;/head&gt;\n";
  out "&lt;body&gt;\n";
  out ("&lt;h1&gt;" ^ text title ^ "&lt;/h1&gt;\n")
</pre>

<p>The <code>let out = ... </code> is a partial function application for that method call (partial, because the string parameter hasn't been applied). <code>out</code> is therefore a function, which takes a string parameter.</p>
<pre ml:content="ocaml noeval">
  out "&lt;html&gt;\n";
</pre>

<p>is equivalent to:</p>
<pre ml:content="ocaml noeval">
  cgi # output # output_string "&lt;html&gt;\n";
</pre>

<p>We saved ourselves a lot of typing there.</p>
<p>We can also add arguments. This alternative definition of <code>print_string</code> can be thought of as a kind of alias for a function name plus arguments:</p>
<pre ml:content="ocaml noeval">
  let print_string = output_string stdout
</pre>

<p><code>output_string</code> takes two arguments (a channel and a string), but since we have only supplied one, it is partially applied. So <code>print_string</code> is a function, expecting one string argument.</p>
<a name="Labelled_and_optional_arguments_to_functions"></a><h2><span>Labelled and optional arguments to functions</span></h2>

<h3>Labelled arguments</h3>
<p>Python has the nicest syntax for writing arguments to functions. Here's an example (from the Python tutorial, since I'm not a Python programmer):</p>
<pre>
def ask_ok(prompt, retries=4, complaint='Yes or no, please!'):
  # function definition omitted
</pre>

<p>Here are the ways we can call this Python function:</p>
<pre>
ask_ok ('Do you really want to quit?')
ask_ok ('Overwrite the file?', 2)
ask_ok (prompt='Are you sure?')
ask_ok (complaint='Please answer yes or no!', prompt='Are you sure?')
</pre>

<p>Notice that in Python we are allowed to name arguments when we call them, or use the usual function call syntax, and we can have optional arguments with default values.</p>
<p>You can do something similar in Perl:</p>
<pre>
sub ask_ok
{
  my %params = @_;

  my $prompt = $params{prompt};
  my $retries = exists $params{retries} ? $params{retries} : 4;

  # ... etc.
}

ask_ok (prompt =&gt; &quot;Are you sure?&quot;, retries =&gt; 2);
</pre>

<p>OCaml also has a way to label arguments and have optional arguments with default values.</p>
<p>The basic syntax is:</p>
<pre ml:content="ocaml">
  let rec range ~first:a ~last:b =
    if a > b then []
    else a :: range ~first:(a+1) ~last:b
</pre>

<p>(Notice that both <code>to</code> and <code>end</code> are reserved words in OCaml, so they cannot be used as labels. So you cannot have <code>~from/~to</code> or <code>~start/~end</code>.)</p>
<p>The type of our previous <code>range</code> function was:</p>
<pre>
range : int -&gt; int -&gt; int list
</pre>

<p>And the type of our new <code>range</code> function with labelled arguments is:</p>
<pre>
range : first:int -&gt; last:int -&gt; int list
</pre>

<p>(Confusingly, the <code>~</code> (tilde) is <em>not</em> shown in the type definition, but you need to use it everywhere else).</p>
<p>With labelled arguments, it doesn't matter which order you give the arguments anymore:</p>
<pre ml:content="ocaml">
range ~first:1 ~last:10;;
range ~last:10 ~first:1;;
</pre>

<p>There is also a shorthand way to name the arguments, so that the label is the same as the variable in the function definition. Here is a function defined in <code>lablgtk/gaux.ml</code> (a library of useful oddities used in lablgtk):</p>
<pre ml:content="ocaml">
  let may ~f x =
    match x with
    | None -> ()
    | Some x -> ignore(f x)
</pre>

<p>It's worth spending some time working out exactly what this function does, and also working out by hand its type signature. There's a lot going on. First of all, the parameter <code>~f</code> is just shorthand for <code>~f:f</code> (ie. the label is <code>~f</code> and the variable used in the function is <code>f</code>). Secondly notice that the function takes two parameters. The second parameter (<code>x</code>) is unlabelled - it is permitted for a function to take a mixture of labelled and unlabelled arguments if you want.</p>
<p>What is the type of the labelled <code>f</code> parameter? Obviously it's a function of some sort.</p>
<p>What is the type of the unlabelled <code>x</code> parameter? The <code>match</code> clause gives us a clue. It's an <code>'a option</code>.</p>
<p>This tells us that <code>f</code> takes an <code>'a</code> parameter, and the return value of <code>f</code> is ignored, so it could be anything. The type of <code>f</code> is therefore <code>'a -&gt; 'b</code>.</p>
<p>The <code>may</code> function as a whole returns <code>unit</code>. Notice in each case of the <code>match</code> the result is <code>()</code>.</p>
<p>Thus the type of the <code>may</code> function is (and you can verify this in the OCaml toplevel if you want):</p>
<pre>
may : f:('a -&gt; 'b) -&gt; 'a option -&gt; unit
</pre>

<p>What does this function do? Running the function in the OCaml toplevel gives us some clues:</p>
<pre ml:content="ocaml">
may ~f:print_endline None;;
may ~f:print_endline (Some "hello");;
</pre>

<p>If the unlabelled argument is a &quot;null pointer&quot; then <code>may</code> does nothing. Otherwise <code>may</code> calls the <code>f</code> function on the argument. Why is this useful? We're just about to find out ...</p>

<h3>Optional arguments</h3>
<p>Optional arguments are like labelled arguments, but we use <code>?</code> instead of <code>~</code> in front of them. Here is an example:</p>
<pre ml:content="ocaml">
  let rec range ?(step=1) a b =
    if a > b then []
    else a :: range ~step (a+step) b
</pre>

<p>Note the somewhat confusing syntax, switching between <code>?</code> and <code>~</code>. We'll talk about that in the next section. Here is how you call this function:</p>
<pre ml:content="ocaml">
range 1 10;;
range 1 10 ~step:2;;
</pre>

<p>In this case, <code>?(step=1)</code> fairly obviously means that <code>~step</code> is an optional argument which defaults to 1. We can also omit the default value and just have an optional argument. This example is modified from lablgtk:</p>
<pre ml:content="ocaml silent">
  type window = { mutable title: string;
                  mutable width: int;
                  mutable height: int }
  
  let create_window () =
    { title = "none"; width = 640; height = 480; }
  
  let set_title window title =
    window.title <- title
  
  let set_width window width =
    window.width <- width
  
  let set_height window height =
    window.height <- height
  
  let open_window ?title ?width ?height () =
    let window = create_window () in
    may ~f:(set_title window) title;
    may ~f:(set_width window) width;
    may ~f:(set_height window) height;
    window
</pre>

<p>This example is significantly complex and quite subtle, but the pattern used is very common in the lablgtk source code. Let's concentrate on the simple <code>create_window</code> function first. This function takes a <code>unit</code> and returns a <code>window</code>, initialized with default settings for title, width and height:</p>
<pre ml:content="ocaml">
create_window ();;
</pre>

<p>The <code>set_title</code>, <code>set_width</code> and <code>set_height</code> functions are impure functions which modify the <code>window</code> structure, in the obvious way. For example:</p>
<pre ml:content="ocaml">
  let w = create_window () in
  set_title w "My Application";
  w;;
</pre>

<p>So far this is just the imperative &quot;mutable records&quot; which we talked about in the previous chapter. Now the complex part is the <code>open_window</code> function. This function takes <em>4</em> arguments, three of them optional, followed by a required, unlabelled <code>unit</code>. Let's first see this function in action:</p>
<pre ml:content="ocaml">
open_window ~title:"My Application" ();;
open_window ~title:"Clock" ~width:128 ~height:128 ();;
</pre>

<p>It does what you expect, but how?! The secret is in the <code>may</code> function (see above) and the fact that the optional parameters <em>don't</em> have defaults.</p>
<p>When an optional parameter doesn't have a default, then it has type <code>'a option</code>. The <code>'a</code> would normally be inferred by type inference, so in the case of <code>?title</code> above, this has type <code>string option</code>.</p>
<p>Remember the <code>may</code> function? It takes a function and an argument, and calls the function on the argument provided the argument isn't <code>None</code>. So:</p>
<pre ml:content="ocaml noeval">
may ~f:(set_title window) title;
</pre>

<p>If the optional title argument is not specified by the caller, then <code>title</code> = <code>None</code>, so <code>may</code> does nothing. But if we call the function with, for example, <code>open_window ~title:&quot;My Application&quot; ();;</code>, then <code>title</code> = <code>Some &quot;My Application&quot;</code>, and <code>may</code> therefore calls <code>set_title window &quot;My Application&quot;</code>.</p>
<p>You should make sure you fully understand this example before proceeding to the next section.</p>

<h3>&quot;Warning: This optional argument cannot be erased&quot;</h3>
<p>We've just touched upon labels and optional arguments, but even this brief explanation should have raised several questions. The first may be why the extra <code>unit</code> argument to <code>open_window</code>? Let's try defining this function without the extra <code>unit</code>:</p>
<pre ml:content="ocaml">
  let open_window ?title ?width ?height =
    let window = create_window () in
    may ~f:(set_title window) title;
    may ~f:(set_width window) width;
    may ~f:(set_height window) height;
    window
</pre>

<p>Although OCaml has compiled the function, it has generated a somewhat infamous warning: &quot;This optional argument cannot be erased&quot;, referring to the final <code>?height</code> argument. To try to show what's going on here, let's call our modified <code>open_window</code> function:</p>
<pre ml:content="ocaml">
open_window;;
open_window ~title:"My Application";;
</pre>

<p>Did that work or not? No it didn't. In fact it didn't even run the <code>open_window</code> function at all. Instead it printed some strange type information. What's going on?</p>
<p>Recall currying and uncurrying, and partial application of functions. If we have a function <code>plus</code> defined as:</p>
<pre ml:content="ocaml">
  let plus x y =
    x + y
</pre>

<p>We can partially apply this, for example as <code>plus 2</code> which is &quot;the function that adds 2 to things&quot;:</p>
<pre ml:content="ocaml">
  let f = plus 2;;
  f 5;;
  f 100;;
</pre>

<p>In the <code>plus</code> example, the OCaml compiler can easily work out that <code>plus 2</code> doesn't have enough arguments supplied yet. It needs another argument before the <code>plus</code> function itself can be executed. Therefore <code>plus 2</code> is a function which is waiting for its extra argument to come along.</p>
<p>Things are not so clear when we add optional arguments into the mix. The call to <code>open_window;;</code> above is a case in point. Does the user mean &quot;execute <code>open_window</code> now&quot;? Or does the user mean to supply some or all of the optional arguments later? Is <code>open_window;;</code> waiting for extra arguments to come along like <code>plus 2</code>?</p>
<p>OCaml plays it safe and doesn't execute <code>open_window</code>. Instead it treats it as a partial function application. The expression <code>open_window</code> literally evaluates to a function value.</p>
<p>Let's go back to the original and working definition of <code>open_window</code> where we had the extra unlabelled <code>unit</code> argument at the end:</p>
<pre ml:content="ocaml">
  let open_window ?title ?width ?height () =
    let window = create_window () in
    may ~f:(set_title window) title;
    may ~f:(set_width window) width;
    may ~f:(set_height window) height;
    window
</pre>

<p>If you want to pass optional arguments to <code>open_window</code> you must do so before the final <code>unit</code>, so if you type:</p>
<pre ml:content="ocaml">
  open_window ();;
</pre>

<p>you must mean &quot;execute <code>open_window</code> now with all optional arguments unspecified&quot;. Whereas if you type:</p>
<pre ml:content="ocaml">
open_window;;
</pre>

<p>you mean &quot;give me the functional value&quot; or (more usually in the toplevel) &quot;print out the type of <code>open_window</code>&quot;.</p>
<h3>More <code>~</code>shorthand</h3>
<p>Let's rewrite the <code>range</code> function yet again, this time using as much shorthand as possible for the labels:</p>
<pre ml:content="ocaml">
  let rec range ~first ~last =
    if first > last then []
    else first :: range ~first:(first+1) ~last
</pre>

<p>Recall that <code>~foo</code> on its own is short for <code>~foo:foo</code>. This applies also when calling functions as well as declaring the arguments to functions, hence in the above the highlighted red <code>~last</code> is short for <code>~last:last</code>.</p>

<h3>Using <code>?foo</code> in a function call</h3>

<p>There's another little wrinkle concerning optional arguments. Suppose we write a function around <code>open_window</code> to open up an application:</p>
<pre ml:content="ocaml">
  let open_application ?width ?height () =
    open_window ~title:"My Application" ~width ~height
</pre>

<p>Recall that <code>~width</code> is shorthand for <code>~width:width</code>. The type of <code>width</code> is <code>'a option</code>, but <code>open_window ~width:</code> expects an <code>int</code>.</p>
<p>OCaml provides more syntactic sugar. Writing <code>?width</code> in the function call is shorthand for writing <code>~width:(unwrap width)</code> where <code>unwrap</code> would be a function which would remove the &quot;<code>option</code> wrapper&quot; around <code>width</code> (it's not actually possible to write an <code>unwrap</code> function like this, but conceptually that's the idea). So the correct way to write this function is:</p>
<pre ml:content="ocaml">
  let open_application ?width ?height () =
    open_window ~title:"My Application" ?width ?height
</pre>

<h3>When and when not to use <code>~</code> and <code>?</code></h3>
<p>The syntax for labels and optional arguments is confusing, and you may often wonder when to use <code>~foo</code>, when to use <code>?foo</code> and when to use plain <code>foo</code>. It's something of a black art which takes practice to get right.</p>
<p><code>?foo</code> is only used when declaring the arguments of a function, ie:</p>
<pre ml:content="ocaml noeval">
let f ?arg1 ... =
</pre>

<p>or when using the specialised &quot;unwrap <code>option</code> wrapper&quot; form for function calls:</p>
<pre ml:content="ocaml">
  let open_application ?width ?height () =
    open_window ~title:"My Application" ?width ?height
</pre>

<p>The declaration <code>?foo</code> creates a variable called <code>foo</code>, so if you need the value of <code>?foo</code>, use just <code>foo</code>.</p>
<p>The same applies to labels. Only use the <code>~foo</code> form when declaring arguments of a function, ie:</p>
<pre ml:content="ocaml noeval">
let f ~foo:foo ... =
</pre>

<p>The declaration <code>~foo:foo</code> creates a variable called simply <code>foo</code>, so if you need the value just use plain <code>foo</code>.</p>
<p>Things, however, get complicated for two reasons: Firstly the shorthand form <code>~foo</code> (equivalent to <code>~foo:foo</code>), and secondly when you call a function which takes a labelled or optional argument and you use the shorthand form.</p>
<p>Here is some apparently obscure code from lablgtk to demonstrate all of this:</p>
<pre ml:content="ocaml noeval">
let html ?border_width ?width ?height ?packing ?show () =  (* line 1 *)
  let w = create () in
  load_empty w;
  Container.set w ?border_width ?width ?height;            (* line 4 *)
  pack_return (new html w) ~packing ~show                  (* line 5 *)
</pre>

<p>On line 1 we have the function definition. Notice there are 5 optional arguments, and the mandatory <code>unit</code> 6<sup>th</sup> argument. Each of the optional arguments is going to define a variable, eg. <code>border_width</code>, of type <code>'a option</code>.</p>
<p>On line 4 we use the special <code>?foo</code> form for passing optional arguments to functions which take optional arguments. <code>Container.set</code> has the following type:</p>
<pre ml:content="ocaml noeval">
module Container = struct
  let set ?border_width ?(width = -2) ?(height = -2) w =
    (* ... *)
</pre>

<p>Line 5 uses the <code>~</code>shorthand. Writing this in long form:</p>
<pre ml:content="ocaml noeval">
  pack_return (new html w) ~packing:packing ~show:show
</pre>

<p>The <code>pack_return</code> function actually takes mandatory labelled arguments called <code>~packing</code> and <code>~show</code>, each of type <code>'a option</code>. In other words, <code>pack_return</code> explicitly unwraps the <code>option</code> wrapper.</p>


<h3>Addendum</h3>
<p>If you think labels and optional arguments are complicated, that's because they are! Luckily, however, this is a relatively new feature in OCaml, and it's not yet widely used. In fact if you're not hacking on lablgtk, it's unlikely you'll see labels and optional arguments used at all (at the moment).</p>


<h2><a name="More_variants"></a>
  More variants (&quot;polymorphic variants&quot;)</h2>

<p>Try compiling the following C code:</p>
<pre>
#include &lt;stdio.h&gt;
#include &lt;fcntl.h&gt;
#include &lt;unistd.h&gt;

enum lock { open, close };

main ()
{
  int fd, n;
  char buffer[256];

  fd = open (&quot;/etc/motd&quot;, O_RDONLY);                     // line 12
  while ((n = read (fd, buffer, sizeof buffer)) &gt; 0)
    write (1, buffer, n);
  close (fd);                                            // line 15
}
</pre>

<p>When I compile the code I get a whole bunch of errors including:</p>
<pre>
test.c: In function `main':
test.c:12: error: called object is not a function
test.c:15: error: called object is not a function
</pre>

<p>This illustrates one problem with enumerated types (enums) in C. In the example above, one enum statement reserves <em>three</em> symbols, namely <code>lock</code>, <code>open</code> and <code>close</code>. Here's another example:</p>
<pre>
enum lock { open, close };
enum door { open, close };
</pre>

<p>Compiling gives:</p>
<pre>
test.c:2: error: conflicting types for `open'
test.c:1: error: previous declaration of `open'
test.c:2: error: conflicting types for `close'
test.c:1: error: previous declaration of `close'
</pre>

<p>The first enum defines the symbol <code>open</code> as something of type <code>enum lock</code>. You cannot reuse that symbol in another enum.</p>
<p>This will be familiar to most C/C++ programmers, and they won't write naive code like that above. However the same issue happens with OCaml variants, but OCaml provides a way to work around it.</p>
<p>Here is some OCaml code, which actually <em>does</em> compile:</p>
<pre ml:content="ocaml noeval">
type lock = Open | Close
type door = Open | Close
</pre>

<p>After running those two statements, what is the type of <code>Open</code>? We can find out easily enough in the toplevel:</p>
<pre ml:content="ocaml">
type lock = Open | Close;;
type door = Open | Close;;
Open;;
</pre>

<p>OCaml uses the most recent definition for <code>Open</code>, giving it the type <code>door</code>. This is actually not such a serious problem because if you accidentally tried to use <code>Open</code> in the type context of a <code>lock</code>, then OCaml's wonderful type inference would immediately spot the error and you wouldn't be able to compile the code.</p>
<p>So far, so much like C. Now I said that OCaml provides a way to work around the constraint that <code>Open</code> can only have one type. In other words, suppose I want to use <code>Open</code> to mean either &quot;the <code>Open</code> of type <code>lock</code>&quot; or &quot;the <code>Open</code> of type <code>door</code>&quot; and I want OCaml to work out which one I mean.</p>
<p>The syntax is slightly different, but here is how we do it:</p>
<pre ml:content="ocaml noeval">
type lock = [ `Open | `Close ];;
type door = [ `Open | `Close ];;
</pre>

<p>Notice the syntactic differences:</p>
<ol><li>Each variant name is prefixed with <code>`</code> (a back tick).</li>
<li>You have to put square brackets (<code>[]</code>) around the alternatives.</li></ol>
<p>The question naturally arises: What is the type of <code>`Open</code>?</p>
<pre ml:content="ocaml">
`Open;;
</pre>

<p><code>[&gt; `Open]</code> can be read as <code>[ `Open | <em>and some other possibilities which we don't know about</em> ]</code>. The &gt; (greater than) sign indicates that the set of possibilities is bigger than those listed (open-ended).</p>
<p>There's nothing special about <code>`Open</code>. <em>Any</em> back-ticked word can be used as a type, even one which we haven't mentioned before:</p>
<pre ml:content="ocaml">
`Foo;;
`Foo 42;;
</pre>

<p>Let's write a function to print the state of a <code>lock</code>:</p>
<pre ml:content="ocaml">
  let print_lock st =
    match st with
    | `Open -> print_endline "The lock is open"
    | `Close -> print_endline "The lock is closed"
</pre>

<p>Take a careful look at the type of that function. Type inference has worked out that the <code>st</code> argument has type <code>[&lt; `Close | `Open]</code>. The &lt; (less than) sign means that this is a &lt;dfn&gt;closed class&lt;/dfn&gt;. In other words, this function will only work on <code>`Close</code> or <code>`Open</code> and not on anything else.</p>
<pre ml:content="ocaml">
print_lock `Open;;
</pre>

<p>Notice that <code>print_lock</code> works just as well with a <code>door</code> as with a <code>lock</code>! We've deliberately given up some type safety, and type inference is now being used to help guess what we mean, rather than enforce correct coding.</p>
<p>This is only an introduction to polymorphic variants. Because of the reduction in type safety, it is recommended that you don't use these in your code. You will, however, see them in advanced OCaml code quite a lot precisely because advanced programmers will sometimes want to weaken the type system to write advanced idioms.</p>

</div>

</body>
