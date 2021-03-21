vniz(1,X1,X1):-!.
vniz(N,X1,X):-N1 is N-1, X2 is X1*N,vniz(N1,X2,X).
fact(N,X):-vniz(N,1,X).

fib(2,_,X1,X1):-!.
fib(N,PosX,X1,X):-N1 is N-1, X2 is PosX+X1, fib(N1,X1,X2,X).
fibD(N,X):-fib(N,1,1,X).

summaup(0,0):-!.
summaup(X,SUM):-X1 is X div 10, summaup(X1,SUM1), SUM is SUM1 + X mod 10
.
