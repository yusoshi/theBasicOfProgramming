(* 18.1 *) 
 
#use "sect18_1/price.ml" ;; 
price "�ȥޥ�" yaoya_list ;; 
price "���㤬����" yaoya_list ;; 
 
(* 18.2 *) 
 
#use "sect18_2/total_price.ml" ;; 
 
(* 18.3 *) 
 
#use "sect18_3/total_price.ml" ;; 
total_price ["���ޤͤ�"; "�ˤ󤸤�"] yaoya_list ;; 
total_price ["���ޤͤ�"; "���㤬����"; "�ˤ󤸤�"] yaoya_list ;; 
 
(* 18.4 *) 
 
(* 
raise Not_found ;; 
1 + raise Not_found ;; 
*) 
exception Urikire ;; 
(* 
raise Urikire ;; 
*) 
exception Urikire of string ;; 
(* 
raise (Urikire ("���㤬����")) ;; 
*) 
 
(* 18.5 *) 
 
#use "sect18_5/total_price.ml" ;; 
total_price ["���ޤͤ�"; "�ˤ󤸤�"] yaoya_list ;; 
total_price ["���ޤͤ�"; "���㤬����"; "�ˤ󤸤�"] yaoya_list ;; 
 
(* 18.6 *) 
 
#use "sect18_6/times.ml" ;; 
 
(* 18.7 *) 
