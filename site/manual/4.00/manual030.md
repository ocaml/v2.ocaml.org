<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual022.html">Batch compilation (ocamlc)</a></li><li><a href="manual023.html">The toplevel system (ocaml)</a></li><li><a href="manual024.html">The runtime system (ocamlrun)</a></li><li><a href="manual025.html">Native-code compilation (ocamlopt)</a></li><li><a href="manual026.html">Lexer and parser generators (ocamllex, ocamlyacc)</a></li><li><a href="manual027.html">Dependency generator (ocamldep)</a></li><li><a href="manual028.html">The browser/editor (ocamlbrowser)</a></li><li><a href="manual029.html">The documentation generator (ocamldoc)</a></li><li class="active"><a href="manual030.html">The debugger (ocamldebug)</a></li><li><a href="manual031.html">Profiling (ocamlprof)</a></li><li><a href="manual032.html">The ocamlbuild compilation manager</a></li><li><a href="manual033.html">Interfacing C with OCaml</a></li></ul>




<h1 class="chapter"><a name="htoc183"><span>Chapter 16</span></a>&nbsp;&nbsp;The debugger (ocamldebug)</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The debugger (ocamldebug)</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#toc123">Compiling for debugging</a>
</li><li><a href="#toc124">Invocation</a>
</li><li><a href="#toc125">Commands</a>
</li><li><a href="#toc126">Executing a program</a>
</li><li><a href="#toc127">Breakpoints</a>
</li><li><a href="#toc128">The call stack</a>
</li><li><a href="#toc129">Examining variable values</a>
</li><li><a href="#toc130">Controlling the debugger</a>
</li><li><a href="#toc131">Miscellaneous commands</a>
</li><li><a href="#toc132">Running the debugger under Emacs</a>
</li></ul></nav></header>
<p> <a name="c:debugger"></a>
</p><p>This chapter describes the OCaml source-level replay debugger
<tt>ocamldebug</tt>.</p><blockquote class="quote"><font color="purple">Unix:</font>&nbsp;&nbsp; The debugger is available on Unix systems that provide
BSD sockets.
</blockquote><blockquote class="quote"><font color="purple">Windows:</font>&nbsp;&nbsp; The debugger is available under the Cygwin port of
OCaml, but not under the native Win32 ports.
</blockquote><h2 class="section"><a name="toc123"></a><a name="htoc184">1</a>&nbsp;&nbsp;Compiling for debugging</h2><p>Before the debugger can be used, the program must be compiled and
linked with the <tt>-g</tt> option: all <tt>.cmo</tt> and <tt>.cma</tt> files that are part
of the program should have been created with <tt>ocamlc -g</tt>, and they
must be linked together with <tt>ocamlc -g</tt>.</p><p>Compiling with <tt>-g</tt> entails no penalty on the running time of
programs: object files and bytecode executable files are bigger and
take longer to produce, but the executable files run at
exactly the same speed as if they had been compiled without <tt>-g</tt>.</p><h2 class="section"><a name="toc124"></a><a name="htoc185">2</a>&nbsp;&nbsp;Invocation</h2><h3 class="subsection"><a name="htoc186">16.2.1</a>&nbsp;&nbsp;Starting the debugger</h3><p>The OCaml debugger is invoked by running the program
<tt>ocamldebug</tt> with the name of the bytecode executable file as first
argument:
</p><pre>        ocamldebug [<i>options</i>] <i>program</i> [<i>arguments</i>]
</pre><p>
The arguments following <i>program</i> are optional, and are passed as
command-line arguments to the program being debugged. (See also the
<tt>set arguments</tt> command.)</p><p>The following command-line options are recognized:
</p><dl class="description"><dt class="dt-description">
<b><tt>-c </tt> <i>count</i></b></dt><dd class="dd-description">
Set the maximum number of simultaneously live checkpoints to <i>count</i>.</dd><dt class="dt-description"><b><tt>-cd </tt> <i>dir</i></b></dt><dd class="dd-description">
Run the debugger program from the working directory <i>dir</i>,
instead of the current directory. (See also the <tt>cd</tt> command.)</dd><dt class="dt-description"><tt><b>-emacs</b></tt></dt><dd class="dd-description">
Tell the debugger it is executed under Emacs. (See
section&nbsp;<a href="#s:inf-debugger">16.10</a> for information on how to run the
debugger under Emacs.)</dd><dt class="dt-description"><b><tt>-I </tt><i>directory</i></b></dt><dd class="dd-description">
Add <i>directory</i> to the list of directories searched for source
files and compiled files. (See also the <tt>directory</tt> command.)</dd><dt class="dt-description"><b><tt>-s </tt><i>socket</i></b></dt><dd class="dd-description">
Use <i>socket</i> for communicating with the debugged program. See the
description of the command <tt>set socket</tt> (section&nbsp;<a href="#s:communication">16.8.6</a>)
for the format of <i>socket</i>.</dd><dt class="dt-description"><tt><b>-version</b></tt></dt><dd class="dd-description">
Print version string and exit.</dd><dt class="dt-description"><tt><b>-vnum</b></tt></dt><dd class="dd-description">
Print short version number and exit.</dd><dt class="dt-description"><b><tt>-help</tt> or <tt>--help</tt></b></dt><dd class="dd-description">
Display a short usage summary and exit.
</dd></dl><h3 class="subsection"><a name="htoc187">16.2.2</a>&nbsp;&nbsp;Exiting the debugger</h3><p>The command <tt>quit</tt> exits the debugger. You can also exit the debugger
by typing an end-of-file character (usually <tt>ctrl-D</tt>).</p><p>Typing an interrupt character (usually <tt>ctrl-C</tt>) will not exit the
debugger, but will terminate the action of any debugger command that is in
progress and return to the debugger command level. </p><h2 class="section"><a name="toc125"></a><a name="htoc188">3</a>&nbsp;&nbsp;Commands</h2><p> <a name="s:debugger-commands"></a></p><p>A debugger command is a single line of input. It starts with a command
name, which is followed by arguments depending on this name. Examples:
</p><pre>        run
        goto 1000
        set arguments arg1 arg2
