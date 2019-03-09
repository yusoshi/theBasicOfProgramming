(* 人（名前、身長、体重、誕生日、血液型）を表す型 *)
type person_t = {
    name : string;
    height : int;
    weight : int;
    birth_date : string;
    blood_type : string;
}

(* test_data *)
let p1 = { name = "Aさん"; height = 120; weight = 50; birth_date = "2019-01-01"; blood_type = "A" }
let p2 = { name = "Bさん"; height = 150; weight = 150; birth_date = "2016-01-01"; blood_type = "B" }
let p3 = { name = "Cさん"; height = 143; weight = 62; birth_date = "2029-01-01"; blood_type = "O" }
let p4 = { name = "Dさん"; height = 12; weight = 3; birth_date = "1999-09-01"; blood_type = "AB" }
let p5 = { name = "Eさん"; height = 129; weight = 38; birth_date = "2004-09-01"; blood_type = "O" }
let p6 = { name = "Fさん"; height = 152; weight = 65; birth_date = "2028-09-01"; blood_type = "AB" }
let p7 = { name = "Gさん"; height = 160; weight = 70; birth_date = "2028-03-01"; blood_type = "B" }
let p8 = { name = "Hさん"; height = 198; weight = 68; birth_date = "2118-03-01"; blood_type = "AB" }

(* list *)
let lst1 = []
let lst2 = [p1; p4]
let lst3 = [p1; p2; p3; p4]
let lst4 = [p3; p2; p1]
let lst5 = [p3; p2; p1; p8; p7; p6; p5; p4]
let lst6 = [p3; p2; p7; p6; p5; p4]
