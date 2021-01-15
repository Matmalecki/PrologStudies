member(X,[X|L]).
member(X,[Y|L]) :- member(X,L).


member2(X, [X|_]).                 
member2(X, [L|_]) :- member2(X, L).
member2(X, [_|T]) :- member2(X, T).


suffix(L1,L2) :- append(X, L1, L2).


palindrom([]).
palindrom(L) :- reverse(L,L).

%a L1 zawuera wszystkie elementy listy L mniejsze od X a L2 większe

split(X,[],[],[]).
split(X, [Y|L], [Y|L1], L2) :- Y > X, split(X, L,L1,L2).
split(X, [Y|L], L1,[Y|L2]) :- split(X, L, L1, L2). 

%b L1 zawiera wszystkie elementy X z Listy L spelniajace predykat P, a L2 niespelniajace
%  split1(odd,[2,7,4,8,-1,5],L1,L2).
% L1 = [7,-1,5]
% L2 = [2,4,8]

even(0).
even(X) :- X > 0, X1 is X - 1, odd(X1).
even(X) :- X < 0, X1 is X + 1, odd(X1).

odd(1).
odd(X) :- X > 0, X1 is X - 1, even(X1).
odd(X) :- X < 0, X1 is X + 1, even(X1).


split1(F,[],[],[]).
split1(F, [Y|L], [Y|L1], L2) :- call(F, Y), split1(F, L, L1, L2).--
split1(F, [Y|L], L1, [Y|L2]) :- split1(F, L, L1, L2).

% drzewo(2, drzewo(1,nil,nil), drzewo(4,drzewo(3,nil,nil),drzewo(6,nil,nil)))
/*
        2
    1       4
          3   6
*/
search(drzewo(X,_,_),X).
search(drzewo(X,L,P), Y) :- search(L,Y) ; search(P, Y).


prod(drzewo(X,nil,nil), X).
prod(drzewo(X,nil,P), Y) :- prod(P, X1), Y is X * X1.
prod(drzewo(X,L,nil), Y) :- prod(L, X2), Y is X * X2.
prod(drzewo(X,L,P), Y) :- prod(L, X1), prod(P, X2), Y is X * X1 * X2.


postorder(nil, []).
postorder(drzewo(X,L,P), T) :- postorder(L, L1), postorder(P, L2), append(L1, L2, LW), append(LW,[X], T).
