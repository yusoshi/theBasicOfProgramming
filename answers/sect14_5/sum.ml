(* ���餫���� sect14_2/fold_right.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "sect14_2/fold_right.ml" 
 
(* 
(* ��Ū��������ä��ꥹ�� lst �γ����Ǥ��¤���� *) 
(* sum : int list -> int *) 
let sum lst = 
  fold_right (fun first rest_result -> first + rest_result) 
             lst 0 
*) 
 
(* ��Ū��������ä��ꥹ�� lst �γ����Ǥ��¤���� *) 
(* sum : int list -> int *) 
let sum lst = fold_right (+) lst 0 
 
(* �ƥ��� *) 
let test1 = sum [] = 0 
let test2 = sum [1; 2; 3] = 6 
let test3 = sum [1; 3; 7; 4; 2; 8] = 25 
