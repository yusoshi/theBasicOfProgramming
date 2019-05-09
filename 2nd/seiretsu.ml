#use "global_ekimei_list.ml"

(* 目的 : ekimei_t型のリストを受け取ったら、それを平仮名の順に整列し、さらに駅の重複を取り除いたekimet_t型のリストを返す *)
(* seiretsu : ekimei_t list -> ekimei_t list *)
let rec seiretsu lst = match lst with
    [] -> []
    | first :: rest -> []

(* テストデータ *)
let eki1 = {kanji="永田町"; kana="ながたちょう"; romaji="nagatacho"; shozoku="半蔵門線"}
let eki2 = {romaji="nagatacho"; kana="ながたちょう"; kanji="永田町"; shozoku="有楽町線"}
let lst1 = []
let lst2 = [eki1; eki2]

(* テスト *)
let test1 = seiretsu lst1 = []
let test2 = seiretsu lst2 = [eki1]
