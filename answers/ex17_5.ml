(* ���餫���� sect17_2/tree.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "sect17_2/tree.ml" (* tree_t ����� *) 
 
(* �ڤ��� *) 
let tree1 = Empty 
let tree2 = Leaf (3) 
let tree3 = Node (tree1, 4, tree2) 
let tree4 = Node (tree2, 5, tree3) 
 
(* ��Ū��tree �˴ޤޤ�������򤹤٤� 2 �ܤ��� *) 
(* tree_double : tree_t -> tree_t *) 
let rec tree_double tree = match tree with 
    Empty -> Empty 
  | Leaf (n) -> Leaf (2 * n) 
  | Node (t1, n, t2) -> Node (tree_double t1, 2 * n, tree_double t2) 
 
(* �ƥ��� *) 
let test1 = tree_double tree1 = Empty 
let test2 = tree_double tree2 = Leaf (6) 
let test3 = tree_double tree3 = Node (Empty, 8, Leaf (6)) 
let test4 = tree_double tree4 = Node (Leaf (6), 10, Node (Empty, 8, Leaf (6))) 
