(* ���餫���� ex09_10.ml, ex12_1.ml, ex17_13.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex09_10.ml" (* ekikan_t, global_ekikan_list ����� *) 
#use "ex12_1.ml" (* eki_t ����� *) 
#use "ex17_13.ml" (* inserts_ekikan ����� *) 
 
(* list �� *) 
 
(* ��Ū���դ��Ĥαؤδ֤ε�Υ����� *) 
(* ���Ĥ���ʤ��ä����㳰 Not_found �򵯤��� *) 
(* get_ekikan_kyori : string -> string -> ekikan_t list -> float *) 
let rec get_ekikan_kyori eki1 eki2 lst = match lst with 
    [] -> raise Not_found 
  | {kiten = k; shuten = s; keiyu = y; kyori = r; jikan = j} :: rest -> 
     if (eki1 = k && eki2 = s) || (eki1 = s && eki2 = k) 
     then r 
     else get_ekikan_kyori eki1 eki2 rest 
 
(* �ƥ��� *) 
let test1 = get_ekikan_kyori "謲�ë" "������" global_ekikan_list = 1.2 
(* let test2 = get_ekikan_kyori "謲�ë" "����" global_ekikan_list *) 
   (* Not_found �򵯤��� *) 
let test3 = get_ekikan_kyori "���" "���Į" global_ekikan_list = 0.6 
 
(* ��Ū��̤����αؤΥꥹ�� v ��ɬ�פ˱����ƹ��������ꥹ�Ȥ��֤� *) 
(* koushin : eki_t -> eki_t list -> ekikan_t list -> eki_t list *) 
let koushin p v ekikan_list = match p with 
  {namae = pn; saitan_kyori = ps; temae_list = pt} -> 
    List.map (fun q -> match q with 
	       {namae = qn; saitan_kyori = qs; temae_list = qt} -> 
		 try 
		   let kyori = get_ekikan_kyori pn qn ekikan_list in 
		   if ps +. kyori < qs 
		   then {namae = qn; saitan_kyori = ps +. kyori; 
				     temae_list = qn :: pt} 
		   else q 
		 with Not_found -> q) 
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
 
(* tree �� *) 
 
(* ��Ū���դ��Ĥαؤδ֤ε�Υ����� *) 
(* ���Ĥ���ʤ��ä����㳰 Not_found �򵯤��� *) 
(* get_ekikan_kyori : string -> string -> ekikan_tree_t -> float *) 
let rec get_ekikan_kyori eki1 eki2 tree = match tree with 
    Empty -> raise Not_found 
  | Node (left, k, lst, right) -> 
      if eki1 < k then get_ekikan_kyori eki1 eki2 left 
      else if k < eki1 then get_ekikan_kyori eki1 eki2 right 
      else List.assoc eki2 lst 
 
(* �ƥ��� *) 
let global_ekikan_tree = inserts_ekikan Empty global_ekikan_list 
let test1 = get_ekikan_kyori "謲�ë" "������" global_ekikan_tree = 1.2 
(* let test2 = get_ekikan_kyori "謲�ë" "����" global_ekikan_tree *) 
   (* Not_found �򵯤��� *) 
let test3 = get_ekikan_kyori "���" "���Į" global_ekikan_tree = 0.6 
 
(* ��Ū��̤����αؤΥꥹ�� v ��ɬ�פ˱����ƹ��������ꥹ�Ȥ��֤� *) 
(* koushin : eki_t -> eki_t list -> ekikan_tree_t -> eki_t list *) 
let koushin p v ekikan_tree = match p with 
  {namae = pn; saitan_kyori = ps; temae_list = pt} -> 
    List.map (fun q -> match q with 
	       {namae = qn; saitan_kyori = qs; temae_list = qt} -> 
		 try 
		   let kyori = get_ekikan_kyori pn qn ekikan_tree in 
		   if ps +. kyori < qs 
		   then {namae = qn; saitan_kyori = ps +. kyori; 
				     temae_list = qn :: pt} 
		   else q 
		 with Not_found -> q) 
	     v 
 
(* �ؤ��� *) 
let eki1 = {namae="����"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="������"; saitan_kyori = 1.2; temae_list = ["������"; "謲�ë"]} 
let eki3 = {namae="謲�ë"; saitan_kyori = 0.; temae_list = ["謲�ë"]} 
let eki4 = {namae="��ڱ�"; saitan_kyori = infinity; temae_list = []} 
 
(* �إꥹ�Ȥ��� *) 
let lst = [eki1; eki2; eki3; eki4] 
 
(* �ƥ��� *) 
let test1 = koushin eki2 [] global_ekikan_tree = [] 
let test2 = koushin eki2 lst global_ekikan_tree = 
 [{namae="����"; saitan_kyori = 3.0; temae_list = ["����"; "������"; "謲�ë"]}; 
  eki2; eki3; eki4] 
