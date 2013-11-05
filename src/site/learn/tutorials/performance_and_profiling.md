<head>
<title>Performance and Profiling</title>
</head>
<body>

<h1>Performance and Profiling</h1>

<h2><a name="ObQuote____"></a>ObQuote...</h2>

<p><em>&quot;One serious obstacle to the adoption of good programming languages is the notion that everything has to be sacrificed for speed. In computer languages as in life, speed kills.&quot; — Mike Vanier</em></p>

<h2><a name="Speed"></a>Speed</h2>
<p>Why is OCaml fast? Indeed, step back and ask <em>is OCaml fast?</em> How can we make programs faster?  In this chapter we'll look at what actually happens when you compile your OCaml programs down to machine code. This will help in understanding why OCaml is not just a great language for programming, but is also a very fast language indeed. And it'll help you to help the compiler write better machine code for you.  It's also (I believe anyway) a good thing for programmers to have some idea of what happens between you typing <code>ocamlopt</code> and getting a binary you can run.</p>
<p>But you will need to know some assembler to get the most out of this section. Don't be afraid! I'll help you out by translating the assembler into a C-like pseudocode (after all C is just a portable assembly language).</p>

<h3>Basics of assembly language</h3>
<p>The examples I give in this chapter are all compiled on an x86 Linux machine. The x86 is, of course, a 32 bit machine, so an x86 &quot;word&quot; is 4 bytes (= 32 bits) long. At this level OCaml deals mostly with word-sized objects, so you'll need to remember to multiply by four to get the size in bytes.</p>
<p>To refresh your memory, the x86 has only a small number of general purpose registers, each of which can store one word. The Linux assembler puts <code>%</code> in front of register names. The registers are: <code>%eax</code>, <code>%ebx</code>, <code>%ecx</code>, <code>%edx</code>, <code>%esi</code>, <code>%edi</code>, <code>%ebp</code> (special register used for stack frames), and <code>%esp</code> (the stack pointer).</p>
<p>The Linux assembler (in common with other Unix assemblers, but opposite to MS-derived assemblers) writes moves to and from registers/memory as:</p>
<pre>
movl from, to
</pre>

<p>So <code>movl %ebx, %eax</code> means &quot;copy the contents of register <code>%ebx</code> into register <code>%eax</code>&quot; (not the other way round).</p>
<p>Almost all of the assembly language that we will look at is going to be dominated not by machine code instructions like <code>movl</code> but by what are known as &lt;dfn&gt;assembler directives&lt;/dfn&gt;. These directives begin with a . (period) and they literally <em>direct</em> the assembler to do something. Here are the common ones for the Linux assembler:</p>
<p><strong>.text</strong></p>
<p><strong>Text</strong> is the Unix way of saying &quot;program code&quot;. The <strong>text segment</strong> simply means the part of the executable where program code is stored. The <code>.text</code> directive switches the assembler so it starts writing into the text segment.</p>
<p><strong>.data</strong></p>
<p>Similarly, the <code>.data</code> directive switches the assembler so it starts writing into the data segment (part) of the executable.</p>
<pre>
  .globl foo
foo:
</pre>

<p>This declares a global symbol called <code>foo</code>. It means the address of the next thing to come can be named <code>foo</code>. Writing just <code>foo:</code> without the preceeding <code>.globl</code> directive declares a local symbol (local to just the current file).</p>
<pre>
.long 12345
.byte 9
.ascii &quot;hello&quot;
.space 4
</pre>

<p><code>.long</code> writes a word (4 bytes) to the current segment. <code>.byte</code> writes a single byte. <code>.ascii</code> writes a string of bytes (NOT nul-terminated). <code>.space</code> writes the given number of zero bytes. Normally you use these in the data segment.</p>
<h3>The &quot;hello, world&quot; program</h3>
<p>Enough assembler. Put the following program into a file called <code>smallest.ml</code>:</p>
<pre>
print_string &quot;hello, world\n&quot;
</pre>

<p>And compile it to a native code executable using:</p>
<pre>
ocamlopt -S smallest.ml -o smallest
</pre>

<p>The <code>-S</code> (capital S) tells the compiler to leave the assembly language file (called <code>smallest.s</code> - lowercase s) instead of deleting it.</p>
<p>Here are the edited highlights of the <code>smallest.s</code> file with my comments added. First of all the data segment:</p>
<pre>
        .data
        .long   4348                     ; header for string
        .globl  Smallest__1
Smallest__1:
        .ascii  &quot;hello, world\12&quot;        ; string
        .space  2                        ; padding ..
        .byte   2                        ;  .. after string
</pre>

