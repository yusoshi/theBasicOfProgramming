(* ���餫���� ex10_7.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex10_7.ml" 
 
(* person_t list ���Υǡ������� *) 
let lst1 = [person1] 
let lst2 = [person2] 
let lst3 = [person1; person2; person3] 
let lst4 = [person2; person1; person1] 
 
(* person1, person2, person3 ������ˤĤ��Ƥ� ex08_3.ml �򻲾� *) 
 
(* ��Ū���ͤΥꥹ�� lst �Τ�����¿�η�շ����֤� *) 
(* saita_ketsueki : person_t list -> string *) 
let saita_ketsueki lst = 
  let (a, o, b, ab) = ketsueki_shukei lst in 
  let saidai = max (max a o) (max b ab) in 
  if saidai = a then "A" 
  else if saidai = o then "O" 
  else if saidai = b then "B" 
  else "AB" 
 
(* �ƥ��� *) 
let test1 = saita_ketsueki lst1 = "A" 
let test2 = saita_ketsueki lst2 = "B" 
let test3 = saita_ketsueki lst3 = "A" 
  (* Ʊ���ΤȤ��� A, O, B, AB �ν�˸��Ĥ��ä���Τ��֤���Ƥ��ޤ� *) 
let test4 = saita_ketsueki lst4 = "A" 
