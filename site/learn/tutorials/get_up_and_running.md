<!-- ((! set title So you're learning OCaml, a one stop shop tutorial !)) 
((! set learn !)) ((! set center !)) -->

This tutorial originally appeared
[here](http://hyegar.com/2015/10/20/so-youre-learning-ocaml/) and is
slightly modified in this form. It is intended to get you up and
running quickly with OCaml.

Crash course on the OCaml ecosystem
============================================

These are some key notes that you should know.

1. `opam` is the package manager for OCaml. It is very advanced and
    supports many features. The most basic of which is
    
    ```shell
    $ opam install <some_package>
    ```
    
    For people on `OS X`, you can get it on `brew` and all the `Linux`
    distros should have `opam`.
    
    For Windows people, [this](https://www.typerex.org/ocpwin.html) seems
    to be a decent option or you could get a VM. Do *note* that opam
    doesn't work on this platform and for a beginner you might ending up
    wasting a lot of time with environment issues or libraries that assume
    Unix.

2. Once you have `opam` installed, you probably want to do:
   
    ```shell
    $ opam switch {{! get LATEST_OCAML_VERSION !}}
    ```
 
    This will install the latest version of the compiler. When you did
    `opam switch` you can see all the other available compilers as
    well. You can even switch to a beta compiler like so:
 
    ```shell
    opam switch 4.03.0+beta1
    ```

3. `ocamlfind` is a program that predates `opam` and wraps the
standard `OCaml` compilers: `ocamlc` and `ocamlopt`. The former is a
byte code compiler and the latter creates native code.

4. `ocamlbuild` is a tool that helps build `OCaml` programs, many
people have strong opinions on it. You can find the manual for it
[here](https://github.com/gasche/manual-ocamlbuild). It seems that
people are starting to invest effort into it again.

5. `oasis` is a tool that helps abstract usage of 3, 4. I resisted it
for a while and wrote Makefiles instead, don't do that, just use
oasis. The oasis flow basically goes like this: (Be aware that oasis
is really finicky and its error messages are useless), see the oasis
minitutorial at the end of this post. 

6. `merlin` is an OCaml program that is simply amazing - it drives code
    completion for plugins available in `emacs` and `vim`. Once you have
    merlin installed with
    
    ```shell
    $ opam install merlin
    ```
    then you can add a `.merlin` file to your project so that `merlin`
    knows what packages to code complete for, a sample `.merlin` file
    looks like this:
    
    ```text
    B _build/src
    S src
    PKG cmdliner lwt
    FLG -w +a-4-40..42-44-45-48
    ```
    Notice how I put the `B _build/src` That sort of assumes you're using
    `_oasis` and you made the a `src` directory. I also provided you with
    some nice compiler flags for extra warnings.
    
    You'll need to add some code to vim or emacs to truly get the most out
    of `merlin`, you can even get `jedi` style docstring popups like so:
    
    ![popup](http://hyegar.com/images/caml_docstring.png)
    
    The elisp that I use for my `init.el` is listed after the `oasis`
    tutorial at the end of this post.

7. Although there are no full blown IDEs for OCaml, there are some options to expand your editor with robust tools for things like [syntax highlighting, autocompletion](https://github.com/ocaml/merlin) and [indentation](https://github.com/OCamlPro/ocp-indent):

* If you use Emacs or Vim, you may want to consider installing
  [user-setup](https://github.com/OCamlPro/opam-user-setup). It will
  configure everything you need for you.
* VSCode has the [reasonml
  extension](https://github.com/reasonml-editor/vscode-reasonml). It
  supports both OCaml and [Reason](https://reasonml.github.io/) (an
  alternative syntax inspired by Javascript created and maintained by
  Facebook).  Provides syntax highlighting, autocompletion,
  indentation, navigation, static analysis and more.  Uses most (if
  not all) of the modules already integrated into the Emacs/Vim
  ecosystem.
* There are [two recommended
  ways](https://github.com/ocaml/merlin/wiki/atom-from-scratch) to
  configure OCaml support in Atom using Merlin.
* Sublime Text has a similar
  [plugin](https://github.com/Cynddl/sublime-text-merlin).

8. `utop` is an enhanced REPL, it is better than the plain `ocaml`
REPL. Install it with `opam install utop`

# Library situation

OCaml does have a standard library but it is deliberately minimal. It was only created
to serve the needs of the compiler programmers, ie its not like
Python's standard library which has everything under the sun + the
moon. There are a few standard library replacements, one is called
`Core` and its provided by Jane Street. Its the library used in the
**Real World OCaml** book/website. Another standard library
replacement is called `Batteries`, this is more "community"
supported. There is a more recent contender called `Containers`. For a
categorized list of contemporary and well liked/must have libraries,
checkout the [awesome-ocaml](https://github.com/rizo/awesome-ocaml)
repository.

# Speaking of Libraries...

This is "functional programming," so many of the real world libraries
you'll encounter will have Monadic interfaces, like `lwt` or Core's
`async`, both are asynchronous threading libraries, use Monads and
that wacky `>>=` function. But you really shouldn't fret about what a
Monad is or represents, just follow the type signature and you'll be
fine. For a more detailed treatment of Monads in OCaml and a code
example to talk to the `Stripe` API, see
[this](http://hyegar.com/2015/10/12/monads-you-can-understand/).

## Doing simple tasks (shameless plug)

I try using OCaml for literally everything and that includes going
to hackathons, to make this less painful I wrote a library called
`Podge` which helps with simple stuff. I don't claim its a standard
library replacement, just a library for getting stuff done. These two
code samples assume the file is named `code.ml` and can be run with
`utop code.ml`

First install with opam: 

```shell
$ opam install podge
```

1. Reading output of a process

```ocaml
#require "podge"
let () = 
  Podge.Unix.read_process_output "ls -halt" |> List.iter print_endline
```

The `|>` just means piping, its piping the output of
`read_process_output` into the input of the partially applied function
`iter`

2. Reading a file

```ocaml
#require "podge"
let () = 
  Podge.Unix.read_lines "code.ml" |> List.iter print_endline
```

Similar to 1, this reads all lines of file and gives it to the input
of the partially applied function `iter`.

These are two simple code samples from `Podge`, check out the
[repo](https://github.com/fxfactorial/podge) for other useful modules
like: (The README has code examples)

* `Web` simple HTTP requests and getting data back as JSON
* `Xml` querying simple XML documents
* `ANSITerminal` for creating colored shell output
* `StringExt` which is all due to [Rudi Grinberg](http://rgrinberg.com)

## What can you do with it?

Loads, warning shameless plugs ahead.

0.  I wrote an opam package that makes it easy to get an iOS OCaml
    cross-compiler, see
    [here](https://github.com/fxfactorial/opam-ios).
1.  Compilers! Lots of compilers and compiler tools are written in OCaml:
    Facebook uses OCaml for the [Hack](https://github.com/facebook/hhvm/tree/master/hphp/hack)
    typechecker, [pfff](https://github.com/facebook/pfff)
    and [flow](https://github.com/facebook/flow) and the first cut of
    Rust was written in OCaml.
2.  Financial world, [Jane Street](https://www.janestreet.com) uses
    OCaml for basically everything (AFAIK)
3.  Systems Programming: [ahrefs](https://ahrefs.com), my former
    employer Ahrefs uses OCaml for heavy systems programming.
4.  Kernels: Unikernels are hot right now, the most prominent one is
    the [Mirage-OS](https://mirage.io) project and its all OCaml.
5.  Shameless plug: I use OCaml as well for `js_of_ocaml`, in fact I'm
    using it to write an Electron app with a node backend (All code is
    OCaml compiled into JS, then run on node/Electron), see
    [here.](https://github.com/fxfactorial/ocaml-electron)
6.  Genomics/Bioinformatics:
    [Hammer Lab](https://github.com/hammerlab) in NYC uses OCaml for
    their genomics/sequencing work.
7.  My employer MixRank let me write `OCaml` for a `ssh` tunnel
    multiplexer for jailbroken iDevices called
    [gandalf](https://github.com/onlinemediagroup/ocaml-usbmux)
8.  You can even replace your shell scripts or Python with it, aka run
    it using the interpreter, see the self contained example listed
    after the elisp code at the end.

# Stick with it!

This style of coding might be new to you or maybe it's your first
programming language, stick with it and continue. OCaml offers many
awesome features and has many strengths including a very professional
and pragmatic community. Also, if you're in the Bay Area then please
come to [weekly office hours](http://www.meetup.com/sv-ocaml/) hours
hosted at MixRank in San Francisco. It's open to all levels of
experience and I still have some Enter the Monad t-shirts to give away,
courtesy of Jane Street.

## Oasis mini-tutorial

1. Create a directory.
    
2. Go to the directory and create a file named **\_oasis** and
directory named `src`
    
3. Here is a template of the contents of the **\_oasis** file

```conf
OASISFormat:  0.4
OCamlVersion: >= 4.02.3
Name:         opam_package_name
Version:      0.1
Maintainers:  New OCaml programmer
Homepage:     http://my_coolsite.com
Synopsis:     Some short description
Authors:      Cool@me.com
License:      BSD-3-clause
Plugins:      META (0.4), DevFiles (0.4)
AlphaFeatures: ocamlbuild_more_args

Description:
Some cool description

# This is a comment and this below creates an binary program
Executable <some_program_name>
   Path: src
   BuildTools:ocamlbuild
   install: true
   MainIs: main.ml
   CompiledObject: native
   BuildDepends: package_one, package_two

# Another comment, this builds a library called pg
Library pg
   Path:         src
   # oasis will figure out the dependencies, 
   # Just list the modules you want public, 
   # Note that there's no .ml, just give the name
   Modules:      Pg
   CompiledObject: byte
   BuildDepends: some_package
```

4. Generate the Makefile, setup.ml, configure and other build crap.

```shell
$ oasis setup -setup-update dynamic
```

5. Actually build your code, yes its just a call to make.

```shell
$ make
```
Assuming that you were building an executable, then you should see
either a `foo.native` or a `foo.byte` in the root directory of the
project.

6. You can stop here, but you can go even further with
`oasis2opam`. Install it with: 

```shell
opam install oasis2opam
```

then in your project's root directory, aka the directory with the
\_oasis file, do:

```shell
oasis2opam --local
```

This creates the `opam` directory and some meta data for the opam
packaging system. Your local package can now be a first class citizen
with opam just by doing this in the same project root directory:

```shell
$ opam pin add <your_package_name> . -y
```

## Elisp for OCaml coding

Code for the [Emacs init file](https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html).

```elisp
;; OCaml code
(add-hook
 'tuareg-mode-hook
 (lambda ()
   ;; Add opam emacs directory to the load-path
   (setq opam-share
	 (substring
	  (shell-command-to-string "opam config var share 2> /dev/null")
	  0 -1))
   (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
   ;; Load merlin-mode
   (require 'merlin)
   ;; Start merlin on ocaml files
   (add-hook 'tuareg-mode-hook 'merlin-mode t)
   (add-hook 'caml-mode-hook 'merlin-mode t)
   ;; Enable auto-complete
   (setq merlin-use-auto-complete-mode 'easy)
   ;; Use opam switch to lookup ocamlmerlin binary
   (setq merlin-command 'opam)
   (company-mode)
   (require 'ocp-indent)
   (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
   (autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
   (autoload 'merlin-mode "merlin" "Merlin mode" t)
   (utop-minor-mode)
   (company-quickhelp-mode)
   ;; Important to note that setq-local is a macro and it needs to be
   ;; separate calls, not like setq
   (setq-local merlin-completion-with-doc t)
   (setq-local indent-tabs-mode nil)
   (setq-local show-trailing-whitespace t)
   (setq-local indent-line-function 'ocp-indent-line)
   (setq-local indent-region-function 'ocp-indent-region)
   (if (equal system-type 'darwin)
       (load-file "/Users/Edgar/.opam/working/share/emacs/site-lisp/ocp-indent.el")
     (load-file "/home/gar/.opam/working/share/emacs/site-lisp/ocp-indent.el"))
   (merlin-mode)))

(add-hook 'utop-mode-hook (lambda ()
			    (set-process-query-on-exit-flag
			     (get-process "utop") nil)))
```

## OCaml as shell scripting, example assume gandalf

This is the deploy script I use for a
[project](https://github.com/fxfactorial/ent) that I'm working on, a
way to get a node like thing on iOS using JavaScriptCore,
Objective-C++ and Grand Central Dispatch.

You can do `chmod +x` on the script, then can just invoke it as a
regular program, no compiling necessary.

```ocaml
#!/usr/bin/env ocaml
(* Need topfind to make require work, need require to use podge package *)
#use "topfind"
#require "podge"

module U = Yojson.Basic.Util
module A = Podge.ANSITerminal

type cmd = Scp of int * string
         | Ssh of int * string

type error_condition = Copy_error | Exec_error

let connected_devices () =
  Podge.Unix.read_process_output "gandalf -s"
  |> Podge.List.drop ~n:5
  |> String.concat ""
  |> Yojson.Basic.from_string
  |> U.to_list
  |> List.fold_left
    (fun accum item -> U.(member "Local Port" item |> to_int) :: accum) []

let command = function
  | Scp (port, target) ->
    Printf.sprintf "scp -P %d %s root@localhost:~/" port target
  | Ssh (port, cmd) ->
    Printf.sprintf "ssh root@localhost -p %d \"%s\"" port cmd

let usage () =
  "This deploy script assumes that it was started\n\
   from the makefile with `make deploy` and that gandalf is running"
  |> print_endline;
  exit 1

let with_gandalf udid ~f =
  let f_name = Filename.temp_file "gandalf" "deployment" in
  let f_chan = open_out f_name in
  Printf.sprintf "%s:2000:22" udid |> output_string f_chan;
  close_out f_chan;
  let gandalf_pid =
    Unix.(create_process "gandalf" [|"gandalf"; "-m"; f_name|] stdin stdout stderr)
  in
  Unix.sleep 1;
  f ();
  Unix.kill gandalf_pid 5

let cmd_result ~error_msg = function
  | outcome when outcome <> 0 ->
    A.colored_message ~m_color:Podge.T.Red error_msg |> prerr_endline;
    exit 1
  | _ -> ()

let () =
  if Array.length Sys.argv <> 3 then usage ()
  else
    with_gandalf Sys.argv.(2) begin fun () ->
      let devices = connected_devices () in
      devices |> List.iter begin fun i_device ->
        let scp_cmd = Sys.(Scp (i_device, argv.(1))) |> command in
        Printf.sprintf "Deploying binary to remote device: %s" scp_cmd
        |> A.colored_message |> print_endline;
        Sys.command scp_cmd
        |> cmd_result ~error_msg:"Was unable to copy over the binary";
        let ssh_cmd_sign =
          Sys.(Ssh (i_device, "ldid -S /var/root/" ^ argv.(1))) |> command
        in
        Printf.sprintf "Signing binary on remote device: %s" ssh_cmd_sign
        |> A.colored_message |> print_endline;
        Sys.command ssh_cmd_sign
        |> cmd_result
          ~error_msg:(Printf.sprintf "Signing binary on remote device: %s" ssh_cmd_sign);
        let ssh_cmd = Sys.(Ssh (i_device, "/var/root/" ^ argv.(1))) |> command in
        Printf.sprintf "Executing binary on remote device: %s" ssh_cmd
        |> print_endline;
        Sys.command ssh_cmd
        |> cmd_result ~error_msg:"Was unable to execute the binary";
        A.colored_message "Deployed and tested successfully"
        |> print_endline
      end
    end
```
