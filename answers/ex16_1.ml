(* ��Ū����Ƭ����ꥹ����γ������ޤǤι�פ�׻����� *) 
(* sum_list : int list -> int list *) 
let sum_list lst = 
  (* ��Ū����Ƭ����ꥹ����γ������ޤǤι�פ�׻����� *) 
  (* ������ total0 �Ϥ���ޤǤ������ι�� *) 
  (* hojo : int list -> int -> int list *) 
  let rec hojo lst total0 = match lst with 
      [] -> [] 
    | first :: rest -> first + total0 :: hojo rest (first + total0) 
  in hojo lst 0 
 
(* �ƥ��� *) 
let test1 = sum_list [] = [] 
let test2 = sum_list [1; 2; 3] = [1; 3; 6] 
let test3 = sum_list [3; 2; 1; 4] = [3; 5; 6; 10] 
