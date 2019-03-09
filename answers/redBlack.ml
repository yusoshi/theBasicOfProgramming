(* �ֹ��ڤΥ⥸�塼�� *) 
(* ex20_5.ml, ex20_6.ml �ǻ��� *) 
 
(* �֤����򼨤��� *) 
type color_t = Red | Black 
 
(* �ڤ�ɽ���� *) 
type ('a, 'b) t = 
    Empty 
  | Node of ('a, 'b) t * 'a * 'b * color_t * ('a, 'b) t 
 
(* �����ֹ��� *) 
let empty = Empty 
 
(* ��Ū���ֹ��ڤ��֤�Ϣ³���ä��� *) 
(* balance : ('a, 'b) t -> ('a, 'b) t *) 
let balance rb_tree = match rb_tree with 
    Node (Node (Node (a, xa, xb, Red, b), ya, yb, Red, c), za, zb, Black, d) 
  | Node (Node (a, xa, xb, Red, Node (b, ya, yb, Red, c)), za, zb, Black, d) 
  | Node (a, xa, xb, Black, Node (Node (b, ya, yb, Red, c), za, zb, Red, d)) 
  | Node (a, xa, xb, Black, Node (b, ya, yb, Red, Node (c, za, zb, Red, d))) 
 -> Node (Node (a, xa, xb, Black, b), ya, yb, Red, Node (c, za, zb, Black, d)) 
  | _ -> rb_tree 
 
(* ��Ū���ֹ��ڤȥ������ͤ������ä��顢��������������ֹ��ڤ��֤� *) 
(* insert : ('a, 'b) t -> 'a -> 'b -> ('a, 'b) t *) 
let insert rb_tree k v = 
  let rec ins rb_tree = match rb_tree with 
      Empty -> Node (Empty, k, v, Red, Empty) 
    | Node (left, key, value, color, right) -> 
        if k = key 
          then Node (left, k, v, color, right) 
        else if k < key 
          then balance (Node (ins left, key, value, color, right)) 
          else balance (Node (left, key, value, color, ins right)) 
  in match ins rb_tree with 
        Empty -> assert false (* ���Ф˶��ǤϤʤ� *) 
      | Node (left, key, value, color, right) -> 
          Node (left, key, value, Black, right) 
 
(* ��Ū���ֹ��ڤȥ����������ä��顢���Υ������б������ͤ��֤� *) 
(* search : ('a, 'b) t -> 'a -> 'b *) 
let rec search rb_tree k = match rb_tree with 
    Empty -> raise Not_found 
  | Node (left, key, value, color, right) -> 
      if k = key then value 
      else if k < key then search left k 
      else search right k 
 
(* ��Ū�����ƤΥΡ��ɤ򿼤�ͥ���ˬ��� *) 
(* ����� init ����Ϥ�ơ��ƥΡ��ɤǴؿ� f ����Ŭ�Ѥ��� *) 
(* ex23_3.ml �ǻ��� *) 
(* traverse : ('a -> 'b -> 'c -> 'a) -> 'a -> ('b, 'c) t -> 'a *) 
let rec traverse f init tree = match tree with 
    Empty -> init 
  | Node (left, key, value, _, right) -> 
      let result1 = f init key value in 
      let result2 = traverse f result1 left in 
      let result3 = traverse f result2 right in 
        result3 
 
(* ��Ū���ڤ���ˤ���Ρ��ɤο������ *) 
(* ex23_3.ml �ǻ��� *) 
(* length : ('a, 'b) t -> int *) 
let rec length tree = match tree with 
    Empty -> 0 
  | Node (left, key, value, _, right) -> 
      length left + 1 + length right 
