(* ��Ū��init ����Ϥ�� lst �����Ǥ򺸤����� f ��ܤ����� *) 
(* fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a *) 
let rec fold_left f init lst = match lst with 
    [] -> init 
  | first :: rest -> fold_left f (f init first) rest 
 
(* �ƥ��� *) 
let test1 = fold_left (-) 0 [] = 0 
let test2 = fold_left (-) 10 [4; 1; 3] = 2 
let test3 = fold_left (fun lst a -> a :: lst) [] [1; 2; 3; 4] = [4; 3; 2; 1] 
