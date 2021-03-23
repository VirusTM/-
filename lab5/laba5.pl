list1([El|_],El).
list1([_|T],El):-list1(T,El).

right(A,B,[C]):-fail.
right(A,B,[A|[B|Tail]]).
right(A,B,[_|List]):-right(A,B,List).

leftward(A,B,[C]):-fail.
leftward(A,B,[B|[A|Tail]]).
leftward(A,B,[_|List]):-leftward(A,B,List).

next(A,B,List):-right(A,B,List).
next(A,B,List):-leftward(A,B,List).

el(List,Num,El):-el(List,Num,1,El).
el([H|_],Num,Num,H):-!.
el([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el(Tail,Num,Ind1,El).

pr:- Houses=[_,_,_,_,_],

list1(Houses,[red,english,_,_,_]),
list1(Houses,[_,spanish,_,dog,_]),
list1(Houses,[green,_,coffee,_,_]),
list1(Houses,[_,ukrain,tea,_,_]),
right([green,_,_,_,_],[white,_,_,_,_],Houses),
list1(Houses,[_,_,_,ulitka,old_gold]),
list1(Houses,[yellow,_,_,_,kool]),
el(Houses,3,[_,_,milk,_,_]),
el(Houses,1,[_,norway,_,_,_]),
next([_,_,_,_,chester],[_,_,_,fox,_],Houses),
next([_,_,_,_,kool],[_,_,_,horse,_],Houses),
list1(Houses,[_,_,orange,_,lucky]),
list1(Houses,[_,japan,_,_,parlament]),
next([_,norway,_,_,_],[blue,_,_,_,_],Houses),
list1(Houses,[_,WHO1,water,_,_]),
list1(Houses,[_,WHO2,_,zebra,_]),
write(Houses),
nl,write(WHO1),nl,write(WHO2).


hair:- Ñomrade=[_,_,_],
list1(Ñomrade,[belokurov,_]),
list1(Ñomrade,[chernov,_]),
list1(Ñomrade,[rizhov,_]),
list1(Ñomrade,[_,ginger]),
list1(Ñomrade,[_,blond]),
list1(Ñomrade,[_,brunette]),
not(list1(Ñomrade,[belokurov,blond])),
not(list1(Ñomrade,[chernov,brunette])),
not(list1(Ñomrade,[rizhov,ginger])),
not(list1(Ñomrade,[belokurov,brunette])),

write(Ñomrade),!.

appearance:- Woman=[_,_,_],
list1(Woman,[_,white,_]),
list1(Woman,[_,green,_]),
list1(Woman,[_,blue,_]),
list1(Woman,[_,_,white]),
list1(Woman,[_,_,green]),
list1(Woman,[_,_,blue]),
list1(Woman,[ann,_,_]),
list1(Woman,[natasha,_,green]),
list1(Woman,[valya,_,_]),
not(list1(Woman,[natasha,green,_])),
not(list1(Woman,[valya,white,white])),

write(Woman),!.

