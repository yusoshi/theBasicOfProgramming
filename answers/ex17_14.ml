(* ���餫���� ex09_10.ml, ex17_11.ml, ex17_13.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex09_10.ml" (* ekikan_t, global_ekikan_list ����� *) 
#use "ex17_11.ml" (* assoc ����� *) 
#use "ex17_13.ml" (* inserts_ekikan ����� *) 
 
(* ��Ū���դ��Ĥαؤδ֤ε�Υ����� *) 
(* get_ekikan_kyori : string -> string -> ekikan_tree_t -> float *) 
let rec get_ekikan_kyori eki1 eki2 tree = match tree with 
    Empty -> infinity 
  | Node (left, k, lst, right) -> 
      if eki1 < k then get_ekikan_kyori eki1 eki2 left 
      else if k < eki1 then get_ekikan_kyori eki1 eki2 right 
      else assoc eki2 lst 
 
(* �ƥ��� *) 
let global_ekikan_tree = inserts_ekikan Empty global_ekikan_list 
let test1 = get_ekikan_kyori "謲�ë" "������" global_ekikan_tree = 1.2 
let test2 = get_ekikan_kyori "謲�ë" "����" global_ekikan_tree = infinity 
let test3 = get_ekikan_kyori "���" "���Į" global_ekikan_tree = 0.6 
