```ocaml
(* If [l] is the list [l1;…;lN] *)
(* l1 +. … +. lN *)
List.fold_left ( +. ) 0. l

(* l1 *. … *. lN *)
List.fold_left ( *. ) 1. l

(* l1 ∧ … ∧ lN *)
List.fold_left ( && ) true l

(* Reverse: [lN;…;l1] *)
List.fold_left
  (fun r e -> e :: r) [] l
```
