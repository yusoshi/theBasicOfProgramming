#use "make_eki_list.ml"
(* 目的 : eki_t 型のリストと起点を受け取ったら、起点のみ初期化処理を行ったリストを返す *)
(* shokika : eki_t list -> string -> eki_t lst *)
let rec shokika lst kiten = match lst with
    [] -> []
    | ({ namae = namae; saitan_kyori = saitan_kyori; temae_list = temae_list } as first ) :: rest ->
        if namae = kiten then
	    { namae = namae; saitan_kyori = 0.0; temae_list = [namae] } :: shokika rest kiten
        else
	    first :: shokika rest kiten

let eki_lst2 = shokika eki_lst "池袋"
