<title>Data Types and Matching</title>
<body>
<h1><span>Data Types and Matching</span></h1>
<div id="navigation_space_div"></div><div id="content_div">
<a name="Linked_lists"></a><h2><span>Linked lists</span></h2>
<p>As with Perl, OCaml has support for lists built into the language. All elements of a list in OCaml must be the same type. To write a list, use:</p>
<pre ml:content="ocaml noeval">
[1; 2; 3]
</pre>

<p>(Note semicolons, NOT commas).</p>
<p><code>[]</code> is the empty list.</p>
<p>A list has a <strong>head</strong> (the first element) and a <strong>tail</strong> (the rest of the elements). The head is an element, and the tail is a list, so in the above example, the head is the integer <code>1</code> while the tail is the <em>list</em> <code>[2; 3]</code>.</p>
<p>An alternative way to write a list is to use the <strong>cons</strong> operator <code><em>head</em> :: <em>tail</em></code>. So the following ways to write a list are exactly the same:</p>
<pre ml:content="ocaml noeval">
[1; 2; 3]
1 :: [2; 3]
1 :: 2 :: [3]
1 :: 2 :: 3 :: []
</pre>

<p>Why do I mention the cons operator? Well, it's useful when we start doing <em>pattern matching</em> on lists, which I'll talk about below.</p>
<h3>The type of a linked list</h3>
<p>The type of a linked list of integers is <code>int list</code>, and in general the type of a linked list of <code>foo</code>s is <code>foo list</code>.</p>
<p>This implies that all the elements of a linked list must have the same type. But the type can be polymorphic (ie. <code>'a list</code>), which is really useful if you want to write generic functions which operate on &quot;lists of anything&quot;. (But note: <code>'a list</code> doesn't mean that each individual element has a different type - you still can't use this to construct a list containing, say, a mixture of ints and strings. It means that the type of the elements is anything, but all the same type of anything.)</p>
<p>The <code>length</code> function defined as part of the OCaml <code>List</code> module is a good example of this. It doesn't matter if the list contains ints or strings or objects or small furry animals, the <code>List.length</code> function can still be called on it. The type of <code>List.length</code> is therefore:</p>
<pre ml:content="ocaml noeval">
List.length : 'a list -&gt; int
</pre>

<a name="Structures"></a><h2><span>Structures</span></h2>
<p>C and C++ have the concept of a simple <code>struct</code>, short for structure. Java has classes which can be used to similar effect, albeit much more laboriously.</p>
<p>Consider this simple C structure:</p>
<pre>
struct pair_of_ints {
  int a, b;
};
</pre>

<p>The simplest equivalent to this in OCaml is a <strong>tuple</strong> such as <code>(3, 4)</code> which has the type <code>int * int</code>. Unlike lists, tuples can contain elements of different types, so for example <code>(3, &quot;hello&quot;, 'x')</code> has type <code>int * string * char</code>.</p>
<p>A slightly more complex alternative way of writing a C struct is to use a <strong>record</strong>. Records, like C structs, allow you to name the elements. Tuples don't let you name the elements, but instead you have to remember the order in which they appear. Here is the equivalent record for our C struct above:</p>
<pre ml:content="ocaml silent">
type pair_of_ints = { a : int; b : int };;
</pre>

<p>That defines the type, and here is how we actually <em>create</em> objects of this type:</p>
<pre ml:content="ocaml silent">
{ a=3; b=5 }
</pre>

<p>Note that we use &quot;:&quot; in the type definition and &quot;=&quot; when creating objects of this type.</p>
<p>Here are some examples of this typed into the toplevel:</p>
<pre ml:content="ocaml">
type pair_of_ints = { a : int; b : int };;
{a=3; b=5};;
{a=3};;
</pre>

<p>So OCaml won't let you leave some fields in your structure undefined.</p>
<a name="Variants__qualified_unions_and_enums_"></a><h2><span>Variants (qualified unions and enums)</span></h2>
<p>A &quot;qualified union&quot; doesn't really exist in C, although there is support in the gcc compiler for it. Here is the pattern which one commonly uses for a qualified union in C:</p>
<pre>
struct foo {
  int type;
#define TYPE_INT 1
#define TYPE_PAIR_OF_INTS 2
#define TYPE_STRING 3
  union {
    int i;        // If type == TYPE_INT.
    int pair[2];  // If type == TYPE_PAIR_OF_INTS.
    char *str;    // If type == TYPE_STRING.
  } u;
};
</pre>

