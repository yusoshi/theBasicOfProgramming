(* Ȭɴ���ˤ����Ƥ�����ڤ����ʤΥꥹ�Ȥ��� *) 
let yaoya_list = [("�ȥޥ�", 300); ("���ޤͤ�", 200); 
                  ("�ˤ󤸤�", 150); ("�ۤ������", 200)] 
 
(* ��Ū��item �����ʤ�Ĵ�٤� *) 
(* price : string -> (string * int) list -> int option *) 
let rec price item yaoya_list = match yaoya_list with 
    [] -> None 
  | (yasai, nedan) :: rest -> 
      if item = yasai then Some (nedan) 
                      else price item rest 
 
(* �ƥ��� *) 
let test1 = price "�ȥޥ�" yaoya_list = Some (300) 
let test2 = price "���㤬����" yaoya_list = None 
