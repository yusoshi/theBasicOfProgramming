(* ���餫���� ex10_11.ml, ex15_5.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex10_11.ml" (* get_ekikan_kyori ����� *) 
#use "ex15_5.ml" (* saitan_wo_bunri ����� *) 
 
(* ex16_3.ml ���ɤ߹���� eki_t ������������١��ɤ߹��ޤ�Ƥ��ޤ��Τ� 
   koushin �������ʲ���ľ�ܡ�Ÿ�� *) 
 
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
 
(* ��Ū��̤����ؤΥꥹ�Ȥȱش֥ꥹ�Ȥ��顢�Ʊؤؤκ�ûϩ����� *) 
(* dijkstra_main : eki_t list -> ekikan_t list -> eki_t list *) 
let rec dijkstra_main eki_list ekikan_list = match eki_list with 
    [] -> [] 
  | first :: rest -> 
      let (saitan, nokori) = saitan_wo_bunri (first :: rest) in 
      let eki_list2 = koushin saitan nokori ekikan_list in 
      saitan :: dijkstra_main eki_list2 ekikan_list 
 
(* eki_list2 �� eki_list ���Ĺ����ɬ���ҤȤ�û���Τǡ���ߤ��� *) 
 
(* �ؤ��� *) 
let eki1 = {namae="����"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="������"; saitan_kyori = 1.2; temae_list = ["������"; "謲�ë"]} 
let eki3 = {namae="謲�ë"; saitan_kyori = 0.; temae_list = ["謲�ë"]} 
let eki4 = {namae="��ڱ�"; saitan_kyori = infinity; temae_list = []} 
 
(* �إꥹ�Ȥ��� *) 
let lst = [eki1; eki2; eki3; eki4] 
 
(* �ƥ��� *) 
let test1 = dijkstra_main [] global_ekikan_list = [] 
let test2 = dijkstra_main lst global_ekikan_list = 
  [{namae = "謲�ë"; saitan_kyori = 0.; temae_list = ["謲�ë"]}; 
   {namae = "������"; saitan_kyori = 1.2; temae_list = ["������"; "謲�ë"]}; 
   {namae = "��ڱ�"; saitan_kyori = 1.8; temae_list = ["��ڱ�"; "謲�ë"]}; 
   {namae = "����"; saitan_kyori = 3.; temae_list = ["����"; "������"; "謲�ë"]}] 
