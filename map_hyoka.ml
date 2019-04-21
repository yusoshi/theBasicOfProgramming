#use "hyoka.ml"
(* 目的 : 学生のリスト lst を受け取り成績を入れたリストを返す *)
(* map_hyoka : gakusei_t list -> gakusei_t list *)
let rec map_hyoka lst = match lst with
    [] -> []
  | first :: rest -> hyouka first :: map_hyoka rest

(* Test *)



