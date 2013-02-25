open Camlp4.PreCast
open Syntax

let rec mkfun _loc patts e =
  match patts with
  | p :: patts ->
      <:expr< fun $p$ -> $mkfun _loc patts e$ >>
  | [] ->
      e

let () =
  EXTEND Gram
    expr: LEVEL "top"
    [ [ "for"; patts = LIST1 ipatt; "in"; m = a_UIDENT; e = expr; "do";
        seq = sequence; "done" ->
          let f = mkfun _loc patts seq in
          <:expr< $uid:m$.iter $f$ $e$ >>
      ] ];
  END
