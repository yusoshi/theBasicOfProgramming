(* ����ʱߡ� *) 
let jikyu = 950 
 
(* ͥ������ʱߡ� *) 
let yugu_jikyu = 980 
 
(* ���ܵ�ʱߡ� *) 
let kihonkyu = 100 
 
(* ��Ū��Ư�������ֿ� x �˱���������Х������׻����� *) 
(* kyuyo : int -> int *) 
let kyuyo x = 
  kihonkyu + x * (if x < 30 then jikyu else yugu_jikyu) 
 
(* �ƥ��� *) 
let test1 = kyuyo 25 = 23850 
let test2 = kyuyo 28 = 26700 
let test3 = kyuyo 31 = 30480 
