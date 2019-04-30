(* 目的 : 整数を受け取ったらその階乗を返す *)
(* fac : int -> int *)
let fac n = List.fold_right ( * ) (enumerate n) 1

(* テスト *)
let test1 = fac 3 = 6 
let test2 = fac 5 = 120 
