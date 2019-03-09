(* 目的：鶴の数tsuruと亀の数kameから合計の足の数を計算する *)
(* tsurukamezan : int -> int -> int *)
let tsurukamezan tsuru kame = tsuru * 2 + kame * 4

(* テスト *)
let test1 = tsurukamezan 1 1 = 6
let test2 = tsurukamezan 3 6 = 30
let test3 = tsurukamezan 100 100 = 600
