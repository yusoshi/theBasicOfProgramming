(* ���餫���� ex10_11.ml, ex12_1.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex10_11.ml" (* get_ekikan_kyori ����� *) 
#use "ex12_1.ml" (* eki_t ����� *) 
 
(* ��Ū��̤����αؤΥꥹ�� v ��ɬ�פ˱����ƹ��������ꥹ�Ȥ��֤� *) 
(* koushin : eki_t -> eki_t list -> ekikan_t list -> eki_t list *) 
let koushin p v ekikan_list = 
  List.map (fun q -> match (p, q) with 
	     ({namae = pn; saitan_kyori = ps; temae_list = pt}, 
	      {namae = qn; saitan_kyori = qs; temae_list = qt}) -> 
		let kyori = get_ekikan_kyori pn qn ekikan_list in 
		if kyori = infinity 
		then q 
		else if ps +. kyori < qs 
		then {namae = qn; saitan_kyori = ps +. kyori; 
				  temae_list = qn :: pt} 
		else q) 
	   v 
 
(* �ޤ��� *) 
 
(* ��Ū��̤����αؤΥꥹ�� v ��ɬ�פ˱����ƹ��������ꥹ�Ȥ��֤� *) 
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
 
(* �ؤ��� *) 
let eki1 = {namae="����"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="������"; saitan_kyori = 1.2; temae_list = ["������"; "謲�ë"]} 
let eki3 = {namae="謲�ë"; saitan_kyori = 0.; temae_list = ["謲�ë"]} 
let eki4 = {namae="��ڱ�"; saitan_kyori = infinity; temae_list = []} 
 
(* �إꥹ�Ȥ��� *) 
let lst = [eki1; eki2; eki3; eki4] 
 
(* �ƥ��� *) 
let test1 = koushin eki2 [] global_ekikan_list = [] 
let test2 = koushin eki2 lst global_ekikan_list = 
 [{namae="����"; saitan_kyori = 3.0; temae_list = ["����"; "������"; "謲�ë"]}; 
  eki2; eki3; eki4] 
