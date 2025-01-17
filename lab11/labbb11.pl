:-dynamic dish_number/2,country_dish/2,meat/2,dough/2,rice_and_vegetables/2,cooking/2.

read_str(A) :-get0(X),r_str(X, A, []).
r_str(10, A, A) :- !.
r_str(X, A, B) :-append(B, [X], B1),get0(X1),r_str(X1, A, B1).

dish_number_r(X,Y):-repeat,(dish_number(X,Y)->(nl,write(X),nl,write(Y),write("."),retract(dish_number(X,Y)));X=nil,Y=nil).
country_dish_r(X,Y):-repeat,(country_dish(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(country_dish(X,Y)));X=nil,Y=nil).
meat_r(X,Y):-repeat,(meat(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(meat(X,Y)));X=nil,Y=nil).
dough_r(X,Y):-repeat,(dough(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(dough(X,Y)));X=nil,Y=nil).
rice_and_vegetables_r(X,Y):-repeat,(rice_and_vegetables(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(rice_and_vegetables(X,Y)));X=nil,Y=nil).
cooking_r(X,Y):-repeat,(cooking(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(cooking(X,Y)));X=nil,Y=nil).

prTell:-tell('C:/Users/VirusTM/Documents/Prolog/lab11/1.txt'),dish_number_r(X1,_),X1=nil,told,
     tell('C:/Users/VirusTM/Documents/Prolog/lab11/2.txt'),country_dish_r(X2,_),X2=nil,told,
     tell('C:/Users/VirusTM/Documents/Prolog/lab11/3.txt'),meat_r(X3,_),X3=nil,told,
     tell('C:/Users/VirusTM/Documents/Prolog/lab11/4.txt'),dough_r(X4,_),X4=nil,told,
     tell('C:/Users/VirusTM/Documents/Prolog/lab11/5.txt'),rice_and_vegetables_r(X5,_),X5=nil,told,
     tell('C:/Users/VirusTM/Documents/Prolog/lab11/6.txt'),cooking_r(X6,_),X6=nil,told.

prSee:-see('C:/Users/VirusTM/Documents/Prolog/lab11/1.txt'), get0(Sym1), read_data(Sym1,1), seen,
     see('C:/Users/VirusTM/Documents/Prolog/lab11/2.txt'), get0(Sym2), read_data(Sym2,2), seen,
     see('C:/Users/VirusTM/Documents/Prolog/lab11/3.txt'), get0(Sym3), read_data(Sym3,3), seen,
     see('C:/Users/VirusTM/Documents/Prolog/lab11/4.txt'), get0(Sym4), read_data(Sym4,4), seen,
     see('C:/Users/VirusTM/Documents/Prolog/lab11/5.txt'), get0(Sym5), read_data(Sym5,5), seen,
     see('C:/Users/VirusTM/Documents/Prolog/lab11/6.txt'), get0(Sym6), read_data(Sym6,6), seen.

read_data(-1, _) :- !.
read_data(_, Flag) :-read_str(Lang),name(X, Lang),read(Y),
            (
              Flag = 1 ->asserta(dish_number(X, Y));
            (
              Flag = 2 ->asserta(country_dish(X, Y));
            (
              Flag = 3 ->asserta(meat(X, Y));
            (
              Flag = 4 ->asserta(dough(X, Y));
            (
              Flag = 5 ->asserta(rice_and_vegetables(X, Y));
            (
              Flag = 6 ->asserta(cooking(X, Y)))))))),

         get0(Sym),
         read_data(Sym, Flag).

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



pr :-prSee,question1(X1),question2(X2),question3(X3),question4(X4),question5(X5),
        question6(X6),
        (dish_number(X,X1),country_dish(X,X2),meat(X,X3),dough(X,X4),rice_and_vegetables(X,X5),
         cooking(X,X6),write(X);
         (write("New -> "),
          read(Auto),
          asserta(dish_number(Auto, X1)),
          asserta(country_dish(Auto, X2)),
          asserta(meat(Auto, X3)),
          asserta(dough(Auto, X4)),
          asserta(rice_and_vegetables(Auto, X5)),
          asserta(cooking(Auto, X1)),
          prTell,nl,
          write("New was added!"))).
