(* Graph widget test program.
 * By Richard W.M. Jones.
 * $Id: test.ml,v 1.1 2004/03/15 16:54:59 rich Exp $
 *)

open GMain
open GdkKeysyms
open Graph

let main () =
  let window = GWindow.window ~width:640 ~height:480
                              ~title:"LablGtk graph widget demo" () in
  let vbox = GPack.vbox ~packing:window#add () in
  window#connect#destroy ~callback:Main.quit;

  (* Menu bar *)
  let menubar = GMenu.menu_bar ~packing:vbox#pack () in
  let factory = new GMenu.factory menubar in
  let accel_group = factory#accel_group in
  let file_menu = factory#add_submenu "File" in

  (* File menu *)
  let factory = new GMenu.factory file_menu ~accel_group in
  factory#add_item "Quit" ~key:_Q ~callback: Main.quit;

  (* Data. *)
  let array = Array.init 100 (fun _ -> Random.int 10) in

  (* Create a graph in the main area. *)
  let graph = new graph ~packing:vbox#add array in
  graph#init;
  graph#set_title "Random data";

  (* Display the windows and enter Gtk+ main loop *)
  window#show ();
  Main.main ()

let () =
  main ()
