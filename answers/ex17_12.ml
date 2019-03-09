(* ���餫���� ex09_10.ml, ex17_10.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex09_10.ml" (* ekikan_t, global_ekikan_list ����� *) 
#use "ex17_10.ml" (* ekikan_tree_t ����� *) 
 
(* ��Ū��������ä� kiten, shuten, kyori �� ekikan_tree �����������ڤ��֤� *) 
(* insert1 : ekikan_tree_t -> string -> string -> float -> ekikan_tree_t *) 
let rec insert1 ekikan_tree kiten shuten kyori = match ekikan_tree with 
    Empty -> Node (Empty, kiten, [(shuten, kyori)], Empty) 
  | Node (left, ekimei, lst, right) -> 
      if kiten < ekimei 
      then Node (insert1 left kiten shuten kyori, ekimei, lst, right) 
      else if ekimei < kiten 
      then Node (left, ekimei, lst, insert1 right kiten shuten kyori) 
      else Node (left, ekimei, (shuten, kyori) :: lst, right) 
 
(* ��Ū��������ä� ekikan ����� ekikan_tree �����������ڤ��֤� *) 
(* insert_ekikan : ekikan_tree_t -> ekikan_t -> ekikan_tree_t *) 
let insert_ekikan ekikan_tree ekikan = match ekikan with 
  {kiten = k; shuten = s; keiyu = y; kyori = r; jikan = j} -> 
    insert1 (insert1 ekikan_tree s k r) k s r 
 
(* �ش֤��� *) 
let ekikan1 = 
  {kiten="����"; shuten="������"; keiyu="�ݥ�����"; kyori=1.8; jikan=3} 
let ekikan2 = 
  {kiten="������"; shuten="謲�ë"; keiyu="�ݥ�����"; kyori=1.2; jikan=2} 
let ekikan3 = 
  {kiten="謲�ë"; shuten="��ڱ�"; keiyu="�ݥ�����"; kyori=1.8; jikan=2} 
 
(* �ƥ��� *) 
let tree1 = insert_ekikan Empty ekikan1 
let test1 = tree1 = 
  Node (Empty, "������", [("����", 1.8)], 
	Node (Empty, "����", [("������", 1.8)], Empty)) 
let tree2 = insert_ekikan tree1 ekikan2 
let test2 = tree2 = 
  Node (Empty, "������", [("謲�ë", 1.2); ("����", 1.8)], 
	Node (Empty, "����", [("������", 1.8)], 
	      Node (Empty, "謲�ë", [("������", 1.2)], Empty))) 
let tree3 = insert_ekikan tree2 ekikan3 
let test3 = tree3 = 
  Node (Node (Empty, "��ڱ�", [("謲�ë", 1.8)], Empty), 
	"������", [("謲�ë", 1.2); ("����", 1.8)], 
        Node (Empty, 
	      "����", [("������", 1.8)], 
	      Node (Empty, 
		    "謲�ë", [("��ڱ�", 1.8); ("������", 1.2)], 
		    Empty))) 
