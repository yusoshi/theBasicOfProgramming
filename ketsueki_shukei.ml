#use "person_list.ml"

(* 目的 : person_t 型のリストを受け取ったら各血液型の人数を集計して返す *)
(* ketsueki_shukei : person_t list -> int * int * int * int *)
let rec ketsueki_shukei lst = match lst with
    [] -> (0, 0, 0, 0)
  | ({ name = n; height = h; weight = w; birth_date = bi; blood_type = bl } as person) :: rest ->
  let shukei_rest = ketsueki_shukei rest in
    match shukei_rest with 
	(a, b, o, ab) -> 
	    if bl = "A" then (a + 1, b, o, ab)
	    else if bl = "B" then (a, b + 1, o, ab)
	    else if bl = "O" then (a, b, o + 1, ab)
	    else (a, b, o, ab + 1)

(* test *)
let test1 = ketsueki_shukei lst1 = (0, 0, 0, 0)
let test2 = ketsueki_shukei lst2 = (1, 0, 0, 1)
let test3 = ketsueki_shukei lst3 = (1, 1, 1, 1)
let test4 = ketsueki_shukei lst4 = (1, 1, 1, 0)

