(* �ڤ�ɽ���� *) 
type tree_t = Empty                     (* ������ *) 
            | Leaf of int                   (* �� *) 
            | Node of tree_t * int * tree_t (* �� *) 
 
(* 
(* ��Τߤ��ڤ�ɽ���� *) 
type tree_t = Node of tree_t * int * tree_t (* �� *) 
*) 
