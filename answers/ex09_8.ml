(* ���餫���� ex05_3.ml, ex08_3.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex05_3.ml" 
#use "ex08_3.ml" 
 
(* person_t list ���Υǡ������� *) 
let lst1 = [] 
let lst2 = [person1] 
let lst3 = [person2] 
let lst4 = [person1; person2; person3] 
let lst5 = [person2; person1; person1] 
 
(* person1, person2, person3 ������ˤĤ��Ƥ� ex08_3.ml �򻲾� *) 
 
(* ��Ū�������¤οͤ�̾���Υꥹ�Ȥ��֤� *) 
(* otomeza : person_t list -> string list *) 
let rec otomeza lst = match lst with 
    [] -> [] 
  | {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; 
     ketsueki = k} :: rest -> 
      if seiza ts h = "������" then n :: otomeza rest 
			       else otomeza rest 
 
(* �ƥ��� *) 
let test1 = otomeza lst1 = [] 
let test2 = otomeza lst2 = ["����"] 
let test3 = otomeza lst3 = [] 
let test4 = otomeza lst4 = ["����"] 
let test5 = otomeza lst5 = ["����"; "����"] 
