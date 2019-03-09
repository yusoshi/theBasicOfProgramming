(* ���Υե������ RedBlack �⥸�塼�롢�ޤ��� Tree �⥸�塼��˲ä��� 
   Heap �⥸�塼���sect23_5/heap.mli, sect23_7/heap.ml �򻲾ȡˡ� 
   �����ơ���̾���ش֤Υꥹ�Ȥ�ҤȤĤΥե�����ˤޤȤ᤿ metro.ml 
   �Ȱ��˥���ѥ��뤹�� *) 
 
open Metro (* global_ekimei_list, global_ekikan_list ����� *) 
open RedBlack 
(* open Tree *) (* Tree �⥸�塼���Ȥ����Ϥ��������Ѥ��� *) 
 
(* ����դ������ʱءˤ�ɽ���� *) 
(* �������������Ǥ� dijkstra_main �η�̤��Ǽ���뤿��ˤ����ȤäƤ��ʤ� *) 
type eki_t = { 
  namae        : string;       (* ��̾�ʴ����� *) 
  saitan_kyori : float;        (* ��û��Υ *) 
  temae_list   : string list;  (* �����α�̾�ʴ����ˤΥꥹ�� *) 
} 
 
(* �ش־����ɽ���ڤη����ʲ��Υ����ȤǤ� ekikan_tree_t �ȵ��� *) 
(* type ekikan_tree_t = (string, (string * float) list) Tree.t *) 
 
(* ��Ū����ʣ�����������������³����򼨤��� ekikan_tree ���롣*) 
(* �ش־���Τߤ��鹽�ۤ����ؾ���ϻȤ�ʤ���*) 
(* make_ekikan_tree : ekikan_t list -> ekikan_tree_t *) 
let make_ekikan_tree ekikan_list = 
  let insert ekikan_tree kiten shuten kyori = 
    let lst = try 
		search ekikan_tree kiten 
	      with Not_found -> [] in 
    insert ekikan_tree kiten ((shuten, kyori) :: lst) in 
  let insert_ekikan ekikan_tree 
		    {kiten = k; shuten = s; keiyu = y; kyori = r; jikan = j} = 
    insert (insert ekikan_tree k s r) s k r in 
  List.fold_left insert_ekikan empty ekikan_list 
 
(* ̤����ؤξ����ɽ���ҡ��פη����ʲ��Υ����ȤǤ� heap_t �ȵ��� *) 
(* type heap_t = (float,			��û��Υ 
		  string *			��̾ 
		  string list *			�����ꥹ�� 
		 ) Heap.t *) 
 
(* �ƱؤΥҡ�����ΰ��֤�ɽ���ڤη����ʲ��Υ����ȤǤ� index_tree_t �ȵ��� *) 
(* type index_tree_t = (string, index_t) Tree.t *) 
 
(* ��Ū��ekikan_tree ���� eki_heap �� index_tree ���ꡢkiten ���������� *) 
(* make_eki_heap_and_index_tree : 
	string -> ekikan_tree_t -> heap_t * index_tree_t *) 
