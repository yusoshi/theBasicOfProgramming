#use "gakusei_list.ml"

(* 目的 : 学生一人(gakusei_t)を受け取ったら、成績がAか判定する *)
let is_A gakusei = match gakusei with
    { namae = n; tensuu = t; seiseki = s } ->
    if s = "A" then true
    else false
	
(* 目的 : 学生リスト(gakusei_t list)を受け取ったら、成績がAの学生の人数をかえす *)
let countA_filter lst = List.length(List.filter (fun { namae = n; tensuu = t; seiseki = s } -> s = "A") lst)

let test1 = countA_filter lst1 = 0 
let test2 = countA_filter lst2 = 1 
let test3 = countA_filter lst3 = 2 
