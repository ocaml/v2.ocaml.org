```ocaml
(* If [l] is the list [l₁;…;lₖ] *)
(* l₁ +. ⋯ +. lₖ *)
List.fold_left ( +. ) 0. l

(* l₁ *. ⋯ *. lₖ *)
List.fold_left ( *. ) 1. l

(* l₁ ∧ ⋯ ∧ lₖ *)
List.fold_left ( && ) true l

(* Reverse: [lₖ;…;l₁] *)
List.fold_left
  (fun r e -> e :: r) [] l
```
