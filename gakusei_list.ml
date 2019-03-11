(* 学生ひとり分のデータ(名前、点数、成績)を表すかた*)
type gakusei_t = {
    namae : string;
    tensuu : int;
    seiseki : string;
}

(* test data *)
let g1 = { namae = "first"; tensuu = 100; seiseki = "A" }
let g2 = { namae = "second"; tensuu = 90; seiseki = "A" }
let g3 = { namae = "third"; tensuu = 80; seiseki = "B" }
let g4 = { namae = "forth"; tensuu = 70; seiseki = "C" }
let g5 = { namae = "fifth"; tensuu = 60; seiseki = "D" }

(* gakusei_list_data *)
let lst1 = []
let lst2 = [g3; g2; g4]
let lst3 = [g2; g1; g4; g5; g3]
