(* 目的 : 関数fと初期値init, そしてリストlstを受け取ったら、initからはじめてリストlstの要素を「左から」順にfを施しこむ関数 *)
(* fold_left : ('a -> 'b) -> 'b -> a' list -> 'b list ?*)
let fold_left f init lst = 
    [] -> init
    | first :: rest -> fold_left f (f init first) rest

(* テスト *)
let test1 = fold_left  [1; 2; 3] = [2; 3; 6]