<p>Next up the text (program code) segment:</p>
<pre>
        .text
        .globl  Smallest__entry          ; entry point to the program
Smallest__entry:

        ; this is equivalent to the C pseudo-code:
        ; Pervasives.output_string (stdout, &amp;Smallest__1)

        movl    $Smallest__1, %ebx
        movl    Pervasives + 92, %eax    ; Pervasives + 92 == stdout
        call    Pervasives__output_string_212

        ; return 1

        movl    $1, %eax
        ret
</pre>

<p>In C everything has to be inside a function. Think about how you can't just write <code>printf (&quot;hello, world\n&quot;);</code> in C, but instead you have to put it inside <code>main () { ... }</code>. In OCaml you are allowed to have commands at the top level, not inside a function. But when we translate this into assembly language, where do we put those commands? There needs to be some way to call those commands from outside, so they need to be labelled in some way. As you can see from the code snippet, OCaml solves this by taking the filename (<code>smallest.ml</code>), capitalizing it and adding <code>__entry</code>, thus making up a symbol called <code>Smallest__entry</code> to refer to the top level commands in this file.</p>
<p>Now look at the code that OCaml has generated. The original code said <code>print_string &quot;hello, world\n&quot;</code>, but OCaml has instead compiled the equivalent of <code>Pervasives.output_string stdout &quot;hello, world\n&quot;</code>. Why? If you look into <code>pervasives.ml</code> you'll see why:</p>
<pre ml:content="ocaml noeval">
let print_string s = output_string stdout s
</pre>

<p>OCaml has <em>inlined</em> this function. <strong>Inlining</strong> - taking a function and expanding it from its definition - is sometimes a performance win, because it avoids the overhead of an extra function call, and it can lead to more opportunities for the optimizer to do its thing. Sometimes inlining is not good, because it can lead to code bloating, and thus destroys the good work done by the processor cache (and besides function calls are actually not very expensive at all on modern processors). OCaml will inline simple calls like this, because they are essentially risk free, almost always leading to a small performance gain.</p>
<p>What else can we notice about this? The calling convention seems to be that the first two arguments are passed in the <code>%eax</code> and <code>%ebx</code> registers respectively. Other arguments are probably passed on the stack, but we'll see about that later.</p>
<p>C programs have a simple convention for storing strings, known as <strong>ASCIIZ</strong>. This just means that the string is stored in ASCII, followed by a trailing NUL (<code>\0</code>) character. OCaml stores strings in a different way, as we can see from the data segment above. This string is stored like this:</p>
<pre>
4 byte header: 4348
the string:    h e l l o , SP w o r l d \n
padding:       \0 \0 \002
</pre>

<p>The format is unusual. It's documented in <a href="http://caml.inria.fr/pub/ml-archives/caml-list/2002/08/e109df224ff0150b302033e2002dbf87.en.html" class="external" title="http://caml.inria.fr/pub/ml-archives/caml-list/2002/08/e109df224ff0150b302033e2002dbf87.en.html">this posting on the OCaml mailing list</a>. &lt;!-- (old: http://caml.inria.fr/archives/200208/msg00463.html) --&gt;</p>
<p>Firstly the padding brings the total length of the string up to a whole number of words (4 words, 16 bytes in this example).  The padding is carefully designed so that you can work out the actual length of the string in bytes, provided that you know the total number of <em>words</em> allocated to the string. The encoding for this is unambiguous (which you can prove to yourself).</p>
<p>One nice feature of having strings with an explicit length is that you can represent strings containing ASCII NUL (<code>\0</code>) characters in them, something which is difficult to do in C. However, the flip side is that you need to be aware of this if you pass an OCaml string to some C native code: if it contains ASCII NUL, then the C <code>str*</code> functions will fail on it.</p>
<p>Secondly we have the header. Every boxed (allocated) object in OCaml has a header which tells the garbage collector about how large the object is in words, and something about what the object contains. Writing the number 4348 in binary:</p>
<pre>
length of the object in words:  0000 0000 0000 0000 0001 00 (4 words)
color (used by GC):             00
tag:                            1111 1100 (String_tag)
</pre>

