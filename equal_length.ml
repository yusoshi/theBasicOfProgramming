(* 目的 : ２つのリスト lst1 と lst2 を受け取ったら、それらの長さが同じか調べる *)
(* equal_length : int list -> int list -> string *)
let rec equal_length lst1 lst2 = match (lst1, lst2) with
    ([], []) -> "Equal"
  | (first1 :: rest1, []) -> "Not Equal"
  | ([], first2 :: rest2) -> "Not Equal"
  | (first1 :: rest1, first2 :: rest2) -> 
    equal_length rest1 rest2

(* Test *)
let test1 = equal_length [] [] = "Equal"
let test2 = equal_length [] [1] = "Not Equal"
let test3 = equal_length [1] [] = "Not Equal"
let test4 = equal_length [1] [2] = "Equal"
let test5 = equal_length [1; 2] [2; 8] = "Equal"
let test6 = equal_length [1; 2] [2; 8; 9] = "Not Equal"
