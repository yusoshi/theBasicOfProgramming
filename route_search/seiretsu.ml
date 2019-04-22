#use "global_ekimei_list.ml"

(* 目的 : ekimet_t 型のリストと ekimei_t 型を受け取ったら、昇順に並んでいるlstの正しい位置にekimei_tを挿入する *)
(* ekimei_insert : ekimei_t list -> ekimei_t -> ekimei_t list *)
let rec ekimei_insert lst ekimei0 = match lst with
    [] -> [ekimei0]
    | ({ kanji = kanji; kana = kana; shozoku = shozoku } as ekimei) :: rest ->
        match ekimei0 with { kanji = kanji0; kana = kana0; shozoku = shozoku0 } ->
	    if kana = kana0 then ekimei_insert rest ekimei0
	    else if kana < kana0 then ekimei :: ekimei_insert rest ekimei0
	    else ekimei0 :: lst

(* 目的 : ekimei_t 型のリストを受け取ったら、それをひらがなの順に整列し、さらに駅の重複を取り除いた ekimei_t 型のリストを返す*)
(* seiretsu : ekimei_t list -> ekimei_t list *)
let rec seiretsu lst = match lst with
    [] -> []
    | ( { kanji = kanji; kana = kana; shozoku = shozoku } as first )  :: rest ->
         ekimei_insert (seiretsu rest) first 



