<!-- ((! set title A LaTeX plugin example !)) ((! set learn !)) -->

# A plugin example for compiling LaTeX
Besides the example below, another plugin for LaTeX can be found
[here](https://github.com/ocaml/ocamlunix/blob/master/myocamlbuild.ml#L14)
it handles
pdfLaTeX, MakeIndex, HeVeA (both monolithic html and html by chapter via
HaChA) and Pgf/TikZ picture extraction to PNG for the html versions.
However as the plugin below it assumes that LaTeX will converge in two
iterations for the PDF and the master tex file chapter dependencies must
be explicitly stated.


```ocaml
open Ocamlbuild_plugin
open Command

let pdflatex = ref (A"pdflatex")
let ocamlweb = ref (A"ocamlweb")

let () =
  dispatch begin function
  
    (* Here one can change the default value of options, they can still
       be updated by a command line option. *)
    | Before_options ->
       (* This will put all warnings to \texttt{ocaml\{c,opt\}} by default. *)
       Options.ocaml_cflags := ["-w";"A"]
  
    (* Here one can change the final value of options. *)
    | After_options ->
       (* This avoids the creation of symbolic links to the build directory. *)
       Options.make_links := false
  
    (* This hook is called before the hygiene phase.
       This phase also serve as collecting all the information about the
       source tree. *)
    | Before_hygiene ->
  
        (* Here you can dynamically tag some files or directories. *)
        (* This is done here by checking the [SOME_COND] variable which is
           impossible in the \tags file. *)
        if getenv "SOME_COND" ~default:"false" = "true" then
  
          (* By setting foo_dir as not_hygienic one say that the foo directory
             can contains non hygienic files (such as \texttt{.cmi},
             \texttt{.cmo}\ldots). *)
          tag_file "foo_dir" ["not_hygienic"]
  
    (* One can also do things after the hygiene step. *)
    | After_hygiene -> ()
  
    (* One can setup rules before the standard ones but that's not recommended. *)
    | Before_rules -> ()
  
    (* Here one can add or override new rules *)
    | After_rules ->
        (* Rules can be declared by a call of the form
            [rule name ~prod ~dep action].
            The first argument is the name of the rule.
            [~prod:string] specifies the product of the rule.
            Note that [~prods:string list] also exists.
            [~dep] and [~deps] are for dependencies *)
        rule "LaTeX to PDF conversion rule"
          ~prod:"%.pdf"
          ~dep:"%.tex"
          begin fun env _build ->
  
            (* The action is a function that receive two arguments:
            [env] is a conversion function that substitutes `%'
            occurrences according to the targets to which the rule
            applies.  [_build] can be called to build new things
            (dynamic dependencies). *)
            let tex = env "%.tex" and _pdf = env "%.pdf" in
  
            (* Here we say: ``We compile the file tex form LaTeX to
               PDF''.  Note that in fact that is a set of tags, thus
               the order does not matter. But you got the idea. *)
            let tags = tags_of_pathname tex++"compile"++"LaTeX"++"pdf" in
  
            (* Here we produce the command to run.
               [S]  is for giving a sequence of command pieces.
               [A]  is for atoms.
               [P]  is for pathnames.
               [Px] is a special pathname that should be the main product
                    of the rule (for display purposes).
               [T]  is for tags.
  
               The other constructors are given in the documentation of the
               [Command] module in [Signatures.COMMAND]. *)
            let cmd = Cmd(S[!pdflatex; T tags; P tex; Sh"< /dev/null"]) in
            (* Hoping that LaTeX will converge in two iterations *)
            Seq[cmd; cmd]
          end;
  
        (* Here we make an extension of any rule that produces a command
           containing these tags. *)
        flag ["compile"; "LaTeX"; "pdf"; "safe"] (A"-halt-on-error");
  
        (* Here we give an exception: the file ``manual.tex'' is tagged
           ``safe''.  With this tag we add the -halt-on-error flag during
           the LaTeX compilation. *)
        tag_file "manual.tex" ["safe"];
  
        (* The generic LaTeX rule could look at the file searching for
           some \verb'\input{}' command, but LaTeX is so complex that it
           will be hard to make this solution complete.  Here we manually
           inject some dependencies at one particular point. *)
  
        (* The [dep] function takes tags and pathnames. This will build
           pathnames if a command contains these tags. Note that every
           file [some_file_name] is tagged [file:some_file_name]. *)
        dep ["compile"; "LaTeX"; "pdf"; "file:manual.tex"]
            ["ocamlweb.sty"; "myocamlbuild.tex"];
  
        rule "OCaml to LaTeX conversion rule (using ocamlweb)"
          ~prod:"%.tex"
          ~dep:"%.ml"
          begin fun env _build ->
            let tex = env "%.tex" and ml = env "%.ml" in
            let tags = tags_of_pathname ml++"ocamlweb"++"LaTeX" in
            Cmd(S[!ocamlweb; T tags; P ml; A"-o"; Px tex])
          end;
  end
```

## Notes


- The (relative and absolute) dependencies of a tex file can be found
 by running latex with `-recorder` and parse the resulting `.fls` file.
 Unfortunately as this does execute the tex code this takes too much
 time to sort out the deps.

