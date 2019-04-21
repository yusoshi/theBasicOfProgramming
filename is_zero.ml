#use "map.ml"

(* 目的 整数のリストの要素を一つ一つ調べ、0であればTrue, そうでなければfalseを返す *)

(* 目的 : 整数を受け取り、それが0であればTrue, そうでなければFalseを返す *)
(* is_zero : int -> bool *)
let is_zero n = n = 0

map is_zero [1; 2; 3; 4] 



let map f lst = match lst with
    [] -> []
  | first :: rest -> f first :: map f rest
