(* distance_t型定義 *)
type distance_t = {
    kyori : float;
    total : float;
}

(* 例 *)
let dis1 = {kyori = 0.3; total = 0.0}
let dis2 = {kyori = 0.9; total = 0.0}
let dis3 = {kyori = 1.4; total = 0.0}
let dis4 = {kyori = 0.8; total = 0.0}
let lst = [dis1; dis2; dis3; dis4]

(* 目的 : 先頭からリスト中の各点までの距離の合計を計算する *)
(* total_distance : distance_t list -> distance_t list *)
let rec total_distance lst =
    (* 目的 : 先頭からリスト中の各点までの距離の合計を計算する *)
    (* ここで total0はこれまでの距離の合計 *)
    (* hojo : distance_t list -> float -> distance_t list *)
    let rec hojo lst total0 = match lst with
       [] -> []
       | { kyori = k; total = t } :: rest ->
         { kyori = k; total = total0 +. k }
         :: hojo rest (total0 +. k)
       in hojo lst 0.0


(* テスト *)
let test = total_distance lst 
let test1 = total_distance lst = [
    {kyori = 0.3; total = 0.3};
    {kyori = 0.9; total = 1.2};
    {kyori = 1.4; total = 2.6};
    {kyori = 0.8; total = 3.4}
]



