(* 人（名前、身長、体重、誕生日、血液型）を表す型 *)
type person_t = {
    name : string;
    height : int;
    weight : int;
    birth_date : string;
    blood_type : string;
}

(* 目的：ひとりの人を受け取り、その人の血液型を返す *)
(* ketsueki_hyoji： person_t -> string *)
let ketsueki_hyoji person_t = match person_t with
    { name = n; height = h; weight = w; birth_date = bi; blood_type = bl } ->
	n ^ "さんの血液型は" ^ bl ^ "型です"

(* テスト *)
let test1 = ketsueki_hyoji { name = "にしやま"; height = 160; weight = 60; birth_date = "02/01"; blood_type = "O" } = "にしやまさんの血液型はO型です"
let test2 = ketsueki_hyoji { name = "てらかわ"; height = 160; weight = 60; birth_date = "02/01"; blood_type = "A" } = "てらかわさんの血液型はA型です"
