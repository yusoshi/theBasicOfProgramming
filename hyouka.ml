(* 学生一人分のデータ (名前、点数、成績）を表す型 *)
type gakusei_t = {
    name : string;
    score : int;
    grade : string;
}

(* 目的 : ひとりの学生のデータを受け取り、成績を付与した学生のデータを返す *)
(* hyouka : gakusei_t -> gakusei_t *)
let hyouka gakusei = match gakusei with
    { name = n; score = s; grade = g } ->
    if s >= 80      then { name = n; score = s; grade = "A" }
    else if s >= 70 then { name = n; score = s; grade = "B" }
    else if s >= 60 then { name = n; score = s; grade = "C" }
    else                 { name = n; score = s; grade = "D" }
     

(* テスト *)
let test1 = hyouka { name = "asai"; score = 90; grade = "" }
		 = { name = "asai"; score = 90; grade = "A" }
let test2 = hyouka { name = "asai"; score = 80; grade = "" }
		 = { name = "asai"; score = 80; grade = "A" }
let test3 = hyouka { name = "asai"; score = 75; grade = "" }
		 = { name = "asai"; score = 75; grade = "B" }
let test4 = hyouka { name = "asai"; score = 70; grade = "" }
		 = { name = "asai"; score = 70; grade = "B" }
let test5 = hyouka { name = "asai"; score = 65; grade = "" }
		 = { name = "asai"; score = 65; grade = "C" }
let test6 = hyouka { name = "asai"; score = 60; grade = "" }
		 = { name = "asai"; score = 60; grade = "C" }
let test7 = hyouka { name = "asai"; score = 55; grade = "" }
		 = { name = "asai"; score = 55; grade = "D" }