</pre><p>
A command name can be truncated as long as there is no ambiguity. For
instance, <tt>go 1000</tt> is understood as <tt>goto 1000</tt>, since there are no
other commands whose name starts with <tt>go</tt>. For the most frequently
used commands, ambiguous abbreviations are allowed. For instance, <tt>r</tt>
stands for <tt>run</tt> even though there are others commands starting with
<tt>r</tt>. You can test the validity of an abbreviation using the <tt>help</tt> command.</p><p>If the previous command has been successful, a blank line (typing just
<tt>RET</tt>) will repeat it.</p><h3 class="subsection"><a name="htoc189">16.3.1</a>&nbsp;&nbsp;Getting help</h3><p>The OCaml debugger has a simple on-line help system, which gives
a brief description of each command and variable.</p><dl class="description"><dt class="dt-description">
<tt><b>help</b></tt></dt><dd class="dd-description">
Print the list of commands.</dd><dt class="dt-description"><b><tt>help </tt><i>command</i></b></dt><dd class="dd-description">
Give help about the command <i>command</i>.</dd><dt class="dt-description"><b><tt>help set </tt><i>variable</i>, <tt>help show </tt><i>variable</i></b></dt><dd class="dd-description">
Give help about the variable <i>variable</i>. The list of all debugger
variables can be obtained with <tt>help set</tt>.</dd><dt class="dt-description"><b><tt>help info </tt><i>topic</i></b></dt><dd class="dd-description">
Give help about <i>topic</i>. Use <tt>help info</tt> to get a list of known topics.
</dd></dl><h3 class="subsection"><a name="htoc190">16.3.2</a>&nbsp;&nbsp;Accessing the debugger state</h3><dl class="description"><dt class="dt-description">
<b><tt>set </tt><i>variable value</i></b></dt><dd class="dd-description">
Set the debugger variable <i>variable</i> to the value <i>value</i>.</dd><dt class="dt-description"><b><tt>show </tt><i>variable</i></b></dt><dd class="dd-description">
Print the value of the debugger variable <i>variable</i>.</dd><dt class="dt-description"><b><tt>info </tt><i>subject</i></b></dt><dd class="dd-description">
Give information about the given subject.
For instance, <tt>info breakpoints</tt> will print the list of all breakpoints.
</dd></dl><h2 class="section"><a name="toc126"></a><a name="htoc191">4</a>&nbsp;&nbsp;Executing a program</h2><h3 class="subsection"><a name="htoc192">16.4.1</a>&nbsp;&nbsp;Events</h3><p>Events are “interesting” locations in the source code, corresponding
to the beginning or end of evaluation of “interesting”
sub-expressions. Events are the unit of single-stepping (stepping goes
to the next or previous event encountered in the program execution).
Also, breakpoints can only be set at events. Thus, events play the
role of line numbers in debuggers for conventional languages.</p><p>During program execution, a counter is incremented at each event
encountered. The value of this counter is referred as the <em>current
time</em>. Thanks to reverse execution, it is possible to jump back and
forth to any time of the execution.</p><p>Here is where the debugger events (written §§) are located in
the source code:
</p><ul class="itemize"><li class="li-itemize">
Following a function application:
<pre>(f arg)§§
</pre>
</li><li class="li-itemize">On entrance to a function:
<pre>fun x y z -&gt; §§ ...
</pre>
</li><li class="li-itemize">On each case of a pattern-matching definition (function,
<tt>match</tt>…<tt>with</tt> construct, <tt>try</tt>…<tt>with</tt> construct):
<pre>function pat1 -&gt; §§ expr1
       | ...
       | patN -&gt; §§ exprN
