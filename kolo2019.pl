
%1

delete(X, [], []) :- !.
delete(X, [X|Xs], Y) :- !, delete(X, Xs, Y).
delete(X, [T|Xs], Y) :- !, delete(X, Xs, Y2), append([T], Y2, Y).

flatten([], []).
flatten([X|L1],L2) :- flatten(X, T1), flatten(L1, T2), append(T1, T2, L2).
flatten(L, [L]).

neighbours(X,Y, [X,Y|_]).
neighbours(X,Y,[_,Z|L]) :- neighbours(X,Y, [Z|L]).

%2

groundterm(T) :-
    T =.. [_|L],
    check_no_variables(L).
    
check_no_variables([]).
check_no_variables([X|L]) :-
    \+var(X), %lub not(var(X))
    check_no_variables(L).

pos(X) :- X > 0.
neg(X) :- X < 0.

take_while(_, [], []).
take_while(P, [X|L1], [X|L2]) :-
    T =..[P, X], call(T), !, take_while(P, L1, L2).
take_while(P, _, L2) :- 
	take_while(P, [], L2).

%take_while(pos, [1,2,0,5,-5,-6,8], L).

%3

leaves(nil, 0).
leaves(drzewo(X,nil,nil), 1).
leaves(drzewo(X,L,P), N) :- leaves(L, N1), leaves(P, N2), N is N1 + N2.

ordered(D) :-
    treeToList(D,L),
    check_sorted(L).

treeToList(nil, []).
treeToList(drzewo(X, L, R), T) :-
    treeToList(L, T1),
    treeToList(R, T2),
    append(T1, [X|T2], T).

check_sorted([]).
check_sorted([_]).
check_sorted([X,Y|L]) :-
    X < Y,
    check_sorted([Y|L]).

% square(drzewo(2, drzewo(3,nil,nil),drzewo(4,nil,nil)), drzewo(4,drzewo(9,nil,nil), drzewo(16,nil,nil))).

square(drzewo(X, nil, nil), drzewo(Y, nil, nil)) :- Y is X*X.
square(drzewo(X, L, nil), drzewo(Y, L1, nil)) :- Y is X * X, square(L, L1).
square(drzewo(X, nil, R), drzewo(Y, nil, R1)) :- Y is X * X, square(R, R1).
square(drzewo(X, L, R), drzewo(Y, L1, R1)) :- Y is X * X, square(L, L1), square(R, R1).