<p>See <code>/usr/include/ocaml/3.08/caml/mlvalues.h</code> for more information about the format of heap allocated objects in OCaml.</p>
<p>One unusual thing is that the code passes a pointer to the start of the string (ie. the word immediately after the header) to <code>Pervasives.output_string</code>. This means that <code>output_string</code> must subtract 4 from the pointer to get at the header to determine the length of the string.</p>
<p>What have I missed out from this simple example? Well, the text segment above is not the whole story. It would be really nice if OCaml translated that simple hello world program into just the five lines of assembler shown above. But there is the question of what actually calls <code>Smallest__entry</code> in the real program. For this OCaml includes a whole load of bootstrapping code which does things like starting up the garbage collector, allocating and initializing memory, calling initializers in libraries and so on. OCaml links all of this code statically to the final executable, which is why the program I end up with (on Linux) weighs in at a portly 95,442 bytes. Nevertheless the start-up time for the program is still unmeasurably small (under a millisecond), compared to several seconds for starting up a reasonable Java program and a second or so for a Perl script.</p>
<h3>Tail recursion</h3>
<p>We mentioned in chapter 6 that OCaml can turn tail-recursive function calls into simple loops. Is this actually true? Let's look at what simple tail recursion compiles to:</p>
<pre ml:content="ocaml noeval">
let rec loop () =
  print_string &quot;I go on forever ...&quot;;
  loop ()

let () = loop ()
</pre>

<p>The file is called <code>tail.ml</code>, so following OCaml's usual procedure for naming functions, our function will be called <code>Tail__loop_<em>nnn</em></code> (where <code><em>nnn</em></code> is some unique number which OCaml appends to distinguish identically named functions from one another).</p>
<p>Here is the assembler for just the <code>loop</code> function defined above:</p>
<pre>
        .text
        .globl  Tail__loop_56
Tail__loop_56:
.L100:

        ; Print the string

        movl    $Tail__2, %ebx
        movl    Pervasives + 92, %eax
        call    Pervasives__output_string_212
.L101:

        ; The following movl is in fact obsolete:

        movl    $1, %eax

        ; Jump back to the .L100 label above (ie. loop forever)

        jmp     .L100
</pre>

<p>So that's pretty conclusive. Calling <code>Tail__loop_56</code> will first print the string, and then jump back to the top, then print the string, and jump back, and so on forever. It's a simple loop, <em>not</em> a recursive function call, so it doesn't use any stack space.</p>
<h3>Digression: Where are the types?</h3>
<p>OCaml is statically typed as we've said before on many occasions, so at compile time, OCaml knows that the type of <code>loop</code> is <code>unit -&gt; unit</code>. It knows that the type of <code>&quot;hello, world\n&quot;</code> is <code>string</code>. It doesn't make any attempt to communicate this fact to the <code>output_string</code> function. <code>output_string</code> is expecting a <code>channel</code> and a <code>string</code> as arguments, and indeed that's what it gets. What would happen if we passed, say, an <code>int</code> instead of a <code>string</code>?</p>
<p>This is essentially an impossible condition. Because OCaml knows the types at compile time, it doesn't need to deal with types or check types at run time. There is no way, in pure OCaml, to &quot;trick&quot; the compiler into generating a call to <code>Pervasives.output_string stdout 1</code>. Such an error would be flagged at compile time, by type inference, and so could never be compiled.</p>
<p>The upshot is that by the time we have compiled OCaml code to assembler type information mostly isn't required, certainly in the cases we've looked at above where the type is fully known at compile time, and there is no polymorphism going on.</p>
<p>Fully knowing all your types at compile time is a major performance win because it totally avoids any dynamic type checking at run time. Compare this to a Java method invocation for example: <code>obj.method ()</code>. This is an expensive operation because you need to find the concrete class that <code>obj</code> is an instance of, and then look up the method, and you need to do all of this potentially <em>every</em> time you call any method. Casting objects is another case where you need to do a considerable amount of work at run time in Java. None of this is allowed with OCaml's static types.</p>

<h3>Polymorphic types</h3>
<p>As you might have guessed from the discussion above, polymorphism, which is where the compiler <em>doesn't</em> have a fully known type for a function at compile time, might have an impact on performance. Suppose we require a function to work out the maximum of two integers. Our first attempt is:</p>
<pre ml:content="ocaml noeval">
let max a b =
  if a &gt; b then a else b
</pre>

<p>Simple enough, but recall that the &gt; (greater than) operator in OCaml is polymorphic. It has type <code>'a -&gt; 'a -&gt; bool</code>, and this means that the <code>max</code> function we defined above is going to be polymorphic:</p>
<pre ml:content="ocaml">
  let max a b =
    if a &gt; b then a else b
</pre>

<p>This is indeed reflected in the code that OCaml generates for this function, which is pretty complex:</p>
<pre>
        .text
        .globl  Max__max_56
Max__max_56:

        ; Reserve two words of stack space.

        subl    $8, %esp

        ; Save the first and second arguments (a and b) on the stack.

        movl    %eax, 4(%esp)
        movl    %ebx, 0(%esp)

        ; Call the C &quot;greaterthan&quot; function (in the OCaml library).

        pushl   %ebx
        pushl   %eax
        movl    $greaterthan, %eax
        call    caml_c_call
