(* ���餫���� ex10_10.ml, ex15_5.ml, ex17_14.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex10_10.ml" (* romaji_to_kanji ����� *) 
#use "ex15_5.ml" (* saitan_wo_bunri ����� *) 
#use "ex17_14.ml" (* get_ekikan_kyori ����� *) 
 
(* ex14_12.ml ���ɤ߹���� ekimei_t ����eki_t ������������١��ɤ߹��ޤ�� 
   ���ޤ��Τ� make_initial_eki_list �������ʲ���ľ�ܡ�Ÿ�� *) 
 
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
		 let kyori = get_ekikan_kyori pn qn ekikan_tree in 
		 if kyori = infinity 
		 then q 
		 else if ps +. kyori < qs 
		 then {namae = qn; saitan_kyori = ps +. kyori; 
				   temae_list = qn :: pt} 
		 else q) 
	     v 
 
(* ��Ū��̤����ؤΥꥹ�Ȥȱش֥ꥹ�Ȥ��顢�Ʊؤؤκ�ûϩ����� *) 
(* dijkstra_main : eki_t list -> ekikan_tree_t -> eki_t list *) 
let rec dijkstra_main eki_list ekikan_tree = match eki_list with 
    [] -> [] 
  | first :: rest -> 
      let (saitan, nokori) = saitan_wo_bunri (first :: rest) in 
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
  let global_ekikan_tree = inserts_ekikan Empty global_ekikan_list in 
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
