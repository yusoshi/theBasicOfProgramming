(* 22.1 *) 
 
let a = [1; 2; 3] ;; 
let b = List.map (fun x -> x + 1) a ;; 
a ;; 
 
(* 22.2 *) 
 
let rec fib n = 
  if n < 2 then n else fib (n - 1) + fib (n - 2) ;; 
fib 8 ;; 
#use "sect22_2/fib.ml" ;; 
fib 8 0 ;; 
 
(* 22.3 *) 
 
ref 0 ;; 
let count = ref 0 ;; 
!count ;; 
 
let count = ref 0 ;;             (* �����Ф��Ƥ����ѿ� *) 
!count ;;                        (* �ǽ�� 0 �Ǥ��� *) 
let rec fib2 n = 
 (count := !count + 1;           (* �ƤФ�뤴�Ȥ� 1 ��ä��� *) 
  if n < 2 then n else fib2 (n - 1) + fib2 (n - 2)) ;; 
fib2 8 ;; 
!count ;;                        (* �¹Ը�� 67 �ˤʤäƤ��� *) 
 
(* 22.4 *) 
 
fib2 8 ;; 
!count ;; 
 
let c = [ref 1; ref 2; ref 3] ;; 
List.iter (fun x -> x := !x + 1) c ;; (* �����Ǥ� 1 ��ä���  *) 
c ;;                             (* c �����Ѥ�äƤ��� *) 
let d = (ref 0) :: c ;; 
List.iter (fun x -> x:= !x + 2) d ;; 
d ;; 
c ;; 
 
(* 22.5 *) 
 
#use "sect22_5/mutable_eki.ml" ;; 
let a = {namae = "A"; saitan_kyori = 3.2; temae_list = []} ;; 
a.saitan_kyori <- 4.1 ;; 
a ;; 
let count = ref 0 ;; 
 
(* 22.6 *) 
 
let a = [|3; 5; 2; 4|] ;; 
Array.get a 3 ;; 
(* 
Array.get a 4 ;; 
*) 
a.(3) ;; 
 
(* 22.7 *) 
 
a ;; 
Array.set a 1 7 ;; 
a ;; 
a.(2) <- 6 ;; 
a ;; 
