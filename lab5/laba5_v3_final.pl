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


hair:- Comrade=[_,_,_],
list1(Comrade,[belokurov,_]),
list1(Comrade,[chernov,_]),
list1(Comrade,[rizhov,_]),
list1(Comrade,[_,ginger]),
list1(Comrade,[_,blond]),
list1(Comrade,[_,brunette]),
not(list1(Comrade,[belokurov,blond])),
not(list1(Comrade,[chernov,brunette])),
not(list1(Comrade,[rizhov,ginger])),
not(list1(Comrade,[belokurov,brunette])),

write(Comrade),!.

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

surname:- Worker=[_,_,_],

list1(Worker,[slesar,_,0,0,_]),
list1(Worker,[tokar,_,_,1,_]),
list1(Worker,[svarschik,_,_,_,_]),
list1(Worker,[_,borisov,1,_,_]),
list1(Worker,[_,ivanov,_,_,_]),
list1(Worker,[_,semenov,_,2,borisov]),

write(Worker),!.

drinking:- Drink=[_,_,_,_],
list1(Drink,[bottle,_]),
list1(Drink,[glass,_]),
list1(Drink,[jug,_]),
list1(Drink,[jar,_]),
list1(Drink,[_,milk]),
list1(Drink,[_,lemonade]),
list1(Drink,[_,kvass]),
list1(Drink,[_,water]),
not(list1(Drink,[bottle,water])),
not(list1(Drink,[bottle,milk])),
right([jug,_],[_,lemonade],Drink),
right([_,lemonade],[_,kvass],Drink),
not(list1(Drink,[jar,lemonade])),
not(list1(Drink,[jar,water])),
next([jar,_],[glass,_],Drink),
next([jar,_],[_,milk],Drink),

write(Drink),!.

prof:- Artists=[_,_,_,_],
list1(Artists,[voronov,_]),
list1(Artists,[pavlov,_]),
list1(Artists,[levitsky,_]),
list1(Artists,[saharov,_]),
list1(Artists,[_,dancer]),
list1(Artists,[_,painter]),
list1(Artists,[_,singer]),
list1(Artists,[_,writer]),
not(list1(Artists,[voronov,singer])),
not(list1(Artists,[voronov,painter])),
not(list1(Artists,[pavlov,painter])),
not(list1(Artists,[pavlov,writer])),
not(list1(Artists,[saharov,writer])),
not(list1(Artists,[voronov,writer])),

write(Artists),!.

sportnat:- Guys=[_,_,_],
list1(Guys,[mihael,_,basketball,_]),
list1(Guys,[simon,israeli,_,_]),
list1(Guys,[richard,_,_,_]),
list1(Guys,[_,american,_,_]),
list1(Guys,[_,australian,_,_]),
list1(Guys,[_,_,tennis,_]),
list1(Guys,[_,_,cricket,first]),
list1(Guys,[_,_,_,second]),
list1(Guys,[_,_,_,third]),
not(list1(Guys,[mihael,american,_,_])),
not(list1(Guys,[simon,_,tennis,_])),
list1(Guys,[Who1,australian,_,_]),
list1(Guys,[Who2,_,tennis,_]),

write(Guys),nl,
write(Who1),write(" He's from Australia "),nl,
write(Who2),write(" He loves tennis "),!.

combinations:- Nabor=[_,_,_,_,_],
list1(Nabor,[andrey,_,_,no,_]),
list1(Nabor,[_,dmitry,_,_,no]),
list1(Nabor,[_,_,boris,_,_]),
list1(Nabor,[no,_,_,viktor,_]),
list1(Nabor,[_,no,_,_,grigoriy]),
list1(Nabor,[no,_,_,_,_]),
list1(Nabor,[_,no,_,_,_]),
list1(Nabor,[_,_,no,_,_]),
list1(Nabor,[_,_,_,no,_]),
list1(Nabor,[_,_,_,_,no]),
list1(Nabor,[andrey,dmitry,no,_,_]),
list1(Nabor,[andrey,no,boris,no,_]),
list1(Nabor,[_,dmitry,no,no,_]),
list1(Nabor,[_,no,_,victor,grigoriy]),

write(Nabor),!.
