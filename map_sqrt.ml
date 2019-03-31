(* 目的 : 実数のリスト lst を受け取り各要素の平方根のリストを返す *)
(* map_sqrt : float list -> float list *)
let rec map_sqrt lst = match lst with
    [] -> []
  | first :: rest -> sqrt first :: map_sqrt rest

  (* test *)
  let test1 = map_sqrt [] = []
  let test2 = map_sqrt [1.0; 4.0] = [1.0; 2.0] 
  let test3 = map_sqrt [4.0; 9.0; 16.0] = [2.0; 3.0; 4.0] 
