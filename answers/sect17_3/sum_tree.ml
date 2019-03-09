(* �ڤ�ɽ���� *) 
type tree_t = Empty                     (* ������ *) 
            | Leaf of int                   (* �� *) 
            | Node of tree_t * int * tree_t (* �� *) 
 
(* tree �� 
     - Empty            �����ڡ����뤤�� 
     - Leaf (n)         �ͤ� n ���ա����뤤�� 
     - Node (t1, n, t2) �����ڤ� t1, �ͤ� n�������ڤ� 
                        t2 �Ǥ���褦���� 
                       ��t1 �� t2 �����ʻ��ȤΥ������� 
   �Ȥ����� *) 
 
(* �ڤ��� *) 
let tree1 = Empty 
let tree2 = Leaf (3) 
let tree3 = Node (tree1, 4, tree2) 
let tree4 = Node (tree2, 5, tree3) 
 
(* ��Ū��tree �˴ޤޤ�������򤹤٤Ʋä��� *) 
(* sum_tree : tree_t -> int *) 
let rec sum_tree tree = match tree with 
    Empty -> 0 
  | Leaf (n) -> n 
  | Node (t1, n, t2) -> sum_tree t1 + n + sum_tree t2 
 
(* �ƥ��� *) 
let test1 = sum_tree tree1 = 0 
let test2 = sum_tree tree2 = 3 
let test3 = sum_tree tree3 = 7 
let test4 = sum_tree tree4 = 15 
