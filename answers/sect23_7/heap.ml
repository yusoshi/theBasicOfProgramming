(* �ҡ��פ�ɽ���⥸�塼�� *) 
 
(* �ҡ��פ�ź���η������Υ⥸�塼����Ǥ����ѹ��ϤǤ��ʤ� *) 
type index_t = int ref 
 
(* �Ǿ��ͤ�����ͤ� 'a ���� 
   ���Τۤ����ղþ��� 'b ���Ǥ���ҡ��פη� *) 
type ('a, 'b) t = int ref * (index_t * 'a * 'b) array 
 
(* insert �����Ȥ��˥ҡ��פ����դ��� raise ������㳰 *) 
exception Full 
 
(* split_top �����Ȥ��˥ҡ��פ������� raise ������㳰 *) 
exception Empty 
 
(* index_t ������ĥ��ߡ����� *) 
let example_index = ref (-1) 
 
(* �ͤ� example_value ��Ʊ�������ղþ��� example_info ��Ʊ������ 
   ���� max �Ĥ����Ǥ��Ǽ�Ǥ���ҡ��פ��֤� *) 
let create max example_value example_info = 
  (ref 0, Array.create max (example_index, example_value, example_info)) 
 
(* current_index �� parent_index �����Ǥ����촹���� *) 
let swap array current_index parent_index = 
  let (index_ref_c, value_c, info_c) as entry_c = array.(current_index) in 
  let (index_ref_p, value_p, info_p) as entry_p = array.(parent_index) 
  in array.(current_index) <- entry_p; 
     array.(parent_index) <- entry_c; 
     index_ref_c := parent_index;  (* ���촹���ˤȤ�ʤä� index ���դ��Ѥ��� *) 
     index_ref_p := current_index; 
     () 
 
(* �������˸����äƥҡ��פξ����������褦�����Ǥ����촹����Ԥ� *) 
let rec adjust_child num array current_index = 
  if current_index >= num then () 
  else let (_, v, _) = array.(current_index) in 
       let child1_index = 2 * current_index + 1 in 
       let child2_index = child1_index + 1 in 
       if child1_index >= num 
       then () 
       else let (_, v1, _) = array.(child1_index) in 
	    if child2_index >= num 
	    then if v <= v1 
		 then () 
		 else (swap array current_index child1_index; 
		       adjust_child num array child1_index) 
	    else let (_, v2, _) = array.(child2_index) in 
		 if v <= v1 && v <= v2 
		 then () 
		 else if v1 < v2 
		      then (swap array current_index child1_index; 
			    adjust_child num array child1_index) 
		      else (swap array current_index child2_index; 
			    adjust_child num array child2_index) 
 
(* �������˸����äƥҡ��פξ����������褦�����Ǥ����촹����Ԥ� *) 
let rec adjust_parent array current_index = 
  if current_index = 0 then () 
  else let (_, value_c, _) = array.(current_index) in 
       let parent_index = (current_index - 1) /2 in 
       let (_, value_p, _) = array.(parent_index) in 
       if value_c < value_p 
       then (swap array current_index parent_index; 
	     adjust_parent array parent_index) 
       else () 
 
(* �ҡ��פ˿��������Ǥ��ɲä��� *) 
(* ����ʾ塢����ʤ��Ȥ��� Full �� raise ���� *) 
(* �ҡ��פϡ��˲�Ū�ˡ˽��Ѥ�� *) 
let insert (num_ref, array) v info = 
  if !num_ref >= Array.length array 
  then raise Full 
  else let index = ref !num_ref in 
       array.(!num_ref) <- (index, v, info); 
       adjust_parent array !num_ref; 
       num_ref := !num_ref + 1; 
       (index, (num_ref, array)) 
 
(* �ҡ��פ� !index_ref ���ܤ����Ǥ��֤� *) 
(* index ��̵���Ǥ���� Not_found �� raise ���� *) 
let get (num_ref, array) index_ref = 
  if 0 <= !index_ref && !index_ref < !num_ref 
  then let (_, a, b) = array.(!index_ref) in 
       (a, b) 
  else raise Not_found 
 
(* �ҡ��פ� !index_ref ���ܤ��ͤ򹹿������ҡ��פ��֤� *) 
(* �ҡ��פϡ��˲�Ū�ˡ˽��Ѥ�� *) 
let set (num_ref, array) index_ref v info = 
  let (_, v', _) = array.(!index_ref) 
  in array.(!index_ref) <- (index_ref, v, info); 
     if v < v' then adjust_parent array !index_ref 
	       else adjust_child !num_ref array !index_ref; 
     (num_ref, array) 
 
(* �Ǿ����ͤ���Ĥ�ΤȤ������������ҡ��פΥڥ����֤� *) 
(* �Ǿ����ͤ���Ĥ�Τ� index ��̵�����ͤˤʤ� *) 
(* �ҡ��פ����ΤȤ��� Empty �� raise ���� *) 
(* �ҡ��פϡ��˲�Ū�ˡ˽��Ѥ�� *) 
let split_top (num_ref, array) = 
  if !num_ref = 0 then raise Empty else 
  let (index_ref, v, info) = array.(0) 
  in num_ref := !num_ref - 1;	(* ���ǿ���ҤȤĸ��餹 *) 
     array.(0) <- array.(!num_ref); 
     adjust_child !num_ref array 0; 
     index_ref := -1;        (* ���Ф�����Ƭ�����Ǥ� index_ref ��̵���ˤ��� *) 
     ((v, info), (num_ref, array)) 
 
(* �ҡ�����Υǡ����ο����֤� *) 
let length (num_ref, _) = !num_ref 
