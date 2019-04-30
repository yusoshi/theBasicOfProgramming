(* 目的 : ２つのリストを受け取ったら、それらをマージするa *)
(* append2 : 'a list -> 'a list -> 'b list *)
let append2 lst lst2 =
    List.fold_right (fun first rest_result -> first :: rest_result) lst lst2

(* テスト *)
let test1 = append2 [1] [2] = [1; 2]
let test2 = append2 [2; 1] [2] = [2; 1; 2]
