(* ��Ū�����֤������ä����������夫���֤� *) 
(* jikan : int -> string *) 
let jikan ji = 
  if ji < 12 then "����" else "���" 
 
(* �ƥ��� *) 
let test1 = jikan 0 = "����" 
let test2 = jikan 3 = "����" 
let test3 = jikan 12 = "���" 
let test4 = jikan 15 = "���" 
let test5 = jikan 21 = "���" 
