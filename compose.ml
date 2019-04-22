(* 目的: 受け取った２つの関数を合成した関数を返す *)
(* cmopose : (b' -> c') -> (a' -> b') -> a' -> c' *)
let compose f g =
    let h x = f (g x) in
    h

(* 目的 : 3を加える *)
let add3 x = x + 3

let time2 x = x * 2

(* test *)
let test1 = (compose time2 add3) 4 = 14
