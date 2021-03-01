
man(gregory).
man(daniil).
man(robert).
man(jake).

woman(victoria).
woman(nastya).
woman(katarina).
woman(lyisa).

all_man(X):-man(X),write(X),fail.
all_woman(X):-woman(X),write(X),fail.



