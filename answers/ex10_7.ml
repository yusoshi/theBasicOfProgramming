(* ���餫���� ex08_3.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex08_3.ml" 
 
(* person_t list ���Υǡ������� *) 
let lst1 = [] 
let lst2 = [person1] 
let lst3 = [person2] 
let lst4 = [person1; person2; person3] 
let lst5 = [person2; person1; person1] 
 
(* person1, person2, person3 ������ˤĤ��Ƥ� ex08_3.ml �򻲾� *) 
 
(* ��Ū���ͤΥꥹ�� lst �Τ����Ʒ�շ��οͤ����ͤ��뤫�򽸷פ��� *) 
(* ketsueki_shukei : person_t list -> int * int * int * int *) 
let rec ketsueki_shukei lst = match lst with 
    [] -> (0, 0, 0, 0) 
  | {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; 
     ketsueki = k} :: rest -> 
      let (a, o, b, ab) = ketsueki_shukei rest in 
      if k = "A" then (a + 1, o, b, ab) 
      else if k = "O" then (a, o + 1, b, ab) 
      else if k = "B" then (a, o, b + 1, ab) 
      else (a, o, b, ab + 1) 
 
(* �ƥ��� *) 
let test1 = ketsueki_shukei lst1 = (0, 0, 0, 0) 
let test2 = ketsueki_shukei lst2 = (1, 0, 0, 0) 
let test3 = ketsueki_shukei lst3 = (0, 0, 1, 0) 
let test4 = ketsueki_shukei lst4 = (1, 1, 1, 0) 
let test5 = ketsueki_shukei lst5 = (2, 0, 1, 0) 
