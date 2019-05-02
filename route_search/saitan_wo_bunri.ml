#use "make_eki_list.ml"
#use "get_ekikan_kyori.ml"

(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]} 
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]} 
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []} 
 
 (* 駅リストの例 *) 
 let lst = [eki1; eki2; eki3; eki4] 

(* 本体 *)
(* 目的 : eki_t型のリストを受け取ったら「最短距離最小の駅」と「最短距離最小の駅以外から「なるリストの組を返す *)
(* saitan_wo_bunri : eki_t list -> eki_t list *)
let rec saitan_wo_bunri eki_lst = match eki_lst with
    [] -> ({namae = ""; saitan_kyori = infinity; temae_list = []}, [])
    | first :: [] -> (first, [])
    | first :: rest ->
        List.fold_right (fun first (p, v) ->
	    match (first, p) with
	    ({namae = fn; saitan_kyori = fs; temae_list = ft},
	    {namae = sn; saitan_kyori = ss; temae_list = st}) ->
	    if fs < ss then (first, p :: v)
	    else (p, first :: v))
	 rest
	(first, [])

     

(* デバッグ *)
let test1 = saitan_wo_bunri lst  
