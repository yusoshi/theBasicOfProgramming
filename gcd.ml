(* 目的 : ふたつの自然数m6 n(m>n>0の最大公約数を求める *)
(* gcd : int -> int -> int *)
let rec gcd m n =
    if n = 0(* 自明に答えが出る条件 *) 
    then m (* 自明に答えが出るケース *) 
    else (* 自明に答えが出ないケース *) 
	gcd n (m mod n)

(* 停止性の確認 *)
(*
1. 部分問題が簡単になっているか？
gcd の第２引数は再帰すると小さくなる。

2. 繰り返すと有限回で自明なケースに帰着するか？
なるはず。
*)

(* テスト *)
let test1 = gcd 6 4 = 2
let test2 = gcd 48 64 = 16