.L102:
        addl    $8, %esp

        ; If the C &quot;greaterthan&quot; function returned 1, jump to .L100

        cmpl    $1, %eax
        je      .L100

        ; Returned 0, so get argument a which we previously saved on
        ; the stack and return it.

        movl    4(%esp), %eax
        addl    $8, %esp
        ret

        ; Returned 1, so get argument b which we previously saved on
        ; the stack and return it.

.L100:
        movl    0(%esp), %eax
        addl    $8, %esp
        ret
</pre>

<p>Basically the &gt; operation is done by calling a C function from the OCaml library. This is obviously not going to be very efficient, nothing like as efficient as if we could generate some quick inline assembly language for doing the &gt;.</p>
<p>This is not a complete dead loss by any means. All we need to do is to hint to the OCaml compiler that the arguments are in fact integers. Then OCaml will generate a specialised version of <code>max</code> which only works on <code>int</code> arguments:</p>
<pre ml:content="ocaml noeval">
let max (a : int) (b : int) =
  if a &gt; b then a else b
</pre>

<p>Here is the assembly code generated for this function:</p>
<pre>
        .text
        .globl  Max_int__max_56
Max_int__max_56:

        ; Single assembly instruction &quot;cmpl&quot; for performing the &gt; op.

        cmpl    %ebx, %eax

        ; If %ebx &gt; %eax, jump to .L100

        jle     .L100

        ; Just return argument a.

        ret

        ; Return argument b.

.L100:
        movl    %ebx, %eax
        ret
</pre>

<p>That's just 5 lines of assembler, and is about as simple as you can make it.</p>
<p>What about this code:</p>
<pre ml:content="ocaml noeval">
let max a b =
  if a &gt; b then a else b

let () = print_int (max 2 3)
</pre>

<p>Is OCaml going to be smart enough to inline the <code>max</code> function and specialise it to work on integers? Disappointingly the answer is no. OCaml still has to generate the external <code>Max.max</code> symbol (because this is a module, and so that function might be called from outside the module), and it doesn't inline the function.</p>
<p>Here's another variation:</p>
<pre ml:content="ocaml noeval">
let max a b =
  if a &gt; b then a else b in
print_int (max 2 3)
</pre>

