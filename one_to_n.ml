
(* 目的 : 整数を受け取ったら、１からその数までの和を返す *)
(* one_to_n : int -> int *)
let one_to_n n = List.fold_right (+) (enumerate n) 0


(* テスト *)
let test1 = one_to_n 10 = 55
let test2 = one_to_n 0 = 0 
