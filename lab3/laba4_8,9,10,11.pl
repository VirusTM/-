sumdown(0,Sum,Sum):-!.
sumdown(X,Y,Sum):-X1 is X div 10, Y1 is Y + X mod 10,sumdown(X1,Y1,Sum).
sumd(X,SUMMA):-sumdown(X,0,SUMMA).

proizvedUP(0,1):-!.
proizvedUP(X,PR):-X1 is X div 10, proizvedUP(X1,PR1), PR is PR1 * (X mod 10).

proizvedDOWN(0,P,P):-!.
proizvedDOWN(X,Y,P):-X1 is X div 10, Y1 is Y * (X mod 10), proizvedDOWN(X1,Y1,P).
prD(X,PR):-proizvedDOWN(X,1,PR).

maxinodel3up(0,0):-!.
maxinodel3up(X,N):-X1 is X div 10, maxinodel3up(X1,N1),!,
    N2 is X mod 10, no3(N2,N3), max(N1,N3,N),!.
no3(X,X):- X mod 3 =\= 0,!.
no3(_,0):-!.

maxinodel3down(0,Max,Max):-!.
maxinodel3down(X,Max,N):-X1 is X div 10, N1 is X mod 10, no3(N1,N2),
    max(Max,N2,Max1), maxinodel3down(X1,Max1,N),!.
maxchislano3d(X,N):-maxinodel3down(X,0,N).




