(* 目的 : 関数 f とリスト lst を受け取り f を施したリストを返す *)
(* map : ('a -> 'b) -> 'a list -> 'b list *)
let rec map f lst = match lst with
    [] -> []
  | first :: rest -> f first :: map f rest

