#use "global_ekikan_list.ml"

(* 目的 : 漢字の駅名をふたつと駅間リスト（ekikan_t list) を受け取ったら、駅間リストの中からその２駅間の距離を返す関数 *)
(* get_ekikan_kyori : stirng -> string -> ekikan_t list -> float *)
let rec get_ekikan_kyori eki1 eki2 lst = match lst with
    [] -> infinity 
  | {kiten = kiten; shuten = shuten; keiyu = keiyu; kyori = kyori; jikan = jikan } :: rest ->
     if ((eki1 = kiten && eki2 = shuten) || (eki1 = shuten && eki2 = kiten)) then kyori
     else get_ekikan_kyori eki1 eki2 rest
    

(* Test *)
(*
let test1 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list = 1.2
let test2 = get_ekikan_kyori "国会議事堂前" "赤坂" global_ekikan_list = 0.8 
let test3 = get_ekikan_kyori "日比谷" "赤坂" global_ekikan_list = infinity 
*)
