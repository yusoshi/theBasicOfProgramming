(* ��Ū��������ä�����˥ե��ܥʥå�������������֤� *) 
(* fib_array : int array -> int array *) 
let fib_array array = 
  let n = Array.length array in 
  (* ��Ū������ array �˥ե��ܥʥå������������ *) 
  (* loop : int -> unit *) 
  let rec loop i = 
    if i < n 
    then (if i = 0 then array.(i) <- 0 
	  else if i = 1 then array.(i) <- 1 
	  else array.(i) <- array.(i - 1) + array.(i - 2); 
	  loop (i + 1)) 
    else () in 
  (loop 0; 
   array) 
 
(* ���뤤�� *) 
 
(* ��Ū��������ä�����˥ե��ܥʥå�������������֤� *) 
(* fib_array : int array -> int array *) 
let fib_array array = 
  let n = Array.length array in 
  if n > 0 then array.(0) <- 0; 
  if n > 1 then array.(1) <- 1; 
  for i = 2 to n - 1 do 
    array.(i) <- array.(i - 1) + array.(i - 2); 
  done; 
  array 
 
(* �ƥ��� *) 
let test = fib_array [|0; 0; 0; 0; 0; 0; 0; 0; 0; 0|] 
	   = [|0; 1; 1; 2; 3; 5; 8; 13; 21; 34|] 
