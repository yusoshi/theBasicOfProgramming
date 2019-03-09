(* 目的：名前と成績の組を受け取ったら、「xxさんの評価はyyです」という文字列を返す *)
(* seiseki name * seiseki -> string *)

let seiseki pair = match pair with
    (name, seiseki) -> name ^ "さんの評価は" ^ seiseki ^ "です!"
    
(* test *)
let test1 = seiseki ("西山", "最高") = "西山さんの評価は最高です!"
