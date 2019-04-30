#use "global_ekimei_list.ml"

type eki_t = {
    namae: string;           (* 漢字の駅名 *)
    saitan_kyori: float;       (* その駅までの最短距離 *)
    temae_list: string list;       (* その駅に到達するまでに経由した駅名のリスト *)
}

(* 目的 : ekimei_t 型のリストと起点(漢字)を受け取ったら、初期化した状態で eki_t 型のリストを返す *)
(* make_initial_eki_list : -> ekimet_t list -> eki_t list *)
let make_initial_eki_list lst kiten = 
    List.map 
    (fun ekimei = match ekimei with 
    { kanji = k; kana = ka; romaji = r; shozoku = s } ->
    if k = kiten then { namae = k; saitan_kyori = 0.0; temae_list = [k] }
    else { namae = k; saitan_kyori = infinity; temae_list = [] }
    ) lst


