(* ��Ū��������ä��ꥹ�� lst ��Ĺ������� *) 
(* length : 'a list -> int *) 
let rec length lst = match lst with 
    [] -> 0 
  | first :: rest -> 1 + length rest 
 
(* �ƥ��� *) 
let test1 = length [] = 0 
let test2 = length [3] = 1 
let test3 = length [2; 1; 6; 4; 7] = 5 
