(* ���餫���� sect17_2/tree.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "sect17_2/tree.ml" (* tree_t ����� *) 
 
(* �ڤ��� *) 
let tree1 = Empty 
let tree2 = Leaf (3) 
let tree3 = Node (tree1, 4, tree2) 
let tree4 = Node (tree2, 5, tree3) 
 
(* ��Ū��tree �˴ޤޤ������դο��ι�פ��֤� *) 
(* tree_length : tree_t -> int *) 
let rec tree_length tree = match tree with 
    Empty -> 0 
  | Leaf (n) -> 1 
  | Node (t1, n, t2) -> tree_length t1 + 1 + tree_length t2 
 
(* �ƥ��� *) 
let test1 = tree_length tree1 = 0 
let test2 = tree_length tree2 = 1 
let test3 = tree_length tree3 = 2 
let test4 = tree_length tree4 = 4 
