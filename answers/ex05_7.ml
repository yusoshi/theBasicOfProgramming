(* ���餫���� ex04_4.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex04_4.ml" 
 
(* ��Ū����Ĺ���νŤ������ä����η����֤� *) 
(* taikei : float -> float -> string *) 
let taikei shincho taiju = 
  if bmi shincho taiju < 18.5 then "�䤻" 
  else if bmi shincho taiju < 25.0 then "ɸ��" 
  else if bmi shincho taiju < 30.0 then "����" 
  else "��������" 
 
(* �ƥ��� *) 
let test1 = taikei 1.13 20.0 = "�䤻" 
let test2 = taikei 1.63 57.0 = "ɸ��" 
let test3 = taikei 1.71 56.0 = "ɸ��" 
