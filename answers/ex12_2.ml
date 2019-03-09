(* ���餫���� ex08_5.ml, ex12_1.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex08_5.ml" 
#use "ex12_1.ml" 
 
(* ��̾�ꥹ�Ȥ��� *) 
 
let ekimei_list = [ 
{kanji="����"; kana="�����֤���"; romaji="ikebukuro"; shozoku="�ݥ�����"}; 
{kanji="������"; kana="���󤪤��Ĥ�"; romaji="shinotsuka"; shozoku="�ݥ�����"}; 
{kanji="謲�ë"; kana="�ߤ礦������"; romaji="myogadani"; shozoku="�ݥ�����"}; 
{kanji="��ڱ�"; kana="�����餯����"; romaji="korakuen"; shozoku="�ݥ�����"}; 
{kanji="�ܶ�������"; kana="�ۤ󤴤�������礦��"; romaji="hongosanchome"; shozoku="�ݥ�����"}; 
{kanji="����ο�"; kana="������Τߤ�"; romaji="ochanomizu"; shozoku="�ݥ�����"} 
] 
 
(* ��Ū��ekimei list ���� eki list ���� *) 
(* make_eki_list : ekimei_t list -> eki_t list *) 
let rec make_eki_list ekimei_list = match ekimei_list with 
    [] -> [] 
  | {kanji = k; kana = a; romaji = r; shozoku = s} :: rest -> 
      {namae = k; saitan_kyori = infinity; temae_list = []} 
      :: make_eki_list rest 
 
(* �ƥ��� *) 
let test1 = make_eki_list [] = [] 
let test2 = make_eki_list ekimei_list = [ 
{namae="����"; saitan_kyori = infinity; temae_list = []}; 
{namae="������"; saitan_kyori = infinity; temae_list = []}; 
{namae="謲�ë"; saitan_kyori = infinity; temae_list = []}; 
{namae="��ڱ�"; saitan_kyori = infinity; temae_list = []}; 
{namae="�ܶ�������"; saitan_kyori = infinity; temae_list = []}; 
{namae="����ο�"; saitan_kyori = infinity; temae_list = []} 
] 
