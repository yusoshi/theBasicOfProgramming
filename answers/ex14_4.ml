(* �����ҤȤ�ʬ�Υǡ�����̾�������������ӡˤ�ɽ���� *) 
type gakusei_t = { 
  namae : string;       (* ̾�� *) 
  tensuu : int;         (* ���� *) 
  seiseki : string;     (* ���� *) 
} 
 
(* gakusei_t list ���Υǡ������� *) 
let lst1 = [] 
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}] 
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}] 
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
            {namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}] 
 
(* ��Ū��������ä������ꥹ�� lst �������ι�פ��֤� *) 
(* add_tokuten : gakusei_t -> int -> int *) 
let add_tokuten gakusei rest_result = match gakusei with 
  {namae = n; tensuu = t; seiseki = s} -> t + rest_result 
 
(* ��Ū��������ä������ꥹ�� lst �������ι�פ��֤� *) 
(* gakusei_sum : gakusei_t list -> int *) 
let gakusei_sum lst = List.fold_right add_tokuten lst 0 
 
(* �ƥ��� *) 
let test1 = gakusei_sum lst1 = 0 
let test2 = gakusei_sum lst2 = 70 
let test3 = gakusei_sum lst3 = 155 
let test4 = gakusei_sum lst4 = 235 
