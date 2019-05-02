(* あらかじめ ex10_10.ml, ex16_4.ml を読み込んでおく必要あり *) 
#use "romaji_to_kanji.ml" (* romaji_to_kanji の定義 *) 
#use "dijkstra_main.ml" (* dijkstra_main の定義 *) 

    (* ex14_12.ml を読み込むと ekimei_t 型、eki_t 型の定義が２度、読み込まれて 
     しまうので make_initial_eki_list の定義を以下に直接、展開 *) 

    (* 目的：ekimei list から eki list を作る *) 
(* make_initial_eki_list : ekimei_t list -> string -> eki_t list *) 
    let make_initial_eki_list ekimei_list kiten = 
    List.map (fun ekimei -> match ekimei with 
	    {kanji = k; kana = a; romaji = r; shozoku = s} -> 
	    if k = kiten 
	    then {namae = k; saitan_kyori = 0.; temae_list = [k]} 
	    else {namae = k; saitan_kyori = infinity; temae_list = []}) 
    ekimei_list 

    (* 目的：受け取った eki_list から shuten のレコードを探し出す *) 
(* find : string -> eki_t list -> eki_t *) 
    let rec find shuten eki_list = match eki_list with 
    [] -> {namae = ""; saitan_kyori = infinity; temae_list = []} 
    | ({namae = n; saitan_kyori = s; temae_list = t} as first) :: rest -> 
    if n = shuten then first else find shuten rest 

    (* 目的：始点と終点を受け取ったら、最短路を求め、終点のレコードを返す *) 
(* dijkstra : string -> string -> eki_t *) 
    let dijkstra romaji_kiten romaji_shuten = 
    let kiten = romaji_to_kanji romaji_kiten global_ekimei_list in 
    let shuten = romaji_to_kanji romaji_shuten global_ekimei_list in 
    let eki_list = make_initial_eki_list global_ekimei_list kiten in 
    let eki_list2 = dijkstra_main eki_list global_ekikan_list in 
    find shuten eki_list2 

(* テスト *) 
let test1 = dijkstra "shibuya" "gokokuji"
