<!-- ((! set title Streams !)) ((! set learn !)) -->

*Table of contents*

## Streams
Suppose you need to process each line of a text file. One way to do this
is to read the file in as a single large string and use something like
`Str.split` to turn it into a list. This works when the file is small,
but because the entire file is loaded into memory, it does not scale
well when the file is large.

More commonly, the `input_line` function can be used to read one line at
a time from a channel. This typically looks like:

```ocaml
let in_channel = open_in "lines.txt" in
try
  while true do
    let line = input_line in_channel in
    (* do something with line *)
  done
with End_of_file ->
  close_in in_channel
```
The above code is efficient with memory, but it can be inconvenient in
other ways. Since `input_line` only works with the `in_channel` type, it
cannot be reused in cases where the text is already in memory. The
`End_of_file` exception can be raised at any point during iteration, and
it is the programmer's responsibility to ensure that the file is closed
appropriately. In fact, if there is any other exception in the above
example, the file will not be closed at all. Altogether, there is a lot
going on: channels, I/O, exceptions, and files.

Streams offer an abstraction over one part of this process: reading
items from a sequence. They don't assume anything about files or
channels, and they replace the `End_of_file` exception with a more
structured approach to dealing with the end of input. Here is a function
that builds a stream of lines from an input channel:

```ocamltop
let line_stream_of_channel channel =
  Stream.from
    (fun _ ->
       try Some (input_line channel) with End_of_file -> None)
```
The "Stream.from" function builds a stream from a callback function.
This function is passed the current stream count (starting with 0) as an
argument and is expected to return an `'a option`. If the option has a
value (`Some x`), that value will be the next item in the stream. If it
has no value (`None`), this indicates that the stream is empty and no
further reads will be attempted. Since the option is polymorphic,
`Stream.from` can construct streams of any type. These streams have a
type of `'a Stream.t`.

With this simple function, we can now easily construct line streams from
any input channel:

```ocamltop
let in_channel = open_in "README.md";;
let lines = line_stream_of_channel in_channel;;
```
This variable `lines` is a stream of strings, one string per line. We
can now begin reading lines from it by passing it to `Stream.next`:

```ocamltop
Stream.next lines;;
Stream.next lines;;
Stream.next lines;;
Stream.next lines;;
while true do ignore(Stream.next lines) done;;
```
As you can see, `Stream.next` either returns the next item in the stream
or raises a `Stream.Failure` exception indicating that the stream is
empty. Likewise, with a little help from the `Stream.of_list`
constructor and the `Str` regular expression module, we could build a
stream of lines from a string in memory:

```ocamltop
#load "str.cma";;
let line_stream_of_string string =
  Stream.of_list (Str.split (Str.regexp "\n") string)
```
and these streams could be used exactly the same way:

```ocamltop
let lines = line_stream_of_string "hello\nstream\nworld";;
Stream.next lines;;
Stream.next lines;;
Stream.next lines;;
Stream.next lines;;
```
Since both cases raise `Stream.Failure` on an empty stream, there is no
need to worry about catching `End_of_file` in the case of file I/O. This
unified interface makes it much easier to write functions that can
receive data from multiple sources.

The `Stream.iter` function automates the common task of performing an
operation for each item. With it, we can rewrite the original example as
follows:

```ocaml
let in_channel = open_in "README.md" in
try
  Stream.iter
    (fun line ->
       (* do something with line *)
       print_endline line)
    (line_stream_of_channel in_channel);
  close_in in_channel
with e ->
  close_in in_channel;
  raise e
```
Note how much easier it is to handle I/O exceptions properly, since we
can deal with them independently from the end-of-file condition. This
separation of concerns allows us to decompose this into simpler and more
reusable functions:

```ocamltop
let process_line line =
  print_endline line

let process_lines lines =
  Stream.iter process_line lines

let process_file filename =
  let in_channel = open_in filename in
  try
    process_lines (line_stream_of_channel in_channel);
    close_in in_channel
  with e ->
    close_in in_channel;
    raise e

let process_string string =
  process_lines (line_stream_of_string string)
```

## Constructing streams
In the above examples, we saw two methods for constructing streams:

* Stream.from, which builds a stream from a callback function
* Stream.of_list, which builds a stream from a list in memory

The `Stream` module provides a few other stream builders:

* Stream.of_string, which builds a character stream from a string
* Stream.of_channel, which builds a character stream from a channel

