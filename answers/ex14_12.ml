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
(* make_initial_eki_list : ekimei_t list -> string -> eki_t list *) 
let make_initial_eki_list ekimei_list kiten = 
  List.map (fun ekimei -> match ekimei with 
	     {kanji = k; kana = a; romaji = r; shozoku = s} -> 
	       if k = kiten 
	       then {namae = k; saitan_kyori = 0.; temae_list = [k]} 
	       else {namae = k; saitan_kyori = infinity; temae_list = []}) 
	   ekimei_list 
 
(* ����̾���Τʤ��ؿ������� 14.11 �Ǻ�ä��դ��Ĥ�̾���Τʤ��ؿ��� 
   �ʸ�̩�˿���Ū�ʰ�̣�ǤΡ˹��������ؿ��ˤʤäƤ��� *) 
 
(* �ƥ��� *) 
let test1 = make_initial_eki_list [] "謲�ë" = [] 
let test2 = make_initial_eki_list ekimei_list "謲�ë" = [ 
{namae="����"; saitan_kyori = infinity; temae_list = []}; 
{namae="������"; saitan_kyori = infinity; temae_list = []}; 
{namae="謲�ë"; saitan_kyori = 0.; temae_list = ["謲�ë"]}; 
{namae="��ڱ�"; saitan_kyori = infinity; temae_list = []}; 
{namae="�ܶ�������"; saitan_kyori = infinity; temae_list = []}; 
{namae="����ο�"; saitan_kyori = infinity; temae_list = []} 
] 
