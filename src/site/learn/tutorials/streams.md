<head>
<title>Streams</title>
</head>
<body>

<h1>Streams</h1>

<h2><a name="Streams"></a>Streams</h2>
<p>Suppose you need to process each line of a text file. One way to do this is to read the file in as a single large string and use something like <code>Str.split</code> to turn it into a list. This works when the file is small, but because the entire file is loaded into memory, it does not scale well when the file is large.</p>
<p>More commonly, the <code>input_line</code> function can be used to read one line at a time from a channel. This typically looks like:</p>
<pre ml:content="ocaml noeval">
let in_channel = open_in &quot;lines.txt&quot; in
try
  while true do
    let line = input_line in_channel in
    (* do something with line *)
  done
with End_of_file -&gt;
  close_in in_channel
</pre>

<p>The above code is efficient with memory, but it can be inconvenient in other ways. Since <code>input_line</code> only works with the <code>in_channel</code> type, it cannot be reused in cases where the text is already in memory. The <code>End_of_file</code> exception can be raised at any point during iteration, and it is the programmer's responsibility to ensure that the file is closed appropriately. In fact, if there is any other exception in the above example, the file will not be closed at all. Altogether, there is a lot going on: channels, I/O, exceptions, and files.</p>
<p>Streams offer an abstraction over one part of this process: reading items from a sequence. They don't assume anything about files or channels, and they replace the <code>End_of_file</code> exception with a more structured approach to dealing with the end of input. Here is a function that builds a stream of lines from an input channel:</p>
<pre ml:content="ocaml">
let line_stream_of_channel channel =
  Stream.from
    (fun _ -&gt;
       try Some (input_line channel) with End_of_file -&gt; None)
</pre>

<p>The &quot;Stream.from&quot; function builds a stream from a callback function. This function is passed the current stream count (starting with 0) as an argument and is expected to return an <code>'a option</code>. If the option has a value (<code>Some x</code>), that value will be the next item in the stream. If it has no value (<code>None</code>), this indicates that the stream is empty and no further reads will be attempted. Since the option is polymorphic, <code>Stream.from</code> can construct streams of any type. These streams have a type of <code>'a Stream.t</code>.</p>
<p>With this simple function, we can now easily construct line streams from any input channel:</p>
<pre ml:content="ocaml">
let in_channel = open_in &quot;_oasis&quot;;;
let lines = line_stream_of_channel in_channel;;
</pre>

<p>This variable <code>lines</code> is a stream of strings, one string per line. We can now begin reading lines from it by passing it to <code>Stream.next</code>:</p>
<pre ml:content="ocaml">
Stream.next lines;;
Stream.next lines;;
Stream.next lines;;
Stream.next lines;;
while true do ignore(Stream.next lines) done;;
</pre>

<p>As you can see, <code>Stream.next</code> either returns the next item in the stream or raises a <code>Stream.Failure</code> exception indicating that the stream is empty. Likewise, with a little help from the <code>Stream.of_list</code> constructor and the <code>Str</code> regular expression module, we could build a stream of lines from a string in memory:</p>
<pre ml:content="ocaml">
#load "str.cma";;
let line_stream_of_string string =
  Stream.of_list (Str.split (Str.regexp &quot;\n&quot;) string)
</pre>

<p>and these streams could be used exactly the same way:</p>
<pre ml:content="ocaml">
let lines = line_stream_of_string &quot;hello\nstream\nworld&quot;;;
Stream.next lines;;
Stream.next lines;;
Stream.next lines;;
Stream.next lines;;
</pre>

<p>Since both cases raise <code>Stream.Failure</code> on an empty stream, there is no need to worry about catching <code>End_of_file</code> in the case of file I/O. This unified interface makes it much easier to write functions that can receive data from multiple sources.</p>
<p>The <code>Stream.iter</code> function automates the common task of performing an operation for each item. With it, we can rewrite the original example as follows:</p>
<pre ml:content="ocaml">
  let in_channel = open_in &quot;_oasis&quot; in
  try
    Stream.iter
      (fun line -&gt;
         (* do something with line *)
         print_endline line)
      (line_stream_of_channel in_channel);
    close_in in_channel
  with e -&gt;
    close_in in_channel;
    raise e
</pre>

<p>Note how much easier it is to handle I/O exceptions properly, since we can deal with them independently from the end-of-file condition. This separation of concerns allows us to decompose this into simpler and more reusable functions:</p>
<pre ml:content="ocaml noeval">
let process_line line =
  print_endline line

