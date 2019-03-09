(* ���餫���� ex09_10.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex09_10.ml" (* ekikan_t, global_ekikan_list ����� *) 
 
(* ��Ū���դ��Ĥαؤδ֤ε�Υ����� *) 
(* get_ekikan_kyori : string -> string -> ekikan_t list -> float *) 
let rec get_ekikan_kyori eki1 eki2 lst = match lst with 
    [] -> infinity 
  | {kiten = k; shuten = s; keiyu = y; kyori = r; jikan = j} :: rest -> 
     if (eki1 = k && eki2 = s) || (eki1 = s && eki2 = k) 
     then r 
     else get_ekikan_kyori eki1 eki2 rest 
 
(* �ƥ��� *) 
let test1 = get_ekikan_kyori "謲�ë" "������" global_ekikan_list = 1.2 
let test2 = get_ekikan_kyori "謲�ë" "����" global_ekikan_list = infinity 
let test3 = get_ekikan_kyori "���" "���Į" global_ekikan_list = 0.6 
