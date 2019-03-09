(* �����ҤȤ�ʬ�Υǡ�����̾�������������ӡˤ�ɽ���� *) 
type gakusei_t = { 
  namae : string;       (* ̾�� *) 
  tensuu : int;         (* ���� *) 
  seiseki : string;     (* ���� *) 
} 
 
(* ��Ū�������Υǡ��� gakusei �����������ӤΤĤ����ǡ������֤� *) 
(* hyouka : gakusei_t -> gakusei_t  *) 
let hyouka gakusei = match gakusei with 
  {namae = n; tensuu = t; seiseki = s} -> 
    if t >= 80 then      {namae = n; tensuu = t; seiseki = "A"} 
    else if t >= 70 then {namae = n; tensuu = t; seiseki = "B"} 
    else if t >= 60 then {namae = n; tensuu = t; seiseki = "C"} 
    else                 {namae = n; tensuu = t; seiseki = "D"} 
 
(* �ƥ��� *) 
let test1 = hyouka {namae="asai"; tensuu=90; seiseki=""} 
                 = {namae="asai"; tensuu=90; seiseki="A"} 
let test2 = hyouka {namae="asai"; tensuu=80; seiseki=""} 
                 = {namae="asai"; tensuu=80; seiseki="A"} 
let test3 = hyouka {namae="asai"; tensuu=75; seiseki=""} 
                 = {namae="asai"; tensuu=75; seiseki="B"} 
let test4 = hyouka {namae="asai"; tensuu=70; seiseki=""} 
                 = {namae="asai"; tensuu=70; seiseki="B"} 
let test5 = hyouka {namae="asai"; tensuu=65; seiseki=""} 
                 = {namae="asai"; tensuu=65; seiseki="C"} 
let test6 = hyouka {namae="asai"; tensuu=60; seiseki=""} 
                 = {namae="asai"; tensuu=60; seiseki="C"} 
let test7 = hyouka {namae="asai"; tensuu=55; seiseki=""} 
                 = {namae="asai"; tensuu=55; seiseki="D"} 
