(* ���餫���� sect18_1/price.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "sect18_1/price.ml" 
 
(* Ȭɴ���ˤ����Ƥ�����ڤ����ʤΥꥹ�Ȥ��� *) 
let yaoya_list = [("�ȥޥ�", 300); ("���ޤͤ�", 200); 
                  ("�ˤ󤸤�", 150); ("�ۤ������", 200)] 
 
(* ��Ū��yasai_list ����ä��Ȥ������ʤι�פ�Ĵ�٤� *) 
(* total_price : string list -> (string * int) list -> int *) 
let rec total_price yasai_list yaoya_list = match yasai_list with 
    [] -> 0 
  | first :: rest -> 
      match price first yaoya_list with 
          None -> total_price rest yaoya_list 
        | Some (p) -> p + total_price rest yaoya_list 
 
(* �ƥ��� *) 
let test1 = total_price ["�ȥޥ�"; "�ˤ󤸤�"] yaoya_list = 450 
let test2 = total_price ["���㤬����"; "���ޤͤ�"; "�ˤ󤸤�"] yaoya_list = 350 
