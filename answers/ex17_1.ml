(* ���餫���� sect17_1/to_seireki.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "sect17_1/to_seireki.ml" 
 
(* ��Ū�����ޤ줿ǯ��ǯ��ȸ��ߤ�ǯ��������ä���ǯ����֤� *) 
(* nenrei : nengou_t -> nengou_t -> int *) 
let nenrei nengou1 nengou2 = 
  to_seireki nengou2 - to_seireki nengou1 
 
(* �ƥ��� *) 
let test1 = nenrei (Showa (42)) (Heisei (18)) = 39 
let test2 = nenrei (Heisei (11)) (Heisei (18)) = 7 
let test3 = nenrei (Meiji (41)) (Heisei (17)) = 97 
