(* ��Ū��������ä��դ��Ĥδؿ�����������ؿ����֤� *) 
(* compose : ('b -> 'c) -> ('a -> 'b) -> 'a -> 'c *) 
let compose f g = 
  let h x = f (g x) in 
  h 
 
(* ��Ū��3 ��ä��� *) 
(* add3: int -> int *) 
let add3 x = x + 3 
 
(* ��Ū��2 ��ݤ��� *) 
(* times2: int -> int *) 
let times2 x = x * 2 
 
(* �ƥ��� *) 
let test = (compose times2 add3) 4 = 14 
