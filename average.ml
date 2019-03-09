(* 目的：国語、数学、英語、理科、社会の５教科の点数が与えられたら、その合計点と平均点を返す *)
(* calc int -> int -> int -> int -> int -> (int * int ) *)


let calc ja ma en sc so = 
     (ja + ma + en + sc + so, (ja + ma + en + sc + so) / 5)

(* test *)
let test1 = calc 0 0 0 0 0 = (0, 0)
let test2 = calc 10 10 10 10 10 = (50, 10)
let test3 = calc 80 23 41 13 99 = (256, 51)
