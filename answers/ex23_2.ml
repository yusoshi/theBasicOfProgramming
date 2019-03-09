(* ���餫���� ex23_1.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex23_1.ml" (* Heap �⥸�塼������ *) 
 
(* ��Ū��������ä��ҡ��פ����Ǥ򾮤�����˼��Ф��ƥꥹ�Ȥˤ����֤� *) 
(* ������ lst �Ϥ���ޤǤ˥ҡ��פ�����Ф������ǤΥꥹ�� *) 
(* extract_all_elements : ('a, unit) Heap.t -> 'a list -> 'a list *) 
let rec extract_all_elements heap lst = 
  try 
    let ((a, ()), heap) = Heap.split_top heap 
    in extract_all_elements heap (a :: lst) 
  with Heap.Empty -> lst 
 
(* ��Ū��������ä��ꥹ�Ȥ�ҡ��ץ����Ȥ�Ȥä��礭������¤٤� *) 
(* heap_sort : 'a list -> 'a list *) 
let heap_sort lst = match lst with 
    [] -> [] 
  | a :: rest -> 
      let size = List.length lst in 
      let heap = List.fold_left 
		   (fun heap x -> 
		     let (_, heap) = Heap.insert heap x () in heap) 
		   (Heap.create size a ()) lst in 
      extract_all_elements heap [] 
 
(* �ƥ��� *) 
let test1 = heap_sort [] = [] 
let test2 = heap_sort [1] = [1] 
let test3 = heap_sort [1; 2] = [2; 1] 
let test4 = heap_sort [2; 1] = [2; 1] 
let test5 = heap_sort [5; 3; 8; 1; 7; 4] = [8; 7; 5; 4; 3; 1] 