<p>We've all seen this I should think, and it's not a pretty sight. For a start it's not safe: the programmer might make a mistake and accidentally use, say, the <code>u.i</code> field when in fact a string was stored in the structure. Also the compiler can't easily check if all possible types have been examined in a switch statement (you can use an <code>enum</code> type instead to solve this particular problem). The programmer might forget to set the <code>type</code> field, which would result in all sorts of fun and games. Furthermore, it's cumbersome.</p>
<p>Here is the elegant and concise equivalent in OCaml:</p>
<pre ml:content="ocaml noeval">
type foo = Nothing | Int of int | Pair of int * int | String of string
</pre>

<p>That's the type definition. First part of each <code>|</code> separated part is called the constructor. It can be called anything, as long as it starts with a capital letter. If the constructor can be used to define a value, it's followed by the <code>of type</code> part, where type always starts with a lowercase letter. In the above example, Nothing is used as a constant and the other constructors are used with values.</p>
<p>To actually <em>create</em> things of this type you would write:</p>
<pre ml:content="ocaml noeval">
Nothing
Int 3
Pair (4, 5)
String &quot;hello&quot;
...
</pre>

<p>Each of these expressions has type <code>foo</code>.</p>
<p>Note that you use <code>of</code> when writing the type definition, but NOT when writing elements of the type.</p>
<p>By extension, a simple C <code>enum</code> defined as:</p>
<pre>
enum sign { positive, zero, negative };
</pre>

<p>can be written in OCaml as:</p>
<pre ml:content="ocaml noeval">
type sign = Positive | Zero | Negative
</pre>

<h3>Recursive variants (used for trees)</h3>
<p>Variants can be recursive, and the common use for this is to define tree structures. This really is where the expressive power of functional languages come into their own:</p>
<pre ml:content="ocaml noeval">
type binary_tree = Leaf of int | Tree of binary_tree * binary_tree
</pre>

<p>Here're some binary trees. For practice, try drawing them on paper.</p>
<pre ml:content="ocaml noeval">
Leaf 3
Tree (Leaf 3, Leaf 4)
Tree (Tree (Leaf 3, Leaf 4), Leaf 5)
Tree (Tree (Leaf 3, Leaf 4), Tree (Tree (Leaf 3, Leaf 4), Leaf 5))
</pre>

<h3>Parameterized variants</h3>
<p>The binary tree in the previous section has integers at each leaf, but what if we wanted to describe the <em>shape</em> of a binary tree, but decide exactly what to store at each leaf node later? We can do this by using a parameterized (or polymorphic) variant, like this:</p>
<pre ml:content="ocaml">
type 'a binary_tree = Leaf of 'a | Tree of 'a binary_tree * 'a binary_tree
</pre>

<p>This is a general type. The specific type which stores integers at each leaf is called <code>int binary_tree</code>. Similarly the specific type which stores strings at each leaf is called <code>string binary_tree</code>. In the next example we type some instances into the top-level and allow the type inference system to show the types for us:</p>
<pre ml:content="ocaml">
Leaf &quot;hello&quot;;;
Leaf 3.0;;
</pre>

<p>Notice how the type name is backwards. Compare this to the type names for lists, eg. <code>int list</code> etc.</p>
<p>In fact it is no coincidence that <code>'a list</code> is written &quot;backwards&quot; in the same way. Lists are simply parameterized variant types with the following slightly strange definition:</p>
<pre ml:content="ocaml noeval">
  type 'a list = [] | :: of 'a * 'a list   (* not real OCaml code *)
</pre>

<p>Actually the definition above doesn't quite compile. Here's a pretty-much equivalent definition:</p>
<pre ml:content="ocaml">
type 'a equiv_list = Nil | Cons of 'a * 'a equiv_list;;
Nil;;
Cons(1, Nil);;
Cons(1, Cons(2, Nil));;
</pre>

<p>Recall earlier that we said lists could be written two ways, either with the simple syntactic sugar of <code>[1; 2; 3]</code> or more formally as <code>1 :: 2 :: 3 :: []</code>. If you look at the definition for <code>'a list</code> above, you may be able to see the reason for the formal definition.</p>
<a name="Lists__structures_and_variants___summary"></a><h2><span>Lists, structures and variants - summary</span></h2>
<p>OCaml name      Example type definition                Example usage</p>
<pre>

