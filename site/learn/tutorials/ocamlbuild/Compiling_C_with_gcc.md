<!-- ((! set title A gcc plugin example !)) ((! set learn !)) -->

# Compiling C with gcc
The following is a plugin that tries to handle simple C projects with
`gcc` in the same way `ocamlbuild` handles your caml projects, i.e. you
don't need to specify anything particular to build simple executables.
Another approach is to use the
[ocamlbuild-ctools](http://dvide.com/labs/ocamlbuild-ctools) plugin
which provides support for both `gcc` and the MSVC tool chain, but
you'll have to explicitely list object files to link your executables.

The example uses `avr-gcc` to produce `%.elf` executables for
microcontrollers, but it's just a matter of substituting `avr-gcc` with
`gcc` to get the same result for regular C projects. For now the plugin
doesn't handle multiple directories.

Object dependencies linked into a `%.elf` executable are automatically
computed as follows.

1. Each file `%.{c,h}` has a corresponding file `%.{c,h}.depends` that
 lists \(locally\) included files \(this file is generated via
 `avr-gcc -MM -MF -MG %.{c,h}.depends %.{c,h}`\). Note that
 unfortunately the result in `%.{c,h}.depend` is different if
 included files are already in the build dir or not \(very
 helpful...\), see the `correct` function in `parse_deps` \(this
 "feature" may make it a hard to support multiple directories, but I
 didn't research that extensively\). Another problem is that these
 `make` oriented `.depends` files have `\` when lines becomes too
 long thus we need to filter out these.
2. To build a `%.o` from `%.c`, every file mentioned in `%.c.depends`
 and recursively is built \(in the function `parse_deps` the first two
 items of `%.c.depends` are ignored : they are `%.o` and `%.c`\). To
 sum up, this step copies files included in `%.c` \(and recursively\)
 to the `_build` directory and produces the object file `%.o`.
3. To build \(link\) a `%.elf`, we take `%.o` and for each `$.h`
 mentioned in `%.c.depends` \(and recursively\) we try to build a
 corresponding `$.c`, if it succeeds the corresponding `$.o` is built
 and added at the link phase.

<!-- -->```
open Ocamlbuild_plugin

let avr_gcc_rules avr_gcc avr_objcopy =
  let parallel files = List.map (fun f -> [f]) files in
  let err_circular file path = 
    Printf.sprintf "Circular build detected (%s already seen in [%s])"
      file (String.concat "; " path)
  in
  let parse_deps file = 
    let dir = Pathname.dirname file in
    let deps = List.tl (List.tl (string_list_of_file file)) in
    let deps = List.filter (fun d -> d <> "\\") deps in (* remove \ *)
    let correct d = if Pathname.dirname d = dir then d else dir / d in
    List.map correct deps
  in
  let deps_action dep prod env build = 
    let c = env dep in
    let tags = tags_of_pathname c in
    Cmd (S [A avr_gcc; T tags; 
        A "-MM"; A "-MG"; A "-MF"; Px (env prod); P c])
  in

  rule "avr-gcc: c -> c.depends" 
    ~dep:"%.c" 
    ~prod: "%.c.depends" (deps_action "%.c" "%.c.depends");

  rule "avr-gcc: h -> h.depends"
    ~dep:"%.h"
    ~prod:"%.h.depends" (deps_action "%.h" "%.h.depends");

  rule "avr-gcc: c & c.depends -> o"
    ~deps:["%.c"; "%.c.depends"]
    ~prod: "%.o"
    begin fun env build ->
      let c = env "%.c" in
      let rec build_transitive_deps = function
    | [] -> ()
    | (_, []) :: todo -> build_transitive_deps todo
    | (path, f :: rest) :: todo ->
        if List.mem f path then failwith (err_circular f path) else
        let deps = parse_deps (f ^ ".depends") in
        let dep_files = List.map (fun d -> d ^ ".depends") deps in
        List.iter Outcome.ignore_good (build (parallel deps));
        List.iter Outcome.ignore_good (build (parallel dep_files));
        build_transitive_deps (((f :: path), deps) :: (path, rest) :: todo)
      in
      build_transitive_deps [([],[c])];
      Cmd (S [A avr_gcc;
          A "-Wall"; A "-Os"; A "-std=c99";
          T (tags_of_pathname c ++ "compile" ++ "avr-gcc");
          A "-c"; P c;
          A "-o"; Px (env "%.o");])
    end;

    rule "avr-gcc: o & c.depends -> .elf" 
    ~dep:"%.o"
    ~prod: "%.elf"
    begin fun env build -> 
      let o = env "%.o" in
      let rec build_transitive_objs acc = function 
    | [] -> StringSet.fold (fun v l -> v :: l) acc []
    | [] :: todo -> build_transitive_objs acc todo
    | (f :: rest) :: todo  -> 
        (* builds a .o for each .h which has a .c *)
        let deps =
          let is_hfile f = Pathname.check_extension f "h" in
          List.filter is_hfile (parse_deps (f ^ ".depends")) 
        in
        let cfiles = 
          let remove_f = List.filter (fun f' -> f <> f') in
          let to_cfile f = Pathname.update_extension "c" f in
          let keep_good acc = function
        | Outcome.Good o -> o :: acc | Outcome.Bad _ -> acc 
          in
          List.fold_left keep_good [] 
        (build (parallel (remove_f (List.map to_cfile deps)))) 
        in
        let objs = 
          let to_ofile f = Pathname.update_extension "o" f in
          List.map Outcome.good 
        (build (parallel (List.map to_ofile cfiles)))
        in
        let add_obj acc o = StringSet.add o acc in
        build_transitive_objs 
          (List.fold_left add_obj acc objs) (cfiles :: deps :: rest :: todo)
      in
      let objs = build_transitive_objs (StringSet.empty) [[env "%.c"]] in
      Cmd (S [A avr_gcc;
          T (tags_of_pathname o ++ "link" ++ "avr-gcc");
          A "-o"; Px (env "%.elf");
          Command.atomize_paths (o :: objs) ])
    end;


  rule "avr-objcopy: elf -> hex"
    ~dep:"%.elf"
    ~prod:"%.hex"
    begin fun env _ ->
      let elf = env "%.elf" in
      Cmd (S [A avr_objcopy;
          A "-j"; A ".text";
          A "-j"; A ".data";
          A "-O"; A "ihex";
          T (tags_of_pathname elf ++ "compile" ++ "avr-objcopy");
          P elf;
          Px (env "%.hex")])
    end
;;



dispatch begin function
  | Before_rules ->                            (* override ocaml's C rules. *)
      avr_gcc_rules "avr-gcc" "avr-objcopy";
      flag ["compile"; "avr-gcc"; "mcu_atmega168"] (A "-mmcu=atmega168");
      flag ["link"; "avr-gcc"; "mcu_atmega168"] (A "-mmcu=atmega168");
      flag ["compile"; "avr-gcc"; "mcu_freq_16Mhz"] (A "-DF_CPU=16000000");
  | _ -> ()
end
;;

```


