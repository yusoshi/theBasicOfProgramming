(* 目的 : 関数とリストを受け取ったら、リストの各要素に関数の処理を施したリストを返す*)
(* map : ('a -> 'b) -> 'a list -> 'b list *)
let rec map f lst = match lst with
    [] -> []
    | first :: rest -> f first :: map f rest