list            int list                               [1; 2; 3]
tuple           int * string                           (3, &quot;hello&quot;)
record          type pair = { a : int; b : string }    { a = 3; b = &quot;hello&quot; }
variant         type foo = Int of int                  Int 3
                           | Pair of int * string                                                                      
variant         type sign = Positive | Zero            Positive
                            | Negative                 Zero
parameterized   type 'a my_list = Empty                Cons (1, Cons (2, Empty))
  variant                   | Cons of 'a * 'a my_list
</pre>

<h2><a name="Pattern_matching__on_datatypes_"></a>Pattern matching (on
  datatypes)</h2>
<p>So one Really Cool Feature of functional languages is the ability to break apart data structures and do pattern matching on the data. This is again not really a &quot;functional&quot; feature - you could imagine some variation of C appearing which would let you do this, but it's a Cool Feature nonetheless.</p>
<p>Let's start with a real program requirement: I wish to represent simple mathematical expressions like <code>n * (x + y)</code> and multiply them out symbolically to get <code>n * x + n * y</code>.</p>
<p>Let's define a type for these expressions:</p>
<pre ml:content="ocaml">
  type expr = Plus of expr * expr          (* means a + b *)
              | Minus of expr * expr       (* means a - b *)
              | Times of expr * expr       (* means a * b *)
	      | Divide of expr * expr      (* means a / b *)
              | Value of string            (* &quot;x&quot;, &quot;y&quot;, &quot;n&quot;, etc. *)
</pre>

<p>The expression <code>n * (x + y)</code> would be written:</p>
<pre ml:content="ocaml">
Times (Value &quot;n&quot;, Plus (Value &quot;x&quot;, Value &quot;y&quot;))
</pre>

