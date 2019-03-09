(* int list �� 
     - []              ���ꥹ�ȡ����뤤�� 
     - first :: rest   �ǽ�����Ǥ� first �ǻĤ�Υꥹ�Ȥ� rest 
                       ��rest �����ʻ��ȤΥ������� 
   �Ȥ����� *) 
 
(* ��Ū��������ä��ꥹ�� lst �γ����Ǥ��¤���� *) 
(* sum : int list -> int *) 
let rec sum lst = match lst with 
    [] -> 0 
  | first :: rest -> first + sum rest 
 
(* �ƥ��� *) 
let test1 = sum [] = 0 
let test2 = sum [2] = 2 
let test3 = sum [1; 3] = 4 
let test4 = sum [1; 2; 3; 4; 5; 6; 7; 8; 9; 10] = 55 
