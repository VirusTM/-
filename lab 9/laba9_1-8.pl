
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

words_t3(_, Count, 5, Word) :-
  Count = 2,
  rm_equals(Word, 97, WordNo97),
  uni_list(WordNo97, WordNo97),
  write_str(Word), nl, !, fail.
words_t3(_, _, 5, _) :- !, fail.
words_t3(List, CurCount, CurLength, CurWord) :-
  in_list(List, El),
  (El = 97 ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  append(CurWord, [El], CurWord1),
  CurLength1 is CurLength + 1,
  words_t3(List, CurCount1, CurLength1, CurWord1).
words_t3(List) :- words_t3(List, 0, 0, []).

preduct3:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt'),
  read_str(A, _),
  words_t3(A).


count_let_in_list([], _, Count, Count) :- !.
count_let_in_list([H|T], El, CurCount, Count) :-
  (H = El ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_let_in_list(T, El, CurCount1, Count).
count_let_in_list(List, El, Count) :- count_let_in_list(List, El, 0, Count).

let_2_time(_, [], _) :- !, fail.
let_2_time(List, [UniH|UniT], El) :-
  count_let_in_list(List, UniH, Count),
  (Count = 2 ->
  (El = UniH, true);
  let_2_time(List, UniT, El)).


words_t4(_, 5, Word) :-
  uni_list(Word, Uni),
  let_2_time(Word, Uni, El),
  rm_equals(Word, El, WordNoEl),

  uni_list(WordNoEl, WordNoEl),
  write_str(Word), nl, !, fail.
words_t4(_, 5, _) :- !, fail.
words_t4(List, CurLength, CurWord) :-
  in_list(List, El),
  append(CurWord, [El], CurWord1),
  CurLength1 is CurLength + 1,
  words_t4(List, CurLength1, CurWord1).
words_t4(List) :- words_t4(List, 0, []).

preduct4:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt'),
  read_str(A, _),
  words_t4(A).


words_t5(_, 6, Word) :-
  uni_list(Word, Uni),
  let_2_time(Word, Uni, El1),
  rm_equals(Word, El1, WordNoEl1),

  uni_list(WordNoEl1, UniNoEl1),
  let_2_time(WordNoEl1, UniNoEl1, El2),
  rm_equals(WordNoEl1, El2, WordNoEl2),

  uni_list(WordNoEl2, WordNoEl2),
  write_str(Word), nl, !, fail.
words_t5(_, 6, _) :- !, fail.
words_t5(List, CurLength, CurWord) :-
  in_list(List, El),
  append(CurWord, [El], CurWord1),
  CurLength1 is CurLength + 1,
  words_t5(List, CurLength1, CurWord1).
words_t5(List) :- words_t5(List, 0, []).

preduct5:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt'),
  read_str(A, _),
  words_t5(A).

let_3_time(_, [], _) :- !, fail.
let_3_time(List, [UniH|UniT], El) :-
  count_let_in_list(List, UniH, Count),
  (Count = 3 ->
  (El = UniH, true);
  let_3_time(List, UniT, El)).

words_t6(_, 7, Word) :-
  uni_list(Word, Uni),
  let_2_time(Word, Uni, El1),
  rm_equals(Word, El1, WordNoEl1),

  uni_list(WordNoEl1, UniNoEl1),
  let_3_time(WordNoEl1, UniNoEl1, El2),
  rm_equals(WordNoEl1, El2, WordNoEl2),

  uni_list(WordNoEl2, WordNoEl2),
  write_str(Word), nl, !, fail.
words_t6(_, 7, _) :- !, fail.
words_t6(List, CurLength, CurWord) :-
  in_list(List, El),
  append(CurWord, [El], CurWord1),
  CurLength1 is CurLength + 1,
  words_t6(List, CurLength1, CurWord1).
words_t6(List) :- words_t6(List, 0, []).

preduct6:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt'),
  read_str(A, _),
  words_t6(A).

words_t7(_, 9, Word) :-
  uni_list(Word, Uni),
  let_2_time(Word, Uni, El1),
  rm_equals(Word, El1, WordNoEl1),

  uni_list(WordNoEl1, UniNoEl1),
  let_2_time(WordNoEl1, UniNoEl1, El2),
  rm_equals(WordNoEl1, El2, WordNoEl2),

  uni_list(WordNoEl2, UniNoEl2),
  let_3_time(WordNoEl2, UniNoEl2, El3),
  rm_equals(WordNoEl2, El2, WordNoEl3),

  uni_list(WordNoEl3, WordNoEl3),
  write_str(Word), nl, !, fail.
words_t7(_, 9, _) :- !, fail.
words_t7(List, CurLength, CurWord) :-
  in_list(List, El),
  append(CurWord, [El], CurWord1),
  CurLength1 is CurLength + 1,
  words_t7(List, CurLength1, CurWord1).
words_t7(List) :- words_t7(List, 0, []).

preduct7:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt'),
  read_str(A, _),
  words_t7(A).


words_t8(_, Count, 4, Word) :-
  Count > 2,
  write_str(Word), nl, !, fail.
words_t8(_, _, 4, _) :- !, fail.
words_t8(List, CurCount, CurLength, CurWord) :-
  in_list(List, El),
  (El = 97 ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  append(CurWord, [El], CurWord1),
  CurLength1 is CurLength + 1,
  words_t8(List, CurCount1, CurLength1, CurWord1).
words_t8(List) :- words_t8(List, 0, 0, []).

preduct8:-tell('C:/Users/VirusTM/Documents/Prolog/lab9/conclusion.txt'),
  read_str(A, _),
  words_t8(A).
