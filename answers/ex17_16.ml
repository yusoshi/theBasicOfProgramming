(* ���餫���� ex12_1.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex12_1.ml" (* eki_t ����� *) 
 
(* ��Ū��������ä��ؤΥꥹ�Ȥ򡢺�û��Υ�Ǿ��αؤȤ���ʳ���ʬΥ���� *) 
(* saitan_wo_bunri : eki_t -> eki_t list -> eki_t * eki_t list *) 
let rec saitan_wo_bunri eki eki_list = match eki_list with 
    [] -> (eki, []) 
  | first :: rest -> 
      let (p, v) = saitan_wo_bunri first rest in 
      match (eki, p) with 
	({namae = fn; saitan_kyori = fs; temae_list = ft}, 
	 {namae = sn; saitan_kyori = ss; temae_list = st}) -> 
	  if fs < ss then (eki, p :: v) 
	  else (p, eki :: v) 
 
(* �ޤ��� *) 
 
(* ��Ū��������ä��ؤΥꥹ�Ȥ򡢺�û��Υ�Ǿ��αؤȤ���ʳ���ʬΥ���� *) 
(* saitan_wo_bunri : eki_t -> eki_t list -> eki_t * eki_t list *) 
let saitan_wo_bunri eki eki_list = 
  List.fold_right (fun first (p, v) -> 
		     match (first, p) with 
		       ({namae = fn; saitan_kyori = fs; temae_list = ft}, 
			{namae = sn; saitan_kyori = ss; temae_list = st}) -> 
			 if fs < ss then (first, p :: v) 
			 else (p, first :: v)) 
		  eki_list 
		  (eki, []) 
 
(* �ؤ��� *) 
let eki1 = {namae="����"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="������"; saitan_kyori = 1.2; temae_list = ["������"; "謲�ë"]} 
let eki3 = {namae="謲�ë"; saitan_kyori = 0.; temae_list = ["謲�ë"]} 
let eki4 = {namae="��ڱ�"; saitan_kyori = infinity; temae_list = []} 
 
(* �ƥ��� *) 
let test = saitan_wo_bunri eki1 [eki2; eki3; eki4] = (eki3, [eki2; eki1; eki4]) 
