man(gosh).
man(iami).
man(jordan).
man(valera).
man(daniil).
man(andrei).
man(kirill).
man(harry).
man(zahar).
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
woman(nadejda).



parent(kostya,luba).
parent(kostya,jordan).
parent(kostya,vuka).
parent(kostya,daniil).


parent(nadejda,luba).
parent(nadejda,jordan).
parent(nadejda,vuka).
parent(nadejda,daniil).


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

allman(X):-man(X),write(X),nl,fail.
allwoman(X):-woman(X),write(X),nl,fail.

children(X,Y):-parent(Y,X).
children(X):-children(Y,X),write(Y),nl,fail.

mother(X,Y):-parent(X,Y),woman(X).
mothers(X):-mother(Y,X),write(Y),nl,fail.

father(X,Y):-parent(X,Y),man(X).
father(X):-father(Y,X),write(Y),nl,fail.

brother(X,Y):-parent(Z,X),parent(Z,Y),man(X),woman(Z).
brothers(X):-brother(Y,X),write(Y),nl,fail.

wife(X,Y):-parent(X,Z),parent(Y,Z),woman(X),man(Y).
wife(X):-wife(Y,X),write(Y).

b_s(X,Y):-parent(Z,X),parent(Z,Y),man(Z),not(X=Y),!.
bs(X,Y):-parent(Z,X),parent(Z,Y),woman(Z),not(X=Y).
b_s(X):-bs(Y,X),write(Y),nl,fail.

grand_pa(X,Y):-parent(X,Z),parent(Y,Z),man(X).
grand_pas(X):-grand_pa(Y,X),X\=Y,write(Y),nl,fail.

grand_da(X,Y):-parent(Z,X),parent(Y,Z),woman(X).
grand_dats(X):-woman(Y),parent(X,Z),parent(Z,Y),write(Y),nl,fail.

grand_pa(X,Y):-parent(X,Z),parent(Z,Y),man(X),man(Y).
grand_pa_and_son(X,Y):-grand_pa(X,Y)\=grand_pa(Y,X),man(X),man(Y).

grand_ma(X,Y):-parent(X,Z),parent(Z,Y),woman(X).
grand_ma_and_son(X,Y):-grand_ma(X,Y)\=grand_ma(Y,X),woman(Y),man(X).
grand_ma_and_son(X,Y):-grand_ma(X,Y)\=grand_ma(Y,X),woman(X),man(Y).

uncle(X,Y):-parent(Z,D),parent(D,Y),parent(Z,X),X\=D,man(X),man(Z).
uncles(X):-uncle(Y,X),write(Y),nl,fail.

nephew(X,Y):-parent(R,H),parent(H,X),parent(R,Y),Y\=H ,man(Y),man(X),man(R).
nephews(X):-nephew(Y,X),write(Y).
