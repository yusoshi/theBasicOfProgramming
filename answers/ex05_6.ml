(* ���餫���� ex05_4.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex05_4.ml" 
 
(* ��Ū��a, b, c �������ä�����������Ĥ���Ƚ�ꤹ�� *) 
(* kyosuukai : float -> float -> float -> bool *) 
let kyosuukai a b c = 
  hanbetsushiki a b c < 0.0 
 
(* �ƥ��� *) 
let test1 = kyosuukai 1.0 5.0 4.0 = false 
let test2 = kyosuukai 2.0 (-4.0) 2.0 = false 
let test3 = kyosuukai 1.0 2.0 4.0 = true 