<p>Disappointingly although the definition of <code>max</code> in this code is local (it can't be called from outside the module), OCaml still doesn't specialise the function.</p>
<p>Lesson: if you have a function which is unintentionally polymorphic then you can help the compiler by specifying types for one or more of the arguments.</p>

<h3>The representation of integers, tag bits, heap-allocated values</h3>

<p>There are a number of peculiarities about integers in OCaml. One of these is that integers are 31 bit entities, not 32 bit entities. What happens to the &quot;missing&quot; bit?</p>
<p>Write this to <code>int.ml</code>:</p>
<pre ml:content="ocaml noeval">
print_int 3;;
</pre>

<p>and compile with <code>ocamlopt -S int.ml -o int</code> to generate assembly language in <code>int.s</code>. Recall from the discussion above that we are expecting OCaml to inline the <code>print_int</code> function as <code>output_string (string_of_int 3)</code>, and examining the assembly language output we can see that this is exactly what OCaml does:</p>
<pre>
        .text
        .globl  Int__entry
Int__entry:

        ; Call Pervasives.string_of_int (3)

        movl    $7, %eax
        call    Pervasives__string_of_int_152

        ; Call Pervasives.output_string (stdout, result_of_previous)

        movl    %eax, %ebx
        movl    Pervasives + 92, %eax
        call    Pervasives__output_string_212
</pre>

<p>The important code is shown in red. It shows two things: Firstly the integer is unboxed (not allocated on the heap), but is instead passed directly to the function in the register <code>%eax</code>. This is fast. But secondly we see that the number being passed is 7, not 3.</p>
<p>This is a consequence of the representation of integers in OCaml. The bottom bit of the integer is used as a tag - we'll see what for next. The top 31 bits are the actual integer. The binary representation of 7 is 111, so the bottom tag bit is 1 and the top 31 bits form the number 11 in binary = 3. To get from the OCaml representation to the integer, divide by two and round down.</p>
<p>Why the tag bit at all? This bit is used to distinguish between integers and pointers to structures on the heap, and the distinction is only necessary if we are calling a polymorphic function. In the case above, where we are calling <code>string_of_int</code>, the argument can only ever be an <code>int</code> and so the tag bit would never be consulted. Nevertheless, to avoid having two internal representations for integers, all integers in OCaml carry around the tag bit.</p>
<p>A bit of background about pointers is required to understand why the tag bit is really necessary, and why it is where it is.</p>
<p>In the world of RISC chips like the Sparc, MIPS and Alpha, pointers have to be word-aligned. So on the older 32 bit Sparc, for example, it's not possible to create and use a pointer which isn't aligned to a multiple of 4 (bytes). Trying to use one generates a processor exception, which means basically your program segfaults. The reason for this is just to simplify memory access. It's just a lot simpler to design the memory subsystem of a CPU if you only need to worry about word-aligned access.</p>
<p>For historical reasons (because the x86 is derived from an 8 bit chip), the x86 has supported unaligned memory access, although if you align all memory accesses to multiples of 4, then things go faster.</p>
<p>Nevertheless, all pointers in OCaml are aligned - ie. multiples of 4 for 32 bit processors, and multiples of 8 for 64 bit processors. This means that the bottom bit of any pointer in OCaml will always be zero.</p>
<p>So you can see that by looking at the bottom bit of a register, you can immediately tell if it stores a pointer (&quot;tag&quot; bit is zero), or an integer (tag bit set to one).</p>
<p>Remember our polymorphic &gt; function which caused us so much trouble in the previous section? We looked at the assembler and found out that OCaml compiles a call to a C function called <code>greaterthan</code> whenever it sees the polymorphic form of &gt;. This function takes two arguments, in registers <code>%eax</code> and <code>%ebx</code>. But <code>greaterthan</code> can be called with integers, floats, strings, opaque objects ... How does it know what <code>%eax</code> and <code>%ebx</code> point to?</p>
<p>It uses the following decision tree:</p>
<ul><li><strong>Tag bit is one:</strong> compare the two integers and return.</li>
<li><strong>Tag bit is zero:</strong> <code>%eax</code> and <code>%ebx</code> must point at two heap-allocated memory blocks. Look at the header word of the memory blocks, specifically the bottom 8 bits of the header word, which tag the content of the block.</li>
<li>- <strong>String_tag:</strong> Compare two strings.</li>
<li>- <strong>Double_tag:</strong> Compare two floats.</li>
<li>etc.</li></ul>
<p>Note that because &gt; has type <code>'a -&gt; 'a -&gt; bool</code>, both arguments must have the same type. The compiler should enforce this at compile time. I would assume that <code>greaterthan</code> probably contains code to sanity-check this at run time however.</p>

<h3>Floats</h3>

<p>Floats are, by default, boxed (allocated on the heap). Save this as <code>float.ml</code> and compile it with <code>ocamlopt -S float.ml -o float</code>:</p>
<pre ml:content="ocaml noeval">
print_float 3.0
</pre>

<p>The number is not passed directly to <code>string_of_float</code> in the <code>%eax</code> register as happened above with ints. Instead, it is created statically in the data segment:</p>
<pre>
        .data
        .long   2301
        .globl  Float__1
Float__1:
        .double 3.0
</pre>

<p>and a pointer to the float is passed in <code>%eax</code> instead:</p>
<pre>
        movl    $Float__1, %eax
        call    Pervasives__string_of_float_157
</pre>

<p>Note the structure of the floating point number: it has a header (2301), followed by the 8 byte (2 word) representation of the number itself. The header can be decoded by writing it as binary:</p>
<pre>
Length of the object in words:  0000 0000 0000 0000 0000 10 (8 bytes)
Color:                          00
Tag:                            1111 1101 (Double_tag)
</pre>

<p><code>string_of_float</code> isn't polymorphic, but suppose we have a polymorphic function <code>foo : 'a -&gt; unit</code> taking one polymorphic argument. If we call <code>foo</code> with <code>%eax</code> containing 7, then this is equivalent to <code>foo 3</code>, whereas if we call <code>foo</code> with <code>%eax</code> containing a pointer to <code>Float__1</code> above, then this is equivalent to <code>foo 3.0</code>.</p>
<h3>Arrays</h3>
<p>I mentioned earlier that one of OCaml's targets was numerical computing. Numerical computing does a lot of work on vectors and matrices, which are essentially arrays of floats. As a special hack to make this go faster, OCaml implements &lt;dfn&gt;arrays of unboxed floats&lt;/dfn&gt;. This means that in the special case where we have an object of type <code>float array</code> (array of floats), OCaml stores them the same way as in C:</p>
<pre>
double array[10];
</pre>

<p>... instead of having an array of pointers to ten separately allocated floats on the heap.</p>
<p>Let's see this in practice:</p>
<pre ml:content="ocaml noeval">
let a = Array.create 10 0.0;;
for i = 0 to 9 do
  a.(i) &lt;- float_of_int i
done
</pre>

<p>I'm going to compile this code with the <code>-unsafe</code> option to remove bounds checking (simplifying the code for our exposition here). The first line, which creates the array, is compiled to a simple C call:</p>
<pre>
        pushl   $Arrayfloats__1     ; Boxed float 0.0
        pushl   $21                 ; The integer 10
        movl    $make_vect, %eax    ; Address of the C function to call
        call    caml_c_call
	; ...
        movl    %eax, Arrayfloats   ; Store the resulting pointer to the
                                    ; array at this place on the heap.
</pre>

<p>The loop is compiled to this relatively simple assembly language:</p>
<pre>
        movl    $1, %eax            ; Let %eax = 0. %eax is going to store i.
        cmpl    $19, %eax           ; If %eax &gt; 9, then jump out of the
        jg      .L100               ;   loop (to label .L100 at the end).

.L101:                              ; This is the start of the loop body.
        movl    Arrayfloats, %ecx   ; Address of the array to %ecx.

        movl    %eax, %ebx          ; Copy i to %ebx.
        sarl    $1, %ebx            ; Remove the tag bit from %ebx by
                                    ;   shifting it right 1 place. So %ebx
                                    ;   now contains the real integer i.

        pushl   %ebx                ; Convert %ebx to a float.
        fildl   (%esp)
        addl    $4, %esp

        fstpl   -4(%ecx, %eax, 4)   ; Store the float in the array at the ith
	                            ; position.

        addl    $2, %eax            ; i := i + 1
        cmpl    $19, %eax           ; If i &lt;= 9, loop around again.
        jle     .L101
.L100:
</pre>

<p>The important statement is the one which stores the float into the array. It is:</p>
<pre>
        fstpl   -4(%ecx, %eax, 4)
</pre>

<p>The assembler syntax is rather complex, but the bracketed expression <code>-4(%ecx, %eax, 4)</code> means &quot;at the address <code>%ecx + 4*%eax - 4</code>&quot;.  Recall that <code>%eax</code> is the OCaml representation of i, complete with tag bit, so it is essentially equal to <code>i*2+1</code>, so let's substitute that and multiply it out:</p>
<pre>
  %ecx + 4*%eax - 4
= %ecx + 4*(i*2+1) - 4
= %ecx + 4*i*2 + 4 - 4
= %ecx + 8*i
</pre>

<p>(Each float in the array is 8 bytes long.)</p>
<p>So arrays of floats are unboxed, as expected.</p>

<h3>Partially applied functions and closures</h3>
<p>How does OCaml compile functions which are only partially applied? Let's compile this code:</p>
<pre ml:content="ocaml noeval">
Array.map ((+) 2) [| 1; 2; 3; 4; 5 |]
</pre>

<p>If you recall the syntax, <code>[| ... |]</code> declares an array (in this case an <code>int array</code>), and <code>((+) 2)</code> is a closure - &quot;the function which adds 2 to things&quot;.</p>
<p>Compiling this code reveals some interesting new features. Firstly the code which allocates the array:</p>
<pre>
        
        movl    $24, %eax           ; Allocate 5 * 4 + 4 = 24 bytes of memory.
        call    caml_alloc

        leal    4(%eax), %eax       ; Let %eax point to 4 bytes into the
                                    ;   allocated memory.
</pre>

<p>All heap allocations have the same format: 4 byte header + data. In this case the data is 5 integers, so we allocate 4 bytes for the header plus 5 * 4 bytes for the data. We update the pointer to point at the first data word, ie. 4 bytes into the allocated memory block.</p>
<p>Next OCaml generates code to initialize the array:</p>
<pre>
        movl    $5120, -4(%eax)
        movl    $3, (%eax)
        movl    $5, 4(%eax)
        movl    $7, 8(%eax)
        movl    $9, 12(%eax)
        movl    $11, 16(%eax)
</pre>

<p>The header word is 5120, which if you write it in binary means a block containing 5 words, with tag zero. The tag of zero means it's a &quot;structured block&quot; a.k.a. an array. We also copy the numbers 1, 2, 3, 4 and 5 to the appropriate places in the array. Notice the OCaml representation of integers is used. Because this is a structured block, the garbage collector will scan each word in this block, and the GC needs to be able to distriguish between integers and pointers to other heap-allocated blocks (the GC does not have access to type information about this array).</p>
<p>Next the closure <code>((+) 2)</code> is created. The closure is represented by this block allocated in the data segment:</p>
<pre>
        .data
        .long   3319
        .globl  Closure__1
Closure__1:
        .long   caml_curry2
        .long   5
        .long   Closure__fun_58
</pre>

<p>The header is 3319, indicating a <code>Closure_tag</code> with length 3 words. The 3 words in the block are the address of the function <code>caml_curry2</code>, the integer number 2 and the address  of this function:</p>
<pre>
        .text
        .globl  Closure__fun_58
Closure__fun_58:

        ; The function takes two arguments, %eax and %ebx.
        ; This line causes the function to return %eax + %ebx - 1.

        lea     -1(%eax, %ebx), %eax
        ret
</pre>

<p>What does this function do? On the face of it, it adds the two arguments, and subtracts one. But remember that <code>%eax</code> and <code>%ebx</code> are in the OCaml representation for integers. Let's represent them as:</p>
<ul><li><code>%eax = 2 * a + 1</code></li>
<li><code>%ebx = 2 * b + 1</code></li></ul>
<p>where <code>a</code> and <code>b</code> are the actual integer arguments. So this function returns:</p>
<pre>
  %eax + %ebx - 1
= 2 * a + 1 + 2 * b + 1 - 1
= 2 * a + 2 * b + 1
= 2 * (a + b) + 1
</pre>

<p>In other words, this function returns the OCaml integer representation of the sum <code>a + b</code>. This function is <code>(+)</code>!</p>
<p>(It's actually more subtle than this - to perform the mathematics quickly, OCaml uses the x86 addressing hardware in a way that probably wasn't intended by the designers of the x86.)</p>
<p>So back to our closure - we won't go into the details of the <code>caml_curry2</code> function, but just say that this closure is the argument <code>2</code> applied to the function <code>(+)</code>, waiting for a second argument. Just as expected.</p>
<p>The actual call to the <code>Array.map</code> function is quite difficult to understand, but the main points for our examination of OCaml is that the code:</p>
<ul><li>Does call <code>Array.map</code> with an explicit closure.</li>
<li>Does not attempt to inline the call and turn it into a loop.</li></ul>
<p>Calling <code>Array.map</code> in this way is undoubtedly slower than writing a loop over the array by hand. The overhead is mainly in the fact that the closure must be evaluated for each element of the array, and that isn't as fast as inlining the closure as a function (if this optimization were even possible). However, if you had a more substantial closure than just <code>((+) 2)</code>, the overhead would be reduced. The FP version also saves expensive <em>programmer</em> time versus writing the imperative loop.</p>
<a name="Profiling"></a><h2><span>Profiling</span></h2>
<p>There are two types of profiling that you can do on OCaml programs:</p>
<ol><li>Get execution counts for bytecode.</li>
<li>Get real profiling for native code.</li></ol>
<p>The <code>ocamlcp</code> and <code>ocamlprof</code> programs perform profiling on bytecode. Here is an example:</p>
<pre ml:content="ocaml noeval">
(* $ ocamlcp -p a graphics.cma graphtest.ml -o graphtest
   $ ./graphtest
   $ ocamlprof graphtest.ml *)

Random.self_init ();;
Graphics.open_graph &quot; 640x480&quot;;;

let rec iterate r x_init i =
  (* 12820000 *) if i == 1 then (* 25640 *) x_init
  else
    (* 12794360 *) let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x);;

