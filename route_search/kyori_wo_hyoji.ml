#use "get_ekikan_kyori.ml"
#use "romaji_to_kanji.ml"


(* 目的 : ローマ字の駅名を二つ受け取ってきたら、その間の距離を調べ、直接繋がっている場合は「A駅からB駅までは○kmです」という文字列を返し、繋がっていない場合は「A駅とB駅はつながっていません」という文字列を返す *)
(* kyori_wo_hyoji : string -> string -> string *)
let kyori_wo_hyoji eki1 eki2 = 
    let kanji_eki1 = romaji_to_kanji eki1 global_ekimei_list in
    if kanji_eki1 = "Not Found" then eki1 ^ "は存在しない"
    else
        let kanji_eki2 = romaji_to_kanji eki2 global_ekimei_list in
	if kanji_eki2 = "Not Found" then eki2 ^ "は存在しない"
	else
	    let kyori = get_ekikan_kyori kanji_eki1 kanji_eki2 global_ekikan_list in
	    if kyori = infinity
	    then kanji_eki1 ^ "駅と" ^ kanji_eki2 ^ "駅はつながっていません"
	    else kanji_eki1 ^ "駅から" ^ kanji_eki2 ^ "駅までは" ^ string_of_float kyori ^ "kmです"

(* Test *)
let test1 = kyori_wo_hyoji "myogadani" "shinotsuka" = "茗荷谷駅から新大塚駅までは1.2kmです"
let test2 = kyori_wo_hyoji "mygadani" "shinotsuka" = "mygadaniは存在しない"
let test3 = kyori_wo_hyoji "myogadani" "suka" = "sukaは存在しない"
let test4 = kyori_wo_hyoji "myogadani" "yoyogiuehara" = "茗荷谷駅と代々木上原駅はつながっていません"



