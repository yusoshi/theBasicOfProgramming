(* ��Ū���ꥹ�����ʸ�����Ĥʤ���ʸ������֤� *) 
(* concat : string list -> string *) 
let rec concat lst = match lst with 
    [] -> "" 
  | first :: rest -> first ^ concat rest 
 
(* �ƥ��� *) 
let test1 = concat [] = "" 
let test2 = concat ["��"] = "��" 
let test3 = concat ["��"; "��"; "��"; "��"] = "�ղƽ���" 
