(* ���餫���� ex08_3.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex08_3.ml" 
 
(* person_t list ���Υǡ������� *) 
let lst1 = [] 
let lst2 = [person1] 
let lst3 = [person2] 
let lst4 = [person1; person2; person3] 
let lst5 = [person2; person1; person1] 
 
(* person1, person2, person3 ������ˤĤ��Ƥ� ex08_3.ml �򻲾� *) 
 
(* ��Ū����շ��� A �οͤο����֤� *) 
(* count_ketsueki_A : person_t list -> int *) 
let rec count_ketsueki_A lst = match lst with 
    [] -> 0 
  | {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; 
     ketsueki = k} :: rest -> 
      if k = "A" then 1 + count_ketsueki_A rest 
                 else count_ketsueki_A rest 
 
(* �ƥ��� *) 
let test1 = count_ketsueki_A lst1 = 0 
let test2 = count_ketsueki_A lst2 = 1 
let test3 = count_ketsueki_A lst3 = 0 
let test4 = count_ketsueki_A lst4 = 1 
let test5 = count_ketsueki_A lst5 = 2 
