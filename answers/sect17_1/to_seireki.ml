(* ǯ���ɽ���� *) 
type nengou_t = Meiji of int    (* ���� *) 
              | Taisho of int   (* ���� *) 
              | Showa of int    (* ���� *) 
              | Heisei of int   (* ʿ�� *) 
 
(* ��Ū��ǯ��������ä����б���������ǯ���֤� *) 
(* to_seireki : nengou_t -> int *) 
let to_seireki nengou = match nengou with 
    Meiji (n) -> n + 1867 
  | Taisho (n) -> n + 1911 
  | Showa (n) -> n + 1925 
  | Heisei (n) -> n + 1988 
 
(* �ƥ��� *) 
let test1 = to_seireki (Showa (42)) = 1967 
let test2 = to_seireki (Heisei (11)) = 1999 
let test3 = to_seireki (Meiji (41)) = 1908 