<p>Let's write a function which prints out <code>Times (Value &quot;n&quot;, Plus (Value &quot;x&quot;, Value &quot;y&quot;))</code> as something more like <code>n * (x + y)</code>.  Actually, I'm going to write two functions, one which converts the expression to a pretty string, and one which prints it out (the reason is that I might want to write the same string to a file and I wouldn't want to repeat the whole of the function just for that).</p>
<pre ml:content="ocaml">
  let rec to_string e =
    match e with
    | Plus (left, right)   -&gt; &quot;(&quot; ^ to_string left ^ &quot; + &quot; ^ to_string right ^ &quot;)&quot;
    | Minus (left, right)  -&gt; &quot;(&quot; ^ to_string left ^ &quot; - &quot; ^ to_string right ^ &quot;)&quot;
    | Times (left, right)  -&gt; &quot;(&quot; ^ to_string left ^ &quot; * &quot; ^ to_string right ^ &quot;)&quot;
    | Divide (left, right) -&gt; &quot;(&quot; ^ to_string left ^ &quot; / &quot; ^ to_string right ^ &quot;)&quot;
    | Value v -&gt; v ;;
  
  let print_expr e =
    print_endline (to_string e);;
</pre>

<p>(NB: The <code>^</code> operator concatenates strings.)</p>
<p>Here's the print function in action:</p>
<pre ml:content="ocaml">
print_expr (Times (Value &quot;n&quot;, Plus (Value &quot;x&quot;, Value &quot;y&quot;)))
</pre>

<p>The general form for pattern matching is:</p>
<pre ml:content="ocaml noeval">
match object with
| pattern    -&gt;  result
| pattern    -&gt;  result
    ...
</pre>

<p>The patterns on the left hand side can be simple, as in the <code>to_string</code> function above, or complex and nested. The next example is our function to multiply out expressions of the form <code>n * (x + y)</code> or <code>(x + y) * n</code> and for this we will use a nested pattern:</p>
<pre ml:content="ocaml">
  let rec multiply_out e =
    match e with
    | Times (e1, Plus (e2, e3)) -&gt;
        Plus (Times (multiply_out e1, multiply_out e2),
              Times (multiply_out e1, multiply_out e3))
    | Times (Plus (e1, e2), e3) -&gt;
        Plus (Times (multiply_out e1, multiply_out e3),
              Times (multiply_out e2, multiply_out e3))
    | Plus (left, right) -&gt; Plus (multiply_out left, multiply_out right)
    | Minus (left, right) -&gt; Minus (multiply_out left, multiply_out right)
    | Times (left, right) -&gt; Times (multiply_out left, multiply_out right)
    | Divide (left, right) -&gt; Divide (multiply_out left, multiply_out right)
    | Value v -&gt; Value v
</pre>

<p>Here it is in action:</p>
<pre ml:content="ocaml">
print_expr (multiply_out (Times (Value &quot;n&quot;, Plus (Value &quot;x&quot;, Value &quot;y&quot;))))
</pre>

<p>How does the <code>multiply_out</code> function work? The key is in the first two patterns. The first pattern is <code>Times (e1, Plus (e2, e3))</code> which matches expressions of the form <code>e1 * (e2 + e3)</code>. Now look at the right hand side of this first pattern match, and convince yourself that it is the equivalent of <code>(e1 * e2) + (e1 * e3)</code>.</p>
<p>The second pattern does the same thing, except for expressions of the form <code>(e1 + e2) * e3</code>.</p>
<p>The remaining patterns don't change the form of the expression, but they crucially <em>do</em> call the <code>multiply_out</code> function recursively on their subexpressions. This ensures that all subexpressions within the expression get multiplied out too (if you only wanted to multiply out the very top level of an expression, then you could replace all the remaining patterns with a simple <code>e -&gt; e</code> rule).</p>
<p>Can we do the reverse (ie. factorizing out common subexpressions)? We sure can! (But it's a bit more complicated). The following version only works for the top level expression. You could certainly extend it to cope with all levels of an expression and more complex cases:</p>
<pre ml:content="ocaml">
  let factorize e =
    match e with
    | Plus (Times (e1, e2), Times (e3, e4)) when e1 = e3 -&gt;
       Times (e1, Plus (e2, e4))
    | Plus (Times (e1, e2), Times (e3, e4)) when e2 = e4 -&gt;
       Times (Plus (e1, e3), e4)
    | e -&gt; e
</pre>

<pre ml:content="ocaml">
factorize (Plus (Times (Value &quot;n&quot;, Value &quot;x&quot;), Times (Value &quot;n&quot;, Value &quot;y&quot;)))
</pre>

<p>The factorize function above introduces another couple of features. You can add what are known as <strong>guards</strong> to each pattern match. A guard is the conditional which follows the <code>when</code>, and it means that the pattern match only happens if the pattern matches <em>and</em> the condition in the <code>when</code>-clause is satisfied.</p>
<pre ml:content="ocaml noeval">
match object with
  pattern    [ when condition ]   -&gt;  result
  pattern    [ when condition ]   -&gt;  result
    ...
</pre>

<p>The second feature is the <code>=</code> operator which tests for &quot;structural equality&quot; between two expressions. That means it goes recursively into each expression checking they're exactly the same at all levels down.</p>
<p>OCaml is able to check at compile time that you have covered all possibilities in your patterns. I changed the type definition of <code>type expr</code> above by adding a <code>Product</code> variant:</p>
<pre ml:content="ocaml silent">
  type expr = Plus of expr * expr        (* means a + b *)
              | Minus of expr * expr     (* means a - b *)
              | Times of expr * expr     (* means a * b *)
              | Divide of expr * expr    (* means a / b *)
              | Product of expr list     (* means a * b * c * ... *)
              | Value of string          (* &quot;x&quot;, &quot;y&quot;, &quot;n&quot;, etc. *)
</pre>

<p>I then recompiled the <code>to_string</code> function without changing it. OCaml reported the following warning:</p>
<pre ml:content="ocaml">
  let rec to_string e =
    match e with
    | Plus (left, right)   -&gt; &quot;(&quot; ^ to_string left ^ &quot; + &quot; ^ to_string right ^ &quot;)&quot;
    | Minus (left, right)  -&gt; &quot;(&quot; ^ to_string left ^ &quot; - &quot; ^ to_string right ^ &quot;)&quot;
    | Times (left, right)  -&gt; &quot;(&quot; ^ to_string left ^ &quot; * &quot; ^ to_string right ^ &quot;)&quot;
    | Divide (left, right) -&gt; &quot;(&quot; ^ to_string left ^ &quot; / &quot; ^ to_string right ^ &quot;)&quot;
    | Value v -&gt; v ;;
</pre>

</div>

</body>
