#use "global_ekimei_list.ml"
 
(* eki_t型定義 *)
type eki_t = {
    namae : string;
    saitan_kyori : float;
    temae_list : string list;
}

 (* 本体 *)
(* 目的 : ekimei_t型のリストを受け取ったらその駅名を使ってeki_t型のリストを作成する *)
(* make_eki_list : ekimei_t list -> eki_t list *)
let rec make_eki_list ekimei_lst = match ekimei_lst with
    [] -> []
    | ({kanji = k; kana = a; romaji = r; shozoku = s } as first) :: rest ->        {namae = k; saitan_kyori = infinity; temae_list = []} :: make_eki_list rest

(* テストデータ *)
let eki1 = {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}
let eki2 ={kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}
let eki3 ={kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}
let eki4 ={kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}
let ekimei_list = [eki1; eki2; eki3; eki4]


(* テスト *)
let test1 = make_eki_list ekimei_list = [
   {namae = "代々木上原"; saitan_kyori = infinity; temae_list = []}; 
   {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []}; 
   {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []}; 
   {namae = "表参道"; saitan_kyori = infinity; temae_list = []} 
   ]
   

