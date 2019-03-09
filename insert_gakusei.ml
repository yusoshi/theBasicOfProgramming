(* 学生一人分のデータ (名前、点数、成績）を表す型 *)
(*
type gakusei_t = {
    name : string;
    score : int;
    grade : string;
}
i*)
(* 目的 : 予め点数が昇順に並んでいる学生のリスト lst と学生 g  を受けとったら、点数が昇順となる位置に学生を挿入したリストを返す *)
(* insert_gakusei : gakusei_t list -> gakusei_t -> int gakusei_t *)
let rec insert_gakusei lst g = match lst with
    [] -> g :: [] 
    | first :: rest -> if g.score <= first.score then g :: first :: rest
		     else first :: insert rest g

(* test *)
let test1 = insert_gakusei 
			 [
			    { name = "fifth"; score = 60; grade = "" };
			    { name = "forth"; score = 70; grade = "" };
			    { name = "third"; score = 80; grade = "" };
			    { name = "second"; score = 90; grade = "" };
			    { name = "first"; score = 100; grade = "" };
			 ]
			    { name = "sixth"; score = 110; grade = "" }
			    (*
			=
			 [
			    { name = "fifth"; score = 60; grade = "" };
			    { name = "forth"; score = 70; grade = "" };
			    { name = "third"; score = 80; grade = "" };
			    { name = "second"; score = 90; grade = "" };
			    { name = "first"; score = 100; grade = "" };
			    { name = "sixth"; score = 110; grade = "" }
			 ]
			 *)

let test2 = insert_gakusei [] { name = "sixth"; score = 10; grade = "" }
			= 
			[
			    { name = "sixth"; score = 10; grade = "" }
			]
