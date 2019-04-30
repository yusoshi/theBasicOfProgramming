#use "fold_right.ml"


(* 目的 : 整数のリストを受け取ったらそれらの合計値を返す *)
(* sum2 : int list -> int *)
let sum2 lst = 
    (* 目的 : firstとrest_resultを加える *)
    fold_right (+) lst 0


(* テスト *)
let test1 = sum2 [1; 2; 3] = 6
let test2 = sum2 [1; 2; 8] = 11
