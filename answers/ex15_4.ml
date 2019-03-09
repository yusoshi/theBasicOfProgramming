(* ���餫���� ex12_1.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex12_1.ml" (* eki_t ����� *) 
 
(* ��Ū��������ä��ؤΥꥹ�Ȥ򡢺�û��Υ�Ǿ��αؤȤ���ʳ���ʬΥ���� *) 
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *) 
let rec saitan_wo_bunri eki_list = match eki_list with 
    [] -> ({namae = ""; saitan_kyori = infinity; temae_list = []}, []) 
  | first :: rest -> 
      let (p, v) = saitan_wo_bunri rest in 
      match (first, p) with 
	({namae = fn; saitan_kyori = fs; temae_list = ft}, 
	 {namae = sn; saitan_kyori = ss; temae_list = st}) -> 
	  if sn = "" then (first, v) 
	  else if fs < ss then (first, p :: v) 
	  else (p, first :: v) 
 
(* ���뤤�� *) 
 
(* ��Ū��������ä��ؤΥꥹ�Ȥ򡢺�û��Υ�Ǿ��αؤȤ���ʳ���ʬΥ���� *) 
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *) 
let rec saitan_wo_bunri eki_list = match eki_list with 
    [] -> ({namae = ""; saitan_kyori = infinity; temae_list = []}, []) 
  | first :: [] -> (first, []) 
  | first :: rest -> 
      let (p, v) = saitan_wo_bunri rest in 
      match (first, p) with 
	({namae = fn; saitan_kyori = fs; temae_list = ft}, 
	 {namae = sn; saitan_kyori = ss; temae_list = st}) -> 
	  if fs < ss then (first, p :: v) 
	  else (p, first :: v) 
 
(* �ؤ��� *) 
let eki1 = {namae="����"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="������"; saitan_kyori = 1.2; temae_list = ["������"; "謲�ë"]} 
let eki3 = {namae="謲�ë"; saitan_kyori = 0.; temae_list = ["謲�ë"]} 
let eki4 = {namae="��ڱ�"; saitan_kyori = infinity; temae_list = []} 
 
(* �إꥹ�Ȥ��� *) 
let lst = [eki1; eki2; eki3; eki4] 
 
(* �ƥ��� *) 
let test = saitan_wo_bunri lst = (eki3, [eki1; eki2; eki4]) 
 
(* [eki1; eki2; eki4] �ν��֤ϳƱؤκ�û��Υ���ͤˤ�ä��Ѥ�ꤦ�롣 
   ���ν��֤�ƥ��Ȥ�ͽ�ۤ��뤳�Ȥˤϰ�̣���ʤ��Τǡ���Τ褦�ʥƥ��Ȥ� 
   �����ϡ�ñ�� 
 
   let test = saitan_wo_bunri lst 
 
   �Ȥ��Ʒ�̤�ʬ�ǳΤ���������ɤ����⤷��ʤ���*) 
