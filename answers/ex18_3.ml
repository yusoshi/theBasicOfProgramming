(* ��Ū��������ä� ekimei0 �ޤǤε�Υ�� lst ����õ�����֤� *) 
(* ���Ĥ���ʤ��ä����㳰 Not_found �򵯤��� *) 
(* assoc : 'a -> ('a * 'b) list -> 'b *) 
let rec assoc ekimei0 lst = match lst with 
    [] -> raise Not_found 
  | (ekimei, kyori) :: rest -> 
      if ekimei = ekimei0 then kyori else assoc ekimei0 rest 
 
(* 'b �ˤĤ��Ƥ�¿��η��Ȥʤ롣*) 
 
(* �ƥ��� *) 
(* let test1 = assoc "��ڱ�" [] *) 
   (* Not_found �򵯤��� *) 
let test2 = assoc "��ڱ�" [("������", 1.2); ("��ڱ�", 1.8)] = 1.8 
(* let test3 = assoc "����" [("������", 1.2); ("��ڱ�", 1.8)] *) 
   (* Not_found �򵯤��� *) 
