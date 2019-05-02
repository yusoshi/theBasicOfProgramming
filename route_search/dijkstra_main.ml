#use "saitan_wo_bunri.ml" 

(* 目的：未確定の駅のリスト v を必要に応じて更新したリストを返す *) 
(* koushin : eki_t -> eki_t list -> ekikan_t list -> eki_t list *) 
let koushin p v ekikan_list = match p with 
  {namae = pn; saitan_kyori = ps; temae_list = pt} -> 
      List.map (fun q -> match q with 
	       {namae = qn; saitan_kyori = qs; temae_list = qt} -> 
		     let kyori = get_ekikan_kyori pn qn ekikan_list in 
			     if kyori = infinity 
					 then q 
						 else if ps +. kyori < qs 
							     then {namae = qn; saitan_kyori = ps +. kyori; 
									       temae_list = qn :: pt} 
										     else q) 
	     v 

(* 本体 *)
(* 目的 : eki_t型の（未確定の）駅のリストとekikan_t list 型の駅間のリストを受け取ったら、ダイクストラのアルゴリズムにしたがって各駅について最短距離と最短経路が正しく入ったリスト(eki_t list型)を返す *)
(* dijkstra_main : eki_t list -> ekikan_t list -> eki_t list *)
let rec dijkstra_main eki_lst ekikan_lst = match eki_lst with
    [] -> []
    | first :: rest ->
    let (p, v) = saitan_wo_bunri (first :: rest) in
    let eki_lst2 = koushin p v ekikan_lst in
    p :: dijkstra_main eki_lst2 ekikan_lst

(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]} 
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]} 
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []} 
 
 (* 駅リストの例 *) 
 let lst = [eki1; eki2; eki3; eki4] 
  
  (* テスト *) 
  let test1 = dijkstra_main [] global_ekikan_list = [] 
  let test2 = dijkstra_main lst global_ekikan_list = 
    [{namae = "茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}; 
       {namae = "新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]}; 
          {namae = "後楽園"; saitan_kyori = 1.8; temae_list = ["後楽園"; "茗荷谷"]}; 
	     {namae = "池袋"; saitan_kyori = 3.; temae_list = ["池袋"; "新大塚"; "茗荷谷"]}] 