let process_lines lines =
  Stream.iter process_line lines

let process_file filename =
  let in_channel = open_in filename in
  try
    process_lines (line_stream_of_channel in_channel);
    close_in in_channel
  with e -&gt;
    close_in in_channel
    raise e

let process_string string =
  process_lines (line_stream_of_string string)
</pre>

<a name="Constructing_streams"></a><h2><span>Constructing streams</span></h2>
<p>In the above examples, we saw two methods for constructing streams:</p>
<ul><li>Stream.from, which builds a stream from a callback function</li>
<li>Stream.of_list, which builds a stream from a list in memory</li></ul>
<p>The <code>Stream</code> module provides a few other stream builders:</p>
<ul><li>Stream.of_string, which builds a character stream from a string</li>
<li>Stream.of_channel, which builds a character stream from a channel</li></ul>
<p><code>Stream.from</code> is the most general, and it can be used to produce streams of any type. It is not limited to I/O and can even produce infinite sequences. Here are a few simple stream builders defined with <code>Stream.from</code>:</p>
<pre ml:content="ocaml">
  (* A stream that is always empty. *)
  let empty_stream () = Stream.from (fun _ -&gt; None);;
  (* A stream that yields the same item repeatedly. *)
  let const_stream k = Stream.from (fun _ -&gt; Some k);;
  (* A stream that yields consecutive integers starting with 'i'. *)
  let count_stream i = Stream.from (fun j -&gt; Some (i + j));;
</pre>

<a name="Deconstructing_streams"></a><h2><span>Deconstructing streams</span></h2>
<p>We already saw the <code>Stream.next</code> function, which retrieves a single item from a stream. There is another way to work with streams that is often preferable: <code>Stream.peek</code> and <code>Stream.junk</code>. When used together, these functions allow you to see what the next item would be. This feature, known as &quot;look ahead&quot;, is very useful when writing parsers. Even if you don't need to look ahead, the peek/junk protocol may be nicer to work with because it uses options instead of exceptions:</p>
<pre ml:content="ocaml">
let lines = line_stream_of_string &quot;hello\nworld&quot;;;
Stream.peek lines;;
Stream.peek lines;;
Stream.junk lines;;
Stream.peek lines;;
Stream.junk lines;;
Stream.peek lines;;
</pre>

<p>As you can see, it is necessary to call <code>Stream.junk</code> to advance to the next item. <code>Stream.peek</code> will always give you either the next item or <code>None</code>, and it will never fail. Likewise, <code>Stream.junk</code> always succeeds (even if the stream is empty).</p>

<a name="A_more_complex__Stream_from__example"></a><h2><span>A more complex &quot;Stream.from&quot; example</span></h2>
<p>Here is a function that converts a line stream into a paragraph stream. As such, it is both a stream consumer and a stream producer.</p>
<pre ml:content="ocaml">
  let paragraphs lines =
    let rec next para_lines i =
      match Stream.peek lines, para_lines with
      | None, [] -&gt; None
      | Some &quot;&quot;, [] -&gt;
          Stream.junk lines;
          next para_lines i
      | Some &quot;&quot;, _ | None, _ -&gt;
          Some (String.concat &quot;\n&quot; (List.rev para_lines))
      | Some line, _ -&gt;
          Stream.junk lines;
          next (line :: para_lines) i in
    Stream.from (next [])
</pre>

<p>This function uses an extra parameter to <code>next</code> (the <code>Stream.from</code> callback) called <code>para_lines</code> in order to collect the lines for each paragraph. Paragraphs are delimited by any number of blank lines.</p>
<p>Each time <code>next</code> is called, a <code>match</code> expression tests two values: the next line in the stream, and the contents of <code>para_lines</code>. Four cases are handled:</p>
<ol><li>If the end of the stream is reached and no lines have been collected, the paragraph stream ends as well.</li>
<li>If the next line is blank and no lines have been collected, the blank is ignored and <code>next</code> is called recursively to keep looking for a non-blank line.</li>
<li>If a blank line or end of stream is reached and lines <strong>have</strong> been collected, the paragraph is returned by concatenating <code>para_lines</code> to a single string.</li>
<li>Finally, if a non-blank line has been reached, the line is collected by recursively calling <code>para_lines</code>.</li></ol>
<p>Happily, we can rely on the OCaml compiler's exhaustiveness checking to ensure that we are handling all possible cases.</p>
<p>With this new tool, we can now work just as easily with paragraphs as we could before with lines:</p>
<pre ml:content="ocaml">
  (* Print each paragraph, followed by a separator. *)
  let lines = line_stream_of_channel in_channel in
  Stream.iter
    (fun para -&gt;
       print_endline para;
       print_endline &quot;--&quot;)
    (paragraphs lines)
