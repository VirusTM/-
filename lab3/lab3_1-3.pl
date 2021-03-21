max(X,Y,X):-X>Y.
max(_,Y,Y).

max(X,Y,Z,X):-X>=Y,X>=Z,!.
max(_,Y,Z,Y):-Y>=Z,!.
max(_,_,Z,Z):-!.

fact(1,1):-!.
fact(N,X):-N_1 is N-1,fact(N_1,X_1),X is N*X_1.
