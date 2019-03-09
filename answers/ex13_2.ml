(* ���餫���� ex08_3.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex08_3.ml" 
 
(* person_t list ���Υǡ������� *) 
let lst = [person1; person2; person3] 
 
(* person1, person2, person3 ������ˤĤ��Ƥ� ex08_3.ml �򻲾� *) 
 
(* ��Ū��person_t ���Υǡ�������̾�����֤� *) 
(* take_name : person_t -> string *) 
let take_name person = match person with 
  {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; ketsueki = k} -> n 
 
(* �ƥ��� *) 
let test1 = take_name person1 = "����" 
let test2 = take_name person2 = "�ܸ�" 
let test3 = take_name person3 = "��¼" 
 
(* ��Ū��lst �˴ޤޤ��ͤ�̾���Υꥹ�Ȥ��֤� *) 
(* person_name : person_t list -> string list *) 
let person_name lst = List.map take_name lst 
 
(* �ƥ��� *) 
let test4 = person_name [] = [] 
let test5 = person_name lst = ["����"; "�ܸ�"; "��¼"] 
