(* ��Ū�����ߤε��� t �����Ŭ�٤�ɽ��ʸ�����׻����� *) 
(* kion : int -> string *) 
let kion t = 
  if t < 15 then "����" 
            else if t <= 25 then "��Ŭ" 
                            else "����" 
 
(* �ƥ��� *) 
let test1 = kion  7 = "����" 
let test2 = kion 15 = "��Ŭ" 
let test3 = kion 20 = "��Ŭ" 
let test4 = kion 25 = "��Ŭ" 
let test5 = kion 28 = "����" 
