(* ���Υե������ 19.6 �Ϥ��������Ƥ��� my-tree.top �ξ�Ǽ¹Ԥ��� *) 
(* my-tree.top �� sect19_6 �β��� OCamlMakefile ���������ɤ������ 
   make top ��¹Ԥ���Ⱥ�������� *) 
 
(* ���餫���� ex09_10.ml, ex12_1.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex09_10.ml" (* ekikan_t, global_ekikan_list ����� *) 
#use "ex12_1.ml" (* eki_t ����� *) 
 
(* ��Ū��������ä� kiten, shuten, kyori �� ekikan_tree �����������ڤ��֤� *) 
(* insert1 : (string * (string * float) list) Tree.t -> 
	      string -> string -> float -> 
	     (string * (string * float) list) Tree.t *) 
let rec insert1 ekikan_tree kiten shuten kyori = 
  let lst = try 
	      Tree.search ekikan_tree kiten 
	    with Not_found -> [] 
  in Tree.insert ekikan_tree kiten ((shuten, kyori) :: lst) 
 
(* ��Ū��������ä� ekikan ����� ekikan_tree �����������ڤ��֤� *) 
(* insert_ekikan : (string * (string * float) list) Tree.t -> 
		    ekikan_t -> 
		   (string * (string * float) list) Tree.t *) 
let insert_ekikan ekikan_tree ekikan = match ekikan with 
  {kiten = k; shuten = s; keiyu = y; kyori = r; jikan = j} -> 
    insert1 (insert1 ekikan_tree s k r) k s r 
 
(* ��Ū��������ä� ekikan �Υꥹ�Ȥ� ekikan_tree �����������ڤ��֤� *) 
(* inserts_ekikan : (string * (string * float) list) Tree.t -> 
		     ekikan_t list -> 
		    (string * (string * float) list) Tree.t *) 
let inserts_ekikan ekikan_tree ekikan_list = 
  List.fold_left insert_ekikan ekikan_tree ekikan_list 
 
(* ��Ū���դ��Ĥαؤδ֤ε�Υ����� *) 
(* ���Ĥ���ʤ��ä����㳰 Not_found �򵯤��� *) 
(* get_ekikan_kyori : string -> string -> 
		     (string * (string * float) list) Tree.t -> float *) 
let rec get_ekikan_kyori eki1 eki2 tree = 
  List.assoc eki2 (Tree.search tree eki1) 
 
(* �ƥ��� *) 
let global_ekikan_tree = inserts_ekikan Tree.empty global_ekikan_list 
let test1 = get_ekikan_kyori "謲�ë" "������" global_ekikan_tree = 1.2 
(* let test2 = get_ekikan_kyori "謲�ë" "����" global_ekikan_tree *) 
   (* Not_found �򵯤��� *) 
let test3 = get_ekikan_kyori "���" "���Į" global_ekikan_tree = 0.6 
