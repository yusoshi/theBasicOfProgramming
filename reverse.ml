(* 目的 : リストを与えられたら逆順にしたリストを返す *)
(* reverse : 'a list -> a' list *)
let rec reverse lst = 
    (* 目的 : リストを与えられたらその要素までのリストを逆にする *)
    (* resultはその要素までのリストを逆にしたもの *)
    (* rev : 'a list -> a' list *)
    let rec rev lst result = match lst with
        [] -> result
	| first :: rest -> rev rest (first :: result)
    in rev lst []

(* テスト *)
let test1 = reverse [1; 2; 3] = [3; 2; 1]
