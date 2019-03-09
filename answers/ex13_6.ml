(* ���餫���� ex10_11.ml, ex12_1.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex10_11.ml" 
#use "ex12_1.ml" 
 
(* �ؤ��� *) 
let eki1 = {namae="����"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="������"; saitan_kyori = 1.2; temae_list = ["������"; "謲�ë"]} 
let eki3 = {namae="謲�ë"; saitan_kyori = 0.; temae_list = ["謲�ë"]} 
let eki4 = {namae="��ڱ�"; saitan_kyori = infinity; temae_list = []} 
 
(* ��Ū��̤����α� q ��ɬ�פ˱����ƹ��������ؤ��֤� *) 
(* koushin1 : eki_t -> eki_t -> eki_t *) 
let koushin1 p q = match (p, q) with 
  ({namae = pn; saitan_kyori = ps; temae_list = pt}, 
   {namae = qn; saitan_kyori = qs; temae_list = qt}) -> 
    let kyori = get_ekikan_kyori pn qn global_ekikan_list in 
    if kyori = infinity 
    then q 
    else if ps +. kyori < qs 
    then {namae = qn; saitan_kyori = ps +. kyori; temae_list = qn :: pt} 
    else q 
 
(* �ƥ��� *) 
let test1 = koushin1 eki3 eki1 = eki1 
let test2 = koushin1 eki3 eki2 = eki2 
let test3 = koushin1 eki3 eki3 = eki3 
let test4 = koushin1 eki3 eki4 = 
	{namae="��ڱ�"; saitan_kyori = 1.8; temae_list = ["��ڱ�"; "謲�ë"]} 
let test5 = koushin1 eki2 eki1 = 
	{namae="����"; saitan_kyori = 3.0; temae_list = ["����"; "������"; "謲�ë"]} 
let test6 = koushin1 eki2 eki2 = eki2 
let test7 = koushin1 eki2 eki3 = eki3 
let test8 = koushin1 eki2 eki4 = eki4 
