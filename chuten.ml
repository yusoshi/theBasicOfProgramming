(* 目的： x, y座標を持つ2点が与えられたら中点を返す*)
(* chuten： float * float -> float * float -> float * float*)

let chuten (p1, p2) = match (p1, p2) with
    ((x1, y1), (x2, y2)) -> ((x1 +. x2) /. 2.0, (y1 +. y2) /. 2.0)

(* テスト *)
let test1 = chuten ((1.0, 3.0), (2.0, 5.0)) = (1.5, 4.0)
