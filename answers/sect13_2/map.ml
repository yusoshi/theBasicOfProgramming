(* ���餫���� sect08_6/hyouka.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "sect08_6/hyouka.ml" 
 
(* 
(* ��Ū���¿��Υꥹ�� lst ������������Ǥ�ʿ�����Υꥹ�Ȥ��֤� *) 
(* map_sqrt : float list -> float list *) 
let rec map_sqrt lst = match lst with 
    [] -> [] 
  | first :: rest -> sqrt first :: map_sqrt rest 
*) 
 
(* 
(* ��Ū�������Υꥹ�� lst �����������Ӥ����줿�ꥹ�Ȥ��֤� *) 
(* map_hyouka : gakusei_t list -> gakusei_t list *) 
let rec map_hyouka lst = match lst with 
    [] -> [] 
  | first :: rest -> hyouka first :: map_hyouka rest 
*) 
 
(* ��Ū���ؿ� f �ȥꥹ�� lst �������� f ��ܤ����ꥹ�Ȥ��֤� *) 
(* map : ('a -> 'b) -> 'a list -> 'b list *) 
let rec map f lst = match lst with 
    [] -> [] 
  | first :: rest -> f first :: map f rest 
 
(* ��Ū���¿��Υꥹ�� lst ������������Ǥ�ʿ�����Υꥹ�Ȥ��֤� *) 
(* map_sqrt : float list -> float list *) 
let map_sqrt lst = map sqrt lst 
 
(* �ƥ��� *) 
let test1 = map_sqrt [] = [] 
let test2 = map_sqrt [1.0; 4.0] = [1.0; 2.0] 
let test3 = map_sqrt [9.0; 16.0; 4.0; 0.0] = [3.0; 4.0; 2.0; 0.0] 
 
(* ��Ū�������Υꥹ�� lst �����������Ӥ����줿�ꥹ�Ȥ��֤� *) 
(* map_hyouka : gakusei_t list -> gakusei_t list *) 
let map_hyouka lst = map hyouka lst 
 
(* gakusei_t list ���Υǡ������� *) 
let lst1 = [] 
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}] 
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}] 
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
            {namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}] 
 
(* �ƥ��� *) 
let test1 = map_hyouka lst1 = [] 
let test2 = map_hyouka lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}] 
let test3 = map_hyouka lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
			       {namae = "kaneko"; tensuu = 85; seiseki = "A"}] 
let test3 = map_hyouka lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
			       {namae = "asai"; tensuu = 70; seiseki = "B"}; 
			       {namae = "kaneko"; tensuu = 85; seiseki = "A"}] 
