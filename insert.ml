(* 学生一人分のデータ (名前、点数、成績）を表す型 *)
type gakusei_t = {
    name : string;
    score : int;
    grade : string;
}
(* 目的 : 予め昇順に並んでいる整数のリスト lst と整数 n を受けとったら、昇順となる位置に n を挿入したリストを返す *)
(* insert : int list -> int -> int list *)
let rec insert lst n = match lst with
    [] -> n :: [] 
    | first :: rest -> if n <= first then n :: first :: rest
		     else first :: insert rest n

(* test *)
(*
let test1 = insert [1; 3; 4; 7; 8] 5 = [1; 3; 4; 5; 7; 8]
let test2 = insert [1; 3; 4; 7; 8] 9 = [1; 3; 4; 7; 8; 9]
let test3 = insert [] 9 = [9]
*)
