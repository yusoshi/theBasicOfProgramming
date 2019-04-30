
(* 目的: リストを受け取ったら、要素数を返す *)
(* length2 : 'a list -> int *)
let length2 lst = 
    List.fold_right (fun first rest_result -> 1 + rest_result) lst 0

(* テスト *)
let test1 = length2 [1; 2; 3] = 3
let test2 = length2 [1; 2; 8] = 3 
let test3 = length2 [] = 0 
