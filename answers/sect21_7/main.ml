(* �ᥤ��ؿ� *) 
(* main : int -> unit *) 
let main n = 
  let kekka = Fac.f n in        (* n �γ������ *) 
  (print_int n; 
   print_string " �γ���� "; 
   print_int kekka;             (* ��̤�ɽ����   *) 
   print_string " �Ǥ���"; 
   print_newline ())            (* ���Ԥ���       *) 
 
(* �ᥤ��ؿ��θƤӽФ� *) 
let _ = main (int_of_string Sys.argv.(1)) 
