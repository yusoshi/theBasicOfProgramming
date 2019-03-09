(* ���餫���� ex10_11.ml, ex12_1.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex10_11.ml" 
#use "ex12_1.ml" 
 
(* �ؤ��� *) 
let eki1 = {namae="����"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="������"; saitan_kyori = 1.2; temae_list = ["������"; "謲�ë"]} 
let eki3 = {namae="謲�ë"; saitan_kyori = 0.; temae_list = ["謲�ë"]} 
let eki4 = {namae="��ڱ�"; saitan_kyori = infinity; temae_list = []} 
 
(* ��Ū��̤����αؤΥꥹ�� v ��ɬ�פ˱����ƹ��������ꥹ�Ȥ��֤� *) 
(* koushin : eki_t -> eki_t list -> eki_t list *) 
let koushin p v = 
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
      else q in 
  let f q = koushin1 p q in 
  List.map f v 
 
(* �ޤ��ϡ������ p �� koushin1 �γ��˽Ф��ưʲ� *) 
 
(* ��Ū��̤����αؤΥꥹ�� v ��ɬ�פ˱����ƹ��������ꥹ�Ȥ��֤� *) 
(* koushin : eki_t -> eki_t list -> eki_t list *) 
let koushin p v = match p with 
  {namae = pn; saitan_kyori = ps; temae_list = pt} -> 
    (* ��Ū��̤����α� q ��ɬ�פ˱����ƹ��������ؤ��֤� *) 
    (* koushin1 : eki_t -> eki_t -> eki_t *) 
    let koushin1 q = match q with 
      {namae = qn; saitan_kyori = qs; temae_list = qt} -> 
	let kyori = get_ekikan_kyori pn qn global_ekikan_list in 
	if kyori = infinity 
	then q 
	else if ps +. kyori < qs 
	then {namae = qn; saitan_kyori = ps +. kyori; temae_list = qn :: pt} 
	else q in 
    List.map koushin1 v 
 
(* �ؤ��� *) 
let eki1 = {namae="����"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="������"; saitan_kyori = 1.2; temae_list = ["������"; "謲�ë"]} 
let eki3 = {namae="謲�ë"; saitan_kyori = 0.; temae_list = ["謲�ë"]} 
let eki4 = {namae="��ڱ�"; saitan_kyori = infinity; temae_list = []} 
 
(* �إꥹ�Ȥ��� *) 
let lst = [eki1; eki2; eki3; eki4] 
 
(* �ƥ��� *) 
let test1 = koushin eki2 [] = [] 
let test2 = koushin eki2 lst = 
 [{namae="����"; saitan_kyori = 3.0; temae_list = ["����"; "������"; "謲�ë"]}; 
  eki2; eki3; eki4] 
