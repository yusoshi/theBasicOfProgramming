(* ���餫���� ex05_4.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex05_4.ml" 
 
(* ��Ū��a, b, c �������ä����θĿ����֤� *) 
(* kai_no_kosuu : float -> float -> float -> int *) 
let kai_no_kosuu a b c = 
  if hanbetsushiki a b c > 0.0 then 2 
  else if hanbetsushiki a b c = 0.0 then 1 
  else 0 
 
(* �ƥ��� *) 
let test1 = kai_no_kosuu 1.0 5.0 4.0 = 2 
let test2 = kai_no_kosuu 2.0 (-4.0) 2.0 = 1 
let test3 = kai_no_kosuu 1.0 2.0 4.0 = 0 