</pre>

<p>Functions like <code>paragraphs</code> that produce and consume streams can be composed together in a manner very similar to UNIX pipes and filters.</p>
<a name="Stream_combinators"></a><h2><span>Stream combinators</span></h2>
<p>Just like lists and arrays, common iteration patterns such as <code>map</code>, <code>filter</code>, and <code>fold</code> can be very useful. The <code>Stream</code> module does not provide such functions, but they can be built easily using <code>Stream.from</code>:</p>
<pre ml:content="ocaml">
  let stream_map f stream =
    let rec next i =
      try Some (f (Stream.next stream))
      with Stream.Failure -&gt; None in
    Stream.from next

  let stream_filter p stream =
    let rec next i =
      try
        let value = Stream.next stream in
        if p value then Some value else next i
      with Stream.Failure -&gt; None in
    Stream.from next
  
  let stream_fold f stream init =
    let result = ref init in
    Stream.iter
      (fun x -&gt; result := f x !result)
      stream;
    !result
</pre>

<p>For example, here is a stream of leap years starting with 2000:</p>
<pre ml:content="ocaml">
  let is_leap year =
    year mod 4 = 0 &amp;&amp; (year mod 100 &lt;&gt; 0 || year mod 400 = 0)
  let leap_years = stream_filter is_leap (count_stream 2000)
</pre>

<p>We can use the <code>Stream.npeek</code> function to look ahead by more than one item. In this case, we'll peek at the next 30 items to make sure that the year 2100 is not a leap year (since it's divisible by 100 but not 400!):</p>
<pre ml:content="ocaml">
Stream.npeek 30 leap_years;;
</pre>

<p>Note that we must be careful not to use <code>Stream.iter</code> on an infinite stream like <code>leap_years</code>. This applies to <code>stream_fold</code>, as well as any function that attempts to consume the entire stream.</p>
<pre ml:content="ocaml">
stream_fold (+) (Stream.of_list [1; 2; 3]) 0;;
</pre>
<code>stream_fold (+) (count_stream 0) 0</code> runs forever.


<a name="Other_useful_stream_builders"></a><h2><span>Other useful stream builders</span></h2>
<p>The previously defined <code>const_stream</code> function builds a stream that repeats a single value. It is also useful to build a stream that repeats a sequence of values. The following function does just that:</p>
<pre ml:content="ocaml">
  let cycle items =
    let buf = ref [] in
    let rec next i =
      if !buf = [] then buf := items;
      match !buf with
        | h :: t -&gt; (buf := t; Some h)
        | [] -&gt; None in
    Stream.from next
</pre>

