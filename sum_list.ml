(* 目的 : 整数のリストを与えられたらそれまでの数の合計からなるリストを返す *)
(* sum_list : int list -> int list *)
let rec sum_list lst = 
    (* 目的 : 整数のリストを与えられたらそれまでの数の合計らなるリストを返す *)
    let rec hojo lst total = match lst with
    [] -> []
    | first :: rest -> (total + first) :: hojo rest (total + first)
    in hojo lst 0

(* テスト　*)
let test1 = sum_list [1; 2; 3] = [1; 3; 6]
let test2 = sum_list [3; 2; 1; 4] = [3; 5; 6; 10]

