(* ��Ū����ȵ��ο��ι�פ�­�ο��ι�פ������ä�����ο����֤� *) 
(* tsurukame : int -> int -> int *) 
let tsurukame gokei ashi = (gokei * 4 - ashi) / 2 
 
(* �ƥ��� *) 
let test1 = tsurukame 0 0 = 0 (* 0 = 2 * 0 + 4 * (0 - 0) *) 
let test2 = tsurukame 5 12 = 4 (* 12 = 2 * 4 + 4 * (5 - 4) *) 
let test3 = tsurukame 12 34 = 7 (* 34 = 2 * 7 + 4 * (12 - 7) *) 
