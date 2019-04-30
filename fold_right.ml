(* 目的 : initから初めてlstの要素を右から順にfを施しこむ *)
(* fold_right : *)
let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest -> f first (fold_right f rest init)
