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
man(dima).

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
woman(sophia).

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

parent(katya,sophia).
parent(dima,sophia).


grand_da(X,Y):-parent(Z,X),parent(Y,Z),woman(X).
grand_dats(X):-woman(Y),parent(X,Z),parent(Z,Y),write(Y).

grand_pa(X,Y):-parent(X,Z),parent(Z,Y),man(X).
grand_pa_and_son(X,Y):-grand_pa(X,Y)\=grand_pa(Y,X),man(X),man(Y).

grand_ma(X,Y):-parent(X,Z),parent(Z,Y),woman(X).
grand_ma_and_son(X,Y):-grand_ma(X,Y)\=grand_ma(Y,X),woman(Y),man(X).
grand_ma_and_son(X,Y):-grand_ma(X,Y)\=grand_ma(Y,X),woman(X),man(Y).

uncle(X,Y):-parent(Z,D),parent(D,Y),parent(Z,X),X\=D,man(X),man(Z).
uncles(X):-uncle(Y,X),write(Y).

nephew(X,Y):-parent(R,H),parent(H,X),parent(R,Y),Y\=H ,man(Y),man(X),man(R).
nephews(X):-nephew(Y,X),write(Y).
