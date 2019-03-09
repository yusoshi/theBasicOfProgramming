(* �����ҤȤ�ʬ�Υǡ�����̾�������������ӡˤ�ɽ���� *) 
type gakusei_t = { 
  namae : string;       (* ̾�� *) 
  tensuu : int;         (* ���� *) 
  seiseki : string;     (* ���� *) 
} 
 
(* gakusei_t list �� 
     - []              ���ꥹ�ȡ����뤤�� 
     - first :: rest   �ǽ�����Ǥ� first �ǻĤ�Υꥹ�Ȥ� rest 
                       ��first �� gakusei_t ���� 
                         rest �����ʻ��ȤΥ������� 
   �Ȥ����� *) 
 
(* gakusei_t list ���Υǡ������� *) 
let lst1 = [] 
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}] 
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}] 
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
            {namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}] 
 
(* ��Ū�������ꥹ�� lst �Τ������Ӥ� A �οͤο����֤� *) 
(* count_A : gakusei_t list -> int *) 
let rec count_A lst = match lst with 
    [] -> 0 
  | {namae = n; tensuu = t; seiseki = s} :: rest 
      -> if s = "A" then 1 + count_A rest 
                    else count_A rest 
 
(* �ƥ��� *) 
let test1 = count_A lst1 = 0 
let test2 = count_A lst2 = 0 
let test3 = count_A lst3 = 1 
let test4 = count_A lst4 = 2 
