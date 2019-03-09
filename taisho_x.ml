(* 目的： x, y座標が与えられたらx軸について対象な座標を返す*)
(* taisho_x：float * float - > float * float*)

let taisho_x zahyo = match zahyo with
    (x, y) -> ( x, -1.0 *. y) 

(* テスト *)
let test1 = taisho_x (1.0, 2.0) = (1.0, -2.0)
let test2 = taisho_x (-2.0, -9.0) = (-2.0, 9.0)
