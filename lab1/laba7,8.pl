man(gosh).
man(iami).
man(jordan).
man(valera).
man(daniil).
man(andrei).
man(kirill).
man(harry).
man(zahar).
man(alex).
man(kostya).

woman(katerina).
woman(luba).
woman(oksana).
woman(vika).
woman(vasilisa).
woman(katya).
woman(olesya).
woman(ira).
woman(tanya).
woman(klara).
woman(nadejda).

parent(gosh,iami).
parent(gosh,oksana).
parent(gosh,valera).
parent(gosh,vasilisa).

parent(katerina,iami).
parent(katerina,oksana).
parent(katerina,valera).
parent(katerina,vasilisa).

parent(iami,andrei).
parent(iami,kirill).
parent(luba,andrei).
parent(luba,kirill).

parent(jordan,harry).
parent(jordan,katya).
parent(oksana,harry).
parent(oksana,katya).

parent(valera,olesya).
parent(valera,ira).
parent(vika,olesya).
parent(vika,ira).

parent(daniil,tanya).
parent(daniil,zahar).
parent(vasilisa,tanya).
parent(vasilisa,zahar).

parent(andrei,alex).
parent(klara,alex).

parent(kirill,kostya).
parent(nadejda,kostya).





b_s(X,Y):-parent(Z,X),parent(Z,Y),man(Z),not(X=Y),!.
bs(X,Y):-parent(Z,X),parent(Z,Y),woman(Z),not(X=Y).
b_s(X):-bs(Y,X),write(Y),write(", "),false.

grand_pa(X,Y):-parent(X,Z),parent(Z,Y),man(X)
grand_pas(X):-man(Y),parent(Z,X),parent(Y,Z),write(Y).
