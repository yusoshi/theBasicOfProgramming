(* ��Ū��̾�������Ӥ��Ȥ������ä��顢����ɾ��ʸ���֤� *) 
(* seiseki : string * string -> string *) 
let seiseki pair = match pair with 
  (namae, seiseki0) -> namae ^ "��������Ӥ� " ^ seiseki0 ^ " �Ǥ���" 
 
(* �ƥ��� *) 
let test1 = seiseki ("����", "C") = "���椵������Ӥ� C �Ǥ���" 
let test2 = seiseki ("��¼", "A") = "��¼��������Ӥ� A �Ǥ���" 
let test3 = seiseki ("�и�", "B") = "�и���������Ӥ� B �Ǥ���" 
