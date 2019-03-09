(* 
(* ��Ū��������ä��ꥹ�� lst �����������ǤΤߤ���Ф� *) 
(* filter_positive : int list -> int list *) 
let rec filter_positive lst = match lst with 
    [] -> [] 
  | first :: rest -> 
      if first > 0 then first :: filter_positive rest 
                   else filter_positive rest 
*) 
 
(* ��Ū������ n �� 3 �ǳ��� 1 ;�뤫��Ĵ�٤� *) 
(* is_mod3_1 : int -> bool *) 
let is_mod3_1 n = n mod 3 = 1 
 
(* 
(* ��Ū���ꥹ�� lst ���� 3 �ǳ��� 1 ;�����ǤΤߤ���Ф� *) 
(* filter_mod3_1 : int list -> int list *) 
let rec filter_mod3_1 lst = match lst with 
    [] -> [] 
  | first :: rest -> 
      if is_mod3_1 first then first :: filter_mod3_1 rest 
                         else filter_mod3_1 rest 
*) 
 
(* ��Ū���ꥹ�� lst ���椫���� p �����������ǤΤߤ���Ф� *) 
(* filter : ('a -> bool) -> 'a list -> 'a list *) 
let rec filter p lst = match lst with 
    [] -> [] 
  | first :: rest -> if p first then first :: filter p rest 
                                else filter p rest 
 
(* ��Ū���ꥹ�� lst ���� 3 �ǳ��� 1 ;�����ǤΤߤ���Ф� *) 
(* filter_mod3_1 : int list -> int list *) 
let filter_mod3_1 lst = filter is_mod3_1 lst 
 
(* �ƥ��� *) 
let test1 = filter_mod3_1 [] = [] 
let test2 = filter_mod3_1 [1; 2; 3] = [1] 
let test3 = filter_mod3_1 [1; 3; 7; 4; 2; 8] = [1; 7; 4] 
 
(* ��Ū������ n �������ɤ�����Ĵ�٤� *) 
(* is_positive : int -> bool *) 
let is_positive n = n > 0 
 
(* ��Ū��������ä��ꥹ�� lst �����������ǤΤߤ���Ф� *) 
(* filter_positive : int list -> int list *) 
let filter_positive lst = filter is_positive lst 
 
(* �ƥ��� *) 
let test1 = filter_positive [] = [] 
let test2 = filter_positive [3; -2; 4] = [3; 4] 
let test3 = filter_positive [-1; 9; 1; -2; -3; 4] = [9; 1; 4] 
