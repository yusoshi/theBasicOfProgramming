(* ���餫���� ex08_3.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex08_3.ml" 
;; 
 
(* person_t -> string *) 
fun person -> match person with 
  {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; ketsueki = k} -> n 
;; 
 
(* �ޤ��� *) 
 
(* person_t -> string *) 
fun {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; ketsueki = k} -> n 
