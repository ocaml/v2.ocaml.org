open Camlp4.PreCast
open Syntax

let mksequence _loc = function
  | <:expr< $_$; $_$ >> as e -> <:expr< $e$ >>
  | e -> e

let rec mkfun _loc patts e =
  match patts with
  | p :: patts -> <:expr< fun $p$ -> $mkfun _loc patts e$ >>
  | [] -> mksequence _loc e

let lident_of_patt p =
  match p with
  | <:patt< $lid:i$ >> -> i
  | _ -> invalid_arg "lident_of_patt"

let () =
  DELETE_RULE Gram
  expr:
    "for"; a_LIDENT; "="; sequence; direction_flag; sequence; "do"; do_sequence
  END;

  EXTEND Gram
  expr: LEVEL "top"
    [ [ "for"; i = ipatt; "="; e1 = sequence; df = direction_flag;
        e2 = sequence; "do"; seq = do_sequence ->
         <:expr<
           for $lident_of_patt i$ =
             $mksequence _loc e1$ $to:df$ $mksequence _loc e2$
             do $seq$ done
         >>
      | "for"; p = ipatt; patts = LIST0 ipatt; "in"; m = a_UIDENT; e = expr;
        "do"; seq = do_sequence ->
         let patts = p :: patts in
         let f = mkfun _loc patts seq in
         <:expr< $uid:m$.iter $f$ $e$ >>
      ] ];
  END
