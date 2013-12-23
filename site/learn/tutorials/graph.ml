open GObj

let font_name = "-*-helvetica-medium-r-normal-*-120-*"

let font =
  try
    Gdk.Font.load font_name
  with
    Gpointer.Null -> failwith ("graph.ml: " ^ font_name ^ ": not found")

(* Draw text left, centre or right justified at point. (x,y) point is
 * either top left, top middle or top right of text.
 *)
let draw_text drawable font position (x, y) text =
  let string_width = Gdk.Font.string_width font text in
  let string_height = Gdk.Font.string_height font text in
  match position with
    `Left ->
      drawable#string text ~font ~x ~y:(y+string_height)
  | `Centre ->
      drawable#string text ~font ~x:(x - string_width/2) ~y:(y+string_height)
  | `Right ->
      drawable#string text ~font ~x:(x - string_width) ~y:(y+string_height)

(* Filled, black-outlined rectangle. *)
let draw_rectangle (drawable : [`window] GDraw.drawable)
    fill_col (ll_x, ll_y) (tr_x, tr_y) =
  let width = tr_x - ll_x in
  let height = tr_y - ll_y in
  drawable#set_foreground (`NAME fill_col);
  drawable#rectangle ~x:ll_x ~y:ll_y ~width ~height ~filled:true ();
  drawable#set_foreground `BLACK;
  drawable#rectangle ~x:ll_x ~y:ll_y ~width ~height ~filled:false ()

(* This is the actual graph widget. *)
class graph ?width ?height ?packing ?show array =
  (* Constants. *)
  let page_size = 10 in                 (* Number of bars on "page". *)
  let max_y = 10 in                     (* Maximum on Y scale. *)

  (* Number of data points. *)
  let array_size = Array.length array in

  (* Create the containing vbox. *)
  let vbox = GPack.vbox ?width ?height ?packing ?show () in

  (* Create the drawing area. *)
  let da = GMisc.drawing_area ~packing:vbox#add () in
  let drawable = lazy (new GDraw.drawable da#misc#window) in

  (* Create the scrollbar. *)
  let adjustment = GData.adjustment
      ~lower:0. ~upper:(float_of_int (array_size-1))
      ~step_incr:1. ~page_incr:(float_of_int page_size) () in
  let scrollbar =
    GRange.scrollbar `HORIZONTAL ~adjustment ~packing:vbox#pack () in

  object (self)
    inherit widget vbox#as_widget

    (* The title of the graph. *)
    val mutable title = "no title"
    method set_title t = title <- t
    method title = title

    (* Repaint the widget. *)
    method private repaint () =
      let drawable = Lazy.force drawable in
      let (width, height) = drawable#size in
      drawable#set_background `WHITE;
      drawable#set_foreground `WHITE;
      drawable#rectangle ~x:0 ~y:0 ~width ~height ~filled:true ();
      drawable#set_foreground `BLACK;

      (* Draw the title. *)
      draw_text drawable font `Centre (width/2, 20) title;

      (* Draw the axes. *)
      drawable#line ~x:40 ~y:(height-40) ~x:(width-40) ~y:(height-40);
      drawable#line ~x:40 ~y:(height-40) ~x:40 ~y:40;

      (* Which part of the data to display? first .. first+page_size-1 *)
      let first_bar = int_of_float adjustment#value in
      let data = Array.sub array first_bar page_size in
      let bar_width = (width - 80) / page_size in

      (* Compute function mapping graph (x, y) to screen coordinates. *)
      let map (x,y) =
        (40 + x * bar_width, height-40 - y * (height-80) / max_y)
      in

      (* Draw the axes scales. *)
      draw_text drawable font `Right (40, height-40) "0";
      draw_text drawable font `Right (40, 40) (string_of_int max_y);
      for i = 0 to page_size-1 do
        let x = 40 + i * bar_width + bar_width/2 in
        let y = height-35 in
        let v = first_bar + i in
        draw_text drawable font `Centre (x, y) (string_of_int v)
      done;

      (* Draw the data. *)
      for i = 0 to page_size-1 do
        let (ll_x,ll_y) = map (i, data.(i)) in
        let (tr_x,tr_y) = map (i+1, 0) in
        draw_rectangle drawable "red" (ll_x, ll_y) (tr_x, tr_y)
      done;
      ()

    (* You must call it after creating the widget. *)
    method init =
      da#event#connect#expose
        ~callback:(fun _ -> self#repaint (); false);
      adjustment#connect#value_changed
        ~callback:(fun _ -> self#repaint ())

  end
