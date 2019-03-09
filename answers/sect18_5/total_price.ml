(* ����ڤ�򼨤��㳰 *) 
exception Urikire 
 
(* ��Ū��item �����ʤ�Ĵ�٤� *) 
(* �ߤĤ���ʤ��Ȥ��ˤ� Urikire �Ȥ����㳰��ȯ������ *) 
(* price : string -> (string * int) list -> int *) 
let rec price item yaoya_list = match yaoya_list with 
    [] -> raise Urikire 
  | (yasai, nedan) :: rest -> 
      if item = yasai then nedan 
                      else price item rest 
 
(* ��Ū��yasai_list ����ä��Ȥ������ʤι�פ�Ĵ�٤� *) 
(* total_price : string list -> (string * int) list -> int *) 
let total_price yasai_list yaoya_list = 
  (* ��Ū��yasai_list ����ä��Ȥ������ʤι�פ�Ĵ�٤� *) 
  (* hojo : string list -> int *) 
  let rec hojo yasai_list = match yasai_list with 
      [] -> 0 
    | first :: rest -> 
        price first yaoya_list + hojo rest 
  in try 
       hojo yasai_list 
     with Urikire -> 0 
 
(* Ȭɴ���ˤ����Ƥ�����ڤ����ʤΥꥹ�Ȥ��� *) 
let yaoya_list = [("�ȥޥ�", 300); ("���ޤͤ�", 200); 
                  ("�ˤ󤸤�", 150); ("�ۤ������", 200)] 
 
(* �ƥ��� *) 
let test1 = total_price ["���ޤͤ�"; "�ˤ󤸤�"] yaoya_list = 350 
let test2 = total_price ["���ޤͤ�"; "���㤬����"; "�ˤ󤸤�"] yaoya_list = 0 
let test3 = total_price ["�ȥޥ�"; "�ˤ󤸤�"] yaoya_list = 450 
