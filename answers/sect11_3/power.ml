(* ��Ū������ m �� n �������ä��顢m �� n ������ *) 
(* power : int -> int -> int *) 
let rec power m n = 
  if n = 0 then 1 
           else m * power m (n - 1) 
 
(* �ƥ��� *) 
let test1 = power 3 0 = 1 
let test2 = power 3 1 = 3 
let test3 = power 3 2 = 9 
let test4 = power 3 3 = 27 
