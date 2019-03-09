(* ���餫���� ex09_9.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex09_9.ml" (* ekimei_t, global_ekimei_list ����� *) 
 
(* ��Ū�����޻��α�̾�������ľ�� *) 
(* romaji_to_kanji : string -> ekimei_t list -> string *) 
let rec romaji_to_kanji r0 ekimei_list = match ekimei_list with 
    [] -> "" 
  | {kanji = k; kana = a; romaji = r; shozoku = s} :: rest -> 
      if r0 = r then k else romaji_to_kanji r0 rest 
 
(* �ƥ��� *) 
let test1 = romaji_to_kanji "myogadani" global_ekimei_list = "謲�ë" 
let test2 = romaji_to_kanji "shibuya" global_ekimei_list = "��ë" 
let test3 = romaji_to_kanji "otemachi" global_ekimei_list = "���Į" 
