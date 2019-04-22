#use "person_list.ml"

let getName person = match person with
    { name = n; height = h; weight = w; birth_date = bi; blood_type = bl } ->
	n

(* 目的 : person_t 型のリストを受け取ったら、その中に出てくる人の名前のリストを返す *)
(* person_namae : person_t list -> string list *)
let person_namae lst = List.map getName lst



(* test *)
let test1 = person_namae lst1 = [] 
let test2 = person_namae lst2 = ["Aさん"; "Dさん"] 
