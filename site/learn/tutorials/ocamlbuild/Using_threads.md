<!-- ((! set title Using threads !)) ((! set learn !)) -->

# Using threads
Any file that uses the `Thread`, `Mutex`, `Condition` or `Event` module
must be tagged with `thread` \(note, not `threads`\). Executables must
also link against the `Unix` module. Thus if your code is in `prog.ml`.
Add the following to your `_tags` file.

```
<prog.ml> : thread
<prog.{native,byte}> : use_unix, thread

```