`Stream.from` is the most general, and it can be used to produce streams
of any type. It is not limited to I/O and can even produce infinite
sequences. Here are a few simple stream builders defined with
`Stream.from`:

```ocamltop
(* A stream that is always empty. *)
let empty_stream () = Stream.from (fun _ -> None);;
(* A stream that yields the same item repeatedly. *)
let const_stream k = Stream.from (fun _ -> Some k);;
(* A stream that yields consecutive integers starting with 'i'. *)
let count_stream i = Stream.from (fun j -> Some (i + j));;
```

## Deconstructing streams
We already saw the `Stream.next` function, which retrieves a single item
from a stream. There is another way to work with streams that is often
preferable: `Stream.peek` and `Stream.junk`. When used together, these
functions allow you to see what the next item would be. This feature,
known as "look ahead", is very useful when writing parsers. Even if you
don't need to look ahead, the peek/junk protocol may be nicer to work
with because it uses options instead of exceptions:

```ocamltop
let lines = line_stream_of_string "hello\nworld";;
Stream.peek lines;;
Stream.peek lines;;
Stream.junk lines;;
Stream.peek lines;;
Stream.junk lines;;
Stream.peek lines;;
```
As you can see, it is necessary to call `Stream.junk` to advance to the
next item. `Stream.peek` will always give you either the next item or
`None`, and it will never fail. Likewise, `Stream.junk` always succeeds
(even if the stream is empty).

## A more complex `Stream.from` example
Here is a function that converts a line stream into a paragraph stream.
As such, it is both a stream consumer and a stream producer.

```ocamltop
let paragraphs lines =
  let rec next para_lines i =
    match Stream.peek lines, para_lines with
    | None, [] -> None
    | Some "", [] ->
        Stream.junk lines;
        next para_lines i
    | Some "", _ | None, _ ->
        Some (String.concat "\n" (List.rev para_lines))
    | Some line, _ ->
        Stream.junk lines;
        next (line :: para_lines) i in
  Stream.from (next [])
```
This function uses an extra parameter to `next` (the `Stream.from`
callback) called `para_lines` in order to collect the lines for each
paragraph. Paragraphs are delimited by any number of blank lines.

Each time `next` is called, a `match` expression tests two values: the
next line in the stream, and the contents of `para_lines`. Four cases
are handled:

1. If the end of the stream is reached and no lines have been
 collected, the paragraph stream ends as well.
1. If the next line is blank and no lines have been collected, the
 blank is ignored and `next` is called recursively to keep looking
 for a non-blank line.
1. If a blank line or end of stream is reached and lines **have** been
 collected, the paragraph is returned by concatenating `para_lines`
 to a single string.
1. Finally, if a non-blank line has been reached, the line is collected
 by recursively calling `para_lines`.

Happily, we can rely on the OCaml compiler's exhaustiveness checking to
ensure that we are handling all possible cases.

With this new tool, we can now work just as easily with paragraphs as we
could before with lines:

```ocaml
(* Print each paragraph, followed by a separator. *)
let lines = line_stream_of_channel in_channel in
Stream.iter
  (fun para ->
     print_endline para;
     print_endline "--")
  (paragraphs lines)
```
Functions like `paragraphs` that produce and consume streams can be
composed together in a manner very similar to UNIX pipes and filters.

## Stream combinators
Just like lists and arrays, common iteration patterns such as `map`,
`filter`, and `fold` can be very useful. The `Stream` module does not
provide such functions, but they can be built easily using
`Stream.from`:

```ocamltop
let stream_map f stream =
  let rec next i =
    try Some (f (Stream.next stream))
    with Stream.Failure -> None in
  Stream.from next

let stream_filter p stream =
  let rec next i =
    try
      let value = Stream.next stream in
      if p value then Some value else next i
    with Stream.Failure -> None in
  Stream.from next

let stream_fold f stream init =
  let result = ref init in
  Stream.iter
    (fun x -> result := f x !result)
    stream;
  !result
```
For example, here is a stream of leap years starting with 2000:

```ocamltop
let is_leap year =
  year mod 4 = 0 && (year mod 100 <> 0 || year mod 400 = 0)
let leap_years = stream_filter is_leap (count_stream 2000)
```
We can use the `Stream.npeek` function to look ahead by more than one
item. In this case, we'll peek at the next 30 items to make sure that
the year 2100 is not a leap year (since it's divisible by 100 but not
400!):

