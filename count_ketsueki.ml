#use "person_list.ml"

(* 目的 : person_t 型のリストを受け取ったら、その中から ketsueki0 で指定された血液型の人数を返す *)
(* count_ketsueki : person_t list -> string -> int *)
let rec count_ketsueki lst ketsueki0 = match lst with
    [] -> 0
  | { name = n; height = h; weight = w; birth_date = bi; blood_type = bl } :: rest -> 
    if bl = ketsueki0 then 1 + count_ketsueki rest ketsueki0
    else count_ketsueki rest ketsueki0

  
  
(* test *)
let test1 = count_ketsueki lst1 "A" = 0  
let test2 = count_ketsueki lst5 "A" = 1  
let test3 = count_ketsueki lst5 "AB" = 3  
let test4 = count_ketsueki lst5 "O" = 2  
