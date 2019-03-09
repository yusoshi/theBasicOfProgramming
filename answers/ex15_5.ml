(* ���餫���� ex12_1.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex12_1.ml" (* eki_t ����� *) 
 
(* ��Ū��������ä��ؤΥꥹ�Ȥ򡢺�û��Υ�Ǿ��αؤȤ���ʳ���ʬΥ���� *) 
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *) 
let saitan_wo_bunri eki_list = 
  List.fold_right (fun first (p, v) -> 
		     match (first, p) with 
		       ({namae = fn; saitan_kyori = fs; temae_list = ft}, 
			{namae = sn; saitan_kyori = ss; temae_list = st}) -> 
			 if sn = "" then (first, v) 
			 else if fs < ss then (first, p :: v) 
			 else (p, first :: v)) 
		  eki_list 
		  ({namae = ""; saitan_kyori = infinity; temae_list = []}, []) 
 
(* ���뤤�� *) 
 
(* ��Ū��������ä��ؤΥꥹ�Ȥ򡢺�û��Υ�Ǿ��αؤȤ���ʳ���ʬΥ���� *) 
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *) 
let saitan_wo_bunri eki_list = match eki_list with 
    [] -> ({namae = ""; saitan_kyori = infinity; temae_list = []}, []) 
  | first :: rest -> 
      List.fold_right (fun first (p, v) -> 
			 match (first, p) with 
			   ({namae = fn; saitan_kyori = fs; temae_list = ft}, 
			    {namae = sn; saitan_kyori = ss; temae_list = st}) -> 
			     if fs < ss then (first, p :: v) 
			     else (p, first :: v)) 
		      rest 
		      (first, []) 
 
(* �ؤ��� *) 
let eki1 = {namae="����"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="������"; saitan_kyori = 1.2; temae_list = ["������"; "謲�ë"]} 
let eki3 = {namae="謲�ë"; saitan_kyori = 0.; temae_list = ["謲�ë"]} 
let eki4 = {namae="��ڱ�"; saitan_kyori = infinity; temae_list = []} 
 
(* �إꥹ�Ȥ��� *) 
let lst = [eki1; eki2; eki3; eki4] 
 
(* �ƥ��� *) 
let test = saitan_wo_bunri lst = (eki3, [eki2; eki1; eki4]) 
 
(* ex15_4.ml �κǸ�Υ����Ȥ˽񤤤��̤ꡢ[eki2; eki1; eki4] �ν��֤ˤ� 
   ��̣���ʤ����ºݡ�����������줿��̤� ex15_4.ml ������줿��̤���� 
   ��Ƚ��֤��ۤʤäƤ��롣����ϡ�������Ǥ��������������ܽ�Υƥ��� 
   ˡ�θ³��򼨤��Ƥ��롣*) 
