(* ���餫���� ex09_9.ml, ex18_6.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex09_9.ml" (* ekimei_t, global_ekimei_list ����� *) 
#use "ex18_6.ml" (* No_such_station ����� *) 
 
(* ��Ū�����޻��α�̾�������ľ�� *) 
(* ���Ĥ���ʤ��ä����㳰 No_such_station �򵯤��� *) 
(* romaji_to_kanji : string -> ekimei_t list -> string *) 
let rec romaji_to_kanji r0 ekimei_list = match ekimei_list with 
    [] -> raise (No_such_station (r0)) 
  | {kanji = k; kana = a; romaji = r; shozoku = s} :: rest -> 
      if r0 = r then k else romaji_to_kanji r0 rest 
 
(* �ƥ��� *) 
let test1 = romaji_to_kanji "myogadani" global_ekimei_list = "謲�ë" 
let test2 = romaji_to_kanji "shibuya" global_ekimei_list = "��ë" 
let test3 = romaji_to_kanji "otemachi" global_ekimei_list = "���Į" 
(* let test4 = romaji_to_kanji "osaka" global_ekimei_list *) 
   (* No_such_station "osaka" �򵯤��� *) 
