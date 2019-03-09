let rec kaijo lst = match lst with
    [] -> 1
  | first :: rest -> first * kaijo rest 

(* test *)
let test1 = kaijo [1] = 1 
let test2 = kaijo [3; 2; 1] = 6
let test3 = kaijo [5; 4; 3; 2; 1]= 120 



    
