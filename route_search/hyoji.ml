(* 駅（漢字の駅名、ひらがなの駅名、ローマ字の駅名、所属する路線名）を表す型 *)
type ekimei_t = {
    kanji : string;
    kana : string;
    romaji : string;
    shozoku : string;
}

(* 駅間(起点の駅名、 終点の駅名、経由する路線名、２駅間の距離、２駅間の所要時間）を表す型 *)
type ekikan_t = {
    kiten : string; (* 起点の駅名 (漢字） *)
    shuten : string; (* 終点の駅名 (漢字） *)
    keiyu : string; (* 経由する路線名 (漢字） *)
    kyori : float; (* ２駅間の距離（km, 実数） *)
    jikan : int; (* ２駅間の所要時間（分, 整数） *)
}

(* 目的 : ekimei_t型のデータを受け取ったら、路線名と駅名（かな）を返す *)
(* hyoji : ekimei_t -> string *)
let hyoji ekimei_t = match ekimei_t with
    { kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku } ->
	shozoku ^ ", " ^ kanji ^ "（" ^ kana ^ "）" 

(* test *)
let test1 = hyoji { kanji = "茗荷谷"; kana = "みょうがだに"; romaji = "myogadani"; shozoku = "丸ノ内線" } = "丸ノ内線, 茗荷谷（みょうがだに）"
let test2 = hyoji { kanji = "大塚"; kana = "おおつか"; romaji = "otsuka"; shozoku = "山手線" } = "山手線, 大塚（おおつか）"
