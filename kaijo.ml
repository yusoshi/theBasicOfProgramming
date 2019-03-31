(* 目的 : 整数 n を受け取ったらその階乗を返す *)
(* kaijo : int -> int *)
let rec kaijo n = 
    if n = 0 then 1 
    else n * kaijo(n - 1)

(* test *)
let test1 = kaijo 0 = 1
let test2 = kaijo 1 = 1
let test3 = kaijo 3 = 6
let test4 = kaijo 4 = 24



    
