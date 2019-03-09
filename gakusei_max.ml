(* 目的 : gakusei_t 型のリストを受け取ったら、その中から最高得点を取った人のレコードを返す *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let rec gakusei_max lst = match lst with
    [] -> { name = "none"; score = min_int; grade = ""}
  | ( {name = n; score = s; grade = g } as first) :: rest -> 
  { name = "none"; score = min_int; grade = ""}
    (*
    if s >= gakusei_max rest
	then first
	else gakusei_max rest
	    *)

   

(* 学生ひとり分のデータ(名前、点数、成績)を表すかた*)
type gakusei_t = {
    name: string;
    score: int;
    grade: string;
}

(* test data *)
let lst1 = []
let lst2 = [
		{ name = "second"; score = 90; grade = "" };
		{ name = "first"; score = 100; grade = "" };
		{ name = "forth"; score = 70; grade = "" }
	    ]
let lst3 = [
		{ name = "second"; score = 90; grade = "" };
		{ name = "first"; score = 100; grade = "" };
		{ name = "forth"; score = 70; grade = "" };
		{ name = "fifth"; score = 60; grade = "" };
		{ name = "third"; score = 80; grade = "" }
	   ]

(* test *)
(*let test1 = gakusei_max lst1 = {} *)
let test2 = gakusei_max lst2 = { name = "first"; score = 100; grade = "" }
let test3 = gakusei_max lst3 = { name = "first"; score = 100; grade = "" }
