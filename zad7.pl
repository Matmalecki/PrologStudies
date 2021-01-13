
%a nth(N,L,X), który jest spełniony, jeżeli X jest N-tym elementem listy L. 

nth(0,[X|L],X).
nth(N,[_|L],X) :- N > 0, N1 is N-1, nth(N1,L,X).

%b ordered(L), który jest spełniony, jeżeli lista L jest posortowana. 

ordered([]).
ordered([_]).
ordered([X, Y|L]) :- X < Y, ordered([Y|L]).

%c mergesort(L1,L2), który jest spełniony, jeżeli lista L2 jest wersją posortowaną listy L1. Predykat ma symulowac algorytm mergesort. 

split([],[],[]).
split([H|T],[H|U],V):-split(T,V,U).

merge([H1|T1],[H2|T2],[H1|T]) :- H1 < H2, !, merge(T1,[H2|T2],T).
merge([H1|T1],[H2|T2],[H2|T]) :- merge([H1|T1],T2,T),!.
merge(X,[],X) :- !.
merge([],X,X).

mergesort([],[]):- !.
mergesort([H],[H]):- !.
mergesort(L,S) :- split(L,LL,LR), mergesort(LL,SLL), mergesort(LR,SLR), merge(SLL,SLR,S).



