(* ��Ū������ n �γ�����֤� *) 
(* Fac.f : int -> int *) 
let rec f n = 
  if n = 0 then 1 else n * f (n - 1) 
