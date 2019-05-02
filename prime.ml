(* 目的 : ２から自然数nまでのリストを返す *)
let two_to_n n =
    let rec loop i =
    if i <= n then i :: loop (i + 1) else []
    in loop 2
(* 目的 : 自然数 n を受け取ったら、それ以下の素数のリストを返す *)
(* prime : int -> int list *)
let prime n = sieve (two_to_n n)

(* テスト *)
let test1 = prime 5 = [2; 3; 5]
let test2 = prime 10 = [2; 3; 5; 7]
