(* 目的： 時間を受け取ったら午前か午後を返す *)
(* jikan int -> intg -> string *)

let jikan h m = 
    if h = 12 then "正午"
    else if h < 12 then "午前"
    else "午後"

(* テスト *)
let test1 = jikan 1 10 = "午前"
let test2 = jikan 13 00 = "午後"
let test3 = jikan 12 0 = "正午" 