<p>One common task that can benefit from this kind of stream is the generation of alternating background colors for HTML. By using <code>cycle</code> with <code>stream_combine</code>, explained in the next section, an infinite stream of background colors can be combined with a finite stream of data to produce a sequence of HTML blocks:</p>
<pre ml:content="ocaml">
  let stream_combine stream1 stream2 =
    let rec next i =
      try Some (Stream.next stream1, Stream.next stream2)
      with Stream.Failure -> None in
    Stream.from next;;
  Stream.iter print_endline
    (stream_map
       (fun (bg, s) -&gt;
          Printf.sprintf &quot;&lt;div style='background: %s'&gt;%s&lt;/div&gt;&quot; bg s)
       (stream_combine
          (cycle [&quot;#eee&quot;; &quot;#fff&quot;])
          (Stream.of_list [&quot;hello&quot;; &quot;html&quot;; &quot;world&quot;])))
</pre>

<p>Here is a simple <code>range</code> function that produces a sequence of integers:</p>
<pre ml:content="ocaml">
  let range ?(start=0) ?(stop=0) ?(step=1) () =
    let in_range = if step &lt; 0 then (&gt;) else (&lt;) in
    let current = ref start in
    let rec next i =
      if in_range !current stop
      then let result = !current in (current := !current + step;
                                     Some result)
      else None in
    Stream.from next
</pre>

<p>This works just like Python's <code>xrange</code> built-in function, providing an easy way to produce an assortment of lazy integer sequences by specifying combinations of <code>start</code>, <code>stop</code>, or <code>step</code> values:</p>
<pre ml:content="ocaml">
Stream.npeek 10 (range ~start:5 ~stop:10 ());;
Stream.npeek 10 (range ~stop:10 ~step:2 ());;
Stream.npeek 10 (range ~start:10 ~step:(-1) ());;
Stream.npeek 10 (range ~start:10 ~stop:5 ~step:(-1) ());;
</pre>

<a name="Combining_streams"></a><h2><span>Combining streams</span></h2>
<p>There are several ways to combine streams. One is to produce a stream of streams and then concatenate them into a single stream. The following function works just like <code>List.concat</code>, but instead of turning a list of lists into a list, it turns a stream of streams into a stream:</p>
<pre ml:content="ocaml">
  let stream_concat streams =
    let current_stream = ref None in
    let rec next i =
      try
        let stream =
          match !current_stream with
          | Some stream -&gt; stream
          | None -&gt;
             let stream = Stream.next streams in
             current_stream := Some stream;
             stream in
        try Some (Stream.next stream)
        with Stream.Failure -&gt; (current_stream := None; next i)
      with Stream.Failure -&gt; None in
    Stream.from next
</pre>

<p>Here is a sequence of ranges which are themselves derived from a range, concatenated with <code>stream_concat</code> to produce a flattened <code>int Stream.t</code>.</p>
<pre ml:content="ocaml">
  Stream.npeek 10
    (stream_concat
       (stream_map
          (fun i -&gt; range ~stop:i ())
          (range ~stop:5 ())))
</pre>

<p>Another way to combine streams is to iterate through them in a pairwise fashion:</p>
<pre ml:content="ocaml">
  let stream_combine stream1 stream2 =
    let rec next i =
      try Some (Stream.next stream1, Stream.next stream2)
      with Stream.Failure -&gt; None in
    Stream.from next
</pre>

<p>This is useful, for instance, if you have a stream of keys and a stream of corresponding values. Iterating through key value pairs is then as simple as:</p>
<pre ml:content="ocaml noeval">
Stream.iter
  (fun (key, value) -&gt;
     (* do something with 'key' and 'value' *)
     ())
  (stream_combine key_stream value_stream)
</pre>

<p>Since <code>stream_combine</code> stops as soon as either of its input streams runs out, it can be used to combine an infinite stream with a finite one. This provides a neat way to add indexes to a sequence:</p>
<pre ml:content="ocaml">
  let items = [&quot;this&quot;; &quot;is&quot;; &quot;a&quot;; &quot;test&quot;];;
  Stream.iter
    (fun (index, value) -&gt;
       Printf.printf &quot;%d. %s\n%!&quot; index value)
    (stream_combine (count_stream 1) (Stream.of_list items))
</pre>

<a name="Copying_streams"></a><h2><span>Copying streams</span></h2>
<p>Streams are destructive; once you discard an item in a stream, it is no longer available unless you save a copy somewhere. What if you want to use the same stream more than once? One way is to create a &quot;tee&quot;. The following function creates two output streams from one input stream, intelligently queueing unseen values until they have been produced by both streams:</p>
<pre ml:content="ocaml">
  let stream_tee stream =
    let next self other i =
      try
        if Queue.is_empty self
        then
          let value = Stream.next stream in
          Queue.add value other;
          Some value
        else
          Some (Queue.take self)
      with Stream.Failure -&gt; None in
    let q1 = Queue.create () in
    let q2 = Queue.create () in
    (Stream.from (next q1 q2), Stream.from (next q2 q1))
</pre>

<p>Here is an example of a stream tee in action:</p>
<pre ml:content="ocaml">
let letters = Stream.of_list ['a'; 'b'; 'c'; 'd'; 'e'];;
let s1, s2 = stream_tee letters;;
Stream.next s1;;
Stream.next s1;;
Stream.next s2;;
Stream.next s1;;
Stream.next s2;;
Stream.next s2;;
</pre>

<p>Again, since streams are destructive, you probably want to leave the original stream alone or you will lose items from the copied streams:</p>
<pre ml:content="ocaml">
Stream.next letters;;
Stream.next s1;;
Stream.next s2;;
</pre>

<a name="Converting_streams"></a><h2><span>Converting streams</span></h2>
<p>Here are a few functions for converting between streams and lists, arrays, and hash tables. These probably belong in the standard library, but they are simple to define anyhow. Again, beware of infinite streams, which will cause these functions to hang.</p>
<pre ml:content="ocaml">
  (* This one is free. *)
  let stream_of_list = Stream.of_list

  let list_of_stream stream =
    let result = ref [] in
    Stream.iter (fun value -&gt; result := value :: !result) stream;
    List.rev !result
  
  let stream_of_array array =
    Stream.of_list (Array.to_list array)
  
  let array_of_stream stream =
    Array.of_list (list_of_stream stream)
  
  let stream_of_hash hash =
    let result = ref [] in
    Hashtbl.iter
      (fun key value -&gt; result := (key, value) :: !result)
      hash;
    Stream.of_list !result
  
  let hash_of_stream stream =
    let result = Hashtbl.create 0 in
    Stream.iter
      (fun (key, value) -&gt; Hashtbl.replace result key value)
      stream;
    result
</pre>

<p>What if you want to convert arbitary data types to streams? Well, if the data type defines an <code>iter</code> function, and you don't mind using threads, you can use a producer-consumer arrangement to invert control:</p>
<pre ml:content="ocaml">
  #directory "+threads";;
  #load "threads.cma";;
  let elements iter coll =
    let channel = Event.new_channel () in
    let producer () =
      let () =
        iter (fun x -&gt; Event.sync (Event.send channel (Some x))) coll in
      Event.sync (Event.send channel None) in
    let consumer i =
      Event.sync (Event.receive channel) in
    ignore (Thread.create producer ());
    Stream.from consumer
</pre>

<p>Now it is possible to build a stream from an <code>iter</code> function and a corresponding value:</p>
<pre ml:content="ocaml silent">
module StringSet = Set.Make(String);;
</pre><pre ml:content="ocaml">
let set = StringSet.empty;;
let set = StringSet.add &quot;here&quot; set;;
let set = StringSet.add &quot;are&quot; set;;
let set = StringSet.add &quot;some&quot; set;;
let set = StringSet.add &quot;values&quot; set;;
let stream = elements StringSet.iter set;;
Stream.iter print_endline stream;;
</pre>

<p>Some data types, like Hashtbl and Map, provide an <code>iter</code> function that iterates through key-value pairs. Here's a function for those, too:</p>
<pre ml:content="ocaml">
  let items iter coll =
    let channel = Event.new_channel () in
    let producer () =
      let () =
        iter (fun k v -&gt;
                Event.sync (Event.send channel (Some (k, v)))) coll in
      Event.sync (Event.send channel None) in
    let consumer i =
      Event.sync (Event.receive channel) in
    ignore (Thread.create producer ());
    Stream.from consumer
</pre>

<p>If we want just the keys, or just the values, it is simple to transform the output of <code>items</code> using <code>stream_map</code>:</p>
<pre ml:content="ocaml">
let keys iter coll = stream_map (fun (k, v) -&gt; k) (items iter coll)
let values iter coll = stream_map (fun (k, v) -&gt; v) (items iter coll)
</pre>

<p>Keep in mind that these techniques spawn producer threads which carry a few risks: they only terminate when they have finished iterating, and any change to the original data structure while iterating may produce unexpected results.</p>
<a name="Other_built_in_Stream_functions"></a><h2><span>Other built-in Stream functions</span></h2>
<p>There are a few other documented methods in the <code>Stream</code> module:</p>
<ul><li>Stream.empty, which raises <code>Stream.Failure</code> unless a stream is empty</li>
<li>Stream.count, which returns the stream count (number of discarded elements)</li></ul>
<p>In addition, there are a few undocumented functions: <code>iapp</code>, <code>icons</code>, <code>ising</code>, <code>lapp</code>, <code>lcons</code>, <code>lsing</code>, <code>sempty</code>, <code>slazy</code>, and <code>dump</code>. They are visible in the interface with the caveat: &quot;For system use only, not for the casual user&quot;. Some of these functions are used internally by Camlp4 <a href="stream_expressions.html" class="internal" title="Stream Expressions">Stream Expressions</a>, which are based on the <code>Stream</code> module as well. In any case, they are best left alone.</p>

</div>

</body>
