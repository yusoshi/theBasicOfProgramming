#use "global_ekimei_list.ml"

(* ローマ字の駅名と駅名リスト(ekimei_t list)を受け取ったら、その駅の漢字表示を文字列で返す *)
(* romaji_to_kanji : string ekimeit_t list -> string *) 
let rec romaji_to_kanji r_ekimei lst = match lst with
    [] -> ""
    | {kanji = k; kana = a; romaji = r; shozoku = s} :: rest ->
    if r_ekimei = r then k 
    else romaji_to_kanji r_ekimei rest

(* テスト *)
let test1 = romaji_to_kanji "shibuya" global_ekimei_list = "渋谷" 
