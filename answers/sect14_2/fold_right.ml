(* 
(* ��Ū��������ä��ꥹ�� lst �γ����Ǥ��¤���� *) 
(* sum : int list -> int *) 
let rec sum lst = match lst with 
    [] -> 0 
  | first :: rest -> first + sum rest 
 
(* ��Ū��������ä��ꥹ�� lst ��Ĺ������� *) 
(* length : 'a list -> int *) 
let rec length lst = match lst with 
    [] -> 0 
  | first :: rest -> 1 + length rest 
 
(* ��Ū��lst1 �� lst2 �������ꤽ�����礷���ꥹ�Ȥ��֤� *) 
(* append : 'a list -> 'a list -> 'a list *) 
let rec append lst1 lst2 = match lst1 with 
    [] -> lst2 
  | first :: rest -> first :: append rest lst2 
*) 
 
(* ��Ū��init ����Ϥ�� lst �����Ǥ򱦤����� f ��ܤ����� *) 
(* fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b *) 
let rec fold_right f lst init = match lst with 
    [] -> init 
  | first :: rest -> f first (fold_right f rest init) 
 
(* ��Ū��first �� rest_result ��ä��� *) 
(* add_int : int -> int -> int *) 
let add_int first rest_result = first + rest_result 
 
(* ��Ū��������ä��ꥹ�� lst �γ����Ǥ��¤���� *) 
(* sum : int list -> int *) 
let sum lst = fold_right add_int lst 0 
 
(* �ƥ��� *) 
let test1 = sum [] = 0 
let test2 = sum [1; 2; 3] = 6 
let test3 = sum [1; 3; 7; 4; 2; 8] = 25 
 
(* ��Ū��first ��̵�뤷�� rest_result �� 1 ��ä��� *) 
(* add_one : int -> int -> int *) 
let add_one first rest_result = 1 + rest_result 
 
(* ��Ū��������ä��ꥹ�� lst ��Ĺ������� *) 
(* length : 'a list -> int *) 
let length lst = fold_right add_one lst 0 
 
(* �ƥ��� *) 
let test1 = length [] = 0 
let test2 = length [1; 2; 3] = 3 
let test3 = length [1; 3; 7; 4; 2; 8] = 6 
 
(* ��Ū��first ��ꥹ�� rest_result ����Ƭ�˲ä��� *) 
(* cons : 'a -> 'a list -> 'a list *) 
let cons first rest_result = first :: rest_result 
 
(* ��Ū��lst1 �� lst2 �������ꤽ�����礷���ꥹ�Ȥ��֤� *) 
(* append : 'a list -> 'a list -> 'a list *) 
let append lst1 lst2 = fold_right cons lst1 lst2 
 
(* �ƥ��� *) 
let test1 = append [] [] = [] 
let test2 = append [1; 2; 3] [4; 5; 6] = [1; 2; 3; 4; 5; 6] 
let test3 = append [1; 3; 7; 4; 2; 8] [9; 6; 5] = [1; 3; 7; 4; 2; 8; 9; 6; 5] 