```ocamltop
Stream.npeek 30 leap_years;;
```
Note that we must be careful not to use `Stream.iter` on an infinite
stream like `leap_years`. This applies to `stream_fold`, as well as any
function that attempts to consume the entire stream.

```ocamltop
stream_fold (+) (Stream.of_list [1; 2; 3]) 0;;
```
`stream_fold (+) (count_stream 0) 0` runs forever.

## Other useful stream builders
The previously defined `const_stream` function builds a stream that
repeats a single value. It is also useful to build a stream that repeats
a sequence of values. The following function does just that:

```ocamltop
let cycle items =
  let buf = ref [] in
  let rec next i =
    if !buf = [] then buf := items;
    match !buf with
      | h :: t -> (buf := t; Some h)
      | [] -> None in
  Stream.from next
```
One common task that can benefit from this kind of stream is the
generation of alternating background colors for HTML. By using `cycle`
with `stream_combine`, explained in the next section, an infinite stream
of background colors can be combined with a finite stream of data to
produce a sequence of HTML blocks:

```ocamltop
let stream_combine stream1 stream2 =
  let rec next i =
    try Some (Stream.next stream1, Stream.next stream2)
    with Stream.Failure -> None in
  Stream.from next;;
Stream.iter print_endline
  (stream_map
     (fun (bg, s) ->
        Printf.sprintf "<div style='background: %s'>%s</div>" bg s)
     (stream_combine
        (cycle ["#eee"; "#fff"])
        (Stream.of_list ["hello"; "html"; "world"])))
```
Here is a simple `range` function that produces a sequence of integers:

```ocamltop
let range ?(start=0) ?(stop=0) ?(step=1) () =
  let in_range = if step < 0 then (>) else (<) in
  let current = ref start in
  let rec next i =
    if in_range !current stop
    then let result = !current in (current := !current + step;
                                   Some result)
    else None in
  Stream.from next
```
This works just like Python's `xrange` built-in function, providing an
easy way to produce an assortment of lazy integer sequences by
specifying combinations of `start`, `stop`, or `step` values:

```ocamltop
Stream.npeek 10 (range ~start:5 ~stop:10 ());;
Stream.npeek 10 (range ~stop:10 ~step:2 ());;
Stream.npeek 10 (range ~start:10 ~step:(-1) ());;
Stream.npeek 10 (range ~start:10 ~stop:5 ~step:(-1) ());;
```
## Combining streams
There are several ways to combine streams. One is to produce a stream of
streams and then concatenate them into a single stream. The following
function works just like `List.concat`, but instead of turning a list of
lists into a list, it turns a stream of streams into a stream:

```ocamltop
let stream_concat streams =
  let current_stream = ref None in
  let rec next i =
    try
      let stream =
        match !current_stream with
        | Some stream -> stream
        | None ->
           let stream = Stream.next streams in
           current_stream := Some stream;
           stream in
      try Some (Stream.next stream)
      with Stream.Failure -> (current_stream := None; next i)
    with Stream.Failure -> None in
  Stream.from next
```
Here is a sequence of ranges which are themselves derived from a range,
concatenated with `stream_concat` to produce a flattened `int Stream.t`.

```ocamltop
Stream.npeek 10
  (stream_concat
     (stream_map
        (fun i -> range ~stop:i ())
        (range ~stop:5 ())))
```
Another way to combine streams is to iterate through them in a pairwise
fashion:

```ocamltop
let stream_combine stream1 stream2 =
  let rec next i =
    try Some (Stream.next stream1, Stream.next stream2)
    with Stream.Failure -> None in
  Stream.from next
```
This is useful, for instance, if you have a stream of keys and a stream
of corresponding values. Iterating through key value pairs is then as
simple as:

```ocaml
Stream.iter
  (fun (key, value) ->
     (* do something with 'key' and 'value' *)
     ())
  (stream_combine key_stream value_stream)
```
Since `stream_combine` stops as soon as either of its input streams runs
out, it can be used to combine an infinite stream with a finite one.
This provides a neat way to add indexes to a sequence:

```ocamltop
let items = ["this"; "is"; "a"; "test"];;
Stream.iter
  (fun (index, value) ->
     Printf.printf "%d. %s\n%!" index value)
  (stream_combine (count_stream 1) (Stream.of_list items))
```

