(* ���餫���� ex08_3.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex08_3.ml" 
 
(* ��Ū��person_t ���Υǡ��������շ��򼨤�ʸ���֤� *) 
(* ketsueki_hyoji : person_t -> string *) 
let ketsueki_hyoji person = match person with 
  {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; ketsueki = k} -> 
    n ^ "����η�շ��� " ^ k ^ " ���Ǥ�" 
 
(* �ƥ��� *) 
let test1 = ketsueki_hyoji person1 = "���椵��η�շ��� A ���Ǥ�" 
let test2 = ketsueki_hyoji person2 = "�ܸ�����η�շ��� B ���Ǥ�" 
let test3 = ketsueki_hyoji person3 = "��¼����η�շ��� O ���Ǥ�" 
 
(* person1, person2, person3 ������ˤĤ��Ƥ� ex08_3.ml �򻲾� *) 
