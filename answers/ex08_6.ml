(* ���餫���� ex08_5.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex08_5.ml" 
 
let ekimei1 = {kanji="謲�ë"; kana="�ߤ礦������"; 
	       romaji="myogadani"; shozoku="�ݥ�����"} 
let ekimei2 = {kanji="��ë"; kana="���֤�"; 
	       romaji="shibuya"; shozoku="�����"} 
let ekimei3 = {kanji="���Į"; kana="�����Ƥޤ�"; 
	       romaji="otemachi"; shozoku="��������"} 
 
(* ��Ū��ekimei_t ���Υǡ�����ʸ������֤� *) 
(* hyoji : ekimei_t -> string *) 
let hyoji ekimei = match ekimei with 
  {kanji = k; kana = a; romaji = r; shozoku = s} -> 
    s ^ "��" ^ k ^ "��" ^ a ^ "��" 
 
(* �ƥ��� *) 
let test1 = hyoji ekimei1 = "�ݥ�������謲�ë�ʤߤ礦�����ˡ�" 
let test2 = hyoji ekimei2 = "���������ë�ʤ��֤��" 
let test3 = hyoji ekimei3 = "�������������Į�ʤ����Ƥޤ���" 
