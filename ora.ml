(* ³ØÀ¸¤Î¥Ç¡¼¥¿¤ÎÎã *) 
let gakusei1 = {namae="nakamura"; tensuu=90; seiseki="A"} 
let gakusei2 = {namae="miyahara"; tensuu=80; seiseki="A"} 
let gakusei3 = {namae="sato"; tensuu=75; seiseki="B"} 
let gakusei4 = {namae="idehara"; tensuu=70; seiseki="B"} 
let gakusei5 = {namae="tsubata"; tensuu=65; seiseki="C"}
let gakusei6 = {namae="asai"; tensuu=60; seiseki="C"}
 
 (* ³ØÀ¸¤Î¥ê¥¹¥È¤ÎÎã *) 
 let lst1 = [gakusei2]  
 let lst2 = [gakusei3; gakusei4] 
 let lst3 = [gakusei4; gakusei3] 
 let lst4 = [gakusei4; gakusei1; gakusei6; gakusei5; gakusei2; gakusei3]
  
  (* ÌÜÅª¡§³ØÀ¸¥ê¥¹¥È lst ¤ÎÃæ¤«¤éºÇ¹âÆÀÅÀ¤Î¿Í¤òÊÖ¤¹ *) 
  (* gakusei_max : gakusei_t list -> gakusei_t *)  
  let rec gakusei_max lst = match lst with 
      [] -> {namae = ""; tensuu = min_int; seiseki = ""} 
        | ({namae = n; tensuu = t; seiseki = s} as gakusei) :: rest ->
	      match gakusei_max rest with 
	              {namae = n_max; tensuu = t_max; seiseki = s_max} -> 
		                if t_max < t then gakusei 
				              else gakusei_max rest
						   
						   (* ¥Æ¥¹¥È *) 
						   let test1 = gakusei_max lst1 = gakusei2
						   let test2 = gakusei_max lst2 = gakusei3
						   let test3 = gakusei_max lst3 = gakusei3 
						   let test4 = gakusei_max lst4 = gakusei1

