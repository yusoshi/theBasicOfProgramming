(* ���� 14.1 *) 
 
(* ��Ū��������ä��ꥹ�Ȥ��椫������Τߤ�ȴ���Ф����ꥹ�Ȥ��֤� *) 
(* even : int list -> int *) 
let even lst = 
  (* ��Ū��������ä��������������ɤ�����Ƚ�ꤹ�� *) 
  (* is_even : int -> bool *) 
  let is_even n = n mod 2 = 0 
  in List.filter is_even lst 
 
(* �ƥ��� *) 
let test1 = even [] = [] 
let test2 = even [3] = [] 
let test3 = even [2] = [2] 
let test4 = even [2; 1; 6; 4; 7] = [2; 6; 4] 
let test5 = even [1; 2; 6; 4; 7] = [2; 6; 4] 
 
(* ���� 14.2 *) 
 
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
 
(* ��Ū�������ꥹ�� lst �Τ������Ӥ� A �οͤο����֤� *) 
(* count_A : gakusei_t list -> int *) 
let count_A lst = 
  (* ��Ū�����������Ӥ� A ���ɤ�����Ĵ�٤� *) 
  (* is_A : gakusei_t -> bool *) 
  let is_A gakusei = match gakusei with 
    {namae = n; tensuu = t; seiseki = s} -> s = "A" 
  in List.length (List.filter is_A lst) 
 
(* �ƥ��� *) 
let test1 = count_A lst1 = 0 
let test2 = count_A lst2 = 0 
let test3 = count_A lst3 = 1 
let test4 = count_A lst4 = 2 
 
(* ���� 14.3 *) 
 
(* ��Ū���ꥹ�����ʸ�����Ĥʤ���ʸ������֤� *) 
(* concat : string list -> string *) 
let concat lst = 
  (* ��Ū���դ��Ĥ�ʸ�����Ĥʤ��� *) 
  (* append_string : string -> string -> string *) 
  let append_string first rest_result = first ^ rest_result 
  in List.fold_right append_string lst "" 
 
(* �ƥ��� *) 
let test1 = concat [] = "" 
let test2 = concat ["��"] = "��" 
let test3 = concat ["��"; "��"; "��"; "��"] = "�ղƽ���" 
 
(* ���� 14.4 *) 
 
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
(* gakusei_sum : gakusei_t list -> int *) 
let gakusei_sum lst = 
  (* ��Ū��������ä������ꥹ�� lst �������ι�פ��֤� *) 
  (* add_tokuten : gakusei_t -> int -> int *) 
  let add_tokuten gakusei rest_result = match gakusei with 
    {namae = n; tensuu = t; seiseki = s} -> t + rest_result 
  in List.fold_right add_tokuten lst 0 
 
(* �ƥ��� *) 
let test1 = gakusei_sum lst1 = 0 
let test2 = gakusei_sum lst2 = 70 
let test3 = gakusei_sum lst3 = 155 
let test4 = gakusei_sum lst4 = 235 
