(* 
(* �ᥤ��ؿ� *) 
(* main : unit -> unit *) 
let main () = 
  let kekka = Fac.f 10 in (* 10 �γ������ *) 
  print_int kekka         (* ��̤�ɽ������  *) 
*) 
 
(* �ᥤ��ؿ� *) 
(* main : unit -> unit *) 
let main () = 
  let kekka = Fac.f 10 in       (* 10 �γ������ *) 
  (print_string "10 �γ���� "; 
   print_int kekka;             (* ��̤�ɽ����    *) 
   print_string " �Ǥ���"; 
   print_newline ())            (* ���Ԥ���        *) 
 
(* �ᥤ��ؿ��θƤӽФ� *) 
let _ = main () 
