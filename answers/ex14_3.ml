(* ��Ū���դ��Ĥ�ʸ�����Ĥʤ��� *) 
(* append_string : string -> string -> string *) 
let append_string first rest_result = first ^ rest_result 
 
(* ��Ū���ꥹ�����ʸ�����Ĥʤ���ʸ������֤� *) 
(* concat : string list -> string *) 
let concat lst = List.fold_right append_string lst "" 
 
(* �ƥ��� *) 
let test1 = concat [] = "" 
let test2 = concat ["��"] = "��" 
let test3 = concat ["��"; "��"; "��"; "��"] = "�ղƽ���" 
