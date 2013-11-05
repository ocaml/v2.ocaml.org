open Camlp4.PreCast
open Syntax

let () =
  EXTEND Gram
    expr: LEVEL "top"
    [ [ "for"; v = a_LIDENT; "in"; m = a_UIDENT; e = expr; "do";
        seq = sequence; "done" ->
          <:expr< $uid:m$.iter (fun $lid:v$ -> $seq$) $e$ >>
      ] ];
  END
