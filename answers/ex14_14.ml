(* ��Ū���ꥹ�����ʸ�����Ĥʤ���ʸ������֤� *) 
(* concat : string list -> string *) 
let concat lst = List.fold_right (^) lst "" 
 
(* �ƥ��� *) 
let test1 = concat [] = "" 
let test2 = concat ["��"] = "��" 
let test3 = concat ["��"; "��"; "��"; "��"] = "�ղƽ���" 
