(* ��Ū����ο��ȵ��ο��������ä���­���ܿ����֤� *) 
(* tsurukame_no_ashi : int -> int -> int *) 
let tsurukame_no_ashi tsuru kame = tsuru * 2 + kame * 4 
 
(* �ƥ��� *) 
let test1 = tsurukame_no_ashi 0 0 = 0 
let test2 = tsurukame_no_ashi 1 1 = 6 
let test3 = tsurukame_no_ashi 2 3 = 16 
