(* ���餫���� ex10_10.ml, ex10_11.ml ���ɤ߹���Ǥ���ɬ�פ��� *) 
#use "ex10_10.ml" 
#use "ex10_11.ml" 
 
(* ��Ū���դ��Ĥαؤδ֤ε�Υ��ʸ�����ɽ������ *) 
let kyori_wo_hyoji romaji1 romaji2 = 
  let kanji1 = romaji_to_kanji romaji1 global_ekimei_list in 
  if kanji1 = "" then romaji1 ^ " �Ȥ����ؤ�¸�ߤ��ޤ���" 
  else let kanji2 = romaji_to_kanji romaji2 global_ekimei_list in 
       if kanji2 = "" then romaji2 ^ " �Ȥ����ؤ�¸�ߤ��ޤ���" 
       else let kyori = get_ekikan_kyori kanji1 kanji2 global_ekikan_list in 
	    if kyori = infinity 
	    then kanji1 ^ "��" ^ kanji2 ^ "�ϤĤʤ��äƤ��ޤ���" 
	    else kanji1 ^ "����" ^ kanji2 ^ "�ޤǤ� " ^ 
		 string_of_float kyori ^ " ����Ǥ�" 
 
(* �ƥ��� *) 
let test1 = kyori_wo_hyoji "myougadani" "shinotsuka" 
	    = "myougadani �Ȥ����ؤ�¸�ߤ��ޤ���" 
let test1 = kyori_wo_hyoji "myogadani" "shinotsuka" 
	    = "謲�ë���鿷���ͤޤǤ� 1.2 ����Ǥ�" 
let test1 = kyori_wo_hyoji "myogadani" "ikebukuro" 
	    = "謲�ë�����ޤϤĤʤ��äƤ��ޤ���" 
let test1 = kyori_wo_hyoji "tokyo" "ootemachi" 
	    = "ootemachi �Ȥ����ؤ�¸�ߤ��ޤ���" 
let test1 = kyori_wo_hyoji "tokyo" "otemachi" 
	    = "����������Į�ޤǤ� 0.6 ����Ǥ�" 
