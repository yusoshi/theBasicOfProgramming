(* 目的 : 自然数 m と n を受け取ったら m の n 乗を求める *)
(* power : int -> int -> int *)
let rec power m n =
    if m = 0 then 1
    else 
	if n = 0 then 1
	else
	    m * power m (n - 1)
	    
(* test *)
let test1 = power 1 0 = 1 
let test2 = power 2 3 = 8 
