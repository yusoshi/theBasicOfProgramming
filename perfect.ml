#use "divisor.ml"

(* 目的 : 整数mを受け取ったら、その完全数のリストを返す *)
(* perfect : int -> int list *)
let perfect m = List.filter (fun n -> List.fold_right (+) (divisor n) 0 - n = n) (enumerate m )

(* テスト *)
let test1 = perfect 6 = [6]
let test2 = perfect 10000 = [8128; 496; 28; 6]
