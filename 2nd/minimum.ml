(* 目的 : 整数のリストを受け取ったら、その中の最小の数を返す*)
(* minimum : int list -> int *)
let rec minimum lst = match lst with
    [] -> max_int
    | first :: rest ->
    let min_rest = minimum rest in
    if first <= min_rest then first
    else min_rest 

(* テスト *)
let test1 = minimum [1; 2; 3] = 1
let test2 = minimum [] = max_int 
let test3 = minimum [3; 4; 9; 1] = 1 
