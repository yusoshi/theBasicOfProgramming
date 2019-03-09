(* ���� 14.1 *) 
 
(* ��Ū��������ä��ꥹ�Ȥ��椫������Τߤ�ȴ���Ф����ꥹ�Ȥ��֤� *) 
(* even : int list -> int *) 
let even lst = 
  List.filter (fun n -> n mod 2 = 0) lst 
 
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
  List.length (List.filter (fun gakusei -> match gakusei with 
			     {namae = n; tensuu = t; seiseki = s} -> s = "A") 
			   lst) 
 
(* �ƥ��� *) 
let test1 = count_A lst1 = 0 
let test2 = count_A lst2 = 0 
let test3 = count_A lst3 = 1 
let test4 = count_A lst4 = 2 
 
(* ���� 14.3 *) 
 
(* ��Ū���ꥹ�����ʸ�����Ĥʤ���ʸ������֤� *) 
(* concat : string list -> string *) 
let concat lst = 
  List.fold_right (fun first rest_result -> first ^ rest_result) lst "" 
 
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
  List.fold_right (fun gakusei rest_result -> match gakusei with 
		    {namae = n; tensuu = t; seiseki = s} -> t + rest_result) 
		  lst 0 
 
(* �ƥ��� *) 
let test1 = gakusei_sum lst1 = 0 
let test2 = gakusei_sum lst2 = 70 
let test3 = gakusei_sum lst3 = 155 
let test4 = gakusei_sum lst4 = 235 
