#use "global_ekimei_list.ml"

type eki_t = {
    namae: string;           (* 漢字の駅名 *)
    saitan_kyori: float;       (* その駅までの最短距離 *)
    temae_list: string list;       (* その駅に到達するまでに経由した駅名のリスト *)
}

(* 目的 : ekimei_t 型のリストを受け取ったら、その駅名を使って eki_t 型のリストをつくる *)
(* make_eki_list : ekimei_t list -> eki_t list *)
let rec make_eki_list lst = match lst with
    [] -> []
    | { kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku } :: rest ->
       {  namae = kanji; saitan_kyori = infinity; temae_list = [] } :: make_eki_list rest

let eki_lst = make_eki_list global_ekimei_list
