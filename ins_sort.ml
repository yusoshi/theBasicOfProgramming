#use "insert.ml"

(* 目的 : 整数のリスト lst を受け取ったらそれを昇順に整列したリストを返す *)
(* inst_sort : int list -> int list *)
let rec ins_sort lst = match lst with
    [] -> []
  | first :: rest -> 
    insert (ins_sort rest) first  (* ins_sort rest *)


(* test *)
(*
let test1 = ins_sort [] = []
let test2 = ins_sort [5; 3; 8; 1; 7; 4] = [1; 3; 4; 5; 7; 8]
*)


