(* 目的 : 文字列のリストを受け取ったら、すべての要素を連結した文字列を返す *)
(* concat2 : string list -> string *)
let concat2 lst =
    (* 目的 : first と rest_resultを連結する *)
    List.fold_right (^) lst ""

(* テスト *)
let test1 = concat2 ["a"; "b"; "c"] = "abc"
let test2 = concat2 [] = ""
let test3 = concat2 ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
