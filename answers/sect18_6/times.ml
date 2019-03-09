(* 
(* ��Ū��lst ��������򤹤٤Ƴݤ���碌�� *) 
(* times : int list -> int *) 
let rec times lst = match lst with 
    [] -> 1 
  | first :: rest -> first * times rest 
*) 
 
(* 0 ���ߤĤ��ä����Ȥ򼨤��㳰 *) 
exception Zero 
 
(* ��Ū��lst ��������򤹤٤Ƴݤ���碌�� *) 
(* times : int list -> int *) 
let times lst = 
  (* ��Ū��lst ��������򤹤٤Ƴݤ���碌�� *) 
  (* 0 ��ߤĤ������㳰 Zero �򵯤��� *) 
  (* hojo : int list -> int *) 
  let rec hojo lst = match lst with 
      [] -> 1 
    | first :: rest -> 
        if first = 0 then raise Zero 
                     else first * hojo rest 
  in try 
       hojo lst 
     with Zero -> 0 
 
(* �ƥ��� *) 
let test1 = times [3; 1; 4] = 12 
let test2 = times [0] = 0 
let test3 = times [3; 1; 0; 4] = 0 
let test4 = times [3; 2; 1; 0] = 0 
