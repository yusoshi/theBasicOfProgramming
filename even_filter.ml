
(* 目的 : 整数のリストlstを受け取ったら、偶数のみを抽出したリストを返す *)
(* even_filter : int list -> int list *)
let even_filter lst = List.filter (fun n -> n mod 2 = 0) lst


(* テスト *)
let test1 = even_filter [1; 2; 3] = [2]
let test2 = even_filter [2; 2; 24] = [2; 2; 24]
