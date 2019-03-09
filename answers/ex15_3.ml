(* ��Ū��2 ���� n �ޤǤμ������������� 2 ���� n �ޤǤ��ǿ����֤� *) 
(* sieve : int list -> int list *) 
let rec sieve lst = match lst with 
    [] -> [] 
  | first :: rest -> 
      first :: sieve (List.filter (fun x -> x mod first <> 0) rest) 
 
(* �Ƶ��Τ��Ӥ� lst ��Ĺ�����������ʤäƤ���Τǡ������� [] �ˤʤ���ߤ��� *) 
 
(* �ƥ��� *) 
let test1 = sieve [2; 3; 4; 5; 6; 7; 8; 9; 10] = [2; 3; 5; 7] 
 
(* ��Ū��2 ���������ä������� n �ޤǤμ������Υꥹ�Ȥ��֤� *) 
(* two_to_n : int -> int list *) 
let two_to_n n = 
  let rec loop i = 
    if i <= n then i :: loop (i + 1) else [] in 
  loop 2 
 
(* �ƥ��� *) 
let test2 = two_to_n 10 = [2; 3; 4; 5; 6; 7; 8; 9; 10] 
 
(* ��Ū��2 ���������ä������� n �ޤǤ��ǿ����֤� *) 
(* prime : int -> int list *) 
let prime n = sieve (two_to_n n) 
 
(* �ƥ��� *) 
let test3 = prime 10 = [2; 3; 5; 7] 
