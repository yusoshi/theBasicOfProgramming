(* ���餫���� ex08_3.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex08_3.ml" 
 
(* person_t list ���Υǡ������� *) 
let lst = [person1; person2; person3] 
 
(* person1, person2, person3 ������ˤĤ��Ƥ� ex08_3.ml �򻲾� *) 
 
(* ��Ū���ͤΥꥹ�� lst �Τ�����շ��� ketsueki0 �οͤο����֤� *) 
(* count_ketsueki : person_t list -> string -> int *) 
let rec count_ketsueki lst ketsueki0 = match lst with 
    [] -> 0 
  | {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; 
     ketsueki = k} :: rest -> 
       if k = ketsueki0 then 1 + count_ketsueki rest ketsueki0 
			else count_ketsueki rest ketsueki0 
 
(* �ƥ��� *) 
let test1 = count_ketsueki [] "A" = 0 
let test2 = count_ketsueki lst "A" = 1 
let test3 = count_ketsueki lst "O" = 1 
let test4 = count_ketsueki lst "B" = 1 
let test5 = count_ketsueki lst "AB" = 0 
