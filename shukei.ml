(* 学生一人を表す *)
type gakusei_t = {
    namae : string;
    tensuu : int;
    seiseki : string
}
(* 目的: 学生リスト lst のうち各成績の人数を集計する *)
(* shukei : gakusei_t list -> int * int * int * int *)
let rec shukei lst = match lst with
    [] -> (0, 0, 0, 0)
  | { namae = n; tensuu = t; seiseki = s } :: rest ->
    let (a, b, c, d) = shukei rest in 
	if s = "A" then (a + 1, b, c, d)
	else if s = "B" then (a, b + 1, c, d)
	else if s = "C" then (a, b, c + 1, d)
	else (a, b, c, d + 1)



