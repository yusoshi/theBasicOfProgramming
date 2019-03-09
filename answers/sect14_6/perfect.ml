(* ���餫���� sect14_1/filter.ml, sect14_2/fold_right.ml �� 
   �ɤ߹���Ǥ���ɬ�פ��� *) 
#use "sect14_1/filter.ml" 
#use "sect14_2/fold_right.ml" 
 
(* ��Ū��n ���� 1 �ޤǤΥꥹ�Ȥ��� *) 
(* enumerate : int -> int list *) 
let rec enumerate n = 
  if n = 0 then [] else n :: enumerate (n - 1) 
 
(* ��Ū��n ������Υꥹ�Ȥ��֤� *) 
(* divisor : int -> int list *) 
let divisor n = filter (fun x -> n mod x = 0) (enumerate n) 
 
(* ��Ū��m �ʲ��δ������Υꥹ�Ȥ��֤� *) 
(* perfect : int -> int list *) 
let perfect m = 
  filter (fun n -> fold_right (+) (divisor n) 0 - n = n) 
         (enumerate m) 
 
(* �ƥ��� *) 
let test1 = divisor 24 = [24; 12; 8; 6; 4; 3; 2; 1] 
let test2 = perfect 10000 = [8128; 496; 28; 6] 
