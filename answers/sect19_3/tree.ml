(* ��ʬ�ڤ�ɽ���⥸�塼��Υ����ͥ��� *) 
module type Tree_t = sig 
  type ('a, 'b) t 
    (* ������ 'a �����ͤ� 'b �����ڤη���������Ȥ������ *) 
 
  val empty : ('a, 'b) t 
    (* �Ȥ�����empty *) 
    (* ������ *) 
 
  val insert : ('a, 'b) t -> 'a -> 'b -> ('a, 'b) t 
    (* �Ȥ�����insert tree key value *) 
    (* �� tree �˥��� key ���� value �����������ڤ��֤� *) 
    (* ����������¸�ߤ��Ƥ����鿷�����ͤ��֤������� *) 
 
  val search : ('a, 'b) t -> 'a -> 'b 
    (* �Ȥ�����search tree key *) 
    (* �� tree ���椫�饭�� key ���б������ͤ�õ�����֤� *) 
    (* �ߤĤ���ʤ���� Not_found �� raise ���� *) 
end 
