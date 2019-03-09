(* ���Υե������ RedBlack �⥸�塼�롢�ޤ��� Tree �⥸�塼��� 
   �Ȥ߹�����ȥåץ�٥��Ǽ¹Ԥ��� *) 
 
(* ���餫���� ex09_10.ml, ex12_1.ml, ex17_16.ml, ex18_7.ml �� 
   �ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex09_10.ml" (* ekikan_t, global_ekikan_list ����� *) 
#use "ex12_1.ml" (* eki_t ����� *) 
#use "ex17_16.ml" (* saitan_wo_bunri ����� *) 
#use "ex18_7.ml" (* romaji_to_kanji ����� *) 
 
open RedBlack 
(* open Tree *) (* Tree �⥸�塼���Ȥ����Ϥ��������Ѥ��� *) 
 
(* ��Ū��������ä� kiten, shuten, kyori �� ekikan_tree �����������ڤ��֤� *) 
(* insert1 : (string * (string * float) list) t -> 
	      string -> string -> float -> 
	     (string * (string * float) list) t *) 
let rec insert1 ekikan_tree kiten shuten kyori = 
  let lst = try 
	      search ekikan_tree kiten 
	    with Not_found -> [] 
  in insert ekikan_tree kiten ((shuten, kyori) :: lst) 
 
(* ��Ū��������ä� ekikan ����� ekikan_tree �����������ڤ��֤� *) 
(* insert_ekikan : (string * (string * float) list) t -> 
		    ekikan_t -> 
		   (string * (string * float) list) t *) 
let insert_ekikan ekikan_tree ekikan = match ekikan with 
  {kiten = k; shuten = s; keiyu = y; kyori = r; jikan = j} -> 
    insert1 (insert1 ekikan_tree s k r) k s r 
 
(* ��Ū��������ä� ekikan �Υꥹ�Ȥ� ekikan_tree �����������ڤ��֤� *) 
(* inserts_ekikan : (string * (string * float) list) t -> 
		     ekikan_t list -> 
		    (string * (string * float) list) t *) 
let inserts_ekikan ekikan_tree ekikan_list = 
  List.fold_left insert_ekikan ekikan_tree ekikan_list 
 
(* ��Ū���դ��Ĥαؤδ֤ε�Υ����� *) 
(* ���Ĥ���ʤ��ä����㳰 Not_found �򵯤��� *) 
(* get_ekikan_kyori : string -> string -> 
		     (string * (string * float) list) t -> float *) 
let rec get_ekikan_kyori eki1 eki2 tree = 
  List.assoc eki2 (search tree eki1) 
 
(* ��Ū��ekimei list ���� eki list ���� *) 
(* make_initial_eki_list : ekimei_t list -> string -> eki_t list *) 
let make_initial_eki_list ekimei_list kiten = 
  List.map (fun ekimei -> match ekimei with 
	     {kanji = k; kana = a; romaji = r; shozoku = s} -> 
	       if k = kiten 
	       then {namae = k; saitan_kyori = 0.; temae_list = [k]} 
	       else {namae = k; saitan_kyori = infinity; temae_list = []}) 
	   ekimei_list 
 
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
 
(* ��Ū��̤����ؤΥꥹ�Ȥȱش֥ꥹ�Ȥ��顢�Ʊؤؤκ�ûϩ����� *) 
(* dijkstra_main : eki_t list -> ekikan_tree_t -> eki_t list *) 
let rec dijkstra_main eki_list ekikan_tree = match eki_list with 
    [] -> [] 
  | first :: rest -> 
      let (saitan, nokori) = saitan_wo_bunri first rest in 
      let eki_list2 = koushin saitan nokori ekikan_tree in 
      saitan :: dijkstra_main eki_list2 ekikan_tree 
 
(* ��Ū��������ä� eki_list ���� shuten �Υ쥳���ɤ�õ���Ф� *) 
(* find : string -> eki_t list -> eki_t *) 
let rec find shuten eki_list = match eki_list with 
    [] -> {namae = ""; saitan_kyori = infinity; temae_list = []} 
  | ({namae = n; saitan_kyori = s; temae_list = t} as first) :: rest -> 
      if n = shuten then first else find shuten rest 
 
(* ��Ū�������Ƚ����������ä��顢��ûϩ���ᡢ�����Υ쥳���ɤ��֤� *) 
(* dijkstra : string -> string -> eki_t *) 
let dijkstra romaji_kiten romaji_shuten = 
  let kiten = romaji_to_kanji romaji_kiten global_ekimei_list in 
  let shuten = romaji_to_kanji romaji_shuten global_ekimei_list in 
  let eki_list = make_initial_eki_list global_ekimei_list kiten in 
  let global_ekikan_tree = inserts_ekikan empty global_ekikan_list in 
  let eki_list2 = dijkstra_main eki_list global_ekikan_tree in 
  find shuten eki_list2 
 
(* �ƥ��� *) 
let test1 = dijkstra "shibuya" "gokokuji" = 
  {namae = "����"; saitan_kyori = 9.8; 
   temae_list = 
     ["����"; "�����"; "���Ķ�"; "�ԥ�ë"; "��Į"; "����Į"; 
      "�Ļ�������"; "ɽ��ƻ"; "��ë"]} 
let test2 = dijkstra "myogadani" "meguro" = 
  {namae = "�ܹ�"; saitan_kyori = 12.7000000000000028; 
   temae_list = 
     ["�ܹ�"; "�����"; "������"; "���۽���"; "ϻ���ڰ�����"; "ί�ӻ���"; 
      "����Į"; "��Į"; "�ԥ�ë"; "���Ķ�"; "��ڱ�"; "謲�ë"]} 
 
(* ��û��Υ�� 12.7 �ˤʤ�ʤ��Τϡ������򣲿ʿ���ɽ������Ȥ��θ��Τ��ᡣ 
   �����Ǥϥƥ��ȷ�̤�񤤤����������ƥ��Ⱥ�������ͽ�ۤ���Τ�̵���ʤΤ� 
   �ƥ��ȤȤ��ƽ񤯰�̣�Ϥ��ޤ�ʤ���*) 
