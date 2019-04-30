#use "make_eki_list.ml"
(* 目的 : eki_t 型のリストと起点を受け取ったら、起点のみ初期化処理を行ったリストを返す *)
(* shokika : eki_t list -> string -> eki_t lst *)

let shokika lst kiten = 
    List.map 
        (fun eki -> match eki with
	{ namae = n; saitan_kyori = s; temae_list = t } ->
	if n = kiten then
	{ namae = n; saitan_kyori = 0.0; temae_list = [n] }
	else eki)
    	lst

let eki_lst2 = shokika eki_lst "池袋"

