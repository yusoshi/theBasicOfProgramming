#use "gakusei_list.ml"
(* 目的 : 学生リスト lst のうち成績が seiseki0 の人の数を返す *)
(* count : gakusei_t list -> string -> int *)
let rec count lst seiseki0 = match lst with
    [] -> 0
  | { namae = n; tensuu = t; seiseki = s } :: rest ->
    if s = seiseki0 then 1 + count rest seiseki0
    else count rest seiseki0
  
(* test *)
let test1 = count lst3 "A" = 2  
let test2 = count lst3 "B" = 1  
let test2 = count lst1 "B" = 0  

