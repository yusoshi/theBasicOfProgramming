#use "koushin1.ml"

(* 目的 : 直前に確定した駅p(eki_t型)と未確定の駅のリストv(eki_t list)を受け取ったら、必要な更新処理を行った後の未確定の駅のリストを返す *)
(* koushin : eki_t -> eki_t list -> eki_t list *)
let koushin p v =
    List.map (fun q -> match (p, q) with
                 ({namae = pn; saitan_kyori = ps; temae_list = pt},
                  {namae = qn; saitan_kyori = qs; temae_list = qt }) ->
                 let kyori = get_ekikan_kyori pn qn global_ekikan_list in
                     if kyori = infinity then q
    	         else if ps +. kyori < qs then 
                     {namae = qn; saitan_kyori = ps +. kyori; temae_list = qn :: pt}
                 else q 
	    ) v


(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]} 
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]} 
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []} 
 
 (* 駅リストの例 *) 
 let lst = [eki1; eki2; eki3; eki4] 
  
  (* テスト *) 
  let test1 = koushin eki2 [] = [] 
  let test2 = koushin eki2 lst = 
   [{namae="池袋"; saitan_kyori = 3.0; temae_list = ["池袋"; "新大塚"; "茗荷谷"]}; 
     eki2; eki3; eki4] 