## Copying streams
Streams are destructive; once you discard an item in a stream, it is no
longer available unless you save a copy somewhere. What if you want to
use the same stream more than once? One way is to create a "tee". The
following function creates two output streams from one input stream,
intelligently queueing unseen values until they have been produced by
both streams:

```ocamltop
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
    with Stream.Failure -> None in
  let q1 = Queue.create () in
  let q2 = Queue.create () in
  (Stream.from (next q1 q2), Stream.from (next q2 q1))
```
Here is an example of a stream tee in action:

```ocamltop
let letters = Stream.of_list ['a'; 'b'; 'c'; 'd'; 'e'];;
let s1, s2 = stream_tee letters;;
Stream.next s1;;
Stream.next s1;;
Stream.next s2;;
Stream.next s1;;
Stream.next s2;;
Stream.next s2;;
```
Again, since streams are destructive, you probably want to leave the
original stream alone or you will lose items from the copied streams:

```ocamltop
Stream.next letters;;
Stream.next s1;;
Stream.next s2;;
```

## Converting streams
Here are a few functions for converting between streams and lists,
arrays, and hash tables. These probably belong in the standard library,
but they are simple to define anyhow. Again, beware of infinite streams,
which will cause these functions to hang.

```ocamltop
(* This one is free. *)
let stream_of_list = Stream.of_list

let list_of_stream stream =
  let result = ref [] in
  Stream.iter (fun value -> result := value :: !result) stream;
  List.rev !result

let stream_of_array array =
  Stream.of_list (Array.to_list array)

let array_of_stream stream =
  Array.of_list (list_of_stream stream)

let stream_of_hash hash =
  let result = ref [] in
  Hashtbl.iter
    (fun key value -> result := (key, value) :: !result)
    hash;
  Stream.of_list !result

let hash_of_stream stream =
  let result = Hashtbl.create 0 in
  Stream.iter
    (fun (key, value) -> Hashtbl.replace result key value)
    stream;
  result
```
What if you want to convert arbitary data types to streams? Well, if the
data type defines an `iter` function, and you don't mind using threads,
you can use a producer-consumer arrangement to invert control:

```ocamltop
#directory "+threads";;
#load "threads.cma";;
let elements iter coll =
  let channel = Event.new_channel () in
  let producer () =
    let () =
      iter (fun x -> Event.sync (Event.send channel (Some x))) coll in
    Event.sync (Event.send channel None) in
  let consumer i =
    Event.sync (Event.receive channel) in
  ignore (Thread.create producer ());
  Stream.from consumer
```

Now it is possible to build a stream from an `iter` function and a
corresponding value:

```ocamltop
module StringSet = Set.Make(String);;
let set = StringSet.empty;;
let set = StringSet.add "here" set;;
let set = StringSet.add "are" set;;
let set = StringSet.add "some" set;;
let set = StringSet.add "values" set;;
let stream = elements StringSet.iter set;;
Stream.iter print_endline stream;;
```

Some data types, like Hashtbl and Map, provide an `iter` function that
iterates through key-value pairs. Here's a function for those, too:

```ocamltop
let items iter coll =
  let channel = Event.new_channel () in
  let producer () =
    let () =
      iter (fun k v ->
              Event.sync (Event.send channel (Some (k, v)))) coll in
    Event.sync (Event.send channel None) in
  let consumer i =
    Event.sync (Event.receive channel) in
  ignore (Thread.create producer ());
  Stream.from consumer
```
If we want just the keys, or just the values, it is simple to transform
the output of `items` using `stream_map`:

```ocamltop
let keys iter coll = stream_map (fun (k, v) -> k) (items iter coll)
let values iter coll = stream_map (fun (k, v) -> v) (items iter coll)
```
Keep in mind that these techniques spawn producer threads which carry a
few risks: they only terminate when they have finished iterating, and
any change to the original data structure while iterating may produce
unexpected results.

## Other built-in Stream functions
There are a few other documented methods in the `Stream` module:

* Stream.empty, which raises `Stream.Failure` unless a stream is empty
* Stream.count, which returns the stream count (number of discarded
 elements)

In addition, there are a few undocumented functions: `iapp`, `icons`,
`ising`, `lapp`, `lcons`, `lsing`, `sempty`, `slazy`, and `dump`. They
are visible in the interface with the caveat: "For system use only, not
for the casual user". Some of these functions are used internally by
Camlp4 [Stream
Expressions](stream_expressions.html "Stream Expressions"), which are
based on the `Stream` module as well. In any case, they are best left
alone.


