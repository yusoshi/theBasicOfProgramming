(* 補助関数 *)


(* 本体 *)
(* 目的 : 受け取ったlstをクイックソートを使って照準に整列する *)
(* quick_sort ; int list -> int list *)
let rec quick_sort lst = match lst with
    [] -> [] (* 自明に答えが出るケースの条件とケース *)
    | first :: rest -> (* それ以外のケース *)
        (* 目的 : lstの中からnよりのpである要素のみを取り出す *)
        (* taker : int -> int list -> int list *)
        let take n lst p  = 
            List.filter (fun x -> p x n) lst
        
        (* 目的 : lstの中からnより小さい要素のみを取り出す *)
        (* take_less : int -> int list -> int list *)
        in let take_less n lst = take n lst (<=)
        
        (* 目的 : lstの中からnより大きい要素のみを取り出す *)
        (* take_greater : int -> int list -> int list *)
        in let take_greater n lst  = take n lst (>)
        in quick_sort (take_less first rest) 
	@ [first]
        @ quick_sort (take_greater first rest) 


(* テスト *)
let test1 = quick_sort [] = []
let test2 = quick_sort [1] = [1]
let test3 = quick_sort [1; 2] = [1; 2]
let test4 = quick_sort [2; 1] = [1; 2]
let test5 = quick_sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9]
let test6 = quick_sort [1; 1] = [1; 1]
