(* ʸ����ˤĤ������ *) 
let counter = ref (-1) 
 
(* ��Ū��ʸ�������󡢰ۤʤ������Ĥ����֤� *) 
(* gensym : string -> string *) 
let gensym str = 
  (counter := !counter + 1; 
   str ^ string_of_int !counter) 
 
(* �ƥ��� *) 
let test1 = gensym "a" = "a0" 
let test2 = gensym "a" = "a1" 
let test3 = gensym "x" = "x2" 
