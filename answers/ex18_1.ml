(* ���餫���� ex08_3.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex08_3.ml" 
 
(* person_t list ���Υǡ������� *) 
let lst1 = [person1; person2; person3] 
let lst2 = [person3; person2; person1] 
 
(* person1, person2, person3 ������ˤĤ��Ƥ� ex08_3.ml �򻲾� *) 
 
(* ��Ū��lst �˴ޤޤ��ǽ�� A ���οͤ��֤� *) 
(* first_A : person_t list -> person_t option *) 
let rec first_A lst = match lst with 
    [] -> None 
  | first :: rest -> match first with 
      {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; ketsueki = k} -> 
        if k = "A" then Some (first) else first_A rest 
 
(* �ƥ��� *) 
let test1 = first_A [] = None 
let test2 = first_A lst1 = Some (person1) 
let test3 = first_A lst2 = Some (person1) 