for x = 0 to 640 do
  (* 641 *) let r = 4.0 *. (float_of_int x) /. 640.0 in
  for i = 0 to 39 do
    (* 25640 *) let x_init = Random.float 1.0 in
    let x_final = iterate r x_init 500 in
    let y = int_of_float (x_final *. 480.) in
    Graphics.plot x y
  done
done;;
</pre>

<p>The comments <code>(* nnn *)</code> are added by <code>ocamlprof</code>, showing how many times each part of the code was called.</p>
<p>Profiling native code is done using your operating system's native support for profiling. In the case of Linux, we use <code>gprof</code>.</p>
<p>To demonstrate native code profiling, I'm going to calculate the first 3000 primes using the Sieve of Eratosthenes (<a href="http://www.bagley.org/~doug/ocaml/Notes/lazy.shtml" class="external" title="http://www.bagley.org/~doug/ocaml/Notes/lazy.shtml">original code</a>). This program uses streams and camlp4, techniques which we haven't covered in this tutorial.</p>
<pre ml:content="ocaml noeval">
let rec filter p = parser
  [&lt; 'n; s &gt;] -&gt; if p n then [&lt; 'n; filter p s &gt;] else [&lt; filter p s &gt;]

let naturals =
  let rec gen n = [&lt; 'n; gen (succ n) &gt;] in gen 2

let primes =
  let rec sieve = parser
    [&lt; 'n; s &gt;] -&gt; [&lt; 'n; sieve (filter (fun m -&gt; m mod n &lt;&gt; 0) s) &gt;] in
  sieve naturals

let () =
  for i = 1 to 3000 do
    ignore (Stream.next primes)
  done
</pre>

<p>We compile it using the <code>-p</code> option to <code>ocamlopt</code> which tells the compiler to include profiling information for <code>gprof</code>:</p>
<pre>
$ ocamlopt -p -pp &quot;camlp4o pa_extend.cmo&quot; -I +camlp4 sieve.ml -o sieve
</pre>

<p>After running the program as normal, the profiling code dumps out a file <code>gmon.out</code> which we can interpret with <code>gprof</code>:</p>
<pre>
$ gprof ./sieve
Flat profile:

Each sample counts as 0.01 seconds.
  %   cumulative   self              self     total
 time   seconds   seconds    calls   s/call   s/call  name
 10.86      0.57     0.57     2109     0.00     0.00  sweep_slice
  9.71      1.08     0.51     1113     0.00     0.00  mark_slice
  7.24      1.46     0.38  4569034     0.00     0.00  Sieve__code_begin
  6.86      1.82     0.36  9171515     0.00     0.00  Stream__set_data_140
  6.57      2.17     0.34 12741964     0.00     0.00  fl_merge_block
  6.29      2.50     0.33  4575034     0.00     0.00  Stream__peek_154
  5.81      2.80     0.30 12561656     0.00     0.00  alloc_shr
  5.71      3.10     0.30     3222     0.00     0.00  oldify_mopup
  4.57      3.34     0.24 12561656     0.00     0.00  allocate_block
  4.57      3.58     0.24  9171515     0.00     0.00  modify
  4.38      3.81     0.23  8387342     0.00     0.00  oldify_one
  3.81      4.01     0.20 12561658     0.00     0.00  fl_allocate
  3.81      4.21     0.20  4569034     0.00     0.00  Sieve__filter_56
  3.62      4.40     0.19     6444     0.00     0.00  empty_minor_heap
  3.24      4.57     0.17     3222     0.00     0.00  oldify_local_roots
  2.29      4.69     0.12  4599482     0.00     0.00  Stream__slazy_221
  2.10      4.80     0.11  4597215     0.00     0.00  darken
  1.90      4.90     0.10  4596481     0.00     0.00  Stream__fun_345
  1.52      4.98     0.08  4575034     0.00     0.00  Stream__icons_207
  1.52      5.06     0.08  4575034     0.00     0.00  Stream__junk_165
  1.14      5.12     0.06     1112     0.00     0.00  do_local_roots

[ etc. ]
</pre>

<p>In fact this program spends much of its time in the garbage collector (not surprisingly, since although the solution is elegant, it is far from optimal - a solution using arrays and loops would have been much faster).</p>
<a name="Summary"></a><h2><span>Summary</span></h2>
<p>In summary here are some tips for getting the best performance out of your programs:</p>
<ol><li>Write your program as simply as possible. If it takes too long to run, profile it to find out where it's spending its time and concentrate optimizations on just those areas.</li>
<li>Check for unintentional polymorphism, and add type hints for the compiler.</li>
<li>Closures are slower than simple function calls, but add to maintainability and readability.</li>
<li>As a last resort, rewrite hotspots in your program in C (but first check the assembly language produced by the OCaml compiler to see if you can do better than it).</li>
<li>Performance might depend on external factors (speed of your database queries? speed of the network?). If so then no amount of optimization will help you.</li></ol>
<h3>Further reading</h3>
<p>You can find out more about how OCaml represents different types by reading chapter 18 of the manual (&quot;Interfacing C with OCaml&quot;) and also looking at the <code>mlvalues.h</code> header file.</p>

</div>

<h2>Discussion On This Page</h2>
<h3><span>Java dynamic dispatch</span></h3>
<p><strong>There are some serious mistakes in the last paragraph:</strong></p>
<ul><li>Dynamic method dispatch itself is seldom a performance problem. In languages without multiple inheritance (e.g. Java) this is usually done via one step of pointer indirection. Objects in OCaml are also dynamically dispatched. Since this is the point with polymorphism in an OO setting.</li></ul>
<ul><li>Dynamic method dispatch often hinders a compiler to inline function and this hits the performance.</li></ul>
<ul><li>In Java is a dynamic type check (aka cast) much more expensive than a dynamic method dispatch.</li></ul>

</div>


</body>
