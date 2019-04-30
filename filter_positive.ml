(* 目的 : 受け取ったリストlstから正の要素のみ取り出す *)
(* filter_positive : int list -> int list *)
let rec filter_positive lst = match lst with
    [] -> []
    | first :: rest -> 
        if first > 0 then first :: filter_positive rest 
	else filter_positive rest


(* テスト*)
let test1 = filter_positive [] = []
let test2 = filter_positive [-1; 0; 1] = [1]
let test3 = filter_positive [-1; 4; 2] = [4; 2]
