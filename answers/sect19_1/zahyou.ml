(* ��ɸ��ɽ���⥸�塼�� *) 
module Zahyou = struct 
  let x = 3.0   (* x ��ɸ *) 
  let y = 4.0   (* y ��ɸ *) 
 
  (* ��Ū��������ä��� (a, b) ������ (x, y) �ޤǤε�Υ����� *) 
  (* kyori : float * float -> float *) 
  let kyori (a, b) = 
    sqrt ((x -. a) *. (x -. a) +. (y -. b) *. (y -. b)) 
end 
