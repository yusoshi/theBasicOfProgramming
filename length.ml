(* int list は 
    - []              は空リスト、または
    - first :: rest   のfirstは最初の要素、残りのリストがrest(restが自己参照)
    を返す型である *)


(* 目的 : リスト lst を受け取ったら、そのリストの長さを返す *)
(* length : int list -> int *)
let rec length lst = match lst with
    [] -> 0
  | first :: rest -> 1 + length rest 

(* test *)
let test1 = length [] = 0
let test2 = length [2] = 1
let test3 = length [2; 1; 6; 4; 7] = 5
