(* ��Ū���դ��Ĥμ����� m, n �κ������������ *) 
(* gcd : int -> int -> int *) 
let rec gcd m n = 
 (print_string "m = "; 
  print_int m;           (* m ���ͤ�ɽ�� *) 
  print_string ", n = "; 
  print_int n;           (* n ���ͤ�ɽ�� *) 
  print_newline ();      (* ����         *) 
  if n = 0 then m 
           else gcd n (m mod n)) 
 
(* �ƥ��� *) 
let test1 = gcd 7 5 = 1 
let test2 = gcd 30 18 = 6 
let test3 = gcd 36 24 = 12 
let test4 = gcd 216 126 = 18 
