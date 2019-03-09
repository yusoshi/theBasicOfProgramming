(* �����ҤȤ�ʬ�Υǡ�����̾�������������ӡˤ�ɽ���� *) 
type gakusei_t = { 
  namae : string;       (* ̾�� *) 
  tensuu : int;         (* ���� *) 
  seiseki : string;     (* ���� *) 
} 
 
(* �����Υǡ������� *) 
let gakusei1 = {namae="nakamura"; tensuu=90; seiseki="A"} 
let gakusei2 = {namae="miyahara"; tensuu=80; seiseki="A"} 
let gakusei3 = {namae="sato"; tensuu=75; seiseki="B"} 
let gakusei4 = {namae="idehara"; tensuu=70; seiseki="B"} 
let gakusei5 = {namae="tsubata"; tensuu=65; seiseki="C"} 
let gakusei6 = {namae="asai"; tensuu=60; seiseki="C"} 
 
(* �����Υꥹ�Ȥ��� *) 
let lst1 = [] 
let lst2 = [gakusei2] 
let lst3 = [gakusei3; gakusei4] 
let lst4 = [gakusei4; gakusei5; gakusei1] 
let lst5 = [gakusei4; gakusei1; gakusei6; gakusei5; gakusei2; gakusei3] 
 
(* 
(* ��Ū�������ꥹ�� lst �Τ��������ӤοͿ��򽸷פ��� *) 
(* shukei : gakusei_t list -> int * int * int * int *) 
let rec shukei lst = match lst with 
    [] -> (0, 0, 0, 0) 
  | {namae = n; tensuu = t; seiseki = s} :: rest -> 
      let shukei_rest = shukei rest in 
      match shukei_rest with 
        (a, b, c, d) -> if s = "A" then (a + 1, b, c, d) 
                        else if s = "B" then (a, b + 1, c, d) 
                        else if s = "C" then (a, b, c + 1, d) 
                        else (a, b, c, d + 1) 
*) 
 
(* ��Ū�������ꥹ�� lst �Τ��������ӤοͿ��򽸷פ��� *) 
(* shukei : gakusei_t list -> int * int * int * int *) 
let rec shukei lst = match lst with 
    [] -> (0, 0, 0, 0) 
  | {namae = n; tensuu = t; seiseki = s} :: rest -> 
      let (a, b, c, d) = shukei rest in 
      if s = "A" then (a + 1, b, c, d) 
      else if s = "B" then (a, b + 1, c, d) 
      else if s = "C" then (a, b, c + 1, d) 
      else (a, b, c, d + 1) 
 
(* �ƥ��� *) 
let test1 = shukei lst1 = (0, 0, 0, 0) 
let test2 = shukei lst2 = (1, 0, 0, 0) 
let test3 = shukei lst3 = (0, 2, 0, 0) 
let test4 = shukei lst4 = (1, 1, 1, 0) 
let test5 = shukei lst5 = (2, 2, 2, 0) 
