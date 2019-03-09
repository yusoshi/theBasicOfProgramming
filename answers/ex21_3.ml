(* �ʲ��� ex20_6.ml ��١����ˤ��ƺ������Ƥ��뤬��¾�Τ�١����ˤ��Ƥ�Ʊ�� *) 
 
(* ���Υե������ RedBlack �⥸�塼�롢�ޤ��� Tree �⥸�塼��˲ä��� 
   ��̾���ش֤Υꥹ�Ȥ�ҤȤĤΥե�����ˤޤȤ᤿ metro.ml �Ȱ��� 
   ����ѥ��뤹�� *) 
 
open Metro (* global_ekimei_list, global_ekikan_list ����� *) 
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
 
(* ����դ������ʱءˤ�ɽ���� *) 
type eki_t = { 
  namae        : string;       (* ��̾�ʴ����� *) 
  saitan_kyori : float;        (* ��û��Υ *) 
  temae_list   : string list;  (* �����α�̾�ʴ����ˤΥꥹ�� *) 
} 
 
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
 
(* ��Ū��������ä��ؤΥꥹ�Ȥ򡢺�û��Υ�Ǿ��αؤȤ���ʳ���ʬΥ���� *) 
(* saitan_wo_bunri : eki_t -> eki_t list -> eki_t * eki_t list *) 
let saitan_wo_bunri eki eki_list = 
  List.fold_right (fun first (p, v) -> 
		     match (first, p) with 
		       ({namae = fn; saitan_kyori = fs; temae_list = ft}, 
			{namae = sn; saitan_kyori = ss; temae_list = st}) -> 
			 if fs < ss then (first, p :: v) 
			 else (p, first :: v)) 
		  eki_list 
		  (eki, []) 
 
(* ��Ū��̤����ؤΥꥹ�Ȥȱش֥ꥹ�Ȥ��顢�Ʊؤؤκ�ûϩ����� *) 
(* dijkstra_main : eki_t list -> ekikan_tree_t -> eki_t list *) 
let rec dijkstra_main eki_list ekikan_tree = match eki_list with 
    [] -> [] 
  | first :: rest -> 
      let (saitan, nokori) = saitan_wo_bunri first rest in 
      let eki_list2 = koushin saitan nokori ekikan_tree in 
      saitan :: dijkstra_main eki_list2 ekikan_tree 
 
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
  let eki_list = make_initial_eki_list global_ekimei_list kiten in 
  let global_ekikan_tree = inserts_ekikan empty global_ekikan_list in 
  let eki_list2 = dijkstra_main eki_list global_ekikan_tree in 
  find shuten eki_list2 
 
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
SOURCES = redBlack.mli redBlack.ml metro.ml ex21_3.ml 
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
