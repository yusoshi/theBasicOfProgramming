(* ���餫���� ex17_12.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex17_12.ml" (* insert_ekikan ����� *) 
 
(* ��Ū��������ä� ekikan �Υꥹ�Ȥ� ekikan_tree �����������ڤ��֤� *) 
(* inserts_ekikan : ekikan_tree_t -> ekikan_t list -> ekikan_tree_t *) 
let inserts_ekikan ekikan_tree ekikan_list = 
  List.fold_right (fun ekikan tree -> insert_ekikan tree ekikan) 
		  ekikan_list ekikan_tree 
 
(* �ޤ��� *) 
 
(* ��Ū��������ä� ekikan �Υꥹ�Ȥ� ekikan_tree �����������ڤ��֤� *) 
(* inserts_ekikan : ekikan_tree_t -> ekikan_t list -> ekikan_tree_t *) 
let inserts_ekikan ekikan_tree ekikan_list = 
  List.fold_left insert_ekikan ekikan_tree ekikan_list 
 
(* �ƥ��� *) 
let test1 = inserts_ekikan Empty [ekikan1; ekikan2; ekikan3] = 
  Node (Node (Empty, "��ڱ�", [("謲�ë", 1.8)], Empty), 
	"������", [("謲�ë", 1.2); ("����", 1.8)], 
        Node (Empty, 
	      "����", [("������", 1.8)], 
	      Node (Empty, 
		    "謲�ë", [("��ڱ�", 1.8); ("������", 1.2)], 
		    Empty))) 
 
(* ekikan1, ekikan2, ekikan3 ������ˤĤ��Ƥ� ex17_12.ml �򻲾� *) 
(* ��Τդ��Ĥ�����Ǥϡ�����������֤��㤦�Τǡ��������ڤ�ۤʤ� *) 
