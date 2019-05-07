#use "global_ekikan_list.ml"
 
(* 目的 : 漢字駅名２つと駅間リスト(ekikan_t list)を受け取ったら、２駅間の距離を返す *)
(* get_ekikan_kyori : string -> string -> ekikan_t list -> int *)
let rec get_ekikan_kyori eki1 eki2 lst = match lst with
    [] -> infinity
    | { kiten = k; shuten = s; keiyu = e; kyori = y; jikan = j } :: rest ->
    if ((k = eki1 && s = eki2) || (k = eki2 && s = eki1)) then y
    else get_ekikan_kyori eki1 eki2 rest

(* テスト *)
let test1 = get_ekikan_kyori "代々木上原" "代々木公園" global_ekikan_list = 1.0
let test2 = get_ekikan_kyori "代々木公園" "代々木上原" global_ekikan_list = 1.0
     
