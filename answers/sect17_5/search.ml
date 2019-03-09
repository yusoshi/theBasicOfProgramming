(* ¿����ڤ�ɽ���� *) 
type 'a tree_t = Empty                          (* ������ *) 
               | Leaf of 'a                         (* �� *) 
               | Node of 'a tree_t * 'a * 'a tree_t (* �� *) 
 
(* tree �� 
     - Empty            �����ڡ����뤤�� 
     - Leaf (n)         �ͤ� n ���ա����뤤�� 
     - Node (t1, n, t2) �����ڤ� t1, �ͤ� n�������ڤ� 
                        t2 �Ǥ���褦���� 
                       ��t1 �� t2 �����ʻ��ȤΥ������� 
   �Ȥ����� *) 
 
(* ��ʬõ���ڤ��� *) 
let tree1 = Empty 
let tree2 = Leaf (3) 
let tree3 = Node (Leaf (1), 2, Leaf (3)) 
let tree4 = Node (Empty, 7, Leaf (9)) 
let tree5 = Node (tree3, 6, tree4) 
 
(* ��Ū��data ����ʬõ���� tree �˴ޤޤ�Ƥ��뤫��Ĵ�٤� *) 
(* search : tree_t -> int -> bool *) 
let rec search tree data = match tree with 
    Empty -> false 
  | Leaf (n) -> data = n 
  | Node (t1, n, t2) -> 
      if data = n then true 
      else if data < n then search t1 data 
      else search t2 data 
 
(* �ƥ��� *) 
let test1 = search tree1 3 = false 
let test2 = search tree2 3 = true 
let test3 = search tree2 4 = false 
let test4 = search tree5 6 = true 
let test5 = search tree5 2 = true 
let test6 = search tree5 1 = true 
let test7 = search tree5 4 = false 
let test8 = search tree5 7 = true 
let test9 = search tree5 8 = false 
 
(* ��Ū����ʬõ���� tree �� data ���ɲä�����ʬõ���ڤ��֤� *) 
(* insert_tree : tree_t -> int -> tree_t *) 
let rec insert_tree tree data = match tree with 
    Empty -> Leaf (data) 
  | Leaf (n) -> 
      if data = n then Leaf (n) 
      else if data < n then Node (Leaf (data), n, Empty) 
                       else Node (Empty, n, Leaf (data)) 
  | Node (t1, n, t2) -> 
      if data = n then Node (t1, n, t2) 
      else if data < n then Node (insert_tree t1 data, n, t2) 
                       else Node (t1, n, insert_tree t2 data) 
 
(* �ƥ��� *) 
let test1 = insert_tree Empty 3 = Leaf (3) 
let test2 = insert_tree (Leaf (3)) 2 = Node (Leaf (2), 3, Empty) 
let test3 = insert_tree (Leaf (3)) 3 = Leaf (3) 
let test4 = insert_tree (Leaf (3)) 4 = Node (Empty, 3, Leaf (4)) 
let test5 = insert_tree tree5 4 = 
            Node (Node (Leaf (1), 2, Node (Empty, 3, Leaf (4))), 
                  6, 
                  Node (Empty, 7, Leaf (9))) 
 
(* 
type ('a, 'b) tree_t = 
    Empty 
  | Leaf of 'a * 'b 
  | Node of ('a, 'b) tree_t * 'a * 'b * ('a, 'b) tree_t 
*) 
