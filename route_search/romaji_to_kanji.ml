#use "global_ekimei_list.ml" 

(* 目的 : ローマ字の駅名と駅名リスト（ekimei_t list型)を受け取ったら、その駅の漢字表記を文字列で返す *)
(* romaji_to_kanji : string -> ekimei_t list -> string *)
let rec romaji_to_kanji ekimei lst = match lst with
    [] -> "Not Found"
  | { kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku } :: rest -> 
    if ekimei = romaji then kanji
    else romaji_to_kanji ekimei rest



(* Test *)
(*
let test1 = romaji_to_kanji "" global_ekimei_list = "Not Found"
let test2 = romaji_to_kanji "myogadani" global_ekimei_list = "茗荷谷"
*)

