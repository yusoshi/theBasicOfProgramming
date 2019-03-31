(* 目的 : 整数 n を受け取ったら以下の漸化式で定義される第 n 項を求める *)
(* zenkashiki : int -> int *)
let rec zenkashiki n =
    if n = 0 then 3
    else zenkashiki (n - 1) - 1

(* test *)
let test1 = zenkashiki 0 = 3  
let test2 = zenkashiki 1 = 2  
let test2 = zenkashiki 2 = 1  
