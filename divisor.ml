(* 目的 : 整数を受け取ったら、1からその数までの整数のリストを返す *)
(* enumerate : int -> int list *)
let rec enumerate n = 
    if n = 0 then []
    else n :: enumerate (n - 1)

(* 目的 : 整数を受け取ったら、約数のリストを返す *)
(* devisor : int -> int list *)
let divisor n = List.filter (fun x -> n mod x = 0) (enumerate n)

(* テスト *)
let test1 = divisor 0 = []
let test2 = divisor 4 = [4; 2; 1]
let test3 = divisor 24 = [24; 12; 8; 6; 4; 3; 2; 1]

