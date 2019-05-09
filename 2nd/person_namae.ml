#use "person_list.ml"
let lst1 = [person1; person2; person3]

let get_name gakusei = match gakusei with 
    {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; ketsueki = k } -> n 

(* 目的 : person_t型のリストを受けとったら、その中に出てくる人の名前のリストを返す *)
(* person_name : person_t list -> string list *)
let person_name lst = List.map get_name lst

(* テスト *)
let test1 = person_name lst1 = ["浅井"; "宮原"; "中村"]
