(* 学生一人分のデータ (名前、点数、成績）を表す型 *)
type gakusei_t = {
    name : string;
    score : int;
    grade : string;
}

(* 挿入法導入 *)
#use "insert_gakusei.ml"

(* 目的 : gakusei_t 型のリスト lst を受け取ったら、点数で昇順に並び替えたリストを返す *)
(* gakusei_sort : gakusei_t list -> gakusei_t list *)
let rec gakusei_sort lst = match lst with
    [] -> []
  | first :: rest ->
    insert_gakusei (gakusei_sort rest) first 
     

(* テスト *)
let test1 = gakusei_sort [] = []
let test2 = gakusei_sort [{ name = "second"; score = 90; grade = "" }] = [{ name = "second"; score = 90; grade = "" }] 
let test3 = gakusei_sort [
			    { name = "second"; score = 90; grade = "" };
			    { name = "third"; score = 80; grade = "" }
			]
			=
			[
			    { name = "third"; score = 80; grade = "" };
			    { name = "second"; score = 90; grade = "" }
			] 
let test4 = gakusei_sort [
			    { name = "second"; score = 90; grade = "" };
			    { name = "third"; score = 80; grade = "" }
			]
			=
			[
			    { name = "third"; score = 80; grade = "" };
			    { name = "second"; score = 90; grade = "" }
			] 
let test4 = gakusei_sort [
			    { name = "second"; score = 90; grade = "" };
			    { name = "first"; score = 100; grade = "" };
			    { name = "forth"; score = 70; grade = "" };
			    { name = "fifth"; score = 60; grade = "" };
			    { name = "third"; score = 80; grade = "" }
			 ]
			(* = 
			 [
			    { name = "fifth"; score = 60; grade = "" };
			    { name = "forth"; score = 70; grade = "" };
			    { name = "third"; score = 80; grade = "" };
			    { name = "second"; score = 90; grade = "" };
			    { name = "first"; score = 100; grade = "" }
			 ]
*)
