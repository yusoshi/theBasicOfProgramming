(* string list は
    - []            空リスト、または
    - first :: rest 最初の要素 first、残りのリスト rest を ( rest は自己参照のケース )
    返す方である。 *)


(* 目的 : 文字列のリスト lst を受け取ったらその中の要素を前から順にくっつけた文字列を返す *)
(* concat : string list -> string *)
let rec concat lst = match lst with
    [] -> ""
  | first :: rest -> first ^ concat rest 

(* test *)
let test1 = concat [] = ""
let test2 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
