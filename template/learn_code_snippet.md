```ocaml
(* If [l] is the list [e1;…;eN] *)
(* e1 +. … +. eN *)
List.fold_left ( +. ) 0. l

(* e1 *. … *. eN *)
List.fold_left ( *. ) 1. l

(* e1 &#8743; … ∧ eN *)
List.fold_left ( && ) true l

(* Reverse: [eN;…;e1] *)
List.fold_left
  (fun r e -> e :: r) [] l
```
