(* ���餫���� sect18_1/price.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "sect18_1/price.ml" 
 
(* Ȭɴ���ˤ����Ƥ�����ڤ����ʤΥꥹ�Ȥ��� *) 
let yaoya_list = [("�ȥޥ�", 300); ("���ޤͤ�", 200); 
                  ("�ˤ󤸤�", 150); ("�ۤ������", 200)] 
 
(* ��Ū��yasai_list ����ä��Ȥ������ʤι�פ�Ĵ�٤� *) 
(* total_price : string list -> (string * int) list -> int *) 
let total_price yasai_list yaoya_list = 
  (* ��Ū��yasai_list ����ä��Ȥ������ʤι�פ�Ĵ�٤� *) 
  (* hojo : string list -> int option *) 
  let rec hojo yasai_list = match yasai_list with 
      [] -> Some (0) 
    | first :: rest -> 
        match price first yaoya_list with 
            None -> None 
          | Some (p) -> match hojo rest with 
                            None -> None 
                          | Some (q) -> Some (p + q) 
  in match hojo yasai_list with 
        None -> 0 
      | Some (p) -> p 
 
(* �ƥ��� *) 
let test1 = total_price ["���ޤͤ�"; "�ˤ󤸤�"] yaoya_list = 350 
let test2 = total_price ["���ޤͤ�"; "���㤬����"; "�ˤ󤸤�"] yaoya_list = 0 
let test3 = total_price ["�ȥޥ�"; "�ˤ󤸤�"] yaoya_list = 450 
 
(* 
(* ��Ū��item �����ʤ�Ĵ�٤� *) 
(* price : string -> (string * int) list -> int *) 
let rec price item yaoya_list = match yaoya_list with 
    [] -> 0 
  | (yasai, nedan) :: rest -> 
      if item = yasai then nedan 
                      else price item rest 
 
(* ��Ū��yasai_list ����ä��Ȥ������ʤι�פ�Ĵ�٤� *) 
(* total_price : string list -> (string * int) list -> int *) 
let rec total_price yasai_list yaoya_list = match yasai_list with 
    [] -> 0 
  | first :: rest -> 
      price first yaoya_list + total_price rest yaoya_list 
*) 
