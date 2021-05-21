
in_list([El|_], El).
in_list([_|T], El) :- in_list(T, El).

in_list_exclude([El|T], El, T).
in_list_exclude([H|T], El, [H|Tail]) :- in_list_exclude(T, El, Tail).

read_str(A, N) :-
  get0(X),
  r_str(X, A, [], N, 0).
r_str(10, A, A, N, N) :- !.
r_str(X, A, B, N, K) :-
  K1 is K + 1,
  append(B, [X], B1),
  get0(X1),
  r_str(X1, A, B1, N, K1).

write_str([]) :- !.
write_str([H|Tail]) :- put(H), write_str(Tail).

nashpr:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt').



prrazmshk:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt'),

read_str(A, _),
  read(K),
  b_a_rp(A, K, []).

b_a_rp(_, 0, Perm1) :- write_str(Perm1), nl, !, fail.
b_a_rp(A, N, Perm) :-
  in_list(A, El),
  N1 is N - 1,
  b_a_rp(A, N1, [El|Perm]).

prperestanovki:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt'),
  read_str(A, _),
  b_a_p(A, []).

b_a_p([], Perm1) :- write_str(Perm1), nl, !, fail.
b_a_p(A, Perm) :-
  in_list_exclude(A, El, A1),
  b_a_p(A1, [El|Perm]).

prallrazmesh:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt'),
  read_str(A, _),
  read(K),
  b_a_r(A, K, []).

b_a_r(_, 0, Perm1) :- write_str(Perm1), nl, !, fail.
b_a_r(A, N, Perm) :-
  in_list_exclude(A, El, A1),
  N1 is N - 1,
  b_a_r(A1, N1, [El|Perm]).

sub_set([], []).
sub_set([H|Sub_set], [H|Set]) :- sub_set(Sub_set, Set).
sub_set(Sub_set, [_|Set]) :- sub_set(Sub_set, Set).

prpodmnoj:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt'),
  read_str(A, _),
  sub_set(B, A),
  write_str(B), nl, fail.

sochet([], 0, _) :- !.
sochet([H|Sub_set], K, [H|Set]) :-
  K1 is K - 1,
  sochet(Sub_set, K1, Set).
sochet(Sub_set, K, [_|Set]) :- sochet(Sub_set, K, Set).

prsoshetania:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt'),
  read_str(A, _),
  read(K),
  sochet(B, K, A),
  write_str(B), nl, fail.

sochet_p([], 0, _) :- !.
sochet_p([H|Sub_set], K, [H|Set]) :-
  K1 is K - 1,
  sochet_p(Sub_set, K1, [H|Set]).
sochet_p(Sub_set, K, [_|Set]) :- sochet_p(Sub_set, K, Set).

prsochetwithpovt:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt'),
  read_str(A, _),
  read(K),
  sochet_p(B, K, A),
  write_str(B), nl, fail.

words_t2(_, Count, 5, Word) :-
  Count = 2,
  write_str(Word), nl, !, fail.
words_t2(_, _, 5, _) :- !, fail.
words_t2(List, CurCount, CurLength, CurWord) :-
  in_list(List, El),
  (El = 97 ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  append(CurWord, [El], CurWord1),
  CurLength1 is CurLength + 1,
  words_t2(List, CurCount1, CurLength1, CurWord1).
words_t2(List) :- words_t2(List, 0, 0, []).

preduct2:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt'),
  read_str(A, _),
  words_t2(A).


ls_num_el([H], El, CurNum, Num) :-
  ((H = El) ->
  Num is CurNum + 1;
  write("Such element isn\'t found")), !.
ls_num_el([H|T], El, CurNum, Num) :-
  CurNum1 is CurNum + 1,
  ((El = H) ->
  Num is CurNum1;
  ls_num_el(T, El, CurNum1, Num)).
ls_num_el([H|T], El, Num) :- ls_num_el([H|T], El, 0, Num).


ls_el_at_num([], _, _, _) :- write("item not found"), !.
ls_el_at_num([_], CurNum, Num, _) :-
  CurNum1 is CurNum + 1,
  CurNum1 < Num,
  write("Such element isn\'t found"), !.
ls_el_at_num([H|T], CurNum, Num, El) :-
  CurNum1 is CurNum + 1,
  ((CurNum1 is Num) ->
  El = H;
  ls_el_at_num(T, CurNum1, Num, El)).
ls_el_at_num([H|T], Num, El) :- ls_el_at_num([H|T], 0, Num, El).


in_ls([H|_], H) :- !.
in_ls([_|T], El) :- in_ls(T, El).


rm_el([_|T], CurList, Num, Num, NewList) :- append(CurList, T, NewList), !.
rm_el([H|T], CurList, CurNum, Num, NewList) :-
  append(CurList, [H], CurList1),
  CurNum1 is CurNum + 1,
  rm_el(T, CurList1, CurNum1, Num, NewList).
rm_el(List, Num, NewList) :- rm_el(List, [], 1, Num, NewList).


rm_equals(List, El, List) :- not(in_ls(List, El)), !.
rm_equals(List, El, NewList) :-
  ls_num_el(List, El, Num),
  rm_el(List, Num, List1),
  rm_equals(List1, El, NewList).

uni_list([], []) :- !.
uni_list([H|T], List) :-
  rm_equals(T, H, RmList),
  uni_list(RmList, List1),
  append([H], List1, List).

