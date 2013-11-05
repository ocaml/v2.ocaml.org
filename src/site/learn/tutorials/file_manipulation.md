<head>
  <title>File manipulation</title>
</head>
<body>

<h1>File manipulation</h1>

<p>This is a guide to basic file manipulation in OCaml using only what the standard library provides.</p>
<p>Official documentation for the modules of interest: <a href="http://caml.inria.fr/pub/docs/manual-ocaml/libref/Pervasives.html" class="external" title="http://caml.inria.fr/pub/docs/manual-ocaml/libref/Pervasives.html">Pervasives</a>, <a href="http://caml.inria.fr/pub/docs/manual-ocaml/libref/Printf.html" class="external" title="http://caml.inria.fr/pub/docs/manual-ocaml/libref/Printf.html">Printf</a>.</p>
<p>The standard library doesn't provide functions that directly read a file into a string or save a string into a file. Such functions can be found in third-party libraries such as <a href="http://ocaml-lib.sourceforge.net/" class="external" title="http://ocaml-lib.sourceforge.net/">Extlib</a>. See  <a href="http://ocaml-lib.sourceforge.net/doc/Std.html" class="external" title="http://ocaml-lib.sourceforge.net/doc/Std.html">Std.input_file and Std.output_file</a>.</p>
<a name="Buffered_channels"></a><h2><span>Buffered channels</span></h2>
<p>The normal way of opening a file in OCaml returns a <strong>channel</strong>. There are two kinds of channels:</p>
<ul><li>channels that write to a file: type <code>out_channel</code></li>
<li>channels that read from a file: type <code>in_channel</code></li></ul>
<h3>Writing</h3>
<p>For writing into a file, you would do this:</p>
<ol><li>Open the file to obtain an <code>out_channel</code></li>
<li>Write stuff to the channel</li>
<li>If you want to force writing to the physical device, you must flush the channel, otherwise writing will not take place immediately.</li>
<li>When you are done, you can close the channel. This flushes the channel automatically.</li></ol>
<p>Commonly used functions: <code>open_out</code>, <code>open_out_bin</code>, <code>flush</code>, <code>close_out</code>, <code>close_out_noerr</code></p>
<p>Standard <code>out_channel</code>s: <code>stdout</code>, <code>stderr</code></p>
<h3>Reading</h3>
<p>For reading data from a file you would do this:</p>
<ol><li>Open the file to obtain an <code>in_channel</code></li>
<li>Read characters from the channel. Reading consumes the channel, so if you read a character, the channel will point to the next character in the file.</li>
<li>When there are no more characters to read, the <code>End_of_file</code> exception is raised. Often, this is where you want to close the channel.</li></ol>
<p>Commonly used functions: <code>open_in</code>, <code>open_in_bin</code>, <code>close_in</code>, <code>close_in_noerr</code></p>
<p>Standard <code>in_channel</code>: <code>stdin</code></p>
<h3>Seeking</h3>
<p>Whenever you write or read something to or from a channel, the current position changes to the next character after what you just wrote or read. Occasionally, you may want to skip to a particular position in the file, or restart reading from the beginning. This is possible for channels that point to regular files, use <code>seek_in</code> or <code>seek_out</code>.</p>
<h3>Gotchas</h3>
<ul><li>Don't forget to flush your <code>out_channel</code>s if you want to actually write something. This is particularly important if you are writing to non-files such as the standard output (<code>stdout</code>) or a socket.</li>
<li>Don't forget to close any unused channel, because operating systems have a limit on the number of files that can be opened simultaneously. You must catch any exception that would occur during the file manipulation, close the corresponding channel, and re-raise the exception.</li>
<li>The <code>Unix</code> module provides access to non-buffered file descriptors among other things. It provides standard file descriptors that have the same name as the corresponding standard channels: <code>stdin</code>, <code>stdout</code> and <code>stderr</code>. Therefore if you do <code>open Unix</code>, you may get type errors. If you want to be sure that you are using the <code>stdout</code> channel and not the <code>stdout</code> file descriptor, you can prepend it with the module name where it comes from: <code>Pervasives.stdout</code>. <em>Note that most things that don't seem to belong to any module actually belong to the <code>Pervasives</code> module, which is automatically opened.</em></li>
<li><code>open_out</code> and <code>open_out_bin</code> truncate the given file if it already exists! Use <code>open_out_gen</code> if you want an alternate behavior.</li></ul>
<h3>Example</h3>
<pre ml:content="ocaml noeval">
open Printf

let file = &quot;example.dat&quot;
let message = &quot;Hello!&quot;

let () =
  (* Write message to file *)
  let oc = open_out file in    (* create or truncate file, return channel *)
  fprintf oc &quot;%s\n&quot; message;   (* write something *)   
  close_out oc;                (* flush and close the channel *)

  (* Read file and display the first line *)
  let ic = open_in file in
  try 
    let line = input_line ic in  (* read line from in_channel and discard \n *)
    print_endline line;          (* write the result to stdout *)
    flush stdout;                (* write on the underlying device now *)
    close_in ic                  (* close the input channel *) 

  with e -&gt;                      (* some unexpected exception occurs *)
    close_in_noerr ic;           (* emergency closing *)
    raise e                      (* exit with error: files are closed but
                                    channels are not flushed *)

  (* normal exit: all channels are flushed and closed *)
</pre>


</div>

</body>
