(* ��Ū��m > n > 0 �ʤ뼫���� m �� n �κ������������ *) 
(* gcd : int -> int -> int *) 
let rec gcd m n = 
  if n = 0 then m else gcd n (m mod n) 
 
(* �Ƶ��Τ��Ӥ� n ���ͤ��������ʤäƤ���Τǡ������� 0 �ˤʤ���ߤ��� *) 
 
(* �ƥ��� *) 
let test1 = gcd 7 5 = 1 
let test2 = gcd 30 18 = 6 
let test3 = gcd 36 24 = 12 
