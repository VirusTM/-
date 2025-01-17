dish_number(borh,1).
dish_number(pelmeni,2).
dish_number(syshi,2).
dish_number(cake,3).
dish_number(byrito,2).
dish_number(caesar_salad,0).
dish_number(rassolnik,1).
dish_number(pizza,2).
dish_number(sochik,3).
dish_number(sosiska_in_testo,3).
dish_number(shirnik,3).
dish_number(ice_cream,3).
dish_number(seledka_in_shyba,2).
dish_number(ratatouille,2).
dish_number(ydon,2).
dish_number(tamyan,1).
dish_number(snitsel,2).
dish_number(feidjoada,2).
dish_number(paxvala,3).
dish_number(vinaigrette,0).
dish_number(krabovii_salad,0).
dish_number(omelet,3).
dish_number(bylion,1).

country_dish(borh,1).
country_dish(pelmeni,1).
country_dish(syshi,2).
country_dish(cake,1).
country_dish(byrito,2).
country_dish(caesar_salad,2).
country_dish(rassolnik,1).
country_dish(pizza,2).
country_dish(sochik,1).
country_dish(sosiska_in_testo,2).
country_dish(shirnik,1).
country_dish(ice_cream,2).
country_dish(seledka_in_shyba,1).
country_dish(ratatouille,2).
country_dish(ydon,2).
country_dish(tamyan,2).
country_dish(snitsel,2).
country_dish(feidjoada,2).
country_dish(paxvala,2).
country_dish(vinaigrette,1).
country_dish(krabovii_salad,1).
country_dish(omelet,2).
country_dish(bylion,1).

meat(borh,1).
meat(pelmeni,1).
meat(syshi,1).
meat(cake,2).
meat(byrito,1).
meat(caesar_salad,2).
meat(rassolnik,2).
meat(pizza,1).
meat(sochik,2).
meat(sosiska_in_testo,1).
meat(shirnik,2).
meat(ice_cream,2).
meat(seledka_in_shyba,1).
meat(ratatouille,2).
meat(ydon,1).
meat(tamyan,1).
meat(snitsel,1).
meat(feidjoada,1).
meat(paxvala,2).
meat(vinaigrette,2).
meat(krabovii_salad,1).
meat(omelet,1).
meat(bylion,1).

dough(borh,2).
dough(pelmeni,1).
dough(syshi,2).
dough(cake,2).
dough(byrito,1).
dough(caesar_salad,2).
dough(rassolnik,2).
dough(pizza,1).
dough(sochik,1).
dough(sosiska_in_testo,1).
dough(shirnik,1).
dough(ice_cream,2).
dough(seledka_in_shyba,2).
dough(ratatouille,2).
dough(ydon,2).
dough(tamyan,2).
dough(snitsel,2).
dough(feidjoada,2).
dough(paxvala,2).
dough(vinaigrette,2).
dough(krabovii_salad,2).
dough(omelet,2).
dough(bylion,2).


rice_and_vegetables(borh,1).
rice_and_vegetables(pelmeni,2).
rice_and_vegetables(syshi,1).
rice_and_vegetables(cake,2).
rice_and_vegetables(byrito,1).
rice_and_vegetables(caesar_salad,1).
rice_and_vegetables(rassolnik,1).
rice_and_vegetables(pizza,2).
rice_and_vegetables(sochik,2).
rice_and_vegetables(sosiska_in_testo,2).
rice_and_vegetables(shirnik,2).
rice_and_vegetables(ice_cream,2).
rice_and_vegetables(seledka_in_shyba,1).
rice_and_vegetables(ratatouille,1).
rice_and_vegetables(ydon,1).
rice_and_vegetables(tamyan,1).
rice_and_vegetables(snitsel,2).
rice_and_vegetables(feidjoada,1).
rice_and_vegetables(paxvala,2).
rice_and_vegetables(vinaigrette,1).
rice_and_vegetables(krabovii_salad,1).
rice_and_vegetables(omelet,2).
rice_and_vegetables(bylion,2).


cooking(borh,2).
cooking(pelmeni,2).
cooking(syshi,3).
cooking(cake,3).
cooking(byrito,1).
cooking(caesar_salad,3).
cooking(rassolnik,2).
cooking(pizza,1).
cooking(sochik,3).
cooking(sosiska_in_testo,1).
cooking(shirnik,1).
cooking(ice_cream,3).
cooking(seledka_in_shyba,3).
cooking(ratatouille,3).
cooking(ydon,2).
cooking(tamyan,2).
cooking(snitsel,1).
cooking(feidjoada,1).
cooking(paxvala,2).
cooking(vinaigrette,3).
cooking(krabovii_salad,3).
cooking(omelet,1).
cooking(bylion,2).


question1(X1):-write("when your dish is served?"),nl,
write("0-garnish"),nl,
write("1-first"),nl,
write("2-second"),nl,
write("3-dessert"),nl,
read(X1).

question2(X2):-write("Russian cuisine is served here?"),nl,
write("1-yes"),nl,
write("2-no"),nl,
read(X2).

question3(X3):-write("is there any meat in your dish?"),nl,
write("1-yes"),nl,
write("2-no"),nl,
read(X3).


question4(X4):-write("your dish consists of or is used in dough?"),nl,
write("1-yes"),nl,
write("2-no"),nl,
read(X4).


question5(X5):-write("The above dish has vegetables or rice?"),nl,
write("1-yes"),nl,
write("2-no"),nl,
read(X5).


question6(X6):-write("how to prepare your dish?"),nl,
write("1-fried"),nl,
write("2-cooking"),nl,
write("3-option 3"),nl,
read(X6).


pr:- question1(X1),

question2(X2),
question3(X3),
question4(X4),
question5(X5),
question6(X6),

dish_number(X,X1),
country_dish(X,X2),
meat(X,X3),
dough(X,X4),
rice_and_vegetables(X,X5),
cooking(X,X6),
write(X),nl,fail.