</pre>
</li><li class="li-itemize">Between subexpressions of a sequence:
<pre>expr1; §§ expr2; §§ ...; §§ exprN
</pre>
</li><li class="li-itemize">In the two branches of a conditional expression:
<pre>if cond then §§ expr1 else §§ expr2
</pre>
</li><li class="li-itemize">At the beginning of each iteration of a loop:
<pre>while cond do §§ body done
for i = a to b do §§ body done
</pre>
</li></ul><p>
Exceptions: A function application followed by a function return is replaced
by the compiler by a jump (tail-call optimization). In this case, no
event is put after the function application.
</p><h3 class="subsection"><a name="htoc193">16.4.2</a>&nbsp;&nbsp;Starting the debugged program</h3><p>The debugger starts executing the debugged program only when needed.
This allows setting breapoints or assigning debugger variables before
execution starts. There are several ways to start execution:
</p><dl class="description"><dt class="dt-description">
<tt><b>run</b></tt></dt><dd class="dd-description"> Run the program until a breakpoint is hit, or the program
terminates.
</dd><dt class="dt-description"><tt><b>step 0</b></tt></dt><dd class="dd-description"> Load the program and stop on the first event.
</dd><dt class="dt-description"><b><tt>goto </tt><i>time</i></b></dt><dd class="dd-description"> Load the program and execute it until the
given time. Useful when you already know approximately at what time
the problem appears. Also useful to set breakpoints on function values
that have not been computed at time 0 (see section&nbsp;<a href="#s:breakpoints">16.5</a>).
</dd></dl><p>The execution of a program is affected by certain information it
receives when the debugger starts it, such as the command-line
arguments to the program and its working directory. The debugger
provides commands to specify this information (<tt>set arguments</tt> and <tt>cd</tt>).
These commands must be used before program execution starts. If you try
to change the arguments or the working directory after starting your
program, the debugger will kill the program (after asking for confirmation).</p><h3 class="subsection"><a name="htoc194">16.4.3</a>&nbsp;&nbsp;Running the program</h3><p>The following commands execute the program forward or backward,
starting at the current time. The execution will stop either when
specified by the command or when a breakpoint is encountered.</p><dl class="description"><dt class="dt-description">
<tt><b>run</b></tt></dt><dd class="dd-description"> Execute the program forward from current time. Stops at
next breakpoint or when the program terminates.
</dd><dt class="dt-description"><tt><b>reverse</b></tt></dt><dd class="dd-description"> Execute the program backward from current time.
Mostly useful to go to the last breakpoint encountered before the
current time.
</dd><dt class="dt-description"><b><tt>step </tt>[<i>count</i>]</b></dt><dd class="dd-description"> Run the program and stop at the next event. With
an argument, do it <i>count</i> times.
</dd><dt class="dt-description"><b><tt>backstep </tt>[<i>count</i>]</b></dt><dd class="dd-description"> Run the program backward and stop at
the previous event. With an argument, do it <i>count</i> times.
</dd><dt class="dt-description"><b><tt>next </tt>[<i>count</i>]</b></dt><dd class="dd-description"> Run the program and stop at the next
event, skipping over function calls. With an argument, do it
<i>count</i> times.
</dd><dt class="dt-description"><b><tt>previous </tt>[<i>count</i>]</b></dt><dd class="dd-description"> Run the program backward and stop at
the previous event, skipping over function calls. With an argument, do
it <i>count</i> times.
</dd><dt class="dt-description"><tt><b>finish</b></tt></dt><dd class="dd-description"> Run the program until the current function returns.
</dd><dt class="dt-description"><tt><b>start</b></tt></dt><dd class="dd-description"> Run the program backward and stop at the first event
before the current function invocation.
</dd></dl><h3 class="subsection"><a name="htoc195">16.4.4</a>&nbsp;&nbsp;Time travel</h3><p>You can jump directly to a given time, without stopping on
breakpoints, using the <tt>goto</tt> command.</p><p>As you move through the program, the debugger maintains an history of
the successive times you stop at. The <tt>last</tt> command can be used to
revisit these times: each <tt>last</tt> command moves one step back through
the history. That is useful mainly to undo commands such as <tt>step</tt>
and <tt>next</tt>.</p><dl class="description"><dt class="dt-description">
<b><tt>goto </tt><i>time</i></b></dt><dd class="dd-description">
Jump to the given time.
</dd><dt class="dt-description"><b><tt>last </tt>[<i>count</i>]</b></dt><dd class="dd-description">
Go back to the latest time recorded in the execution history. With an
argument, do it <i>count</i> times.
</dd><dt class="dt-description"><b><tt>set history </tt><i>size</i></b></dt><dd class="dd-description">
Set the size of the execution history.
</dd></dl><h3 class="subsection"><a name="htoc196">16.4.5</a>&nbsp;&nbsp;Killing the program</h3><dl class="description"><dt class="dt-description">
<tt><b>kill</b></tt></dt><dd class="dd-description"> Kill the program being executed. This command is mainly
useful if you wish to recompile the program without leaving the debugger.
</dd></dl><h2 class="section"><a name="toc127"></a><a name="htoc197">5</a>&nbsp;&nbsp;Breakpoints</h2><p> <a name="s:breakpoints"></a></p><p>A breakpoint causes the program to stop whenever a certain point in
the program is reached. It can be set in several ways using the
<tt>break</tt> command. Breakpoints are assigned numbers when set, for
further reference. The most comfortable way to set breakpoints is
through the Emacs interface (see section&nbsp;<a href="#s:inf-debugger">16.10</a>).</p><dl class="description"><dt class="dt-description">
<tt><b>break</b></tt></dt><dd class="dd-description">
Set a breakpoint at the current position in the program execution. The
current position must be on an event (i.e., neither at the beginning,
nor at the end of the program).</dd><dt class="dt-description"><b><tt>break </tt><i>function</i></b></dt><dd class="dd-description">
Set a breakpoint at the beginning of <i>function</i>. This works only
when the functional value of the identifier <i>function</i> has been
computed and assigned to the identifier. Hence this command cannot be
used at the very beginning of the program execution, when all
identifiers are still undefined; use <tt>goto</tt> <i>time</i> to advance
execution until the functional value is available.</dd><dt class="dt-description"><b><tt>break @</tt> [<i>module</i>] <i>line</i></b></dt><dd class="dd-description">
Set a breakpoint in module <i>module</i> (or in the current module if
<i>module</i> is not given), at the first event of line <i>line</i>.</dd><dt class="dt-description"><b><tt>break @</tt> [<i>module</i>] <i>line column</i></b></dt><dd class="dd-description">
Set a breakpoint in module <i>module</i> (or in the current module if
<i>module</i> is not given), at the event closest to line <i>line</i>,
column <i>column</i>.</dd><dt class="dt-description"><b><tt>break @</tt> [<i>module</i>] <tt>#</tt> <i>character</i></b></dt><dd class="dd-description">
Set a breakpoint in module <i>module</i> at the event closest to
character number <i>character</i>.</dd><dt class="dt-description"><b><tt>break </tt><i>address</i></b></dt><dd class="dd-description">
Set a breakpoint at the code address <i>address</i>.</dd><dt class="dt-description"><b><tt>delete </tt>[<i>breakpoint-numbers</i>]</b></dt><dd class="dd-description">
Delete the specified breakpoints. Without argument, all breakpoints
are deleted (after asking for confirmation).</dd><dt class="dt-description"><tt><b>info breakpoints</b></tt></dt><dd class="dd-description"> Print the list of all breakpoints.
</dd></dl><h2 class="section"><a name="toc128"></a><a name="htoc198">6</a>&nbsp;&nbsp;The call stack</h2><p>Each time the program performs a function application, it saves the
location of the application (the return address) in a block of data
called a stack frame. The frame also contains the local variables of
the caller function. All the frames are allocated in a region of
memory called the call stack. The command <tt>backtrace</tt> (or <tt>bt</tt>)
displays parts of the call stack.</p><p>At any time, one of the stack frames is “selected” by the debugger; several
debugger commands refer implicitly to the selected frame. In particular,
whenever you ask the debugger for the value of a local variable, the
value is found in the selected frame. The commands <tt>frame</tt>, <tt>up</tt> and <tt>down</tt>
select whichever frame you are interested in.</p><p>When the program stops, the debugger automatically selects the
currently executing frame and describes it briefly as the <tt>frame</tt>
command does.</p><dl class="description"><dt class="dt-description">
<tt><b>frame</b></tt></dt><dd class="dd-description">
Describe the currently selected stack frame.</dd><dt class="dt-description"><b><tt>frame</tt> <i>frame-number</i></b></dt><dd class="dd-description">
Select a stack frame by number and describe it. The frame currently
executing when the program stopped has number 0; its caller has number
1; and so on up the call stack.</dd><dt class="dt-description"><b><tt>backtrace </tt>[<i>count</i>], <tt>bt </tt>[<i>count</i>]</b></dt><dd class="dd-description">
Print the call stack. This is useful to see which sequence of function
calls led to the currently executing frame. With a positive argument,
print only the innermost <i>count</i> frames.
With a negative argument, print only the outermost -<i>count</i> frames.</dd><dt class="dt-description"><b><tt>up</tt> [<i>count</i>]</b></dt><dd class="dd-description">
Select and display the stack frame just “above” the selected frame,
that is, the frame that called the selected frame. An argument says how
many frames to go up.</dd><dt class="dt-description"><b><tt>down </tt>[<i>count</i>]</b></dt><dd class="dd-description">
Select and display the stack frame just “below” the selected frame,
that is, the frame that was called by the selected frame. An argument
says how many frames to go down.
</dd></dl><h2 class="section"><a name="toc129"></a><a name="htoc199">7</a>&nbsp;&nbsp;Examining variable values</h2><p>The debugger can print the current value of simple expressions. The
expressions can involve program variables: all the identifiers that
are in scope at the selected program point can be accessed.</p><p>Expressions that can be printed are a subset of OCaml
expressions, as described by the following grammar:
</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="simple-expr" class="syntax"><font color="maroon">simple-expr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;{&nbsp;<font color="maroon"><i>capitalized-ident</i></font>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;}&nbsp;&nbsp;<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>*</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>$</tt></font>&nbsp;<font color="maroon"><i>integer</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#simple-expr" class="syntax"><font color="maroon">simple-expr</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;&nbsp;<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#simple-expr" class="syntax"><font color="maroon">simple-expr</font></a></i>&nbsp;<font color="blue"><tt>.(</tt></font>&nbsp;&nbsp;<font color="maroon"><i>integer</i></font>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#simple-expr" class="syntax"><font color="maroon">simple-expr</font></a></i>&nbsp;<font color="blue"><tt>.[</tt></font>&nbsp;&nbsp;<font color="maroon"><i>integer</i></font>&nbsp;<font color="blue"><tt>]</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>!</tt></font>&nbsp;<i><a href="#simple-expr" class="syntax"><font color="maroon">simple-expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#simple-expr" class="syntax"><font color="maroon">simple-expr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font></td></tr>
</tbody></table></td></tr>
</tbody></table><p>
The first two cases refer to a value identifier, either unqualified or
qualified by the path to the structure that define it.
<tt>*</tt> refers to the result just computed (typically, the value of a
function application), and is valid only if the selected event is an
“after” event (typically, a function application).
<font color="blue"><tt>$</tt></font> <font color="maroon"><i>integer</i></font> refer to a previously printed value. The remaining four
forms select part of an expression: respectively, a record field, an
array element, a string element, and the current contents of a
reference.</p><dl class="description"><dt class="dt-description">
<b><tt>print </tt><i>variables</i></b></dt><dd class="dd-description">
Print the values of the given variables. <tt>print</tt> can be abbreviated as
<tt>p</tt>.
</dd><dt class="dt-description"><b><tt>display </tt><i>variables</i></b></dt><dd class="dd-description">
Same as <tt>print</tt>, but limit the depth of printing to 1. Useful to
browse large data structures without printing them in full.
<tt>display</tt> can be abbreviated as <tt>d</tt>.
</dd></dl><p>When printing a complex expression, a name of the form <tt>$</tt><i>integer</i>
is automatically assigned to its value. Such names are also assigned
to parts of the value that cannot be printed because the maximal
printing depth is exceeded. Named values can be printed later on
with the commands <tt>p $</tt><i>integer</i> or <tt>d $</tt><i>integer</i>.
Named values are valid only as long as the program is stopped. They
are forgotten as soon as the program resumes execution.</p><dl class="description"><dt class="dt-description">
<b><tt>set print_depth</tt> <i>d</i></b></dt><dd class="dd-description">
Limit the printing of values to a maximal depth of <i>d</i>. 
</dd><dt class="dt-description"><b><tt>set print_length</tt> <i>l</i></b></dt><dd class="dd-description">
Limit the printing of values to at most <i>l</i> nodes printed.
</dd></dl><h2 class="section"><a name="toc130"></a><a name="htoc200">8</a>&nbsp;&nbsp;Controlling the debugger</h2><h3 class="subsection"><a name="htoc201">16.8.1</a>&nbsp;&nbsp;Setting the program name and arguments</h3><dl class="description"><dt class="dt-description">
<b><tt>set program</tt> <i>file</i></b></dt><dd class="dd-description">
Set the program name to <i>file</i>.
</dd><dt class="dt-description"><b><tt>set arguments</tt> <i>arguments</i></b></dt><dd class="dd-description">
Give <i>arguments</i> as command-line arguments for the program.
</dd></dl><p>A shell is used to pass the arguments to the debugged program. You can
therefore use wildcards, shell variables, and file redirections inside
the arguments. To debug programs that read from standard input, it is
recommended to redirect their input from a file (using
<tt>set arguments &lt; input-file</tt>), otherwise input to the program and
input to the debugger are not properly separated, and inputs are not
properly replayed when running the program backwards.</p><h3 class="subsection"><a name="htoc202">16.8.2</a>&nbsp;&nbsp;How programs are loaded</h3><p>The <tt>loadingmode</tt> variable controls how the program is executed.</p><dl class="description"><dt class="dt-description">
<tt><b>set loadingmode direct</b></tt></dt><dd class="dd-description">
The program is run directly by the debugger. This is the default mode.
</dd><dt class="dt-description"><tt><b>set loadingmode runtime</b></tt></dt><dd class="dd-description">
The debugger execute the OCaml runtime <tt>ocamlrun</tt> on the program.
Rarely useful; moreover it prevents the debugging of programs compiled
in “custom runtime” mode.
</dd><dt class="dt-description"><tt><b>set loadingmode manual</b></tt></dt><dd class="dd-description">
The user starts manually the program, when asked by the debugger.
Allows remote debugging (see section&nbsp;<a href="#s:communication">16.8.6</a>).
</dd></dl><h3 class="subsection"><a name="htoc203">16.8.3</a>&nbsp;&nbsp;Search path for files</h3><p>The debugger searches for source files and compiled interface files in
a list of directories, the search path. The search path initially
contains the current directory <tt>.</tt> and the standard library directory.
The <tt>directory</tt> command adds directories to the path.</p><p>Whenever the search path is modified, the debugger will clear any
information it may have cached about the files.</p><dl class="description"><dt class="dt-description">
<b><tt>directory</tt> <i>directorynames</i></b></dt><dd class="dd-description">
Add the given directories to the search path. These directories are
added at the front, and will therefore be searched first.</dd><dt class="dt-description"><b><tt>directory</tt> <i>directorynames</i> <tt>for</tt> <i>modulename</i></b></dt><dd class="dd-description">
Same as <tt>directory</tt> <i>directorynames</i>, but the given directories will be
searched only when looking for the source file of a module that has 
been packed into <i>modulename</i>.</dd><dt class="dt-description"><tt><b>directory</b></tt></dt><dd class="dd-description">
Reset the search path. This requires confirmation.
</dd></dl><h3 class="subsection"><a name="htoc204">16.8.4</a>&nbsp;&nbsp;Working directory</h3><p>Each time a program is started in the debugger, it inherits its working
directory from the current working directory of the debugger. This
working directory is initially whatever it inherited from its parent
process (typically the shell), but you can specify a new working
directory in the debugger with the <tt>cd</tt> command or the <tt>-cd</tt>
command-line option.</p><dl class="description"><dt class="dt-description">
<b><tt>cd</tt> <i>directory</i></b></dt><dd class="dd-description">
Set the working directory for <tt>ocamldebug</tt> to <i>directory</i>.</dd><dt class="dt-description"><tt><b>pwd</b></tt></dt><dd class="dd-description">
Print the working directory for <tt>ocamldebug</tt>.
</dd></dl><h3 class="subsection"><a name="htoc205">16.8.5</a>&nbsp;&nbsp;Turning reverse execution on and off</h3><p>In some cases, you may want to turn reverse execution off. This speeds
up the program execution, and is also sometimes useful for interactive
programs.</p><p>Normally, the debugger takes checkpoints of the program state from
time to time. That is, it makes a copy of the current state of the
program (using the Unix system call <tt>fork</tt>). If the variable
<i>checkpoints</i> is set to <tt>off</tt>, the debugger will not take any
checkpoints.</p><dl class="description"><dt class="dt-description">
<b><tt>set checkpoints</tt> <i>on/off</i></b></dt><dd class="dd-description">
Select whether the debugger makes checkpoints or not.
</dd></dl><h3 class="subsection"><a name="htoc206">16.8.6</a>&nbsp;&nbsp;Communication between the debugger and the program</h3><p>
<a name="s:communication"></a></p><p>The debugger communicate with the program being debugged through a
Unix socket. You may need to change the socket name, for example if
you need to run the debugger on a machine and your program on another.</p><dl class="description"><dt class="dt-description">
<b><tt>set socket</tt> <i>socket</i></b></dt><dd class="dd-description">
Use <i>socket</i> for communication with the program. <i>socket</i> can be
either a file name, or an Internet port specification
<i>host</i>:<i>port</i>, where <i>host</i> is a host name or an Internet
address in dot notation, and <i>port</i> is a port number on the host.
</dd></dl><p>On the debugged program side, the socket name is passed through the
<tt>CAML_DEBUG_SOCKET</tt> environment variable.</p><h3 class="subsection"><a name="htoc207">16.8.7</a>&nbsp;&nbsp;Fine-tuning the debugger</h3><p> <a name="s:fine-tuning"></a></p><p>Several variables enables to fine-tune the debugger. Reasonable
defaults are provided, and you should normally not have to change them.</p><dl class="description"><dt class="dt-description">
<b><tt>set processcount</tt> <i>count</i></b></dt><dd class="dd-description">
Set the maximum number of checkpoints to <i>count</i>. More checkpoints
facilitate going far back in time, but use more memory and create more
Unix processes.
</dd></dl><p>As checkpointing is quite expensive, it must not be done too often. On
the other hand, backward execution is faster when checkpoints are
taken more often. In particular, backward single-stepping is more
responsive when many checkpoints have been taken just before the
current time. To fine-tune the checkpointing strategy, the debugger
does not take checkpoints at the same frequency for long displacements
(e.g. <tt>run</tt>) and small ones (e.g. <tt>step</tt>). The two variables <tt>bigstep</tt>
and <tt>smallstep</tt> contain the number of events between two checkpoints
in each case.</p><dl class="description"><dt class="dt-description">
<b><tt>set bigstep</tt> <i>count</i></b></dt><dd class="dd-description">
Set the number of events between two checkpoints for long displacements.
</dd><dt class="dt-description"><b><tt>set smallstep</tt> <i>count</i></b></dt><dd class="dd-description">
Set the number of events between two checkpoints for small
displacements.
</dd></dl><p>The following commands display information on checkpoints and events:</p><dl class="description"><dt class="dt-description">
<tt><b>info checkpoints</b></tt></dt><dd class="dd-description">
Print a list of checkpoints.
</dd><dt class="dt-description"><b><tt>info events</tt> [<i>module</i>]</b></dt><dd class="dd-description">
Print the list of events in the given module (the current module, by default).
</dd></dl><h3 class="subsection"><a name="htoc208">16.8.8</a>&nbsp;&nbsp;User-defined printers</h3><p>Just as in the toplevel system (section&nbsp;<a href="manual023.html#s:toplevel-directives">9.2</a>),
the user can register functions for printing values of certain types.
For technical reasons, the debugger cannot call printing functions
that reside in the program being debugged. The code for the printing
functions must therefore be loaded explicitly in the debugger.</p><dl class="description"><dt class="dt-description">
<b><tt>load_printer "</tt><i>file-name</i><tt>"</tt></b></dt><dd class="dd-description">
Load in the debugger the indicated <tt>.cmo</tt> or <tt>.cma</tt> object file. The
file is loaded in an environment consisting only of the OCaml
standard library plus the definitions provided by object files
previously loaded using <tt>load_printer</tt>. If this file depends on other
object files not yet loaded, the debugger automatically loads them if
it is able to find them in the search path. The loaded file does not
have direct access to the modules of the program being debugged.</dd><dt class="dt-description"><b><tt>install_printer </tt><i>printer-name</i></b></dt><dd class="dd-description">
Register the function named <i>printer-name</i> (a
value path) as a printer for objects whose types match the argument
type of the function. That is, the debugger will call
<i>printer-name</i> when it has such an object to print.
The printing function <i>printer-name</i> must use the <tt>Format</tt> library
module to produce its output, otherwise its output will not be
correctly located in the values printed by the toplevel loop.<p>The value path <i>printer-name</i> must refer to one of the functions
defined by the object files loaded using <tt>load_printer</tt>. It cannot
reference the functions of the program being debugged.</p></dd><dt class="dt-description"><b><tt>remove_printer </tt><i>printer-name</i></b></dt><dd class="dd-description">
Remove the named function from the table of value printers.
</dd></dl><h2 class="section"><a name="toc131"></a><a name="htoc209">9</a>&nbsp;&nbsp;Miscellaneous commands</h2><dl class="description"><dt class="dt-description">
<b><tt>list</tt> [<i>module</i>] [<i>beginning</i>] [<i>end</i>]</b></dt><dd class="dd-description">
List the source of module <i>module</i>, from line number
<i>beginning</i> to line number <i>end</i>. By default, 20 lines of the
current module are displayed, starting 10 lines before the current
position.
</dd><dt class="dt-description"><b><tt>source</tt> <i>filename</i></b></dt><dd class="dd-description">
Read debugger commands from the script <i>filename</i>.
</dd></dl><h2 class="section"><a name="toc132"></a><a name="htoc210">10</a>&nbsp;&nbsp;Running the debugger under Emacs</h2><p> <a name="s:inf-debugger"></a></p><p>The most user-friendly way to use the debugger is to run it under Emacs.
See the file <tt>emacs/README</tt> in the distribution for information on how
to load the Emacs Lisp files for OCaml support.</p><p>The OCaml debugger is started under Emacs by the command <tt>M-x camldebug</tt>, with argument the name of the executable file
<i>progname</i> to debug. Communication with the debugger takes place
in an Emacs buffer named <tt>*camldebug-</tt><i>progname</i><tt>*</tt>. The editing
and history facilities of Shell mode are available for interacting
with the debugger.</p><p>In addition, Emacs displays the source files containing the current
event (the current position in the program execution) and highlights
the location of the event. This display is updated synchronously with
the debugger action.</p><p>The following bindings for the most common debugger commands are
available in the <tt>*camldebug-</tt><i>progname</i><tt>*</tt> buffer:</p><dl class="description"><dt class="dt-description">
<tt><b>C-c C-s</b></tt></dt><dd class="dd-description"> (command <tt>step</tt>): execute the program one step forward.
</dd><dt class="dt-description"><tt><b>C-c C-k</b></tt></dt><dd class="dd-description"> (command <tt>backstep</tt>): execute the program one step backward.
</dd><dt class="dt-description"><tt><b>C-c C-n</b></tt></dt><dd class="dd-description"> (command <tt>next</tt>): execute the program one step
forward, skipping over function calls.
</dd><dt class="dt-description"><b>Middle mouse button</b></dt><dd class="dd-description"> (command <tt>display</tt>): display named value.
<tt>$</tt><i>n</i> under mouse cursor (support incremental browsing of large
data structures).
</dd><dt class="dt-description"><tt><b>C-c C-p</b></tt></dt><dd class="dd-description"> (command <tt>print</tt>): print value of identifier at point.
</dd><dt class="dt-description"><tt><b>C-c C-d</b></tt></dt><dd class="dd-description"> (command <tt>display</tt>): display value of identifier at point.
</dd><dt class="dt-description"><tt><b>C-c C-r</b></tt></dt><dd class="dd-description"> (command <tt>run</tt>): execute the program forward to next
breakpoint.
</dd><dt class="dt-description"><tt><b>C-c C-v</b></tt></dt><dd class="dd-description"> (command <tt>reverse</tt>): execute the program backward to
latest breakpoint.
</dd><dt class="dt-description"><tt><b>C-c C-l</b></tt></dt><dd class="dd-description"> (command <tt>last</tt>): go back one step in the command history.
</dd><dt class="dt-description"><tt><b>C-c C-t</b></tt></dt><dd class="dd-description"> (command <tt>backtrace</tt>): display backtrace of function calls.
</dd><dt class="dt-description"><tt><b>C-c C-f</b></tt></dt><dd class="dd-description"> (command <tt>finish</tt>): run forward till the current
function returns.
</dd><dt class="dt-description"><tt><b>C-c &lt;</b></tt></dt><dd class="dd-description"> (command <tt>up</tt>): select the stack frame below the
current frame.
</dd><dt class="dt-description"><tt><b>C-c &gt;</b></tt></dt><dd class="dd-description"> (command <tt>down</tt>): select the stack frame above the
current frame.
</dd></dl><p>In all buffers in OCaml editing mode, the following debugger commands
are also available:</p><dl class="description"><dt class="dt-description">
<tt><b>C-x C-a C-b</b></tt></dt><dd class="dd-description"> (command <tt>break</tt>): set a breakpoint at event closest
to point
</dd><dt class="dt-description"><tt><b>C-x C-a C-p</b></tt></dt><dd class="dd-description"> (command <tt>print</tt>): print value of identifier at point
</dd><dt class="dt-description"><tt><b>C-x C-a C-d</b></tt></dt><dd class="dd-description"> (command <tt>display</tt>): display value of identifier at point
</dd></dl><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>