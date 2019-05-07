(* 目的 : ２つのリストをマージする *)
(* append : 'a list -> 'a list -> 'a list *)
let rec append lst1 lst2 = match lst1 with
    [] -> lst2
    | first :: rest -> first :: append rest lst2

(* テスト *)
let test1 = append [1;2] [3;4] = [1; 2; 3 ;4]
