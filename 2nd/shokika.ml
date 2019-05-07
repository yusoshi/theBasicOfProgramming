#use "make_eki_list.ml"
(* 目的 : eki_t型のリストと起点（漢字文字列）を受け取ったら、起点のみ初期化したeki_t型のリストを返す *)
(* shokika : eki_t list -> string -> eki_t list *)
let rec shokika eki_lst kiten = match eki_lst with
    [] -> []
    | ({ namae = n; saitan_kyori = s; temae_list = t } as first ) :: rest ->
        let shokika_rest = shokika rest kiten in
        if n = kiten then {namae = n; saitan_kyori = 0.; temae_list = [n]} :: shokika_rest
        else first :: shokika_rest

(* テスト*)
let eki_list = [ 
{namae="池袋"; saitan_kyori = infinity; temae_list = []}; 
{namae="新大塚"; saitan_kyori = infinity; temae_list = []}; 
{namae="茗荷谷"; saitan_kyori = infinity; temae_list = []}; 
{namae="後楽園"; saitan_kyori = infinity; temae_list = []}; 
{namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []}; 
{namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []} 
] 

(* テスト *) 
let test1 = shokika [] "茗荷谷" = [] 
let test2 = shokika eki_list "茗荷谷" = [ 
{namae="池袋"; saitan_kyori = infinity; temae_list = []}; 
{namae="新大塚"; saitan_kyori = infinity; temae_list = []}; 
{namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}; 
{namae="後楽園"; saitan_kyori = infinity; temae_list = []}; 
{namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []}; 
{namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []} 
    ] 
