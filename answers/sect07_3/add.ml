(* ��Ū���դ��Ĥ��������� pair �������ꤽ�����Ǥ��¤��֤� *) 
(* add : int * int -> int *) 
let add pair = match pair with 
  (a, b) -> a + b 
 
(* �ƥ��� *) 
let test1 = add (0, 0) = 0 
let test2 = add (3, 5) = 8 
let test3 = add (3, -5) = -2 
