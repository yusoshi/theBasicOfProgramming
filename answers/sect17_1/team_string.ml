(* ���Ȥ����Ȥ���ɽ���� *) 
type team_t = Red | White 
 
(* ��Ū��������ä�������̾��ʸ������֤� *) 
(* team_string : team_t -> string *) 
let team_string team = match team with 
    Red -> "����" 
  | White -> "����" 
 
(* �ƥ��� *) 
let test1 = team_string Red = "����" 
let test2 = team_string White = "����" 
