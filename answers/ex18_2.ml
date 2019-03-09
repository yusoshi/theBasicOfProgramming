(* ���餫���� sect18_1/price.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "sect18_1/price.ml" (* price ����� *) 
 
(* Ȭɴ���ˤ����Ƥ�����ڤ����ʤΥꥹ�Ȥ��� *) 
let yaoya_list = [("�ȥޥ�", 300); ("���ޤͤ�", 200); 
		  ("�ˤ󤸤�", 150); ("�ۤ������", 200)] 
 
(* ��Ū��Ȭɴ���ꥹ�Ȥˤ����äƤ��ʤ���ڤο����֤� *) 
(* count_urikire_yasai : string list -> (string * int) list -> int *) 
let rec count_urikire_yasai yasai_list yaoya_list = match yasai_list with 
    [] -> 0 
  | first :: rest -> 
      match price first yaoya_list with 
	  None -> 1 + count_urikire_yasai rest yaoya_list 
	| Some (p) -> count_urikire_yasai rest yaoya_list 
 
(* �ƥ��� *) 
let test1 = count_urikire_yasai ["���ޤͤ�"; "�ˤ󤸤�"] yaoya_list = 0 
let test2 = count_urikire_yasai ["���ޤͤ�"; "���㤬����"; "�ˤ󤸤�"] yaoya_list = 1 
let test3 = count_urikire_yasai ["��������"; "�ʤ�"; "�ˤ󤸤�"] yaoya_list = 2 
