(* ２以上n以下の自然数のリストを受け取ったら、２以上n以下の素数のリストを返す *)
(* sieve : int list -> int list *)
let rec sieve lst = match lst with 
    [] -> [] (* 答えが自明となる条件とケース *)
    | first :: rest -> (* それ以外のケース *) 
	first :: sieve (List.filter (fun x -> x mod first <> 0) rest) 

(* テスト *)
let test1 = sieve [2; 3; 4; 5; 6; 7; 8; 9; 10] = [2; 3; 5; 7]
