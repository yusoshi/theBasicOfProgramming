(* ��Ū��Ϳ����줿�ꥹ�Ȥ�ս�ˤ����֤� *) 
(* reverse : 'a list -> 'a list *) 
let reverse lst = 
  (* ��Ū��(lst �εս�Υꥹ��) @ result ���֤� *) 
  (* ������ result �Ϥ���ޤǤ����Ǥ�ս�ˤ����ꥹ�Ȥ򼨤� *) 
  let rec rev lst result = match lst with 
      [] -> result 
    | first :: rest -> rev rest (first :: result) 
  in rev lst [] 
 
(* �ƥ��� *) 
let test1 = reverse [] = [] 
let test2 = reverse [1] = [1] 
let test3 = reverse [1; 2; 3; 4; 5] = [5; 4; 3; 2; 1] 
