(* ��Ū��������ä������� lst ����κǾ��ͤ��֤� *) 
(* minimum2 : int -> int list -> int *) 
let rec minimum2 i lst = match lst with 
    [] -> i 
  | first :: rest -> 
      let rest_min = minimum2 first rest in 
      if rest_min <= i 
      then rest_min 
      else i 
 
(* ��Ū��������ä� lst ����κǾ��ͤ��֤� *) 
(* minimum : int list -> int *) 
let minimum lst = match lst with 
    [] -> max_int 
  | first :: rest -> minimum2 first rest 
 
(* �ƥ��� *) 
let test1 = minimum [3] = 3 
let test2 = minimum [1; 2] = 1 
let test3 = minimum [3; 2] = 2 
let test4 = minimum [3; 2; 6; 4; 1; 8] = 1 
