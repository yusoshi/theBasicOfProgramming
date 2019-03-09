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
 
(* ��Ū�������ꥹ�� lst �Τ������Ӥ� seiseki0 �οͤο����֤� *) 
(* count : gakusei_t list -> string -> int *) 
let rec count lst seiseki0 = match lst with 
    [] -> 0 
  | {namae = n; tensuu = t; seiseki = s} :: rest 
      -> if s = seiseki0 then 1 + count rest seiseki0 
                         else count rest seiseki0 
 
(* ��Ū�������ꥹ�� lst �Τ������Ӥ� A �οͤο����֤� *) 
(* count_A : gakusei_t list -> int *) 
let count_A lst = count lst "A" 
 
(* �ƥ��� *) 
let test1 = count_A lst1 = 0 
let test2 = count_A lst2 = 0 
let test3 = count_A lst3 = 1 
let test4 = count_A lst4 = 2 
 
(* ��Ū�������ꥹ�� lst �Τ������Ӥ� B �οͤο����֤� *) 
(* count_B : gakusei_t list -> int *) 
let count_B lst = count lst "B" 
 
(* �ƥ��� *) 
let test5 = count_B lst1 = 0 
let test6 = count_B lst2 = 1 
let test7 = count_B lst3 = 1 
let test8 = count_B lst4 = 1 
