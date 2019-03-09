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
 
(* ��Ū�������ꥹ�� lst �Τ������Ӥ� seiseki0 �οͤο����֤� *) 
(* count : gakusei_t list -> string -> int *) 
let count lst seiseki0 = 
  (* ��Ū�����������Ӥ� A ���ɤ�����Ĵ�٤� *) 
  (* is_seiseki0 : gakusei_t -> bool *) 
  let is_seiseki0 gakusei = match gakusei with 
    {namae = n; tensuu = t; seiseki = s} -> s = seiseki0 
  in List.length (List.filter is_seiseki0 lst) 
 
(* ��Ū�������ꥹ�� lst �Τ������Ӥ� A �οͤο����֤� *) 
(* count_A : gakusei_t list -> int *) 
let count_A lst = count lst "A" 
 
(* �ƥ��� *) 
let test1 = count_A lst1 = 0 
let test2 = count_A lst2 = 0 
let test3 = count_A lst3 = 1 
let test4 = count_A lst4 = 2 
let test5 = count lst4 "B" = 1 
let test6 = count lst4 "C" = 0 
