writespisok([]):-!.
writespisok([A|Y]):-write(A),writespisok(Y).
readspisok(Z,D):-rs(Z,0,[],D).
rs(Z,Z,D,D):-!.
rs(Z,P,D1,D):-P1 is P+1, read(X),append(D1,[X],D2),rs(Z,P1,D2,D).
