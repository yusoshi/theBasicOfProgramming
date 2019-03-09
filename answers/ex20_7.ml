(* �����ɽ�������ͥ��� *) 
module type Set_t = sig 
  type 'a t 
    (* ���Ǥη��� 'a �ν���η���������Ȥ������ *) 
 
  val empty : 'a t 
    (* �Ȥ�����empty *) 
    (* ������ *) 
 
  val singleton : 'a -> 'a t 
    (* �Ȥ�����singleton element *) 
    (* ���Ǥ� element �ҤȤĤ���ʤ뽸����֤� *) 
 
  val union : 'a t -> 'a t -> 'a t 
    (* �Ȥ�����union set1 set2 *) 
    (* ���� set1 �� set2 ���½�����֤� *) 
 
  val inter : 'a t -> 'a t -> 'a t 
    (* �Ȥ�����inter set1 set2 *) 
    (* ���� set1 �� set2 �ζ�����ʬ���֤� *) 
 
  val diff : 'a t -> 'a t -> 'a t 
    (* �Ȥ�����diff set1 set2 *) 
    (* ���� set1 ���� set2 �����Ǥ������������ʺ�����ˤ��֤� *) 
 
  val mem : 'a -> 'a t -> bool 
    (* �Ȥ�����mem element set *) 
    (* ���� element ������ set �����äƤ��뤫�ɤ����򿿵��ͤ��֤� *) 
end 
 
(* ����Υ⥸�塼�롧�ꥹ���� *) 
module Set : Set_t = struct 
  (* ���Ǥη��� 'a �ν���η��������Ǥϥꥹ�Ȥ�ȤäƤ��뤬 *) 
  (* �ڤʤɤ�Ȥ��Ȱʲ����������ΨŪ�˼¸��Ǥ���褦�ˤʤ� *) 
  type 'a t = 'a list 
 
  (* ������ *) 
  (* empty : 'a t*) 
  let empty = [] 
 
  (* ��Ū�����Ǥ� element �ҤȤĤ���ʤ뽸����֤� *) 
  (* singleton : 'a -> 'a t *) 
  let singleton element = [element] 
 
  (* ��Ū������ set1 �� set2 ���½�����֤� *) 
  (* union : 'a t -> 'a t -> 'a t *) 
  let union set1 set2 = set1 @ set2 
 
  (* ��Ū������ set1 �� set2 �ζ�����ʬ���֤� *) 
  (* inter : 'a t -> 'a t -> 'a t *) 
  let inter set1 set2 = 
    List.fold_left (fun lst element -> 
		      if List.mem element set2 then element :: lst else lst) 
		   [] set1 
 
  (* ��Ū������ set1 ���� set2 �����Ǥ������������ʺ�����ˤ��֤� *) 
  (* diff : 'a t -> 'a t -> 'a t *) 
  let diff set1 set2 = 
    List.fold_left (fun lst element -> 
		      if List.mem element set2 then lst else element :: lst) 
		   [] set1 
 
  (* ��Ū������ element ������ set �����äƤ��뤫�ɤ����򿿵��ͤ��֤� *) 
  (* mem : 'a -> 'a t -> bool *) 
  let mem element set = List.mem element set 
end 
