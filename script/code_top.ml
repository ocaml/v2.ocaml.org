(* Toplevel returning structured data on stdout for the library [Code]
   to use.  We want it to be a separate program so it can be restarted
   at will (e.g. we want a new session for each file). *)

open Printf
open Code_types
open Utils

(* Force the linking of some modules for #load "camlp4o.cma" *)
module S___ = Stream
module Q___ = Queue
module C___ = CamlinternalOO
module D___ = Dynlink

let () =
  eprintf "***** STARTING OCAML TOPLEVEL ******\n%!";
  Toploop.set_paths ();
  Toploop.initialize_toplevel_env();
  (* (match Hashtbl.find Toploop.directive_table "rectypes" with *)
  (*  | Toploop.Directive_none f -> f () *)
  (*  | _ -> assert false); *)
  Toploop.input_name := ""; (* no filename *)
  Toploop.max_printer_steps := 20;
  (* Add #load and #install_printer *)
  let load cma = Topdirs.dir_load Format.str_formatter cma in
  Toploop.(Hashtbl.add directive_table "load" (Directive_string load))

let is_ready_for_read fd =
  let fd_for_read, _, _ = Unix.select [fd] [] [] 0.001 in
  fd_for_read <> []

let string_of_fd fd =
  let buf = Buffer.create 1024 in
  let s = String.create 256 in
  while is_ready_for_read fd do
    let r = Unix.read fd s 0 256 in
    Buffer.add_substring buf s 0 r
  done;
  Buffer.contents buf


let init_stdout = Unix.dup Unix.stdout
let init_stderr = Unix.dup Unix.stderr

let flush_std_out_err () =
  Format.pp_print_flush Format.std_formatter ();
  flush stdout;
  Format.pp_print_flush Format.err_formatter ();
  flush stderr

let eval phrase =
  if String.trim phrase = ";;" then Normal("", "", "")
  else (
    flush_std_out_err ();
    let (out_in, out_out) = Unix.pipe() in
    Unix.dup2 out_out Unix.stdout; (* Unix.stdout → out_out *)
    let (err_in, err_out) = Unix.pipe() in
    Unix.dup2 err_out Unix.stderr; (* Unix.stderr → err_out *)
    let get_stdout_stderr_and_restore () =
      flush_std_out_err ();
      let out = string_of_fd out_in in
      Unix.close out_in;
      Unix.close out_out;
      Unix.dup2 init_stdout Unix.stdout; (* restore initial stdout *)
      let err = string_of_fd err_in in
      Unix.close err_in;
      Unix.close err_out;
      Unix.dup2 init_stderr Unix.stderr; (* restore initial stderr *)
      (out, err) in
    try
      let lexbuf = Lexing.from_string phrase in
      let phrase = !Toploop.parse_toplevel_phrase lexbuf in
      ignore(Toploop.execute_phrase true Format.str_formatter phrase);
      let exec_output = Format.flush_str_formatter () in
      let out, err = get_stdout_stderr_and_restore () in
      Normal(exec_output, out, err)
    with
    | e ->
       let _ = get_stdout_stderr_and_restore () in
       let backtrace_enabled = Printexc.backtrace_status () in
       if not backtrace_enabled then Printexc.record_backtrace true;
       (try Errors.report_error Format.str_formatter e
        with exn ->
          eprintf "Code_top.toploop_eval: the following error was raised \
                   during error reporting for %S:\n%s\nError backtrace:\n%s\n%!"
                  phrase (Printexc.to_string exn) (Printexc.get_backtrace ());
       );
       if not backtrace_enabled then Printexc.record_backtrace false;
       Error(Format.flush_str_formatter ())
  )


(* Input lines until a ";;" appears on its own line *)
let rec input_phrase ch =
  let buf = Buffer.create 128 in
  let continue = ref true in
  while !continue do
    let l = input_line ch in
    if l = ";;" then continue := false
    else (
      Buffer.add_string buf l;
      Buffer.add_char buf '\n'
    )
  done;
  Buffer.contents buf

let () =
  Toploop.max_printer_steps := 500;
  try
    while true do
      (* When [Unix.close_process] is called, the pipe is closed and
         [End_of_file] is raised.  Exit gracefully. *)
      let phrase = try input_phrase stdin
                   with End_of_file -> raise Exit in
      send_outcome stdout (eval (phrase ^ ";;"));
    done
  with Exit -> ()
