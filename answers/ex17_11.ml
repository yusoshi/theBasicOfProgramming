(* ��Ū��������ä� ekimei0 �ޤǤε�Υ�� lst ����õ�����֤� *) 
(* assoc : string -> (string * float) list -> float *) 
let rec assoc ekimei0 lst = match lst with 
    [] -> infinity 
  | (ekimei, kyori) :: rest -> 
      if ekimei = ekimei0 then kyori else assoc ekimei0 rest 
 
(* �ƥ��� *) 
let test1 = assoc "��ڱ�" [] = infinity 
let test2 = assoc "��ڱ�" [("������", 1.2); ("��ڱ�", 1.8)] = 1.8 
let test3 = assoc "����" [("������", 1.2); ("��ڱ�", 1.8)] = infinity 
