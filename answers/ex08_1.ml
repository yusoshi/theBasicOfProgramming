(* �ܤ˴ؤ��������Ǽ����쥳���� *) 
type book_t = { 
  title : string;	(* �����ȥ� *) 
  author : string;	(* ���� *) 
  publisher : string;	(* ���Ǽ� *) 
  price : int;		(* ���� *) 
  isbn : string;	(* ISBN *) 
} 
 
let book1 = { 
  title = "�ץ���ߥ󥰤δ���"; 
  author = "������"; 
  publisher = "�������󥹼�"; 
  price = 2300; 
  isbn = "978-4-7819-1160-1"; 
} 
 
let book2 = { 
  title = "���르�ꥺ��ȥǡ�����¤"; 
  author = "��Ȫ��"; 
  publisher = "���Ƚ�Ź"; 
  price = 3900; 
  isbn = "4-00-010343-1"; 
} 
 
let book3 = { 
  title = "�ץ���ߥ󥰸��� Standard ML ����"; 
  author = "���ٽ�"; 
  publisher = "��Ω����"; 
  price = 3800; 
  isbn = "4-320-12024-8"; 
} 
