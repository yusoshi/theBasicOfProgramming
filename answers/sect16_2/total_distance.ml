(* ��Υ�ȵ�Υ�ι�פ���äƤ��뷿 *) 
type distance_t = { 
  kyori : float;   (* ��Υ *) 
  total : float;   (* ��Υ�ι�� *) 
} 
 
(* ��Ū����Ƭ����ꥹ����γ����ޤǤε�Υ�ι�פ�׻����� *) 
(* total_distance : distance_t list -> distance_t list *) 
let total_distance lst = 
  (* ��Ū����Ƭ����ꥹ����γ����ޤǤε�Υ�ι�פ�׻����� *) 
  (* ������ total0 �Ϥ���ޤǤε�Υ�ι�� *) 
  (* hojo : distance_t list -> float -> distance_t list *) 
  let rec hojo lst total0 = match lst with 
      [] -> [] 
    | {kyori = k; total = t} :: rest -> 
        {kyori = k; total = total0 +. k} 
        :: hojo rest (total0 +. k) 
  in hojo lst 0.0 
 
(* �ƥ��� *) 
let test = total_distance [{kyori = 0.3; total = 0.}; 
			   {kyori = 0.9; total = 0.}; 
			   {kyori = 1.4; total = 0.}; 
			   {kyori = 0.8; total = 0.}] 
	   = [{kyori = 0.3; total = 0.3}; 
	      {kyori = 0.9; total = 1.2}; 
	      {kyori = 1.4; total = 2.6}; 
	      {kyori = 0.8; total = 3.4}] 
 
(* �����������Υƥ��Ȥ� float �θ��ˤ�� true �ˤϤʤ�ʤ� *) 
