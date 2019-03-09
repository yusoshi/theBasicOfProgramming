#use "person_list.ml" 

(* ketsueki_shukei : person_t 型のリストを受け取ったら、各血液型の人数を返す *)
    let rec ketsueki_shukei lst = match lst with
    [] -> (0, 0, 0, 0) 
  | { name = n; height = h; weight = w; birth_date = bi; blood_type = bl } :: rest -> 
    let (a, b, o, ab) = ketsueki_shukei rest in
	if bl = "A" then (a + 1, b, o, ab) 
	else if bl = "B" then (a, b + 1, o, ab) 
	else if bl = "O" then (a, b, o + 1, ab) 
	else (a, b, o, ab + 1) 

(* 目的 : person_t 型のリストを受け取ったら、4つの血液型のうち最も人数の多かった血液型を返す *)
(* saita_ketsueki : person_t list -> string *)
let saita_ketsueki lst = 
    let (a, b, o, ab) = ketsueki_shukei lst in
    let max_ketsueki = max (max a o) (max b ab) in
    if max_ketsueki = a then "A"
    else if max_ketsueki = b  then "B"
    else if max_ketsueki = o  then "O"
    else "AB"


(* test *)
let test1 = saita_ketsueki lst1 = "A"
let test2 = saita_ketsueki lst2 = "A"
let test3 = saita_ketsueki lst3 = "A"
let test4 = saita_ketsueki lst4 = "A"
let test5 = saita_ketsueki lst5 = "AB"
let test6 = saita_ketsueki lst6 = "B"
