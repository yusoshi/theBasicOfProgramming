(* ��Ū��lst ���椫�� n ��꾮�������ǤΤߤ���Ф� *) 
(* take_less : int -> int list -> int list *) 
let take_less n lst = [] (* ̤���� *) 
 
(* ��Ū��lst ���椫�� n ����礭�����ǤΤߤ���Ф� *) 
(* take_greater : int -> int list -> int list *) 
let take_greater n lst = [] (* ̤���� *) 
 
(* ��Ū��������ä� lst �򥯥��å������Ȥ�Ȥäƾ�������󤹤� *) 
(* quick_sort : int list -> int list *) 
let rec quick_sort lst = match lst with 
    [] -> [] 
  | first :: rest -> quick_sort (take_less first rest) 
                     @ [first] 
                     @ quick_sort (take_greater first rest) 
 
(* �ƥ��� *) 
let test1 = quick_sort [] = [] 
let test2 = quick_sort [1] = [1] 
let test3 = quick_sort [1; 2] = [1; 2] 
let test4 = quick_sort [2; 1] = [1; 2] 
let test5 = quick_sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9] 