let make_eki_heap_and_index_tree kiten ekikan_tree = 
  traverse (fun (eki_heap, index_tree) k lst -> 
	      let (index, heap) = Heap.insert eki_heap 
					      (if k = kiten then 0. 
							    else infinity) 
					      (k, if k = kiten then [k] 
						  else []) in 
	      let index_tree' = insert index_tree k index in 
	      (heap, index_tree')) 
	   ((Heap.create (length ekikan_tree) 0. ("��̾", [])), 
	    empty) 
	   ekikan_tree 
 
(* ��Ū�����ꤷ���ؤ���³���Ƥ���ؤκ�û��Υ�������ꥹ�Ȥ򹹿����� *) 
(* koushin : string -> float -> string list -> 
	     heap_t -> ekikan_tree_t -> index_tree_t -> heap_t *) 
let koushin pn ps pt eki_heap ekikan_tree index_tree = 
  let lst = search ekikan_tree pn in 
  List.fold_left (fun eki_heap (shuten, kyori) -> try 
		    let shuten_index = search index_tree shuten in 
		    let (saitan_kyori, (n, _)) = 
		      Heap.get eki_heap shuten_index in 
		    let new_saitan_kyori = ps +. kyori in 
		    if new_saitan_kyori <= saitan_kyori 
		    then Heap.set eki_heap shuten_index 
				  new_saitan_kyori (n, (n :: pt)) 
		    else eki_heap 
		  with Not_found -> eki_heap) 
		 eki_heap 
		 lst 
 
(* ��Ū��̤����ؤΥꥹ�Ȥȱش֥ꥹ�Ȥ��顢�Ʊؤؤκ�ûϩ����� *) 
(* dijkstra_main : heap_t -> ekikan_tree_t -> index_tree_t -> eki_t list *) 
let rec dijkstra_main eki_heap ekikan_tree index_tree = 
  if Heap.length eki_heap = 0 
  then [] 
  else let ((ps, (pn, pt)), rest_heap) = Heap.split_top eki_heap in 
       let eki_heap2 = koushin pn ps pt rest_heap ekikan_tree index_tree in 
       {namae = pn; saitan_kyori = ps; temae_list = pt} 
       :: dijkstra_main eki_heap2 ekikan_tree index_tree 
 
(* ��̾�����Ĥ���ʤ��ä����Ȥ򼨤��㳰 *) 
exception No_such_station of string 
 
(* ��Ū�����޻��α�̾�������ľ�� *) 
(* ���Ĥ���ʤ��ä����㳰 No_such_station �򵯤��� *) 
(* romaji_to_kanji : string -> ekimei_t list -> string *) 
let rec romaji_to_kanji r0 ekimei_list = match ekimei_list with 
    [] -> raise (No_such_station (r0)) 
  | {kanji = k; kana = a; romaji = r; shozoku = s} :: rest -> 
      if r0 = r then k else romaji_to_kanji r0 rest 
 
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
  let ekikan_tree = make_ekikan_tree global_ekikan_list in 
  let (eki_heap, index_tree) = 
	make_eki_heap_and_index_tree kiten ekikan_tree in 
  let eki_list = dijkstra_main eki_heap ekikan_tree index_tree in 
  find shuten eki_list 
 
(* ��Ū��eki_t ���Υ쥳���ɤ򤭤줤��ɽ������ *) 
(* print_eki : eki_t -> unit *) 
let print_eki eki = match eki with 
  {namae = n; saitan_kyori = s; temae_list = lst} -> match lst with 
      [] -> assert false (* ���ξ��ϵ����ꤨ�ʤ� *) 
    | [a] -> print_string (a ^ "��" ^ string_of_float s ^ "km��"); 
	     print_newline () 
    | a :: rest -> List.fold_right (fun b () -> print_string (b ^ "��")) 
				   rest (); 
		   print_string (a ^ "��" ^ string_of_float s ^ "km��"); 
		   print_newline () 
 
(* �ᥤ��ؿ� *) 
(* main : string -> string -> unit *) 
let main romaji_kiten romaji_shuten = 
  let eki = dijkstra romaji_kiten romaji_shuten in 
  print_eki eki 
 
(* �ᥤ��ؿ��θƤӽФ� *) 
let _ = main Sys.argv.(1) Sys.argv.(2) 
 
(* �¹��� 
 
% cat Makefile 
SOURCES = redBlack.mli redBlack.ml heap.mli heap.ml metro.ml ex23_3.ml 
RESULT = dijkstra 
OCAMLMAKEFILE = OCamlMakefile 
include $(OCAMLMAKEFILE) 
% make 
... 
% ./dijkstra shibuya gokokuji 
��ë��ɽ��ƻ���Ļ������ܡ�����Į����Į���ԥ�ë�����Ķ���������������� 
��9.8km�� 
% ./dijkstra myogadani meguro 
謲�ë����ڱࡢ���Ķ����ԥ�ë����Į������Į��ί�ӻ�����ϻ���ڰ����ܡ� �� 
�۽��֡������ء�����桢�ܹ���12.7km�� 
% 
 
*) 
