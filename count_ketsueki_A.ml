(* person_t :  人一人（名前、身長（m)、体重（kg）、誕生日（月と日）、血液型）を表す型　*)
type person_t = {
    name: string;
    height: float;
    weight: float;
    birth_date: string;
    blood_type: string;
}

(* person_t list は
    - []             空リスト、または
    - first :: rest  最初の要素 first で残りのリストが rest
		     (first は person_t 型
		     rest は自己参照のケース)
    という形 *)

(* person_t list 型のデータ例 *)
let lst1 = []
let lst2 = [{name = "nishiyama"; height = 1.78; weight = 74.5; birth_date = "04/05"; blood_type = "O"}]
let lst3 = [{name = "nishiyama"; height = 1.78; weight = 74.5; birth_date = "04/05"; blood_type = "O"};
{name = "terakawa"; height = 1.47; weight = 40.0; birth_date = "11/20"; blood_type = "A"}]

(* 目的 : person_t list 型のリスト lst を受け取ったら、血液型がA型の人数を返す *)
(* count_ketsueki_A : person_t list -> int *)
let rec count_ketsueki_A lst = match lst with
    [] -> 0
  | ({name = n; height = h; weight = w; birth_date = bi; blood_type = bl } as first) :: rest
       -> if bl = "A" then 1 + count_ketsueki_A rest 
          else count_ketsueki_A rest
(* test *)
let test1 = count_ketsueki_A lst1 = 0
let test2 = count_ketsueki_A lst2 = 0
let test3 = count_ketsueki_A lst3 = 1
