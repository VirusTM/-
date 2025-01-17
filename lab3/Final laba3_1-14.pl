max(X,Y,X):-X>Y.
max(_,Y,Y).

max(X,Y,Z,X):-X>=Y,X>=Z,!.
max(_,Y,Z,Y):-Y>=Z,!.
max(_,_,Z,Z):-!.

fact(1,1):-!.
fact(N,X):-N_1 is N-1,fact(N_1,X_1),X is N*X_1.

vniz(1,X1,X1):-!.
vniz(N,X1,X):-N1 is N-1, X2 is X1*N,vniz(N1,X2,X).
factD(N,X):-vniz(N,1,X).

fib_up(1,1).
fib_up(2,1):-!.
fib_up(X,Y):-X1 is X-1,X2 is X-2, fib_up(X1,Y1),fib_up(X2,Y2), Y is Y1+Y2.

fib_d(N,N,X,_,X):-!.
fib_d(N,N_nac,Xt,VSX,X):-N_nac1 is N_nac +1,Xt1 is Xt + VSX,fib_d(N,N_nac1,Xt1,Xt,X).
fib_down(N,X):-fib_d(N,1,1,0,X).


summaup(0,0):-!.
summaup(X,SUM):-X1 is X div 10, summaup(X1,SUM1), SUM is SUM1 + X mod 10.

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

nod(A,A,A) :- !.
nod(A,B,D) :- A>B, !, C is A-B, nod(C,B,D).
nod(A,B,D) :- C is B-A, nod(A,C,D).

osnov(X):-pr(X,X),!.
pr(2,_):-!.
pr(X2,X):-X3 is X2-1,pr(X3,X),X mod X3 =\= 0.

delit(X,N):-div(X,X,N),!.
div(_,0,0):-!.
div(X,PosX,N):-
    X mod PosX =:= 0, PosX2  is  PosX -1,div(X,PosX2,N2),N is N2 + 1;
    X mod PosX  =\= 0, PosX2 is PosX -1,div(X,PosX2,N2), N is N2.


strangeIter(1,1):-!.
strangeIter(X,N):-
    X mod 2 =:= 0, NewX is X div 2,strangeIter(NewX,NewN),N is NewN+1,!;
    X mod 2 =\= 0, NewX is X*3 + 1,strangeIter(NewX,NewN),N is NewN+1,!.


countNotPrimeNODsUp(X,N):-countNPNODs(X,X,N),!.
countNPNODs(_,1,0):-!.
countNPNODs(X,Cur,N):-Cur mod 2 =:= 0,NewCur is Cur-1,countNPNODs(X,NewCur,NewN),
    nod(X,NewCur,Num), (Num =:= 1, N is NewN ; Num =\= 1, N is NewN+1);
    Cur mod 2 =\= 0, NewCur is Cur-1, countNPNODs(X,NewCur,NewN), N is NewN.

countNotPrimeNODsDown(X,N):-cNPNODsD(X,0,0,N),!.
cNPNODsD(X,X,N,N):-!.
cNPNODsD(X,CurX,CurN,N):-CurX mod 2 =:= 0, NewCurX is CurX+1, nod(X,NewCurX,Num),
    (Num =:= 1, NewCurN is CurN; Num =\= 1, NewCurN is CurN+1),
       cNPNODsD(X,NewCurX,NewCurN,N);
    CurX mod 2 =\= 0, NewCurX is CurX+1,NewCurN is CurN,cNPNODsD(X,NewCurX,NewCurN,N).
