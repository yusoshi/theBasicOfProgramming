(* ���餫���� ex12_1.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex12_1.ml" 
 
(* �إꥹ�Ȥ��� *) 
 
let eki_list = [ 
{namae="����"; saitan_kyori = infinity; temae_list = []}; 
{namae="������"; saitan_kyori = infinity; temae_list = []}; 
{namae="謲�ë"; saitan_kyori = infinity; temae_list = []}; 
{namae="��ڱ�"; saitan_kyori = infinity; temae_list = []}; 
{namae="�ܶ�������"; saitan_kyori = infinity; temae_list = []}; 
{namae="����ο�"; saitan_kyori = infinity; temae_list = []} 
] 
 
(* ��Ū��ekimei list ���� eki list ���� *) 
(* shokika : eki_t list -> string -> eki_t list *) 
let rec shokika eki_list kiten = match eki_list with 
    [] -> [] 
  | ({namae = k; saitan_kyori = s; temae_list = t} as first) :: rest -> 
      if k = kiten 
      then {namae = k; saitan_kyori = 0.; temae_list = [k]} 
	   :: shokika rest kiten 
      else first :: shokika rest kiten 
 
(* �ƥ��� *) 
let test1 = shokika [] "謲�ë" = [] 
let test2 = shokika eki_list "謲�ë" = [ 
{namae="����"; saitan_kyori = infinity; temae_list = []}; 
{namae="������"; saitan_kyori = infinity; temae_list = []}; 
{namae="謲�ë"; saitan_kyori = 0.; temae_list = ["謲�ë"]}; 
{namae="��ڱ�"; saitan_kyori = infinity; temae_list = []}; 
{namae="�ܶ�������"; saitan_kyori = infinity; temae_list = []}; 
{namae="����ο�"; saitan_kyori = infinity; temae_list = []} 
] 
