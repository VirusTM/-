
man(gosh).
man(iami).
man(jordan).
man(valera).
man(daniil).
man(andrei).
man(kirill).
man(harry).
man(zahar).

woman(katerina).
woman(luba).
woman(oksana).
woman(vika).
woman(vasilisa).
woman(katya).
woman(olesya).
woman(ira).
woman(tanya).

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

children(X,Y):-parent(Y,X).
children(X):-children(Y,X),write(Y),write(", "),nl ,fail.
