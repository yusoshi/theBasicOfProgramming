(* 
# let square x = x * x ;; 
val square : int -> int = <fun> 
# square 3. ;;				(* 3. �ǤϤʤ� 3 �������� *) 
         ^^ 
This expression has type float but is here used with type int 
# let circle = 2. *. pi *. r ;;		(* circle �θ�� r ��­��ʤ� *) 
                     ^^ 
Unbound value pi 
# circle 2. ;;				(* ��ǥ��顼�ˤʤä����� *) 
  ^^^^^^				(* circle ���������Ƥ��ʤ� *) 
Unbound value circle 
# let TV bangumi youbi =		(* ��ʸ���δؿ�������Ǥ��ʤ� *) 
                 ^^^^^ 
    bangumi ^ "��" ^ youbi ^ "�����ǤǤ���" ;; 
Syntax error 
# TV "�ݥ����" "������" ;;		(* ��ǥ��顼�ˤʤä����� *) 
                ^^^^^^^^		(* �ؿ����������Ƥ��ʤ� *) 
Syntax error 
# 
*) 
