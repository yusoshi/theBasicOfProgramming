#use "gakusei_list.ml"

(* 目的 : 学生リスト lst のうち、成績がseiseki0の人の数を返す *)
let count lst seiseki0 = 
    (* 目的 : 学生の成績がseiseki0だったらtrueを返す *) 
    let is_seiseki0 gakusei = match gakusei with
        { namae = n; tensuu = t; seiseki = s } ->
	s = seiseki0
    in List.length(List.filter is_seiseki0 lst)

(* テスト *)
let test1 = count lst1 "A" = 0
let test2 = count lst2 "A" = 1
let test3 = count lst3 "A" = 2
