(* 学生ひとり分のデータ(名前、点数、成績)を表すかた*)
type gakusei_t = {
    namae : string;
    tensuu : int;
    seiseki : string;
}


(* 目的 : gakusei_t 型のリストを受け取ったら、その中から最高得点を取った人のレコードを返す *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let rec gakusei_max lst = match lst with 
    [] -> { namae = ""; tensuu = min_int; seiseki = "" }
  | ({ namae = n; tensuu = t; seiseki = s } as gakusei ) :: rest ->
	let rest_max = gakusei_max rest in
	 match rest_max with 
	{ namae = n_max; tensuu = max_t; seiseki = max_s } ->
	    if t > max_t then gakusei
	    else rest_max		

(* test data *)
let lst1 = []
let lst2 = [
		{ namae = "second"; tensuu = 90; seiseki = "" };
		{ namae = "first"; tensuu = 100; seiseki = "" };
		{ namae = "forth"; tensuu = 70; seiseki = "" }
	    ]
let lst3 = [
		{ namae = "second"; tensuu = 90; seiseki = "" };
		{ namae = "first"; tensuu = 100; seiseki = "" };
		{ namae = "forth"; tensuu = 70; seiseki = "" };
		{ namae = "fifth"; tensuu = 60; seiseki = "" };
		{ namae = "third"; tensuu = 80; seiseki = "" }
	   ]

(* test *)
(*let test1 = gakusei_max lst1 = {} *)
let test2 = gakusei_max lst2 = { namae = "first"; tensuu = 100; seiseki = "" }
let test3 = gakusei_max lst3 = { namae = "first"; tensuu = 100; seiseki = "" }
