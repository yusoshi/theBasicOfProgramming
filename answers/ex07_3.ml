(* ��Ū���Ȥ�ɽ���줿ʿ�̺�ɸ�������ä��� x �����оΤ����κ�ɸ���֤� *) 
(* taisho_x : float * float -> float * float *) 
let taisho_x point = match point with 
  (x, y) -> (x, -. y) 
 
(* -. y �� 0. -. y �Ǥ�Ʊ�� *) 
 
(* �ƥ��� *) 
let test1 = taisho_x (0.0, 0.0) = (0.0, 0.0) 
let test2 = taisho_x (2.3, 5.1) = (2.3, -5.1) 
let test3 = taisho_x (-3.8, -2.4) = (-3.8, 2.4) 
