#use "gakusei_list.ml"

(* 目的 : firstの得点をrest_resultに足す*)
let add_score first rest_result = match first with
    { namae = n; tensuu = t; seiseki = s } -> t + rest_result

(* 目的 : 学生リストを受け取ったら、全員の特定の合計を返す *)
(* gakusei_sum -> gakusei_t list -> int *)
let gakusei_sum lst = List.fold_right (fun { namae = n; tensuu = t; seiseki = s } rest_result -> t + rest_result) lst 0

(* テスト *)
let test1 = gakusei_sum lst1 = 0
let test2 = gakusei_sum lst2 = 240
let test3 = gakusei_sum lst3 = 400
