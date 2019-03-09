(* ���餫���� ex08_5.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex08_5.ml" 
 
(* ��̾�ꥹ�Ȥ��� *) 
 
let ekimei_list = [ 
{kanji="����"; kana="�����֤���"; romaji="ikebukuro"; shozoku="�ݥ�����"}; 
{kanji="������"; kana="���󤪤��Ĥ�"; romaji="shinotsuka"; shozoku="�ݥ�����"}; 
{kanji="謲�ë"; kana="�ߤ礦������"; romaji="myogadani"; shozoku="�ݥ�����"}; 
{kanji="��ڱ�"; kana="�����餯����"; romaji="korakuen"; shozoku="�ݥ�����"}; 
{kanji="�ܶ�������"; kana="�ۤ󤴤�������礦��"; romaji="hongosanchome"; shozoku="�ݥ�����"}; 
{kanji="����ο�"; kana="������Τߤ�"; romaji="ochanomizu"; shozoku="�ݥ�����"} 
] 
 
(* ��Ū��������¤�Ǥ��� lst �����������֤� ekimei ���������� *) 
(* ekimei_insert : ekimei_t list -> ekimei_t -> ekimei_t list *) 
let rec ekimei_insert lst ekimei0 = match lst with 
    [] -> [ekimei0] 
  | ({kanji = k; kana = a; romaji = r; shozoku = s} as ekimei) :: rest -> 
      match ekimei0 with {kanji = k0; kana = a0; romaji = r0; shozoku = s0} -> 
	if a = a0 then ekimei_insert rest ekimei0 
	else if a < a0 then ekimei :: ekimei_insert rest ekimei0 
	else ekimei0 :: lst 
 
(* �ƥ��� *) 
let test1 = ekimei_insert [] {kanji="謲�ë"; kana="�ߤ礦������"; romaji="myogadani"; shozoku="�ݥ�����"} 
	    = [{kanji="謲�ë"; kana="�ߤ礦������"; romaji="myogadani"; shozoku="�ݥ�����"}] 
let test2 = ekimei_insert [ 
	{kanji="����"; kana="�����֤���"; romaji="ikebukuro"; shozoku="�ݥ�����"}; 
	{kanji="����ο�"; kana="������Τߤ�"; romaji="ochanomizu"; shozoku="�ݥ�����"}; 
	{kanji="������"; kana="���󤪤��Ĥ�"; romaji="shinotsuka"; shozoku="�ݥ�����"}; 
	{kanji="�ܶ�������"; kana="�ۤ󤴤�������礦��"; romaji="hongosanchome"; shozoku="�ݥ�����"}; 
	{kanji="謲�ë"; kana="�ߤ礦������"; romaji="myogadani"; shozoku="�ݥ�����"} 
	] 
	{kanji="��ڱ�"; kana="�����餯����"; romaji="korakuen"; shozoku="�ݥ�����"} 
= [ 
{kanji="����"; kana="�����֤���"; romaji="ikebukuro"; shozoku="�ݥ�����"}; 
{kanji="����ο�"; kana="������Τߤ�"; romaji="ochanomizu"; shozoku="�ݥ�����"}; 
{kanji="��ڱ�"; kana="�����餯����"; romaji="korakuen"; shozoku="�ݥ�����"}; 
{kanji="������"; kana="���󤪤��Ĥ�"; romaji="shinotsuka"; shozoku="�ݥ�����"}; 
{kanji="�ܶ�������"; kana="�ۤ󤴤�������礦��"; romaji="hongosanchome"; shozoku="�ݥ�����"}; 
{kanji="謲�ë"; kana="�ߤ礦������"; romaji="myogadani"; shozoku="�ݥ�����"} 
] 
 
(* ��Ū��ekimei list ��Ҥ餬�ʤν�����󤷤ʤ���ؤν�ʣ������� *) 
(* seiretsu : ekimei_t list -> ekimei_t list *) 
let rec seiretsu ekimei_list = match ekimei_list with 
    [] -> [] 
  | first :: rest -> ekimei_insert (seiretsu rest) first 
 
(* �ƥ��� *) 
let test3 = seiretsu [] = [] 
let test4 = seiretsu ekimei_list = [ 
{kanji="����"; kana="�����֤���"; romaji="ikebukuro"; shozoku="�ݥ�����"}; 
{kanji="����ο�"; kana="������Τߤ�"; romaji="ochanomizu"; shozoku="�ݥ�����"}; 
{kanji="��ڱ�"; kana="�����餯����"; romaji="korakuen"; shozoku="�ݥ�����"}; 
{kanji="������"; kana="���󤪤��Ĥ�"; romaji="shinotsuka"; shozoku="�ݥ�����"}; 
{kanji="�ܶ�������"; kana="�ۤ󤴤�������礦��"; romaji="hongosanchome"; shozoku="�ݥ�����"}; 
{kanji="謲�ë"; kana="�ߤ礦������"; romaji="myogadani"; shozoku="�ݥ�����"} 
] 
